From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/3] host1x_cdma_update_sync_queue() clean up
Date: Tue,  7 Aug 2018 16:07:10 +0300
Message-ID: <20180807130713.1016-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

v2: I've added two more patches on top of "Cancel only job that actually got
    stuck" patch. Hence it is a patch-series now.

Dmitry Osipenko (3):
  gpu: host1x: Cancel only job that actually got stuck
  gpu: host1x: Don't complete a completed job
  gpu: host1x: Continue CDMA execution starting with a next job

 drivers/gpu/host1x/cdma.c       | 62 +++++++++++++--------------------
 drivers/gpu/host1x/hw/cdma_hw.c | 13 -------
 2 files changed, 24 insertions(+), 51 deletions(-)

-- 
2.18.0
