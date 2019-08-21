From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v10 01/15] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Wed, 21 Aug 2019 18:46:05 +0200
Message-ID: <20190821164605.GA31425@ulmo>
References: <20190811210043.20122-1-digetx@gmail.com>
 <20190811210043.20122-2-digetx@gmail.com>
 <20190812231258.GA31836@qmqm.qmqm.pl>
 <8369884e-1bd7-063f-e053-5152378078e9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8369884e-1bd7-063f-e053-5152378078e9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?utf-8?B?TWljaGHFgsKgTWlyb3PFgmF3?= <mirq-linux@rere.qmqm.pl>, Rob Herring <robh-dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 05:36:41AM +0300, Dmitry Osipenko wrote:
> 13.08.2019 2:12, Micha=C5=82=C2=A0Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> > On Mon, Aug 12, 2019 at 12:00:29AM +0300, Dmitry Osipenko wrote:
> >> A proper External Memory Controller clock rounding and parent selection
> >> functionality is required by the EMC drivers, it is not available using
> >> the generic clock implementation because only the Memory Controller dr=
iver
> >> is aware of what clock rates are actually available for a particular
> >> device. EMC drivers will have to register a Tegra-specific CLK-API
> >> callback which will perform rounding of a requested rate. EMC clock us=
ers
> >> won't be able to request EMC clock by getting -EPROBE_DEFER until EMC
> >> driver is probed and the callback is set up.
> > [...]
> >> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> >> index 4812e45c2214..df966ca06788 100644
> >> --- a/drivers/clk/tegra/Makefile
> >> +++ b/drivers/clk/tegra/Makefile
> >> @@ -17,7 +17,9 @@ obj-y					+=3D clk-tegra-fixed.o
> >>  obj-y					+=3D clk-tegra-super-gen4.o
> >>  obj-$(CONFIG_TEGRA_CLK_EMC)		+=3D clk-emc.o
> >>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         +=3D clk-tegra20.o
> >> +obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+=3D clk-tegra20-emc.o
> >>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         +=3D clk-tegra30.o
> >> +obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+=3D clk-tegra20-emc.o
> >>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D clk-tegra114.o
> >>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D clk-tegra124.o
> >>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+=3D clk-tegra124-dfll-fcpu.o
> >=20
> > Doesn't it complain when both CONFIG_ARCH_TEGRA_2x_SOC and
> > CONFIG_ARCH_TEGRA_3x_SOC are enabled at the same time?
>=20
> No, at least not with my toolchain setup. Are you getting some warning?

Kbuild actually filters out duplicates to facilitate this kind of
construct.

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ddUcACgkQ3SOs138+
s6E9BA//Xc4iJjeuJwcEDaXEv4kRmc52uoWzk8G3rIeI5nT1pnoejRqiJ9w+F53Q
gAnGlW+EWJ87KTlnnFixhrgAPfdV8SiipLgzU4ZMUAgEkkzhH4Szs85AwW0tFBGy
crYvsCqQ7i7xGA+1MotmZvOtKLQ22nvIMBR8QEF3dllDxd2w2MIXcYSgWJI6KcC+
cVt3pUGGoHIPwV1U2qrcr0LXcazHw4CJZ18OZsm/Z8pgy91ztfSgwKmu9trvfKk+
ipcFOaLShCDcDg3/1fkDHTXEoOLxiUA6HOnCJGTBW6jE01dqW6oX9p330cuwdw0U
FGFTkwc23pHU86AdgSkJkqrNLLKHOtCotcTH/zeJRR8Z9yLG7VvMzVjBVOR/RPLs
zMcJDvn1w4y2I76YBDbs6fhg13sJgmI2yzbsNyJMpSDSxoVUWIJHdhWdNcczHF7f
o4C/gqwQd2yQzv/lVJH/4ZZ/QXymh3JCb3DnVSB2cnwxbSuLBszMgxnZWqVia3Jr
32yumWP5a6rcW7krC2hnUpNC8ynIP9JC4yKa3fn1kng96rMFntAYuCwZ5XuZCycY
hB0JR1K+qSB7ns8VcXaWqwookBC0wEQoKEc2PwOwAluvkp3IYX9bGNsiEw82sFEH
/GiZeFmVA3wKVgEayu/gDsgfCcAJoFtt3zOZNmfBiX2XSfjSKzQ=
=E+B6
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
