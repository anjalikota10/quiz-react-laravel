import React from "react";

const demo= () => {
  return (
    <div className="flex flex-col h-screen bg-gray-100">
      
      {/* Header */}
      <header className="flex justify-between items-center p-4 bg-white shadow-md">
        <div className="flex items-center text-lg font-bold text-gray-800">
          <img src="img/new-logo1.png" alt="Samajik Tea" className="h-12 w-12 mr-2" />
          Samajik Tea
        </div>
        <div>
          <button className="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600">
            Login
          </button>
        </div>
      </header>

      {/* Main Layout */}
      <div className="flex flex-1">
        
        {/* Sidebar */}
        <aside className="w-64 bg-gray-800 text-white p-5">
          <ul>
            <li className="mb-4">
              <a href="backend_index.php" className="hover:text-yellow-400">Dashboard</a>
            </li>
            <li>
              <a href="backend_table.php" className="hover:text-yellow-400">Contact details</a>
            </li>
          </ul>
        </aside>
        
        {/* Main Content */}
        <main className="flex flex-col items-center justify-center text-center w-full">
          <img src="img/new-logo1.png" alt="Dashboard Image" className="w-40 h-40 mb-4" />
          <h2 className="text-2xl font-semibold">Welcome to the Dashboard</h2>
          <p className="text-gray-600">This is your main content area.</p>
        </main>
      </div>
      
      {/* Footer */}
      <footer className="text-center p-4 bg-white shadow-md text-gray-600">
        &copy; 2025 Your Company. All Rights Reserved.
      </footer>
    </div>
  );
};

export default demo;
