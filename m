From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: gpio: tegra: Maintain endianness
Date: Wed, 11 Mar 2015 10:43:29 +0100
Message-ID: <20150311094324.GH19577@ulmo.nvidia.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
 <1420817231-8346-3-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420817231-8346-3-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2015 at 03:27:09PM +0000, Bob Mottram wrote:
> Replace the _raw-writel with writel_relaxed to fix issue with
> running tegra in big-endian. Tested on Jetson TK1.
>=20
> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Linus, Alex,

would you prefer to take this through the GPIO tree or shall I take it
into the Tegra tree along with the rest of this series. In case of the
former:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I see that the patch wasn't Cc'ed to linux-gpio or Linus so, for
reference, here's a link to it in patchwork:

	http://patchwork.ozlabs.org/patch/427142/

I'm also quoting the entire patch below for your reference.

Thierry

> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 1741981..a83e140 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -85,12 +85,12 @@ static struct tegra_gpio_bank *tegra_gpio_banks;
>=20
>  static inline void tegra_gpio_writel(u32 val, u32 reg)
>  {
> -	__raw_writel(val, regs + reg);
> +	writel_relaxed(val, regs + reg);
>  }
>=20
>  static inline u32 tegra_gpio_readl(u32 reg)
>  {
> -	return __raw_readl(regs + reg);
> +	return readl_relaxed(regs + reg);
>  }
>=20
>  static int tegra_gpio_compose(int bank, int port, int bit)
> --
> 2.1.0

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAA46AAoJEN0jrNd/PrOhrCgQAIMT+qZaNxSTsz8yF5LWw6XC
CnXcBE+wRDT0K1x0OSyz4BoIIlMaGJi5VhXytXf/uTLV1/edJGHDHDj1JnReaHYZ
Lb5XBUJ9RKKjx3DxJRKm7sH1VZYWnnJTmQHAV0uK72Qvm+0FKHWC+pqnm81abIuS
2FSFfsaF3t3q6gS+bAV0JwfysuE1JWl1EMDISl0oARNMyOHfnxEz8LBIUtdaLPpY
eFeB7usoxHesvk0Mj5AcjyEGeUMArJvs7ujbSdWNKudfKzLmaJ0F5Ttr/7whgmBa
j2J2/mo6lawjAL7d/uR+9bauRuAgwGcngvs1T8/WwGdlRF1vrxYpnTtWVeGHh6JE
tOL2EJ/40PjMWTM7U8MKKQTcD/ShHiJLNDpu947HaOdp2PBiM4xQz4I+Ri/1QkpR
DTyrKa3OceTZjhSeV8XR7SpVvv/slpDAWyJl+gqtNMIUFIX2ekWGs8SiRzqpJaiC
Qgc/svnDkbBoFl2Xa/zKIZGW3YR9weXThdHN3S3rM1HEvVIJ//8ZLMSogdD490NE
YTXaSlh57+C8jYx2yfynbkKAY+wRyVbjZlAl4Qi0kfqjHl5/+z4QSH1h2BNHey2w
gi4I7lYCWzf45HELIIRihifVzFAQ4YvoPfnTL9KRU5S2sGRmmexA2ixwf2oSLfWd
SYUebUO1zhibk515IqDD
=re5N
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
