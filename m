From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/12] drm/nouveau/bar: only ioremap BAR3 if
	it exists
Date: Mon, 24 Mar 2014 23:13:15 +0100
Message-ID: <20140324221314.GD17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919172314=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-4-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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


--===============1919172314==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:25PM +0900, Alexandre Courbot wrote:
> Some chips that use system memory exclusively (e.g. GK20A) do not
> expose 2 BAR regions. For them only BAR1 exists, and it should be used
> for USERD mapping. Do not map BAR3 if its resource does not exist.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/bar/base.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c b/drivers/gpu=
/drm/nouveau/core/subdev/bar/base.c
> index bdf594116f3f..d713eeb75b13 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
> @@ -110,6 +110,7 @@ nouveau_bar_create_(struct nouveau_object *parent,
>  {
>  	struct nouveau_device *device =3D nv_device(parent);
>  	struct nouveau_bar *bar;
> +	bool has_bar3 =3D nv_device_resource_len(device, 3) !=3D 0;

I don't think this variable is really necessary since you only use the
expression once anyway, but I don't feel very strongly about it, so
either way:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMK35AAoJEN0jrNd/PrOh62UQALEMxooZCxqPfNArgPHhWmBv
OqNbub1T3WRwvx3fkm71HHmJJe/gm8DdYU4VnPE1c/CQ/6uzD4ufbpE02AROiU6l
MzRKZM3qhDrKVZwWw5X+ep4D88Sd2KVxrKYwRtQwfSabE64A8/vimcpL74XR8Pqu
y+/M7+fa1XHNx2+zgIM0OrNH+dCsKNb6v1Zc52Q876BMis44KXuinGT+ezrPQC8i
Um93srQZAkC1Qv6jn9/SI1ygChpCTDFRiDCkvMeecsstSzOQ6/eLySF/Gri7mYSq
CxDAbPs1MS8t9lchrDN5r5Oj0gyjUdkPFpW2wTUGTFxbrxH/B1S1jUMUYuPYd568
BUHyV6qEdTJ8ZepcJaa+Clc92o53VZBbw+Q3fK3aXgL6t+ZidwXJxk2d49sGY/br
bdTMdAIrz3uIwplFnki3k9qt8wXk4Y67dJ41aiCrvptiIE33wf6pP05a1QiGOdTh
+wMlDT1SQb4p8/eJGfz1UKHOip/BD6aXqSrB3aDPen1sR1jhnbltG3efmEe0aatb
3V2t0DLSpnCX0LtzricvSNpaebRGUzDoQcr28DA/bF8NvfDU5Q+JHR+ydUsOS+pR
C0CsqIdHJJUOR8HOJHhA4rCCcIwcabLOCjH076d2U5cB92/yyClnuTA/mx9wMZvH
HCjPwJ5iU9pb0UqJL0V5
=mG23
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--

--===============1919172314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1919172314==--
