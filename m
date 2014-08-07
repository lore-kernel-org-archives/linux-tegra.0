From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v3.17-rc1
Date: Thu, 7 Aug 2014 09:53:14 +0200
Message-ID: <20140807075314.GC18359@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The following changes since commit e2215321ff180f280d83837f57f3a84f8b6dda0d:

  drm/tegra: Implement race-free hotplug detection (2014-07-08 11:31:36 +10=
00)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.17-rc1

for you to fetch changes up to ef70728c7a6571a1a7115031e932b811f1740b2e:

  drm/tegra: add MODULE_DEVICE_TABLEs (2014-08-04 10:07:39 +0200)

The starting commit of this pull might look somewhat more arbitrary than
it really is. I chose that as the earliest commit in you drm-next tree
that prevented a somewhat strange merge conflict between the race-free
hotplug detection patches and one of the patches in this pull request.
Note also that this pulls in the first commit of the drm/panel pull
request to resolve a build-time dependency, so it should be safe to
merge both pull requests in arbitrary order.

Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.17-rc1

Mostly some cleanup all over the place. Pitch alignment limitations of
the display controller are now honored and job submission is 64-bit
safe.

The SOR output (used for eDP) properly configures sync signal polarities
according to the display mode rather than hard-coding them to some value
and the number of bits per color is now taken from the panel rather than
hard-coded to properly support 24-bit vs. 18-bit panels.

The DSI controller now properly supports non-continuous clock mode.

GEM objects can now have their flags and tiling mode modified via IOCTLs
to allow buffers imported from Nouveau to be properly displayed. Newer
generations of the Tegra display controller can also detile block linear
buffers at scan-out time.

Finally the driver now properly exports MODULE_DEVICE_TABLEs to allow it
to be automatically loaded when built as a module.

----------------------------------------------------------------
Alexandre Courbot (2):
      drm/dsi: Flag for non-continuous clock behavior
      drm/tegra: dsi - Handle non-continuous clock flag

Dan Carpenter (1):
      drm/tegra: sor - missing unlock on error

Stephen Warren (1):
      drm/tegra: add MODULE_DEVICE_TABLEs

St=C3=A9phane Marchesin (1):
      drm/tegra: sor - Use bits-per-color from panel

Thierry Reding (9):
      Merge branch 'drm/dsi/for-next' into drm/tegra/for-next
      drm/tegra: Implement more tiling modes
      drm/tegra: Add SET/GET_TILING IOCTLs
      drm/tegra: Add SET/GET_FLAGS IOCTLs
      drm/tegra: Allow non-authenticated processes to create buffer objects
      drm/tegra: Make job submission 64-bit safe
      drm/tegra: sor - Configure proper sync polarities
      drm/tegra: Properly align stride for framebuffers
      drm/tegra: dc - Reset controller on driver remove

 drivers/gpu/drm/tegra/dc.c    | 123 ++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h    |   5 +
 drivers/gpu/drm/tegra/dpaux.c |   1 +
 drivers/gpu/drm/tegra/drm.c   | 208 ++++++++++++++++++++++++++++++++++++++=
----
 drivers/gpu/drm/tegra/drm.h   |  10 +-
 drivers/gpu/drm/tegra/dsi.c   |   4 +-
 drivers/gpu/drm/tegra/fb.c    |  13 ++-
 drivers/gpu/drm/tegra/gem.c   |   5 +-
 drivers/gpu/drm/tegra/gem.h   |  16 +++-
 drivers/gpu/drm/tegra/gr2d.c  |   1 +
 drivers/gpu/drm/tegra/gr3d.c  |   1 +
 drivers/gpu/drm/tegra/hdmi.c  |   1 +
 drivers/gpu/drm/tegra/sor.c   |  21 ++++-
 drivers/gpu/host1x/job.c      |  22 ++---
 include/drm/drm_mipi_dsi.h    |   2 +
 include/linux/host1x.h        |  15 +--
 include/uapi/drm/tegra_drm.h  |  46 ++++++++++
 17 files changed, 427 insertions(+), 67 deletions(-)

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4zBpAAoJEN0jrNd/PrOhkpMQAMJqIoeWRg4DKVOR8Jzrq6wu
6Ii3PUSNmejV1kLHgNbsXI/vnZiym2jWgcZnc+/QRPfRX5Hnxl3PRv2MoPgUZeO8
iSrqENa+gvwIcvEgXniUOikl/02P1AsWxVyW2g9WJhjZlfXeMlCJKjb/cTfw6vqN
QpryIoeUB5awI+SXumUE9YjRDQ1H1QNz/BuzT+pgJXNxqLhjYQ5abWPVG2JuHBiC
E7ZvQ/DbTqVNe48BnKa2RbNyO5q98hglXEfqGnKXtz4GVhiz3JTPlg8BarK1CTvv
yhxv3zpVpe6rBk5ftBIQb5oHczvYekaTu03p6R07ou2cwn+9yJY+SaNP8uBLs/d4
pphe8qU9QDUdqN8NT3SHlFCS7CA2Wn5n5OQbCxdgifiyPv6mHlueJq44GWK68RFB
IxtdaIrDr5bFhi7k05xikNnCyi1L9aHYdBQl1Q/Sku1nHzECRFnsazxdbXcnxupt
OzcWfxCP2skM2XBctsqpiDXxjW20s9nszaKQLPTKYqwXgb+f2zKXKmp/1s+FpJMQ
EMO9PZGtoEJeWAyrc6mG3Ddv+5mSIvcoexdNZ9pYOzekyKAKmYCkp8VqUxKvfsuZ
TPOHCuUd9HfVhgq1VS/UgNZtzXBfBO2qdmlh7o5qnFTcN/n6wuZ5gCtA/liSX6Ib
jR9rk3Hohdcrk20Md0WC
=4wNn
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
