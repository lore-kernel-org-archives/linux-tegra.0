From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] gpu: host1x: Add syncpoint base support
Date: Fri, 11 Oct 2013 11:45:17 +0200
Message-ID: <20131011094516.GC8659@ulmo.nvidia.com>
References: <1381319650-9799-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381319650-9799-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2013 at 02:54:07PM +0300, Arto Merilainen wrote:
> The host1x driver uses currently syncpoints statically from host1x point =
of
> view. If we do a wait inside a job, it always has a constant value to wai=
t.
> host1x supports also doing relative syncpoint waits with respect to syncp=
oint
> bases. This allows doing multiple operations inside a single submit and
> waiting an operation to complete before moving to next one.
>=20
> This set of patches adds support for syncpoint bases to host1x driver and
> enables the support for gr2d client. The series is based on 3.12-rc4.
>=20
> I have tested the series using the host1x test application (available at =
[0],
> function test_wait_base() in tests/tegra/host1x/tegra_host1x_test.c) on c=
ardhu.
> I would appreciate help in reviewing the series and testing the patches
> on other boards.
>=20
> [0] https://gitorious.org/linux-host1x/libdrm-host1x
>=20
> Arto Merilainen (3):
>   gpu: host1x: Add syncpoint base support
>   drm/tegra: Deliver syncpoint base to user space
>   drm/tegra: Reserve base for gr2d
>=20
>  drivers/gpu/host1x/dev.h                   |  2 ++
>  drivers/gpu/host1x/drm/drm.c               |  2 ++
>  drivers/gpu/host1x/drm/gr2d.c              |  2 +-
>  drivers/gpu/host1x/hw/channel_hw.c         | 19 +++++++++++
>  drivers/gpu/host1x/hw/hw_host1x01_uclass.h |  6 ++++
>  drivers/gpu/host1x/syncpt.c                | 55 ++++++++++++++++++++++++=
+++---
>  drivers/gpu/host1x/syncpt.h                | 10 ++++++
>  include/uapi/drm/tegra_drm.h               |  4 ++-
>  8 files changed, 93 insertions(+), 7 deletions(-)

Generally this looks pretty good. It does conflict with some of the
changes in my tree, but I think I can fix that up when applying.

Thanks,
Thierry

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSV8isAAoJEN0jrNd/PrOhE9oP/RvnPTOArcW712TN/1ZckBov
u+fAfDl8ekv9cHHgFGqV3Q1/Dt6/m9RHDKf0CEWi0VZTuAlm/LIhmQgTryKJKBAe
Uf82leEygcIdcHDxc+P81yop37fz4jGPWIC/xbQvu68096Vou6wvTmkPTRlwtlfA
1IZ9bcfyGH6utPZLIEpURzXFB48+oiOgvzRVgfFBLi+HbqES84vV8PZtwWbRlXzP
VHacm9dkGGhCzG5sqDKQUjSqUylKnmMRVMxZg2dQjtYk5rjMv9DsrPy3jdpT/NRB
PcrrXYF7ZhR4wKu13C5q0f5ZXiJIbqnmDywiTh7l3m/VgXSkeC8iwFFsX0BPk9Gz
taQ6cj7ANhdDdbueyRDpfGS9/R9vg5oYyqPsN7rIac9C/GgXtevLK6YRZIGo2NX1
suyS3k6/D26oS0u5y5S7dTO4SIYufRmaP5xu6fT2tiDbcWGKXCqOIb83L5bS0Siw
CCeupSu4OLGCcSynY2cTP9bdZuHbW6BUAOZJh5T62P7EA2U5rNdUY44m3LUqbdJN
zeeoib22i4qLe8zVt1NxZH+w798YlzFCaOGqLFs9pav9GlFn3u0jaE9eicNqLbx6
NnkEyril1o28qsWWDLZWtWnW/8Bah/30ilNrqBVaee1RXq3ooyyQb1YO1cTQWyv1
bcjKOtXwvO3jab1EiGWX
=kgdq
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
