From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 16/16] staging: media: tegra-vde: add proper SPDX
 identifiers on file that did not have it.
Date: Tue, 2 Apr 2019 15:59:30 +0200
Message-ID: <20190402135930.GA8017@ulmo>
References: <20190402103203.14959-1-gregkh@linuxfoundation.org>
 <20190402103203.14959-17-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190402103203.14959-17-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 12:32:03PM +0200, Greg Kroah-Hartman wrote:
> There was a single file for the tegra-vde driver that did not have SPDX
> identifiers on it, so fix that up.  At the same time, remove the "free
> form" text that specified the license of the file, as that is impossible
> for any tool to properly parse.
>=20
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/media/tegra-vde/uapi.h | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyjar4ACgkQ3SOs138+
s6F8vg//XivzJ1gwvjS012CuQJEuX4qSY6iQSKVELNsZhg8SKlGPzfByDHcLwU3o
ZEpmAVPPnzFgIgKfCq5patZ5frY8DHG4Vdew9NEElWyI66ZkkOG1w11y4WONdsB3
FZX0G383M9ZvDLOjGbNQ0GczJFCgJFIetTyoF+vBTWvVGkQoooYfVXPzysYviOaM
mDJEm8gNvtHua2WQCipEaQFhZ3bV1BIGkPIvyFRyje8XKDQcuqjGkHGVTkJTm/2b
tTKMtSLb3dWMctRTnC1MpjnRlgtMyQGCFBmohS6vGihtoA07W4UPRxjPdNSKgLj4
wa72Vb/hyoxEdharm00fO9bRXNNMxqiYaHNKVR9i1MbjODw2y1FXKfygCGKnyH46
q8TjYvSDzVrElXhRYDHVBb7d+FyIb8CXTI0SABd/keYXu7ZLDjo81NRJUSXrSzt3
G9tohg9xyzWcjnkw5TgbHik/3nCp0K+ReGXsyRMJ7YHDL+7M1XMLqfkzQRRs5egs
lRYSK6SK0roK7Qy5Oc/q/dq8UoJfypugDBtgK8VGwu5BMM5UFN/VbtSN+d7AUcnY
SGc5mZZCtu/Rxw1RajCudy+pGDHdJWfMq9TCIknFf1vma1dSs8PtXaSb9Zfti990
SQ5QHWV42Xcf72ZJxp2CkNTJSDhQ3BUG7AgAewwVsGj2hC6onvw=
=3Lp1
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
