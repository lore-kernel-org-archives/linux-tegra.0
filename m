From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: add Tegra114 support to the AHUB driver
Date: Mon, 25 Mar 2013 15:52:33 +0000
Message-ID: <20130325155232.GR18316@opensource.wolfsonmicro.com>
References: <1363895802-20484-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpDyejMaDGJhP2PU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363895802-20484-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RpDyejMaDGJhP2PU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2013 at 01:56:41PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra114's AHUB shares a design with Tegra30, with the followin changes:
> * Supports more (10 vs. 4) bi-directional FIFO channels into RAM.

Applied but...

> +	clocks =3D <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
> +		<&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
> +		<&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
> +		<&tegra_car 110>, <&tegra_car 162>;
> +	clock-names =3D "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
> +		"i2s3", "i2s4", "dam0", "dam1", "dam2",
> +		"spdif_in";

=2E..this is exactly what I was worried about with the clock bindings :/

--RpDyejMaDGJhP2PU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUHKTAAoJELSic+t+oim9ZxgP+wbnqg4PLiVeNaaJdCnFgGcr
tLF03Sg+a1ewoe2qJMuparB76HM5popzrp6XpOhXQ72+aFhAdClGhuWjJuqMBdXi
GOO04z59zEuoPH4z9GoLnOX7rNwCOZLpbcEQHqM/K8FP4TqFoACdzMuzZUDMr6wM
GDTn2hngTb+kfiGTyPSzwYapBRY0XsuDpYKXyeywx6Rm1QQWu/ZKpPVVxSqRshwh
CY5+lA5t4V2ccgmpYG5s0SX6INdnM5lgp7G0FMrTtwjVaX0HR6Fw7ZNIQg6as9lp
aIWTrLYg+gdNgNtdYRdUNMocEVB0oOC6i/wLg1SpaVxQaxs2ntsC0Kxm51nYH7Gh
UFrzN5Sr5OqC8odnDi8P79CvFvtiLHfKU3HW9EjLQiH7Gnu+UlOpFiSoZ8iLlY7z
dw1pGt0aKd0ac3+L7OSTNTKk76fWR7KSvCJ8NKxR45NRmk/53xOYfmoYHkRA7Ru3
b2DrU0BgU9ccS7GdNq320qgn0otBhaAzW7vA34Sqejt2LQn1hT7D+OMGAlFdP9xj
QhitmklU64RWoPbSv9okPgl1ARU+ouQzZRIgob8o/QmFgtoG7psmCnEyipRvhLSv
bCKzlkQYQQYsXzBEGlctdZigfwamayDCTKvB7TbZ77gkFqjgTqEJBYohiTljsvv5
Wv0E7WAbc3H2qCJiOFW9
=secE
-----END PGP SIGNATURE-----

--RpDyejMaDGJhP2PU--
