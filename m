Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C701607BB
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003022; cv=none; b=iCmK8/Fiz4R4Zsm/gKdsJEcaOFbok9LSMniYd9XKbZGvmiBH5JM5v+btT7ebguUC9nwhTlzL5yvObyHPSY5X5pQeUFD2qNblF/wsSEAOKglVKpo+rTAXKyfir3+rp4exMJiYzN3SCwb0XB5wE+z9ofrRhRlijEn40x48plU+q38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003022; c=relaxed/simple;
	bh=UZRxSWPkVlTs6YPHIZ5niL49pdw36mrWOertJ96C2o8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jTVnZWYnQaTmN/3dla5FI7sgByvhwAl1qY+tNbT6VNr8y0QN7s1A2tiIo2YI/FSM8puoINyCpik/8jeRSxIDYvpshzoJa5TnJaxSVjqT7po61MUcMwImEiQFM0cvCc2GhkZHhwPH9VhBkUC/4jsv64IM6vzJi8Suqaa+cWU4Sfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww8tg1WGZz1j7jD;
	Fri, 30 Aug 2024 15:30:03 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B90591A0188;
	Fri, 30 Aug 2024 15:30:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 15:30:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-tegra@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] gpu: host1x: Use for_each_available_child_of_node_scoped()
Date: Fri, 30 Aug 2024 15:38:24 +0800
Message-ID: <20240830073824.3539690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Split out from the patch set.
---
 drivers/gpu/host1x/bus.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 8e09d6d328d2..344cc9e741c1 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -41,7 +41,6 @@ static int host1x_subdev_add(struct host1x_device *device,
 			     struct device_node *np)
 {
 	struct host1x_subdev *subdev;
-	struct device_node *child;
 	int err;
 
 	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
@@ -56,13 +55,12 @@ static int host1x_subdev_add(struct host1x_device *device,
 	mutex_unlock(&device->subdevs_lock);
 
 	/* recursively add children */
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_match_node(driver->subdevs, child) &&
 		    of_device_is_available(child)) {
 			err = host1x_subdev_add(device, driver, child);
 			if (err < 0) {
 				/* XXX cleanup? */
-				of_node_put(child);
 				return err;
 			}
 		}
@@ -90,17 +88,14 @@ static void host1x_subdev_del(struct host1x_subdev *subdev)
 static int host1x_device_parse_dt(struct host1x_device *device,
 				  struct host1x_driver *driver)
 {
-	struct device_node *np;
 	int err;
 
-	for_each_child_of_node(device->dev.parent->of_node, np) {
+	for_each_child_of_node_scoped(device->dev.parent->of_node, np) {
 		if (of_match_node(driver->subdevs, np) &&
 		    of_device_is_available(np)) {
 			err = host1x_subdev_add(device, driver, np);
-			if (err < 0) {
-				of_node_put(np);
+			if (err < 0)
 				return err;
-			}
 		}
 	}
 
-- 
2.34.1

