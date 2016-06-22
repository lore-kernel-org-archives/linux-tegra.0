From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ALSA: hda/tegra: iomem fixups for sparse warnings
Date: Wed, 22 Jun 2016 14:35:51 +0200
Message-ID: <20160622123551.GE26943@ulmo.ba.sec>
References: <1466533112-3262-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466533112-3262-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 07:18:32PM +0100, Ben Dooks wrote:
> The readl/writel are not being passed __iomem annotated
> variables, so fix the following sparse warnings by adding
> __iomem in:
>=20
> sound/pci/hda/hda_tegra.c:120:9: warning: incorrect type in argument 2 (d=
ifferent address spaces)
> sound/pci/hda/hda_tegra.c:120:9:    expected void volatile [noderef] <asn=
:2>*addr
> sound/pci/hda/hda_tegra.c:120:9:    got unsigned int [usertype] *addr
> sound/pci/hda/hda_tegra.c:125:16: warning: incorrect type in argument 1 (=
different address spaces)
> sound/pci/hda/hda_tegra.c:125:16:    expected void const volatile [nodere=
f] <asn:2>*addr
> sound/pci/hda/hda_tegra.c:125:16:    got unsigned int [usertype] *addr
> sound/pci/hda/hda_tegra.c:134:13: warning: incorrect type in argument 1 (=
different address spaces)
> sound/pci/hda/hda_tegra.c:134:13:    expected void const volatile [nodere=
f] <asn:2>*addr
> sound/pci/hda/hda_tegra.c:134:13:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:137:9: warning: incorrect type in argument 2 (d=
ifferent address spaces)
> sound/pci/hda/hda_tegra.c:137:9:    expected void volatile [noderef] <asn=
:2>*addr
> sound/pci/hda/hda_tegra.c:137:9:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:146:13: warning: incorrect type in argument 1 (=
different address spaces)
> sound/pci/hda/hda_tegra.c:146:13:    expected void const volatile [nodere=
f] <asn:2>*addr
> sound/pci/hda/hda_tegra.c:146:13:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:156:13: warning: incorrect type in argument 1 (=
different address spaces)
> sound/pci/hda/hda_tegra.c:156:13:    expected void const volatile [nodere=
f] <asn:2>*addr
> sound/pci/hda/hda_tegra.c:156:13:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:159:9: warning: incorrect type in argument 2 (d=
ifferent address spaces)
> sound/pci/hda/hda_tegra.c:159:9:    expected void volatile [noderef] <asn=
:2>*addr
> sound/pci/hda/hda_tegra.c:159:9:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:168:13: warning: incorrect type in argument 1 (=
different address spaces)
> sound/pci/hda/hda_tegra.c:168:13:    expected void const volatile [nodere=
f] <asn:2>*addr
> sound/pci/hda/hda_tegra.c:168:13:    got void *dword_addr
> sound/pci/hda/hda_tegra.c:173:23: warning: incorrect type in initializer =
(incompatible argument 2 (different address spaces))
> sound/pci/hda/hda_tegra.c:173:23:    expected void ( *reg_writel )( ... )
> sound/pci/hda/hda_tegra.c:173:23:    got void ( static [toplevel] *<noide=
nt> )( ... )
> sound/pci/hda/hda_tegra.c:174:22: warning: incorrect type in initializer =
(incompatible argument 1 (different address spaces))
> sound/pci/hda/hda_tegra.c:174:22:    expected unsigned int ( *reg_readl )=
( ... )
> sound/pci/hda/hda_tegra.c:174:22:    got unsigned int ( static [toplevel]=
 *<noident> )( ... )
> sound/pci/hda/hda_tegra.c:175:23: warning: incorrect type in initializer =
(incompatible argument 2 (different address spaces))
> sound/pci/hda/hda_tegra.c:175:23:    expected void ( *reg_writew )( ... )
> sound/pci/hda/hda_tegra.c:175:23:    got void ( static [toplevel] *<noide=
nt> )( ... )
> sound/pci/hda/hda_tegra.c:176:22: warning: incorrect type in initializer =
(incompatible argument 1 (different address spaces))
> sound/pci/hda/hda_tegra.c:176:22:    expected unsigned short ( *reg_readw=
 )( ... )
> sound/pci/hda/hda_tegra.c:176:22:    got unsigned short ( static [topleve=
l] *<noident> )( ... )
> sound/pci/hda/hda_tegra.c:177:23: warning: incorrect type in initializer =
(incompatible argument 2 (different address spaces))
> sound/pci/hda/hda_tegra.c:177:23:    expected void ( *reg_writeb )( ... )
> sound/pci/hda/hda_tegra.c:177:23:    got void ( static [toplevel] *<noide=
nt> )( ... )
> sound/pci/hda/hda_tegra.c:178:22: warning: incorrect type in initializer =
(incompatible argument 1 (different address spaces))
> sound/pci/hda/hda_tegra.c:178:22:    expected unsigned char ( *reg_readb =
)( ... )
> sound/pci/hda/hda_tegra.c:178:22:    got unsigned char ( static [toplevel=
] *<noident> )( ... )
>=20
> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
> Cc: Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>
> Cc: Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  sound/pci/hda/hda_tegra.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Takashi's already applid it, but fwiw:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaoYnAAoJEN0jrNd/PrOhnuIP+wcSaHHdqCWiSHYwJA2WCvDI
OKP3ecIShN+cEnd228Xl/Hf9yhkOzQ+ypkQkaNfb1Y1B4yUd+5C2Yu6dI8/cgrGd
ZOsSxfOinVCxil5FdzAaNUzBWi+EBlGtnAHOm3iD3e/ZJPTRXNxjFmOh6ZQQmFiU
Bu15Yz/DZDWrhHifMyPqej88DIr8Ad7l8xvkkivScekk/BC0+0nMoY43jHAqGC6g
r7DJjA3hzAcL7yO3jzM6pFpAE2A1C5SWtnWPtkU27TZkczSXqrfiroEFkoiMYM1G
qh3C4wGDK8nuO1bjNwcDG4/zA/rlM3/6v/Zsoj2tNPNd97csDV/m4mdKv2233AY7
r2sWxvtuFT5rCR5AisR7+t2wlxacs0m9rmPssOgH6RZnHkEtKCwU/VXomQvQQi9z
c4lAjUQRkWOZPWJHz3dJQ6eHzSGAYQy/sCvw1x5vC9dbs3epgbRBigrT3qoGLhy1
mgxvgkF15s3oFtSJs9rD7g5Ed6f7f4MIIruJ/fIPkmbdhMbwVaZQoaoqUQtfCPSI
1+BakZ6/SQ+8ybzWjnLy/V+Y3GuvvVaeSjmOVL/oYK0nAoS2iMHjh7NcQXymABrW
I5lnm9xvRAiDkg1LmcsM+zfSKP/i6EIDmsoh96rl9wmfkdvuIOWF+vgSdpUaUYFX
Y78hGuUfN1X3t/uE/Arl
=9CvR
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
