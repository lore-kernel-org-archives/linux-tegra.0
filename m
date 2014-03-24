From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/12] drm/nouveau/graph: enable when using
 external firmware
Date: Mon, 24 Mar 2014 23:58:03 +0100
Message-ID: <20140324225802.GG17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-9-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716296477=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-9-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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


--===============0716296477==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Content-Disposition: inline


--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:30PM +0900, Alexandre Courbot wrote:
[...]
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/g=
pu/drm/nouveau/core/engine/graph/nvc0.c
> index 6ef8bf181b2d..f997a18f5760 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> @@ -1133,10 +1133,14 @@ nvc0_graph_ctor(struct nouveau_object *parent, st=
ruct nouveau_object *engine,
>  	struct nvc0_graph_oclass *oclass =3D (void *)bclass;
>  	struct nouveau_device *device =3D nv_device(parent);
>  	struct nvc0_graph_priv *priv;
> +	bool use_fw;

Perhaps "ext_fw" or "use_ext_fw" would be more accurate.

>  	int ret, i;
> =20
> +	use_fw =3D nouveau_boolopt(device->cfgopt, "NvGrUseFW", false);
> +
>  	ret =3D nouveau_graph_create(parent, engine, bclass,
> -				   (oclass->fecs.ucode !=3D NULL), &priv);
> +				   (oclass->fecs.ucode !=3D NULL) || use_fw,
> +				   &priv);

Or perhaps a more intuitive way would be to name the variable "enable"
and have something like:

	if (!nouveau_boolopt(device->cfgopt, "NvGrUseFW", false))
		enable =3D oclass->fecs.ucode !=3D NULL;
	else
		enable =3D true;

	ret =3D nouveau_graph_create(parent, engine, bclass, enable, &priv);
	...

Thierry

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMLh6AAoJEN0jrNd/PrOh4P0QAIXhJPYt+gjAo+ncR+2zvSnS
0RBpqsNooVqrsxVAVDZJLSqLAcVIJqw6zJvO7tpLq6O4EG1b+gPu7EBeJEqb+EwK
4kLCeGtx3IAIsi7qKDzwfF/2aUoMxKIHynWzvHv0M+GwA6WY0DogtuSn2XHJG5v8
eB0sV/R18TwYjL7yMLFMl3ZYYBSSzeRNHBb4pSIt0FDSwKuPdwGmKMYBYWCb0LId
BpJQIZnqwsnP5dDNuxxGiW7iN41F9KmdGX8pdIH5fdZ1V8vQMTUW2lXsEMxtht/y
eiVF2v8aiQ5sd6sGlblcOI0LoLukMfnorD8+td3VaidXEquJJ1S0lkR/RGe87wsJ
eqeDa1aqtUa4oY+FQYlRtXKAgfudBfUKI+qE1dlWMQlgDk+Jg+vsNRaZM0lwZ4HY
HCXpzORYvXbckNr2ClDtI53gqorTG/RMTzwxKm1vZR51ZrriyyBs59/TRADkqQ0o
8jtDsFHMbszrq0DOfVsVHDNBPfWDOpiixTTaMpUMhZLrBbWsny91hlyDx+roeVUd
DEqwKDPWBfax3H2H+j9fvlU6E+s6jBz8IQ/PDWOxo/lyt3q808Ct+ZPS1YE12kQs
WRtTnbxPYjRb7MjTApGCw3Ltg2YD+zGvdAiiRVp5CpjfzCJhYzosv+47ZSQLQxHW
lQqJopsX03nlPPK6AiE0
=L8DW
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--

--===============0716296477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0716296477==--
