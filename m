From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: PCIe MSI support
Date: Thu, 24 Nov 2011 20:57:04 +0100
Message-ID: <20111124195704.GA15417@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I was wondering whether anyone had gotten MSI to work with Tegra2? The code
in arch/arm/mach-tegra/pcie.c has some comments saying that it currently
isn't supported.

Looking through the Tegra2 TRM didn't show much related to MSI. In particular
there doesn't seem to be any mention of the AFI controller or any of it's
registers (except of how to enable/disable the AFI clock or reset the
controller).

Furthermore I wasn't able to get PCIe to work on Harmony with a mainline
kernel. Is something missing or am I just doing something wrong? I can make
it work with the Vibrante kernel, but that doesn't have MSI support either.
Since we're looking at designing an evaluation board with PCIe support I'm
very interested in seeing this supported in mainline. If there's anything I
can do to help, please let me know. Also if anyone can provide more insight
than the TRM, that would be great.

Thierry

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7OoZAACgkQZ+BJyKLjJp8TNACcDXPDMP/EG1+/EDx1CUgHW9P0
hoUAn3/dEmdzcEnIp5C4kk5gg3eaqd54
=KZ/Q
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
