From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH 4/4] Provide progress messages
Date: Fri, 6 Dec 2013 16:18:00 +0100
Message-ID: <20131206151759.GD32372@ulmo.nvidia.com>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
 <1386281582-18561-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/unnNtmY43mpUSKx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386281582-18561-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/unnNtmY43mpUSKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 03:13:02PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Print messages to the U-Boot console while executing the flashing
> process. For NAND and SPI at least, IO operations can be quite slow,
> and it's useful to know the U-Boot is executing what may be a long-
> running operation.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  tegra-uboot-flasher | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--/unnNtmY43mpUSKx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoeqnAAoJEN0jrNd/PrOhc9kP/iMh+2iwmvN7qWTlH5CxFopB
NUZuxjQOqIlns42+bgGvEaD9XEk0W2TemoCCfVrzwk5PntBUM42s2tOygW6xT8nj
OvfIK6pplgXxH1c5uxfwetkiapKlxzwL8D/XCOVvf4iebWoOATVHw1qfxfWFRpIv
5ZrghN0HSs1oVA8BW3Ct/D8ogKSiDicDJiYcJoMeo+Ow6eX5dp1hY0KSvNXZC/m5
VapTxM/7H6Q2Ueq827sFHKwa7IfDeLFVp/Kfr6amczI1NHcW0ZmFyuZcRQV+zRWC
im/36axRGNImExtpHxabw/nhegWDvNkxSBJ93sd+4YmaHEAt3gEEXQxI+yuPhJYk
YopsCb2OaS3mOFg3Iip3/iIMoss08j+Qs250pEAbA3cfiYIE3W3X/JxzsJWy4Jwy
3+W06Ov4hhrZMihzK/Vv0bb30qke+Wfe2t+xDVylbcQToBEgsjOIA+Ve1zhddXXk
zGhJ5XVagJpKVxmQAzXNqZkqmx/HUp2FyedSf2CeH0ORIFPshRCa0aZuCR6xlapU
X3+zxHvazuCnDH9BDC2OXDhRNYurbAvuh65TBgCkKmr7xR44FnWwBPWX4vsE/D7l
iDcsftvOLB4su0R8ZphzC2gytF1PZnm9lDEDDyUzCjyvQilF5753y7ie4LtGs/ox
mvP6oTuhpWcDfU+IgYi+
=t6Ia
-----END PGP SIGNATURE-----

--/unnNtmY43mpUSKx--
