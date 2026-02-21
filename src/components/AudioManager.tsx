import { useState, useEffect } from 'react';
import { Music, Trash2, Copy, Check } from 'lucide-react';
import { supabase } from '../lib/supabase';
import AudioUploader from './AudioUploader';

interface AudioFile {
  name: string;
  url: string;
  created_at: string;
  size: number;
}

export default function AudioManager() {
  const [files, setFiles] = useState<AudioFile[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedFolder, setSelectedFolder] = useState('hymns');
  const [copiedUrl, setCopiedUrl] = useState<string | null>(null);

  const folders = [
    { id: 'hymns', label: '찬송가' },
    { id: 'gospel', label: '복음성가' },
    { id: 'uploads', label: '기타 업로드' }
  ];

  useEffect(() => {
    loadFiles();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedFolder]);

  const loadFiles = async () => {
    setLoading(true);
    try {
      const { data, error } = await supabase.storage
        .from('devotional-audio')
        .list(selectedFolder, {
          limit: 100,
          sortBy: { column: 'created_at', order: 'desc' }
        });

      if (error) throw error;

      const filesWithUrls = data.map((file) => {
        const { data: { publicUrl } } = supabase.storage
          .from('devotional-audio')
          .getPublicUrl(`${selectedFolder}/${file.name}`);

        return {
          name: file.name,
          url: publicUrl,
          created_at: file.created_at,
          size: file.metadata?.size || 0
        };
      });

      setFiles(filesWithUrls);
    } catch (error) {
      console.error('Error loading files:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleUploadComplete = () => {
    loadFiles();
  };

  const handleDelete = async (fileName: string) => {
    if (!confirm(`"${fileName}" 파일을 삭제하시겠습니까?`)) return;

    try {
      const { error } = await supabase.storage
        .from('devotional-audio')
        .remove([`${selectedFolder}/${fileName}`]);

      if (error) throw error;

      setFiles(files.filter(f => f.name !== fileName));
    } catch (error) {
      console.error('Error deleting file:', error);
      alert('파일 삭제 중 오류가 발생했습니다.');
    }
  };

  const copyToClipboard = async (url: string) => {
    try {
      await navigator.clipboard.writeText(url);
      setCopiedUrl(url);
      setTimeout(() => setCopiedUrl(null), 2000);
    } catch (error) {
      console.error('Error copying to clipboard:', error);
    }
  };

  const formatFileSize = (bytes: number) => {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
  };

  const formatDate = (dateString: string) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('ko-KR', {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      <div className="bg-white rounded-2xl shadow-xl p-8">
        <div className="flex items-center gap-3 mb-6">
          <Music className="w-8 h-8 text-amber-600" />
          <h1 className="text-3xl font-bold text-amber-900">오디오 파일 관리</h1>
        </div>

        <div className="mb-6 flex gap-2">
          {folders.map((folder) => (
            <button
              key={folder.id}
              onClick={() => setSelectedFolder(folder.id)}
              className={`px-4 py-2 rounded-lg transition-all ${
                selectedFolder === folder.id
                  ? 'bg-amber-600 text-white font-semibold'
                  : 'bg-stone-100 text-stone-700 hover:bg-stone-200'
              }`}
            >
              {folder.label}
            </button>
          ))}
        </div>

        <div className="mb-8">
          <h2 className="text-lg font-semibold text-stone-800 mb-3">새 파일 업로드</h2>
          <AudioUploader
            folder={selectedFolder}
            onUploadComplete={handleUploadComplete}
          />
        </div>

        <div>
          <h2 className="text-lg font-semibold text-stone-800 mb-3">
            업로드된 파일 ({files.length})
          </h2>

          {loading ? (
            <div className="text-center py-8 text-stone-500">파일 목록을 불러오는 중...</div>
          ) : files.length === 0 ? (
            <div className="text-center py-8 text-stone-500">
              업로드된 파일이 없습니다.
            </div>
          ) : (
            <div className="space-y-2">
              {files.map((file) => (
                <div
                  key={file.name}
                  className="flex items-center justify-between p-4 bg-stone-50 rounded-lg hover:bg-stone-100 transition-colors"
                >
                  <div className="flex-1 min-w-0 mr-4">
                    <p className="font-medium text-stone-800 truncate">{file.name}</p>
                    <div className="flex gap-4 mt-1 text-sm text-stone-500">
                      <span>{formatFileSize(file.size)}</span>
                      <span>{formatDate(file.created_at)}</span>
                    </div>
                  </div>

                  <div className="flex gap-2">
                    <button
                      onClick={() => copyToClipboard(file.url)}
                      className="p-2 hover:bg-amber-100 rounded-lg transition-colors group"
                      title="URL 복사"
                    >
                      {copiedUrl === file.url ? (
                        <Check className="w-5 h-5 text-green-600" />
                      ) : (
                        <Copy className="w-5 h-5 text-stone-600 group-hover:text-amber-600" />
                      )}
                    </button>

                    <button
                      onClick={() => handleDelete(file.name)}
                      className="p-2 hover:bg-red-100 rounded-lg transition-colors group"
                      title="삭제"
                    >
                      <Trash2 className="w-5 h-5 text-stone-600 group-hover:text-red-600" />
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        <div className="mt-8 p-4 bg-amber-50 rounded-lg border border-amber-200">
          <h3 className="font-semibold text-amber-900 mb-2">사용 방법</h3>
          <ol className="text-sm text-amber-800 space-y-1 list-decimal list-inside">
            <li>폴더를 선택하고 오디오 파일을 업로드합니다.</li>
            <li>업로드된 파일의 URL을 복사 버튼으로 복사합니다.</li>
            <li>복사한 URL을 데이터베이스의 audio_url 필드에 입력합니다.</li>
            <li>더 이상 필요없는 파일은 삭제 버튼으로 제거합니다.</li>
          </ol>
        </div>
      </div>
    </div>
  );
}
