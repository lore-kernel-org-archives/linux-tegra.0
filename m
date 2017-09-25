From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Replace dev_* with DRM_DEV_*
Date: Mon, 25 Sep 2017 09:38:41 +0200
Message-ID: <20170925073841.GA12494@ulmo.fritz.box>
References: <1506271437-23058-1-git-send-email-harshasharmaiitr@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506271437-23058-1-git-send-email-harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2017 at 10:13:57PM +0530, Harsha Sharma wrote:
> Replace all occurences of dev_info/err/dbg with DRM_DEV_INFO/
> ERROR/DEBUG as we have DRM_DEV_* variants of drm print macros
> Done using following coccinelle semantic patch
>=20
> @r@
> @@
>=20
> (
> -dev_info
> +DRM_DEV_INFO
> |
> -dev_err
> +DRM_DEV_ERROR
> |
> -dev_dbg
> +DRM_DEV_DEBUG
> )
>=20
> Signed-off-by: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>  -Break line over 80 characters
>  -Changes in comments not required

Please don't do this. Most of the functions that you're trying to
replace here are not DRM_DEV_*() for a very specific reason: none of
them have anything to do with DRM/KMS in particular. This is important,
in my opinion, because these messages are very device-specific and the
additional information added by the DRM format string aren't useful in
the context.

Perhaps the only ones I consider to be good candidates for this
conversion are the ones in drivers/gpu/drm/tegra/fb.c because they deal
with the DRM fbdev setup and hence are not device specific. And even in
those cases I'm not sure we gain very much by this conversion,
especially since most of the replacements now end up having to split up
argument lists.

Sorry if this isn't documented anywhere. I also suspect other driver
maintainers will be less picky about this sort of thing, so you might
have more luck there.

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnIsn4ACgkQ3SOs138+
s6G/ehAArmURYZKqKKYoGJHDf0BQQXrr5S0e9jC23G2G9Ka3H7wy3vP99NzSubLX
U0YJXIR0bLK/g/q0GaOCb9KMG3Wdqs3CNbovKPf0s34/lgsSgU7OLhGo78p3mkD1
JTNgTeaffNvXnmO9tbcsKHYK+A6fVa4F4oxZpSO/zmAxtMsPQUIMqFcVON9g4GPl
oqvy02477gfCNkdI1ZysxXyI9C8ioKeuGAN8IF0NWroQOkxmu/hQ70DC+lhDNlOU
3Dep2p5tyfVj2MRXgE5gWl4rxtmSlXg+kYZuQpYH58NbYL7V5cVQlQzWmWa9njiM
yAdD1V1m1wYA/P5VV8RpVvmMAB5NoPwfXdbgRvRmQdeY/E84Nf33LM83OJo3yFc4
6ef7T5w0s93BxUGg/BPdpuEUgSCZjMhlxFhN2kaSvF9OO6MKpPkrAHRqvj2LuY9x
Vi6f/OI8CRRlZ3Gv27FmYb6RKTkjiM+uKswviiw/A35Nw8FdA1X4h7XEiA2/nQSW
Zbxo4BRhwGzPenn03yw/NQNVRZm39wYC6o2BBV91cBGcSpprtZk8teF/LM8ilLRt
p5+JSkjVey82k7eOrs1f6PROfWXLngsxUa/lyaIDOdSzRJOqr26nDkDfE+sx2vSs
kQbtbYy1+GkowenQFOA5ND4eNFCOyUoYDgxapvl4/Rhn+FirNMw=
=ci1u
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
