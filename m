From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Wed, 15 Aug 2012 22:12:44 +0200
Message-ID: <20120815201244.GF12870@avionic-0098.mockup.avionic-design.de>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345052375-13374-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 11:39:35AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Removed:
>=20
> * MACH_HARMONY
> * MACH_PAZ00
> * MACH_TRIMSLICE
>=20
>   These used to enable board support for individual boards. Now that we
>   only support device tree, these options have been removed.
>=20
> Added:
>=20
> * TEGRA_PCI
>=20
>   This used to be selected by the board options above. Select this
>   explicitly now that the board options have been removed.
>=20
> * TEGRA_DEBUG_UART_AUTO_ODMDATA
>=20
>   This makes the kernel automatically pick a UART for earlyprintk. It's
>   likely to be a useful option for everyone.
>=20
> * PWM
> * PWM_TEGRA
>=20
>   Enable the new PWM subsystem, and the Tegra driver within it.
>=20
> * GPIO_PCA953X
> * GPIO_PCA953X_IRQ
> * MFD_MAX8907
> * REGULATOR_MAX8907
> * RTC_DRV_MAX8907
>=20
>   Various drivers required for the Whistler board.

Just a nitpick: this list is missing GPIO_TPS65910.

Thierry

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLAK8AAoJEN0jrNd/PrOhWA8P/0GJusXOsghROFC0gapWAJBs
JrYj4wJRlwneIEgOwtBiUEljZ3B9KamZW/tc1IpUfMuAb7k1dP0dNZfAiSSt2IIY
sdPhlfmyHflKSd3ct7z4sO/KcnOV+WPyW07aJLjy3F09lny0nevqDiPGS0BBpHeh
f7Jm51OOe5dY5vFyUoY7VqS76oHDFQcP2zKsW4IRgBz8v1HwZUGm3r3cq+vW1B0V
HaXnFHuAhAZYOymNnOxI1mwo8J4olm4rfygCcav3ZAyM2JfM73Ai9R2uuI+U4bNt
D0y2lxX8hmL2+ZEr+Q6MHtcZKqjucbp4ZDrBS+nxh5b5+Ry4alH/QMtPMns7PE7W
3zFUcpD+dcK8kFdLS7+Bw/zxLsy/9fazAovyk0iWoDCIwj9ji1ZNfSHAYLoaTnu5
upAFwp1ZTSKJ1zaJ8lNeGi2N2sA6RL2ELa5u+rMyFsqpB+ePxDezH4hEQ4m54WkR
wK/e0Wl7+ze93Rhf/T5un35fR5HS5e1ZSvNw/ZUN21ikAiIr3Ry4aTQ2SkNGhtT6
KeR+6k9e+klA2vmWYsPTJsyvTdV0fVjvSdw4B+2rXt6FO2mSktBPfdxbCKjYFWg4
8mSPJn43nn3UrMK0LBMxZKz/IB0AQOGmrOHr2T9Q+roWZlNkXfrHQVzYrOxXaV4+
mmjeJg16HlH3iB8V16ge
=Nt2V
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
