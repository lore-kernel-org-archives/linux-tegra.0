From: allen <allen.chen@ite.com.tw>
Subject: [PATCH v4 0/4] IT6505 cover letter
Date: Fri, 15 Nov 2019 17:52:16 +0800
Message-ID: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Allen Chen <allen.chen@ite.com.tw>, Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.or>
List-Id: linux-tegra@vger.kernel.org

The IT6505 is a high-performance DisplayPort 1.1a transmitter, fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications. The IT6505 supports color depth of up to 36 bits (12 bits/color) and ensures robust transmission of high-quality uncompressed video content, along with uncompressed and compressed digital audio content.

This series contains document bindings, revert commit, add vendor prefix, Kconfig to control the function enable or not.

Allen Chen (2):
  dt-bindings: Add binding for IT6505.
  drm/bridge: add it6505 driver

allen (2):
  dt-bindings: Add vendor prefix for ITE Tech. Inc.
  Revert "drm/tegra: Move drm_dp_link helpers to Tegra DRM"

 .../bindings/display/bridge/ite,it6505.txt         |   28 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/gpu/drm/bridge/Kconfig                     |    7 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                | 2697 ++++++++++++++++++++
 drivers/gpu/drm/drm_dp_helper.c                    |  128 +
 drivers/gpu/drm/tegra/Makefile                     |    1 -
 drivers/gpu/drm/tegra/dp.c                         |  876 -------
 drivers/gpu/drm/tegra/dp.h                         |  177 --
 drivers/gpu/drm/tegra/dpaux.c                      |    1 -
 drivers/gpu/drm/tegra/sor.c                        |    1 -
 include/drm/drm_dp_helper.h                        |   16 +
 12 files changed, 2879 insertions(+), 1056 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
 delete mode 100644 drivers/gpu/drm/tegra/dp.c
 delete mode 100644 drivers/gpu/drm/tegra/dp.h

-- 
1.9.1
