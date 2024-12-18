Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C013B58F
	for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2024 02:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734489889; cv=none; b=YGcJJPOGPIIQ5ys04KGqtbOViZBpNlg6SgfJZDKfZXbEARmwEDGml20YtuG2oYlIFwmXx8i7XGLg1ttvBEZSqPQxY4/LWJW4A4xek6tZKQVxn2chXofzWjsqKNjZS+c3sfDguJUU86B5jfXZNWtiL909pBXGtviJRFNDq6dcpuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734489889; c=relaxed/simple;
	bh=hbpvzrSeRO8zhRvJBPn1crrG5ctE/FwuugKGi7ydP1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlZSITixuqrBuUs0+eSKBHpD0C7jVcdpjIufYEG/nXQk+uILNejSKcXdeGhiKaxKNl1EAEjoU3o4WBF/XG3mKXuuxQxx7N9kPMlRhHHGDPFJ8w3zNO8WN2kI2JupnZz5JY2ecVnBPLHwA4yoGd/KFfdR7i1dZA0tyt77hxoWMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=T9h3EQT2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="T9h3EQT2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21675fd60feso62312615ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Dec 2024 18:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734489886; x=1735094686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQPyW4IXQjQOJWJUVZxyXa86Uk2SzO89MoYH8BTOG8w=;
        b=T9h3EQT2oojA+4y90OcIduhoM2yBKVl7GN62FCvH9ZZ9AgWGb7Htgofq/RHXoCb0BH
         1JgotmEyJwhHMh4c1Bm3BtRi+LdDUj/f51RPWLzRsnMQ3jVz7DyP9817uxzhOwi7z8Rv
         5+v3UOKLx4SrJoArR27fetnjgKYuFxYwggVntGGTx1KYcFFKQO4fI71wcZFnhUfXxIto
         Ma+Z9cFTyk0x1e6u1xZosQO0augBZNj1NXD0+++yxv/mB2/nqB2Ix1iQwM5tKybJewtu
         z3GCD91O99cyyNWF/Y24pbnwTJ/CiLfkoLPMQ0VL0DQBlcD2g5vhvxDhvYuZ8CnOB2Qu
         7fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734489886; x=1735094686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQPyW4IXQjQOJWJUVZxyXa86Uk2SzO89MoYH8BTOG8w=;
        b=WL5W1T5hdVgltDUv5aM0Gb0DfKBxs6vNrHGAeCgLGcsbmLdpZ1yFK+RDlcwHXOjG4g
         K5BVCC1Gf3YVafOtZi+MMquURl3YGFJtjyvGwpMCTxIqBEosmxkHZ/nooV1cPMdKAXBE
         anVIvcfhapPDA1nA8C3IYKnqEp+aa9h06636kCWGUREp9Npx9laT+uShABAxL7Pp21Ry
         X6wPrpagWlPcs3H8BVEO6fm0i8KR2CgyO3fM2UztDSxETK0ZyOOWxUeCM/4KEDfjxcsN
         E/l0dBS/237P6dT5CSL1azfVtaTgeBdwMjit8qfPNWkF3bdRHpanf19jHkMo2Iz0UEyk
         723Q==
X-Gm-Message-State: AOJu0YzNz+s/BLguIl08e1xwYBMnq/x3wAwU7EH5M/w3wxaRgXRdsCy4
	HKTCvzaEJDPsvDUM8he/AFN1bugHxYNva8KGPYXIzIZuw7X136oi9kWdseT6sGo=
X-Gm-Gg: ASbGncsEJLRBEIRxMQbKxMam2o9w1NuvDX7Ib+dZbMJ2qRzQI5QfYW5dwSwFSjQP/gG
	vpUAGd8Csz+mQfnvlJpFBgf6Vj5z2PmvggK9rN2/GHIoG8404vTl/E1mimBnoquR/LEL118REBn
	B9VlgJjbkJUXUuA/Sih7T4jfgH7skFNJ/Al4ZhMD7cmzsdtX2zw1INV9jodTe5jgn+CUPIuhb4P
	VGmLiV9Sico3DWKf5ql9BJGyvojlr9A63Ik1AnuRVlsU9XBEuGEOA0RmMQdg1ekI8+8MEdKwJ6d
	3PF56lVZlaWAwQ1nOUmovxS5nbGngMJ3onqmxet+Ln4=
X-Google-Smtp-Source: AGHT+IFuJ2PTbr4zGJ8NwLbX+dJZj1lBHIE/U1NBCfhL0uZ2E5+U+8wUMD82b4o3nUf7wKjXOeXOLA==
X-Received: by 2002:a17:902:d4ca:b0:216:61d2:46b6 with SMTP id d9443c01a7336-218d71051eamr13946835ad.25.1734489886270;
        Tue, 17 Dec 2024 18:44:46 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64085sm66229375ad.233.2024.12.17.18.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:44:45 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: krzk@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	dan.carpenter@linaro.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 2/2] memory: tegra20-emc: reflect the DT hierarchy when finding OF nodes in tegra_emc_find_node_by_ram_code()
Date: Wed, 18 Dec 2024 11:44:15 +0900
Message-Id: <20241218024415.2494267-3-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the yaml file [1] and the dts files [2-4], the "emc-tables"
node is a child of a node with the property "nvidia,use-ram-code", and
the "lpddr2" node is a child of the "emc-tables" node. Thus utilize the
for_each_child_of_node() macro and of_get_child_by_name() instead of
of_find_node_by_name() to simplify the code.

This bug was found by an experimental verification tool that I am
developing.

[1]: Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
[2]: arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
[3]: arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
[4]: arch/arm/boot/dts/nvidia/tegra20-paz00.dts

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/memory/tegra/tegra20-emc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index fef54179ddee..9b7d30a21a5b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -474,16 +474,15 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
 
 	ram_code = tegra_read_ram_code();
 
-	of_node_get(dev->of_node);
-	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
-	     np = of_find_node_by_name(np, "emc-tables")) {
+	for_each_child_of_node(dev->of_node, np) {
+		if (!of_node_name_eq(np, "emc-tables"))
+			continue;
 		err = of_property_read_u32(np, "nvidia,ram-code", &value);
 		if (err || value != ram_code) {
 			struct device_node *lpddr2_np;
 			bool cfg_mismatches = false;
 
-			of_node_get(np);
-			lpddr2_np = of_find_node_by_name(np, "lpddr2");
+			lpddr2_np = of_get_child_by_name(np, "lpddr2");
 			if (lpddr2_np) {
 				const struct lpddr2_info *info;
 
-- 
2.34.1

