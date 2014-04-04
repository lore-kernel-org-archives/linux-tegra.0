From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v3.15-rc1
Date: Fri, 4 Apr 2014 09:28:27 +0200
Message-ID: <20140404072826.GB28305@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1754718234=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1754718234==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit 88759686c702f1fbbb8e737e6231b64a9880db73:

  drm/dp: Allow registering AUX channels as I2C busses (2014-02-26 17:21:34 +0100)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.15-rc1

for you to fetch changes up to d105a6c97e43e35fd4f852928bb8a19df235c6e7:

  drm/tegra: Use standard GPL v2 license text (2014-04-04 09:12:51 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.15-rc1

Implement eDP support for Tegra124 and support the PRIME vmap()/vunmap()
operations.

A symbol that is required for upcoming V4L2 support is now exported by
the host1x driver.

Relicense drivers under the GPL v2 for consistency. One exception is the
public header file, which is relicensed under MIT to abide by the common
rule.

----------------------------------------------------------------
Bryan Wu (1):
      gpu: host1x: export host1x_syncpt_incr_max() function

Thierry Reding (5):
      drm/tegra: prime: Add vmap support
      drm/tegra: Add eDP support
      drm/tegra: Relicense public header under MIT
      drm/tegra: Relicense under GPL v2
      drm/tegra: Use standard GPL v2 license text

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |   42 +
 drivers/gpu/drm/tegra/Makefile                     |    2 +
 drivers/gpu/drm/tegra/dc.h                         |    1 +
 drivers/gpu/drm/tegra/dpaux.c                      |  544 ++++++++++
 drivers/gpu/drm/tegra/dpaux.h                      |   73 ++
 drivers/gpu/drm/tegra/drm.c                        |   19 +-
 drivers/gpu/drm/tegra/drm.h                        |   20 +
 drivers/gpu/drm/tegra/dsi.c                        |   20 +-
 drivers/gpu/drm/tegra/dsi.h                        |   20 +-
 drivers/gpu/drm/tegra/gem.c                        |   25 +-
 drivers/gpu/drm/tegra/gem.h                        |   14 +-
 drivers/gpu/drm/tegra/gr2d.c                       |   14 +-
 drivers/gpu/drm/tegra/mipi-phy.c                   |   20 +-
 drivers/gpu/drm/tegra/mipi-phy.h                   |   20 +-
 drivers/gpu/drm/tegra/output.c                     |    8 +
 drivers/gpu/drm/tegra/sor.c                        | 1092 ++++++++++++++++++++
 drivers/gpu/drm/tegra/sor.h                        |  278 +++++
 drivers/gpu/host1x/syncpt.c                        |    1 +
 include/linux/host1x.h                             |    1 +
 include/uapi/drm/tegra_drm.h                       |   24 +-
 20 files changed, 2129 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/dpaux.c
 create mode 100644 drivers/gpu/drm/tegra/dpaux.h
 create mode 100644 drivers/gpu/drm/tegra/sor.c
 create mode 100644 drivers/gpu/drm/tegra/sor.h

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTPl8aAAoJEN0jrNd/PrOhO1UQALpbombEDU+E25AMKBt158Do
xzDpEDiCKFsnI9AHmb1ULhcibVQbIDfAuaYjUBeVh72+03iZMTc6L4KEr44klGOc
+twxlmFBOEvoPD/vSz5USGQoP6m+Uf4N9UQhQZS1MxS9fLHEdCejoK+p0hnSEsrM
Pafz68RczXNxztg178gNUiPA/fdWNPgq/FRIotyieLfo3FWpePxYbVF7FljSZvK4
WYPkSFxktyyUqF/PnA1r3omCYmXQPWu73WsZn8GIqqI2VW9YetBsF0qHhaKHpaLG
w52yMwnD0id9VxPAMWbC9F+a4JBxboEFx0O03PfCtk5Wr9+b8dsOGswz8FkI2ofO
NfYvsxpphdzzeaR76P8b5BHQ8EGo8EQzi3GHfG02WayPhj7wq5uD5jslRnp6Ow1N
6e2J7Umu+WnnL30pV4O/ZREUpGCp/Ck4iUaRF2cR4Wfle6rlwVgoJf1LK45OtGns
dbiZS6ijdqrdsph9/PqTonVyTafDLFRhzDOvbaRdtmMbmW9RL2j10FdCc8W7Qsmd
uKTb4Xplifb0cmEgBOOkVVvhw7ypxEnNFv4fzd4xS/pkQdQ78J9trOMxWU4kZZPL
Wdm8Uplce5ziGwR+l/NiTenRtL81HT8dMKr31yA14bhVbqL7wMhAJnv8/vzmjo0z
wx+Uw8Kd2gO+ZLIitPOo
=vGzb
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--

--===============1754718234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1754718234==--
