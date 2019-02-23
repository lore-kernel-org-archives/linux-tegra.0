From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5 1/2] i2c: tegra: remove master fifo support on tegra186
Date: Sat, 23 Feb 2019 10:29:06 +0100
Message-ID: <20190223092906.GA1018@kunai>
References: <1550597332-21018-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550597332-21018-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 09:28:51AM -0800, Sowjanya Komatineni wrote:
> Tegra186 does not have master FIFO  control register and instead
> uses FIFO control register like prior Tegra chipset.
>=20
> This patch fixes this and prevents crashing during boot when
> accessing FIFO control registers.
>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxxEl4ACgkQFA3kzBSg
Kbb67A//TtevoTcMomvXfKynfNuH+woFBsFGBYhH6Ln8zZecJnJMVi9T+gi2Bzuh
8x23z7IWPiVyEhnByVPxOwXx97IlEMVPMNut2Y0+BTbLNDfBzY+Ii4qUoFGrHaIV
8e6MUAi2gkmJRWTxTZvZwgCkgSczUBbQB7n5WHmKK9Gihc0AvGr+XTLCBzDZRVik
VgnbKJqeRjWfnkOZ3KXhXtTVyitSAxL/Z91xbBrMqPiU4z5NTLRGWckD2RwSbBfm
sEe5jEmqJZgyz3rPLUBZYTzemMXhXmYRNlx7Nbw8fuVEiq6bT852CKTzoMeYASqR
TwHpDOi5PMtV9ZTrWpgd1Kli1HzsJ2RCUYgOnzzoGTUWRo8tpc0VdehdNmQHutPf
lU6AxV4V4Jaul0wxnRtxhxUk0YyDTykikmsJq37wa0DFMHo6u40eU4JVRndQyMgg
nbyhIgJjukvi+OX6nOT0QXAzewkCCrBqptNrKPnFiFyw9TxRhaBBDkopf/F/osjR
zYCaeV8HTyebZ2UD30pSdoieHJGs8FZiDgun3stx/HymzuqjaYghIC28sM5hhjY3
r0nDbTdlDne0qI6ufGHqBvw9wX69X6SNCIoEDnsSpSsVLq/HchMaUdzvIihe+2AT
hA2PFUsoE+mI2dxn9zIUImILBQsrYGsw35NMah63tYfh4rkoYHA=
=JAvd
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
