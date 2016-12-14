From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 14 Dec 2016 15:39:12 +0100
Message-ID: <20161214143912.GA30280@ulmo.ba.sec>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214111617.24548-2-mperttunen@nvidia.com>
 <1481715331.2313.28.camel@pengutronix.de>
 <20161214134833.GA29981@ulmo.ba.sec>
 <1481724116.2313.39.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481724116.2313.39.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 03:01:56PM +0100, Lucas Stach wrote:
> Am Mittwoch, den 14.12.2016, 14:48 +0100 schrieb Thierry Reding:
> > On Wed, Dec 14, 2016 at 12:35:31PM +0100, Lucas Stach wrote:
> > > Am Mittwoch, den 14.12.2016, 13:16 +0200 schrieb Mikko Perttunen:
> > > > Add a new IO virtual memory allocation API to allow clients to
> > > > allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
> > > > required e.g. for loading client firmware when clients are attached
> > > > to the IOMMU domain.
> > > >=20
> > > > The allocator allocates contiguous physical pages that are then
> > > > mapped contiguously to the IOMMU domain using the iova_domain
> > > > library provided by the kernel. Contiguous physical pages are
> > > > used so that the same allocator works also when IOMMU support
> > > > is disabled and therefore devices access physical memory directly.
> > > >=20
> > > Why is this needed? If you use the DMA API for those buffers you shou=
ld
> > > end up with CMA memory in the !IOMMU case and normal paged memory with
> > > IOMMU enabled. From my understanding this should match the requiremen=
ts.
> >=20
> > We can't currently use the DMA API for these allocations because it
> > doesn't allow (or at least didn't back when this was first implemented)
> > us to share a mapping between two devices.
>=20
> Hm, maybe I'm overlooking something, but isn't this just a matter of
> allocating on one device, then constructing a SG list (dma_get_sgtable)
> from the buffer you got and use that to dma_map_sg() the buffer on the
> other device?

Yes, that would work. What I was referring to is sharing framebuffers
between multiple CRTCs. Back at the time when IOMMU support was first
added, I tried to use the DMA API. However, the problem with that was
that we would've had to effectively dma_map_sg() on every page-flip
since the buffer is imported into the DRM device, but there's no call
that would import it for each CRTC only once. So when the framebuffer
is added to a plane, you have to map it to the corresponding display
controller. And the dma_map_sg() was, if I recall correctly, on the
order of 5-10 ms, which is prohibitively expensive to do per frame.

It's also completely unnecessary because all CRTCs in a DRM device can
simply share the same IOMMU domain. I can't think of a reason why you
would want or need to use separate domains.

Back at the time this was something that the DMA API couldn't do, it
would simply assign a separate IOMMU domain per device. It's possible
that this has changed now given that many others must've run into the
same problem meanwhile.

> Maybe doing the firmware buffer allocation on host1x (with a 4GB upper
> bound) and then sharing the SG list to the devices?

That's pretty much what this API is doing. Only it's the other way
around: we don't share the SG list with other devices for mapping, we
simply reuse the same mapping across multiple devices, since they're
all in the same IOMMU domain.

> > The reason why we need these patches is that when IOMMU is enabled, then
> > the units' falcons will read memory through the IOMMU, so we must have
> > allocations for GEM buffers and the firmware go through the same
> > mechanism.
>=20
> Sorry for maybe dumb questions.
>=20
> Do you have any engines other than the GPU that can handle SG
> themselves?

No, I don't think so.

> Wouldn't you want the GEM objects to be backed by CMA in the !MMU
> case?

That's exactly what's happening already. If no IOMMU is available we
allocate buffer objects backing store with dma_alloc_wc().

> How are ordinary GEM objects different from the falcon firmware?

They're not. I think we could probably reuse more of the BO allocation
functions for the firmware as well. I think Mikko already agreed to look
into that. We might have to add some special cases, or split up the
helpers a little differently to avoid creating GEM objects from the
firmware buffers. We wouldn't want userspace to start mmap()'ing those.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhRWY4ACgkQ3SOs138+
s6GX2A/+Ok5ao5n9Ufz/FN4QCmIcma5pWzeHZw+YZTayAGKhBuFcNmsMl28aer1n
eNif88JA/PRKD8nq5C4klTY5avQOiqiPogQXS0H5LpBoY2wuDLHVrEC9fZ6TCBTi
ypSvUbZ4UhypYTThzAc7DX9U1sdF1coGghMLi5DXUENv1TLCoKVYuO9fKylhwKYu
brWjMMVotnEA2Uno+8YURdESkcuNUaIjqdRR10Fd/hv6O1ra2SzzoVrzPVOIuHUt
KjETQ3qHLV95Mm4aj/WygkeZrRIkfrcgaWhuCKlV0kfuNUp6dTF+QNuAXoykS9T1
wB21Wn9wodYWDusMUUaSWH2LV8O+QGq0U1kLopcLS0+zwuB1EjSHch/LVeL7Xf2v
FC4W2tJ2ixbaysQ/hxuAWniE1Z3Ao9ogpF4lrwgH/tX3ILREz/qHB1aiEX9zvoXA
wVMzF0cBwOrZBj6466AA0WUAndz6G+hdiVcy+3iQeIOsuUcnAlJ3CXoIVIGxT8oV
fRLdl4rtMew9YUMXO9kdz3yTqEXkuRxcUjCX71u6Ws+eeIB56T5iAG/iIl4pR2HO
+EIC9uA9XcGuWqXrYkYHr97Dqdk6cY8M+kUIH+yPzycu7LyHlP3geos+rOp0vjnR
Soe0RXPuSQDWv5ba5Lvmbi8C1qOqn0FzYEZM10OrUrqL9+RfGig=
=/5fh
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
