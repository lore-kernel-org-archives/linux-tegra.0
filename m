From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Tegra boots failing due to as3722 I/O errors
Date: Tue, 29 Mar 2016 12:03:19 -0700
Message-ID: <20160329190319.GE2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z3ND3gJe4e1E4uwh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--z3ND3gJe4e1E4uwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Currently the Jetson TK1 is failing to get regulators for MMC with at
least my regulator tree and probably -next also due to:

[    1.665750] as3722 4-0040: AS3722 with revision 0x1 found
[    1.682945] +VDDIO_SDMMC3: failed to get the current voltage(-22)
[    1.689135] as3722-regulator as3722-regulator: regulator 13 register failed -22
[    1.697593] as3722-regulator: probe of as3722-regulator failed with error -22

The get voltage operation here is just a simple mapping of a bitfield in
the regmap which suggests that the underlying problem is somewhere
further down the stack like the MFD or I2C drivers.  The error is
-EINVAL which suggests something like the register not being marked as
readable but the _VOLTAGE_REG registers appear to be marked as readable
in the MFD.

Full log for one boot at:

  https://storage.kernelci.org/broonie-regulator/v4.6-rc1-24-ga7e614dd1f91/arm-multi_v7_defconfig+CONFIG_SMP=n/lab-mhart/boot-tegra124-jetson-tk1.html

--z3ND3gJe4e1E4uwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW+tF2AAoJECTWi3JdVIfQKJIH/3fQx3h0JjeVZh9r71H6Ltly
3fHrTFuGSST9CmcAdLouJvmhNls3hhnQ2bAHmqL7VRtsDE39gD9LzbWuG1v5i/Zn
R5Qr6zTDqjI+047va0P1NQcVq8tFy//TcS3kd9H4dWHSVaQX3ge+zjNZzVfOZ1sU
/AzQJ6JxJqUlGPsHvl/fe2xjfE5kl9qBJZzi5QIve/owHwtzIYHb1qucbGEwsLT0
MJUNqmRK52FpPHJGguw0jGLXLW+rsTirvYmGgSt8U9sruclaoIKxggRg/7nlqoXo
iFKhuzkNXeF8pqlIGRTrddJjv4GpHPmyH65Cnj2uToMgpGNnr11SbkPUKaOPKYs=
=l9Hy
-----END PGP SIGNATURE-----

--z3ND3gJe4e1E4uwh--
