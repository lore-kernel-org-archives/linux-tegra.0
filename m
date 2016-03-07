From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Mon, 7 Mar 2016 09:32:24 +0100
Message-ID: <20160307083224.GB31189@ulmo.nvidia.com>
References: <1456739480-3304-1-git-send-email-wni@nvidia.com>
 <56D698FE.7070706@nvidia.com>
 <56D78081.6050106@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56D78081.6050106@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Longnecker <mlongnecker@nvidia.com>
Cc: Wei Ni <wni@nvidia.com>, rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 04:08:33PM -0800, Matt Longnecker wrote:
>=20
>=20
> On 03/01/2016 11:40 PM, Wei Ni wrote:
> >>diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra_s=
octherm.c
> >>index 74ea5765938b..136975220c92 100644
> >>--- a/drivers/thermal/tegra_soctherm.c
> >>+++ b/drivers/thermal/tegra_soctherm.c
> >>@@ -57,7 +57,7 @@
> >>  #define READBACK_VALUE_MASK			0xff00
> >>  #define READBACK_VALUE_SHIFT			8
> >>  #define READBACK_ADD_HALF			BIT(7)
> >>-#define READBACK_NEGATE				BIT(1)
> >>+#define READBACK_NEGATE				BIT(0)
> I confirm that this change is technically correct. It fixes a bug.

That usually translates to a Reviewed-by: tag. =3D)

Thierry

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3TyYAAoJEN0jrNd/PrOhQ9YP+wdTDT0yK5w5PtR03ih4Yd9w
k4QfkoHJucs0Ep/H5wJJ77BBNzOx8l3G8tRpTkO9T+YR/V0RM4wMHKkZyMlaHgdz
7EXysScz+ikrHl6L8UpxPT2/tGhR0N5SvE4tRJQNeEZh/HLmIEic1jGp5cHJRCMe
MPaME4h29C3CKtMDTs/NPNiSEO/SgKNiKXlHBlJ2Mp6BFAEhIlO8CwMzu0UM+OOQ
AAiyAGZE6D73V+VJr3RWTEBiNEcHi8Bcdzuqwo2VYUb5n2zThTV8i4xSuzuYOSQL
OYx/pE1s5HgNUp8wWj+NeL5hRbVX+Hmoy+///Tuolgo9NN+ADUell40Pb8umYR1q
QtQ7pMJ9zBGEkrhJZrOiV4w9M7DznmeO2JJk/lUk4dT4nsrTg3XTVxKZ0G5kXc0E
DlL0x4EO+OX8E5IPet0pw3teHNZ9l+wJwTE0e7GDT0lnm1ARy2wJXrVBSJc8fNq+
W0Af2N9F/W7Xb6MtZJKVFJioMP/xol9hOSuRqeubWTvAHapDhBRQehXxvLChVh4K
N6AmGKtvC5P4D6NNUsVpDVB01X3aR1bvAlN/3J5xQSRRVPMFUoBJmAT426ErJYWP
5e1wM19aqCqr3DxW6/nacL5QIku8Oym1mdDQr6/ZaSaMO0eiLjA9XN56m0w83d+q
OVtYEAulOjdrWwel62F7
=SEPi
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
