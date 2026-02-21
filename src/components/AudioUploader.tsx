import { useState, useRef } from 'react';
import { Upload, X, Check, AlertCircle } from 'lucide-react';
import { supabase } from '../lib/supabase';

interface AudioUploaderProps {
  onUploadComplete: (audioUrl: string) => void;
  folder?: string;
  accept?: string;
}

export default function AudioUploader({
  onUploadComplete,
  folder = 'uploads',
  accept = 'audio/*'
}: AudioUploaderProps) {
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [fileName, setFileName] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setError(null);
    setSuccess(false);
    setFileName(file.name);

    if (file.size > 10 * 1024 * 1024) {
      setError('파일 크기는 10MB를 초과할 수 없습니다.');
      return;
    }

    const allowedTypes = ['audio/mpeg', 'audio/mp3', 'audio/wav', 'audio/ogg', 'audio/m4a'];
    if (!allowedTypes.includes(file.type) && !file.name.endsWith('.mp3')) {
      setError('오디오 파일만 업로드 가능합니다. (MP3, WAV, OGG, M4A)');
      return;
    }

    setUploading(true);

    try {
      const fileExt = file.name.split('.').pop();
      const fileName = `${Date.now()}-${Math.random().toString(36).substring(7)}.${fileExt}`;
      const filePath = `${folder}/${fileName}`;

      const { error: uploadError } = await supabase.storage
        .from('devotional-audio')
        .upload(filePath, file, {
          cacheControl: '3600',
          upsert: false
        });

      if (uploadError) {
        throw uploadError;
      }

      const { data: { publicUrl } } = supabase.storage
        .from('devotional-audio')
        .getPublicUrl(filePath);

      setSuccess(true);
      onUploadComplete(publicUrl);

      setTimeout(() => {
        setSuccess(false);
        setFileName(null);
        if (fileInputRef.current) {
          fileInputRef.current.value = '';
        }
      }, 2000);

    } catch (err) {
      console.error('Upload error:', err);
      setError(err instanceof Error ? err.message : '업로드 중 오류가 발생했습니다.');
    } finally {
      setUploading(false);
    }
  };

  const clearError = () => {
    setError(null);
    setFileName(null);
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  };

  return (
    <div className="w-full">
      <div className="relative">
        <input
          ref={fileInputRef}
          type="file"
          accept={accept}
          onChange={handleFileChange}
          disabled={uploading}
          className="hidden"
          id="audio-upload"
        />
        <label
          htmlFor="audio-upload"
          className={`flex items-center justify-center gap-3 px-6 py-4 border-2 border-dashed rounded-lg cursor-pointer transition-all ${
            uploading
              ? 'bg-stone-100 border-stone-300 cursor-not-allowed'
              : success
              ? 'bg-green-50 border-green-400 hover:bg-green-100'
              : error
              ? 'bg-red-50 border-red-400 hover:bg-red-100'
              : 'bg-white border-amber-300 hover:bg-amber-50 hover:border-amber-400'
          }`}
        >
          {uploading ? (
            <>
              <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-amber-600"></div>
              <span className="text-stone-600">업로드 중...</span>
            </>
          ) : success ? (
            <>
              <Check className="w-5 h-5 text-green-600" />
              <span className="text-green-700 font-medium">업로드 완료!</span>
            </>
          ) : error ? (
            <>
              <AlertCircle className="w-5 h-5 text-red-600" />
              <span className="text-red-700">오류 발생</span>
            </>
          ) : (
            <>
              <Upload className="w-5 h-5 text-amber-600" />
              <span className="text-amber-900">오디오 파일 선택 (최대 10MB)</span>
            </>
          )}
        </label>
      </div>

      {fileName && !success && (
        <div className="mt-2 flex items-center justify-between bg-stone-50 px-4 py-2 rounded-lg">
          <span className="text-sm text-stone-600 truncate">{fileName}</span>
          {error && (
            <button
              onClick={clearError}
              className="ml-2 p-1 hover:bg-stone-200 rounded transition-colors"
            >
              <X className="w-4 h-4 text-stone-600" />
            </button>
          )}
        </div>
      )}

      {error && (
        <p className="mt-2 text-sm text-red-600">{error}</p>
      )}

      {success && (
        <p className="mt-2 text-sm text-green-600">
          파일이 성공적으로 업로드되었습니다.
        </p>
      )}
    </div>
  );
}
