From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: replace IS_ERR and PTR_ERR with
 PTR_ERR_OR_ZERO
Date: Mon, 11 Nov 2013 07:23:39 +0100
Message-ID: <20131111062339.GB13878@ulmo.nvidia.com>
References: <1383724435-15380-1-git-send-email-duanj.fnst@cn.fujitsu.com>
 <527A7333.9090409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <527A7333.9090409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Duan Jiong <duanj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2013 at 05:49:55PM +0100, Stephen Warren wrote:
> On 11/06/2013 12:53 AM, Duan Jiong wrote:
> > This patch fixes coccinelle error regarding usage of IS_ERR and
> > PTR_ERR instead of PTR_ERR_OR_ZERO.
>=20
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>=20
> > @@ -199,10 +199,7 @@ int tegra_bo_dumb_create(struct drm_file *file, st=
ruct drm_device *drm,
> > =20
> >  	bo =3D tegra_bo_create_with_handle(file, drm, args->size, 0,
> >  					 &args->handle);
> > -	if (IS_ERR(bo))
> > -		return PTR_ERR(bo);
> > -
> > -	return 0;
> > +	return PTR_ERR_OR_ZERO(bo);
> >  }
>=20
> I suppose that's fine, although I wonder if it'll cause churn should we
> ever need to add code to the tail end of the function.

It's unlikely that we'll ever need to add to this function. But I'm not
a big fan of PTR_ERR_OR_ZERO to be honest, so I'll let this sink in for
a bit before applying.

Thierry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSgHfrAAoJEN0jrNd/PrOhMeAQALnS9eyP+UcJtjTUpY+ASuRb
tn/z5ii3p2X4H0q3/SF2xJ/DcrpbiNqgD5ARf4atIJUDpV1uXSf8YwfW2qOtteNG
OTc0TOYQse+RbYNUCVdKzQhqJuGDpk+3yuu6Z0H0WWRUDzPxhc6P2dYfkLyUCvQN
J7m7lTlpk6f78/EmDEIqgR8MhimfNcam824PzZLTIp2fFGJaKt9Ala5tzgLzzIyB
LGjXGjXbWt3TGEptmqh/lEwvPKWMbjlQLSy3R8XRcThRtOBI2rHZFHJKItGVbX+g
4cLK4cNp7evQNo11d3HXlbPch28uehi7OeL4iejlUQKtMNEtya5xHUoY8EOSw/Ke
Rx9n0gDaIF/BFyVkJ7AY8ZNej07uXwQ7zz29DZmIqVR/FK9VhiRLPC8BKe9vt0UD
aW9EmlVHKSuAIuIaAwN8w0pPC75qH+eQevNMXSdd4XmEfPfdp/rrtlrgogNnzdSB
110ulE3FUkBlIP+j/3oa+NVER8MaYjhg/+ooynFM8QdqZQANCeS8KkAqwBTznOQP
EK9zV2L9ga8vEcdzOO0se6/zXmkAli9NUsA3aJd1F/s7cA8ZA4JdwBLWvlJOlU0u
QMe6COA8w9leqBYt/U8GE513UUk6kpma4RotLd6GHQZbIkruQe9bwBwy/DUBVK3Q
8mKvDantL1Q/g+fooZL1
=sY6f
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
