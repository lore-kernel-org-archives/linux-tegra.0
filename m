From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 4/8] phy: tegra: xusb: Add USB2 pad power control
 support for Tegra210
Date: Tue, 28 Apr 2020 12:06:32 +0200
Message-ID: <20200428100632.GD3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-5-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-5-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:04PM +0530, Nagarjuna Kristam wrote:
> Add USB2 pad power on and off API's for TEgra210 and provide its control

"Tegra210"

> via soc ops. It can be used by operations like charger detect to power on
> and off USB2 pad if needed.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 190 ++++++++++++++++++++++++++------=
------
>  1 file changed, 133 insertions(+), 57 deletions(-)

Again, is there any particular reason why this has to be done with a
custom API rather than just passing the UTMI PHY to the charging code?

Thierry

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oACgACgkQ3SOs138+
s6F9KQ/+M3fL7+wFt2a7E9qXFb9sgMBGcZ60bYeJG5FVGV2Rs3Ec9cPx1cvmJqnG
esMRcnr6qzKuZtSt+5aoA1q7wRDqrjAFdt4y1KUl8/hjKhqOO/K+/mWXRFem+9HZ
SDMi2IfNwizsGojMftpg9LXZgJVsr9tI01etxAeJ0xfBtoQSyCtoXfbCXWuTi58E
KpvwuzpgbK0LAADwTxmwmijgZ8OFHve1AHoT8Ye0cWhXGKWBZLM9hkYaEhPXWYNH
9ZKzZuzf69ovCNcdJZUOelo4mVGWqwZpYj8z+Kxl+6G4bWE437M3bCHS7q0Ffsda
34uLaJehBT+UeN6FsVbPbvsy7kUjEs9fPC12zk43ThMg1msgXE661QDU7U7N4d6j
BgzW6800Ae12vMC1rmLSL1QtfeW9/EUjw7LX0krTOBkJ/Lz8PpWybN2dtkDb3vLJ
crKgw8jMm08K0/1wAL+McPymKHZLn5UoOupBgyj2bLBM5nXolX3F3yABEW45+7Ur
djmeUddxwOoR/+ceoDz5tSLDEJ8tR1m636wL+Ao2Zu97jPKCP+R05fOax/qPNdOw
oCjzAeY14cr3zSwUdKCUmg/f8lLGb+Py36xF7HyO75TY1ZaW5DWpkfKWwtfZwvEF
8khdnwwHo6oZhnHCy+trucc3Wkyb+IYFQL3b18uzH3YaigPbr/g=
=tXcG
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
