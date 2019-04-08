From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/6] usb: host: xhci-tegra: Add Tegra186 XUSB support
Date: Mon, 8 Apr 2019 10:17:39 +0200
Message-ID: <20190408081739.GB6644@ulmo>
References: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401104050.31355-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 12:40:44PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> This series introduces support for XUSB to the Tegra186 SoC. This is
> mostly the same as on earlier generations in that it provides an XHCI
> compatible interface with a bit of vendor-specific glue. Perhaps the
> most notable change is the removal of the IPFS wrapper. Patches for
> the UPHY related changes that control the PHYs for the XUSB controller
> were merged into v5.1.
>=20
> This version is a rebase of the series posted here:
>=20
>     http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D88193
>=20
> There have been no code changes and I collected Reviewed-by and Acked-by
> tags.
>=20
> Greg, can you pick up patches 1-3 with Rob's and Mathias' Acked-by,
> respectively? I'll pick up patches 4-6 into the Tegra tree.

Hi Greg,

would you mind picking up patches 1-3 of this series?

Thanks,
Thierry

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrA6MACgkQ3SOs138+
s6HZIQ/+IDrPopch617P4krSq4RRYSipiePmD/iKvBjodWR/t/npMJJLji9bckIp
PIE9KSBY1FqcYo9txWx6jy03WU1JhPvHimYyq4DwDPytI+BjJc/qsXHqDQep8QxT
ENuG2A/k0ANmZInPeM3Y3YK0C1fVudXOA9YT5aBJ51cyp34UFYPOWleIKDoRgi7A
L1mnbo45EsW7zs1eiDOHIVQhGr8XYFDQrnU8FozHD3VJG2D18InhRvwMTLIJnSZa
DDnA2qfIgaaWWcWvN0tcTsBd1WEXLsYMrSUdBj1/wJOV6qFfixCKSduWkxbNcEP/
/5vybxYJg1pAA6eTYCdLPmOkwNOhAo5iOvmaFqCm0132SWNaLmg63G7q9WWE3DZa
GmV8oTndXLZohpLqQw9IwTnyMFeOUeFw0HoEUFgx7mHbbDQjNUB6JZMiY/GaBpHi
ITE5dPt5DXQJ89i3Bv3uHI4X47U8WsjECm5XrIfD/NBYxXXOiaiGZERpedcQUbeQ
VWRhxK783b9ovlqaU5CrDX+bahG4fg2K3pXc5hdM/L6z5SK97cNGn4C2dT+y4ej4
GXq5bGhZSbTkqcvqNGxVFNhwY+fSucZnZxg+k7Mmp7Bg/K9iX0uIPnYhe+wgPFQB
C+6M3VVnggmJcshMx16vFD+Py3nT57tpjy2gI7X1QoAawpHTtS0=
=1XCU
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
