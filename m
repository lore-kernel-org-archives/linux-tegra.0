From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Wed, 24 Jul 2019 10:04:07 +0000
Message-ID: <BYAPR12MB3269C5766F553438ECFF2C9BD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190724095310.GA12991@apalos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724095310.GA12991@apalos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: David Miller <davem@davemloft.net>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "lists@bofh.nu" <lists@bofh.nu>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Jul/24/2019, 10:53:10 (UTC+00:00)

> Jose,=20
> > From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Date: Jul/24/2019, 09:54:27 (UTC+00:00)
> >=20
> > > Hi David,=20
> > >=20
> > > > From: Jon Hunter <jonathanh@nvidia.com>
> > > > Date: Tue, 23 Jul 2019 13:09:00 +0100
> > > >=20
> > > > > Setting "iommu.passthrough=3D1" works for me. However, I am not s=
ure where
> > > > > to go from here, so any ideas you have would be great.
> > > >=20
> > > > Then definitely we are accessing outside of a valid IOMMU mapping d=
ue
> > > > to the page pool support changes.
> > >=20
> > > Yes. On the netsec driver i did test with and without SMMU to make su=
re i am not
> > > breaking anything.
> > > Since we map the whole page on the API i think some offset on the dri=
ver causes
> > > that. In any case i'll have another look on page_pool to make sure we=
 are not
> > > missing anything.=20
> >=20
> > Ilias, can it be due to this:
> >=20
> > stmmac_main.c:
> > 	pp_params.order =3D DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> >=20
> > page_pool.c:
> > 	dma =3D dma_map_page_attrs(pool->p.dev, page, 0,
> > 				 (PAGE_SIZE << pool->p.order),
> > 				 pool->p.dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> >=20
> > "order", will be at least 1 and then mapping the page can cause overlap=
=20
> > ?
>=20
> well the API is calling the map with the correct page, page offset (0) an=
d size
> right? I don't see any overlapping here. Aren't we mapping what we alloca=
te?
>=20
> Why do you need higher order pages? Jumbo frames? Can we do a quick test =
with
> the order being 0?

Yes, it's for Jumbo frames that can be as large as 16k.

From Jon logs it can be seen that buffers are 8k but frames are 1500 max=20
so it is using order =3D 1.

Jon, I was able to replicate (at some level) your setup:

# dmesg | grep -i arm-smmu
[    1.337322] arm-smmu 70040000.iommu: probing hardware=20
configuration...
[    1.337330] arm-smmu 70040000.iommu: SMMUv2 with:
[    1.337338] arm-smmu 70040000.iommu:         stage 1 translation
[    1.337346] arm-smmu 70040000.iommu:         stage 2 translation
[    1.337354] arm-smmu 70040000.iommu:         nested translation
[    1.337363] arm-smmu 70040000.iommu:         stream matching with 128=20
register groups
[    1.337374] arm-smmu 70040000.iommu:         1 context banks (0=20
stage-2 only)
[    1.337383] arm-smmu 70040000.iommu:         Supported page sizes:=20
0x61311000
[    1.337393] arm-smmu 70040000.iommu:         Stage-1: 48-bit VA ->=20
48-bit IPA
[    1.337402] arm-smmu 70040000.iommu:         Stage-2: 48-bit IPA ->=20
48-bit PA

# dmesg | grep -i stmmac
[    1.344106] stmmaceth 70000000.ethernet: Adding to iommu group 0
[    1.344233] stmmaceth 70000000.ethernet: no reset control found
[    1.348276] stmmaceth 70000000.ethernet: User ID: 0x10, Synopsys ID:=20
0x51
[    1.348285] stmmaceth 70000000.ethernet:     DWMAC4/5
[    1.348293] stmmaceth 70000000.ethernet: DMA HW capability register=20
supported
[    1.348302] stmmaceth 70000000.ethernet: RX Checksum Offload Engine=20
supported
[    1.348311] stmmaceth 70000000.ethernet: TX Checksum insertion=20
supported
[    1.348320] stmmaceth 70000000.ethernet: TSO supported
[    1.348328] stmmaceth 70000000.ethernet: Enable RX Mitigation via HW=20
Watchdog Timer
[    1.348337] stmmaceth 70000000.ethernet: TSO feature enabled
[    1.348409] libphy: stmmac: probed
[ 4159.140990] stmmaceth 70000000.ethernet eth0: PHY [stmmac-0:01]=20
driver [Generic PHY]
[ 4159.141005] stmmaceth 70000000.ethernet eth0: phy: setting supported=20
00,00000000,000062ff advertising 00,00000000,000062ff
[ 4159.142359] stmmaceth 70000000.ethernet eth0: No Safety Features=20
support found
[ 4159.142369] stmmaceth 70000000.ethernet eth0: IEEE 1588-2008 Advanced=20
Timestamp supported
[ 4159.142429] stmmaceth 70000000.ethernet eth0: registered PTP clock
[ 4159.142439] stmmaceth 70000000.ethernet eth0: configuring for=20
phy/gmii link mode
[ 4159.142452] stmmaceth 70000000.ethernet eth0: phylink_mac_config:=20
mode=3Dphy/gmii/Unknown/Unknown adv=3D00,00000000,000062ff pause=3D10 link=
=3D0=20
an=3D1
[ 4159.142466] stmmaceth 70000000.ethernet eth0: phy link up=20
gmii/1Gbps/Full
[ 4159.142475] stmmaceth 70000000.ethernet eth0: phylink_mac_config:=20
mode=3Dphy/gmii/1Gbps/Full adv=3D00,00000000,00000000 pause=3D0f link=3D1 a=
n=3D0
[ 4159.142481] stmmaceth 70000000.ethernet eth0: Link is Up - 1Gbps/Full=20
- flow control rx/tx

The only missing point is the NFS boot that I can't replicate with this=20
setup. But I did some sanity checks:

Remote Enpoint:
# dd if=3D/dev/urandom of=3Doutput.dat bs=3D128M count=3D1
# nc -c 192.168.0.2 1234 < output.dat
# md5sum output.dat=20
fde9e0818281836e4fc0edfede2b8762  output.dat

DUT:
# nc -l -c -p 1234 > output.dat
# md5sum output.dat=20
fde9e0818281836e4fc0edfede2b8762  output.dat

---
Thanks,
Jose Miguel Abreu
