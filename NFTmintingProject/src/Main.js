import abi from './blockchain/nftContractABI.json'
import { ethers, BigNumber } from 'ethers'
import { useEffect, useState } from 'react'
const contractAddress = '0x642D62Db7C2A8Ff59D218ED849DE03e0bF80E8A0'

function Main() {
  const [accounts, setAccounts] = useState([])
  async function connectAccount() {
    console.log('sdads')
    if (window.ethereum) {
      const accounts = await window.ethereum.request({
        method: 'eth_requestAccounts',
      })
      setAccounts(accounts)
    }
  }

  useEffect(() => {
    connectAccount()
  }, [])

  async function mintToken() {
    let uri = 'https:// test'
    let value = '1000000000000000000'
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      const signer = provider.getSigner()
      const contract = new ethers.Contract(contractAddress, abi, signer)
      try {
        const response = await contract.mintNFT(uri, {
          value: value,
        })
        console.log(response)
      } catch (error) {
        console.log(error)
      }
    }
  }

  async function withdraw() {
    if (window.ethereum) {
      const provider = new ethers.providers.Web3Provider(window.ethereum)
      const signer = provider.getSigner()
      const contract = new ethers.Contract(contractAddress, abi, signer)
      try {
        const response = await contract.withdraw()
        console.log(response)
      } catch (error) {
        console.log(error)
      }
    }
  }

  return (
    <div>
      {accounts.length && (
        <div>
          <div>
            <button
              className="btn btn-primary"
              size="lg"
              style={{ color: 'green', padding: '1rem 1rem' }}
              onClick={mintToken}
            >
              Mint
            </button>
          </div>
          <div>
            <h1>
              <button
                className="btn btn-primary"
                style={{ color: 'red', padding: '1rem 1rem' }}
                onClick={withdraw}
              >
                Withdraw
              </button>
            </h1>
          </div>
        </div>
      )}
    </div>
  )
}
export default Main
