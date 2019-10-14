From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property
 to qoric-mc node
Date: Mon, 14 Oct 2019 12:00:25 +0200
Message-ID: <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
         <20190924181244.7159-8-nsaenzjulienne@suse.de>
         <20191014082847.GH12262@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ZhF7YshJftYaREkjx+2D"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014082847.GH12262@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, mbrugger@suse.com, robin.murphy@arm.com, f.fainelli@gmail.com, james.quinlan@broadcom.com, wahrenst@gmx.net, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--=-ZhF7YshJftYaREkjx+2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-14 at 16:28 +0800, Shawn Guo wrote:
> On Tue, Sep 24, 2019 at 08:12:38PM +0200, Nicolas Saenz Julienne wrote:
> > qoriq-mc's dpmacs DMA configuration is inherited from their parent node=
,
> > which acts a bus in this regard. So far it maked all devices as
> > dma-coherent but no dma-ranges recommendation is made.
> >=20
> > The truth is that the underlying interconnect has DMA constraints, so
> > add an empty dma-ranges in qoriq-mc's node in order for DT's DMA
> > configuration code to get the DMA constraints from it.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> Updated subject prefix as 'arm64: dts: ...', and applied the patch.

Hi Shawn,
these two patches are no longer needed. This series has been superseded by =
this
patch[1] 951d48855d ('of: Make of_dma_get_range() work on bus nodes', avail=
able
in linux-next) which fixed the issue directly in OF code.

Sorry for the noise.

Regards,
Nicolas

[1] https://lkml.org/lkml/2019/10/8/870


--=-ZhF7YshJftYaREkjx+2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2kRzkACgkQlfZmHno8
x/7Fhwf+OOorwS/yz7Mxwwgctc4wXslUVL4P1ubRvAEQYZ0UGUVtM1WJqXjukymn
ydYIWe6mnmNSQqGYAEBcjzP/We/MxjMkpvpyMWkiJXiZvwXRs43BAcW5/eyvHNfD
EEF3n4HCXZYSbmR9kDBwpZPKeoMCsQJbZuEF6rHwGNZeKA+tVpMZFEC17BGhW8LW
MGx2W+1mXq7lLuDI5AIfnMt5Cqgl1IcsCzq4a2uRzNLXEDiQ5MFXaHVzroE0wWOQ
O6GCM0HAcnR1wi0pZgEgDQyFQeiI4txKfLZ0P1z8zgVM+bFtNum4qIrtLbYm0Ny0
y7htdJL8WlxXRHkbLVXIj0D71OiRYQ==
=Ip4t
-----END PGP SIGNATURE-----

--=-ZhF7YshJftYaREkjx+2D--
