From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpu: host1x: avoid IOMMU_API build error
Date: Mon,  4 Mar 2019 20:53:22 +0100
Message-ID: <20190304195338.989221-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

drivers/gpu/host1x/hw/channel_hw.c: In function 'host1x_channel_set_streamid':
drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit declaration of function 'dev_iommu_fwspec_get'; did you mean 'iommu_fwspec_free'? [-Werror=implicit-function-declaration]
  struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
                              ^~~~~~~~~~~~~~~~~~~~
                              iommu_fwspec_free
drivers/gpu/host1x/hw/channel_hw.c:118:30: error: initialization of 'struct iommu_fwspec *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
drivers/gpu/host1x/hw/channel_hw.c:119:23: error: 'struct iommu_fwspec' has no member named 'ids'
  u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
                       ^~
cc1: all warnings being treated as errors

Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/hw/channel_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 27101c04a827..738dccf4ee3f 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -114,7 +114,7 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
 
 static void host1x_channel_set_streamid(struct host1x_channel *channel)
 {
-#if HOST1X_HW >= 6
+#if HOST1X_HW >= 6 && defined(CONFIG_IOMMU_API)
 	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
 	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
 
-- 
2.20.0
