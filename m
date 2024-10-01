Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103481925B8
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727815236; cv=none; b=GdkfCTd0FOv/Z4gr+My3HRCRq1uCDahw8DBkHrqSNH/vONw/1f+uTkzViufNgxu6CV+lV54VzEHFV0+q9mbJnmWGbsmkB1ZcYX1j/gZJuw1PpUqMOCL6ciDcyhgjpvCdGPBef71NUrC9rpkN8NP2qBii5WQB2jzazyQIY/sSL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727815236; c=relaxed/simple;
	bh=z7fN0wcDrgSGLJ54CogSRI9qTPvLsqNMXWPMmhQaMK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBlMMnbNF8AuJXx6hP1IfW59+eOmgjDoZ/Oizvnn4JiOfsxo7zxXJR/axbgFFzedk5mal8tkDHQB+ZQNx1RTd+2/2vY2XCc3nopDGYAiD72WpgcSN/UKpmU87jqDOkx8oVV+5GvALigwqPOB/jrCkV7zjNm+Azy8QDZ9Z6iwONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZYYf7y0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZYYf7y0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cdefe9ae8so7767825e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727815233; x=1728420033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EN+IlGnMWsVNl93iDCLUh0QeaNh7xIiYAcmuHj+W00s=;
        b=YZYYf7y0t3fzNM6K8Io/RKGwI6WHJiV38lKuKDxx9LfCcPwU8pJvhVMQHB989W0lbH
         qoWoiy9qgzSJXTwlHvoVY/klOuc/FnKHxrSt+/ThBLoF+4ZMIdxmI34w0XKFAd7JAfx8
         f93rdrCKIFVQ7zI0Zd8AlwtcckIBVp05syFToLAIMtsLJQICv69u2knv5L1ft4pyRgWE
         +s1He5B/yGCvo9SP/eVKJK5pszJ2nyn3bHSJlK7Q6uRW7vmU8EG57ImDBeQy3IVDruxJ
         awBkHirnmXngDS0ysmKOyGSWGkRrcSo0bESh1INwZdOgBSDw/5gbBZNY1ZxPYCS9wKx9
         WZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727815233; x=1728420033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+IlGnMWsVNl93iDCLUh0QeaNh7xIiYAcmuHj+W00s=;
        b=Q+gQMp5XVJb1mQnwEz5BedMOTQyhCjQmwSzfyfmd54KnCYVGyrwkOWb4ojqgGPmxsx
         sdgMIxKSXQ0d5icXd57K2rmoS4HmBz9wR3jwi6RHd8FvIDDbvwt/OkluoW8ugt9YHYQk
         DUkaBKXQQUdLZLSvaS678j7/UqqxUh9wkukX7E597foS7DLiiW9IVc3l85dxNHBBbLqV
         alrVtbfeMASIxYxJ2PxkNAnICBIBKT5uMUl7i9owPQ9gZJeTHcfsqB7BF8mcvdRte6fY
         fL5iq7paLPHBUDmfrgLlZoi/q5dF97k4lSbXwf+kvPTrr6AtUGBZYt9rgoDljBMKlyHZ
         4Dyw==
X-Forwarded-Encrypted: i=1; AJvYcCV3xqKykq5vlEWw1NV1X5Msk7VRks5uoxBa7tTq7kWrn8FHEjh2M52GAlfc4alA0h6ykXJz0Uzn+EJyUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOxU2/fJdrgt7T7YCPX0pSTcmBco2U04LffzblkSnQ9ghhXdx
	5HUiYPV2haPcazcyvBSw7HH9JAgfFRtmZZQfoASsszQUPEFTrIKovrKhEp09H88=
X-Google-Smtp-Source: AGHT+IGT9qvAcHTeHq/UjlDNrHiw+vESOThjdO8ZDEU34vY5psay4GhWwsOZG2VmxNX+sm2JGMKISg==
X-Received: by 2002:a05:600c:1884:b0:42c:aeee:d8ee with SMTP id 5b1f17b1804b1-42f77951d97mr2528105e9.8.1727815233235;
        Tue, 01 Oct 2024 13:40:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771c208bsm6214725e9.0.2024.10.01.13.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 13:40:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] firmware: tegra: bpmp: Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths"
Date: Tue,  1 Oct 2024 22:40:25 +0200
Message-ID: <20241001204025.5632-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped
device node handling to simplify error paths") because it was silently
modified by committer during commit process, by moving declaration of
'struct device_node *np' above the initializer/constructor.  Such code
was not intention of the author, is not conforming to cleanup.h code
style and decreases the code readability.

I did not write such code and I did not agree to put my name with such
commit.

Original patch:
https://lore.kernel.org/all/20240816135722.105945-2-krzysztof.kozlowski@linaro.org/

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

It's very strange to see own patches silently modified without any
explanation in Signed-off-by area.
---
 drivers/firmware/tegra/bpmp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 2bee6e918f81..c3a1dc344961 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
-#include <linux/cleanup.h>
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
@@ -35,24 +34,29 @@ channel_to_ops(struct tegra_bpmp_channel *channel)
 
 struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
-	struct device_node *np __free(device_node);
 	struct platform_device *pdev;
 	struct tegra_bpmp *bpmp;
+	struct device_node *np;
 
 	np = of_parse_phandle(dev->of_node, "nvidia,bpmp", 0);
 	if (!np)
 		return ERR_PTR(-ENOENT);
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
+	if (!pdev) {
+		bpmp = ERR_PTR(-ENODEV);
+		goto put;
+	}
 
 	bpmp = platform_get_drvdata(pdev);
 	if (!bpmp) {
+		bpmp = ERR_PTR(-EPROBE_DEFER);
 		put_device(&pdev->dev);
-		return ERR_PTR(-EPROBE_DEFER);
+		goto put;
 	}
 
+put:
+	of_node_put(np);
 	return bpmp;
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_get);
-- 
2.43.0

