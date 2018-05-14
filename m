From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] gpu: host1x: Fix dma_free_wc() argument in the error
 path
Date: Mon, 14 May 2018 10:45:10 +0200
Message-ID: <20180514084510.GB18312@ulmo>
References: <20180423095456.16697-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0235366946=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180423095456.16697-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0235366946==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 23, 2018 at 12:54:56PM +0300, Dmitry Osipenko wrote:
> If IOVA allocation or IOMMU mapping fails, dma_free_wc() is invoked with
> size=3D0 because of a typo, that triggers "kernel BUG at mm/vmalloc.c:124=
!".
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/cdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr5TJYACgkQ3SOs138+
s6HREg/6AvZhQov2KIbIWwTeMX0QdWhqCVvoOWpMfpwIKC6MxZXHQj7RV0RMdG1J
ennhaAkaIDhHrkjYTU7AnZBbv8rtQB5pNLaKHg/JofU3ctgA7z3tpNhVYXoyuNeR
W9n1aBVUrl7b+NECAU3z+JKPKrUa1Reh1d7k05c1Ve+tAEMtatY3/xflZfNXqDJd
ajcGDlqo/dFRQ2aqs2f7Vu3FcB/HHkFW/nijKaXnk1DPIJY0EoxTFkvSFE2nO2kn
oV2vHBe9pCMCMYQKBKizuBy/e35ISLA4E9MN87Fz3O+hf5zANAN9N1Vr+xSbLJuj
Y3ojKW9GltmFsOkNh/rDM9F0Vb3+ss8ptMmBEVqoQ5yEtO+4p11TbEHHrV6tMgpR
ReYAGdm34+nX0t8IVr1gwppuU/n9ZBmMigfxCWpJCp1s8bV60xYe5LDj3YI891C4
83Q9q/VilwSDdjBz4InN3juqJMvZgFnibWjNkn5BeWFQVymr8wq51SU9WCKtINWq
4JFKrAoF5TCaqN+XhMy9zC0C5rcjEJEgL2Y3Gp6MrwR/uBwXMT/9hcTgycLRplLG
Eekf4GuCsEchBBVBowBgmCS9uU+5I6LR++ttoh86ObztPms4cXc+BdGUDI0f3zEo
Aoe04Nbx75MGZeQI+8lk0IFZIKVGWcKXeM0WOFMT9XDJ2yHLsts=
=eBwA
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--

--===============0235366946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0235366946==--
