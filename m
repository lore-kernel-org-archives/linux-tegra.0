From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: PCIe device tree support
Date: Mon, 20 Feb 2012 20:18:04 +0100
Message-ID: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I would like to add device tree support for the Tegra2 PCIe controller. From
what I understand this will require the PCIe code to be rewritten as a proper
platform driver in order to be able to instantiate it via the device tree. Is
that correct?

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9CnGwACgkQZ+BJyKLjJp/J8ACgquTqebfKddXRjv6LFKkE0F1Q
7GMAnjNXcdyc/xN5MbmACA4Fyze43Y7O
=hpmK
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
