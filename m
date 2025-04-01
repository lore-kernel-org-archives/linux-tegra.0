Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3F1FBCB5;
	Tue,  1 Apr 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507617; cv=none; b=M6HS5eyzg06VMhIdZFj2KacFXnxsNJ94gAk7CcxJJ/h3yxTnCBjw3nhEOZi/Au9ElA+CSETWAQRxOEa9eg+qZtAzb28qQecVe85kU5IIQBDob8iSwMzmihZlaXV7bI3OpxY/lv1ryG+F43GBd5nBzSGYIdh0AkeYT9Q8Hb+g0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507617; c=relaxed/simple;
	bh=ue7d8jD61yTTpVj7zd3g8WpLQYet8HY+YF7kTXHT4vo=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=hc1EscqAZMLy3ELgB3pDb7CS8f1jrcPThE6qHXPhCFJPs0RQqoB8nR2uZww9QTIO1x7x2yIuMitOZ4WkcY2STD/W08c5XJmC3axaIdrok/MJtsABVXli9wN5JgI+J2LEcjQ0npaFg/g474IDVsnIW8XixM4PJggPRZ/UJPAlZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRmJY3zdRz5B1KR;
	Tue,  1 Apr 2025 19:40:13 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 531Be38U094450;
	Tue, 1 Apr 2025 19:40:04 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:40:06 +0800 (CST)
Date: Tue, 1 Apr 2025 19:40:06 +0800 (CST)
X-Zmail-TransId: 2afb67ebd09627d-9a1f2
X-Mailer: Zmail v1.0
Message-ID: <20250401194006848hzqFNLT61SYyidkSwwH4C@zte.com.cn>
In-Reply-To: <20250401193134281Nbc40spYmxjVmftwF0KTZ@zte.com.cn>
References: 20250401193134281Nbc40spYmxjVmftwF0KTZ@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <miquel.raynal@bootlin.com>, <jckuo@nvidia.com>
Cc: <vkoul@kernel.org>, <kishon@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <xie.ludan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDIvMl0gcGh5OiB0ZWdyYTogeHVzYjogVXNlwqBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1l?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 531Be38U094450
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBD09D.001/4ZRmJY3zdRz5B1KR

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify resource
retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into
a single call, improving code readability and reducing API call overhead.

Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/tegra/xusb-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index fae6242aa730..6586472866e2 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1485,7 +1485,6 @@ tegra186_xusb_padctl_probe(struct device *dev,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra186_xusb_padctl *priv;
-	struct resource *res;
 	int err;

 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -1495,8 +1494,7 @@ tegra186_xusb_padctl_probe(struct device *dev,
 	priv->base.dev = dev;
 	priv->base.soc = soc;

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ao");
-	priv->ao_regs = devm_ioremap_resource(dev, res);
+	priv->ao_regs = devm_platform_ioremap_resource_byname(pdev, "ao");
 	if (IS_ERR(priv->ao_regs))
 		return ERR_CAST(priv->ao_regs);

-- 
2.25.1
