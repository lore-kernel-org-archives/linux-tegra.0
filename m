From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for
 tegra124 SoC
Date: Mon, 24 Apr 2017 20:41:17 +0200
Message-ID: <1493059277.1111.1.camel@paulk.fr>
References: <20170418151159.31843-1-contact@paulk.fr>
         <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
         <1492533513.3504.2.camel@paulk.fr>
         <41ef55f7-8f17-4ca3-4757-bfefb1fe8321@wwwdotorg.org>
         <1493046446.943.7.camel@paulk.fr>
         <fe76985c-ef66-9870-a616-203b54a93777@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-gpcl+r7qXWkdduiguUh/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe76985c-ef66-9870-a616-203b54a93777-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-gpcl+r7qXWkdduiguUh/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 24 avril 2017 =C3=A0 09:35 -0600, Stephen Warren a =C3=A9crit=C2=
=A0:
> On 04/24/2017 09:07 AM, Paul Kocialkowski wrote:
> > Le mercredi 19 avril 2017 =C3=A0 16:00 -0600, Stephen Warren a =C3=A9cr=
it :
> > > On 04/18/2017 10:38 AM, Paul Kocialkowski wrote:
> > > > Le mardi 18 avril 2017 =C3=A0 10:15 -0600, Stephen Warren a =C3=A9c=
rit :
> > > > > On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
> > > > > > This selects the tegra30 i2s and ahub controllers for the tegra=
124
> > > > > > SoC.
> > > > > > These are needed when building without ARCH_TEGRA_3x_SOC set.
> > > > > > diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> > > > > > index efbe8d4c019e..bcd18d2cf7a7 100644
> > > > > > --- a/sound/soc/tegra/Kconfig
> > > > > > +++ b/sound/soc/tegra/Kconfig
> > > > > > @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
> > > > > >=20
> > > > > > =C2=A0config SND_SOC_TEGRA30_AHUB
> > > > > > =C2=A0	tristate
> > > > > > -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
> > > > > > +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC ||
> > > > > > ARCH_TEGRA_124_SOC)
> > > > >=20
> > > > > Is this really a compile-time dependency?
> > > >=20
> > > > From a quick look at the code, I doubt this is really a build
> > > > dependency.
> > > >=20
> > > > > If so, don't we need to add T210 and T186 entries into that ||
> > > > > condition
> > > > > too,
> > > > > since we could be building a kernel with just T210/T186 support a=
nd no
> > > > > T124
> > > > > support?
> > > >=20
> > > > In the spirit of this patch, adding entries for other tegra platfor=
ms
> > > > would
> > > > make
> > > > sense. Would you prefer that we leave out the dependency from
> > > > SND_SOC_TEGRA30_*
> > > > and only select the right I2S driver to use in each codec driver?
> > > >=20
> > > > If not, we'd have to list all relevant platforms both in the I2S/AH=
UB
> > > > drivers
> > > > and in each codec's rules (which is not necessarily and issue, but
> > > > there's
> > > > no
> > > > need to have artificial platform dependencies).
> > > >=20
> > > > What do you think?
> > >=20
> > > I think we should just remove most of these "depends on" since they'r=
e
> > > mostly set up to reflect runtime requirements rather than build time
> > > requirements. The only points I'd make are:
> >=20
> > I definitely agree we should do that for all the codec Kconfig options.
> >=20
> > > 1)
> > >=20
> > > Everything should "depends on SND_SOC_TEGRA" simply so the options do=
n't
> > > show up and clutter menuconfig menus unless SND_SOC_TEGRA is enabled.
> >=20
> > Agreed.
> >=20
> > > 2)
> > >=20
> > > SND_SOC_TEGRA30_I2S does need the Tegra30 AHUB driver in order to
> > > compile/link, since it directly calls functions in that driver. This =
is
> > > already handled by SND_SOC_TEGRA30_I2S doing "select
> > > SND_SOC_TEGRA30_AHUB".
> >=20
> > Agreed.
> >=20
> > > 3)
> > >=20
> > > The machine drivers all do e.g. "select SND_SOC_TEGRA30_I2S if
> > > ARCH_TEGRA_3x_SOC". This was an attempt to make the machine drivers o=
nly
> > > pull in the relevant drivers for the SoC(s) being compiled for. I'm n=
ot
> > > sure this still makes sense; this won't work on kernels that only
> > > support T124/T210/T186 since ARCH_TEGRA_3x_SOC isn't enabled then.
> > > Should we just remove all those and make sure the defconfigs are upda=
ted
> > > to make sure the relevant I2S/AHUB/SPDIF/AC97 drivers are explicitly
> > > enabled? Perhaps we should default all the I2S/AHUB/SPDIF/AC97 to y
> > > (which will only apply if SND_SOC_TEGRA is enabled)?
> >=20
> > I think it would be easier for everyone to just auto-select the machine
> > drivers
> > automatically based on the architecture (so we could have the list of
> > ARCH_TEGRA_*_SOC here) when SND_SOC_TEGRA is selected.
>=20
> I don't think selecting the machine drivers is the correct approach,=C2=
=A0
> since then they can't be disabled.
>
> Making certain machine drivers "default y if ARCH_TEGRA_nn_SOC" would=C2=
=A0
> address that,

That's right, my mistake. Let's take that as the solution I'm backing then.

>  but still isn't very scalable since we need to go back and=C2=A0
> edit the Kconfig every time we define a new SoC, in order to add that=C2=
=A0
> SoC into the default statement.

Well, that's what platform bringup is all about, isn't it? I think it makes=
 a
lot more sense to have to add a new platform once (and it's not like one wi=
ll
forget to look at the sound part when adding a new platform) rather than
requiring users to hand-pick the option.

> > Not only does this preserve existing configs (including external ones t=
hat
> > aren't part of the kernel tree), it also clearly maps which machine dri=
ver
> > to use for which SoC instead of having users do it by hand.
>=20
> The machine drivers aren't terribly tied to SoCs by design; most of them=
=C2=A0
> would work on pretty much any SoC. They're only tied to SoCs as a=C2=A0
> side-effect of a machine driver being tied to a certain CODEC, and=C2=A0
> certain CODECS just by chance are only used (so far) on specific boards,=
=C2=A0
> which have specific SoCs.

I'm a bit confused: aren't the machine driver (i2s/ahub/spdif/ac97) tied to
specific hardware blocks that are found in specific SoCs and not in others?=
 I
can see these blocks haven't evolved much across generations, but they're s=
till
either part of a specific SoC or not, aren't they?

The compatible strings in the common SoC dts seem to indicate that only one=
 of
these blocks is found at a time.

--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-gpcl+r7qXWkdduiguUh/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlj+Rs0ACgkQhP3B6o/u
lQySyQ//TphzVeuGLRW8OVJMOIb+pFOlABUxyZXF+OY3WpAN8MYEpU7MEYL8tDz7
vaccTaEeF1vPV3Zip95vNUOSh5NaRIgSL9sP+0yrJxWIcmeX2ARn425wDEJ+T334
cfTAp0FNkCedRNYxcdpNBAngYGNrVNXSLvOTHbdAXVbUtLmaUWYh5MvdS0Wt2/PI
3PCOht4CjavUiJ2D5w3+XGKex7TIYFQrnPljLnhJFC1oVlKc1RuvdokeQ5hQnXt/
IgKAKeyk1+zs47sFnAcBPrHpem+8XsSSms+vl56l4o3M13YdW9Uk5BY9B/Xdgqpj
33ZAJAyn72+pkiy76A+yBQEoC/7YFOPG8MjjGm7RLt5blG0q69CdCfK7b///mc5q
z9omkbeVoHzEP+nRq8NcF8X1R8uYcZBl4Uf31blgEYX2wmvMMX1t8Cf/XeHDo7zb
lJLnzrBGXlP2XuegKOyfw7oqqWOrWueqobSvBQpobxvrvmqQA5DR6XsR/242cOIo
tdpDtRAlZQvMlQkePon+U6e6ZoPXFxntIeGKknnDq4+VyG1ltlS1d2FtSah5PkG3
zzZUAVyxNuMbi0ESGSQ9/gndGtqHm3u8OW0Pvpb3u4jZqmk8EuwifYVkHFT+1wJG
THojD9HvjGe6m0tQOzD4Qy0iuwJ83ESWahYNM3cqD9SmsXDWbxY=
=aqZi
-----END PGP SIGNATURE-----

--=-gpcl+r7qXWkdduiguUh/--
