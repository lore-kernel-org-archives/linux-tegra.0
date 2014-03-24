From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/12] drm/nouveau/bar/nvc0: support chips
	without BAR3
Date: Mon, 24 Mar 2014 23:10:53 +0100
Message-ID: <20140324221051.GC17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1901156084=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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


--===============1901156084==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 05:42:26PM +0900, Alexandre Courbot wrote:
[...]
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu=
/drm/nouveau/core/subdev/bar/nvc0.c
[...]
>  static int
> -nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engi=
ne,
> -	      struct nouveau_oclass *oclass, void *data, u32 size,
> -	      struct nouveau_object **pobject)
> +nvc0_bar_init_vm(struct nvc0_bar_priv *priv, int nr, int bar)
>  {
[...]
> -	/* BAR3 */
>  	ret =3D nouveau_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0,
> -				&priv->bar[0].mem);
> -	mem =3D priv->bar[0].mem;
> +				&priv->bar[nr].mem);
> +	mem =3D priv->bar[nr].mem;
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D nouveau_gpuobj_new(nv_object(priv), NULL, 0x8000, 0, 0,
> -				&priv->bar[0].pgd);
> +				&priv->bar[nr].pgd);
>  	if (ret)
>  		return ret;
[...]
> +static int
> +nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engi=
ne,
> +	      struct nouveau_oclass *oclass, void *data, u32 size,
> +	      struct nouveau_object **pobject)
> +{
[...]
> +	/* BAR3 */
> +	if (has_bar3) {
> +		ret =3D nvc0_bar_init_vm(priv, 0, 3);
[...]
> +	/* BAR1 */
> +	ret =3D nvc0_bar_init_vm(priv, 1, 1);
>  	if (ret)
>  		return ret;

The calls to nvc0_bar_init_vm() are somewhat confusing in my opinion. It
is hard to see from the invocation what these numbers mean and therefore
distinguish which parameter is which.

Perhaps a slightly more readable way would be to pass in a pointer to a
structure as second parameter instead of the index into an array. So
it'd look somewhat like this:

	if (has_bar3) {
		ret =3D nvc0_bar_init_vm(priv, &priv->bar[0], 3);
		...
	}
	...
	ret =3D nvc0_bar_init_vm(priv, &priv->bar[1], 1);
	...

Unfortunately that would require a new type to be created for the bar[]
structures, so it'd be slightly more intrusive.

Thierry

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMK1rAAoJEN0jrNd/PrOhiZAP/24hUvwbKoANoMO1x1FKVMal
JbgBh9+iFH+AyJYb95yS+KHm8AiXkiQZvdr/R/v8kPKLGgGuzON1CYQxk3iV8gZf
z8zO5ChnSk4cvkxChAet7RdKQS+gz8ptuEwUoY6hssBdwJ59miTC/w5KBUTWdMqr
ZDfcnMe3TaMXugn9RU5wVyIjXS7ujxbf1CILp81XvWZK/tOMZVOL1jUPTo9Tn0Da
U/l5Jz07zD6d3lkzj856OOK11uXY4e07YHRlsno4WynbOqy3bmCwttYkqlSUpkoH
GNuVv7ywHyxnh66OkUdsl78/lPW5EQ8MBRk8M2q04V/Rf+3fq190d26MJjzcpLTY
ZPqrUDx6/mwFnfgd6hSGAFi8TpCxF9NyN99YU7TYT0eQL923tW5IvyD6lspWiNfQ
QXbgyB+HRH+WQKFsxyZ93NLopHq7ts9MhYSj2gKR7hVTZzTrjxjnmq8ym4BkSB08
pgTqHC8hCu5X3dim8BDsbg6AHY4GJ0+OwR8Rueslz9d/pumVgrX/jBE1HDdWWUZ3
/XaZXq2Jw++NFvHmr2SOvJyNbp9qbI/Lbp1Z7STZN95jW+ynCDSPugfOFnmNGxTc
Q3JzFmJ7FarP5Tnfh1ppt8ViiDIV1Jo1zOGGv3O4hbXOyC+EKIgZuHFRrbM6r4F/
I7UtGztr4DjZc45Qy0U7
=4xni
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--

--===============1901156084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1901156084==--
