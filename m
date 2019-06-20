From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] arm64: tegra: Fix AGIC register range
Date: Thu, 20 Jun 2019 11:13:07 +0200
Message-ID: <20190620091307.GF26689@ulmo>
References: <20190620081702.17209-1-jonathanh@nvidia.com>
 <20190620081702.17209-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620081702.17209-2-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 09:17:00AM +0100, Jon Hunter wrote:
> The Tegra AGIC interrupt controller is an ARM GIC400 interrupt
> controller. Per the ARM GIC device-tree binding, the first address
> region is for the GIC distributor registers and the second address
> region is for the GIC CPU interface registers. The address space for
> the distributor registers is 4kB, but currently this is incorrectly
> defined as 8kB for the Tegra AGIC and overlaps with the CPU interface
> registers. Correct the address space for the distributor to be 4kB.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-5.3/arm64/dt, though I also added the following Fixes:
line:

Fixes: bcdbde433542 ("arm64: tegra: Add AGIC node for Tegra210")

Thanks,
Thierry

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTiIACgkQ3SOs138+
s6GY4w/+MMaim+cU/P4jt3haccBqVOz26dTGf4DqXEF/agrQwv0CwCOuwWjUxzLY
enl2a+nzqXC6UwHRetCeL+En/ul0nbmF8+4OptO+gFd5t6E2T+bcV6KeV7DxrfMp
uTWAwiQctbDqJjRJ2dv1weTTfbpC/hEtd4VmbPW7R62z5FEC+EmUcOFbIQql3XuK
6No6LVFDiCvV+8p4zHpbNEmfm/glVzsoV/CjS/rGVszfGteG1+dNX2gt5ASuxjFB
5XyN9z2NSzkQat9sMKMk56EY1xC+HuHi5ZlZboReTxf9wq/3rpofyalMoeWcm4RV
rzNWNXU5yWoII8L4CR80WsGV4BphyklkzFUgC61Z7MXu/STIGrTPB3U9vbJdBNov
kidAGdL1u+ya9cvrBB3St+G9P+rsYIGAgZY0yePBTlXRSUYbYkfSiyiKiDVdE1LM
riiaB4gqMpxchLlY0AcUf0gGep+1z+eOTmKng2EmEbSAF1D3WW7r48EMyctvhRo/
3jHaWe3K8uzYVT3eYANyAWK3pacyWFPjVSZTbFJ9taLZIKsKXj7LQrclZGZ79NvN
QOxbQepxdHyMgJ+ZeueB+vbspaMpcmAfNhrcmlZ9oeFU2EDTjqCJfy4Tw8yEaKwn
zK39Mhin/EY8vr76fV8k2Oz644MiCxV4zyz31F/b+TRisRf7AI4=
=Gdxk
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
