import { useState, useRef } from 'react';
import { Upload, X, Check, AlertCircle, ImageIcon } from 'lucide-react';

export default function IconUploader() {
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [fileName, setFileName] = useState<string | null>(null);
  const [previewUrl, setPreviewUrl] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setError(null);
    setSuccess(false);
    setFileName(file.name);

    if (file.size > 5 * 1024 * 1024) {
      setError('파일 크기는 5MB를 초과할 수 없습니다.');
      return;
    }

    const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp'];
    if (!allowedTypes.includes(file.type)) {
      setError('이미지 파일만 업로드 가능합니다. (JPG, PNG, WEBP)');
      return;
    }

    const reader = new FileReader();
    reader.onloadend = () => {
      setPreviewUrl(reader.result as string);
    };
    reader.readAsDataURL(file);

    setUploading(true);

    try {
      const formData = new FormData();
      formData.append('file', file);
      formData.append('filename', 'lenten-icon.jpg');

      const response = await fetch('/api/upload-icon', {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('업로드에 실패했습니다.');
      }

      setSuccess(true);

      setTimeout(() => {
        window.location.reload();
      }, 1500);

    } catch (err) {
      console.error('Upload error:', err);
      setError(err instanceof Error ? err.message : '업로드 중 오류가 발생했습니다. 수동으로 업로드해주세요.');
    } finally {
      setUploading(false);
    }
  };

  const clearError = () => {
    setError(null);
    setFileName(null);
    setPreviewUrl(null);
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl shadow-2xl max-w-md w-full p-6">
        <h2 className="text-2xl font-bold text-stone-800 mb-4 flex items-center gap-2">
          <ImageIcon className="w-6 h-6 text-amber-600" />
          앱 아이콘 업로드
        </h2>

        <div className="mb-4 p-4 bg-amber-50 border border-amber-200 rounded-lg">
          <p className="text-sm text-stone-700 mb-2">
            <strong>수동 업로드 방법:</strong>
          </p>
          <ol className="text-sm text-stone-600 space-y-1 ml-4 list-decimal">
            <li>제공하신 이미지를 다운로드</li>
            <li>파일명을 <code className="bg-white px-1 py-0.5 rounded">lenten-icon.jpg</code>로 변경</li>
            <li>프로젝트의 <code className="bg-white px-1 py-0.5 rounded">public</code> 폴더에 복사</li>
            <li>페이지를 새로고침</li>
          </ol>
        </div>

        {previewUrl && (
          <div className="mb-4 flex justify-center">
            <img
              src={previewUrl}
              alt="Preview"
              className="max-w-full h-48 object-contain rounded-lg border-2 border-stone-200"
            />
          </div>
        )}

        <div className="relative">
          <input
            ref={fileInputRef}
            type="file"
            accept="image/jpeg,image/jpg,image/png,image/webp"
            onChange={handleFileChange}
            disabled={uploading}
            className="hidden"
            id="icon-upload"
          />
          <label
            htmlFor="icon-upload"
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
                <span className="text-amber-900">이미지 선택 (최대 5MB)</span>
              </>
            )}
          </label>
        </div>

        {fileName && !success && (
          <div className="mt-3 flex items-center justify-between bg-stone-50 px-4 py-2 rounded-lg">
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
          <div className="mt-3 p-3 bg-red-50 border border-red-200 rounded-lg">
            <p className="text-sm text-red-700">{error}</p>
            <p className="text-xs text-red-600 mt-1">위의 수동 업로드 방법을 이용해주세요.</p>
          </div>
        )}

        {success && (
          <p className="mt-3 text-sm text-green-600 text-center font-medium">
            아이콘이 성공적으로 업로드되었습니다. 페이지를 새로고침합니다...
          </p>
        )}
      </div>
    </div>
  );
}
