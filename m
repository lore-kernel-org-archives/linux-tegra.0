From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 3/4] drm/tegra: dsi - Handle non-continuous clock flag
Date: Mon, 14 Jul 2014 10:30:16 +0200
Message-ID: <20140714083012.GN2081@ulmo>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
 <1404822734-8603-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0673382231=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404822734-8603-4-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0673382231==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kUBUi7JBpjcBtem/"
Content-Disposition: inline


--kUBUi7JBpjcBtem/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 09:32:13PM +0900, Alexandre Courbot wrote:
> Handle the MIPI_DSI_CLOCK_NONCONTINUOUS flag and only set TX-only
> clock behavior when this flag is present to allow panels requiring
> continuous clock mode to operate with this driver.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--kUBUi7JBpjcBtem/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw5UUAAoJEN0jrNd/PrOho5MP/i3fs6MK8tvS0uec4Zd4lMdp
6fPYb9IBA9JobEhqURFvmutDuSKqJs1ZuYteeVnPLIEOnLin6lTPT/X6+9/Ppanh
OfBW9I6yHz3fS8f27zsoQgg4YfaDyOWMftb+1tkRoUk/lQArRhL9j3yk3Et+ZDfR
tJJlv8Gub4wliitza/fjDfElBf0zWH0HBGTylamfLsOT6DdNuUk8v3ylcYalNiWl
1JAXG0omG6LVcDuclDyQAWuBphM1yg2DUpuAiLRqGJmeu1AIwwHkrvSJ++Fkpqw/
ZbqyzbnMOfm5/xyG1mrgFlwnyWl0phDavsKRhRCqeTvocBERpdppRQHHSZQXZ3G2
3SeSMaZDOYNpZHOVHOKZ1nUNEJh2Aob0TosauNUjRowufAwtFzYH4gJtg2yWeIIg
RouWctH5X3NjoS4nJgtTj9Nsm8R3+Ubu4vav1UgDq4gaJUJjBU1HlERvDR8vsiGl
MF68iV1yqRwmL3xjAq6T1LA/XS3+9wasWSWn0/9M0iogI3vaZGg+ee92+Mw67Bge
jDxdACxjG/Xnw6zCrdJZvvq8W3mvxYTSAW5p5c/szp3ER5PA88iwNjK0CIlsj8FA
hIHPN8rixTijYRNlgtnykMHHbvhLP0nKIz0asUDVVEsJgfAP0OZ9EZOTj40N4C2C
36ER2bfoLFiMWQZDGdU9
=VAH/
-----END PGP SIGNATURE-----

--kUBUi7JBpjcBtem/--

--===============0673382231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0673382231==--
