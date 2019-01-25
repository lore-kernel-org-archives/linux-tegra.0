From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/13] drm/tegra: Fix IOVA space on Tegra186 and later
Date: Fri, 25 Jan 2019 10:23:22 +0100
Message-ID: <20190125092322.GB22320@ulmo>
References: <20190124180254.20080-1-thierry.reding@gmail.com>
 <2e8e7353-ecdb-a0d4-14ed-bb8f161ff202@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0735018130=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2e8e7353-ecdb-a0d4-14ed-bb8f161ff202@gmail.com>
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


--===============0735018130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 12:38:01AM +0300, Dmitry Osipenko wrote:
> 24.01.2019 21:02, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra186 and later are different from earlier generations in that they
> > use an ARM SMMU rather than the Tegra SMMU. The ARM SMMU driver behaves
> > slightly differently in that the geometry for IOMMU domains is set only
> > after a device was attached to it. This is to make sure that the SMMU
> > instance that the domain belongs to is known, because each instance can
> > have a different input address space (i.e. geometry).
> >=20
> > Work around this by moving all IOVA allocations to a point where the
> > geometry of the domain is properly initialized.
> >=20
> > This second version of the series addresses all review comments and adds
> > a number of patches that will actually allow host1x to work with an SMMU
> > enabled on Tegra186. The patches also add programming required to
> > address the full 40 bits of address space.
> >=20
> > This supersedes the following patch:
> >=20
> >     https://patchwork.kernel.org/patch/10775579/
>=20
> My understanding is that falcon won't boot because source DMA address
> of the firmware isn't set up correctly if the address is >32bit.
> Please correct me if I'm wrong, otherwise that need to be addressed in
> this series as well for completeness.

What makes you say so? I was runtime testing this series as I was
developing these patches and this works properly on Tegra186 with a 40
bit address space. Since the carveout is allocated from the top of the
IOMMU aperture, the addresses that the Falcon sees are always from the
top of the 40 bit IOVA space and this works flawlessly.

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxK1YoACgkQ3SOs138+
s6G6nRAAtTR5aODNGJE7kEbO0kZBHKqVhqFAKnVVkpAzvFFcZdfXEpN9v4qUO4mz
TTaIcwnPcrWT1YfXVMH3eKYcit66UEggXJgZ9KEf7utV118aFsWqzfy1VY/a/7mP
m2N24MPC7YAFriREBZZzRrhmKnpRkmAAhFGcXk/ZvC2ptRAUj0B9NjSSg0z2Fqcr
x3as6a83fjXVeIYzNpx2xN9Zm8j3jBDthDsQ8kfT1N+8V117kGkM7lKjNGBKm5Kd
Tq9r+OM4apxESNeblEW0EO/x3h68jJjIA8HLM1GKaIJg/XallbWyNH87eWsSpqDo
3oZgHT9NVk6JV8ixcxdDpMyp1+SPRhfLJ+ahEGM+HXT5OhjrnIUda3BSzHVjzWyz
urUP5T0pGJ+mJkSbYh2z/MnMnrovQhwgDU9BXFKesnqf0scykGdVqk1mFwgoKOOl
0OnxNyIbdkP58T/UL/scaBqt8Nh9jY0Qhf4RcH0XDTLMTh7tFALyYm7qzmqwbqI2
nj7W/OKWsojCUjk5nB8In1Mc94LfJcarvjAK9eO4aLmtlwh2UqcmuXm7Lq75W65W
uOy30rYvtRLTgC5b1GR9lV181p5dz2syTB4kt/OBeEgi5i80en+hH4oyryuQDGJA
arlKbONYCtl+28V49UUAp7lYVRuOth0U33IlgQRuoWH1Lv105mo=
=2XbZ
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============0735018130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0735018130==--
