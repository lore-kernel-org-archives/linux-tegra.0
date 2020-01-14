From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 4/8] i2c: tegra: Support atomic transfers
Date: Tue, 14 Jan 2020 06:57:17 +0100
Message-ID: <20200114055717.GA1054@kunai>
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200112171430.27219-5-digetx@gmail.com>
 <20200113220315.GB2689@ninjato>
 <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Given my reasoning above, that should have happened before the warning
> > was printed as well? Because same behaviour. I'd be surprised if there
> > was a change...
>=20
> Pretty sure that it was happening before, but I wasn't paying much
> attention back then.

Thanks! All good then. Because this WARN was added to report transfers
which might have never worked but went unnoticed so far. I am glad it
served its purpose.


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4dWDcACgkQFA3kzBSg
KbaDkg//ateAVPiPu9ogaOyXDMUu7rAq53gZw+sBNluuPqo3dseWD+rImSgJ8qwY
GWW580bLfr6P0lfTZvnM5Z1/3c2hZjvilEELGdZQaYSMsOE2hxn36QtjbEBKHjqP
igKWmdLEEMtTztN2Dxh9frTeSFzbBv1+kKJEZC0HJIJgIJ41+oqa11qTK+V9Q2cY
yHjRFC/e4Kt86xwbmkbJZG3ezxFPWzbBwnV3mmjJ14DHneD5MD5BXOnKfNC11/3Q
i5/zdELcVWAz3BahXqu32mZEk4uco1D85aGG5CGTgkgq/T+SQfsFdlXO0cqMzxvj
F1T4HqvHhPew6phyNh/Y/dlzZZGT6s1weUoVv7sewM1hQrzLhw52+nwH/T5QXu98
PatBVmZuFzi8YTBDKOG3SawEqpop4gADreyc9LRomocHKb97lsWcIHZ54pXg9VvF
z4R435Q22tHj6R+MCnif8ksU8phRGAtfieAAoG5YOTxppm53dAceJkTJTK07P20D
DsFvnSYUvbMyiDbMayt8NxmdeY8/1hNFkf/LbPN8bNEFtGoTAliiYnN4pOBz4SiG
8CM0Y2mipUodk1yKnBCf3v/vkjp5Kw/Gd3QmUhRH824h+0ZDNMzed5qR2QVpnCD5
IymE3XUa3b2e7Jv2x1j1VwFRShTVo4bjJUTpBo3OpVBnf6t0PPI=
=loTy
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
