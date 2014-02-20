From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/5] drm/dp: Introduce AUX channel infrastructure
Date: Thu, 20 Feb 2014 16:55:29 +0100
Message-ID: <1392911734-6689-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

This small series introduces some infrastructure to support AUX channels
in a generic way. Drivers make use of it by embedding and filling in a
struct drm_dp_aux. Various helpers can then be used to for example read
from or write to the DPCD.

Patch 1 adds the basic infrastructure as well as a couple of helpers to
access the DPCD.

The helper introduced in patch 2 can be used to obtain the link status
as expected by various existing DP helpers.

More convenience helpers are added in patch 3, which can come in handy
during DP initialization.

An AUX channel can also be used to implement I2C-over-AUX and patch 4
implements an I2C adapter that can be used with the DRM EDID helpers.

Finally the Tegra eDP support in patch 5 shows how drivers can make use
of this new infrastructure.

Changes in v5:
- export DPCD helpers so that they are available in modules
- keep MOT set between I2C messages (as suggested by Ville)
- reshuffle some comments to where the fit better
- return -EPROTO on short reads in DPCD helpers
- relicense Tegra driver under GPL v2 for consistency

Changes in v4:
- fix a couple of typos in comments

Changes in v3:
- address comments by Jani Nikula:
  - keep debug and error messages in AUX helpers
  - read/write back-to-back registers in chunks
  - separate link power up and configuration
  - do not power up for DPCD prior to 1.1
  - sleep after power up as per the spec
  - return number of bytes transferred
  - factor out some common code
  - reorder function arguments
  - fix typo in comment
- address comments by Daniel Vetter:
  - embed i2c_adapter within struct drm_dp_aux
  - describe error codes

Changes in v2:
- reimplement I2C-over-AUX functionality to get rid of the additional
  layer
- extract retry logic from existing drivers
- add more kerneldoc comments

Thierry

Thierry Reding (5):
  drm/dp: Add AUX channel infrastructure
  drm/dp: Add drm_dp_dpcd_read_link_status()
  drm/dp: Add DisplayPort link helpers
  drm/dp: Allow registering AUX channels as I2C busses
  drm/tegra: Add eDP support

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |   42 +
 drivers/gpu/drm/drm_dp_helper.c                    |  395 +++++++
 drivers/gpu/drm/tegra/Makefile                     |    2 +
 drivers/gpu/drm/tegra/dc.h                         |    1 +
 drivers/gpu/drm/tegra/dpaux.c                      |  544 ++++++++++
 drivers/gpu/drm/tegra/dpaux.h                      |   73 ++
 drivers/gpu/drm/tegra/drm.c                        |   19 +-
 drivers/gpu/drm/tegra/drm.h                        |   20 +
 drivers/gpu/drm/tegra/output.c                     |    8 +
 drivers/gpu/drm/tegra/sor.c                        | 1092 ++++++++++++++++++++
 drivers/gpu/drm/tegra/sor.h                        |  278 +++++
 include/drm/drm_dp_helper.h                        |  111 ++
 12 files changed, 2583 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/dpaux.c
 create mode 100644 drivers/gpu/drm/tegra/dpaux.h
 create mode 100644 drivers/gpu/drm/tegra/sor.c
 create mode 100644 drivers/gpu/drm/tegra/sor.h

-- 
1.8.4.2
