From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v10 2/4] i2c: tegra: add separate function for
 config_load programing
Date: Tue, 30 Aug 2016 22:30:03 +0200
Message-ID: <20160830203003.GA3645@katana>
References: <1472584279-19924-1-git-send-email-smohammed@nvidia.com>
 <1472584279-19924-2-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472584279-19924-2-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 12:41:17AM +0530, Shardar Shariff Md wrote:
> Define separate function for configuration load register handling
> to make it use by different functions later.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

    SMATCH
drivers/i2c/busses/i2c-tegra.c:519 tegra_i2c_init warn: unused return: err =
=3D tegra_i2c_flush_fifos()


--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxezLAAoJEBQN5MwUoCm2XhcP/RpJLQTrwVwevPjwW9daBAbF
UqInccISSACeErXb5V/XI7drE2PwI8q22ysPzaocgIU4N3ChgX5SNMXlkOlrJVve
11iLMwGG6Fpy2dzsN5FIX7E4rHdhuuq04dB4ukQpwPqZev3uLcESMFUHRjrzYPtV
R1xv+pbQ7tZdH43gRfcKVyAfSaAn2dB7bM66UOdTPbuz/nXfgvqj3tHZHh+8W6A9
GQuSYJQNu4KwrcaOaX/bt4iS6IVCHyERa8rNmqChb01+PosVVkZ2lxTTAQDRdguP
LSlRDZrnKKbT4MlTpuL7MJTHeRbt++Hb3kTfpzSZozmXCSu1L67oM8yOo/XjmdB2
EDZIcynLuunTWa4cmDYXN9S+LuR3RHkEDbFQPpPbXSRZAOhn0oCmosbe32Dd+eDJ
iToy/GNQLNQZxTOi+EK070Gr6K25m4iMaQboQngsLpP7fKlA3JzEDo+qhI0qPKry
HVHMESXysXBa+Y1mmLYuVXFSc9VGHX6dzJWTcyS6jpjo3nbrDdOoek/a7fdroWhe
KHOuRaYodx8kp4kONVlNYYGygJwWY6JTbVdB9FlofdYcAUtvgk8s3SZPpRnzL0Yk
n2zNQBox4SKtEbkD+czchr5fwCi+xm64xEx2Ltj3+W2QBZRvJ5gvVKCvD2g8ss5f
NDPf2XmEe1mhzR/kYvJc
=50Vp
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
