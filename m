From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 12:12:29 +0200
Message-ID: <20190710101229.54ufuhmh22dfxclr@flea>
References: <20190709145151.23086-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0125342966=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190709145151.23086-1-digetx@gmail.com>
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


--===============0125342966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahmo6bieusk7uhsj"
Content-Disposition: inline


--ahmo6bieusk7uhsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 09, 2019 at 05:51:51PM +0300, Dmitry Osipenko wrote:
> The named mode could be invalid and then cmdline parser misses to validate
> mode's dimensions, happily adding 0x0 mode as a valid mode. One case where
> this happens is NVIDIA Tegra devices that are using downstream bootloader
> which adds "video=tegrafb" to the kernel's cmdline and thus upstream Tegra
> DRM driver fails to probe because of the invalid mode.
>
> Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command line")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to drm-misc-next-fixes

Thanks for figuring this out!

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ahmo6bieusk7uhsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSW6DQAKCRDj7w1vZxhR
xUYsAP9EUafm0rr0sX06bl/cIzBTLvcr/5GalKzSZToTJ2kjlwD/aGukUMgjynHS
9tpGZZ5GnYj8IbRYJWM5g6SBjjc6MA4=
=8k/L
-----END PGP SIGNATURE-----

--ahmo6bieusk7uhsj--

--===============0125342966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0125342966==--
