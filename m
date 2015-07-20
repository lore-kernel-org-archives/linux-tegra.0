From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Mon, 20 Jul 2015 10:45:57 +0200
Message-ID: <20150720084557.GA2551@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
 <3764937.mMMXIHUnrR@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3764937.mMMXIHUnrR@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robherring2@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrey Danin <danindrey@mail.ru>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +
> > +		eeprom@42 {
> > +			compatible =3D "linux,slave-24c02";
> > +			//FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
> > +			reg =3D <0xc0000042>;
>=20
> The node name doesn't match the reg property anymore. Isn't that consider=
ed as=20
> a problem ?

Hmm, true. So far, Rob (CCed) was fine with this approach:
http://www.spinics.net/lists/linux-tegra/msg22760.html

@Rob: If we introduce flag bits in the MSBs of an I2C address, the reg
property is different from the node name. Is this a problem?

Thanks,

   Wolfram


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrLVFAAoJEBQN5MwUoCm2EsYP/ju1Ly2SSnBYKOENYGM2Rh/r
MSR4+kmVT1e0I/Kxns+QO9pVfVMg1+c4jJX8reBhjm1ThjThck9a/SmdHdYtFmuG
0pXzAPgSbi0oy+/FwBpSpyRByGEHwLh06kF2IpEL2BaHKqGjiR64e56CCUkIclUA
GL/erkqxG9+5M4McrxLm+vwL4Z2owmQosHu/4ghLPwv26RtqTTOAEbqGaPbVzRI1
Zeh4L4yXw0uAuyi76nW0sgiq98QzZwpRGjtBSbUg8Q4hNZlyR4Dt9BHJxx9o4SE+
MYJsXMnhxuBPf7AknU86OWu80o3b4ohYcD90pKz5t7V7QDYdpCK0N7D/IcjcONmw
/5SnWndjnMLa41MURY6TejHB1dZZxI5HpNWNnYi1UeuZIaTso9V0CDSC4q8tyGlH
RZnhBb7WSFHJaoGSVdi6a6VVC+DYZEvSYOXlelx3KcmBCAt/5PEwTTs0g5UD0RZc
46rqhGJladZEy2Y1s7XQn6w/pPMrfR/ghcCM82DICpU4oLIGJIuuOqi9X3vystTb
N6K/7nHLdIMKHeVkbagP2uTxFxnZEnW4ysY32fkmtL5liouBc0xTHmCO2RMEMjl9
o0FS9N2Aqkm9hZMLTch7RfGSilhsKV6fFy6FqrJp8+3jy0bQLJS3QVdqszE33cit
2fWGDw5V3xTSBllJ240b
=PiOa
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
