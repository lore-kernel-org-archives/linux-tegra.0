From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/3] NVIDIA Tegra30 EMC driver improvements
Date: Fri, 20 Dec 2019 05:08:46 +0300
Message-ID: <20191220020849.11175-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

I took a refreshed look at the driver's code and spotted few things that
could be improved. No critical fixes here, just improvements. Please
review and apply, thanks in advance!

Changelog:

v2: - Now using WRITE/READ_ONCE() in the "Firm up hardware programming
      sequence" patch for interrupt handler interactions, to firm driver
      even further.

Dmitry Osipenko (3):
  memory: tegra30-emc: Firm up suspend/resume sequence
  memory: tegra30-emc: Firm up hardware programming sequence
  memory: tegra30-emc: Correct error message for timed out auto
    calibration

 drivers/memory/tegra/tegra30-emc.c | 179 +++++++++++++++++------------
 1 file changed, 104 insertions(+), 75 deletions(-)

-- 
2.24.0
