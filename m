From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/4] drm/armada: drop use of drmP.h
Date: Tue, 13 Aug 2019 11:31:27 +0200
Message-ID: <20190813093127.GC1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-4-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0491761372=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804094132.29463-4-sam@ravnborg.org>
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


--===============0491761372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:31AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> While touching the list of include files group them and sort them.
> Fix fallout from the header file removal.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
>  drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
>  drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
>  drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
>  drivers/gpu/drm/armada/armada_fb.c      |  3 +++
>  drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
>  drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
>  drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
>  drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
>  drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
>  10 files changed, 49 insertions(+), 12 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1Sg28ACgkQ3SOs138+
s6Gaew//aMgEuIZ8gAOqGUtEtMwQcDcVOGjAi7k51vVYIqGYqsvyr7Fp7c+BzeWg
pLS8ZB0kVqV7pCxVpbdsf3G51KzbUj9TxJBDthXY7z11qrhBspWt6NYyKXoKmx15
me11n4Wrq7midcfJsmEcMQtebRukMlGkKmSrHNixVDz7cxCy6FmBYCBX9R08A067
U/wHKKR1jcVbdt6DeuhJqMN0KOdLuPZrTwGDK0Of5WbjfUlv9aK6paM95yZhvST/
QEJ4w85HTI/eCiU1iDRYYDg4GJNhgsyY5ZU1Se0HAyH6obr2pD/8A2KRVAYszRTM
HG3sDtU7GU1ZIisqVUGGiVsmmyhin/JmhNgO7vkpnFXxgBk7JQ2q5aiCsH2HTqTG
3Kf+QE73INx9JGP4O3MvkEJ8xI3yG22wB+eJEJQ/2Jsmy5/nKglOIdMJa4p291lY
dIzp4sMWBHNJ+mC+EKI+Uae1aE8c0jZ5vqYwg/yjVhZaIZzKbpWYCAnz2vn/jpRQ
wOsr9xuJJsQmssEAB/9RsFGq1g0YNdT0IAE/Gw80lYJJDJPVI7vxgtJKZ2M1egXW
iy+2KtznDhIsGROhvEQFyvaVpMCeq5ADKi1gFtSwbJ1f2lYC6CHUJ623qBQgNwaA
qZlaFFP+Tr3pN5k6Qvnl+w3Hxj98wEHzM4MH7jgMnoTBQhssxLM=
=yxMK
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--

--===============0491761372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0491761372==--
