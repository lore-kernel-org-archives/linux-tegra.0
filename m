Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC61BB684
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816653; cv=none; b=YO7jLcIAnmQQdMOYGs5hyyp+TzVYTKU9Mx/5WIGj+d7oE9hvYvh+A+fL3509sK5mPm0kTJ0Eat42lSxfESYbkEd6u/4XSnmlAPmVy7xSgcjoiTuxY8mSjNsgsLWCWMGQayg6MK++5wUYYvISa1ELKjzdhf20//kyxaSNc6RJz7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816653; c=relaxed/simple;
	bh=ES5WNhjQ97KkXEVEYI5UMpRbkvt68q9g+APgmhu1B+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmnJn2wxNzti7j0feCzTAdyHKeBUU33ZLxcU4KDBaeOO2Eq03LGXO5wnkdjuuSDcf6NJlL4UKKnLgHFjg8eIjiyU/hTTaHkAzRrVuTozr7zBYiepsalusVI7RtTq3gL2IjdmCt4dF/Wuoh1pzjrbIzM3txeJ8eeSgeK14s8nLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skoonXmm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skoonXmm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso20493565e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723816650; x=1724421450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FU7Yn36ou/qawMkS1iMJfnBA3me627G17eoAbOIhIU=;
        b=skoonXmm9AwCuIWHcBSRq8UxYQLVxV/Z0RKihKZpXrIthrUc7QxE3d71BfCLk/V6aO
         xv3yKRKRwbfy88GCBLQtPbZlcvpR8/p8fu1G05/rBH6JAK2JYvPEk1cv28zNmw73olhU
         r7zv3kqaOmSVV9s+VHOt7Cg3Hh1HZKKYtz21V5IEH1AE0FjoU6SSgKRtq+w2IC5dufBl
         aLf/vErAMkaHEErKeivvLPMSCxHjddRq8+XQmsfqzBgxYmDTs2mAcu9pqmZwC+YbJprg
         putZa7ibi7AfEIuz1U8sTw9JtGDeNcEcOBP49IXR2Z4VBOUtMY5LstBTGh1nBQxC8QIU
         ah3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723816650; x=1724421450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FU7Yn36ou/qawMkS1iMJfnBA3me627G17eoAbOIhIU=;
        b=n0T5ccX8aOU3Bk5e+CwW5Nk44vsQhIB5sk90WgqRkjWkrimwzCUxQ92E/VpdrEa6v8
         D3r8B+WSzZ9rirMiAGcvANIe0z7SWtCLs5OrJjJpVSX3E71jk7U0wXdsAS7RsQSuP105
         pmaw8NVVtNM16Zcj9mp7JIrQ/jc2DgikMU3VkcyW6nwO4jdA3KmB1b2U6xtGdQ+e4uEg
         MkGlML2pQHDiRpCjLrJRghghazCU6vsLhMkm0GB6yBJA1VTM+DNVCP8ke+t20nB6h2Np
         kcfYMeTWutMUl2M71DwA90o7y44PoeraN2ySzjZnaGfqGK9bO+YPfRq9ZJIxsmRWJDwA
         9FrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuTbNZyoBoKwvD9Pq/USj15Pw7aFT5pmZmRsa5BqVDmEFTt6mw0XGIoi3Z3sVcLdoYRH8szsvVSLCQRLTKbSntBa4vjjNVocWaIns=
X-Gm-Message-State: AOJu0YxBo5wcOpBeZhbgRQuXUuMigYEJ93uwuPdEeL8StI1ceD3qaFcm
	lNXcHxUF+jscHMGD9jNK2VvIDOgYbras3xc9FxTW96Wav54NnFCjgzWbWOZHwEs=
X-Google-Smtp-Source: AGHT+IF64oucyuEIrdECCSfRCeOVjjInXceFWeMY/QFE6S9rq989ayLrMtsEH0Yly5SMl9RtJuP63A==
X-Received: by 2002:a05:600c:3b26:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-429ed7b6a3dmr24128425e9.17.1723816649988;
        Fri, 16 Aug 2024 06:57:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded36a95sm76183995e9.28.2024.08.16.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 06:57:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Timo Alho <talho@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] firmware: tegra: bpmp: use scoped device node handling to simplify error paths
Date: Fri, 16 Aug 2024 15:57:22 +0200
Message-ID: <20240816135722.105945-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816135722.105945-1-krzysztof.kozlowski@linaro.org>
References: <20240816135722.105945-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/tegra/bpmp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index c3a1dc344961..2edc3838538e 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
@@ -36,27 +37,22 @@ struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
 	struct platform_device *pdev;
 	struct tegra_bpmp *bpmp;
-	struct device_node *np;
 
-	np = of_parse_phandle(dev->of_node, "nvidia,bpmp", 0);
+	struct device_node *np __free(device_node) = of_parse_phandle(dev->of_node,
+								      "nvidia,bpmp", 0);
 	if (!np)
 		return ERR_PTR(-ENOENT);
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev) {
-		bpmp = ERR_PTR(-ENODEV);
-		goto put;
-	}
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
 
 	bpmp = platform_get_drvdata(pdev);
 	if (!bpmp) {
-		bpmp = ERR_PTR(-EPROBE_DEFER);
 		put_device(&pdev->dev);
-		goto put;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-put:
-	of_node_put(np);
 	return bpmp;
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_get);
-- 
2.43.0

