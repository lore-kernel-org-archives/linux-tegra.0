From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Wed, 6 May 2015 18:17:12 +0200
Message-ID: <20150506161712.GA4003@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150403194635.GC2016@katana>
 <1549160.njMIY2NVTi@fb07-iapwap2>
 <20150505105513.GA1841@katana>
 <554922EF.3050906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <554922EF.3050906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The container node has a #address-cells property for this very reason. It=
's
> perfectly well-defined how to split up a property containing a large numb=
er
> of cells into separate values, by using the value of #address-cells. Plus,
> the canonical formatting (albeit not enforced by the DT compiler) for a
> property that contains an array of entries, each 2 cells in size, would b=
e:
>=20
> reg =3D <0 0x1a>, <0 0x40>, <0 0x48>;
>=20
> rather than:
>=20
> reg =3D <0 0x1a 0 0x40 0 0x48>;
>=20
> ... so it's quite simple to make it very human-readable too.

I give in to the flag idea. I also noticed that we'd need another flag
anyhow to mark 10 bit addresses. I am still thinking between using two
address-cells in that case (clean seperation between address and flags)
or to encode the flags as MSB in the current address (all busses will
have same address-cells and child description, less code paths and no
overhead in dtbs).

That being said, for the loopback testcase, the I2C slave framework will
need updates as well. I think I can cook up something. Will be
interesting to see if my hardware can do this. Has the loopback already
been tested on Tegra?


--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSj6IAAoJEBQN5MwUoCm25sgP/iBag10zDEke9nN10jYKCbkc
pe7vzAiQ8XRC0zXgPb7TYfhwWyRXdbjHRZ/ZggF8EEPyE6umCDAvr41KLskpLyHB
LSnh+/jUcdtUQmU3jUMICCaH9WBcpEyfAyCZSHrlfUl8ubcEqk3E3dYE5VsAEJrh
ERAy/9Ldqx8Y7rfRO6RvoqKKh2dNaJugdl7Pquh9LznqCUlhyF4cBBp3kX0Zg8bF
TcEEGl9592WltfYpmNIvTfKMjFqhtgbMwH/WPTOlEUT2MHllD2k1/07EXLL8m9Jl
yKX0Mqf8n5uOeUgedg0sQ3PT8G0WPhY1pUHjwYDmUQyMOjVc0MY4LTrtPjTxsLa3
pNHvIk98eeXUxVHItVjARCuKMz9fLmN/7CTUL44s5SSoYkq834fA/57gx9VzQMrp
NCglIBqxKk0r8hkc6Cs1DybWWMAGMReVXtpO0GWONqLkHU4llaqP/wHHX7jOAjMc
urs8g3DXl+GxtaDsnGCOZ/0/16qsTDSybkfIPAhnxEVKucpKfsxe6SbnYs/4aRsN
JJcu+abCHXXb1DT3TYbzx7k85lzRrmLktGre3/A7wp+YY7kEH1blE/FpCVTkgZIZ
jMtoCdOZdPsbAXMIy/8xz/ixFw/z7jTwsDv7OilXD/gjtCVcQ1bjYec8LA5j9gI7
6chgr+wEQuZ6ykPJtxnw
=lGIR
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
