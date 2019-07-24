From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Wed, 24 Jul 2019 09:43:29 +0000
Message-ID: <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190724085427.GA10736@apalos>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Miller <davem@davemloft.net>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "lists@bofh.nu" <lists@bofh.nu>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infra
List-Id: linux-tegra@vger.kernel.org

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Jul/24/2019, 09:54:27 (UTC+00:00)

> Hi David,=20
>=20
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Tue, 23 Jul 2019 13:09:00 +0100
> >=20
> > > Setting "iommu.passthrough=3D1" works for me. However, I am not sure =
where
> > > to go from here, so any ideas you have would be great.
> >=20
> > Then definitely we are accessing outside of a valid IOMMU mapping due
> > to the page pool support changes.
>=20
> Yes. On the netsec driver i did test with and without SMMU to make sure i=
 am not
> breaking anything.
> Since we map the whole page on the API i think some offset on the driver =
causes
> that. In any case i'll have another look on page_pool to make sure we are=
 not
> missing anything.=20

Ilias, can it be due to this:

stmmac_main.c:
	pp_params.order =3D DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);

page_pool.c:
	dma =3D dma_map_page_attrs(pool->p.dev, page, 0,
				 (PAGE_SIZE << pool->p.order),
				 pool->p.dma_dir, DMA_ATTR_SKIP_CPU_SYNC);

"order", will be at least 1 and then mapping the page can cause overlap=20
?

---
Thanks,
Jose Miguel Abreu
