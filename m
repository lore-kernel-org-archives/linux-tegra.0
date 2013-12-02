From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/31] ARM: tegra: update DT files to add reset properties
Date: Mon, 2 Dec 2013 10:01:46 +0100
Message-ID: <20131202090145.GB17834@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-5-git-send-email-swarren@wwwdotorg.org>
 <20131129130031.GQ22771@ulmo.nvidia.com>
 <529B8ABB.5040109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529B8ABB.5040109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 12:15:07PM -0700, Stephen Warren wrote:
> On 11/29/2013 06:00 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:59PM -0700, Stephen Warren wrote:=20
[...]
> >> reg =3D <0x70080300 0x100>; nvidia,ahub-cif-ids =3D <4 4>; clocks =3D
> >> <&tegra_car TEGRA114_CLK_I2S0>;
> >=20
> > The clocks for these i2s devices are already listed in the ahub
> > node. Is that on purpose?
>=20
> Yes.
>=20
> The AHUB driver needs to remove reset from the HW modules, so that the
> configlink bus works. Reset removal used to require a custom Tegra API
> that took a clock as a parameter. Hence, the AHUB node needed the
> clock reference. After this series, the AHUB only needs a reset handle
> to use the standard reset API. However, the clock references are left
> in the AHUB node until after the AHUB driver is converted, so the
> series is bisectable. After the series, only the I2S driver needs to
> clock references.
[...]
> >> +			 <&tegra_car 30>,  /* i2s0 */ +			 <&tegra_car 11>,  /* i2s1
> >> */ +			 <&tegra_car 18>,  /* i2s2 */ +			 <&tegra_car 101>, /*
> >> i2s3 */ +			 <&tegra_car 102>, /* i2s4 */
> >=20
> > Some comment for these as for Tegra20.
>=20
> I'm not sure which other comment was "for Tegra20", since none of the
> filenames were quoted, but I'll try to check when I get back.

Indeed. I didn't quote the filenames. =3D( And I typoed Tegra114 as
Tegra20. I was referring to the "I2S clocks are listed in both the AHUB
and I2S nodes" comment above for Tegra114. From your earlier reply,
though this looks good then.

Thierry

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnEx5AAoJEN0jrNd/PrOh+9EP/jCwrXNbMKmVPS1OB3q3+mHM
sUNe1Vg+RrP3QS61Q2HpSnDEoLrjjoz0sWCKSQpAQ0rZxDhs/lBE2NaAYUzcuCF0
bnsshi1eqBZW+IXsQH+HxWO+I2lAfXocUKjVaiTR8wv2Cvt9K7BFZIMmX7PmVLl6
tO0pXfNShs7Igr0xZN8lMI6zvYEbkQc5goqaEM3D/qlCNM+m5UzwFy9oU01Z8YY+
/gagiDy9EnzghSSb4IACgbH3tA+nsu7/El93GGk7NoHwhDAGYW9C9nBdtceaxFsg
cTxBXvveVU3ZaRCdQ3/SDI7VXLuwBicTjR/alXWY4bzj7rMS/GqFsLfiT4Rgp5P6
4JvKNjMtQXAqGfa09/iwE8BfJhr1SYInSdvuZPlgBV/dQgeqx4LUaRYJPiei8SK+
zmfS6PGU9lgx7pLavYac7EqWm0yMv62rRObaiay3i0Q4ZRCXwr1gL46E+H9hM0ey
l/mpBK0PgiqAb/yJiLPFa+3WqCrmdSquf1jHj42wlT6VIkyZ6M6l03QyMkj841tS
nF/Bx+dIQShsztb10nOgBht7OC+FG1nl2jdsvoSYIs2OelgNO//bsj7gleAIFf6B
Y76erjSUzQe+AHH/cLhLkQYy6qK1N69w/ACG41VrD+QZJ72eEaV+P2nmNpjzEswZ
Ts/OaOQF2ZczWOU3ZTlJ
=ULXE
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
