From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Mon, 25 Apr 2016 12:00:55 +0200
Message-ID: <20160425100055.GA20630@ulmo.ba.sec>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com>
 <1461319754-12040-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461319754-12040-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2016 at 03:39:13PM +0530, Laxman Dewangan wrote:
[...]
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
[...]
>  static struct gpio_chip tegra_gpio_chip = {

This variable is still file-scoped. Why not get rid of it at the same
time? It's rather pointless to remove all file-scoped variables except a
single one, because now the driver still isn't properly equipped to deal
with multiple instances (however theoretical that may be).

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXHerVAAoJEN0jrNd/PrOhl1YP/jCKRpzqN4+01X5TL6vErHL1
xSdQQgYRQCaXgZNOLwEuMP8jA9N8tT9wz8s61lYOo+/DDhYlvrZCsGbSNpp0vogm
CYZ4YKsaBgzv4/yUSvvB1au2OvDRK2jdJaDIhzfFi5F8yhI63Vt9TOgbChBtNPE5
7Fq+YzqywnbcWtCeFmjn13uxeVT0capuzWUJ1DZPIATxqj/QlyEHABeR0xkdp/Oo
ru3df0y+bb+8jBUrXPRiFUIUnSTYyMj8jaeWMtLRF5hjp81i27eIfNSqPB7HIKXm
1qLum20CPNHq8NqozruFJfuUDmJbYFvtK/s99B5I3YS0JxMBj6YTYGVLNLx8PTEF
9foP3gZcF5BfpsVGPtpmYb9mH1JKJZ+cOZBfwCa5MRW7UiKfkedkkDOBpq5YsFXi
a2rE1hwmoX2NkAeiCDA9rwyLdrT4thDlYIz9H4Lz3qdIsgRaYdoMqFgD4RG6BTBO
kj9BWu0+bTRIV4CYbCyYcQuy7dhYiSibs7/IQGD2H3rf+NM1KczTdDjpM27wpQYg
UfMwKZSVjbo9wC6QubpISy5P6xSUKqT1E7QX0AojnSzbKIgv9yzCjMLvajjQf/CM
kFYG1h7Zrn8q6uJW5S8LglceAOpl5YDKeSuHMiRMv7YY7mwf8xW+l2Q8H7dk2RkP
UWolBr8aK4mTQqXAsHyr
=hF6U
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
