From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC 0/9] i2c: slave: improve i2c client address spaces and
 their DT support
Date: Mon, 20 Jul 2015 10:52:31 +0200
Message-ID: <20150720085230.GB2551@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <55ACA1D8.6010403@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55ACA1D8.6010403-JGs/UdohzUI@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Thanks for the patches. Slave mode works for me.

Okay, need to have a closer look this week. I combined two I2C busses on
my Jetson TK1. While the initialization of the slave works fine, reading
=66rom the slave via the second I2C controller does not work (yet).

> The series looks good.

Great. I'd be happy for Acked-by or Tested-by tags if possible.

> Only hardcoded values in patch 4 confuse me a little.

Yes, they will most likely be replaced by defines in the next series. We
will need them in another place, too. However, since userspace relies on
them, they should never be changed.


--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrLbOAAoJEBQN5MwUoCm2PwYP/RpOE/M8OeTa1HwVD9n7wYGA
BHP9APrEghzDycFt++K9c0DWHlwHi9Lfj9d2NHfhNnsQso+6FvBTbcBulBWiUavJ
TS12/rFyge8znHnk51P2VZwJCXPca/8+wxy0wkSX3J7WBU0Ya7fmCy4n9A+mgiQs
6VcTOABz7l6huKxETLltLkw6ISnuIA6UuAFrszaRSy4v5RriPdZvHJ5F/yNCwIKF
EbEI/c/Oz5TajgK5ex6hBC48BHnRmvgA8WvhTPVvt0EuibCZVvXViDi/sl+75auA
c0OPk9pzW8vu/sIr6MLPAs4/36fgJEzZAZWhmiSP92LKlEn1QVkWGVPCUyKKoB3z
R9xNVoGPdBcKoa+EW/rlxS+IGGA6GHyRytwbKxOo+WSv6z8fAdiFeXUZ+INPyTI1
gPfCRGo86r+mfj+u5fSL20aaUeJSqNpFYFfXpMtqILTi8aBZeUUCQ6Mx5GDCIP6K
0ICgNuxVOeV82dl2J/Zh/R9kgNEgvhWERX6OED+UB3p343vLeYbO3xZe0sBak5h1
VqNgxRwkuPpfUT71S63klEj2/N7Dgb8i/84AUcIK3DrFoMoPAybh++/kgfw9zD4P
JXzKa56T9qN5veEfhl1hzV89Di7Yk8Cn0S/CpaOK1NNg3Bcd/apMerOzA1risltI
xaa/xod3A0ymMEBdtaU7
=T5eh
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
