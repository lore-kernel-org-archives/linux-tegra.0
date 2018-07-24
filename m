From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Tue, 24 Jul 2018 15:36:34 +0100
Message-ID: <20180724143634.GD13268@sirena.org.uk>
References: <20180724132541.17039-1-pgwipeout@gmail.com>
 <20180724132541.17039-2-pgwipeout@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724132541.17039-2-pgwipeout@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 24, 2018 at 09:25:40AM -0400, Peter Geis wrote:
> SW2 and SW4 use a shared table to provide voltage to the cpu core and
> devices on Tegra hardware.
> Added this table to the cpcap regulator driver as the first step to
> supporting this device on Tegra.

Please submit patches using subject lines reflecting the style for the
subsystem.  This makes it easier for people to identify relevant
patches.  Look at what existing commits in the area you're changing are
doing and make sure your subject lines visually resemble what they're
doing.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltXOXIACgkQJNaLcl1U
h9Bs1Af9Esx5B/jH0/vkzcSK7TdzwrkTjnQ5hyQFW37fVeoYdLIjmf0g1iiWn6iV
+HnLCJXjUPesyDfbTCp70bkMJitAbezK1EgkbhEYZhumyfuDB4p+aRKPmPjxheq3
NbqZKovM6nx38587zTj1T/IrKySPgRqztA/jvW4CL/8TTWPMw9iPsbF5TyPeLQ/s
PHzDIFED3RF8RukQ47aUCQ38/+7w9LrwQsoT1s88SpYyhiqNzq1T0XBY04KCclwZ
HW1y3ne5r2mzX9/rgANsqQYDoEh2iRUl4lO/I6qdcG2I/8FgRcMFfzaK+S4bwJr3
6znQ6DhbI1noJNaPuicPhOY90rbsCw==
=BvPL
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
