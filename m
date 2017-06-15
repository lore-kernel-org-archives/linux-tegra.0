From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/20] Tegra DRM fixes
Date: Thu, 15 Jun 2017 15:33:16 +0200
Message-ID: <20170615133316.GA31769@ulmo>
References: <cover.1497480751.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1497480751.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 02:18:23AM +0300, Dmitry Osipenko wrote:
> I've dropped the two "GART restoring" patches from the series, postponing
> them till a full solution of GART utilization would be ready.
>=20
> The "Forbid relocation address shifting in the firewall" patch has been
> reverted to v1, Mikko and me agreed on that it is a reasonable variant.
>=20
> All the patches got a r-b, series should be good to go.
>=20
> Dmitry Osipenko (19):
>   drm/tegra: Fix lockup on a use of staging API
>   drm/tegra: Correct idr_alloc() minimum id
>   drm/tegra: Check for malformed offsets and sizes in the 'submit' IOCTL
>   drm/tegra: Correct copying of waitchecks and disable them in the
>     'submit' IOCTL
>   drm/tegra: Check syncpoint ID in the 'submit' IOCTL
>   drm/tegra: dc: Avoid reset asserts on Tegra20
>   drm/tegra: dc: Apply clipping to the plane
>   drm/tegra: dc: Disable plane if it is invisible
>   gpu: host1x: Initialize firewall class to the jobs one
>   gpu: host1x: Correct host1x_job_pin() error handling
>   gpu: host1x: Do not leak BO's phys address to userspace
>   gpu: host1x: Forbid relocation address shifting in the firewall
>   gpu: host1x: Forbid RESTART opcode in the firewall
>   gpu: host1x: Forbid unrelated SETCLASS opcode in the firewall
>   gpu: host1x: Correct swapped arguments in the is_addr_reg() definition
>   gpu: host1x: Check waits in the firewall
>   gpu: host1x: Remove unused 'struct host1x_cmdbuf'
>   gpu: host1x: Remove unused host1x_cdma_stop() definition
>   gpu: host1x: At first try a non-blocking allocation for the gather
>     copy
>=20
> Mikko Perttunen (1):
>   gpu: host1x: Refactor channel allocation code
>=20
>  drivers/gpu/drm/tegra/dc.c         |  92 +++++++++++++++--------
>  drivers/gpu/drm/tegra/drm.c        | 141 +++++++++++++++++++++++++++++--=
----
>  drivers/gpu/drm/tegra/drm.h        |   1 +
>  drivers/gpu/drm/tegra/gem.c        |   5 --
>  drivers/gpu/drm/tegra/gem.h        |   5 ++
>  drivers/gpu/drm/tegra/gr2d.c       |  11 ++-
>  drivers/gpu/drm/tegra/gr3d.c       |   4 +-
>  drivers/gpu/drm/tegra/vic.c        |   4 +-
>  drivers/gpu/host1x/cdma.h          |   1 -
>  drivers/gpu/host1x/channel.c       | 147 +++++++++++++++++++++++--------=
------
>  drivers/gpu/host1x/channel.h       |  21 ++++--
>  drivers/gpu/host1x/debug.c         |  47 +++++-------
>  drivers/gpu/host1x/dev.c           |   7 +-
>  drivers/gpu/host1x/dev.h           |   6 +-
>  drivers/gpu/host1x/hw/channel_hw.c |   4 -
>  drivers/gpu/host1x/job.c           | 124 ++++++++++++++++++++++++-------
>  drivers/gpu/host1x/job.h           |  14 ----
>  include/linux/host1x.h             |  13 +++-
>  18 files changed, 440 insertions(+), 207 deletions(-)

Applied patches 3/20 through 20/20 to drm/tegra/for-next, thanks.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllCjJoACgkQ3SOs138+
s6FlAw//QKhB0zpZqN7efsum4SuuQnVu6pVFkHniu/ZGiWbAX0yeT1RndZZVsb+j
5xvSOfk5fbQhZZ9lZ96N6AysVlGpHqqvrsVNqYJrhxTIVKxsTLo3BSysC804bPA2
Tk7+oCUodgBSYPlcAYlQ5YC0VM4xUIvUIv5zvniC8cdBULusFol8momaD8CGXnUS
DPl0veFpyfh4ZV/W/prsIWX2ZDM8r92TA31US/gpTmY8OZ52tDWG3OLaVGWUzFQk
tPWrU3XdUI0YCBFndoBHVgJY+T7Ak/yI3Vv9LD1cZQKtQK0QSX4AkfyKMwJRFmG2
gynPq0fNnlr7B4RTCtGOaH4i8BEPTqP1hR3midmIxl9W7Dr9Ou6uKIj6pGsPU7uG
M3Yi0nDPMltj7jy3aFr+BufS0Tnp5bWXrvuUVU9swt94PQ0LeMbQIq0AMm1yaydV
gyRt4m8Pj4Q0XuqaSOJhGp9ACOqfOeAArlogI81jOGTTSgbb54VwE5IHA56m+Vdi
ckdWLGIDLf6STaNHexmdh9BFUZi+bEKj1YPm4yHUyq1uSwhNVKCE2G9i3CeSo6Zb
8C/Y3aM+jIyX77paT/nn4IyzYI/4THUHnVp2J9KKHIWmMJ0r5PPAmLijFUKxpibU
uNKfbXC6qa3dJ8pKfxWvplamW9+NpnGSTwx9PdxS32p0zJoHOkw=
=1Hui
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
