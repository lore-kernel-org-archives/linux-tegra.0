From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Add support for fence FDs
Date: Fri, 12 Jan 2018 16:14:38 +0100
Message-ID: <20180112151438.GD19999@ulmo>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
 <151575361658.23681.15835882826597063093@mail.alporthouse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <151575361658.23681.15835882826597063093-M6iVdVfohj6unts5RBS2dVaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 10:40:16AM +0000, Chris Wilson wrote:
> Quoting Thierry Reding (2018-01-11 22:22:46)
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This set of patches adds support for fences to Tegra DRM and complements
> > the fence FD support for Nouveau. Technically this isn't necessary for a
> > fence-based synchronization loop with Nouveau because the KMS core takes
> > care of all that, but engines behind host1x can use the IOCTL extensions
> > provided here to emit fence FDs that in turn can be used to synchronize
> > their jobs with either the scanout engine or the GPU.
>=20
> Whilst hooking up fences, I advise you to also hook up drm_syncobj.
> Internally they each resolve to another fence, so the mechanics are
> identical, you just need another array in the uABI for in/out syncobj.
> The advantage of drm_syncobj is that userspace can track internal fences
> using inexhaustible handles, reserving the precious fd for IPC or KMS.

I'm not sure that I properly understand how to use these. It looks as if
they are better fence FDs, so in case where you submit internal work you
would go with a drm_syncobj and when you need access to the fence from a
different process or driver, you should use an FD.

Doesn't this mean we can cover this by just adding a flag that marks the
fence as being a handle or an FD? Do we have situations where we want an
FD *and* a handle returned as result of the job submission?

For the above it would suffice to add two additional flags:

	#define DRM_TEGRA_SUBMIT_WAIT_SYNCOBJ (1 << 2)
	#define DRM_TEGRA_SUBMIT_EMIT_SYNCOBJ (1 << 3)

which would even allow both to be combined:

	DRM_TEGRA_SUBMIT_WAIT_SYNCOBJ | DRM_TEGRA_SUBMIT_EMIT_FENCE_FD

would allow the job to wait for an internal syncobj (defined by handle
in the fence member) and return a fence (as FD in the fence member) to
pass on to another process or driver as prefence.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpY0NwACgkQ3SOs138+
s6FEXRAAr2mEO8C8e7Yw9o0kI/NNiRFUCyytINg3CUF4gfDUUnKrcc5kn6YOedOM
xveDUPUe2DURCpRb7YTx6ahoX81BQGJHg39KsvgvNWQgU9qXjMB9sY+yz8I6nnFa
4T203oseAeCSieoxs0fYQ4a27jK3srg8HLe1zacqNNmjLl4TF2GrPlgm9XeXZHNX
eOVHtjrYwwKOORcpH6aTStZ3AWnj70FBPXSe0VvV+sJKt8APyRhx5MgIanvO0QmR
L45um8ROZC0to2ODjstsqk19W/s2Y3H0SmJcRIHC4rvpX9Pt4NZ9AJsFfQkkHh3C
8O4wjedxNVkXcZJlkSvyKgt7l2EE/Ax3dHsEV0oAvnzuOTOi3c8hGm9IIUBCD30w
f4Gg+4cHTStGPlnq8ddtHv+Ke7ZetP5L9pw642xEd+j8Py1oRPcvtPg1RH9/enXE
cO3xdP2uw0GQSiwnjskdR3tcR2wGNGGYHnYcoI1hGDo/CcdrIBevFLWvXdkUl+rY
L4NrJu3g6zFaS5GE5cqjAzwDne6wEMPrgp+biwEARplcvrsHqKmW3FC+QC2cvU1A
3Q5/RXnhrZ9bM90HorB6Ed/EF6V0IIGDlVwDDRo5DlPN3Wdt/zOAJsW2N/Jfpywf
ofUVUKfIK5cTu497lh9KCa9cSBIHi9wlNvSl436PdC2BxzWXwxM=
=m7Tm
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
