From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/1] drm/tegra: Add guard to avoid double disable/enable
	of RGB outputs
Date: Wed, 12 Feb 2014 11:18:29 +0100
Message-ID: <20140212101828.GC3409@ulmo.nvidia.com>
References: <1392138747-18198-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1711498601=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1392138747-18198-1-git-send-email-digetx@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: tbergstrom@nvidia.com, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1711498601==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2014 at 09:12:27PM +0400, Dmitry Osipenko wrote:
> Add guard to check whether RGB output is already enabled in the way it's
> done for HDMI output. Fixes possible hang on trying to disable output twi=
ce
> (first time during driver probe and second on fb registering).
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied, thanks!

Thierry

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+0p0AAoJEN0jrNd/PrOhc7UP/1um5TkQhc9Ae3hI8a+vO0Pa
1nnh69A0E6jUkln7QK6naAYHhZrI6Y6fiorWH1N8eF8fcdc/nHX5VwsHoQ7Lw3OJ
/3evRPTyf0e/w5gUALTai92dP7uTra4PrH8zB4RW8TU5/gCoCQD3+YccZcgNjFvw
phd5hE1lnwRcoS4+G6CetXRHS/zB1oiNedc7Z+X+L7U2L/rVQVxbC0QJdsYcefGY
gGcIUonEZkZgefKkiNKULsHNMxiBWAcWdsGVJWA9FqJnqiHfHmqrBfIY9Ob2/U5K
hulIFA3hjRNTZ3EGjtYZ2Q4aJdSIAj4ijRKkK2fiUvxYZsQ2+LBIIW3HLt85Elb2
ugEm14TijQGneUOzNAGAAtioqtY/ITdgOh4c3Vu1nSVIsMpUPrsYZ1bKf0Os7BWS
XtxYinlAWRCML/23mQZC+DepGNvL/N29rB3R5b7c7xawoutmpNQKqukmInJ15Te9
kYL96JN1TNvk2a3QI9OumI9VYAt/nyERgTSbCjeqcHLNPgL7JHs4CfI3A07EYEAt
+nRRSyZR5Hg82nn42xHI4Wm/Ms0CWXvUmUDn1b3D0Gi65+6vAgOWg0WiSwciROEh
6I0nnptWF8aekZZ3lNIXGJMJhb5Cr1LRWmL1PWsGLjK5rfSvPHEQwSt+/tOsskqY
FwlGaQxqe2ItkYZn/P/l
=IpyN
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--

--===============1711498601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1711498601==--
