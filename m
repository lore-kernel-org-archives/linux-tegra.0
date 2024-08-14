Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE481C231E
	for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666685; cv=none; b=ccdYWG1OZq2p+3aUzK4og702uXLjiXBO3j8ODe4THeMx9SYU/LmE3UUsq6WiQsxNOOxa28wKRikdhzR4eidRSko239J5huSZqG82KXqvkyGmw4P+9nYzHW37lXvgZq00/yTfCH6B6xZC4V/XKr3Df5AzLUSNZHgbTvkL1P42Msk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666685; c=relaxed/simple;
	bh=Jfl9CCDjoTMAykhligO10CdduRTjKmS0DGo6xlPScyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S05fSQfU6ZO640JqDaHffkUM2xyDoQBJ1CpYS0Ec1ZD41LFcAPGwbdSrYmpWHoSHIpEtZCfBEIUVYEoI4SWJ8wSJEoujlO8fQSgIrYtpNdySqeSsh158sb2UiKcTvnTTmQcSATHkWQ1KBmrlCQB+aVEUai14UoLqWoNqwgkeOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ve2o9I55; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ve2o9I55"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42812945633so1234395e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666682; x=1724271482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObSCoIKHR53RsBAjPImzvWTBDUOXW/cdZ+itJeFwmLI=;
        b=ve2o9I55gH0kUVjpF8TLMxc/sUWRd9OvMkI52fKkKT1XjjIbFUYCiAtABVV6S9KT29
         Grzbb9G772GMMZ0N2DdokcTT2X7wnJXwwp0xPjwI8Dkr57RG8Nu9gYTU6gYQ4EqGTrkm
         /B7LWj/TrRmpTmhENmAmaxSYT0j+ESNPoaph0RHBm+KgWZpP8Rxg1ttUA+TTyCQGqrYq
         qGUhVa9ZQXsqbMET5rUHmxpHoER01XE2lopVOtkYfbCqgMMq8Oh/wH3+iVQsrorj3bTf
         BVnDW0Wh1muRRdLAlnb4Z9UhdZpMZjYtdkYc1sPUGqqu/+HbaaH8V69IEqpUoElt5Enr
         1msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666682; x=1724271482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObSCoIKHR53RsBAjPImzvWTBDUOXW/cdZ+itJeFwmLI=;
        b=TLSdS2ybOpAjRpGzQaKQMk8zCbws4YYV/heA2xJ2pxtdKpnZKliw1Kyyy9xHTD6H5q
         Itl/9tBtweVyiEkitDw4FOhLpjCQJxijeYviiDmhORPLSPozGDkka6ZejLY4DrxWCitv
         gusPpjNCrfhkPVPYh+F1P9DFBvm4q/mkHrJ7gpRMgrdnSYeA/BNIbBHQbNKfYzixT1iY
         VQLevJ150Fpb1SkM1S/at2Z46NXyHwIQuBtClxqYqdE12y8hmDW/PUY579+B4POEl43K
         nOkTYY6rwj4JypQejP5JooyKdn0xHkiE48vNeEExghTVFhsoOZMyY5pZyJTXvsdKnCmY
         W1gA==
X-Forwarded-Encrypted: i=1; AJvYcCVah5v+HMK6KdluL8BUOyB3Kl7rr8aYA28UnszceLqOS3OnkxFyyxI1rZovOirUmHvXP+8YWMOgl9mnIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBduVv8sX1dB2hR6fQrImBYHndYDdZzTb0fna+Ma5sdhxMc1nj
	x9B1vfK9LUvpX4ltC6oCim5h0AmydxwaqhwRfJPVzPqxW8awVj/2ZIHDCvN7YIc=
X-Google-Smtp-Source: AGHT+IEjqXpjYet6ypGc802+q411OKw8d01xxmNltI0G2Yu9eqYwp/090Xmw263ZglHYyBOUSAWiig==
X-Received: by 2002:a05:600c:4e8f:b0:426:55c4:ff34 with SMTP id 5b1f17b1804b1-429dd23b7ebmr25874885e9.15.1723666682300;
        Wed, 14 Aug 2024 13:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:47 +0200
Subject: [PATCH 1/7] thermal: of: Use scoped device node handling to
 simplify of_find_trip_id()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Jfl9CCDjoTMAykhligO10CdduRTjKmS0DGo6xlPScyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDww327vaCGWSmCQ5rATkIm5TMFxxObspRAg
 BwE3OcKQ1+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8AAKCRDBN2bmhouD
 10wNEACYQM02wcgcm6jW32tliH/1WiMeu85GF915kaNTEIw+b5lwNX8CD1OIwKt11RUVLIrxq2r
 fjTc4r7xwznphVHVZG0DtaMp4+nIxLeo7/odUs8f7rapwhtz+8PHbyAq5mEk6VTLjkq/5MQIChG
 9CVFWkmuMj+cZL9nTtPPVITIUmuQDnslBlS27/vm5Jb2azkaZcg5dmgMj3QxGM9JyOfSuLhtqaX
 uF1wJBOafwHjG46OU/QvVVNGc7uZlBVpjRSI9L/ZZePiTcx7GhtK/GUm4w4WQpybcaJjQlmyghZ
 w91qS+XkrupTPhyZxQ2p0QBv0WBHH3eoeyP/LJO6AN0sRb87Lfifq7GyyVO1FA0+jOh+iYuRMiH
 sFid4KKB9Ahclv+XJHdCuXsUAULeU2SK3jtEiAx9fCrzqwNp7qyhGV0QqLAFQancLX1ZEdj31lt
 yxYCp4ee6/kKpcB3RHmdWZQUZ6X01FVavPeZIrIdyQrMQO+bv0a6zO3VAvD7pt6PqDPcSCgDejf
 vufLcOV3IRMZnObwPiw3RhlwrwMk+3FWdOKv1FmQtiAu7lD2PqMKUQPn/IozQAgXC+spvP3+90u
 3+BjIpQ4YWpDdxbwdvZL+rXHD7KStxzwqih1EwGP5W7NYh27CP/zXW2AkupPw42+FWnuinaa5tq
 pIWUfWMRnZDMyEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h and use scoped
for_each_child_of_node_scoped() to reduce error handling in
of_find_trip_id() and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 1f252692815a..a2278d4ad886 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/of.h>
@@ -22,11 +23,9 @@
 
 static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 {
-	struct device_node *trips;
-	struct device_node *t;
 	int i = 0;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return -EINVAL;
@@ -35,20 +34,13 @@ static int of_find_trip_id(struct device_node *np, struct device_node *trip)
 	/*
 	 * Find the trip id point associated with the cooling device map
 	 */
-	for_each_child_of_node(trips, t) {
-
-		if (t == trip) {
-			of_node_put(t);
-			goto out;
-		}
+	for_each_child_of_node_scoped(trips, t) {
+		if (t == trip)
+			return i;
 		i++;
 	}
 
-	i = -ENXIO;
-out:
-	of_node_put(trips);
-
-	return i;
+	return -ENXIO;
 }
 
 /*

-- 
2.43.0

