From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next v2 2/2] net: stmmac: Support enhanced addressing
 mode for DWMAC 4.10
Date: Mon, 9 Sep 2019 16:05:52 +0000
Message-ID: <BN8PR12MB3266AAC6FF4819EC25CB087BD3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <20190909152546.383-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190909152546.383-2-thierry.reding@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Sep/09/2019, 16:25:46 (UTC+00:00)

> @@ -79,6 +79,10 @@ static void dwmac4_dma_init_rx_chan(void __iomem *ioad=
dr,
>  	value =3D value | (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
>  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(chan));
> =20
> +	if (dma_cfg->eame)

There is no need for this check. If EAME is not enabled then upper 32=20
bits will be zero.

> +		writel(upper_32_bits(dma_rx_phy),
> +		       ioaddr + DMA_CHAN_RX_BASE_ADDR_HI(chan));
> +
>  	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_CHAN_RX_BASE_ADDR(chan))=
;
>  }

> @@ -97,6 +101,10 @@ static void dwmac4_dma_init_tx_chan(void __iomem *ioa=
ddr,
> =20
>  	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(chan));
> =20
> +	if (dma_cfg->eame)

Same here.

> +		writel(upper_32_bits(dma_tx_phy),
> +		       ioaddr + DMA_CHAN_TX_BASE_ADDR_HI(chan));
> +
>  	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_CHAN_TX_BASE_ADDR(chan))=
;
>  }

Also, please provide a cover letter in next submission.

---
Thanks,
Jose Miguel Abreu
