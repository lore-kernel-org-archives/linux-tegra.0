From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [1/6] apalis-tk1: remove spurious new lines
Date: Wed, 25 Jan 2017 07:44:25 +0100
Message-ID: <20170125064425.GA12626@ulmo.ba.sec>
References: <1479773647-14726-2-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479773647-14726-2-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2016 at 01:14:02AM +0100, Marcel Ziswiler wrote:
> Remove some spurious new lines.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---

For some reason I can't find any trace of this series in my inbox. It's
not even been classified as spam, it's just not there. So I had to pull
this from patchwork in order to reply.

>  arch/arm/boot/dts/tegra124-apalis-eval.dts |  1 -
>  arch/arm/boot/dts/tegra124-apalis.dtsi     | 12 ------------
>  2 files changed, 13 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/d=
ts/tegra124-apalis-eval.dts
> index 653044a..2b5a0f3 100644
> --- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
> +++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
> @@ -232,7 +232,6 @@
> =20
>  	backlight: backlight {
>  		compatible =3D "pwm-backlight";
> -
>  		/* BKL1_PWM */
>  		pwms =3D <&pwm 3 5000000>;
>  		brightness-levels =3D <255 231 223 207 191 159 127 0>;

These newlines were introduced to separate standard properties from the
not so standard properties for readability, I'd prefer to keep them.

Same for the ones below.

Thierry

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliISUMACgkQ3SOs138+
s6GnyQ/+LwqijgDEvfYqX7lGd9u9c40HYwM31piF9TpQMhFlBZ4+gKiPqF+KTx3L
JvwpkZopIhWG/o9lbPv95JJGNBa5nf4XSxMiOrkcc9h0XCKyaoRGd8RkfNNujv+l
7TCleyu3bEpK4hxaoR+1DmLWQ+jPFk/UIuZ3QwwNRSNFXmzSGoS9f5bZ0+6aDOEV
96hPHOUPx0q+/jG1+VS+Dy22ieiZVV8FOsU4xN9QgY0E0tSAUwtnwdvHvwAEvv1T
PP2cutlnqLX00FzRLbPsVogHvxCEMaFVMr7H9vIgsf1cRc3B+uFf8DoUqfrRuNNU
NQuBKivCNJwBogokaPOS2urlgZ616e19X6lxEj1J89odcXHEfQio9fsVL6pDx2oe
/s709gjj6obYY3FbTMVElisfjUvs7FWIvxxuEo/u4+q9kX4cdhHWGEvBLnz0cQCj
wwXcSAJrNzyd9wAy9RnQpKXoCMa/t1+ToyyeqGHbmiMwqT4U8YRu7XYrfbJSonyl
knIlFezThkj9KuWHdyUl8h1PKFqWn+0JhlUyq9x1QDmUihDhFmTx93IOXZljD/SW
4pustyuObCuONFSytRlkx6wCSCT0eBheQjQy70E2Fh5om/PaNB+1uyNnDhySCsnR
YgbyT+YxnA8VyfZYt4xjwEGjq46TiRX143gOUaO7iDcIWaMj/n4=
=5xuY
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
