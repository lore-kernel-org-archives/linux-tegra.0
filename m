From: Jamal Shareef <jamal.k.shareef@gmail.com>
Subject: [PATCH 0/3] drm/tegra: Remove space after parenthesis
Date: Mon,  4 Nov 2019 18:23:19 -0800
Message-ID: <cover.1572920482.git.jamal.k.shareef@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: outreachy-kernel@googlegroups.com
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jamal Shareef <jamal.k.shareef@gmail.com>
List-Id: linux-tegra@vger.kernel.org

This patchset removes spaces after left open parenthesis.
Issue found by checkpatch.

Jamal Shareef (3):
  drm/tegra: dc: Remove space after parenthesis
  drm/tegra: dsi: Remove space in open parenthesis
  drm/tegra: gr3d: Remove space after parenthesis

 drivers/gpu/drm/tegra/dc.h   |  40 ++++++------
 drivers/gpu/drm/tegra/dsi.c  |  60 +++++++++---------
 drivers/gpu/drm/tegra/gr3d.c | 120 +++++++++++++++++------------------
 3 files changed, 110 insertions(+), 110 deletions(-)

-- 
2.17.1
