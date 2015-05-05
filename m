From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: How to encode being an I2C slave in DT?
Date: Tue, 5 May 2015 12:55:13 +0200
Message-ID: <20150505105513.GA1841@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150403194635.GC2016@katana>
 <1549160.njMIY2NVTi@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1549160.njMIY2NVTi@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


I'm back in town. Sorry for the delay...

> One thing where we need your help as a I2C maintainer is how to represent=
 an=20
> i2c slave device using device-tree. You may remember our discussion in th=
e=20
> past from here [1] where you suggested to just make a slave client by its=
=20
> compatible name. Stephen Warren from NVIDIA raised some concerns about th=
is=20
> solution because it may not be appropriate in all possible future cases (=
which=20
> is what a proper device-tree representation should take care off). He ins=
tead=20
> suggested to mark a slave client by adding some flag to the reg property,=
 to=20
> be able to handle a situation where both master client and slave client h=
ave=20
> the same i2c bus address forming a loopback (e.g. for testing purpose) on=
 the=20
> same bus. More details here [2].

Well... I can agree that we shouldn't prevent a loopback from a DT point
of view. (Despite the fact that it is really for development and I
wonder how many I2C IP cores can do this flawlessly)

However, I am still against putting that information into the reg
property. I see devices coming which have multiple addresses, so people
somewhen want to encode this in DT as well. I'd like to have that a
simple array of addresses. Adding flags, rarely used, will create a mess
IMO.

So what about adding a new property "i2c-slave-reg"? This does not only
prevent the confusion above, but also makes it very clear that this node
is an I2C slave without the need to encode that somehow in the
compatible property (although it probably should be described there as
well, still).

> I hope with this post I can join the different discussions somehow so we =
are=20
> able to find a common sense which is acceptable for all.

Thanks for doing this! I changed the subject to maybe raise interest a
bit more.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSKGQAAoJEBQN5MwUoCm2+iAP/2A+HXHgKk91e9GgTSj1qCIz
vM9lSSzqenBQAkdL8n/BsFu2+p8GGc/wXPSEqBEv9TWYDHzdRlSR9jf0OT7JVymQ
KMLWMbI9Xu/nVJQHRoqAGdGbxBsBvxwsERAi5nOD8cEY71KrOxksLVSqYwyn6faA
ycZjct1/YTmtiaL9vf2wcN5f7jmNKIqO9i+MzvCRE8P043FUqQxsWJ54EzJi2wWh
jCVFu5YNLCjwMsMSy9jRD0o+G1hx4L1j6OG7OzZAK6kiNLApabjotC5EpNAaM4Y+
K/ZFQR+FVrC57thh5iRVi+/4+mKlNVT/HPcfTPy/lzO4P/4f8kAzsARNf47kOaQG
npaPWpw6fLGk/UoIShKlLjJtRO7vBAN42z04BEmpDw1uD2zmiRKPwd8+erHjW8H4
eTkeymEeNqE/HC/RpJTe/vUTxdWryCmOXxPN/ueD49eGo49boeh5oNsU/eq1wNHj
fRiUhz/nWCsePfySJkw1HTi6E+qgYyxjPPQF3rUXExqL2Pv0Z69ZfyKkhF0k1ROJ
b6lsSmVpyyTi1MLlcxD8ILGCwhdTsVBAGtdm4Tp3rGe3ZSZphiJbr6h8dCdrazFg
CrCTazl7dqKknkLWaOvbZe09f/kTHUQLc1gpMwoDSJOslCpipDvqjE9GTn199FWC
RaDfD74G70UqL2M62TVk
=/kh/
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
