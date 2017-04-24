From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for
 tegra124 SoC
Date: Mon, 24 Apr 2017 17:07:26 +0200
Message-ID: <1493046446.943.7.camel@paulk.fr>
References: <20170418151159.31843-1-contact@paulk.fr>
         <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
         <1492533513.3504.2.camel@paulk.fr>
         <41ef55f7-8f17-4ca3-4757-bfefb1fe8321@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-sukgIBsR699P/6lhu0tR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <41ef55f7-8f17-4ca3-4757-bfefb1fe8321-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-sukgIBsR699P/6lhu0tR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 19 avril 2017 =C3=A0 16:00 -0600, Stephen Warren a =C3=A9crit=
=C2=A0:
> On 04/18/2017 10:38 AM, Paul Kocialkowski wrote:
> > Le mardi 18 avril 2017 =C3=A0 10:15 -0600, Stephen Warren a =C3=A9crit =
:
> > > On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
> > > > This selects the tegra30 i2s and ahub controllers for the tegra124 =
SoC.
> > > > These are needed when building without ARCH_TEGRA_3x_SOC set.
> > > > diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> > > > index efbe8d4c019e..bcd18d2cf7a7 100644
> > > > --- a/sound/soc/tegra/Kconfig
> > > > +++ b/sound/soc/tegra/Kconfig
> > > > @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
> > > >=20
> > > > =C2=A0config SND_SOC_TEGRA30_AHUB
> > > > =C2=A0	tristate
> > > > -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
> > > > +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC ||
> > > > ARCH_TEGRA_124_SOC)
> > >=20
> > > Is this really a compile-time dependency?
> >=20
> > From a quick look at the code, I doubt this is really a build dependenc=
y.
> >=20
> > > If so, don't we need to add T210 and T186 entries into that || condit=
ion
> > > too,
> > > since we could be building a kernel with just T210/T186 support and n=
o
> > > T124
> > > support?
> >=20
> > In the spirit of this patch, adding entries for other tegra platforms w=
ould
> > make
> > sense. Would you prefer that we leave out the dependency from
> > SND_SOC_TEGRA30_*
> > and only select the right I2S driver to use in each codec driver?
> >=20
> > If not, we'd have to list all relevant platforms both in the I2S/AHUB
> > drivers
> > and in each codec's rules (which is not necessarily and issue, but ther=
e's
> > no
> > need to have artificial platform dependencies).
> >=20
> > What do you think?
>=20
> I think we should just remove most of these "depends on" since they're=C2=
=A0
> mostly set up to reflect runtime requirements rather than build time=C2=
=A0
> requirements. The only points I'd make are:

I definitely agree we should do that for all the codec Kconfig options.

> 1)
>=20
> Everything should "depends on SND_SOC_TEGRA" simply so the options don't=
=C2=A0
> show up and clutter menuconfig menus unless SND_SOC_TEGRA is enabled.

Agreed.

> 2)
>=20
> SND_SOC_TEGRA30_I2S does need the Tegra30 AHUB driver in order to=C2=A0
> compile/link, since it directly calls functions in that driver. This is=
=C2=A0
> already handled by SND_SOC_TEGRA30_I2S doing "select SND_SOC_TEGRA30_AHUB=
".

Agreed.

> 3)
>=20
> The machine drivers all do e.g. "select SND_SOC_TEGRA30_I2S if=C2=A0
> ARCH_TEGRA_3x_SOC". This was an attempt to make the machine drivers only=
=C2=A0
> pull in the relevant drivers for the SoC(s) being compiled for. I'm not=
=C2=A0
> sure this still makes sense; this won't work on kernels that only=C2=A0
> support T124/T210/T186 since ARCH_TEGRA_3x_SOC isn't enabled then.=C2=A0
> Should we just remove all those and make sure the defconfigs are updated=
=C2=A0
> to make sure the relevant I2S/AHUB/SPDIF/AC97 drivers are explicitly=C2=
=A0
> enabled? Perhaps we should default all the I2S/AHUB/SPDIF/AC97 to y=C2=A0
> (which will only apply if SND_SOC_TEGRA is enabled)?

I think it would be easier for everyone to just auto-select the machine dri=
vers
automatically based on the architecture (so we could have the list of
ARCH_TEGRA_*_SOC here) when SND_SOC_TEGRA is selected.

Not only does this preserve existing configs (including external ones that
aren't part of the kernel tree), it also clearly maps which machine driver =
to
use for which SoC instead of having users do it by hand.

I'm also opposed to auto-selecting them all, because I don't really like th=
e
idea of auto-including things that might not be needed.

Would that be agreeable?

--=20
Paul Kocialkowski, developer of free digital technology and hardware suppor=
t

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-sukgIBsR699P/6lhu0tR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlj+FK8ACgkQhP3B6o/u
lQyXPw//dZFQb+aEB4514M1oySxs6jNwlSZVMmfLB1wqE344mvQIGPEAp3ooptfd
NRjmTlxxBCsr0tg3/UdqEEfT+guubbT+3pquLa/Fs7kx8Gk+qHObqXZPFaUFMsxi
kI6FgbcDzKbdHEMtL6Cm3ubcDyrzYe8T18GbqLEjA8ln+0/pUJEqke2koCkoxLih
1FoISnIRzmqfta9rPnmEQEwvqn+6rufvys5jqbpjBV7CBnechI48zsbtexdTBqrP
qriCw9bzCJ1o+E84SmBp2LQ5MJejSuMa8ajXjAKQ+ozI7g1U8qiQouoEePMh6YHI
YQYgBTmyg4zwLdggogLWMF9bk7uL6hZixqaT244YJZUtLT2u0Fg0bt/d0qRfDTuO
MZK2l4g0txRol3ePpd9QmVipKzpUX21NZMg/nMn4dSd0Oy92uISwAtUTTAmxoMWP
p1Y+fQCAaufwhN4hHHKX+shXXj65eJ+rPfUPAzMd280phO6ReWg8R063b0BOs939
tbJQsfZqbHaQt40+QpmebkuUaesWWGgeh7A4UW7lyYmVixFXAZEiYsFZoUz8KQOG
HY421nh1sC9AH6wY5TqQZlGgPZClbpat3nvIsFQW3/voyVV+hSL22tfbJ3Si3xkt
JXchBgAldU0yZe7U8xEmAMn1118PJXMI25RFuOUi5OvR9HQJVec=
=km1B
-----END PGP SIGNATURE-----

--=-sukgIBsR699P/6lhu0tR--
