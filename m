From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Fix Tegra30 Cardhu PCA954x reset
Date: Mon, 9 Jul 2018 16:01:10 +0200
Message-ID: <20180709140110.GA18353@ulmo>
References: <1530608387-9591-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530608387-9591-1-git-send-email-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2018 at 09:59:47AM +0100, Jon Hunter wrote:
> On all versions of Tegra30 Cardhu, the reset signal to the NXP PCA9546
> I2C mux is connected to the Tegra GPIO BB0. Currently, this pin on the
> Tegra is not configured as a GPIO but as a special-function IO (SFIO)
> that is multiplexing the pin to an I2S controller. On exiting system
> suspend, I2C commands sent to the PCA9546 are failing because there is
> no ACK. Although it is not possible to see exactly what is happening
> to the reset during suspend, by ensuring it is configured as a GPIO
> and driven high, to de-assert the reset, the failures are no longer
> seen.
>=20
> Please note that this GPIO is also used to drive the reset signal
> going to the camera connector on the board. However, given that there
> is no camera support currently for Cardhu, this should not have any
> impact.
>=20
> Fixes: 40431d16ff11 ("ARM: tegra: enable PCA9546 on Cardhu")
>=20
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra30-cardhu.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-4.19/arm/dt, thanks.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDaqMACgkQ3SOs138+
s6EX6xAAocrOM1kiT0+nW38/scu1cJYnxCuLQ/nBmsgblrAtFL4u1Nl4arD8mJ7M
JuyLS2QbSdk6sgX7kDWKYV4wl+fo9JXlBVVKWXZ6Oz6GxlnHyocaIjCnrLwQPmA0
Ro3aXlKFWDiVoCo+ygVmS4YJ6XvBcF/1cKWOJwCz9X6brsN/4xzqMqiObogmBT/s
YEVF+SejNlDblK2xnhyEfae2X29MtdSAzuV0+loPQOePA5XVHBQvnr7REsFJ4b9I
0zDGELzKNs4XI7tkqD06HOAkB6h8+tqyPaW504u4eFh1ZEIaEu6CY91n5wxt9MCV
Th37TPs608u6UZDKAvbTeNc6BA++7wlE/2SEUlDOFjfVLJupiBgJNIy5dVo+0lwl
meIP8iU6OmphVP1akJvVWWnQOkAW6u/FRkJPaPaYvv5XWynEtLOZ4dHVID34Juwm
kjo0kVPwD+P9F91ONqFoYS+aBGyAUdksVxLFEVxdwmJGs2zSYWxkvc4HFFK47O8G
3+X8R2L5XzbalmFzUSB89HoZWA8SRAAQCWeHE0ncfWrr3bHwO2TEb0q2NE952C/8
CdVHI773kQFuN75IwBMwcjcLgHMupbBW/FB2xZ9ChmxJCWBherfTf7WO03EkrIaF
UbvS9A4rw71/XYHhrbrDMcwE2krCWTBrB+EDnvFeIuqlC/7bFZw=
=qTb9
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
