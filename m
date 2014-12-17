From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Select root window for event dispatch
Date: Wed, 17 Dec 2014 15:35:41 +0100
Message-ID: <20141217143539.GA16029@ulmo.nvidia.com>
References: <1416420289-4112-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0144946596=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1416420289-4112-1-git-send-email-seanpaul@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-tegra@vger.kernel.org, marcheu@chromium.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0144946596==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 01:04:49PM -0500, Sean Paul wrote:
> In finish pageflip, the driver was not selecting the root
> window when dispatching events. This exposed a race where
> a plane update would change the window selection and cause
> tegra_dc_finish_page_flip to check the wrong base address.
>=20
> This patch also protects access to the window selection register
> as well as the registers affected by it.
>=20
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

I had hoped to be done with the conversion to atomic modesetting by now
at which point this patch would become significantly different. But I've
applied it to the fixes branch now and rebased the atomic modesetting
patches on top since it'll take a while longer for those to be ready.

Note also that we should be able to get rid of this spinlock by using
the per-window registers directly. As I understand it the window select
register is the legacy way of programming windows. There is also a
flattened address space available for them. According to the TRM these
are located at:

	0x0a00: window A
	0x0c00: window B
	0x0e00: window C

Supporting that would require a larger rewrite, but I think it'd be a
good idea to do that at some point to avoid the spinlock.

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUkZS7AAoJEN0jrNd/PrOhLzUQALd6lBW+eGIBwq33ERjtusw8
4kTV+YkGONrqj+9G6k86CSB6HHxE4P9oZzRfYo1d3hbp2M6oRiWarKsNKH+CoGyb
/jJetJ9HwUCtwviTt+OWOzd2l25r1CF+JMYB2b76pyVxybYq7s79wgZS0/jMIN+l
dlDOz9p8GYgIL4TS72VZQOqtdYMZ8s/K4G+lwEZNVydEPSVL38zU1z3nFi+PzuOU
mkQher4W1qXKIBW8TnokNNd9M3764hQ/Z6sAk1MvwuopZwHAJif5xgvsk0WffoSl
TMPzfaOCCFLeJ+xtWi50JLqQI5bvqNgSgAvAxyJG14y4pYxDj6m76clfERMeUIqT
ClZPNR/Y9OHlBmq+Q0MAJiGXTep4OAGRD5mYig7CJ2XVf2GExfowKlhodgJdEwIx
oeWHeTIZtFeR2xrBSbtke5eVEXW778aS4ibrXRqMicoYhDtoPzSjzfPDesxVU0d1
8x9Wu0MZbbSwqRUogXGFZ3heIuVpumFWJfeGjausYk7ZOxl3IJt9eeIRBwBvEfFe
Fjo/MPFml1lag0O73vbnSK+Jdjz+eGbgewfOpZskB1ga0QdkArk3N7ZJGusfudfo
NP+lUHH5HgestZ6R23I3jTD/BdtpecKILvBk9sYlBN7Zbludy6YDWp1gjc378TFB
yitb7WBG6TyBfC+pAeq9
=/pqO
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============0144946596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0144946596==--
