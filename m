From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Mon, 20 Jul 2015 11:03:11 +0200
Message-ID: <20150720090310.GC2551@katana>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
 <55ACA314.6090104@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55ACA314.6090104@mail.ru>
Sender: linux-sh-owner@vger.kernel.org
To: Andrey Danin <danindrey@mail.ru>
Cc: linux-i2c@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >+			//FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
> >+			reg =3D <0xc0000042>;
>=20
> I used it in this way:
> reg =3D <(I2C_OWN_SLAVE_ADDRESS | 0x42)>;

Ah, nice, it was that easy :) Thanks!


--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrLlOAAoJEBQN5MwUoCm2qQMQAKHQ258qR5P1kWerVRW7MrZ8
kIHfUcYvwELYZbLw8M8t6BbJFwz4TzoQ+URSxRG6Awtx945/XfAf1ZFPntJo3DWy
gylDgcNF2SKcGFKMlbVBg72UkI+9MDb2UksoH/LWgWuMoBNptNm4gEHKdPhjFSQu
84JZXZmYMNMIeL069vvb4TvmIal446KMGU+AXp1RVsDCH5h170vlMVwF7U4dZ8nJ
GK+NTittr8LFowKC3DogC2oco1ix4abNId6IxpYq44/3Eh0h2ZId9nAkFB96+ZZC
tbyC2cjUAOxPfmOvPctQruhmrNmNlN9OjTygJk2XIuXXjgs9nsyBc16toRONa9Pd
XOHAJ1rCJdwBI83mYAWb4lUno/xnnXwYck2SbpfdP6sYqFjMFeDGEc6M+Bldj9+T
fTSjt5xjANMGqO9AU3KdHOvE+z7dc3DxF6mXLH6b5Aa/0Vd7LrgypceFWrjeZFgt
GzH8DyJ661uI0qHpGV6wbyW5QrmozoHS5QK7Ettzeiq9tIBAqmPzbdaWxow+9bxW
bgrWjllt5yUb5MxD7nbLayBDbs4+QrHwvYjD32sonFuiHPv420YSJIpIefBsKgxh
9w4Qh/+zneIRsK8rpt5+6mO3CXpZXrGIUQI2c1R2eYE15rVnPPbVA+HTvXFqWc1W
CkF+9ekxVv07eQYtj/aS
=rUg4
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
