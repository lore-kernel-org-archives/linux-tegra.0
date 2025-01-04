Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D24A3E
	for <linux-tegra@vger.kernel.org>; Sat,  4 Jan 2025 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736000405; cv=none; b=ITJSyRMBapyz1K2KmPeENKvHPBm8OyBZvbce/e+7pD82nbXZAv4oE54Mnxj68jaybiBVQUNPkritIQQVxIfSCKPiXWKDdonKGv+x/oNwQwbLxtZNPwjHVIX8bARahsBo+y+MyjVteNcOwA3wOK3VNNmsJsf35iLwVZyiHZ3kDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736000405; c=relaxed/simple;
	bh=Yw9/qA6qdIyvvXun/xp/2uZfzd7ISgOLONvyhIpN+MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwIfmpAdGQ78k/I1U+dDAXaJhr1wNkAvSeNWIhJ+68PraYsdEx7BoXgC4HmmVzmTD9RNH723JZ3dHx2eIRybvWN3O4J3c6IWWiRPG+BcVl7ihY4d9JnHfKhwxuJmJaT3HNw9wCiuCJaWFs2LGAW60nY8KGwh4lqJnCzgjGNcjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8+apiS9; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8+apiS9"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so3119013a12.2
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jan 2025 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736000402; x=1736605202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEVdWJGp2oPicz47kN5r+WdNuLFnOSMb7vA6U1ddIq8=;
        b=P8+apiS9w6mVrTNOUXd8pbmk4550KxgMPGGYKm2Ztxg5aGURi8BLZQKlGFcFeHiQ2t
         VzXvdLnNTx8KFH6y/5UpNXX3aoLsG9OcWMQdS5nPZrDGR17cUyHy6+RSidydN3FFlln0
         r1Mp4CUbBERN2+oZVeMD4/PfOel0e8zmYZiu6ZQ844zEGp/2tpTVb8vR3tNvLwRutEJW
         Yz30JW2zi5P8HW0X/Cu8qMnf6LoBHs1EKGOMR1VOK9N1lBOL0Q2YboKz9gu26CZ6iLNM
         rRLJHzA3zG63jjGuNAuO/WpqmzH2q9+6g8BE0BnBhttUXcn5Rq9xMVUhZX2MHRm72H0f
         Fn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736000402; x=1736605202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEVdWJGp2oPicz47kN5r+WdNuLFnOSMb7vA6U1ddIq8=;
        b=EV9BYDojcpIBDKbKX4E94s2cenMSZhR91Nbu6LghZLYOxbH+zI1Ecwyb7j5/yc0b9A
         MTaX6PC2HtMjceCcmX+76LkTFRTyA7Iot1Xy5O3UsJA/2hdsJ26jcrKG1jyjzP9H7Xls
         wefAIUtEvrw9LgVcRzn6WmYW3/kaGtd2vEfIGpds1Zq7Ihi8O8vGsL6CLtbPoU9KUiCS
         x/XS2Y7HiUNFrDtx+yhWwpMmoAroiciDoaNvMA68MTg81VI1mz0we2iOaaoQQY2wr5A9
         c5emLJquYlIe8qUTadP91pRjBDgmHDX156hlIOHbUBsH4AZO0rEfIrUsMCvk5kA8LdkW
         lPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSYDUG0KR6WSkq7OFqW2K8PmDdEuVXCpe9CbUhDmpT2J5k3SlSsXXF5co7jV9UINCrHl3acJSWZIbwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wQtgY7J9ZuQn9G4GQk6yPXGQ6cvqMtvZzho8QZMetK2wiXAk
	Ca1beyJHZXcEZFfUCaD+yKbr5xIh/RyuphmTIyRMvTvK+OP5NQA/RuOeDsiE030=
X-Gm-Gg: ASbGnct9y5GtbYWn6sxG0G6bRqD7lS4uguWGmmzGV7A/gb71ol38HJxH1ddjxXhaboC
	+rUQErm0BDGZ+M6C79WqaYTyxjB9GmkJ1XRJFzfg5S7zzLdx3HBwaOSGpGwafEYcMTTkDcIZ85n
	vitm9zKB5AIEPzfr8M615TbEKtfjD8vs7YESGOUjxWUjq1kbWiUGNOA2lPhzZWwYzZAlTM9hATQ
	Ci//csHBU/4qLHkNPiTFrysUA7a2LL7DHpm6DNlq+mu0bqvMAz6HMaE3i+VbkQDNu3iiaw=
X-Google-Smtp-Source: AGHT+IF0kTNDNwhatI78ot8PP3F5T6/eUJ/qkL8c17ZKWJ39fQiecWvtN2mcb/zxpWtnZxXp/jPhww==
X-Received: by 2002:a17:907:3e8f:b0:aa5:3e81:5aa2 with SMTP id a640c23a62f3a-aac2adc463dmr1726287666b.4.1736000402221;
        Sat, 04 Jan 2025 06:20:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05ee5esm2018481866b.171.2025.01.04.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 06:20:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: tegra: cbb: Drop unnecessary debugfs error handling
Date: Sat,  4 Jan 2025 15:19:58 +0100
Message-ID: <20250104141958.115911-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel coding style expects all drivers to ignore debugfs errors.
Partially because it is purely for debugging, not for important user
interfaces.  Simplify the code by dropping unnecessary probe failuring
and error message on debugfs failures, which also fixes incorrect usage
IS_ERR_OR_NULL() and Smatch warning:

  drivers/soc/tegra/cbb/tegra-cbb.c:80 tegra_cbb_err_debugfs_init() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/tegra/cbb/tegra-cbb.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra-cbb.c b/drivers/soc/tegra/cbb/tegra-cbb.c
index 84ab46c9d9f5..6215c6a84fbe 100644
--- a/drivers/soc/tegra/cbb/tegra-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra-cbb.c
@@ -69,19 +69,12 @@ static int tegra_cbb_err_show(struct seq_file *file, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(tegra_cbb_err);
 
-static int tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
+static void tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
 {
 	static struct dentry *root;
 
-	if (!root) {
+	if (!root)
 		root = debugfs_create_file("tegra_cbb_err", 0444, NULL, cbb, &tegra_cbb_err_fops);
-		if (IS_ERR_OR_NULL(root)) {
-			pr_err("%s(): could not create debugfs node\n", __func__);
-			return PTR_ERR(root);
-		}
-	}
-
-	return 0;
 }
 
 void tegra_cbb_stall_enable(struct tegra_cbb *cbb)
@@ -148,13 +141,8 @@ int tegra_cbb_register(struct tegra_cbb *cbb)
 {
 	int ret;
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		ret = tegra_cbb_err_debugfs_init(cbb);
-		if (ret) {
-			dev_err(cbb->dev, "failed to create debugfs\n");
-			return ret;
-		}
-	}
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		tegra_cbb_err_debugfs_init(cbb);
 
 	/* register interrupt handler for errors due to different initiators */
 	ret = cbb->ops->interrupt_enable(cbb);
-- 
2.43.0

