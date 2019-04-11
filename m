From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix compile error when IOMMU API is not
 available
Date: Thu, 11 Apr 2019 17:37:01 +0200
Message-ID: <20190411153701.GA30800@ulmo>
References: <4c3d021c73c001f633803e364cfbc6ace3381205.1554936354.git.stefan@agner.ch>
 <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
 <20190411083017.GB4633@ulmo>
 <c73bb650-7175-150b-a678-c707e5f0e7e7@kapsi.fi>
 <ff7e06b6-587c-6098-92ab-ff2fbab6e651@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0530217040=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ff7e06b6-587c-6098-92ab-ff2fbab6e651@gmail.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0530217040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 02:31:48PM +0300, Dmitry Osipenko wrote:
> 11.04.2019 13:06, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 11.4.2019 11.30, Thierry Reding wrote:
> >> On Thu, Apr 11, 2019 at 09:23:13AM +0100, Ben Dooks wrote:
> >>>
> >>>
> >>> On 2019-04-10 23:47, Stefan Agner wrote:
> >>>> In case the IOMMU API is not available compiling host1x fails with
> >>>> the following error:
> >>>> =C2=A0=C2=A0 In file included from drivers/gpu/host1x/hw/host1x06.c:=
27:
> >>>> =C2=A0=C2=A0 drivers/gpu/host1x/hw/channel_hw.c: In function
> >>>> =E2=80=98host1x_channel_set_streamid=E2=80=99:
> >>>> =C2=A0=C2=A0 drivers/gpu/host1x/hw/channel_hw.c:118:30: error: impli=
cit
> >>>> declaration of function
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0 =E2=80=98dev_iommu_fwspec_get=E2=80=99; did=
 you mean =E2=80=98iommu_fwspec_free=E2=80=99?
> >>>> [-Werror=3Dimplicit-function-declaration]
> >>>> =C2=A0=C2=A0 struct iommu_fwspec *spec =3D
> >>>> dev_iommu_fwspec_get(channel->dev->parent);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu_fwspec_free
> >>>>
> >>>> Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
> >>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >>>
> >>> would it be better to provide something like this i nthe header that
> >>> defines dev_iommu_fwspec_get() to be:
> >>>
> >>> static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device=
 *dev)
> >>> { return NULL; }
> >>>
> >>> although returning an PTR_ERR would have been better.
> >>
> >> I don't think there's really a large number of failures here. Either
> >> your device has an IOMMU fwspec or it doesn't.
> >>
> >> But yes, I think it'd be better to have the above static inline dummy =
in
> >> iommu.h, but I'll apply this for now in the hopes of getting it in
> >> before v5.1 final.
> >=20
> > A similar patch was already sent before by someone. That one also progr=
ams the bypass stream ID (0x7f) even if IOMMU is disabled. We should pick t=
hat patch instead.
>=20
> For the record.. here is that patch https://patchwork.ozlabs.org/patch/10=
52364/

Ugh... too late. I'll apply Arnd's patch on top of this one.

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyvXxgACgkQ3SOs138+
s6HqaQ/+L1ZIgrilwmTjL3NoeC6kmTLKTR22Ea8RlW9yfbEnsSCuByBSTuVEaaPt
QiivsmNnlTlqFNnuMtPZ8j9QlXUbYfN2Fa7s0PmFdsoGhOnRpPiWGDn1t0xFm2hi
m/1tRxnn2GCywrltgq/wMrC2QQPhuaYbRH3FjthkejILM2+42TT6w7YC3xR73jvS
qLtOfQAb3Jf1Ovd+pzJgE05s7hcoPg+GTujHnidYx8+I30w4MJSTObWYeqLRvPBb
/BchKKgw4jpz+L9GhI5S5iO47wD0xjGX726d/PAPfKxQCgTyjmUQVr23zwaUaPgH
wFcwmV2B18ZrHfBaviM+2KY+HWgBGVkH29nEiaaKOpUGPTl2lDvTY+J4eafIydpZ
TB21wQF22F5v/PNJ083GAMksQszwVweY4FrqyFJFvQ6r+DaVg6ad7qtznpBcOFJn
ve5jKPAR5cUrP+aI2iiaSkpU8jMS801/EIvt5xYeAl3i1t4JOq4YUz0OX3b5+Fph
7IKwAeVECxabQolH208X8yaOJSvCDB2ZszS39sA+IKz66EK5tgy8fcrwj6FLmbtN
EtfVs6FZIxcaN5ZvocNyR0zmLStVU7Tnqz71Rh6m1qJK0Ma4tQtcemJ41MrsoRD1
BgX5l+ZSzbScWwiY5avMi6msVgIpTBjXnns3lIBvoz3sTOPNQFI=
=4M++
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============0530217040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0530217040==--
