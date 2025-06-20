
interface LoadingStateProps {
  message?: string;
}

export const LoadingState = ({ message = "Loading resources..." }: LoadingStateProps) => {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center">
      <div className="text-white text-xl">{message}</div>
    </div>
  );
};
