From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Date: Thu, 24 Oct 2019 15:50:18 +0200
Message-ID: <20191024135018.GD2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com>
 <20191024115804.GB2924027@ulmo>
 <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> >> This should should fire up on the DRM's driver module re-loader because
> >> there won't be enough available domains on older Tegra SoCs.
> >>
> >> Cc: stable <stable@vger.kernel.org>
> >> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
> >>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
> >>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
> >>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
> >>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
> >>  5 files changed, 14 insertions(+), 10 deletions(-)
> >=20
> > I think I understand what this is trying to do, but the commit message
> > does not help at all. So what's really going on here is that we need to
> > detach the device from the group regardless of whether we're sharing the
> > group or not, just like we attach groups to the shared domain whether
> > they share the same group or not.
>=20
> Yes, the commit's message could be improved.
>=20
> > But in that case, I wonder if it's even worth splitting groups the way
> > we are right now. Wouldn't it be better to just put all the devices into
> > the same group and be done with it?
> >=20
> > The current code gives me headaches every time I read it, so if we can
> > just make it so that all the devices under the DRM device share the same
> > group, this would become a lot easier to deal with. I'm not really
> > convinced that it makes much sense to keep them on separate domains,
> > especially given the constraints on the number of domains available on
> > earlier Tegra devices.
> >=20
> > Note that sharing a group will also make it much easier for these to use
> > the DMA API if it is backed by an IOMMU.
>=20
> Probably I'm blanking on everything about IOMMU now.. could you please
> remind me what "IOMMU group" is?
>=20
> Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? But then
> each display controller has its own SWGROUP.. and thus that sharing just
> doesn't make any sense, hm.

IOMMU groups are not directly related to SWGROUPs. But by default the
IOMMU framework will share a domain between members of the same IOMMU
group. Seems like that's really what we want here, so that when we do
use the DMA API, all the devices part of the DRM device get attached to
the same IOMMU domain, yet if we don't want to use the DMA API we only
need to detach the one group from the backing.

Thierry

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xrBoACgkQ3SOs138+
s6HAxA/5AeNjNjEtlebhSve7R8IrbcFhMUsOJ4W+Kk3Fht2LEborZyXuxc8rAu+a
4ddRKtOPBDigYniq484cKh+HrDvpj3O0tkcoPotx84I7r0fDpyqdt/s47p3mOlLB
pGeCEDR8RoQyfxPfKwVQOITYVlJ7GspcYheBWZUM2gaIdFJn9gK20gd5QITlYWMj
IjjNOejpHSahXqoHKJ9pOWiNiW4YR6e0vciegEqYddRBIy3qhl34UsfQew0SejqU
61J+mmcb0YyB5WnipM91yUZlVIG5s6iR+GzPXyMwiLIVIJRz/j7zT8gptFED+tGy
/toXxINL3toi/t2jceIB0A7qTjUQ38UKkc/HNcsY9EJ+aeB/oOKX2KcwZjKTZjct
KTuYrMVhOZfB4FSLy+0hRpmi2/wf7RSjmSV2g22eHPtvw5y0hmENIZBYPZn29O22
lW/I/71RSYl0cJ61hxwzhZCpRx/zINKp63GFyZhtmxuR0uftEjLkZV1msItRZbOl
3khkuU+ccAeLXr3P2LyriTGnhP0Jz73uC+KH6tZ4jcdJHFBP0q70TtROa3hBKY1Q
TXE0pFDFdM8rA14IrqBIaNj4tdQoMrSVZhhlhy8loABjJ8azys+VW6SQGx4+lo0z
EKyDaMw3lL9EwP8plsTqZHDSCHRO1BnsOuFhoBnDEJt8zgeEDwE=
=YETi
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
