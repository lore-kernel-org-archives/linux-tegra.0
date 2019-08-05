From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v2 3/3] soc/tegra: regulators: Add regulators coupler for
 Tegra30
Date: Mon, 5 Aug 2019 11:33:25 +0300
Message-ID: <20190805083325.GE3883@pdeschrijver-desktop.Nvidia.com>
References: <20190725151832.9802-1-digetx@gmail.com>
 <20190725151832.9802-4-digetx@gmail.com>
 <20190802140512.GD3883@pdeschrijver-desktop.Nvidia.com>
 <c537fbea-5884-03db-305f-6ab3d553f7ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c537fbea-5884-03db-305f-6ab3d553f7ab@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 02, 2019 at 05:39:23PM +0300, Dmitry Osipenko wrote:
> 02.08.2019 17:05, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jul 25, 2019 at 06:18:32PM +0300, Dmitry Osipenko wrote:
> >> Add regulators coupler for Tegra30 SoCs that performs voltage balancin=
g
> >> of a coupled regulators and thus provides voltage scaling functionalit=
y.
> >>
> >> There are 2 coupled regulators on all Tegra30 SoCs: CORE and CPU. The
> >> coupled regulator voltages shall be in a range of 300mV from each othe=
r
> >> and CORE voltage shall be higher than the CPU by N mV, where N depends
> >> on the CPU voltage.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/soc/tegra/Kconfig              |   4 +
> >>  drivers/soc/tegra/Makefile             |   1 +
> >>  drivers/soc/tegra/regulators-tegra30.c | 316 ++++++++++++++++++++++++=
+
> >>  3 files changed, 321 insertions(+)
> >>  create mode 100644 drivers/soc/tegra/regulators-tegra30.c
> >>
> > ...
> >=20
> >> +
> >> +static int tegra30_core_cpu_limit(int cpu_uV)
> >> +{
> >> +	if (cpu_uV < 800000)
> >> +		return 950000;
> >> +
> >> +	if (cpu_uV < 900000)
> >> +		return 1000000;
> >> +
> >> +	if (cpu_uV < 1000000)
> >> +		return 1100000;
> >> +
> >> +	if (cpu_uV < 1100000)
> >> +		return 1200000;
> >> +
> >> +	if (cpu_uV < 1250000) {
> >> +		switch (tegra_sku_info.cpu_speedo_id) {
> >> +		case 0 ... 1:
> > Aren't we supposed to add /* fall through */ here now?
>=20
> There is no compiler warning if there is nothing in-between of the
> case-switches, so annotation isn't really necessary here. Of course it
> is possible to add an explicit annotation just to make clear the
> fall-through intention.
>=20

Ah. Ok. Whatever you want then :)

> >> +		case 4:
> >> +		case 7 ... 8:
> >> +			return 1200000;
> >> +
> >> +		default:
> >> +			return 1300000;
> >> +		}
> >> +	}
> >> +
> >=20
> > Other than that, this looks ok to me.
>=20
> Awesome, thank you very much! Explicit ACK will be appreciated as well.

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
