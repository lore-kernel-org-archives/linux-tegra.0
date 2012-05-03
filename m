From: David =?ISO-8859-1?Q?Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>
Subject: Question: DTS and redundant board IDs
Date: Thu, 03 May 2012 16:50:45 +0200
Message-ID: <2933195.fDVRYZOqQe@kira>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1450927.dE9yhWm88J"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nextPart1450927.dE9yhWm88J
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello
As you certainly already have heard some manufacturers are using the same
board ID for multiple devices.
For instance, the NotionInk Adam registers as harmony board,
while it's pinmuxing differs in fact a lot.
My question:
How could this be handled by DTS?
ATM I'm compiling the kernel with only the adam board enabled, but I'd like to
integrate the muxing information into DTS in order to get it running on top
of upstream.

Any suggestions?

Thx a lot in advance

-lev
--nextPart1450927.dE9yhWm88J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk+im0UACgkQAeZw77btGjq4bACdGR7U1jb7DXILzwpqkHlrtKus
moUAnjDkIg2YB7L1LsgW4ZEUGxNTPa+L
=9zP9
-----END PGP SIGNATURE-----

--nextPart1450927.dE9yhWm88J--
