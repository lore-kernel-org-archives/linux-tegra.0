From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable LCD panel on Seaboard
Date: Wed, 8 Jan 2014 16:18:46 +0100
Message-ID: <20140108151845.GE21974@ulmo.nvidia.com>
References: <1389138437-4686-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389138437-4686-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2014 at 04:47:16PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Seaboard uses a CLAA101WA01A LCD panel. Enable the relevant display
> controller, backlight, and regulators.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-seaboard.dts | 55 ++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)

I think this patch needs s/chungwa/chunghwa/, but other than that it
looks good to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzWxVAAoJEN0jrNd/PrOhAlcQALFqjSDxwlOzzHqGONI9e++7
plEYM6nc+2A6SJX/aCOgezENBS4FvBw6hFEk+HWHqhpncPK346WlEdW4Ad8W6vc3
aMWE052YDlbeMTJNNblStYVrDD80mhdQ/nhLBbqlRsG0P7ozu6Wt/qCdVZqNNpV5
UDYLx3CoA7nDqzrUwVPBnHN/as1aezwyGypFmpOKQJO73wPZORfPDNpES0C3akTH
wNgwpay6U4nAFSMNDAVCewtKTQ+IESunQbs3QfQGZPUH2/9A/0rffY43FA3Nz1aZ
qnK6WVc+p9txh9j3p9215d8mltWPOLOJGI4t5zP0vK9Ry8Oh5d1V3NW4AOdnJUa/
VKi5Ho5CcYtaSlBJH7uwXLKy5kYSSLTs6Eglh+D2yOCLqVSj9IR2ZFOC8JrHvf/Y
OCqfTXaIyvFwQepvpuSm16TPCq8Gl8mHVLRJXpKR2t+/8CJmo6Ur+M5hSp4YrqIb
RuiVpKSC2Hg0iuABA6PHW0biISJZExujHlGzr01rsY+rClE1QOjlHJIdMrmZwZS1
1aG8/ZKYGHTV0XxGkUHYbYRwV5nvNNU3OUx7vi2/WDGuWtm44KZe1TEZ5pA+eQ2b
uOEZYxzQQUHQK97nf2W8MXMluw9abR7cOLJVVm+V/LvSe41YCTeLsDDbBIQ7qePD
cpS0JrFjW8RAtf5cCwBI
=F1au
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
