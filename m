From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/6] Miscellaneous improvements to Host1x and TegraDRM
Date: Thu, 19 Oct 2017 14:00:06 +0200
Message-ID: <20171019120006.GR9005@ulmo>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2138386464=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170928125044.32516-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, digetx@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============2138386464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FNX2SHge3qdlDajY"
Content-Disposition: inline


--FNX2SHge3qdlDajY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 03:50:38PM +0300, Mikko Perttunen wrote:
> New in v3:
> - Renamed *syncpt_assign_channel to *syncpt_assign_to_channel
> - Disassembler ignores opcodes not supported on the particular
>   chip
> - Further cleanup in u64_to_user_ptr patch
>=20
> New in v2:
> - Changes in syncpoint protection and u64_to_user_ptr patches.
>   See the patches for notes.
> - Added patch to support more opcodes in the debug dump
>   disassembly.
> - Added patch to fix an incorrect comment.
>=20
> Thanks,
> Mikko
>=20
> Patch v1 notes:
>=20
> Hi all,
>=20
> here are some new features and improvements.
>=20
> Patch 1 enables syncpoint protection which prevents channels from
> touching syncpoints not belonging to them on Tegra186.
>=20
> Patch 2 enables the gather filter which prevents userspace command
> buffers from using CDMA commands usually reserved for the kernel.
> A test is available at git://github.com/cyndis/host1x_test, branch
> gather-filter.
>=20
> Patch 3 greatly improves formatting of debug dumps spewed by host1x
> in case of job timeouts. They are now actually readable by humans
> without use of additional scripts.
>=20
> Patch 4 is a simple aesthetical fix to the TegraDRM submit path.
>=20
> Everything was tested on TX1 and TX2 and should be applied on the
> previously posted Tegra186 support series.
>=20
> Cheers,
> Mikko
>=20
>=20
> Mikko Perttunen (6):
>   gpu: host1x: Enable Tegra186 syncpoint protection
>   gpu: host1x: Enable gather filter
>   gpu: host1x: Improve debug disassembly formatting
>   gpu: host1x: Disassemble more instructions
>   gpu: host1x: Fix incorrect comment for channel_request
>   drm/tegra: Use u64_to_user_ptr helper
>=20
>  drivers/gpu/drm/tegra/drm.c                 |  29 ++++----
>  drivers/gpu/host1x/channel.c                |   3 +-
>  drivers/gpu/host1x/debug.c                  |  14 +++-
>  drivers/gpu/host1x/debug.h                  |  14 ++--
>  drivers/gpu/host1x/dev.h                    |  15 ++++
>  drivers/gpu/host1x/hw/channel_hw.c          |  25 +++++++
>  drivers/gpu/host1x/hw/debug_hw.c            | 103 ++++++++++++++++++++++=
------
>  drivers/gpu/host1x/hw/debug_hw_1x01.c       |  10 +--
>  drivers/gpu/host1x/hw/debug_hw_1x06.c       |  12 ++--
>  drivers/gpu/host1x/hw/hw_host1x04_channel.h |  12 ++++
>  drivers/gpu/host1x/hw/hw_host1x05_channel.h |  12 ++++
>  drivers/gpu/host1x/hw/syncpt_hw.c           |  46 +++++++++++++
>  drivers/gpu/host1x/syncpt.c                 |   8 +++
>  13 files changed, 252 insertions(+), 51 deletions(-)

Applied, thanks.

Thierry

--FNX2SHge3qdlDajY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnok8MACgkQ3SOs138+
s6G0FQ/+Ii+XO4VfMH+C5+CYxnj42tK0fJkPTYvT0+Zyd+IJ/wAQ7lt0jn4Du6Lx
rxOD7qfzVz/WRviLNQi45scSK+90mq+X+Lg5avVuH4+kqq44qAbxet+wEz0WXdG5
6Js8vOzr1us2L0j6m9WMX45ff2TDqKAqPxsiZD+tszrH5IqOhysalWZZgzoKt0S9
jeOoyispSs0Mbcm4RPmSaXi4Pz8DlNUlxkT/gN94xNXk8TObpi3xbYWF3zTGMOkY
xUl63OuliSW+RPEF7Z0vgAB2ilF9hhvWaVEGGYR9Wr5pZw4W7iowez8UXnTn1Hgh
vi4Q4GDKhisqpqKEI7QHU1rcHLoAZ0XXS+Jagh9bSKjABdRh279Ye2mw5qUYhOFk
u9kSqhJKF9SyifETYR42Z8qy9RHdHZ6G40xH0y5DwezJ1cHLCwJQhz6JQl5LtslO
Hhn4oNs6YxVzWaXNwOk+GCzTkZSrolpicYMXWkB+K6iaAsaDov2APQvlL6KRrnpm
3nuaIqP6Gd8z9EC9VjdTMyAzXDxgiqjTjzyHAQginTLbFFP9haW7h1chYcHIKfQ/
Mvovlw2NgoAQZnOY8/tVYa/tYb3Vx94Mp5bjBxW31StXWW9T4sSClkcj40qyte8l
5hH4uwy2MlNLetB+ACqqjgbHLAFN5DPqV9L7ZXfH6wXgV1JmH2Y=
=H2we
-----END PGP SIGNATURE-----

--FNX2SHge3qdlDajY--

--===============2138386464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2138386464==--
