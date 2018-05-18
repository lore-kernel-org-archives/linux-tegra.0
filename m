From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpu: host1x: Fix compiler errors by converting to
 dma_addr_t
Date: Fri, 18 May 2018 11:22:01 +0200
Message-ID: <20180518092201.GL14500@ulmo>
References: <20180516102204.stviarlxgrz3k2nh@lianli>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0028101434=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180516102204.stviarlxgrz3k2nh@lianli>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Goode <emil.fsw@goode.io>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0028101434==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zH41lVBEV8cLJnCl"
Content-Disposition: inline


--zH41lVBEV8cLJnCl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2018 at 12:22:04PM +0200, Emil Goode wrote:
> The compiler is complaining with the following errors:
>=20
> drivers/gpu/host1x/cdma.c:94:48: error:
> 	passing argument 3 of =E2=80=98dma_alloc_wc=E2=80=99 from incompatible p=
ointer type
> 	[-Werror=3Dincompatible-pointer-types]
>=20
> drivers/gpu/host1x/cdma.c:113:48: error:
> 	passing argument 3 of =E2=80=98dma_alloc_wc=E2=80=99 from incompatible p=
ointer type
> 	[-Werror=3Dincompatible-pointer-types]
>=20
> The expected pointer type of the third argument to dma_alloc_wc() is
> dma_addr_t but phys_addr_t is passed.
>=20
> Change the phys member of struct push_buffer to be dma_addr_t so that we
> pass the correct type to dma_alloc_wc().
> Also check pb->mapped for non-NULL in the destroy function as that is the
> right way of checking if dma_alloc_wc() was successful.
>=20
> Signed-off-by: Emil Goode <emil.fsw@goode.io>
> ---
> v2: - Change the phys member type instead of adding casts.
>     - Check pb->mapped in the destroy function as 0 is a valid value
>       for dma_addr_t.
>=20
>  drivers/gpu/host1x/cdma.c | 2 +-
>  drivers/gpu/host1x/cdma.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--zH41lVBEV8cLJnCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr+mzkACgkQ3SOs138+
s6E/pg//bHifSGSSjuLuoGSL2+fTU7b8n8NLFMy43WOwRNaOZWmQ23lGmSrTrSm8
4EhzWSrEFdKL4YR/n3r6EsaH2IZjPxEM2qd0+V525ZURbkfy/kOqPUGa6lf2THJ1
nGt7pDOZH6gZzqYfrkZygmrL5KbterkF9V39Mu77xehmP6BVKT2XGlXTbJCcl4cV
kPwUnTblvQAMstZWLr9WZKV54JSB93l1oiA4mgxIIrlNusu4itOefMyTj5BMKmj2
YVp8Dnw9cuJ0gJl3cbGpXL51aJzO5dqaBXy/Ws4l2fmR0Cp132DWZl1X5NOx8Bi5
4JLvc5+V+MdE19Ohntwok1qffUvRZj6xJwLuvCAuDSFiB5TnwsotMFxdMt/UULeg
qraPDDVJ10QaXchAgfS1w+d1ZdSDeDoWsvurdEfuy7vHV/IeZbOZBqRzoNie0wfX
jtDxd/dKSpPr9pkPuMuiT3RVSGYIiST8e0hmDlO5nJnx8rw4vyIWExKFNRKcjln6
o268mMhtRF0/Su0o565/sq99mhdZNJkkm/G/glzCcgFNcWUqsQYHLhHyP8iTD93X
00IUTlPmY7iJ2yIwq08hvhPkPNjrkZm2HwK1cx+CYB1iH6H1yzcRfUNyb67LeW27
JstXrXkcLR6LmzshZhloGkqaqCO8kyyfuAgmjbsC2U75j8nyJDk=
=EXzw
-----END PGP SIGNATURE-----

--zH41lVBEV8cLJnCl--

--===============0028101434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0028101434==--
