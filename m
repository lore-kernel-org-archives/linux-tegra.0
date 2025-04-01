Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876041F1932;
	Tue,  1 Apr 2025 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507529; cv=none; b=aYmjk3mdGQAcIS6IeF4zi1jbDYtGX8YBhvltiQ4OtoChV5wNEJE7S/wcHe1Aevpk2cwqO5+SxBHQ+VGLhIKqOgGpOuBoJMzBpuc0hABnshWhPbu9kAmBXUF29BGK5ln9vTf2bar/KyhWjIDJoyZ4OKv7/JJ/4kP5DHvBH1qvHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507529; c=relaxed/simple;
	bh=LHedbrkVzlmaH1psxYjSEYlxzv0irFgDo399ghA9vvI=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=ILTpWc9FZyiJDv6q4ny4fgSJYxOUTXAXQkXn7LnR92HdN9Cjm+EJof+DpVZLDbKIB0MuOhjdQ4c1wR/MdsaLrPD4Yes13ZB2c1KMA+ERPIE5jcswErdR+q4I32TvCuoCFzYUbjYuDAIEdbxBAR5Bo1HqqFssu5PyJqFZlqsW+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZRmGs2HkXz5B1KS;
	Tue,  1 Apr 2025 19:38:45 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 531BcX0u087176;
	Tue, 1 Apr 2025 19:38:33 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 1 Apr 2025 19:38:36 +0800 (CST)
Date: Tue, 1 Apr 2025 19:38:36 +0800 (CST)
X-Zmail-TransId: 2afa67ebd03c78c-9d6fe
X-Mailer: Zmail v1.0
Message-ID: <20250401193836885cYSO33OlICvYYYmEMlB5J@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIDEvMl0gcGh5OiBtYXJ2ZWxsOiBhMzcwMC1jb21waHk6IFVzZcKgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 531BcX0u087176
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EBD045.001/4ZRmGs2HkXz5B1KS

From: Xie Ludan <xie.ludan@zte.com.cn>

Introduce devm_platform_ioremap_resource_byname() to simplify resource
retrieval and mapping.This new function consolidates
platform_get_resource_byname() and devm_ioremap_resource() into
a single call, improving code readability and reducing API call overhead.

Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
index 1d1db1737422..e629a1a73214 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
@@ -1253,26 +1253,20 @@ static int mvebu_a3700_comphy_probe(struct platform_device *pdev)

 	spin_lock_init(&priv->lock);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "comphy");
-	priv->comphy_regs = devm_ioremap_resource(&pdev->dev, res);
+	priv->comphy_regs = devm_platform_ioremap_resource_byname(pdev, "comphy");
 	if (IS_ERR(priv->comphy_regs))
 		return PTR_ERR(priv->comphy_regs);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "lane1_pcie_gbe");
-	priv->lane1_phy_regs = devm_ioremap_resource(&pdev->dev, res);
+	priv->lane1_phy_regs = devm_platform_ioremap_resource_byname(pdev, "lane1_pcie_gbe");
 	if (IS_ERR(priv->lane1_phy_regs))
 		return PTR_ERR(priv->lane1_phy_regs);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "lane0_usb3_gbe");
-	priv->lane0_phy_regs = devm_ioremap_resource(&pdev->dev, res);
+	priv->lane0_phy_regs = devm_platform_ioremap_resource_byname(pdev, "lane0_usb3_gbe");
 	if (IS_ERR(priv->lane0_phy_regs))
 		return PTR_ERR(priv->lane0_phy_regs);

-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "lane2_sata_usb3");
-	priv->lane2_phy_indirect = devm_ioremap_resource(&pdev->dev, res);
+	priv->lane2_phy_indirect = devm_platform_ioremap_resource_byname(pdev,
+									 "lane2_sata_usb3");
 	if (IS_ERR(priv->lane2_phy_indirect))
 		return PTR_ERR(priv->lane2_phy_indirect);

-- 
2.25.1
