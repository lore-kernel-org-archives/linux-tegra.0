Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649181FDA86;
	Wed,  5 Feb 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777022; cv=none; b=OuyqOW/nimin9K75MHHz6r/dVLnawjeb9hpbr04BWGwxSSMy5oLeQl3VPrJ1y4ceIHigzBQCZa0fZNkbSj6mvOZ48MvRGQdLfLPLLn2GhvSJeiWk/R+CdjLyv4k/iWxfgJMBNsyUwTdplTOKETH0wlFBmFLZwHIvCedyLAt6+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777022; c=relaxed/simple;
	bh=HrEKbLmzvRNHBh9MzvIBNZ1CGpWtfMw0QOj+KsjPUOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4PLXW0xMYQ2hDNt0wZmzwbL27/K8B+fYxSXsLqp3gDJzSM3xsfVLLRK/R+EIkSTbiFW4Yz4c4br/eICPO4jdu67pZR6+OwSY4oH9XTrZteCeU88oSHKuOKq9NrVBN2Xtzd2YeIslM83e8byEzPoPmDPrfRLxQMhiGTGa4zbzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RqgGAIyQ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RqgGAIyQ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8954443F8;
	Wed,  5 Feb 2025 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmDK4DByW4Ebav/5C7x8nIQDar5bPNyT7udAmfynGZM=;
	b=RqgGAIyQ0mzrMD7VUt+4rZgmsPrkCVLnH8M70iRWzJh1MFK+ev+Vs9vSCoBhW1maeKTYMs
	WZGJcGA0RZMzbD0swre240ld2+VwI0t2QNaqik6Nrgvya/D4By6XTHN6oQv+PnOAzrKqSQ
	HWMTBnFBLJ1qnW7V+ZPsA0lokVB4AbkNaqg+54bDwkQRvITtT6mkATYuBt2lZ+W/J3BDCb
	AUm9mfNyNbyaz1ZJyFkDEPBnaqf5omWnMlNbo/8U+IIqCvQHak84XEs4uW3FQQg/cHX8gM
	bqQFZQcqNtm+U+iL9hDOfg9phlZpj8ruxcG+TRfEr0ldkgIBQL+ezUJTn9Jwaw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:50 +0100
Subject: [PATCH v7 5/9] usb: cdns3-ti: move reg writes to separate function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-5-13658a271c3c@bootlin.com>
References: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
In-Reply-To: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrdelvdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhon
 hdrohhrghdprhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

The device probe function mixes management code and hardware
initialisation code. Extract the latter into an explicitly named
cdns_ti_reset_and_init_hw() function to clarify intent. It also will
allow easier transition to using runtime PM for triggering HW init.

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 82 ++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 040bb91e9c017d8298a7e251fd0e192a336e8a52..d573a259f1ae5c4efd59a496a43b23b75e859dd8 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -58,6 +58,7 @@ struct cdns_ti {
 	unsigned vbus_divider:1;
 	struct clk *usb2_refclk;
 	struct clk *lpm_clk;
+	int usb2_refclk_rate_code;
 };
 
 static const int cdns_ti_rate_table[] = {	/* in KHZ */
@@ -98,15 +99,50 @@ static const struct of_dev_auxdata cdns_ti_auxdata[] = {
 	{},
 };
 
+static void cdns_ti_reset_and_init_hw(struct cdns_ti *data)
+{
+	u32 reg;
+
+	/* assert RESET */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	reg &= ~USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* set static config */
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
+	reg |= data->usb2_refclk_rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
+
+	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
+	if (data->vbus_divider)
+		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
+
+	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+
+	/* set USB2_ONLY mode if requested */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	if (data->usb2_only)
+		reg |= USBSS_W1_USB2_ONLY;
+
+	/* set default modestrap */
+	reg |= USBSS_W1_MODESTRAP_SEL;
+	reg &= ~USBSS_W1_MODESTRAP_MASK;
+	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* de-assert RESET */
+	reg |= USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+}
+
 static int cdns_ti_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct cdns_ti *data;
-	int error;
-	u32 reg;
-	int rate_code, i;
 	unsigned long rate;
+	int error, i;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -146,7 +182,11 @@ static int cdns_ti_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rate_code = i;
+	data->usb2_refclk_rate_code = i;
+	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
+	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
+
+	cdns_ti_reset_and_init_hw(data);
 
 	pm_runtime_enable(dev);
 	error = pm_runtime_get_sync(dev);
@@ -155,40 +195,6 @@ static int cdns_ti_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	/* assert RESET */
-	reg = cdns_ti_readl(data, USBSS_W1);
-	reg &= ~USBSS_W1_PWRUP_RST;
-	cdns_ti_writel(data, USBSS_W1, reg);
-
-	/* set static config */
-	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
-	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
-	reg |= rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
-
-	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
-	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
-	if (data->vbus_divider)
-		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
-
-	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
-	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
-
-	/* set USB2_ONLY mode if requested */
-	reg = cdns_ti_readl(data, USBSS_W1);
-	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
-	if (data->usb2_only)
-		reg |= USBSS_W1_USB2_ONLY;
-
-	/* set default modestrap */
-	reg |= USBSS_W1_MODESTRAP_SEL;
-	reg &= ~USBSS_W1_MODESTRAP_MASK;
-	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
-	cdns_ti_writel(data, USBSS_W1, reg);
-
-	/* de-assert RESET */
-	reg |= USBSS_W1_PWRUP_RST;
-	cdns_ti_writel(data, USBSS_W1, reg);
-
 	error = of_platform_populate(node, NULL, cdns_ti_auxdata, dev);
 	if (error) {
 		dev_err(dev, "failed to create children: %d\n", error);

-- 
2.48.1

