From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/nouveau/timer: skip calibration on
	GK20A
Date: Mon, 24 Mar 2014 22:54:09 +0100
Message-ID: <20140324215408.GB17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0737363522=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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


--===============0737363522==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:24PM +0900, Alexandre Courbot wrote:
> GK20A's timer is directly attached to the system timer and cannot be
> calibrated. Skip the calibration phase on that chip since the
> corresponding registers do not exist.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/g=
pu/drm/nouveau/core/subdev/timer/nv04.c
> index c0bdd10358d7..822fe0d8a871 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
> @@ -185,6 +185,10 @@ nv04_timer_init(struct nouveau_object *object)
>  	if (ret)
>  		return ret;
> =20
> +	/* gk20a does not have the calibration registers */
> +	if (device->chipset =3D=3D 0xea)
> +		goto skip_clk_init;

I'm concerned that this won't scale in the future. Perhaps a better
solution would be to add a "flags" or "features" field to struct
nouveau_device along with feature bits such as HAS_CALIBRATION or
similar.

That way we don't have to touch this code for every new future Tegra
chip. Unless perhaps if there's a reason to expect things to change in
newer generations.

Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMKmAAAoJEN0jrNd/PrOhJsEQAJcXGbrjZueUP8WLMd+Zwozx
eupilYYQ18I0YeUle/n0ol5uuhz629rQ7ls8HG1wJ0zdE15YQiK9WkHALcKuYyJt
5GDKxdT67g+Za14dOj1MFoMvzuQcCp3/XcjcEeP1bGL/W7fAmFnwg7fTtAZepjL9
NF/3SsBo6YAu2Cm60LLHCFzKxypQaJrU7sUPSzEvpd9Pvh47/XDsFiRnohUHkAbq
k2E8tvMTsTWNtmsOkGuaN80QhqHEHHfdYaBZj2jOkfbqE5OkF03YX3WDIV9hYfU+
AdogH2LqIvmwRIyybNyRhN39wanYR82AQDCywJ4ckbJTK0VKp71gTA+SBM8T+jiD
PXgjlQZfcOpGRVNHJUz3q4DcWUc3bGI6MhLMV6k7dKHkC7gO4pKGX+cAiun4mi9k
SYYQe5xZ5DsOVz0Knjb8kK4oXOidWlLtUryLoRb0DBAy471B9XZ+ZS7xaMWWruFk
Ajdk083IqXHpiUu/CviMKBuPkAEJlCM1aKvHTksz35YkNTplE0JwlAVCGerKyYC8
TpefAGUt5RVhFiYqXFw8Pw6MEqWZJY8/Lyurasjp9zvgdtvyiSmN04VjjytFlTXJ
2dBoGhptpkkAAp2IFaftmzbpm17/brY0AiG6MUAnaw3CtSKiQoEewzcYurgC1FFd
v7qZnRdm9J7qPyQvMdDO
=Hw+n
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

--===============0737363522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0737363522==--
