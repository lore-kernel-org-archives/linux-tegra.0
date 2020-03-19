From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] NVIDIA Tegra I2C synchronization correction
Date: Thu, 19 Mar 2020 23:11:38 +0300
Message-ID: <20200319201140.17451-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Recently I found a way to reliably reproduce I2C timeouts that happen due
to improper synchronizations made by the I2C driver. It's quite easy to
reproduce the problem when memory is running on a lower freq + there is
some memory activity + CPU could get busy for a significant time. This
is the case when KASAN is enabled and CPU is busy while accessing FS via
NFS. This small series addresses the found problems.

Please note that the "Synchronize DMA before termination" patch implicitly
depends on the "dmaengine: tegra-apb: Improve DMA synchronization" patch,
which is sent separately, otherwise DMA synchronization won't happen.

Dmitry Osipenko (2):
  i2c: tegra: Better handle case where CPU0 is busy for a long time
  i2c: tegra: Synchronize DMA before termination

 drivers/i2c/busses/i2c-tegra.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

-- 
2.25.1
