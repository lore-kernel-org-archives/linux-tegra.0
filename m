From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] usb: tegra: Fix allocation for the FPCI context
Date: Tue, 14 Jul 2020 11:19:55 +0200
Message-ID: <20200714091955.GF141356@ulmo>
References: <20200712102837.24340-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DEueqSqTbz/jWVG1"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200712102837.24340-1-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DEueqSqTbz/jWVG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:28:36AM +0100, Jon Hunter wrote:
> Commit 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB
> context save/restore") is using the IPFS 'num_offsets' value when
> allocating memory for FPCI context instead of the FPCI 'num_offsets'.
> We have not observed any specific issues because of this, but could
> cause too much memory or too little memory to be allocated. Fix this
> by using the FPCI 'num_offsets' for allocating the FPCI memory for
> storing the FPCI state.
>=20
> Cc: stable@vger.kernel.org
>=20
> Fixes: 5c4e8d3781bc ("usb: host: xhci-tegra: Add support for XUSB context=
 save/restore")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--DEueqSqTbz/jWVG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeLsACgkQ3SOs138+
s6G7cg/9FTvsISm0svIWmK3kAgMVZkVea+cESYFM2UwbzPvCuznYAXuObClSzmKY
/s7hMh3A5gUvn1Y0j1dYgb5oc8zrf9GHWr3T3aCODdBnQk6HrDyFBUP5sTYA+wfR
684PfsyxG47Ei18zAWtSNlbgGdd0pk0uLRGsrKqxHA+bbooHwO4+Ci6AO242Wovr
V7yBsNxTwgdLtZI2Bx70XSf9Kao4m+zRsaPorS96gnWoJKNtHXWTz4JUWHYSkBtw
B1FJ+YjlBQEaXhdSXtU3VOXaFGJGAm/uPkAXU0pK3YuZvJXkzC224Tgi4BaYK9/c
WDCaMgRhF5V7auBeDKt1xh+nxBAjG8eaMJHuBpKsN1dnRZdXjJG/c+evHFce9noM
VR9jMR6cmg7EJBM9/QfvDA54MGsanmSrDit0Tg//Ba2BtiqQQv8jgl5bkPP8ZSBv
1caFyAn74JoJd/tjPOYoDsgXbhjN64o5eez2z66fXLfvxesfEQMeLKykBnrwEJAE
gXZ7OaOnHsjyWnf+Nd2zYVY8zc48P2NLb8GLYaWboNeVekWSkFK/+VmQ5J6ayDrn
mNJfZ7eNijZlbPz2pkDah47Jta2NzHfjS/zYuiYT/pOa+6UbxsEV7wWOl28mneTO
EpjAS3lJAFSZLiA/Px0WjNwYE+H/iJ8P3BP3RH9ghMu4zCo1Qvg=
=Jwud
-----END PGP SIGNATURE-----

--DEueqSqTbz/jWVG1--
