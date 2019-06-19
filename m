From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Wed, 19 Jun 2019 10:31:27 +0200
Message-ID: <20190619083127.GL3187@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
 <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
 <cff9b6a2-dc33-d03b-9945-799b158deb07@nvidia.com>
 <232324b1-c0eb-ba1b-0fd0-31fcbd701e07@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eWbcAUUbgrfSEG1c"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <232324b1-c0eb-ba1b-0fd0-31fcbd701e07@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--eWbcAUUbgrfSEG1c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 11:00:05PM +0300, Dmitry Osipenko wrote:
> 18.06.2019 20:34, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> > On 6/18/19 9:50 AM, Sowjanya Komatineni wrote:
> >>
> >> On 6/18/19 8:41 AM, Stephen Warren wrote:
> >>> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
> >>>> 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> >>>>>> This patch adds suspend and resume support for Tegra pinctrl driver
> >>>>>> and registers them to syscore so the pinmux settings are restored
> >>>>>> before the devices resume.
> >>>>>>
> >>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >>>>>> ---
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=A0=C2=A0 | 6=
2 ++++++++++++++++++++++++++++++++
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 +++
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=A0 1 +
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=A0 1 +
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 |=C2=A0 1 +
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
> >>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 |=C2=A0 1 +
> >>>>>> =C2=A0 7 files changed, 84 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
> >>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
> >>>>>> index 34596b246578..ceced30d8bd1 100644
> >>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> >>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> >>>>>> @@ -20,11 +20,16 @@
> >>>>>> =C2=A0 #include <linux/pinctrl/pinmux.h>
> >>>>>> =C2=A0 #include <linux/pinctrl/pinconf.h>
> >>>>>> =C2=A0 #include <linux/slab.h>
> >>>>>> +#include <linux/syscore_ops.h>
> >>>>>> =C2=A0 =C2=A0 #include "../core.h"
> >>>>>> =C2=A0 #include "../pinctrl-utils.h"
> >>>>>> =C2=A0 #include "pinctrl-tegra.h"
> >>>>>> =C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
> >>>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
> >>>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
> >>>>>> +
> >>>>>> =C2=A0 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank=
, u32 reg)
> >>>>>> =C2=A0 {
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs[bank] + reg);
> >>>>>> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(s=
truct tegra_pmx *pmx)
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>>>> +
> >>>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx,=
 0, EMMC2_PAD_CFGPADCTRL_0);
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PAR=
KING;
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0=
, EMMC2_PAD_CFGPADCTRL_0);
> >>>>>> +
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx,=
 0, EMMC4_PAD_CFGPADCTRL_0);
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PAR=
KING;
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0=
, EMMC4_PAD_CFGPADCTRL_0);
> >>>>>> +=C2=A0=C2=A0=C2=A0 }
> >>>>>> +}
> >>>>>
> >>>>> Is there any reason why parked_bit can't be changed to parked_bitma=
sk like I was
> >>>>> asking in a comment to v2?
> >>>>>
> >>>>> I suppose that it's more preferable to keep pinctrl-tegra.c platfor=
m-agnostic for
> >>>>> consistency when possible, hence adding platform specifics here sho=
uld be discouraged.
> >>>>> And then the parked_bitmask will also result in a proper hardware d=
escription in the code.
> >>>>>
> >>>>
> >>>> I'm now also vaguely recalling that Stephen Warren had some kind of =
a "code generator"
> >>>> for the pinctrl drivers. So I guess all those tables were auto-gener=
ated initially.
> >>>>
> >>>> Stephen, maybe you could adjust the generator to take into account t=
he bitmask (of
> >>>> course if that's a part of the generated code) and then re-gen it al=
l for Sowjanya?
> >>>
> >>> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that=
 generate
> >>> tegra-pinctrlNNN.c. See soc-to-kernel-pinctrl-driver.py. IIRC, tegra-=
pinctrl.c (the core
> >>> file) isn't auto-generated. Sowjanya is welcome to send a patch to th=
at repo if the code
> >>> needs to be updated.
> >>
> >>
> >> Hi Dmitry,
> >>
> >> Just want to be clear on my understanding of your request.
> >>
> >> "change parked_bit to parked_bitmask" are you requested to change park=
ed_bit of PINGROUP
> >> and DRV_PINGROUP to use bitmask value rather than bit position inorder=
 to have parked bit
> >> configuration for EMMC PADs as well to happen by masking rather than c=
hecking for
> >> existence of parked_bit?
> >>
> >> Trying to understand the reason/benefit for changing parked_bit to par=
ked_bitmask.
> > Also, Park bits in CFGPAD registers are not common for all CFGPAD regis=
ters. Park bits are
> > available only for EMMC and also those bits are used for something else=
 on other CFGPAD
> > registers so bitmask can't be common and this also need an update to DR=
V_PINGROUP macro args
> > just only to handle EMMC parked_bitmask. So not sure of the benefit in =
using bitmask rather
>=20
> Hi Sowjanya,
>=20
> The main motivation is to describe hardware properly in the drivers. Why =
to make a
> hacky-looking workaround while you can make things properly? Especially i=
f that doesn't take
> much effort.
>=20
> Stephen, thank you very much for the pointer to the script. Looks like it=
 should be easy to
> modify the script accordingly to the required change.
>=20
> Sowjanya, below is a draft of the change that I'm suggesting. I see this =
as two separate
> patches: first converts drivers to use parked_bitmask, second adds suspen=
d-resume support.
>=20
> Please note that in the end it's up to you and Tegra/PINCTRL maintainers =
to decide if this
> is a worthwhile change that I'm suggesting. In my opinion it is much bett=
er to have a
> generic solution rather than to have a special quirk solely for T210.
>=20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index 34596b246578..4150da74bd44 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -613,9 +613,9 @@ static void tegra_pinctrl_clear_parked_bits(struct te=
gra_pmx *pmx)
>=20
>  	for (i =3D 0; i < pmx->soc->ngroups; ++i) {
>  		g =3D &pmx->soc->groups[i];
> -		if (g->parked_bit >=3D 0) {
> +		if (g->parked_bitmask !=3D -1) {
>  			val =3D pmx_readl(pmx, g->mux_bank, g->mux_reg);
> -			val &=3D ~(1 << g->parked_bit);
> +			val &=3D ~g->parked_bitmask;
>  			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>  		}
>  	}
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegr=
a/pinctrl-tegra.h
> index 287702660783..875eb7a1d838 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -96,7 +96,7 @@ struct tegra_function {
>   * @tri_reg:		Tri-state register offset.
>   * @tri_bank:		Tri-state register bank.
>   * @tri_bit:		Tri-state register bit.
> - * @parked_bit:		Parked register bit. -1 if unsupported.
> + * @parked_bitmask:	Parked register bitmask. -1 if unsupported.

If we're already moving to a bitmask, wouldn't it be easier to just make
0 the case where it is unsupported?

>   * @einput_bit:		Enable-input register bit.
>   * @odrain_bit:		Open-drain register bit.
>   * @lock_bit:		Lock register bit.
> @@ -146,7 +146,7 @@ struct tegra_pingroup {
>  	s32 mux_bit:6;
>  	s32 pupd_bit:6;
>  	s32 tri_bit:6;
> -	s32 parked_bit:6;
> +	s32 parked_bitmask:26;

If we make parked_bitmask =3D=3D 0 the case for "unsupported" we could make
this u32 while at it.

>  	s32 einput_bit:6;
>  	s32 odrain_bit:6;
>  	s32 lock_bit:6;
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/t=
egra/pinctrl-tegra210.c
> index 0b56ad5c9c1c..d2ba13466e06 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1302,7 +1302,7 @@ static struct tegra_function tegra210_functions[] =
=3D {
>  		.lock_bit =3D 7,						\
>  		.ioreset_bit =3D -1,					\
>  		.rcv_sel_bit =3D PINGROUP_BIT_##e_io_hv(10),		\
> -		.parked_bit =3D 5,					\
> +		.parked_bitmask =3D BIT(5),				\
>  		.hsm_bit =3D PINGROUP_BIT_##hsm(9),			\
>  		.schmitt_bit =3D 12,					\
>  		.drvtype_bit =3D PINGROUP_BIT_##drvtype(13),		\
> @@ -1320,7 +1320,7 @@ static struct tegra_function tegra210_functions[] =
=3D {
>  	}
>=20
>  #define DRV_PINGROUP(pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w,	\
> -		     slwr_b, slwr_w, slwf_b, slwf_w)			\
> +		     slwr_b, slwr_w, slwf_b, slwf_w, prk_mask)		\
>  	{								\
>  		.name =3D "drive_" #pg_name,				\
>  		.pins =3D drive_##pg_name##_pins,				\
> @@ -1335,7 +1335,7 @@ static struct tegra_function tegra210_functions[] =
=3D {
>  		.rcv_sel_bit =3D -1,					\
>  		.drv_reg =3D DRV_PINGROUP_REG(r),				\
>  		.drv_bank =3D 0,						\
> -		.parked_bit =3D -1,					\
> +		.parked_bitmask =3D prk_mask,				\
>  		.hsm_bit =3D -1,						\
>  		.schmitt_bit =3D -1,					\
>  		.lpmd_bit =3D -1,						\
> @@ -1516,31 +1516,31 @@ static const struct tegra_pingroup tegra210_group=
s[] =3D {
>  	PINGROUP(pz5,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3290=
, N,   N,       N,
>      -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -=
1),
>=20
>  	/* pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf=
_b, slwf_w */
> -	DRV_PINGROUP(pa6,    0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pcc7,   0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pe6,    0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pe7,    0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(ph6,    0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pk0,    0x9d4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk1,    0x9d8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk2,    0x9dc, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk3,    0x9e0, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk4,    0x9e4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk5,    0x9e8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk6,    0x9ec, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pk7,    0x9f0, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pl0,    0x9f4, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pl1,    0x9f8, -1, -1, -1, -1, 28, 2,  30, 2),
> -	DRV_PINGROUP(pz0,    0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz1,    0xa00, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz2,    0xa04, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz3,    0xa08, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz4,    0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(pz5,    0xa10, 12, 7,  20, 7,  -1, -1, -1, -1),
> -	DRV_PINGROUP(sdmmc1, 0xa98, 12, 7,  20, 7,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc3, 0xab0, 12, 7,  20, 7,  28, 2,  30, 2),
> -	DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
> +	DRV_PINGROUP(pa6,    0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pcc7,   0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pe6,    0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pe7,    0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(ph6,    0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pk0,    0x9d4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk1,    0x9d8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk2,    0x9dc, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk3,    0x9e0, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk4,    0x9e4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk5,    0x9e8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk6,    0x9ec, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pk7,    0x9f0, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pl0,    0x9f4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pl1,    0x9f8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
> +	DRV_PINGROUP(pz0,    0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pz1,    0xa00, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pz2,    0xa04, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pz3,    0xa08, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pz4,    0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(pz5,    0xa10, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
> +	DRV_PINGROUP(sdmmc1, 0xa98, 12, 7,  20, 7,  28, 2,  30, 2, -1),
> +	DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2, 0x7ffc000),
> +	DRV_PINGROUP(sdmmc3, 0xab0, 12, 7,  20, 7,  28, 2,  30, 2, -1),
> +	DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2, 0x7ffc000),

Might be worth adding a new DRV_PINGROUP_PARK (or whatever) macro that
takes the additional parameter. that way we could avoid the extra churn.

Thierry

>  };
>=20
>  static const struct tegra_pinctrl_soc_data tegra210_pinctrl =3D {

--eWbcAUUbgrfSEG1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J8t8ACgkQ3SOs138+
s6EySQ/+PhS1BM4NFdSzqHCTY6XIRLliidJ/UiGIqe97v3Qob0wHAAJUtj/jwyHX
ap4O01GF73sRXF38IBdS2KJceN+xUmfwQBM0IhU4Wd8VSFND/DMcVkbnT26qhz1k
n1DdR/FR6ZDSV1AnwJwFs0SLS+6t5tpHoUtL8v1wwnLov1gkNvj+TAbw7jG6K921
cFKE47uCmRSDn88GIt1QeB4l1qSokeKFgnaUvT1X/sgNOkubAr0EYDbUrC8MlMnx
If4zaTgSO6Qq8EkC9lSbRj0rvahzzdlHokDqv+JoUqu4XCcbh1RirPkN8xIpf1tA
xZbvwioFeB5z7wa8vbdpApErg7cWBsPkPKmWjjFZEl1OUR2haz+YlS2ZHP3vHMWr
OUeMMbIE+2t+iExxWilb/yURWl949nT9NnoqbXq/k/TPQPQrhxzq9J2CXQ4OMOZf
Jlagg6J+1LDcPJNIiUUtUOg4vYMMVcEw3pCXfbe9LVH2vkgKzb7UvpQRZFVA5jBL
wt3SpP565ccD6Wf7NpihU2ZbonMeAaJGxrOk2itVNmUv0msZNl1fu3foQ9lSalDj
VqCsq4/UlVJSiYf1ZOzSEpA/t1cg0POwh9E1lJ4a6wWt5mDLk+y+0LAlfeC80LwU
Y9+v4zKCE5kd4PLi35elY0nhtzN/BaaU7tskDtn3AegejIYINSM=
=G61S
-----END PGP SIGNATURE-----

--eWbcAUUbgrfSEG1c--
