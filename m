From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 1/2] ARM: multi_v7_defconfig: Make drm support modular
Date: Fri, 5 Jun 2015 13:39:51 +0200
Message-ID: <20150605113949.GA26607@ulmo.nvidia.com>
References: <1432905926-31606-1-git-send-email-geert@linux-m68k.org>
 <2568731.dqdEiMuDro@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2568731.dqdEiMuDro@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2015 at 05:41:34PM +0200, Arnd Bergmann wrote:
> On Friday 29 May 2015 15:25:25 Geert Uytterhoeven wrote:
> > From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >=20
> > Make drm support modular to reduce kernel size (-620 KiB):
> >=20
> >        text    data     bss     dec     hex   filename
> >     12211122 1392076  338520 13941718  d4bbd6 vmlinux.before
> >     11581470 1387196  338264 13306930  cb0c32 vmlinux.after
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > ---
> > Slightly controversial:
> >   - Does anyone need drm for boot testing?
>=20
> Only the tegra driver is affected, so let's ask the tegra
> maintainers.

As a matter of fact I do most of the DRM testing on boot using the
built-in driver. However I can do that easily using tegra_defconfig so
I'm fine with this change.

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVcYqFAAoJEN0jrNd/PrOhsUUP/3AmBHyXGusNmUi5DqT7tDRH
3p9Fgh/KcOryztduviHiU7nOzMdcS8voEKrKeLMd6gLWG5wYliQXpwrZRhRZYmif
M8ktACLgvqg2k5WgaWZU7yzykIrizMfTVabdr//hBGZSwUhflglcluO5njuxZPSG
l9/b+zY2oj8Fd6J6LutV2HDeKTVsCWO/hVc/yZHEWCjqcilliCCxtpqOzkdHF6mg
qWSkPRzi/aY7ZSZDAYBiAPHs/So62bQileBbHfa9WeyLaoTjFsDtM/vINxxULUFx
jMr+iOWhVMoME4y0dNIPSFLyu/0DX4A6jysOmAnDj+FajOW1jMYPkZJvPRO9Ny0P
NFmbleHq5ht9C+RSTDTfg1JuuCSgEWadmv4V5DqzRG+KXL6R6BXaVnktFJCdAP6X
uQQLR9d72Rsl09CWSPVeHddBBwWw/sYUR23bU1nsOc/9vnOnI4qr51fvUz/KkYs5
27fZwPmzE4WVD5pBBB2cKWx3vaEwtj5n77eL5aeKi7DEoolxoA3irEuHzlTAI6oB
QVpt9WPH6PcD/Bc3bKyVr/1DHgMqEXBXPZbFOBvyFzhVL9RkQposCiin57qmKGAj
djZh7dn7m0LDbW1mym28WbhhJHdZH0kMABUOQ9Z5X03lwAwrT/7f/tHdcu7LRFei
hGI0OD5F9l0I4bSls3dY
=W0tE
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
