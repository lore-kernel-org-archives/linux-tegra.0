From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
Date: Tue, 24 Mar 2020 22:12:15 +0300
Message-ID: <20200324191217.1829-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Recently I found a way to reliably reproduce I2C timeouts that happen due
to improper synchronizations made by the I2C driver. It's quite easy to
reproduce the problem when memory is running on a lower freq + there is
some memory activity + CPU could get busy for a significant time. This
is the case when KASAN is enabled and CPU is busy while accessing FS via
NFS. This small series addresses the found problems.

Changelog:

v2: - The "Better handle case where CPU0 is busy for a long time" patch
      now preserves the old behavior where completion is checked after
      disabling the interrupt, preventing potential race-condition of
      the completion awaiting vs interrupt syncing.

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

 drivers/i2c/busses/i2c-tegra.c | 36 ++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

-- 
2.25.1
