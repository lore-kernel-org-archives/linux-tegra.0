From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Mon, 23 Jul 2018 18:01:57 +0100
Message-ID: <20180723170157.GD13981@sirena.org.uk>
References: <d38d3fea-dc7d-09fe-651e-386b36befde1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d38d3fea-dc7d-09fe-651e-386b36befde1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: girdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2018 at 08:43:49PM -0400, Peter Geis wrote:
> SW2 and SW4 use a shared table to provide voltage to the cpu core and
> devices on Tegra hardware.
> Added this table to the cpcap regulator driver as the first step to
> supporting this device on Tegra.

This fails to apply with:

Applying: Add sw2_sw4 voltage table to cpcap regulator.
=2Egit/rebase-apply/patch:37: trailing whitespace.
                                               1437500, 1450000,=20
error: corrupt patch at line 38
Patch failed at 0001 Add sw2_sw4 voltage table to cpcap regulator.

Please check and resend.

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltWCgQACgkQJNaLcl1U
h9BSZAf/VsYB49dLAymFOD6wBNVBN9ssFWiy0GyRwDNUU2glcNSCkNQg9VbFuvbf
pL+yDsbFq43X3zygSc43IwkEgaQV1A23ZeFy3gdpcFFNQ84ja3pbC8Nc2l8dE4Ef
2tl4FXQlcqrdPXDE28j0TiYrCetaQbTgQ7uOJTvn1sQzBeC1JATeBAL+J71NNcHp
5Izudv3e30wcQilO3meT4xXmyGgl/nquNOo/7cDBPz08BFbAMDiCHoEhn4wbplUg
LN2feNkQ9ruXhw0MbxC70VBTDZxalr/gaAip2jzq+2+R/oAuILhJI/UFDfc2NY6+
5f086XLj0RZayut2OboYf9Pn+dkQhw==
=j3zD
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
