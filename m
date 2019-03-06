From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v2] gpu: host1x: avoid IOMMU_API build error
Date: Wed,  6 Mar 2019 14:57:43 +0100
Message-ID: <20190306135800.3982681-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

When the iommu API is disabled, the host1x driver fails to build:

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

As Mikko explains, we should program SMMU bypass (0x7f) if that
happens.

Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
Suggested-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
v2: fall back to 0x7f sid
---
 drivers/gpu/host1x/hw/channel_hw.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 27101c04a827..0c0eb43abf65 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -115,8 +115,12 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
 static void host1x_channel_set_streamid(struct host1x_channel *channel)
 {
 #if HOST1X_HW >= 6
+	u32 sid = 0x7f;
+#ifdef CONFIG_IOMMU_API
 	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
-	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
+	if (spec)
+		sid = spec->ids[0] & 0xffff;
+#endif
 
 	host1x_ch_writel(channel, sid, HOST1X_CHANNEL_SMMU_STREAMID);
 #endif
-- 
2.20.0
