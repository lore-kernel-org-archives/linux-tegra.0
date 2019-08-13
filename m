From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Date: Tue, 13 Aug 2019 11:30:34 +0200
Message-ID: <20190813093034.GB1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-2-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0477128217=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804094132.29463-2-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, malidp@foss.arm.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0477128217==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:29AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgzoACgkQ3SOs138+
s6Ednw/9EQDt0WWcZ4KD4LRH6jtkdKpX+5+8t1NaUnVHmwYUF4zhN+n9xLFaQhZ8
GnAlYAkIrouWJONNOpH3NjK388eOLn1udMs5sOZ3QkYz0IKZdg3xsUBlUXyMfNl5
9K37zwG+Jpg1eoMQIMxHImLp7tTTM2YSXFMVAVR0LOfeq44mLVVAq4yhRngLtA2c
gHTgLpHT6XXl4j2eEbTp1bwQ6mgG85j7P/avdR/sU7CYQf8QCOE3uT2NuItUcFGd
r9RDoAVLy9uP3uBzppkcYH80xHuplge6fMzB4RLCCwHwEcUYaoVoT+goxLH5xxXE
HFCv0BcSO1nPUDdXXXu4ldjdVgxmX+HnOKhdVX3EwJ3IGdyCHq1K3ArKFupUXDdW
vBWecZnlgg5DooLEOQMkydvodQrr0r++UQEGUYiAnd1O9o7QWFU7E5Yaa3hrRtAu
vGQSmjuNNRTDwd8nFI3DpAwTT70oROFN3QFOiV8xwGA0kQi5K8ySCwwnage7kF3c
qtbUMZwnwuVW93oND63nTOGdPm9OImqWVz5aoa+AsfBzDnHt4E1idZOynC6+MS/u
gFgZ99c6+qKHmOqfwqC0aYDHw2XyNiFumX70sHCxGBhdR5659TmxReChjRTGFG6X
6fK3vkbAAaSf+GKseEqYXi+j4o6e1MOs1g0y/OhcqQvd2s9v4+M=
=dhsw
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

--===============0477128217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0477128217==--
