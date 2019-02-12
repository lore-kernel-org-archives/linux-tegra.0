From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH v2 2/4] media: tegra-cec: fix possible object reference leak
Date: Wed, 13 Feb 2019 07:45:29 +0800
Message-ID: <1550015129-41867-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: hans.verkuil@cisco.com
Cc: mchehab@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>, "Hans Verkuil (hansverk)" <hansverk@cisco.com>, Wen Yang <yellowriver2010@hotmail.com>
List-Id: linux-tegra@vger.kernel.org

The call to of_parse_phandle() returns a node pointer with refcount
incremented thus it must be explicitly decremented here after the last
usage.
The of_find_device_by_node() takes a reference to the underlying device
structure, we also should release that reference.

Hans Verkuil says:
The cec driver should never take a reference of the hdmi device.
It never accesses the HDMI device, it only needs the HDMI device pointer as
a key in the notifier list.
The real problem is that several CEC drivers take a reference of the HDMI
device and never release it. So those drivers need to be fixed.

This patch fixes those two issues.
Fixes: 9d2d60687c9a ("media: tegra-cec: add Tegra HDMI CEC driver")
Suggested-by: Hans Verkuil (hansverk) <hansverk@cisco.com>
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Hans Verkuil (hansverk) <hansverk@cisco.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Wen Yang <yellowriver2010@hotmail.com>
Cc: linux-tegra@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
v2->v1: 
- move of_node_put() to just after the 'hdmi_dev = of_find_device_by_node(np)'.
- put_device() can be done before the cec = devm_kzalloc line.

 drivers/media/platform/tegra-cec/tegra_cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
index aba488c..e99991b 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -340,9 +340,11 @@ static int tegra_cec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	hdmi_dev = of_find_device_by_node(np);
+	of_node_put(np);
 	if (hdmi_dev == NULL)
 		return -EPROBE_DEFER;
 
+	put_device(&hdmi_dev->dev);
 	cec = devm_kzalloc(&pdev->dev, sizeof(struct tegra_cec), GFP_KERNEL);
 
 	if (!cec)
-- 
2.9.5
