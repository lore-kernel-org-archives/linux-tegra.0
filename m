From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Wed, 19 Jun 2019 10:33:08 +0200
Message-ID: <20190619083308.GM3187@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nj4mAaUCx+wbOcQD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Nj4mAaUCx+wbOcQD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 09:41:03AM -0600, Stephen Warren wrote:
> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
> > 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > This patch adds suspend and resume support for Tegra pinctrl driver
> > > > and registers them to syscore so the pinmux settings are restored
> > > > before the devices resume.
> > > >=20
> > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > ---
> > > >   drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 +++++++++++++++++++=
+++++++++++++
> > > >   drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
> > > >   drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
> > > >   drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
> > > >   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
> > > >   drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
> > > >   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
> > > >   7 files changed, 84 insertions(+)
> > > >=20
> > > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctr=
l/tegra/pinctrl-tegra.c
> > > > index 34596b246578..ceced30d8bd1 100644
> > > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > @@ -20,11 +20,16 @@
> > > >   #include <linux/pinctrl/pinmux.h>
> > > >   #include <linux/pinctrl/pinconf.h>
> > > >   #include <linux/slab.h>
> > > > +#include <linux/syscore_ops.h>
> > > >   #include "../core.h"
> > > >   #include "../pinctrl-utils.h"
> > > >   #include "pinctrl-tegra.h"
> > > > +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> > > > +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> > > > +#define EMMC_DPD_PARKING			(0x1fff << 14)
> > > > +
> > > >   static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 =
reg)
> > > >   {
> > > >   	return readl(pmx->regs[bank] + reg);
> > > > @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(st=
ruct tegra_pmx *pmx)
> > > >   			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
> > > >   		}
> > > >   	}
> > > > +
> > > > +	if (pmx->soc->has_park_padcfg) {
> > > > +		val =3D pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> > > > +		val &=3D ~EMMC_DPD_PARKING;
> > > > +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> > > > +
> > > > +		val =3D pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> > > > +		val &=3D ~EMMC_DPD_PARKING;
> > > > +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> > > > +	}
> > > > +}
> > >=20
> > > Is there any reason why parked_bit can't be changed to parked_bitmask=
 like I was
> > > asking in a comment to v2?
> > >=20
> > > I suppose that it's more preferable to keep pinctrl-tegra.c platform-=
agnostic for
> > > consistency when possible, hence adding platform specifics here shoul=
d be discouraged.
> > > And then the parked_bitmask will also result in a proper hardware des=
cription in the code.
> > >=20
> >=20
> > I'm now also vaguely recalling that Stephen Warren had some kind of a "=
code generator"
> > for the pinctrl drivers. So I guess all those tables were auto-generate=
d initially.
> >=20
> > Stephen, maybe you could adjust the generator to take into account the =
bitmask (of
> > course if that's a part of the generated code) and then re-gen it all f=
or Sowjanya?
>=20
> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that
> generate tegra-pinctrlNNN.c. See  	soc-to-kernel-pinctrl-driver.py. IIRC,
> tegra-pinctrl.c (the core file) isn't auto-generated. Sowjanya is welcome=
 to
> send a patch to that repo if the code needs to be updated.

If we want to do that, we may need to start off by bringing the pinmux
scripts up to date with the latest version of the generated files. There
have been a number of changes in the meantime that cause the scripts to
generate a bit of diff with regards to what's currently upstream. Sounds
like something fairly trivial, though.

Thierry

--Nj4mAaUCx+wbOcQD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J80QACgkQ3SOs138+
s6FBAg/7Bf4pKVuUgiXaL2ZpSW6kr69XzJ449U10mrw9x3AFaYkWRN+8naxPQgWS
c338JFDAEDEOLmCY45MzLuD7UYyoSKTVqO5H5GHxnpCARKtkfRY0av6yXyf/C2qN
FCdr7w4POoTfg9XlqddT8dTxYth3w8Y95shLpj6gSbc9gVqKNPVYyiB/YG8sPI6H
G9c9dXFiRheXgLOkpk8AROj1iSh5F0DDDvcSBbds/KvYJKJGR62odzBBAzEd4Izq
U+a+CBZDCN+x5UM3WEeh3/sXuDBnZUjAynKfsa/yPcdyKtnGENqjsVNfnWbk45r8
8cv601Pw110Co51JHS0slvvSCoTuzvq5cErKmIj52eFhstYNKek1evcNZMLSuF3R
EEqh4ob3Rbt5kj2YJUT+H9WRzkzIZjx5AnS/CHAQVPTmqNC9FMPuFAL8FbVIYNFF
SH0GVXmOdAGvHdQEkMe1BKb1nKv2U2o5KAGJgft4RBDVxu/KiuJNto1xEdbab3dK
Lgz2WUuUoOwTwiZhT3vr2UWym78uwSk+D2hxT8o9aABXv8wGKlXg9gjIi7r6famJ
rvLdWy6VjDsdJz9jeK89AfsWB40vix6AhLtZ7SqfZ6cXOIFXJXk5SUQZuWO3qM+r
n8QVJCMaJWFCXSmnBpihGlICrr+/0SKA/axw7uLBypTj1EF1jk0=
=sP7K
-----END PGP SIGNATURE-----

--Nj4mAaUCx+wbOcQD--
