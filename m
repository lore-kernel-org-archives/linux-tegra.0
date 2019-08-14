From: Dariusz Marcinkiewicz <darekm@google.com>
Subject: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier API
Date: Wed, 14 Aug 2019 12:44:58 +0200
Message-ID: <20190814104520.6001-1-darekm@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc: Dariusz Marcinkiewicz <darekm@google.com>, Alex Deucher <alexander.deucher@amd.com>, Allison Randal <allison@lohutok.net>, amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Chris Wilson <chris@chris-wilson.co.uk>, Colin Ian King <colin.king@canonical.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Francis <David.Francis@amd.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Douglas Anderson <dianders@chromium.org>, Enrico Weigelt <info@metux.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Harry Wentland <harry.wentland@amd.com>, Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, Jernej Skrabec <jernej.skrabec@siol.net>
List-Id: linux-tegra@vger.kernel.org

This series updates DRM drivers to use new CEC notifier API.

Changes since v6:
	Made CEC notifiers' registration and de-registration symmetric
	in tda998x and dw-hdmi drivers. Also, accidentally dropped one
	patch in v6 (change to drm_dp_cec), brought it back now.
Changes since v5:
        Fixed a warning about a missing comment for a new member of
	drm_dp_aux_cec struct. Sending to a wider audience,
	including maintainers of respective drivers.
Changes since v4:
	Addressing review comments.
Changes since v3:
        Updated adapter flags in dw-hdmi-cec.
Changes since v2:
	Include all DRM patches from "cec: improve notifier support,
	add connector info connector info" series.
Changes since v1:
	Those patches delay creation of notifiers until respective
	connectors are constructed. It seems that those patches, for a
	couple of drivers, by adding the delay, introduce a race between
	notifiers' creation and the IRQs handling threads - at least I
	don't see anything obvious in there that would explicitly forbid
	such races to occur. v2 adds a write barrier to make sure IRQ
	threads see the notifier once it is created (replacing the
	WRITE_ONCE I put in v1). The best thing to do here, I believe,
	would be not to have any synchronization and make sure that an IRQ
	only gets enabled after the notifier is created.
Dariusz Marcinkiewicz (9):
  drm_dp_cec: add connector info support.
  drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
  dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
  tda9950: use cec_notifier_cec_adap_(un)register
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: sti: use cec_notifier_conn_(un)register
  drm: tegra: use cec_notifier_conn_(un)register
  drm: dw-hdmi: use cec_notifier_conn_(un)register
  drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 46 +++++++++++++------
 drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++------
 drivers/gpu/drm/i2c/tda9950.c                 | 12 ++---
 drivers/gpu/drm/i2c/tda998x_drv.c             | 36 ++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++--
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                | 19 +++++---
 drivers/gpu/drm/tegra/output.c                | 28 ++++++++---
 include/drm/drm_dp_helper.h                   | 17 ++++---
 13 files changed, 155 insertions(+), 94 deletions(-)

-- 
2.23.0.rc1.153.gdeed80330f-goog
