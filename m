From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v3 00/22] Associate ddc adapters with connectors
Date: Fri, 28 Jun 2019 18:01:14 +0200
Message-ID: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3fb19371-db7d-f9dc-31a7-1ccd126f6784-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>David
List-Id: linux-tegra@vger.kernel.org

It is difficult for a user to know which of the i2c adapters is for which
drm connector. This series addresses this problem.

The idea is to have a symbolic link in connector's sysfs directory, e.g.:

ls -l /sys/class/drm/card0-HDMI-A-1/ddc
lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
	-> ../../../../soc/13880000.i2c/i2c-2

The user then knows that their card0-HDMI-A-1 uses i2c-2 and can e.g. run
ddcutil:

ddcutil -b 2 getvcp 0x10
VCP code 0x10 (Brightness                    ): current value =    90, max value =   100

The first patch in the series adds struct i2c_adapter pointer to struct
drm_connector. If the field is used by a particular driver, then an
appropriate symbolic link is created by the generic code, which is also added
by this patch.

The second patch is an example of how to convert a driver to this new scheme.

v1..v2:

- used fixed name "ddc" for the symbolic link in order to make it easy for
userspace to find the i2c adapter

v2..v3:

- converted as many drivers as possible.

PATCHES 3/22-22/22 SHOULD BE CONSIDERED RFC!

Andrzej Pietrasiewicz (22):
  drm: Include ddc adapter pointer in struct drm_connector
  drm/exynos: Provide ddc symlink in connector's sysfs
  drm: rockchip: Provide ddc symlink in rk3066_hdmi sysfs directory
  drm: rockchip: Provide ddc symlink in inno_hdmi sysfs directory
  drm/msm/hdmi: Provide ddc symlink in hdmi connector sysfs directory
  drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi connector sysfs
    directory
  drm/mediatek: Provide ddc symlink in hdmi connector sysfs directory
  drm/tegra: Provide ddc symlink in output connector sysfs directory
  drm/imx: imx-ldb: Provide ddc symlink in connector's sysfs
  drm/imx: imx-tve: Provide ddc symlink in connector's sysfs
  drm/vc4: Provide ddc symlink in connector sysfs directory
  drm: zte: Provide ddc symlink in hdmi connector sysfs directory
  drm: zte: Provide ddc symlink in vga connector sysfs directory
  drm/tilcdc: Provide ddc symlink in connector sysfs directory
  drm: sti: Provide ddc symlink in hdmi connector sysfs directory
  drm/mgag200: Provide ddc symlink in connector sysfs directory
  drm/ast: Provide ddc symlink in connector sysfs directory
  drm/bridge: dumb-vga-dac: Provide ddc symlink in connector sysfs
    directory
  drm/bridge: dw-hdmi: Provide ddc symlink in connector sysfs directory
  drm/bridge: ti-tfp410: Provide ddc symlink in connector sysfs
    directory
  drm/amdgpu: Provide ddc symlink in connector sysfs directory
  drm/radeon: Provide ddc symlink in connector sysfs directory

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 70 +++++++++++-----
 drivers/gpu/drm/ast/ast_mode.c                |  1 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c         | 19 ++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 40 ++++-----
 drivers/gpu/drm/bridge/ti-tfp410.c            | 19 ++---
 drivers/gpu/drm/drm_sysfs.c                   |  7 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 11 ++-
 drivers/gpu/drm/imx/imx-ldb.c                 | 13 ++-
 drivers/gpu/drm/imx/imx-tve.c                 |  8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  9 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  1 +
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c     |  1 +
 drivers/gpu/drm/radeon/radeon_connectors.c    | 82 ++++++++++++++-----
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 17 ++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 17 ++--
 drivers/gpu/drm/sti/sti_hdmi.c                |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h            |  1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        | 14 ++--
 drivers/gpu/drm/tegra/drm.h                   |  1 -
 drivers/gpu/drm/tegra/output.c                | 12 +--
 drivers/gpu/drm/tegra/sor.c                   |  6 +-
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 16 ++--
 drivers/gpu/drm/zte/zx_hdmi.c                 | 25 ++----
 drivers/gpu/drm/zte/zx_vga.c                  | 25 ++----
 include/drm/drm_connector.h                   | 11 +++
 26 files changed, 252 insertions(+), 176 deletions(-)

-- 
2.17.1
