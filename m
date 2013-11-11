From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Issue with a SOYO monitor and Trimslice
Date: Mon, 11 Nov 2013 10:46:26 +0100
Message-ID: <20131111094625.GJ3884@ulmo.nvidia.com>
References: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tAmVnWIZ6lqEAvSf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tAmVnWIZ6lqEAvSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 22, 2013 at 06:26:11AM -0500, Steev Klimaszewski wrote:
> Hi all,
>=20
> Was talking on IRC in #tegra and it was suggested that I email here as
> a reminder to tagr (Sorry, I don't know your real name!)
>=20
> When I boot Linus' tree (3.12-rc1 at commit
> c43a3855f41a25330326570d8e8d54e9927b3f56 ) my monitor, which has only
> dvi and vga input, simply shows a box that states "Out of Range".  I
> am able to ssh into the machine, and run startx (using the modesetting
> driver) and then use xrandr to change the resolution from 1680x1050 to
> something like 1024x768. However, in dmesg with drm.debug=3D0xf I see
> the following:

Hi Steev,

I just remembered this thread from a while ago. There were some patches
to fix DVI support that will be merged into 3.13. You can find them in
the drm/for-next branch here:

	http://cgit.freedesktop.org/tegra/linux

Specifically:

	http://cgit.freedesktop.org/tegra/linux/commit/?h=3Ddrm/for-next&id=3D9f15=
91231aa72edd2cdad507520ad4088682262a

I'm not sure if it fixes the issue that you were seeing, but it might be
worth a try.

Thierry

--tAmVnWIZ6lqEAvSf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSgKdxAAoJEN0jrNd/PrOhTZIP/j99XgFyuGkIV8cWnecgEEiw
07eItMcwpmKeDdKvC4vhXPRYNHNDjSzihUo15CQ1C+kNAXnvNqqZpwqFfIiTAxhz
Buuze5lt7t9CBIYenenMn7T/+2HtSuKfkXSVIHEXAZ+vm3Ya9eyDDhtKz2rrhQf0
kglMMyv9mcpV61dng2nl4uAsfOTDRtdCDOMdn3xsGAQIkbFwtLkzrB2sdK82E97O
JxIaS8WFCCjOCephuav9QgwcCrYeaISRXhWaqa0wKRAlyOM0nq/7QXE5vIrvgf8l
gXuz9VWnDBI3whMO8Zr0OPBfVZQRX7kLMVjrsDcMLj0DFj5M2uDvVKHBdWjfWtpQ
H1FRbn1bConTE7Rkw5Xs34swHIyQipMyDpCD0RE38NJPZGORRJ+mkS5A7POyb9d8
Wr1D2qZELdFwH49LIQ6HM31EQxLfssisIci90nVPxyN/+GhbRX/26VgdVGFi1Ks/
SRXNW3UaXWZ1F6fqNw+KFg9BzQ9SKLJthfO+dhYC8ypsGPDH4+5G+TNDyStRFjvB
FYjNEhMFgGYq6S255Cu/55j5B8ejDSmV9tKcch7FTTPrUDTYPHW4fecUfYknbt36
zPsoGGMRdKBSsMEAjlFHV3rBD5UlAmU4w28M4Cx4NVcVsUXqdr453IRPmi3SrUCw
NeoembGhYMsppTFlUrdb
=bsOZ
-----END PGP SIGNATURE-----

--tAmVnWIZ6lqEAvSf--
