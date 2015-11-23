From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: select USB_ULPI from EHCI rather than
 platform
Date: Mon, 23 Nov 2015 15:37:33 +0100
Message-ID: <20151123143733.GA2318@ulmo.nvidia.com>
References: <8693901.Fc4bDK8zzK@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8693901.Fc4bDK8zzK@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 02:51:29PM +0100, Arnd Bergmann wrote:
> For historic reasons, the tegra platform selects USB_ULPI from architectu=
re
> code, but that hasn't really made sense for a long time, as the only
> user of that code is the Tegra EHCI driver that has its own Kconfig
> symbol.
>=20
> This removes the 'select' statements from mach-tegra and drivers/soc/tegra
> and adds them with the device driver that actually needs them.
>=20
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> Tegra maintainers, can you pick this up for 4.5? There is no real bug her=
e,
> but I found this when looking at something else in drivers/usb/phy.

Applied, thanks.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUySoAAoJEN0jrNd/PrOhVboQAIp9pOwSrpVoDpydru56ZFWw
mqqtaDSu4YIZCV/U+9cM/KrVY/7ybgc+yacqdxENFVtAphrGVoLV/LpCYOcLlhln
SdS1eUU2QK8WHr8Sk9otzqqBOJhX/ZDz5t67QiSrlvNe9FAGHqaX1p1KlAvFVnvz
MeApx4NjNAw5RfoONVbEGO8HAgSu+NPG0PvnmZCrchWB273Ygj6uqIUn5abw/prJ
+jh8WO+ij3/xSGrId0JBjUAXTqAmXLANqGY1KGMnDnKWBNZ2NDeVzdwjZt00j7Sk
5wUXCtWTm8+kTfzSL+Q+ZaKvLJgFqaRafTlZC7D8IvMfiQvbBGX5/rwYjENob6dH
GGbcDlG8RBEvbk2tl/m8OS7sWcwGlJwASpr/asIMS5q4x/ri2EsNLotu1XsTQTQ9
+W7ptCVofuEcORI8Ouay1wXjEgSlPZ1K521gljcrlZHxk3QSaafLhjH90x+n9/fm
Ps+cn8vtRwvPzfA2bGQkyy31w8sVeZRkiFdlTC/ynwIlyqklZZsgkXow6/VJ6vcX
u8ZSmkM5Ga68rxsaDxV3SDwb8V/RoqK0Fjinqa/2niFGdRklWDEvvphrLRPqU4sZ
TKesBYdgYzrq3S+p7jVRbcdM91KH3e2pLk+6IqDWSGfuQLwIGK3ez6SGdQUTefZk
jbhW3Fq0wTc1KPqppxOT
=6lk2
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
