From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] gpu: host1x: fix compile error when IOMMU API is not available
Date: Thu, 11 Apr 2019 00:47:46 +0200
Message-ID: <4c3d021c73c001f633803e364cfbc6ace3381205.1554936354.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

In case the IOMMU API is not available compiling host1x fails with
the following error:
  In file included from drivers/gpu/host1x/hw/host1x06.c:27:
  drivers/gpu/host1x/hw/channel_hw.c: In function ‘host1x_channel_set_streamid’:
  drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit declaration of function
    ‘dev_iommu_fwspec_get’; did you mean ‘iommu_fwspec_free’?  [-Werror=implicit-function-declaration]
  struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
                              ^~~~~~~~~~~~~~~~~~~~
                              iommu_fwspec_free

Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/host1x/hw/channel_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 27101c04a827..4030d64916f0 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -114,7 +114,7 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
 
 static void host1x_channel_set_streamid(struct host1x_channel *channel)
 {
-#if HOST1X_HW >= 6
+#if IS_ENABLED(CONFIG_IOMMU_API) &&  HOST1X_HW >= 6
 	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
 	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
 
-- 
2.21.0
