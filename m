From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm: Add NVIDIA Tegra30 support
Date: Fri, 16 Nov 2012 07:43:31 +0100
Message-ID: <20121116064331.GA21671@avionic-0098.mockup.avionic-design.de>
References: <1353041889-3114-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353041889-3114-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 12:58:09PM +0800, Mark Zhang wrote:
> This patch is based on Thierry's drm patch for Tegra20:
> - [PATCH v2 0/6] Device tree updates for host1x support
> - [PATCH v3 0/2] NVIDIA Tegra DRM driver
>=20
> It adds the support for NVIDIA Tegra30.
>=20
> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Mark,

I already carry a similar patch in my tegra/next branch and was going to
post that once I get word back that tegra-drm actually works on Tegra30.

You do have the hardware available, right? Did you test this patch on
top of the latest (v3) tegra-drm patches and arch/arm/mach-tegra (v2)
patches I sent a few hours ago?

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpeCTAAoJEN0jrNd/PrOhkBMP/ROXfhJ5jbPERlvV+XC0tdb0
/Bi0TZ/fK5UlYHRv1+tZsKs/mEHOfMHLLx+hqCsmt3eRj5txWmWQE6nIoe/z/R+s
A3ZNygwfM0gnF4uNyCwMd7M9+n/OpUSDIbC9YBNom5BesDq2VxSV28dG2zngUn8M
zeNtA+4/KX/Hg3iZ4KxA75rDRgpL4TqGFOKV0keqynozeMNG7om+8ErmmVGN7jjP
xQOuFr3iXNPliPUn6WY05XKXgmnITEAk6eTAJSctO1FVN3IDmzj9YBbx5bToo1Zo
qJerjaFWvWLb09l3wtdzj72UlleuvVnwdNfQTYgnIDTObDAi9LkZ1Jl55I6i4TWz
yC90+2jlxUHcU0XUHGHoHrXGrgQEB6cKRwCPk6t8FhxbU6O46nsbCs6Q3xH3TmPm
5I+F64TetLEE8o3/g/2yTVezY8TloiYF9DhwDT1YIN0soxb6+lBysU8sJAYlQlGr
UyivgQANFWq0YCAP3izke5/sRW+29EgcqL3+mjceT6VmvyiFO2Hvu9TTKShIwO9V
aUrISWx9DbyAec7gb5IRgqoDABUw0jqjg1udUPT95fE6z99D1ISXFDkf1EyhPLqw
E2N7AXsnJb2K+G80rcGg2Xa9vqkDvibnalFlNgCGv/w1AmM37h5/H32ety16SDh4
/ZkaldN3X4npwo3uTJ6x
=jI5L
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
