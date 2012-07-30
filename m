From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add Avionic Design Plutux support
Date: Mon, 30 Jul 2012 09:54:05 +0200
Message-ID: <20120730075405.GD15245@avionic-0098.mockup.avionic-design.de>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de>
 <5012F889.1020004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5012F889.1020004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 02:22:33PM -0600, Stephen Warren wrote:
> On 07/25/2012 09:06 AM, Thierry Reding wrote:
> > The Plutux is a set-top box device based on the Tamonten SOM and can be
> > connected to a display via HDMI.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/t=
egra20-plutux.dts
>=20
> > +	regulators {
> > +		compatible =3D "simple-bus";
> > +
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> Depending on the outcome of the simple-bus discussion I mentioned on
> IRC, this might want to be updated to match that. We'll see!

Yes, I forgot to mention that.

>=20
> > +	sound {
> > +		compatible =3D "nvidia,tegra-audio-wm8903-harmony",
> > +			     "nvidia,tegra-audio-wm8903";
>=20
> I think that first compatible value should be more like
> "at,tegra-audio-plutux" or something like that; the driver itself
> matches on "nvidia,tegra-audio-wm8903" only, and the first compatible
> value is just in case we ever need board-specific fixes/hacks in the driv=
er.

Okay, that makes sense.

> > diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Ma=
kefile.boot
>=20
> >  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D tegra20-trimslice.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D tegra20-ventana.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D tegra20-whistler.dtb
> > +dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D tegra20-plutux.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) +=3D tegra30-cardhu.dtb
>=20
> It'd be nice to keep that sorted first on 2x/3x SoC version, then
> alphabetically.

Absolutely.

Thierry

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQFj2dAAoJEN0jrNd/PrOhcRcQAIq+u3f0U/P3wfWnQWejGXWq
iqvGJxTHcZtJIEdVDfNRiAiD+PNjcmOgKdx5LU6+XuBjcH5kuyut04nttAgtxV6f
crLLrrtJ2wsx5yYmRgZUqYGtVvPPiwdIPIbgUyaEkG1XF0UQoDpgGM9/ah9YZ1ZB
mJXj9JuLd7PHeb1EgvraUexP8juDed0hhRKMlrbEfRqr0+d2SMMFxL2pT1Y2ItsP
U7d6+qwl9EP4nImqIK7IE41oAAhZ9jJcNHqJcInU9Kq+JH9KIdxn1lAbBA+2JoE8
udkqilz5dylSqIsHvIllbv7MhkSkFncG0M9j4EWUE9rnY1orkiokfjw2tGtR05h9
46BfHjJGfQclgEm08X7vwBMl+lTG3o5CUmzs2u3od92PRkGiVRxOneTw+qFK1PZd
hT9ZW4YShH5/poGF4qrURlOut9OdaSnOIEXthk+SL7Ze64xOoiwI9QINhlWKrUbc
ljiPXsf8TnH3XPXlDzj5//qzq9SY45k7kJi652vkxe6lBXsDPEUf1G6Rx71F4jRE
NFrujXsvu+uy7429LDvmqWDKtg9exUiX6Jn9fz82sxxFBdCG9Ohnk9sS43HTP128
wJX5q0KCCjS0gesMOg4QW1Ig8uhGG3+qZPMNVNfxKIutPxWm9ag8qZrBFYnDc0UF
3Ffcd+D7F1plD7bLDecz
=wscL
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
