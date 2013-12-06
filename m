From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH 1/4] Add crc32 verification of the flash image
Date: Fri, 6 Dec 2013 16:09:38 +0100
Message-ID: <20131206150937.GA32372@ulmo.nvidia.com>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386281582-18561-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 03:12:59PM -0700, Stephen Warren wrote:
[...]
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
[...]
> @@ -124,6 +128,16 @@ def func_flash():
>      flash_img_size = os.path.getsize(flash_img)
>      if args.debug:
>          print 'flash_img_size %d 0x%x' % (flash_img_size, flash_img_size)
> +    flash_img_crc32 = subprocess.check_output(['crc32', flash_img]).strip()

Perhaps do this with binascii.crc32(), which is part of Python's
standard library. That way we don't pull in crc32 as an additional
dependency.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoeixAAoJEN0jrNd/PrOhqeYP/1z1lISyb8P8SZP5bBGWjTMM
xSCqNLxi7rR1g6KCfBXHppj6Dx4PjnvMiofgvFHpm57pLfZSTTlsjl0InDojWEHX
wr4p4xYufKV7SYAtjpkJcq4QbzuBTQwCPBKdS4xjxEL4MOpE3mQ+QnY0e2NTuc3a
OPmidvcCYFmyF7Yb4rY5ShR/VhZFVovWDAjZZyVpDbP0Zp0iL0TYwj69gc7ooCXy
IDsW2NmeBlWBoJRUUbOZ/wyY71eAtxIqyGFfDIcPryzAF0Nkgk5URRw1PPiqdXT0
3oo5pf8yfmAdraS+tA5x7B6wsmWA93fnEEQbgmRCT2tBw8OrWqubE40Oeitufdw+
VW0iTZDrOXZ0EJIHjNtThQp8NRPBs5rP5ZiroOTQlL9WP4jiD7/Rdhb6DrvSP/14
t+8HbzzZ0bL+ksT6Wz/3LpUdQScSbE8xhN2KPEeEJXMbMdGA2lVLUnxZeaUa0aTD
GKgyT60k01zk8I81yA/B/mwbLUpIYnOplRYkmM+U+/GuHU8lOEOK65TRdIXa6I1n
RHwlJkwJm1tuwDLIE+WxRv/HLn0dMdMAAt2S41KWugrIFlzHtxZT8hKIh+lvmavB
lQMshCNXTG5OQtRgA0kf9bnljOgFhDmkHx9QWC9RMlQSI0rSpyltGwE9AFkavMBu
+TheGt6tc7r4S2623aBm
=B5/E
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
