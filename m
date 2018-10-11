From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/5] usb: xhci: tegra: Power-off power-domains on
 removal
Date: Thu, 11 Oct 2018 18:48:13 +0200
Message-ID: <20181011164813.GB7393@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2018 at 03:11:47PM +0100, Jon Hunter wrote:
> Currently the XUSB power domains used by the Tegra xHCI controller are
> never powered off on the removal of the driver, however, they will be
> powered off on probe failure. Update the removal code to be consistent
> with the probe failure path to power off the XUSB power domains.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu/fs0ACgkQ3SOs138+
s6GZUQ/+KDGn/hFdXNf9aYDgzhZo1boSLCGofzxZG03yjmBFkob3fdymrz6eHX2F
4zSkGa8+3hBKD+TlTiLFuDXI5zFxeZL/IoHX4maTl8ULdqWB+uiFUiQClbjIZCTp
UqiS5qHUUzchDHppCJB05cW7PNRZwUY0vQgTroa52KPCmJhhrdVgYXYPL2SpY+PR
PBs8agBSyTrR4JlUhvognAzPOXr99YkiaOUvpV9h114ayjwlMBZE9oGmoIIaWZ/T
v8udw8RCd3m0tkRyEvj7ZnfSmVlXU+ncl2X+J645sV8pKyb7dmc//fE913FKB7V9
NxrEJmR1DkUxkZBfwuOi+q3QqFez+8/hB/R4O2cCB5a1+4WEW5nANgdVN+iQcrWs
UBAnRPOp/ET+OsKAXIDdzoMYyoJBU07LV8HoIcIA4l5hkeaaeGk2dwMz/2/nkQM2
LP3Z3uk5eGfqFYjJ8rtF2S8q0LT7qC4noZD75lia8UHNnW6X2CJng1Z3Mw2PtP5a
OQIDmuY62qNa9BwiOR0s7ruP7lvkzbB8aSNfP5v553stk4F38b0of5Vu3iAdUbbi
E3UOd6hwPtZ0SKCFRbMGhypQb5bYZYOQFhHHdzpfcoAGXkZjb0Sx0MNOB5qWg9Wq
JZ1mxlAl/60fbHliyGF1ShoWRy1fq6IDyk/kD59chlLN7IvWZ7c=
=9Irg
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
