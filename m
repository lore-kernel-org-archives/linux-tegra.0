Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E8474062
	for <linux-tegra@vger.kernel.org>; Fri, 31 May 2024 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141337; cv=none; b=G6hLrwUeOFhSAx7PP2PjA5Or5w1Qhc+WvMGZH58j2DdZ/7vJM8YyWK0w9BEOgHuHhLMlavOocDV6yG9S+5RsqVOhndi6X1BP7PyQpBPbcd+XfotAkt5TlZuTmJkD/DUWmvNA79GLrzU/G/JI+njcJ64SbqNZm15L1zW60PsXRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141337; c=relaxed/simple;
	bh=YYnSjEDQVKVZ0TVHAY0MYL/SqYBviz4ghcuwNBX0wgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfmFipP3LSY7CqdFPDG2GJ4JT7JM2qsjfbHOaAOAAcgoJwNxJRlpUrtVhjxrHaL5rDKp8VaCWZB07U7wEI5Y6MpTVTtc1jN8sAS0PGxfZmCF5ekisvAP09pWt9dMVYtpMQrHhSLT8H4+1m4GESgU9jjP0bCulbUXMq3gbg54SNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=m3tXyA0Z; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="m3tXyA0Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lyQi3tNfXZ+8DiArvVFb2xgFFU/cMi3Dy95oTDO1f6A=; b=m3tXyA0Z32UVVIMGMJKirY5D6X
	wOlEx7BAyD1GTNLauhxShOJBvTfVhj6lUONk2NhDBbBaQ90LjxudX2oxYtSphN6tvbeUyG/m/xu6o
	36iSzhqHsHKN0uAAeCzCkIH1NFncuZ2wsU3z3LBbTxCuHEffNK4kxrD0bzp7xPFDVSlNx71pBIpO3
	N2DiipsVgXu00FMuUvyeCBhNumf9Z4Hc8ySBUJapHmkVgPu+PR77NkvkStKc2gyKdy8h1QZgKKWd/
	cBevESXfGbK2PItnCrY48yul5pVPY5LkFrU6cobu3AN+xMlLWkhRcvQFkNCX1GQ4iPPfV3qbCTmKU
	Byr3pY/g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1sCwMM-0047Oa-26;
	Fri, 31 May 2024 10:07:30 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
Date: Fri, 31 May 2024 10:07:18 +0300
Message-ID: <20240531070719.2138-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

Syncpoint IRQs are currently requested in a code path that runs
during resume. Due to this, we get multiple overlapping registered
interrupt handlers as host1x is suspended and resumed.

Rearrange interrupt code to only request IRQs during initialization.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.h        |  2 ++
 drivers/gpu/host1x/hw/intr_hw.c | 37 +++------------------------------
 drivers/gpu/host1x/intr.c       | 21 ++++++++++++++++++-
 drivers/gpu/host1x/intr.h       |  5 +++++
 4 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 53af0334c6e1..d3855a1c6b47 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/iommu.h>
 #include <linux/iova.h>
+#include <linux/irqreturn.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -81,6 +82,7 @@ struct host1x_intr_ops {
 	void (*disable_syncpt_intr)(struct host1x *host, unsigned int id);
 	void (*disable_all_syncpt_intrs)(struct host1x *host);
 	int (*free_syncpt_irq)(struct host1x *host);
+	irqreturn_t (*isr)(int irq, void *dev_id);
 };
 
 struct host1x_sid_entry {
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index 9880e0c47235..415f8d7e4202 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -6,18 +6,11 @@
  * Copyright (c) 2010-2013, NVIDIA Corporation.
  */
 
-#include <linux/interrupt.h>
-#include <linux/irq.h>
 #include <linux/io.h>
 
 #include "../intr.h"
 #include "../dev.h"
 
-struct host1x_intr_irq_data {
-	struct host1x *host;
-	u32 offset;
-};
-
 static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 {
 	struct host1x_intr_irq_data *irq_data = dev_id;
@@ -54,7 +47,8 @@ static void host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
 	}
 }
 
-static void intr_hw_init(struct host1x *host, u32 cpm)
+static int
+host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 {
 #if HOST1X_HW < 6
 	/* disable the ip_busy_timeout. this prevents write drops */
@@ -85,32 +79,6 @@ static void intr_hw_init(struct host1x *host, u32 cpm)
 		host1x_sync_writel(host, irq_index, HOST1X_SYNC_SYNCPT_INTR_DEST(id));
 	}
 #endif
-}
-
-static int
-host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
-{
-	int err, i;
-	struct host1x_intr_irq_data *irq_data;
-
-	irq_data = devm_kcalloc(host->dev, host->num_syncpt_irqs, sizeof(irq_data[0]), GFP_KERNEL);
-	if (!irq_data)
-		return -ENOMEM;
-
-	host1x_hw_intr_disable_all_syncpt_intrs(host);
-
-	for (i = 0; i < host->num_syncpt_irqs; i++) {
-		irq_data[i].host = host;
-		irq_data[i].offset = i;
-
-		err = devm_request_irq(host->dev, host->syncpt_irqs[i],
-				       syncpt_thresh_isr, IRQF_SHARED,
-				       "host1x_syncpt", &irq_data[i]);
-		if (err < 0)
-			return err;
-	}
-
-	intr_hw_init(host, cpm);
 
 	return 0;
 }
@@ -144,4 +112,5 @@ static const struct host1x_intr_ops host1x_intr_ops = {
 	.enable_syncpt_intr = host1x_intr_enable_syncpt_intr,
 	.disable_syncpt_intr = host1x_intr_disable_syncpt_intr,
 	.disable_all_syncpt_intrs = host1x_intr_disable_all_syncpt_intrs,
+	.isr = syncpt_thresh_isr,
 };
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 995bfa980837..b3285dd10180 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/clk.h>
-
+#include <linux/interrupt.h>
 #include "dev.h"
 #include "fence.h"
 #include "intr.h"
@@ -100,7 +100,9 @@ void host1x_intr_handle_interrupt(struct host1x *host, unsigned int id)
 
 int host1x_intr_init(struct host1x *host)
 {
+	struct host1x_intr_irq_data *irq_data;
 	unsigned int id;
+	int i, err;
 
 	mutex_init(&host->intr_mutex);
 
@@ -111,6 +113,23 @@ int host1x_intr_init(struct host1x *host)
 		INIT_LIST_HEAD(&syncpt->fences.list);
 	}
 
+	irq_data = devm_kcalloc(host->dev, host->num_syncpt_irqs, sizeof(irq_data[0]), GFP_KERNEL);
+	if (!irq_data)
+		return -ENOMEM;
+
+	host1x_hw_intr_disable_all_syncpt_intrs(host);
+
+	for (i = 0; i < host->num_syncpt_irqs; i++) {
+		irq_data[i].host = host;
+		irq_data[i].offset = i;
+
+		err = devm_request_irq(host->dev, host->syncpt_irqs[i],
+				       host->intr_op->isr, IRQF_SHARED,
+				       "host1x_syncpt", &irq_data[i]);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index 3b5610b525e5..11cdf13e32fe 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -11,6 +11,11 @@
 struct host1x;
 struct host1x_syncpt_fence;
 
+struct host1x_intr_irq_data {
+	struct host1x *host;
+	u32 offset;
+};
+
 /* Initialize host1x sync point interrupt */
 int host1x_intr_init(struct host1x *host);
 
-- 
2.42.0

