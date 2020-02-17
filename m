From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 5/5] arm64: tegra: Enable XUSB host in P2972-0000 board
Date: Mon, 17 Feb 2020 09:33:43 +0100
Message-ID: <20200217083343.GD1339021@ulmo>
References: <20200212061133.11665-1-jckuo@nvidia.com>
 <20200212061133.11665-6-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212061133.11665-6-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 02:11:33PM +0800, JC Kuo wrote:
> This commit enables XUSB host and pad controller in Tegra194
> P2972-0000 board.
>=20
> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v6:
> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
> Changes in v5: none
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
> - use capitalization of regulator names
> - fix gpio property of VDD_5V_SATA regulator
>=20
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 36 ++++++++++-
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 63 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 1 deletion(-)

Applied to for-5.7/arm64/dt, thanks.

Thierry

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KT+YACgkQ3SOs138+
s6FzIRAAiqLSeEJ4PKGKw0C68DNsxPVFwwerYD3emjg3/ZUeSBWtzlItgiMeALkk
hnej+vs1OH1eUutF7QVw39/lvNjfDlr081ZLK9Vs8l0w+/IrsVObz+EcS4GM6nWT
941/tn5PFxahXcLnGcNxxd9m7qJjL0v9B72JKT317JrwD5B7ZH1o+t4Ij+toNi5G
6rSuhXMii1YluF133U5XfQEyTEG/4Y7s2yAoBmn+nyZUQHSCLucg4YMJpiwiojHk
U7tSxNbbALgFwLnLjWuZzAPBwIh4RMTIrpNowTnml/CgD+k5UE3m7++jp5xNVKqw
+lmpARu7XF1ev+d3E6Td/NmJPD3gO0v1Id5fJbPF+n7VZieUpWecQwAvmfM8K8w6
+CU4npgC74i4PVzzx2tEcUFxLHKrV+F9mEJpZ7YtmazCjZPWYnV7dn414mho9ZuW
8+k248qKfEHN5G0ClQqeGKC98EjoBWAu7N5R1S9fcRkQ+6EVT7KVcfqqTPvVBVaE
c2nCV5idCkDKCdSNH1G5sOX/cwFQDfSC6GNG9VS86myLaITCJYA9FCQ4Gc8ROBvP
9/84ZzT2td0XZC4N3hWf2Aa9zX05xhdEAebKRQgHs5lsFmPrpQR1u+JSHj8dV8Db
KiPrNu847WHh74lKExsu/MLAh0agMfMT0WdIE/0qunYxQc/U67U=
=1Vx9
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
