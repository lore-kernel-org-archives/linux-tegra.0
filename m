From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/4] Minor improvements for Host1x driver
Date: Sun, 24 May 2020 20:50:56 +0300
Message-ID: <20200524175100.9334-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series contains some minor improvements for the Host1x driver which
I picked up from an older local git branch. I selected the less invasive
and most relevant patches and added one new patch that dumps the push
buffer state, a day ago it helped me to debug SMMU driver issue that is
easily triggered using the vanilla upstream Host1x driver.

Dmitry Osipenko (4):
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 3 files changed, 30 insertions(+), 7 deletions(-)

-- 
2.26.0
