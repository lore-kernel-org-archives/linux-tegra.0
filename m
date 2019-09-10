From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next v2 1/2] net: stmmac: Only enable enhanced
 addressing mode when needed
Date: Tue, 10 Sep 2019 08:32:38 +0000
Message-ID: <BN8PR12MB3266850280A788D41C277B08D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <BN8PR12MB3266B232D3B895A4A4368191D3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190909191127.GA23804@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190909191127.GA23804@mithrandir>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Sep/09/2019, 20:11:27 (UTC+00:00)

> On Mon, Sep 09, 2019 at 04:07:04PM +0000, Jose Abreu wrote:
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Date: Sep/09/2019, 16:25:45 (UTC+00:00)
> >=20
> > > @@ -92,6 +92,7 @@ struct stmmac_dma_cfg {
> > >  	int fixed_burst;
> > >  	int mixed_burst;
> > >  	bool aal;
> > > +	bool eame;
> >=20
> > bools should not be used in struct's, please change to int.
>=20
> Huh? Since when? "aal" right above it is also bool. Can you provide a
> specific rationale for why we shouldn't use bool in structs?

Please see https://lkml.org/lkml/2017/11/21/384.

---
Thanks,
Jose=20
Miguel Abreu
