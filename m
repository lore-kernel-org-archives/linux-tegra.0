From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Date: Thu, 24 Oct 2019 17:56:20 +0200
Message-ID: <20191024155620.GG2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com>
 <20191024115804.GB2924027@ulmo>
 <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
 <20191024135018.GD2924027@ulmo>
 <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 06:47:23PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 16:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 24, 2019 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> >> 24.10.2019 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> >>>> This should should fire up on the DRM's driver module re-loader beca=
use
> >>>> there won't be enough available domains on older Tegra SoCs.
> >>>>
> >>>> Cc: stable <stable@vger.kernel.org>
> >>>> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
> >>>>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
> >>>>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
> >>>>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
> >>>>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
> >>>>  5 files changed, 14 insertions(+), 10 deletions(-)
> >>>
> >>> I think I understand what this is trying to do, but the commit message
> >>> does not help at all. So what's really going on here is that we need =
to
> >>> detach the device from the group regardless of whether we're sharing =
the
> >>> group or not, just like we attach groups to the shared domain whether
> >>> they share the same group or not.
> >>
> >> Yes, the commit's message could be improved.
> >>
> >>> But in that case, I wonder if it's even worth splitting groups the way
> >>> we are right now. Wouldn't it be better to just put all the devices i=
nto
> >>> the same group and be done with it?
> >>>
> >>> The current code gives me headaches every time I read it, so if we can
> >>> just make it so that all the devices under the DRM device share the s=
ame
> >>> group, this would become a lot easier to deal with. I'm not really
> >>> convinced that it makes much sense to keep them on separate domains,
> >>> especially given the constraints on the number of domains available on
> >>> earlier Tegra devices.
> >>>
> >>> Note that sharing a group will also make it much easier for these to =
use
> >>> the DMA API if it is backed by an IOMMU.
> >>
> >> Probably I'm blanking on everything about IOMMU now.. could you please
> >> remind me what "IOMMU group" is?
> >>
> >> Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? But then
> >> each display controller has its own SWGROUP.. and thus that sharing ju=
st
> >> doesn't make any sense, hm.
> >=20
> > IOMMU groups are not directly related to SWGROUPs. But by default the
> > IOMMU framework will share a domain between members of the same IOMMU
> > group.
>=20
> Ah, I re-figured out that again. The memory controller drivers are
> defining a single "IOMMU group" for both of the display controllers.
>=20
> > Seems like that's really what we want here, so that when we do
> > use the DMA API, all the devices part of the DRM device get attached to
> > the same IOMMU domain, yet if we don't want to use the DMA API we only
> > need to detach the one group from the backing.
>=20
> Yes, it should be okay to put all DRM devices into the same group, like
> it is done now for the displays. It also should resolve problem with the
> domains shortage on T30 since now there are maximum 3 domains in use:
> host1x, drm and vde.
>=20
> I actually just checked that the original problem still exists
> and this change solves it as well:
>=20
> ---
> diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra3=
0.c
> index 5a0f6e0a1643..e71096498436 100644
> --- a/drivers/memory/tegra/tegra30.c
> +++ b/drivers/memory/tegra/tegra30.c
> @@ -1021,6 +1021,9 @@ static const struct tegra_smmu_swgroup
> tegra30_swgroups[] =3D {
>  static const unsigned int tegra30_group_display[] =3D {
>  	TEGRA_SWGROUP_DC,
>  	TEGRA_SWGROUP_DCB,
> +	TEGRA_SWGROUP_G2,
> +	TEGRA_SWGROUP_NV,
> +	TEGRA_SWGROUP_NV2,
>  };
>=20
>  static const struct tegra_smmu_group_soc tegra30_groups[] =3D {
> ---
>=20
> Please let me know whether you're going to make a patch or if I should
> do it.

I've been testing with a similar change and couldn't find any
regressions. I've also made the same modifications for Tegra114 and
Tegra124.

Are you saying that none of these patches are needed anymore? Or do we
still need a patch to fix detaching? I'm thinking that maybe we can
drastrically simplify the detachment now by dropping the shared
parameter altogether.

Let me draft a patch and send out the whole set for testing.

Thierry

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xyaEACgkQ3SOs138+
s6HnnQ/45Iq7p3JKafC7dZfiSyfjIwnyT796I2ftsGsYuTIyx6PgUnFPo14rEC27
/GQU/Ih/ojsx1HuK6/T7DyatN273kKn7UqyyeKj9dt2sl35N99ffNBJyNxoE69K8
2BgH+TZi4Dryp638YhvuHukVgdXqlyb4EFuuVhdo/eCGlx9+uVfAxXuMshtLmENz
/Fikj/6fwNO6AQn6oRxdre4Qp4XU/YSBk1QVN3J1P13NF3O6tp+3s+UN3Ox6hgB4
9owf80JZNPbP6FscSlTHwxba+41duQJ5Y2u0TNFzJwYsIj9kJZ7FFGlaJTE8xU0o
TJCX1t2Jz8AsERHwQnH0UTIBbFc/lKqyxqM4FrRQZOs5udRto5pb/3wSl9+nFfRf
CSf5zTBTREnNMMZXv79HrRQFeIzcrPtOaZHOJp4je+Y04XV4qPk9ZANe+5gcMqxc
9jv60dZSrh4EM1uEeFqJDwesW1huPK9jQXfZoYjXkjIXHL3igqAGrvovGGD2yeO9
S2kDAexj+9XQNvOXxjjF8QMq/pTpyx8E6PRzXkZTtui47pRhWXZYTAPvUKPDu0Zi
hz1w/BQUap3S3axNKa4FaFA1F9E40bY2RRaFXGvPW80pbya9qRJx/p/UuDrqCSY6
RoX9lvDgtj2a+8b9KILk1ZwzyNfkkKhJgbQQpVG+3OPzXcHfyQ==
=Ymgn
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
