From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/7] drm/tegra: Add Tegra DRM allocation API
Date: Wed, 14 Dec 2016 14:48:33 +0100
Message-ID: <20161214134833.GA29981@ulmo.ba.sec>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214111617.24548-2-mperttunen@nvidia.com>
 <1481715331.2313.28.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481715331.2313.28.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 12:35:31PM +0100, Lucas Stach wrote:
> Am Mittwoch, den 14.12.2016, 13:16 +0200 schrieb Mikko Perttunen:
> > Add a new IO virtual memory allocation API to allow clients to
> > allocate non-GEM memory in the Tegra DRM IOMMU domain. This is
> > required e.g. for loading client firmware when clients are attached
> > to the IOMMU domain.
> >=20
> > The allocator allocates contiguous physical pages that are then
> > mapped contiguously to the IOMMU domain using the iova_domain
> > library provided by the kernel. Contiguous physical pages are
> > used so that the same allocator works also when IOMMU support
> > is disabled and therefore devices access physical memory directly.
> >=20
> Why is this needed? If you use the DMA API for those buffers you should
> end up with CMA memory in the !IOMMU case and normal paged memory with
> IOMMU enabled. From my understanding this should match the requirements.

We can't currently use the DMA API for these allocations because it
doesn't allow (or at least didn't back when this was first implemented)
us to share a mapping between two devices.

The reason why we need these patches is that when IOMMU is enabled, then
the units' falcons will read memory through the IOMMU, so we must have
allocations for GEM buffers and the firmware go through the same
mechanism.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhRTa4ACgkQ3SOs138+
s6Gmtg//aSBhAQsKvSMaS2nw3p/+/r1V87zrmHPIGorjM1p68o8PRdSYoD+8S76T
Aj80WXu1DBr+PpdHBmA7JOF2NfIWWgkaKU40honwROPefs6rFMjLsP5MzfEsfGb3
wWqSUVeUCPmAmt3BjQ806pvzFZIXzZy4tQ4SJXkpwyCGMws4xYxWsCnuGK30gRtv
FF6DVWPaQOQhFuoyxe7UaorZyhFuel/ebk1N1kroIkTZ/P/z8hb3DL5gyvwczAxK
jEjmlQZVg5SLa4NpNHZCp61FuRqFLDATAx5gc0faWTXWJxlJ+Rd/kQ7nL38C2No6
kRnfQfIVg4x84iMUFN38rQ44yNbgHfJwghpt4zfVXWaxCQJ5j9r9Rhaf09DwHC60
pgdvAnVJ4qcIxwN0lrVMdsvkqfAtrwF/WSLtaXP7btdBp2ST+BsC7uHey+64ksx7
sya+nHGAaUBUlU7mr4kD+iXz/vue8VImUkWJsN1qOvcK9q20evlBgNhwLaNza02w
Vb+t9eA4SYqHQVbxKE7LJLdlc1JgNL0vcOxWUxHv3ZMSXkqxHr3iFr2P+epK63vA
8dOSwBDPdDzDei/cXaQYDNVBv8wzMQzMYdpqqKv6nyYpmv0KGlBUtUT4oq/25qM+
VpBf/xQNr/hYUVknFKtb1foBqspYJjfXh8X1syeYjrJHsc6ENpI=
=lpz1
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
