From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: tegra: Use flat regcache.
Date: Tue, 18 Mar 2014 10:28:58 +0000
Message-ID: <20140318102858.GE11706@sirena.org.uk>
References: <1395115139-22243-1-git-send-email-dgreid@chromium.org>
 <s5hha6wdmxa.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1RftZa7o64Huaoir"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hha6wdmxa.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1RftZa7o64Huaoir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2014 at 07:46:09AM +0100, Takashi Iwai wrote:

> kmemdup() with GFP_KERNEL in the lock context.  Ditto in
> regmap_register_patch(), which calls krealloc() with GFP_KERNEL.

So send a patch...

> The former could be fixed by moving the lock like below.  The fix for
> the latter depends on whether we need to protect map->patch_regs
> growth from races or not.  If not, krealloc() can be moved out of the
> lock.

It should only be happening on init so probably not.  On the other hand
doing it without any sort of locking isn't great.

--1RftZa7o64Huaoir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKB/nAAoJELSic+t+oim9jyQP/iM3/yM1QDFYv2KmupBA2eZz
1lMnIAQZ7PA+YvyUExhBPGeDFElFJb+3R8KpZ638KVifZeaQezGgAKAVca5HhFAe
S1JlHiMP0/MhqGDraxL64ny0AfVn+pRj1/C112fr/GcBxLhBbJbVFnr+fNRQ1LfO
Oo3tRDH5ekh1AJqJDsi83j6sZw1kkWkj2bZXUqt05hwpBw+j5ybKsEm/dc8ZecHt
WguUHxvWbXIAWqEAkeuVVnuzA6XOthmB2G/yXeQUi6LyYVxM8ZxmhTkGp+SRNimI
BX12sEta01XVbKDZazpfRrc1c8R+xiNZx3ldOKyPUXyS8LuhLfYtBJHYVcXlRwu4
OQ4SwGuV4DLBv6twZ0+K5mR4JAmwedM72RoO+CQddT0dTytdS+AuNVp3Hx1EwSTi
puCrI9//S5MYbAnb6WKxEf+7JUwsK+n9p/mGWumj2cFxBIpgFtsS4CQQ0ZCfrdcS
x6EF4XHO8a8VzlV8ui0wRxm1n6G5Bs7OGN6A6q5Ea8hl6hEi6dxeuAhsalznZIei
OzJ/k6pHnPfiCsq6mPRabN+wTBs1mNZK327uFsPSwq3kHpdH2/Sd+UjhxbHRlFDF
lP7yQp7tLGGdvRu4Zcz2RxRUq9ETNqZP5y+FlXwFQg49D8WZWnjHgDczXZdCV1hz
W5R8v+U9Sm0Z43YYmPM4
=c2Lx
-----END PGP SIGNATURE-----

--1RftZa7o64Huaoir--
