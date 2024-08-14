Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ADF1C3794
	for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666692; cv=none; b=ExJj2UOdtPW8/JUwWtMOwBU8QhrAFKqndwozHIjRkhA4wL9aMyNPpM2y/rNGsiMBVFHgu4R+KtZDHx9K0WgvvaSb97B7YcHzfJjstbNuZu5P6o3XfKFv16f+TfiOTWaeZ5J/Hiv61YkvvladZqtGsdlB3xskPSXh6RnxdiqjVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666692; c=relaxed/simple;
	bh=M6Xota0thM0mYn1zZ6Ux2xxXCKU4Y7eLR8l8l/rV8NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tsh/F0ajQuV1hLTIDDfj7A21Wt3/R6qY1alE/uuZXIPGG376gqw55memBPrAeKJoMjSseQga091C2iNQTp8SgceOtIiXHVyfP4ojmflLQXgK8Y18P1j26tf3ADXhL6Nd+DHRGXSjLlfYnvikbjxlbb/6I2e+pZkp7DYiTjcrk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NL/4gfqv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NL/4gfqv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37186c2278bso155705f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666688; x=1724271488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYAN8fXpIDX9+PSKUATbbwS0hbvD/LD3aOg31XZDMpo=;
        b=NL/4gfqvqMsnjuaqARPIECdSdhSYdB1/dTTQ8axRrpsnusLfL6q/GAHicYb5yI+52H
         N1fwzdMDZRmyyJjsdSnEYROYpLv8gtKe5/TNEqfyv1UQwGSmGyNrvOFAHS5oaY8Fv9jv
         iS4dlWRtOI1gnqK99CBxh5QgA80LDJFWLYDgEylmAPCv/kiuNEBS1kJgRO1Jyg8/Zn8S
         r158O2O3b5ub8+Al1cfDuNNSkCAPOfyKHLniqlunSy5nyOH01AU76yn5QFyfN/scimlp
         ImaOjGS1ku/ZGsdxL7f2/v/AUqj9pjq/JsMfDBNYm2RyGxHBYr8i8trZnVCWrCgeJgUX
         3HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666688; x=1724271488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYAN8fXpIDX9+PSKUATbbwS0hbvD/LD3aOg31XZDMpo=;
        b=guKLffaSRf4ZDAV4OmQ74uBp9R4YWHfLKPDtrE8ToPhkjChOm+uAjK6s4OkQ+VaK6a
         w4/qZzkpRm348xIRJZhfT4rpSF722OxsoiBtzfckxWH506raCGBCtO4aVNyU9Vs7At9h
         BTOUUAQKQSjZKMEpIcr1UgPsmlhWtewTZF7ZuiLTMdMSuCZoZwcD1uHSHBGhd8+diAK3
         EqwBxETCQVCeZk4cBQO/pqkDv57dJSzmgtj1vy5xgCI7j4H/F9iHUMB5JXe8mbzv8bYS
         Ldl6TRf2om1W8SRWYlQuiTKUKsoa0gXAtY8dsmVHb8S4JDdfiqMKwJ55sXzNpDGiuCJY
         E4iw==
X-Forwarded-Encrypted: i=1; AJvYcCV67Qdbd8u8Nk/w4Hm3in4r6rcUPCdkuL3ptql4DXZILS1rxb0psEwIMDzAFLU1V0qys1ZV6gBL+LmFSiEei6XZc+YnRQJBTy9srwA=
X-Gm-Message-State: AOJu0YwyaI1LRsjFlDVi6n7hbqOqJlihSxzkKkhgmVBfXxIs70pW/T2x
	YUJhkGvAzSC5I1o25IrdBLPqAtjacVRK1DZxonFB6RRmjhUX4eNXQE5tWOe55z0=
X-Google-Smtp-Source: AGHT+IGmwY3kKAsbbIqdA1Qy/7Y86HNZhbTxTi95aWs5EkZQvNUDlulFUHDoGmkvah5120zCV84YGw==
X-Received: by 2002:a5d:6405:0:b0:366:f455:e7c1 with SMTP id ffacd0b85a97d-37186c16564mr443264f8f.27.1723666688344;
        Wed, 14 Aug 2024 13:18:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:50 +0200
Subject: [PATCH 4/7] thermal: of: Simplify
 thermal_of_for_each_cooling_maps() with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-4-7a1381e1627e@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M6Xota0thM0mYn1zZ6Ux2xxXCKU4Y7eLR8l8l/rV8NM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDzIdQaQJ8rUf7OgqZtPMHSf44hK/AD4TH4z
 9HLy982xDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8wAKCRDBN2bmhouD
 15CEEACH9zSrwPulXXxTiZk/Lc++xQoUbUrbSH83B4cknQVxa+LCM48SUEiW4GBIg1S/iEBT6/w
 a1dB468nxbZGX/EYemdV+u8JHk+2smNdmdxPeoyAStQxxfT5kHbjXz3hcBnWm0U6zCO1D6Xaa7H
 PYh8o3kq/rSVm67163yZlcm8uKq1C1BFHh8SzSo29rbTI7iUp6NlTTQ9slD9tS7q7dIWPnKtKxl
 CYhQVUe5uVx6abJavCp39qYant3rSvcrhwRvGLSmR6V3nofw543wFbRRkTS67CzCzPMr6zsoLAl
 8ut5Nl+lGcRMcJhBQ7Sz532SI1z8WkgjkGG2pAGMedOeheZfCyRblUjejNGbZ5wEmaT/7bBLRjH
 hj8zLmIJLBF0VHV9/drTre03SBL5lfQGQss4QC+8SX9+PCpunnHUyh+5kKb6nO9pFXC4LP2KkpY
 z/xWltIXUXWJL/PSthxrDEwfg8IJrZOtnYIAw1dMYHdi/yCReViWn7j2+SmRYVHW3vYIlKrqsNf
 fUPDZEr3gRPsn/tUkM2mCJ2f50PoHifBu7szVGKuFt9fplMx0PvQbc5jHts9l9Kw5jlAYMea6X1
 TUsfqajTEUkIWJs/J9rsoifr+hkFtcInxNRemFo1aLAf3qylMzUL/zjMsy+mpIWmwNfAAEDbzO1
 vLQoWPt6VIWhhJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index fb5472d6ffea..d277165746d5 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -375,7 +375,7 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 					    int (*action)(struct device_node *, int, int,
 							  struct thermal_zone_device *, struct thermal_cooling_device *))
 {
-	struct device_node *tz_np, *cm_np, *child;
+	struct device_node *tz_np, *cm_np;
 	int ret = 0;
 
 	tz_np = thermal_of_zone_get_by_name(tz);
@@ -388,12 +388,10 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
 	if (!cm_np)
 		goto out;
 
-	for_each_child_of_node(cm_np, child) {
+	for_each_child_of_node_scoped(cm_np, child) {
 		ret = thermal_of_for_each_cooling_device(tz_np, child, tz, cdev, action);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			break;
-		}
 	}
 
 	of_node_put(cm_np);

-- 
2.43.0

