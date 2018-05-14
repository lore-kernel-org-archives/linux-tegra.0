From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Fix order of teardown in IOMMU case
Date: Mon, 14 May 2018 10:59:23 +0200
Message-ID: <20180514085923.GC18312@ulmo>
References: <20180423065745.26102-1-thierry.reding@gmail.com>
 <51f0d03d-afc3-c05f-dbf6-f3710e6f70ba@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0347700358=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <51f0d03d-afc3-c05f-dbf6-f3710e6f70ba@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0347700358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 23, 2018 at 11:35:14AM +0300, Dmitry Osipenko wrote:
> On 23.04.2018 09:57, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The original code works fine, this is merely a cosmetic change to make
> > the teardown order the reverse of the setup order.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thanks.

Thierry

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr5T+gACgkQ3SOs138+
s6HR3BAAqmfrsU73gcwS/Eg4MJByhHIfzB32tYCZsPJB0i0IfOmoWR0Zt+X66oD/
lby464fsyhvb3fg8v1ZzS6yMJk2cfM1lE3bRpOlaMAkS5JOFaRen8obZjCJtw61D
fmKKtdqexc0EtMJM5jU4t/r4kYlalfAeiXKXmTYl9cYa0McInfAcIwgP20unYBdY
Pku1Gj2ap1SNulXhFxjflQmjoMCfz5fHdDmehB9K/PC/XRWokG4ejTrBl7lgGvbv
yCfh+T1+eODrh/T4Cf3VLUQHA5I2OMwFo1aoRKEwUb7bci4WWZfBqV2+MYGTgq5q
JEG5jpmntiKonzNhB3imEuNaeK98VQQ0sgemlj50Obj9s2x6lYxrWlelk8Oc8oDN
DYxl7ZIUe6OfG1kVlRTsbCK5HPd1ukQkpS4ZB6pGXe6iUixr1r/MrROQyjHYg1lI
Vm0IKxgkwlJ5QMhS3NUrOhbGg4LfXRwKdVcot4ovhwiJMk20HhLioo4BbZ9TsShz
ScO4OBUUbIFuwdyIHoHYUxzU4zLgl0HqbqgWd0NF4kOC3j9LpgrRXR0EYI7yHJgK
7mAs5j1z/Ij+QVw5RYvjPXRX3ZfI9BmvLx1C5o0focjpZINTUX+JmVNO8ZNB25xO
S+rxmnqitPGXtFxNgjxLaULOnTKJJjCw1WRsZYbyVBKpmvQrvHI=
=mfT1
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

--===============0347700358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0347700358==--
