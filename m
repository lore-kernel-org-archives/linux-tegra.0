From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH] net: stmmac: Fix page pool size
Date: Mon, 23 Sep 2019 08:09:27 +0000
Message-ID: <BN8PR12MB32664D3109952EF5303464EFD3850@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190920170127.22850-1-thierry.reding@gmail.com>
 <20190922153132.0c328fe7@cakuba.netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190922153132.0c328fe7@cakuba.netronome.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jakub Kicinski <jakub.kicinski@netronome.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sep/22/2019, 23:31:32 (UTC+00:00)

> On Fri, 20 Sep 2019 19:01:27 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The size of individual pages in the page pool in given by an order. The
> > order is the binary logarithm of the number of pages that make up one o=
f
> > the pages in the pool. However, the driver currently passes the number
> > of pages rather than the order, so it ends up wasting quite a bit of
> > memory.
> >=20
> > Fix this by taking the binary logarithm and passing that in the order
> > field.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Since this is a fix could we get a Fixes tag pointing to the commit
> which introduced the regression?

This would be:

2af6106ae949 ("net: stmmac: Introducing support for Page Pool")

Can you please resubmit Thierry ?

---
Thanks,
Jose Miguel Abreu
