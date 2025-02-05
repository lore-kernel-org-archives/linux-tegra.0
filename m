Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884EF1FF7D1;
	Wed,  5 Feb 2025 17:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777023; cv=none; b=W1J8qm2M6V2F4pi7P0NjD0fy4ferZEgZjq+8gb0AladdwNDojiKmXlCPBrb+rdsHyCj7ZxBVO2jBw8enOPzvajgaJqGCS4AayW9CGdyNK3RxWoY9/gqBoKzNdYUEnn0XuGJi34e2IHIuYK5AlkE9NDHumiu18a+2swPx4sdlgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777023; c=relaxed/simple;
	bh=L2OOvE6BY2C8q/UOVS0u3eaSeXUfCNr7iVJvpIxD3uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1YDCMVFaQZq78sZm7iNkab48tvGpadaojqfTRGyAf/n5x6J3yOMwv2gmIyg7PUlAuECW9oTKg+TJFdlXLwrg0Wy7/W+uKVcRnii72nlayXe8YA+Nj2ydWOx9tdT5hV+ATSG414vZ60RbnzXEbkALFVPALBo4+Dq0fGuC7/FSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YgViBfqb; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YgViBfqb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E564440E;
	Wed,  5 Feb 2025 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+oJvFMur1D0C6SRuaDJZ3OKAt1xBnFwt/JFvOFy/3/o=;
	b=YgViBfqbhAHN1Xja6xBTd+Wsq/KyuqVdXisvJdjebSPquX1mar0yS4RLomsuy8j1gDRHzn
	+JFw21Yf/caVRH92LqVhpSaC+UTA44ag0dSG1dD8SuVoS/nc60tbyPGThD00rm3W6gEEK/
	+8HdsVUW/LSDQLuGPehmK7CHZlEGvGbkSlBY5g0ISDeTlS3i9XBbIdjtZ9JjPk9eQ6h5xu
	kHvIx29FOtksMLGYrVum0OkSVtuOG5b31q8iP7/S+CbqJfzoLz0czIVwNVe4eif5XOk6tF
	VZKVi0ONHArw5qAtZRq8O48BJ1lamiEdukhpt2KHcqpG9qnMYQpTycCBsAj5cw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:51 +0100
Subject: [PATCH v7 6/9] usb: cdns3-ti: run HW init at resume() if HW was
 reset
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-6-13658a271c3c@bootlin.com>
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

At runtime_resume(), read the W1 (Wrapper Register 1) register to detect
if an hardware reset occurred. If it did, run the hardware init sequence.

This callback will be called at system-wide resume. Previously, if a
reset occurred during suspend, we would crash. The wrapper config had
not been written, leading to invalid register accesses inside cdns3.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index d573a259f1ae5c4efd59a496a43b23b75e859dd8..302ebf6d8e5367c25046d8364c0b2e5b30fab4f7 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -186,6 +186,12 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
 	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
 
+	/*
+	 * The call below to pm_runtime_get_sync() MIGHT reset hardware, if it
+	 * detects it as uninitialised. We want to enforce a reset at probe,
+	 * and so do it manually here. This means the first runtime_resume()
+	 * will be a no-op.
+	 */
 	cdns_ti_reset_and_init_hw(data);
 
 	pm_runtime_enable(dev);
@@ -230,6 +236,24 @@ static void cdns_ti_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static int cdns_ti_runtime_resume(struct device *dev)
+{
+	const u32 mask = USBSS_W1_PWRUP_RST | USBSS_W1_MODESTRAP_SEL;
+	struct cdns_ti *data = dev_get_drvdata(dev);
+	u32 w1;
+
+	w1 = cdns_ti_readl(data, USBSS_W1);
+	if ((w1 & mask) != mask)
+		cdns_ti_reset_and_init_hw(data);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cdns_ti_pm_ops = {
+	RUNTIME_PM_OPS(NULL, cdns_ti_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static const struct of_device_id cdns_ti_of_match[] = {
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
@@ -243,6 +267,7 @@ static struct platform_driver cdns_ti_driver = {
 	.driver		= {
 		.name	= "cdns3-ti",
 		.of_match_table	= cdns_ti_of_match,
+		.pm     = pm_ptr(&cdns_ti_pm_ops),
 	},
 };
 

-- 
2.48.1

