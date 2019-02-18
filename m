From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: vic: fix implicit function declaration warning
Date: Mon, 18 Feb 2019 15:43:37 +0100
Message-ID: <20190218144337.GB19190@ulmo>
References: <20190218110050.10589-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0114181820=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190218110050.10589-1-anders.roxell@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0114181820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 12:00:50PM +0100, Anders Roxell wrote:
> When CONFIG_IOMMU_API isn't set the following warnings pops up:
>=20
> drivers/gpu/drm/tegra/vic.c: In function =E2=80=98vic_boot=E2=80=99:
> drivers/gpu/drm/tegra/vic.c:110:31: error: implicit declaration of functi=
on =E2=80=98dev_iommu_fwspec_get=E2=80=99; did you mean =E2=80=98iommu_fwsp=
ec_free=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    struct iommu_fwspec *spec =3D dev_iommu_fwspec_get(vic->dev);
>                                ^~~~~~~~~~~~~~~~~~~~
>                                iommu_fwspec_free
> drivers/gpu/drm/tegra/vic.c:110:31: warning: initialization of =E2=80=98s=
truct iommu_fwspec *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from=
 integer without a cast [-Wint-conversion]
> drivers/gpu/drm/tegra/vic.c:117:19: error: =E2=80=98struct iommu_fwspec=
=E2=80=99 has no member named =E2=80=98num_ids=E2=80=99
>    if (spec && spec->num_ids > 0) {
>                    ^~
> drivers/gpu/drm/tegra/vic.c:118:16: error: =E2=80=98struct iommu_fwspec=
=E2=80=99 has no member named =E2=80=98ids=E2=80=99
>     value =3D spec->ids[0] & 0xffff;
>                 ^~
>=20
> Rework so that its inside a '#ifdef CONFIG_IOMMU_API' block.
>=20
> Fixes: f3779cb190a5 ("drm/tegra: vic: Support stream ID register programm=
ing")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/gpu/drm/tegra/vic.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thierry

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqxJgACgkQ3SOs138+
s6FdzxAAqMQwVpAXY7534MRScbODw+x2lR1SKl9F6NuD2JXGRtMUFBPehoy/2Z/P
pWmBhDczB9oqD7kbLPeyjcmg1UH76F7ozMFpbmuL8+G/UFBBkv5tFnzWGWGremPC
DdmOUVwb79F10AUFmhb2lzvYD7IqV0FVWcQ9TmTpXnEr41jvXtGrmwbhOvS0Ihfa
l1fx07dybPZ3M/qmMHxT7Jf8iXPvxOv5KUjSpbIo89JXOguMirXNt1W5PfUkA2j+
D5ek4bHO2Y83kSUi2lQ99qZ7Yfm2XLkutGrGS1aWaWPkPusz9eAoBPOQhNs28Jjq
NC7VcuztkJDVMZYa2MR+vtMoGD371/OdHST7lI+4KfM+u5oE/rWx/CzK8gUc6Nlm
3QyIsLsf2/NAoK77FSffAtrTq2TBUviZFEPKxZ2RcZkAji22DkQtQfv1UgPAGbPK
RFju4jRiez2QPEj6HzIZllrZSkkD0GTaN6vc2BsJ1ZCkLutB2GyQMJPFJtWlxlvp
Q4+UumjC3COO5XHZhh5WLfMqYfvI1A0hLk/2C1aILC83xh36ZJUjdNAejtpAPa/6
O1BLgZRphcNtXfRzr2Kojd7yL2oHchazE7vqEO5qQeHe4V7fkHFp0m/7gn28RuXn
KkKV2p56dYWnXfDU9mvN2d3kvzqT3wIkM+tx/qDP3pmRgmYYdGA=
=6gu4
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--

--===============0114181820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0114181820==--
