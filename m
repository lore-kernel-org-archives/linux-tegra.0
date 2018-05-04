From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/5] drm/tegra: dc: Balance IOMMU group refcounting
Date: Fri, 4 May 2018 14:19:27 +0200
Message-ID: <20180504121927.GU13459@ulmo>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483740513=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503234723.4368-2-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1483740513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yIMHf/Pa6CzSkARF"
Content-Disposition: inline


--yIMHf/Pa6CzSkARF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:47:19AM +0300, Dmitry Osipenko wrote:
> Remove unneeded iommu_group_get() and add missing iommu_group_put(),
> correcting IOMMU group refcount. This is a minor correction / cleanup that
> doesn't really fix anything because Tegra's IOMMU driver are built-in and
> hence groups refcounting can't hold IOMMU driver from unloading.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 35 +++++++++++++++++------------------
>  drivers/gpu/drm/tegra/dc.h  |  2 +-
>  drivers/gpu/drm/tegra/drm.h |  2 +-
>  3 files changed, 19 insertions(+), 20 deletions(-)

Applied, thanks.

Thierry

--yIMHf/Pa6CzSkARF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsT88ACgkQ3SOs138+
s6GrdhAAse3wHNlmpSycrZqex5MwGWBgyivjb0ahOLpf4fdqy/JoWEjNIueY9ODn
r8ZobxvjS1l9HtlTy3lNjmXRI7vpcmVZW3iNGNhtPPLYRF6W9UxmghPtElZi5Xrg
5uYncPHQvWGK3QmFYfcW5kK/nC2q++dbqQRFBa/ALo6ZSUwmqDR2JhUgylnI/8KK
7UCbzlgLgFLOLNIIVifpjhtOvx3NK4iGbl/xl8NgE6wKg8lRkE2PbS4KM/qQ1ViS
0MLUTF81JDfOiv031YLItJ5R3QivIX/EEn4f0EaQPYGeSsFpiIym6105YApVO0HB
7ZWLUsSz3tU7AVarRV9J5IDIHjJDTP4vhFZxdY4CWHrKN2J+Gbkv9c8NX4a/h7Au
tOJMVWEtQ5JQKD+yFYo6MkGio3laqx+429at9y2vlbWLfSmiLfJ+O0JNDe1ou1Qh
iMkaHDAUdwqj8Eeys0qtK/13IoISH7DtHLl5f+/X8/TL3EcKbl/eKjCtYH47M1jy
poPY2KVXpadpNrNgNcoVwkFqrKALn7dUaDh7NJ2i/DXIn/Mz5I84LFqiXSzHkz1v
O5jh2yColw+GRtTvIVU0rf7QMuG7MhEODHq4AB+8frVJAWYqPcDm/FxQQatd8ew9
Dfgc5bFWzPoXAMOAxvpsUzfXdc06796nzlRKEYNXBxLdPAE1wGE=
=r+48
-----END PGP SIGNATURE-----

--yIMHf/Pa6CzSkARF--

--===============1483740513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1483740513==--
