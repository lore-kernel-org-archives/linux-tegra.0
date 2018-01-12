From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Add support for fence FDs
Date: Fri, 12 Jan 2018 17:04:22 +0100
Message-ID: <20180112160422.GA7982@ulmo>
References: <20180111222249.29105-1-thierry.reding@gmail.com>
 <151575361658.23681.15835882826597063093@mail.alporthouse.com>
 <20180112151438.GD19999@ulmo>
 <151577153600.24367.14807966085718429746@mail.alporthouse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <151577153600.24367.14807966085718429746-M6iVdVfohj6unts5RBS2dVaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 03:38:56PM +0000, Chris Wilson wrote:
> Quoting Thierry Reding (2018-01-12 15:14:38)
> > On Fri, Jan 12, 2018 at 10:40:16AM +0000, Chris Wilson wrote:
> > > Quoting Thierry Reding (2018-01-11 22:22:46)
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > This set of patches adds support for fences to Tegra DRM and comple=
ments
> > > > the fence FD support for Nouveau. Technically this isn't necessary =
for a
> > > > fence-based synchronization loop with Nouveau because the KMS core =
takes
> > > > care of all that, but engines behind host1x can use the IOCTL exten=
sions
> > > > provided here to emit fence FDs that in turn can be used to synchro=
nize
> > > > their jobs with either the scanout engine or the GPU.
> > >=20
> > > Whilst hooking up fences, I advise you to also hook up drm_syncobj.
> > > Internally they each resolve to another fence, so the mechanics are
> > > identical, you just need another array in the uABI for in/out syncobj.
> > > The advantage of drm_syncobj is that userspace can track internal fen=
ces
> > > using inexhaustible handles, reserving the precious fd for IPC or KMS.
> >=20
> > I'm not sure that I properly understand how to use these. It looks as if
> > they are better fence FDs, so in case where you submit internal work you
> > would go with a drm_syncobj and when you need access to the fence from a
> > different process or driver, you should use an FD.
>=20
> Yes, simply put they are better fence fds.
>=20
> > Doesn't this mean we can cover this by just adding a flag that marks the
> > fence as being a handle or an FD? Do we have situations where we want an
> > FD *and* a handle returned as result of the job submission?
>=20
> Probably not, but if you don't need to force userspace to choose, they
> will come up with a situation where it is useful. Though one thing to
> consider with the drm_syncobj is that you will want to handle an array
> of in/out fences, as userspace will pass in an array of VkSemaphore (or
> whatever) rather than compute a singular dma_fence_array by merging.

It's fairly unlikely that Tegra DRM will ever need to be able to deal
with Vulkan (I'm not sure if the pre-Tegra124 GPU is capable of it). But
you're right, might be a good idea to plan for this anyway since it
isn't really complicated and we still have a few reserved bits left.

> > For the above it would suffice to add two additional flags:
> >=20
> >         #define DRM_TEGRA_SUBMIT_WAIT_SYNCOBJ (1 << 2)
> >         #define DRM_TEGRA_SUBMIT_EMIT_SYNCOBJ (1 << 3)
> >=20
> > which would even allow both to be combined:
> >=20
> >         DRM_TEGRA_SUBMIT_WAIT_SYNCOBJ | DRM_TEGRA_SUBMIT_EMIT_FENCE_FD
> >=20
> > would allow the job to wait for an internal syncobj (defined by handle
> > in the fence member) and return a fence (as FD in the fence member) to
> > pass on to another process or driver as prefence.
>=20
> Would be easy, if you are happy with the limitation of just a single
> wait-fence.

Yeah, the obvious advantage here is that this is totally trivial to
implement both in the kernel and in userspace. Extending it to an array
requires introduction of an extra structure (for a <fence, flags> pair)
and a u64 for the address and a u32 for the number of elements in the
array.

Another thing I'm wondering is if we can't simplify this somewhat by
only supporting syncobjs and then use the SYNCOBJ IOCTLs to convert to
FD if it turns out that we need it.

Let's say we have a use-case where we decode an video frame using a
hardware decoder (which we don't support upstream yet). The decoder
could signal completion using a syncobj. Userspace could then grab the
handle for that syncobj and pass it back in as prefence for a job that
does post-processing using VIC. They both are behind the same DRM
device, so the handle can be resolved properly. The VIC job could then
return a fence via syncobj handle. But in order to pass it to KMS we'd
need to convert it to an FD for synchronization. But we can do that
using the SYNCOBJ IOCTLs already, so there's not really a need for the
SUBMIT IOCTL to support emitting FDs, right?

Given that KMS and VIC are behind the same DRM device, would it be
reasonable to allow KMS to take a syncobj handle as in_fence_fd (perhaps
via in_fence_handle property)?

Thierry

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpY3IMACgkQ3SOs138+
s6G2Dw/8C3Q+m9E7YWRRa1AgIAtBeCji4YaDR4zH5lcdzFg7ksDmdQUFyoDLoMSQ
VYfGhCbdE9nNwDU1BkA5LmIDdNLaBqxi6qNnLNb5cbcpuJ00MLAZzKRArxzu/9gz
Jtun/tB2Xi6I4dRFon2BEkEQrIg/jQG4V6vHsOqa8UfAzkZI2p3cXCieK3AyuruH
gz6C3JQDiAfprNO1WXvyWBzPJvnSqiha0VIvLEt7V6m37v0C5Mn3FAc1PnJAywbH
H9xq788QBLR3o09WZZDNxVWGNC3WHjPST0QapJ8P3VrxuGs+KAqCIhVYEC4HCO7l
2rFAAne2mlC4tu+PuS8g8EZHLd95/nSMxr2ZP5in9rtpJlV2o8bXRjxD1Kh83pG/
QstEsWVkEigzsgC0AA1A2iqY6KReb6dHanw7V5Grt7+CMl8UWoI+TBj5BqGyq8IK
D5NeA9QrsZcgwIlJwWa5Yhhe3OhbMiSJWacfilpku2F5ispV/UKL4HAw2wAKHe5j
62IBPtXpte6B9OON5gK1uZqPBOLIWuoBOK6uYeETh1LGHQPulRYnVmjybzM8FqLW
aC2MZYVfOUgc12OLZos5Ui/xSMCBgVMwxaQjn7Q0SZUxji9INUJedP3N99Yk5sGw
0tCDImgkGh//jT/r6VeM30aYpnmSwQEb5x90VQjQb9NqHLSWxCk=
=cY73
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
