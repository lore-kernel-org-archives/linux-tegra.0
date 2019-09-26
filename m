From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Thu, 26 Sep 2019 08:22:25 +0000
Message-ID: <BN8PR12MB32669DDC64861CE11CA66474D3860@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
 <20190924.214508.1949579574079200671.davem@davemloft.net>
 <BN8PR12MB3266F851B071629898BB775AD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190925.133353.1445361137776125638.davem@davemloft.net>
 <BN8PR12MB3266A2F1F5F3F18F3A80BFC1D3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BN8PR12MB32667F9FDDB2161E9B63C1AFD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <9f0e2386-c4b1-52b0-6881-e72093eb1b05@gmail.com>
 <20190925224620.GA8115@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190925224620.GA8115@mithrandir>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, David Miller <davem@davemloft.net>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "bbiswas@nvidia.com" <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Sep/25/2019, 23:46:20 (UTC+00:00)

> On Wed, Sep 25, 2019 at 10:31:13AM -0700, Florian Fainelli wrote:
> > The way I would approach it (as done in bcmgenet.c) is that if the
> > platform both has CONFIG_PHYS_ADDR_T_64BIT=3Dy and supports > 32-bits
> > addresses, then you write the upper 32-bits otherwise, you do not. Give=
n
> > you indicate that the registers are safe to write regardless, then mayb=
e
> > just the check on CONFIG_PHYS_ADDR_T_64BIT is enough for your case. The
> > rationale in my case is that register writes to on-chip descriptors are
> > fairly expensive (~200ns per operation) and get in the hot-path.
> >=20
> > The CONFIG_PHYS_ADDR_T_64BIT check addresses both native 64-bit
> > platforms (e.g.: ARM64) and those that do support LPAE (ARM LPAE for
> > instance).
>=20
> I think we actually want CONFIG_DMA_ADDR_T_64BIT here because we're
> dealing with addresses returned from the DMA API here.
>=20
> I can add an additional condition for the upper 32-bit register writes,
> something like:
>=20
> 	if (IS_ENABLED(CONFIG_DMA_ADDR_T_64BIT) && priv->dma_cfg->eame)
> 		...
>=20
> The compiler should be able to eliminate that as dead code on platforms
> that don't support 64-bit DMA addresses, but the code should still be
> compiler regardless of the setting, thus increasing the compile
> coverage.

I'm fine with this. Some notes:
a) Do not try to enable dma_cfg->eame if CONFIG_DMA_ADDR_T_64BIT is not=20
enabled;
b) You can even add a likely() around priv->dma_cfg->eame check because=20
if a given SoC supports 64 bit addressing then its highly probable that=20
the IP will also support EAME.

---
Thanks,
Jose Miguel Abreu
