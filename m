From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: add I2C controllers to Tegra124 DT
Date: Fri, 6 Dec 2013 15:03:34 +0100
Message-ID: <20131206140333.GE30960@ulmo.nvidia.com>
References: <1386196016-25128-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386196016-25128-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:26:53PM -0700, Stephen Warren wrote:
[...]
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124=
=2Edtsi
[...]
> @@ -176,6 +176,96 @@
>  		status =3D "disabled";
>  	};
> =20
> +	i2c@7000c000 {
> +		compatible =3D "nvidia,tegra114-i2c";

Aren't we supposed to always list the most specific compatible as well,
just in case we ever need to implement a specific quirk in the future?

So this would become:

		compatible =3D "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";

Other than that, this is identical to a local patch that I have (minus
the reset* and dma* properties).

Thierry

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSodk1AAoJEN0jrNd/PrOhp9QP/1ASCRzVawqwvKuW+NGBBXvm
tQ/hOeYkth5ra/igUu3bh0VLy6JNNIt4/LeIPl25EIq1Vezkw6y8ivuZBMdlA3qX
5lJVTlVDIGaPp6qwPBRbtXaCCu+6vSMYzxJXFMVIlPF2Gud+ZmC8Y6qqrCOuuVAX
IoJqqEWms4QB28uYVToqWOJpERJywQUpF1g1W1yHiQDWEKetTe010FrfMeCATrpF
bPNxRl7uOuIyoqmvJfng0mwh9sRl2wedGN0jUud/S2fsdAs9AukHJvUgxApMgNbI
unJisz7J2mn8Ec5llmoM3MvXmPndyoqTJacTmyJzMEzsfAcFoRvnd/19Q9f5uvXj
T9j2iL3Re1OZVmhhvg0Icwu3Aq9gSazpDE6I8sxHKMXwyjQwmPr+wghKOtwfWoxI
fASWeyIB6su161Dx49tJXojODIH6wPberPO8K7YdQsWV7UyTnXe83K6/fJpBj+JJ
27gauv7yNz8cMzMDAkvf0o+1isKApHtkbfnLtqWPQvzeBOMO+9Bt9y/DnKDSAQUR
YkvIYOZi47SBSgYEGCvIPthACAEOzjz5yBA+0OiYjPPC+C+2XHA7LlOMXVegnz+j
9vTmm/Ift9IgJrpdkdb4AyJnWQHYCDjPeByKVLScLErv7RSGHPT+MJ/j45tkJs9D
8tjUr2hVvn1Jra7PmgQ2
=sKnW
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
