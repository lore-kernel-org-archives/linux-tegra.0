From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: enable I2C controllers on Venice2
Date: Fri, 6 Dec 2013 16:20:22 +0100
Message-ID: <20131206152021.GE32372@ulmo.nvidia.com>
References: <1386196016-25128-1-git-send-email-swarren@wwwdotorg.org>
 <1386196016-25128-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386196016-25128-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:26:54PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Enable all the I2C controllers that are wired up on Venice2. I don't
> know the correct I2C bus clock rates, so set them all to a conservative
> 100KHz for now.

Perhaps we should only enable those that we really need? I currently
use these in my local tree:

	i2c@7000c400: for the trackpad
	i2c@7000c700: for HDMI DDC
	i2c@7000d000: for the PMIC

Thierry

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoes1AAoJEN0jrNd/PrOhxeUP/A2Y/dcjVvYAvtkB3hYb/V6f
qDIlSRl9e7/KfA1rfLv1JuBfxSVHyHD3vCHrCsLYQqUALqXmgLpOI5qDnVRSvLXh
ULGCCBMwIeErDfhwLyN35/zRscphbfqMZ8f6FbpuPoTw4fMp5eqCEwVV4k7n8kvT
Lw8xFpFfvJcmqTcRgTEL/c6RP2af5zy06Bq9tsbA6hZ4FgLhI/Tuu+vl9WL6YpYN
MMlZU9z6fBF6oV93OI966wYz6b2ehUqGD+VqJHXeASgFFInJaqGmbhblTXWX6iWH
TRz1d8/Hh4v6uwBrlWBCfZoWaPaLnl9up0VLvQ2xbf1JGyZDOQrHbJSfgIea2Z7T
OKCUPlabOQLas36qQHPTnjwgzHNJAreBOG6OUOs71ywVdUg7RSCBl+nDknCmqIls
TGgQCj8XPc031Uz3KoUKxTK17mgsVl135GNt9m/6KK5Z5DFIH1f+Aka8wLWEr11H
VEYBcPSww1VVsX3sAx7Eol9/s8fIzO+7YgXVOc7c85VVRjvRNcWaZKCA0cUqE39F
Rj1FQknPSKrAnqiXI3p0ihGoxDw56cVtBkd871wBUHZGCyPHsZSZdiGTudC+pJ+I
X7A88qW9HVARopfwOWC4o7RpJpjEiCz/tbIob18bGYDdtpuCV8fKZZ/MlDosaCR0
Bwj2Rbn3b/KtaUlqniYA
=Mo7p
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
