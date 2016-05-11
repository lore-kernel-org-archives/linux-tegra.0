From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v7 1/4] i2c: tegra: disable clock before returning error
Date: Wed, 11 May 2016 16:33:00 +0200
Message-ID: <20160511143300.GB1716@katana>
References: <1461591519-24602-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461591519-24602-1-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 07:08:36PM +0530, Shardar Shariff Md wrote:
> Disable clock before returning error in tegra_i2c_init() as its leaves
> i2c clock ON in case of error and never turns off again as it will have
> unbalanced clock enable/disable
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
>=20

Applied to for-next, thanks!


--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXM0KcAAoJEBQN5MwUoCm29PwP/i4PPCCy1egRPCnugylUq7Z0
xdozIhd3DOBPAfwSM7ZAxhpo3driSnUqVTB8ZIU9huQTx7kalB6q/IZqmC5xBV9G
oRCUNF+qgpGL+gEM1c0A9yAcPbzJ6SXuLfBKNKLEzXvmjGW/lyqRbCBs4ilpN5pG
frYrbhQd5NdZ2ioE1p8i8AeVxU97y1UFoJL4oWd4lZWCjMK6jw9DC9WOsuKFXBqy
AReXkMpMAB5wOs+mYsetYsaW38/bjiMNBxBCIHmHhFG8vey5vFvoZQj2nywbidP5
z7oYRgsnfzCfxzQr3UC8rrylci4DJI2ctk6RVssyAN5tgpWiO37pEqoyN8WHuN7a
y8HwrO2TDwxrS8buVIxw7hTFtecvI3wjEefOH3XsTHt7MsIRhvJIMWsCCAESjsno
R2NyfYH9EeaWcy3c5+BGrdfKRflYYis5mhAmTTr3CuYR35daCtzj8s7vsamcDymM
KibpgdW/TDYxFaiMLuxQigdQWBTSePukK8Exk8GkPo7RdKUJauozyXC/oCnhqk6P
Tqrii5NbVr/L5UPgNef4zlh6FB4xwqoqD1L7ZulAt3FV/kcKqfXWGugAWoGF9rij
mgy8by20Lakhoa5AMsDNtCvgOc3RdUq2OE8Ng+LaOd3khaCylbv89M6iX61Vbfqh
JN3CiNF7qkfLSkiNhZ6o
=Ep7y
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
