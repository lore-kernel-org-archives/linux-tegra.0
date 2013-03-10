From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 3/5] rtc: tegra: use module_platform_driver_probe for
 module init/exit
Date: Sun, 10 Mar 2013 23:34:05 +0100
Message-ID: <20130310223405.GC4743@avionic-0098.mockup.avionic-design.de>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
 <1362852588-13362-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852588-13362-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:39:47PM +0530, Laxman Dewangan wrote:
> Use macro module_platform_driver_probe() to reduce some of the
> boilerplate code in the driver.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/rtc/rtc-tegra.c |   12 +-----------
>  1 files changed, 1 insertions(+), 11 deletions(-)

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQpdAAoJEN0jrNd/PrOhtaYQAJP2nuZRRIimVOe8KZj4aJDN
7HA996VPkdL4mvOg854Sr9i9wYn2afAhxMnoDfj0Jpit8NUSTPzliINeQeV5ql22
XcV83jW3y7UjG2/yz9TJRMqqoGkXiLdQHxmUi7CZmK3hTZsc4cbT1wk5oq36jrgK
7+KzNlAOy7pNNWf1XbJbBzbE53bJBRRpoBmXPNKdCiYxB2cpDdUEyWtW7mEQNETR
mxRMotROLeK4HRjIKs8HERkatttvSgAyVCMkVp3LTeu6Vqn2sfp6wdVmY34VemEC
Rv47+UDm2LnGimyjkPC35teOIMR2sZoKdkQgQy2aIEcZDaFj068Rw36HvT7cSJ6l
bTM7UODoT5fq490fTPHBF36kUVagJArsONhoXu5Vz1A3n+4py8KL0q8ne9Ed/gXh
aTwEcvr4Ue3u09pgEr3Bi9Ky+mI19QvHAFS8fUi6dYhJzMgVDBLPaCi46lS8IYaM
K8rZHL6qsKWR/6bUBbilSxn/O524Ht9ikXiBSQE3MvOtKZciP51lI8hIRhWzTIS/
ezQw0EI0uysq+FQmRxy6PUvN2N/pi5gnjfj9BoQ2e0oDC0DvW+kdRYi00mXKiONw
PZr08MuctDlI8F+b2ZDRqdAOForuZ7A7cseKJB5gxAr6Onzyf+OaO0qO/dT+fm+L
v8C+THXTxuDQ+e+3T6X3
=0oKM
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
