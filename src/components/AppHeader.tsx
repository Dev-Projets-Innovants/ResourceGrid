
interface AppHeaderProps {
  resourceCount: number;
}

export const AppHeader = ({ resourceCount }: AppHeaderProps) => {
  return (
    <div className="mb-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-4xl lg:text-5xl font-bold text-white mb-2 bg-gradient-to-r from-white to-purple-200 bg-clip-text text-transparent">
            ResourceGrid
          </h1>
          <p className="text-lg text-purple-200">
            Your curated collection of essential resources
          </p>
        </div>
        <div className="hidden lg:flex items-center space-x-4">
          <div className="bg-white/10 backdrop-blur-md rounded-full px-4 py-2 text-white border border-white/20">
            {resourceCount} resources
          </div>
        </div>
      </div>
    </div>
  );
};
