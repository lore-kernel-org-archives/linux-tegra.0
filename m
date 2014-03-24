From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/12] drm/nouveau/fifo: add GK20A support
Date: Mon, 24 Mar 2014 23:14:59 +0100
Message-ID: <20140324221457.GE17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-6-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2140389291=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-6-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============2140389291==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Content-Disposition: inline


--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:27PM +0900, Alexandre Courbot wrote:
> GK20A's FIFO is compatible with NVE0, but only features 128 channels and
> 1 runlist.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/Makefile                   |  1 +
>  drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h    |  1 +
>  drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c    | 35 ++++++++++++++++=
++++++
>  drivers/gpu/drm/nouveau/core/include/engine/fifo.h |  1 +
>  4 files changed, 38 insertions(+)
>  create mode 100644 drivers/gpu/drm/nouveau/core/engine/fifo/nvea.c

Looks good to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMK5hAAoJEN0jrNd/PrOhGDoP/0pgl3HDKM0+XYJVa8Eum5Jf
hPoM7RHtn7CGjaTKF9lhlngWiovM0tEPKH8sb1NoNoPWE+T+4hBuGHrFr07x2zdQ
v9R1YIddeEefc6sL7JWpC1MSNNUqySEA0MgO1S/iT4WMUmvB0AoJHZ5XGo2j2lV/
Cr89JvkrXsmu/h9tTXB1EHaAAbGAPidDoY2a1t/kFt8J9fHXft0ucN7UIBqyEXgY
VYIG3GHSEgjoneictNnAcCRn7pL7MhiimkuuZjkHpaoyfEYAdddhsBjHdwNiAkp4
CvsvIgE739IVopLONXFR8c694TA/PxMPTXR+OnHIGOlJ/MvxDtRvF6O4A+VyNY2p
IjPzrFQQ8rlcpnBIs6fCj80W5zxsNZdSOAesyQByQss3EVZ+/CIduKVMh19Daikn
n/Q0L8liB4fxGP2pG6+hlavnqRVmyOp9ogG4t6pOeDWaPQZej16V2l0drXhi7jP+
fw77+M6fhaTcxMW1/xHApQloXUOqZGaejaOGO5RKHomkR5dlMkoM63klf+kIfBAr
+ICD0WxmeM3n90nbwW/2pRzum+MhfBCwYNmuUu4shz2+FyXu2hpmcU87hyXojlj+
60v/cqQw7VBpuI4nD0hm731u5wuHLrol6TyvUeZnnLB40tHihQmX08/RoiIhf4bZ
oE2iLTpAisDEkdpfE6wK
=SOCw
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--

--===============2140389291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2140389291==--
