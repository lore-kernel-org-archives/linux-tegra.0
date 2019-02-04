From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Mon, 4 Feb 2019 09:04:18 +0100
Message-ID: <20190204080418.GB19087@ulmo>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 09:07:45AM -0800, Sowjanya Komatineni wrote:
> This patch adds DMA support for Tegra I2C.
>=20
> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
> transfer size of the max FIFO depth and DMA mode is used for
> transfer size higher than max FIFO depth to save CPU overhead.
>=20
> PIO mode needs full intervention of CPU to fill or empty FIFO's
> and also need to service multiple data requests interrupt for the
> same transaction. This adds delay between data bytes of the same
> transfer when CPU is fully loaded and some slave devices has
> internal timeout for no bus activity and stops transaction to
> avoid bus hang. DMA mode is helpful in such cases.
>=20
> DMA mode is also helpful for Large transfers during downloading or
> uploading FW over I2C to some external devices.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V9] : Rebased to 5.0-rc4
> 	Removed dependency of APB DMA in Kconfig and added conditional check
> 	in I2C driver to decide on using DMA mode.
> 	Changed back the allocation of dma buffer during i2c probe.
> 	Fixed FIFO triggers depending on DMA Vs PIO.
>  [V8] : Moved back dma init to i2c probe, removed ALL_PACKETS_XFER_COMPLE=
TE
> 	interrupt and using PACKETS_XFER_COMPLETE interrupt only and some
> 	other fixes
> 	Updated Kconfig for APB_DMA dependency
>  [V7] : Same as V6
>  [V6] : Updated for proper buffer allocation/freeing, channel release.
> 	Updated to use exact xfer size for syncing dma buffer.
>  [V5] : Same as V4
>  [V4] : Updated to allocate DMA buffer only when DMA mode.
> 	Updated to fall back to PIO mode when DMA channel request or
> 	buffer allocation fails.
>  [V3] : Updated without additional buffer allocation.
>  [V2] : Updated based on V1 review feedback along with code cleanup for
> 	proper implementation of DMA.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 368 +++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 335 insertions(+), 33 deletions(-)

With Dmitry's concern addressed:

Acked-by: Thierry Reding <treding@nvidia.com>

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxX8gIACgkQ3SOs138+
s6FdBRAAljL851+MhkfgLrJED3I1QmDxpTzTGRJt5DtAPY3nF4dWxHOjt1uhxmJ4
BV7Rvv/Yziq44k6vpigP5KvKUbAQKVBqXtfIEhGoosrjDP/WHoKGjeX4+Pp1JFPS
/4gxh5UE1EzJSuwT0sUEnzOgqKvpdPSMILlKniZzYJjlmEkSNp2LE7r1sAYJW3xZ
fUoi05jA6CsExJwu9Jcc57rK4aFQVoxVzxhcFmHacegYRI2w0xCRmzGiuTt69m/X
XGOwtsFyhekle50DMY/ag2pLVWmDCBNbd0QdBSAQElcocZdKo7pTCg9NJeSTIVYK
edJuMsdCG+A+A2gYfQNjF1oYdJ8+LbIMQkXLqeANi3PvlbgYWnfCEUq6wWf8y2pm
7cVIFedQjWgAQk08pR6uJH/hepCIWldsjYNGhtt1BzCABzep75OZ20qvK3p18WQ7
dCRNZOgbcQIpT1CDVCSs5AymdzF9ukMVzPVkTV8jNXPSkZ3XtqepfyfSzKXemJOl
74QWgbFNEJFFZi1F2852LmxDhEuGQFRDu3zcF7VDNY00wN7RFyxO7IlTZf8WE334
99cwCAskBZMeZ1YoMNJUe4yvhlUWP0bDRB2H6SqCIPQsVGC30OZnJmo8agOTuQ87
e5aY4u90CFWf4Tx+ekOnP6hlcncOrNt2cxZARNw1zHJ/8vXbG6Q=
=miRE
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
