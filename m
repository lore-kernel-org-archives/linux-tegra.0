From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/3] sound: ASoC: tegra: Select tegra30 i2s and ahub for
 tegra124 SoC
Date: Tue, 18 Apr 2017 18:38:33 +0200
Message-ID: <1492533513.3504.2.camel@paulk.fr>
References: <20170418151159.31843-1-contact@paulk.fr>
         <d18b57d3-a44f-e44b-9bd5-526993dc91e4@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-f/OzAaO+fA7fBAUdo+Fc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d18b57d3-a44f-e44b-9bd5-526993dc91e4-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--=-f/OzAaO+fA7fBAUdo+Fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 18 avril 2017 =C3=A0 10:15 -0600, Stephen Warren a =C3=A9crit=C2=
=A0:
> On 04/18/2017 09:11 AM, Paul Kocialkowski wrote:
> > This selects the tegra30 i2s and ahub controllers for the tegra124 SoC.
> > These are needed when building without ARCH_TEGRA_3x_SOC set.
> > diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> > index efbe8d4c019e..bcd18d2cf7a7 100644
> > --- a/sound/soc/tegra/Kconfig
> > +++ b/sound/soc/tegra/Kconfig
> > @@ -46,7 +46,7 @@ config SND_SOC_TEGRA20_SPDIF
> >=20
> > =C2=A0config SND_SOC_TEGRA30_AHUB
> > =C2=A0	tristate
> > -	depends on SND_SOC_TEGRA && ARCH_TEGRA_3x_SOC
> > +	depends on SND_SOC_TEGRA && (ARCH_TEGRA_3x_SOC ||
> > ARCH_TEGRA_124_SOC)
>=20
> Is this really a compile-time dependency?

=46rom a quick look at the code, I doubt this is really a build dependency.

> If so, don't we need to add=C2=A0T210 and T186 entries into that || condi=
tion too,
> since we could be=C2=A0building a kernel with just T210/T186 support and =
no T124
> support?

In the spirit of this patch, adding entries for other tegra platforms would=
 make
sense.=C2=A0Would you prefer that we leave out the dependency from SND_SOC_=
TEGRA30_*
and only select the right I2S driver to use in each codec driver?

If not, we'd have to list all relevant platforms both in the I2S/AHUB drive=
rs
and in each codec's rules (which is not necessarily and issue, but there's =
no
need to have artificial platform dependencies).

What do you think?

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-f/OzAaO+fA7fBAUdo+Fc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlj2QQoACgkQhP3B6o/u
lQwD6Q//byGzV+L88nNVaAY8tSkMSF5zlys3oNDf/+XC37FtF6+iYpplARrMwhjA
JBP2VwFGyhX+Frwtv7xnN6tHfdW4fr2pRInXTOsUz4jhu65MFs79nPF04KR+cswn
QFJz1lxYyGJzSDHAeGfG4otDHNfI1A80uOScy3kYFzbq0OZ5Rqm2eBtsyjtu/StD
pogHkmsmVq37SnupdB1EPtIRNzo3iWWucDgulYR4fbqdPbOxjN9FOL3Y2HwUMjLQ
iJwlETbs9k3amTSoYukwkqG0HvHDtCVsJJTc6pYwcjHdh6LtedCheL4LU6Z56D5v
7Y89k5LFT88km889wUeq+qlbwzpdFSNfkUQvAPZ5HrUjkdgZuzW+QA32Q2xsassw
pMPeXGf89oZ3yeW2+/sV7S9sj3LFK6Mp/zzrtMlaW8VRkzQES2PX61eI2+PzYOi0
SMixoKupupoTGz+5rKdu4aXiegdJb7Das/rGhpQMYdSGafL+7Vu7ywAMIs5H53nx
FjJFHYwl+ov4EF9uVDFQj2Bxv67O+6afAqioiY6oH8pG5YwiMrN2PSTEB2YaZuNA
IbU4FWzT+zWV8T1feCrfWt9ouGezJVSb2MvGnwh/DlrEWa4XqSWOFWL6PD1OT6Ux
BimxlPbddyO0hvJOCdu3KKvvsss7FyzKQD5ceX1UpqRALaD9e8k=
=zmwf
-----END PGP SIGNATURE-----

--=-f/OzAaO+fA7fBAUdo+Fc--
