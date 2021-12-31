const main = async () =>{
    const [owner,randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    
    const waveContract = await waveContractFactory.deploy(({
        value:hre.ethers.utils.parseEther("0.1"),
    }));
    await waveContract.deployed();

    console.log("Contract deployed to :",waveContract.address)
    console.log("Contract deployed by:",owner.address)


// get contact balance
let contractBalance = await hre.ethers.provider.getBalance(waveContract.address)
console.log("Contract Balance :",hre.ethers.utils.format(contractBalance))


    let waveCount;
    waveCount = await waveContract.getTotalWaves();

    let waveTxn = await waveContract.wave("Walla first wave")
    await waveTxn.wait();

    // getting contract balance and see what  happened
    contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log(
      "Contract balance:",
      hre.ethers.utils.formatEther(contractBalance)
    );
  



    


    //simulating other people interacting with our smart  contract
    // waveTxn = await waveContract.connect(randomPerson).wave("Wala third wave");
    // await waveTxn.wait()

    waveCount = await waveContract.getTotalWaves()

    // getting number of waves per user
    let wavesPerWaver;
    wavesPerWaver = await waveContract.getWavesPerWaver();

    //getting all waves
    let allWaves = await waveContract.getAllWaves()
    console.log(allWaves)

    


};

const runMain = async  () =>{
    try {
        await  main()
        process.exit(0);

    } catch (error) {
        console.log(error)
        process.exit(1)        
    }
}

runMain()