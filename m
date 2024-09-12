Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6C22EE5
	for <linux-tegra@vger.kernel.org>; Thu, 12 Sep 2024 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726110508; cv=none; b=WkouLpKAc10Kk7yQ9uZaPpRUIqGbpN4hzPrXb8jN5M2vnBYIgmEuxUUT0OQ8tKNOIUDJo20Cy7uGC0OROjACGDN5k8WOyokizNFsKraQ8RycSqGSaVSu1Ep7BnWR8zwdUkAwYVVQyFX1RMBCenS6/24QqviEzQOZ+9zAEOme8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726110508; c=relaxed/simple;
	bh=gcxZru+4SoD0Cl4wt7+JVYrOzI++pZ2WGtgLb9mB44c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Js+yYn9fpugxyzLuiKD/KqkQljaIIRmVuAPCitC5ufYh3HxrfLUuOoHVkzYeAQet9oHf76+XBz5Ess/fuqTOu87d0q1SV0nLlIozcgczM3hwMlhk8xhfbj/1OoRhp5SjJNfaIpw0BeDOU+g+ahNZW8CsxlJ0ErX1RfCp+msst48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X42QL6D1fzmYyL;
	Thu, 12 Sep 2024 11:06:18 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B15C140453;
	Thu, 12 Sep 2024 11:08:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 11:08:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <marvin24@gmx.de>, <gregkh@linuxfoundation.org>,
	<ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] staging: nvec: Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 11:17:31 +0800
Message-ID: <20240912031731.2211698-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index d09211589d1c..a4396d9caf45 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -845,13 +845,12 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return PTR_ERR(nvec->gpiod);
 	}
 
-	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, 0,
+	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, IRQF_NO_AUTOEN,
 			       "nvec", nvec);
 	if (err) {
 		dev_err(dev, "couldn't request irq\n");
 		return -ENODEV;
 	}
-	disable_irq(nvec->irq);
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.34.1

