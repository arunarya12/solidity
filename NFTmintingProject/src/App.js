import logo from './logo.svg'
import './App.css'
import Main from './Main'

function App() {
  return (
    <div className="App">
      <h1>NFT Minting and Withdraw</h1>
      <div className='App-header'>
        <h2>Read me first</h2>
        <h3>
          1) Switch to avalanche network. <br />
          2) Minting a nft costs one avax,
          <br /> so make sure you have at <br />
          least one avax in your wallet. <br />
          3) You can only withdraw if you <br />
          have some nft minted.
        </h3>
        <Main />
      </div>
    </div>
  )
}

export default App
