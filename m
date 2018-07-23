From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Mon, 23 Jul 2018 19:13:18 +0100
Message-ID: <20180723181318.GG13981@sirena.org.uk>
References: <e411faa3-7d42-710f-a18a-a4fdd764b60a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e411faa3-7d42-710f-a18a-a4fdd764b60a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2018 at 01:58:26PM -0400, Peter Geis wrote:
> SW2 and SW4 use a shared table to provide voltage to the cpu core and
> devices on Tegra hardware.
> Added this table to the cpcap regulator driver as the first step to
> supporting this device on Tegra.

This also doesn't apply against current code (though it does now parse
OK), please check and resend - make sure you don't have other out of
tree changes and are using an up to date kernel (ideally my regulator
for-next branch) as a base.

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltWGr4ACgkQJNaLcl1U
h9AfwAf/XCwGcE+K0zhJxp5j0yfWe0ruL2GQZVNZORD39f7Y3xuhkqBcRqQcP5jV
EGizT5CzcVbfgyo7jXPpu4aVI8zRmwdoAEWTGAqoqxLB73mLyg/GEc+B2um07ztq
4ryRefWuKmSH0tDf8fuQSX07HHHJ0+LQlhVQJP1XAcR5L1gOHqbMrpYB0TICkpzv
xibhvMfa3wFZl+Qzr1jAWphL7NJMlgYrmEyv/HKSTD5yPu3rIsYhLEVy9798Ddvc
T//HxkEJkvNJ8kvbAIqyHtQgF6ARbN3zzcsVKwvurw0noprRFAyDw7BdydIn3pDB
2MKtVDAXuwHwyUhc2G098DuOXEnSFA==
=Qbeg
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
