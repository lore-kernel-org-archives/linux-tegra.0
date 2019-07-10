From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 14:55:52 +0200
Message-ID: <20190710125552.qvmnh6qs63ikiu2k@flea>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1564172421=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>
List-Id: linux-tegra@vger.kernel.org


--===============1564172421==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="67vkpimxupn2emik"
Content-Disposition: inline


--67vkpimxupn2emik
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 03:42:28PM +0300, Dmitry Osipenko wrote:
> 10.07.2019 13:12, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jul 09, 2019 at 05:51:51PM +0300, Dmitry Osipenko wrote:
> >> The named mode could be invalid and then cmdline parser misses to vali=
date
> >> mode's dimensions, happily adding 0x0 mode as a valid mode. One case w=
here
> >> this happens is NVIDIA Tegra devices that are using downstream bootloa=
der
> >> which adds "video=3Dtegrafb" to the kernel's cmdline and thus upstream=
 Tegra
> >> DRM driver fails to probe because of the invalid mode.
> >>
> >> Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command li=
ne")
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > Applied to drm-misc-next-fixes
> >
> > Thanks for figuring this out!
>
> Thank you very much! So the driver now doesn't fail to probe because
> of the cmdline, but what else I noticed is that the framebuffer
> console is now rotated by 90=C2=B0 on a 800x1280 panel, while display in
> Xorg is vertical as it was before. Seems something else is still
> missing, reverting "drm/modes: Rewrite the command line parser"
> returns the framebuffer's console orientation into the original
> state.

What is the whole command line passed by the bootloader ?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--67vkpimxupn2emik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSXgWAAKCRDj7w1vZxhR
xbSNAP90FVLFwB5+zilKrKrHuq5DCTLYbu5hD446R9T6mYbDzwEAsVaCQHHR/dDs
5WjcFcl9xSdLXeMNaAFgIjCu90b7Uw0=
=Pmf4
-----END PGP SIGNATURE-----

--67vkpimxupn2emik--

--===============1564172421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1564172421==--
