From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH V2 1/2] i2c: tegra: I2_M_NOSTART functionality not
 supported in Tegra20
Date: Sun, 19 Aug 2012 08:33:14 +0200
Message-ID: <20120819063314.GA2147@pengutronix.de>
References: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1345317467-22258-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: khali@linux-fr.org, swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2012 at 12:47:46AM +0530, Laxman Dewangan wrote:
> Tegra20 i2c controller does not support the continue transfer
> which implements the I2C_M_NOSTART functionality of i2c
> protocol mangling.
> Removing the I2C_M_NOSTART functionality support for Tegra20.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1:
> - make the hw feature structure as part of tegra device structure in
>   place of copying the member.
> - Remove check for extra M_NOSTART flag if it is not supported in xfer fu=
nction.
>=20
> Please note that this should go on tegra common clock source tree to avoi=
d conflicts.

Looks good to me regarding the I2C part:

Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAwiKoACgkQD27XaX1/VRs8MwCfROdoJPccn631aBFjG2WhGuDW
bUQAnR3c2FBXVIjkT0KHva7nssU0dhJE
=0ojK
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
