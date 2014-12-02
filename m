From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] staging: android: ion: Deletion of unnecessary
 checks before two function calls
Date: Tue, 2 Dec 2014 10:59:22 +0100
Message-ID: <20141202095921.GD6135@ulmo>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54722893.6020301@users.sourceforge.net>
 <547229DB.8030606@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <547229DB.8030606-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2014 at 07:39:23PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Sun, 23 Nov 2014 18:48:15 +0100
>=20
> The functions ion_heap_destroy() and vfree() perform also input
> parameter validation. Thus the test around the call is not needed.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>  drivers/staging/android/ion/ion.c              | 6 ++----
>  drivers/staging/android/ion/ion_dummy_driver.c | 6 ++----
>  drivers/staging/android/ion/tegra/tegra_ion.c  | 6 ++----
>  3 files changed, 6 insertions(+), 12 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfY15AAoJEN0jrNd/PrOhdfMP/j0vtnDk52TOCUhnT9mI7fXl
liIa3qDK4hrHiZnIQ9/lhTF9bB+0gu3LWtfOUhF9JbGt7mX7dGf7qwJlm7Zhm7i5
CKnMzAG7G/CtL7QyfDz5toB+PEeQb/t+i8ChuC2652CdfxZ85cFzqbXv7OGMqjJO
2yM7Vli+lLVJaZi/lOmFgCM2c+nlamNPu7QCt8YOCwp8KIACUZIWPS7JfqhHm83k
+lrrpMpw/D1E/0ZVlmwUFa2EtcfcpBh7fYBQX4Xw95UzkBlfo4ABNhzAZcI+2bzT
kLLwgBoXavn/uH4H9LTI/PiBa1ZOCy1E0g8MX8PC/k+BWRabx+uSuUpA4q7pVqhJ
D5Tkew9zneC4XEzdT/ojZ86OAEnonU5OZDUiaJyvoaNpjx12GurocXv9rZh7wnfg
+olGbsaGQQEbAEK1E617Ljebbk/McBn9pA7mIGvRHnfNEr8uNITh0eBZ4uwGxAjI
9Oqg1xtdWZdZqxXXk7JmXP9nrOuvsknTFL8Z3TJphLprlikBm2asebgXbk1QK5G4
C4O8d7240hKB9RXARawrX376Tth6xzoq0qJBY6TShDjDkJat8phyBM8NX81sscKS
s+9XGnOx3ESxzaci6ZJYflX43+410HP2ZxCZG5MAI2F48oYAVHyBcXMMYuJ+N0HN
2vt6g5gH+MMEyQen8Z79
=vLiW
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
