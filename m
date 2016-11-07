From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 0/3] ASoC/ARM: tegra: apalis t30/tk1/colibri t30:
 sgtl5000 audio
Date: Mon, 7 Nov 2016 14:42:20 +0100
Message-ID: <20161107134220.GA29676@ulmo.ba.sec>
References: <1466298002-12576-1-git-send-email-marcel.ziswiler@toradex.com>
 <1471355726.4197.6.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471355726.4197.6.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gnurou@gmail.com" <gnurou@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "prarit@redhat.com" <prarit@redhat.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "ttynkkynen@nvidia.com" <ttynkkynen@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "perex@perex.cz" <perex@perex.cz>, alsa-devel@alsa-proje
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 01:55:28PM +0000, Marcel Ziswiler wrote:
> On Sun, 2016-06-19 at 02:59 +0200, Marcel Ziswiler wrote:
> > This series adds/integrates Freescale SGTL5000 analogue audio codec
> > support.
> >=20
> > Changes in v4:
> > - simple-audio-card does still not allow for more advanced use cases
> > =C2=A0 like Tegra SoCs
> > - further platform drivers have been accepted since my last attempt
> > =C2=A0 (e.g. rt5677 one)
> > - relevance for one further board the new Toradex Apalis TK1
> > - drop unused sound/jack.h include
> > - in tegra_sgtl5000_driver_remove() pass return value of
> > =C2=A0 snd_soc_unregister_card() on to caller
> > - no longer set owner property in platform_driver to THIS_MODULE
> > - re-based/resend
> >=20
> > Changes in v3:
> > - revert to not using simple-audio-card being incompatible with tegra
> > - rebased to for-next
> >=20
> > Changes in v2:
> > - using simple-audio-card as suggested by Fabio
> >=20
> > Marcel Ziswiler (3):
> > =C2=A0 ASoC: tegra: add tegra sgtl5000 machine driver
> > =C2=A0 ARM: tegra: apalis/colibri t30: integrate audio
> > =C2=A0 ARM: tegra: enable sgtl5000 audio
> >=20
> > =C2=A0.../bindings/sound/nvidia,tegra-audio-sgtl5000.txt |=C2=A0=C2=A04=
2 ++++
> > =C2=A0arch/arm/boot/dts/tegra30-apalis.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A049 ++=
+++
> > =C2=A0arch/arm/boot/dts/tegra30-colibri.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A049 +++++
> > =C2=A0arch/arm/configs/tegra_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0sound/soc/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A011 ++
> > =C2=A0sound/soc/tegra/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +
> > =C2=A0sound/soc/tegra/tegra_sgtl5000.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 212
> > +++++++++++++++++++++
> > =C2=A07 files changed, 366 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/sound/nvidia,tegra-audio-
> > sgtl5000.txt
> > =C2=A0create mode 100644 sound/soc/tegra/tegra_sgtl5000.c
>=20
> With Mark finally having pulled the first patch of this series (https:/
> /lkml.org/lkml/2016/8/15/297) I'm wondering whether the second and
> third patch are now being pulled via tegra tree? Or should I rather re-
> submit those as a new v5 patch set?

Both patches applied now, thanks.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIIS6AAoJEN0jrNd/PrOh4ycP/0cn4nX9ijcjyR1rB2FgbI2B
f9dzwENDUpNnw91FNHZgX9CnBnZXR2ZUwOibCdVlxI0Vfw7DZHJc628Fxv3PAvxj
8fdalvCf3HullJHrq2Rxbqd74tJyU5Yp2VlusX0hyKayj+7W0iHQfecmuCioHyHb
IrWU/1OWmKioTli1lJBzsY/a2FlNf19d0EpfJyyWsSq3WMHw3jLlLgthYSoQjV9Y
5Fct7pi6xm2N5qj1eXO15tkR06bZpTNBtVh746wg/Ly+ET9aZFC67t4iJ/dMZEKL
VipJpg39q9SpwDUqeVEWDuu5saCXlmrReIflp0rBeP7eZTL++QYcCPmT7B+00H3d
SAO02DeFsfrVtj9TNM3Ey1oMMi8197ed0T6RU9FdiIRnpINLyx0n0tEDDx5qwZj7
NZjrYLDW65GQmogZO9J0mqJsLuBUZP61dR1bcw8opUSJwDKYM2dkkO6O7ciWAYfg
JrY9OJa2Wh/CAHTdwbWcTunRT+58iwaqkHw+r0Z9YGh/ij+os8/QcUeae6M3q4qt
qs4D4HBZvDAavIEhXX1WFGCqduWvHPszRKnp3gMsBmFpTx738sF0Tx6oaXmdkMpW
K3IewHuyboSWI9mJUPzhV4J2otO4yZkV1PQIQTlZDfBKPM0KvfBYOOsITGyPwCDy
+q2+oUh+Xfr8ETyqs5mf
=oWYs
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
