From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V11 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 15:53:43 +0100
Message-ID: <20190206145343.GA3651@ulmo>
References: <1549356985-25726-1-git-send-email-skomatineni@nvidia.com>
 <1549356985-25726-3-git-send-email-skomatineni@nvidia.com>
 <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 05:26:25PM +0300, Dmitry Osipenko wrote:
[...]
> Oh, another important moment is that physically contiguous dma_buf
> allocation isn't guaranteed by the DMA API. This may become a problem
> for T186+ that can transfer up to 64K. We need to enforce the
> contiguous-allocation requirement by using
> dma_alloc_attrs(DMA_ATTR_FORCE_CONTIGUOUS) instead of the
> dma_alloc_coherent(), please see my other comment below.

Actually I don't think that's necessary here. DMA_ATTR_FORCE_CONTIGUOUS
only seems relevant if you've got an IOMMU attached to the device to
make sure the physical memory is also contiguous.

See this extract from Documentation/DMA-attributes.txt:

| DMA_ATTR_FORCE_CONTIGUOUS
| -------------------------
|=20
| By default DMA-mapping subsystem is allowed to assemble the buffer
| allocated by dma_alloc_attrs() function from individual pages if it can
| be mapped as contiguous chunk into device dma address space. By
| specifying this attribute the allocated buffer is forced to be contiguous
| also in physical memory.

We don't have an IOMMU attached to I2C or APBDMA, so this can't happen
and even if we had an IOMMU attached, all we care about is the device's
DMA address space, which means IOVA space, and that would still be
guaranteed to be contiguous, according to the above.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa9PQACgkQ3SOs138+
s6GXdxAAjiGTq2n2wDf3exYGm44xiRYZamLgBXNrBSkvWArfYxh03oyDAdvc1Jz4
dNfY7pS4anqMXJ8EN6klhOkKDCZVt1mYqa2HHMOf/RMkJIgg/wC/4EfkJOKA8NdK
L0YukWOj+6yR3EYU5wcTrH3K2wdfIr7OxSyecEuJPmcvMyCPQNW3M6gts9rXxCTn
WRBHrFWECGBrcv0D6cUKq5iNVIYPiY0GgTyvL0IB7/xY1UUyn59cO6wIegDThSog
W29/uu/Lumc4UOrRJFq5VqRJGn+n4XNqFJ/5M4YMTRyThtzpWXui9zcmWroRh6be
V1lMJMhfXSs66/fM73LXWtELGxJQgl/8Q65/23Wkmy0OnvnNo2UrLG18fip7QTLL
5agQz+iHYqDzQaRO0Dlh6gMHOBLtA4gqJ7lVYYKfbK4kylVNqXBFjjC45NRnxZTp
1VWRD1MpHe9oVDj7YrJuMkrCC9AK8zrK/uKerfhvOugTOjsQwyg6RotSsAsSqbuv
KKLl3gSs8ZqrACXRRzhdQk9sGdznglid5+Qu+YPVqkDt1czXIbXOfphSWq8OHsZH
NbwBAvx2l4tsFnNNkS5OiPhH8PEA9PIw+W3G1Lvti9K/JYyCGl6Ha3xeTkN0D4hM
ceUyM3h+LljcfqMiXYW4gGvx4WPe4CmkHJBL4I5zD35ZcNJKI0A=
=OHcp
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
