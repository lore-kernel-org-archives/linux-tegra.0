From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/5] memory: Introduce memory controller mini-framework
Date: Thu, 13 Feb 2020 19:15:55 +0100
Message-ID: <20200213181555.GB1006063@ulmo>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
 <9841eb35-65e4-632a-ceff-bb2ba3b11bb0@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9841eb35-65e4-632a-ceff-bb2ba3b11bb0-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 05:23:23PM +0000, Robin Murphy wrote:
> [+ Maxime]
>=20
> On 13/02/2020 4:39 pm, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi,
> >=20
> > this set of patches adds a new binding that allows device tree nodes to
> > explicitly define the DMA parent for a given device. This supplements
> > the existing interconnect bindings and is useful to disambiguate in the
> > case where a device has multiple paths to system memory. Beyond that it
> > can also be useful when there aren't any actual interconnect paths that
> > can be controlled, so in simple cases this can serve as a simpler
> > variant of interconnect paths.
>=20
> Isn't that still squarely the intent of the "dma-mem" binding, though? i.=
e.
> it's not meant to be a 'real' interconnect provider, but a very simple way
> to encode DMA parentage piggybacked onto a more general binding (with the
> *option* of being a full-blown interconnect if it wants to, but certainly=
 no
> expectation).

The way that this works on Tegra is that we want to describe multiple
interconnect paths. A typical device will have a read and a write memory
client, which can be separately "tuned". Both of these paths will target
system memory, so they would both technically be "dma-mem" paths. But
that would make it impossible to treat them separately elsewhere.

So we could choose any of them to be the "dma-mem" path, but then we
need to be very careful about defining which one that is, so that
drivers know how to look them up, which is also not really desirable.

One other things we could do is to duplicate one of the entries, so that
we'd have "read", "write" and "dma-mem" interconnect paths, with
"dma-mem" referencing the same path as "read" or "write". That doesn't
sound *too* bad, but it's still a bit of a hack. Having an explicit
description for this sounds much clearer and less error prone to me.

Thierry

> > One other case where this is useful is to describe the relationship
> > between devices such as the memory controller and an IOMMU, for example.
> > On Tegra186 and later, the memory controller is programmed with a set of
> > stream IDs that are to be associated with each memory client. This
> > programming needs to happen before translations through the IOMMU start,
> > otherwise the used stream IDs may deviate from the expected values. The
> > memory-controllers property is used in this case to ensure that the
> > memory controller driver has been probed (and hence has programmed the
> > stream ID mappings) before the IOMMU becomes available.
> >=20
> > Patch 1 introduces the memory controller bindings, both from the
> > perspective of the provider and the consumer. Patch 2 makes use of a
> > memory-controllers property to determine the DMA parent for the purpose
> > of setting up DMA masks (based on the dma-ranges property of the DMA
> > parent). Patch 3 introduces a minimalistic framework that is used to
> > register memory controllers with along with a set of helpers to look up
> > the memory controller from device tree.
> >=20
> > An example of how to register a memory controller is shown in patch 4
> > for Tegra186 (and later) and finally the ARM SMMU driver is extended to
> > become a consumer of an (optional) memory controller. As described
> > above, the goal is to defer probe as long as the memory controller has
> > not yet programmed the stream ID mappings.
> >=20
> > Thierry
> >=20
> > Thierry Reding (5):
> >    dt-bindings: Add memory controller bindings
> >    of: Use memory-controllers property for DMA parent
> >    memory: Introduce memory controller mini-framework
> >    memory: tegra186: Register as memory controller
> >    iommu: arm-smmu: Get reference to memory controller
> >=20
> >   .../bindings/memory-controllers/consumer.yaml |  14 +
> >   .../memory-controllers/memory-controller.yaml |  32 +++
> >   drivers/iommu/arm-smmu.c                      |  11 +
> >   drivers/iommu/arm-smmu.h                      |   2 +
> >   drivers/memory/Makefile                       |   1 +
> >   drivers/memory/core.c                         | 248 ++++++++++++++++++
> >   drivers/memory/tegra/tegra186.c               |   9 +-
> >   drivers/of/address.c                          |  25 +-
> >   include/linux/memory-controller.h             |  34 +++
> >   9 files changed, 366 insertions(+), 10 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/memory-controlle=
rs/consumer.yaml
> >   create mode 100644 Documentation/devicetree/bindings/memory-controlle=
rs/memory-controller.yaml
> >   create mode 100644 drivers/memory/core.c
> >   create mode 100644 include/linux/memory-controller.h
> >=20

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5FklsACgkQ3SOs138+
s6GcqA//Q5OUVYrdcTeux/f0EWBv1/pwht0ee1aUsnP4Um8quhAz+gMOpMLLq0Tr
Lxv4wuLKKSd59BfF48NUk7fU91iMLKJTzT1yBxSWvsEc0MIfUPre8PalEToob4oj
TfLrNwEulquUL4aUAEdXUzfpSibr+2cf0Vf0oQMXDIj4TQ5LNc8WtRssWU/joa1Z
jTNrXQ8B0+gA9KXf9/5jA4tzsrFfpxaVQ2oiPBJTxaBS6a1VSGhCfk64Fv1Xezv6
NIffcn67mdt2rtI59Pz1YTVEgUqG9E47S+9qwqfgtcRvqE2UoiPHGoOpOevDI2El
LO/muVw5xyROk4X23lhbH9q1IZ8wDefRP0Nt2e5/Fgi1jj899n3GBpFrp4tLIZQ4
OKzxA/yoHOfWqPQkYmE8LY9OZZKYv5vX1E0l7aY7OR78rUpc0oXPptkedP1JVHnX
It3t3YvecvstIl0UxC67b9OlZC4h2kPzqlqF3fc0xOdV1eeLI1G58UzC8phSfoEo
qCOps57BTHR2i4BMXirkvKkb5bbDhGA3qrgX068xGIsw4SDvnQ7y4c5SFTqybqql
eplj55UYCk+JP85/gJ6+sXjEqAnyMIdv6lnGCxmfncIXheSDw0c/D8t00IzpovmO
PX1pak4k8xe0Ub8R6Vg9HRM0IsCSQ8lDrt/whJVWXKU1M74PJlM=
=gwzY
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
