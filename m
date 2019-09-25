From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Wed, 25 Sep 2019 11:41:04 +0000
Message-ID: <BN8PR12MB3266A2F1F5F3F18F3A80BFC1D3870@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
        <20190924.214508.1949579574079200671.davem@davemloft.net>
        <BN8PR12MB3266F851B071629898BB775AD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190925.133353.1445361137776125638.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190925.133353.1445361137776125638.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "bbiswas@nvidia.com" <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Sep/25/2019, 12:33:53 (UTC+00:00)

> From: Jose Abreu <Jose.Abreu@synopsys.com>
> Date: Wed, 25 Sep 2019 10:44:53 +0000
>=20
> > From: David Miller <davem@davemloft.net>
> > Date: Sep/24/2019, 20:45:08 (UTC+00:00)
> >=20
> >> From: Thierry Reding <thierry.reding@gmail.com>
> >> Date: Fri, 20 Sep 2019 19:00:34 +0200
> >>=20
> >> Also, you're now writing to the high 32-bits unconditionally, even whe=
n
> >> it will always be zero because of 32-bit addressing.  That looks like
> >> a step backwards to me.
> >=20
> > Don't agree. As per previous discussions and as per my IP knowledge, if=
=20
> > EAME is not enabled / not supported the register can still be written.=
=20
> > This is not fast path and will not impact any remaining operation. Can=
=20
> > you please explain what exactly is the concern about this ?
> >=20
> > Anyway, this is an important feature for performance so I hope Thierry=
=20
> > re-submits this once -next opens and addressing the review comments.
>=20
> Perhaps I misunderstand the context, isn't this code writing the
> descriptors for every packet?

No, its just setting up the base address for the descriptors which is=20
done in open(). The one that's in the fast path is the tail address,=20
which is always the lower 32 bits.

---
Thanks,
Jose Miguel Abreu
