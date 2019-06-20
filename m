From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] arm64: tegra: Update Jetson TX1 GPU regulator timings
Date: Thu, 20 Jun 2019 11:18:36 +0200
Message-ID: <20190620091836.GG26689@ulmo>
References: <20190620081702.17209-1-jonathanh@nvidia.com>
 <20190620081702.17209-3-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620081702.17209-3-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 09:17:01AM +0100, Jon Hunter wrote:
> The GPU regulator enable ramp delay for Jetson TX1 is set to 1ms which
> not sufficient because the enable ramp delay has been measured to be
> greater than 1ms. Furthermore, the downstream kernels released by NVIDIA
> for Jetson TX1 are using a enable ramp delay 2ms and a settling delay of
> 160us. Update the GPU regulator enable ramp delay for Jetson TX1 to be
> 2ms and add a settling delay of 160us.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to for-5.3/arm64/dt, and I added this Fixes: line:

Fixes: 5e6b9a89afce ("arm64: tegra: Add VDD_GPU regulator to Jetson TX1")

Thanks,
Thierry

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LT2wACgkQ3SOs138+
s6EIWg//ZOfSQYRaxiwtqAkQMKHfXrfR26rxjTtrybyAQY/NU1shhUp7o6j1teYE
4gCLySuu04WRQQJUfogtufH4GJvYfmY9WOC+6sJAiCB1adKvQQ2beSl2fCO8Emj6
Isk7rE6hOoj+XKysoMDzhAi+8uK61dcRAAeYRjLIRRB1rsXO273FRfT4TYLZodRm
xEUH5jKhaWrhSi8fhJzxjzApuMYHDpB3Oll5tWlucJwms6IltRvXyRomYa4ktmC7
l8D3s3DpKt/HwDztLSIZOi3xP5qpPo5jPujNIBcqXwPOuIqvkKdqU/T5YudvHpHQ
c7Sg/WOF0vhCb1Nt6CKEMuwZg8FHyFHHm3xMmRPdK5Q+Vqr+30jElLwIOrjn9lsk
IfJjfQZ5psUrHG8zerCcvJOHaZ8I+CKBEYcmyqPOJy7poXBRyppvM5HxuxCBt60H
l0LAQpfMGFx7ZzJdzUzLedujp2ZjlGo3zZi1/LIU0fkPe/f9afF24lN7Gsjn7An1
yJkiK30cceof2bklpNr+QY1bsWJJFRrJ+m4/StkaOaZAxxNAoI+o+4xzs7gsy0HP
S6sbvjLnO1y10ODMZzjaL6dFtWht/O6lskhXD3alC5fF44shDHcms4Wh7f3FbUBr
qByVMuFvH0W4MFqzbcqQNhq/lPjRKSLu4C+vj4OduQHWJON+Vhc=
=ynW/
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
