From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next v2 2/2] net: stmmac: Support enhanced addressing
 mode for DWMAC 4.10
Date: Tue, 10 Sep 2019 08:35:05 +0000
Message-ID: <BN8PR12MB3266F021DFC2C61CDEC83418D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <20190909152546.383-2-thierry.reding@gmail.com>
 <BN8PR12MB3266AAC6FF4819EC25CB087BD3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190909191329.GB23804@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190909191329.GB23804@mithrandir>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Sep/09/2019, 20:13:29 (UTC+00:00)

> On Mon, Sep 09, 2019 at 04:05:52PM +0000, Jose Abreu wrote:
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Date: Sep/09/2019, 16:25:46 (UTC+00:00)
> >=20
> > > @@ -79,6 +79,10 @@ static void dwmac4_dma_init_rx_chan(void __iomem *=
ioaddr,
> > >  	value =3D value | (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
> > >  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(chan));
> > > =20
> > > +	if (dma_cfg->eame)
> >=20
> > There is no need for this check. If EAME is not enabled then upper 32=20
> > bits will be zero.
>=20
> The idea here was to potentially guard against this register not being
> available on some revisions. Having the check here would avoid access to
> the register if the device doesn't support enhanced addressing.

I see your point but I don't think there will be any problems unless you=20
have some strange system that doesn't handle the write accesses to=20
unimplemented features properly ...

---
Thanks,
Jose Miguel Abreu
