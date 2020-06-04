From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 5/8] phy: tegra: xusb: Add soc ops API to enable UTMI
 PAD protection
Date: Thu, 4 Jun 2020 15:55:10 +0200
Message-ID: <20200604135510.GB1138399@ulmo>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
 <1589437363-16727-6-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1589437363-16727-6-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 11:52:40AM +0530, Nagarjuna Kristam wrote:
> When USB charger is enabled, UTMI PAD needs to be protected according
> to the direction and current level. Add support for the same on Tegra210
> and Tegra186.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V3:
>  - Alligned function and its arguments.
>  - Fixed other comments from Thierry.
> ---
> V2:
>  - Commit message coorected.
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 40 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb-tegra210.c | 32 +++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h          | 13 +++++++++++++
>  3 files changed, 85 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Y/T0ACgkQ3SOs138+
s6ERBhAArocXmu9OV1jFSPMvJ9BFTXleQEoD8VMOD38H5LloSKgUbsj1YPVxsBQx
Q80FpNgM/LUI1+wffo+qpNM/OjUsdiRgT8ObsFq8G4LK4pQA0ng8VYLgX/CR6cfz
+B1GXGWdPIr5wSDOrMToC6jJjl9PSnetzJPfcG2d4iqm16dpw+jaQu6tP2utFJfs
GpWZs/pDjKiVnhvpPWnfWxS397Eo1iiWQA6aXMKYWu+YKuwd59ZTf6Cw0myWEIof
F5trIHYIHA1YU9cQqusNFmMvbYYvV1yesz8wb8AVSf+dPqSIoQ3J3h6bSnJfZFnr
xvhFjvvouALGYnqH8qwQXfGMUROPrD8CGQyCkR/VnOmwPRBnGOoS49xTreoU/92V
Bb/Xt0qeUVAA4l77MTc9ZstTJ36XdVQfknl9Wcv7K7BO0Bw6ly7H7RUfGNQMfRyJ
SxXXcNKDGii2hpM6H7f8Q5z6c11H4mrMGqcrDUz3m4q+K8BycVkoK7GtJcuHH9mJ
8wKSNy9m9rBFiqahOsuR8O4YN7bO1Qk6v7Z8o1XdkK6wCCQgsXmV1mezi1RpWw2M
ExUhv+6q7H/emj4U25ffB8yBNcz3WPFaE5uHDPacgnFJ29b1fgeivPu+E1pQlzny
YpQBzTdfsquRTqDPBJtpTSiIb2sksPUwnSkd8P2nVndg0pmWNMI=
=9yVG
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
