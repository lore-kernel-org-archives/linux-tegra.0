From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Wed, 24 Jul 2019 12:58:15 +0100
Message-ID: <a07c3480-af03-a61b-4e9c-d9ceb29ce622@nvidia.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190724095310.GA12991@apalos>
 <BYAPR12MB3269C5766F553438ECFF2C9BD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <33de62bf-2f8a-bf00-9260-418b12bed24c@nvidia.com>
 <BYAPR12MB32696F0A2BFDF69F31C4311CD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB32696F0A2BFDF69F31C4311CD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: David Miller <davem@davemloft.net>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "lists@bofh.nu" <lists@bofh.nu>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


On 24/07/2019 12:34, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/24/2019, 12:10:47 (UTC+00:00)
> 
>>
>> On 24/07/2019 11:04, Jose Abreu wrote:
>>
>> ...
>>
>>> Jon, I was able to replicate (at some level) your setup:
>>>
>>> # dmesg | grep -i arm-smmu
>>> [    1.337322] arm-smmu 70040000.iommu: probing hardware 
>>> configuration...
>>> [    1.337330] arm-smmu 70040000.iommu: SMMUv2 with:
>>> [    1.337338] arm-smmu 70040000.iommu:         stage 1 translation
>>> [    1.337346] arm-smmu 70040000.iommu:         stage 2 translation
>>> [    1.337354] arm-smmu 70040000.iommu:         nested translation
>>> [    1.337363] arm-smmu 70040000.iommu:         stream matching with 128 
>>> register groups
>>> [    1.337374] arm-smmu 70040000.iommu:         1 context banks (0 
>>> stage-2 only)
>>> [    1.337383] arm-smmu 70040000.iommu:         Supported page sizes: 
>>> 0x61311000
>>> [    1.337393] arm-smmu 70040000.iommu:         Stage-1: 48-bit VA -> 
>>> 48-bit IPA
>>> [    1.337402] arm-smmu 70040000.iommu:         Stage-2: 48-bit IPA -> 
>>> 48-bit PA
>>>
>>> # dmesg | grep -i stmmac
>>> [    1.344106] stmmaceth 70000000.ethernet: Adding to iommu group 0
>>> [    1.344233] stmmaceth 70000000.ethernet: no reset control found
>>> [    1.348276] stmmaceth 70000000.ethernet: User ID: 0x10, Synopsys ID: 
>>> 0x51
>>> [    1.348285] stmmaceth 70000000.ethernet:     DWMAC4/5
>>> [    1.348293] stmmaceth 70000000.ethernet: DMA HW capability register 
>>> supported
>>> [    1.348302] stmmaceth 70000000.ethernet: RX Checksum Offload Engine 
>>> supported
>>> [    1.348311] stmmaceth 70000000.ethernet: TX Checksum insertion 
>>> supported
>>> [    1.348320] stmmaceth 70000000.ethernet: TSO supported
>>> [    1.348328] stmmaceth 70000000.ethernet: Enable RX Mitigation via HW 
>>> Watchdog Timer
>>> [    1.348337] stmmaceth 70000000.ethernet: TSO feature enabled
>>> [    1.348409] libphy: stmmac: probed
>>> [ 4159.140990] stmmaceth 70000000.ethernet eth0: PHY [stmmac-0:01] 
>>> driver [Generic PHY]
>>> [ 4159.141005] stmmaceth 70000000.ethernet eth0: phy: setting supported 
>>> 00,00000000,000062ff advertising 00,00000000,000062ff
>>> [ 4159.142359] stmmaceth 70000000.ethernet eth0: No Safety Features 
>>> support found
>>> [ 4159.142369] stmmaceth 70000000.ethernet eth0: IEEE 1588-2008 Advanced 
>>> Timestamp supported
>>> [ 4159.142429] stmmaceth 70000000.ethernet eth0: registered PTP clock
>>> [ 4159.142439] stmmaceth 70000000.ethernet eth0: configuring for 
>>> phy/gmii link mode
>>> [ 4159.142452] stmmaceth 70000000.ethernet eth0: phylink_mac_config: 
>>> mode=phy/gmii/Unknown/Unknown adv=00,00000000,000062ff pause=10 link=0 
>>> an=1
>>> [ 4159.142466] stmmaceth 70000000.ethernet eth0: phy link up 
>>> gmii/1Gbps/Full
>>> [ 4159.142475] stmmaceth 70000000.ethernet eth0: phylink_mac_config: 
>>> mode=phy/gmii/1Gbps/Full adv=00,00000000,00000000 pause=0f link=1 an=0
>>> [ 4159.142481] stmmaceth 70000000.ethernet eth0: Link is Up - 1Gbps/Full 
>>> - flow control rx/tx
>>>
>>> The only missing point is the NFS boot that I can't replicate with this 
>>> setup. But I did some sanity checks:
>>>
>>> Remote Enpoint:
>>> # dd if=/dev/urandom of=output.dat bs=128M count=1
>>> # nc -c 192.168.0.2 1234 < output.dat
>>> # md5sum output.dat 
>>> fde9e0818281836e4fc0edfede2b8762  output.dat
>>>
>>> DUT:
>>> # nc -l -c -p 1234 > output.dat
>>> # md5sum output.dat 
>>> fde9e0818281836e4fc0edfede2b8762  output.dat
>>
>> On my setup, if I do not use NFS to mount the rootfs, but then manually
>> mount the NFS share after booting, I do not see any problems reading or
>> writing to files on the share. So I am not sure if it is some sort of
>> race that is occurring when mounting the NFS share on boot. It is 100%
>> reproducible when using NFS for the root file-system.
> 
> I don't understand how can there be corruption then unless the IP AXI 
> parameters are misconfigured which can lead to sporadic undefined 
> behavior.
> 
> These prints from your logs:
> [   14.579392] Run /init as init process
> /init: line 58: chmod: command not found
> [ 10:22:46 ] L4T-INITRD Build DATE: Mon Jul 22 10:22:46 UTC 2019
> [ 10:22:46 ] Root device found: nfs
> [ 10:22:46 ] Ethernet interfaces: eth0
> [ 10:22:46 ] IP Address: 10.21.140.41
> 
> Where are they coming from ? Do you have any extra init script ?

By default there is an initial ramdisk that is loaded first and then the
rootfs is mounted over NFS. However, even if I remove this ramdisk and
directly mount the rootfs via NFS without it the problem persists. So I
don't see any issue with the ramdisk and whats more is we have been
using this for a long long time. Nothing has changed here.

Jon

-- 
nvpublic
