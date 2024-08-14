Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C061C463D
	for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666688; cv=none; b=q91tjaZBHsEAVnLhrxoUDcEJ2HPs/680Z7t/5d1wx37OBk35RolpJAeTPr/NRr6nl+R5wLl0KKuMZnM+fRe8KDmCRenIkftrgOTjfZYS+CIlLGF2MyKQDicrSxeCok7XwtztxFQb82N4749EqAFiN6CZTSU9XkBoweqfhtq2ODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666688; c=relaxed/simple;
	bh=ACTPT/WKeh8vPrxZG+9k9m7syH9ZC+yY+13QhJEgNj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FKqG1O1tg88Acvltk463tunuJxLzokOZ9Uc+eL6uyGpwyKYgz0RV2Ou6afNYCcm5HSwfZhIJ17UoujkDDb0BMD3g+Nm3UaV4zcSGXEuk8R5XvbNJe12wtyhq5YZpZyrD6t0EQFzppOrYtwQhCpdo+poDt5yXFMseT4oKa0pnJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9W6aCqk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9W6aCqk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428e3129851so1041445e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2024 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666685; x=1724271485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++p+JxzQS5UPTkfx3ma3H7Ls6vAeOBS5jFyHbB6JISU=;
        b=E9W6aCqkGZEm0RfP6TgcCoU4LhrUvca1IrM/R7EsKzXNflgMUHpXyOHaGzHAmh+5Dy
         jmbMmfsEqjpA/s8IT3y3dLrRRS0dp9SFbFIrmEXA7S1qzaoJcGbhsGw4F8ncxL3LVLaR
         e7+vq817WtsggEwyVAjknYw8rqyBTDBTy3iMr6Yvowkz9HGZ8YtLPa/OhEzxdAsbW2UX
         VqGlwmjnEvqwQQlkP431s/k+h1LxgKTuUJMbRx9YYLxLsYeb7Cn8NeoUKSuhcrmYwm/c
         ItJKeykgF97iJe+kvNib4pliSpG/oKQpGHujSTubkz9a2+8iiFjWkDoIVQoA2K8yU8Zk
         18Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666685; x=1724271485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++p+JxzQS5UPTkfx3ma3H7Ls6vAeOBS5jFyHbB6JISU=;
        b=SssSiVKdxfvQEG3qdzqsJ1df945GXYt+yaPl6n6cMlr+QqzrACIYKcrhjaAQby/PDA
         En7V4ql0GnirK5xK9cwbtSbl+pS0dqOjafYxXHBtMiLbsz40HSoeEaokJvk94Yv1/pRf
         LraYVTA1L6CLcvJqNasqxfqFxf5Fco5xKKjRINenlIMQmdOtL0qzpxDMwmZsDNlm+EQX
         mmGNkgSj1nR/D5x3+kf6lFCzbpm5A4lEvoUlrtZc/VsamuFvcH0FewRzImlp9Z/sEHIz
         TuQLNGVf2bZHHLrYtYzNivjNCfggXBUebHF8wtKe5E6Oa04GAsH4JKhZQnyJ26gax1i3
         p3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVThoWpD9P6d/e658Yeafw8Ad1HhC0rHIwvjPa3h16BYMwMFrBZumw6cv1vvTmTw0GLLWA0VhO7TJEsjkPzpk9g/sU+cbqgJDm1oUI=
X-Gm-Message-State: AOJu0Yxrasls629OIVrMY27NVirtNJ8UCX6N/lo6Ko/DMmcskjM9Ktb9
	oKLNRu9XmXt/q9Y7SIMiqmRFu/OLcsaf3muS/cx6QrQ8FiRGjag5x51HS6WyXqg=
X-Google-Smtp-Source: AGHT+IGZiGFg5LA2lGJLTze5FU5Hft61dd3QE0hb8QyXPgP+/VawCBj27w0F0jk2ArjxvKBIS0JR2w==
X-Received: by 2002:a05:600c:3c96:b0:426:6eae:6596 with SMTP id 5b1f17b1804b1-429dd264983mr25480435e9.25.1723666684504;
        Wed, 14 Aug 2024 13:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:48 +0200
Subject: [PATCH 2/7] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ACTPT/WKeh8vPrxZG+9k9m7syH9ZC+yY+13QhJEgNj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDx7NYdG6rXPPkRJrrDAHgRjoLKhzOmBCUbJ
 I8k1L+TZP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8QAKCRDBN2bmhouD
 1wujEACJpmuU29GVP2zsxezI8prUfzlD7Dd1+Iqtv8zthOx8t2E5ZqFctpVVI+MKRT/R6mVKS//
 U4kJXFpNtgs4UEuc1kNVnl9nNX4jtvW24aQJmPkYMwlf9YBGuHWWYh/0LwjAla3bR7TQj3GpKGi
 cUKzjtiGHn/X/DsbY1vZNWYvLIxlf6liEtilmsZOJczvEQmxlyUrBaFhj4h7Etjgw6GvEiuBo6R
 +AUL0t1Ub4L+Da8vdWUd/DnOysxjTeDfAuY2gMpgRmfe4JFNF/BVhFc1ULBx9a373LNUvjlzI4v
 tzor1aruDD8jpccHc5jEEwsBifiYCavIf+/YwF4WYDV/JjoArEL0xavpKzdWaVsdEWBelvaFp2G
 Sz+7ZiUpDZQxiKiu5XYOPrUt/zBUb/Om88yNxspDCUFLpUB9tWapk2Bg5Dp1DjO7rtJxKrCwbKf
 FCU0iZo7E00Ibt8esX8i6IPfo96rrh2Uw43X3geCtY9zqA8hOWn/tZBiy0xxuNMOMR7MK7XYfK3
 1TEQ7WkvZi+ytUQEEREOvCBUIcf8GOou/ALd+O5SFD4yFWBnqpR+mEYDvfOMLFFnrG9FvU2EfI2
 ifFhHDDDczOFhS6oE3i1pHl7U3w1jzlco+CefAoXghMjvTE4xP3Pc9tGOmRp2XBFWnJVdizYn8r
 IJs7VOjqz7i23OA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a2278d4ad886..c8ded4462bb8 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -117,10 +117,9 @@ static int thermal_of_populate_trip(struct device_node *np,
 static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
 {
 	struct thermal_trip *tt;
-	struct device_node *trips;
 	int ret, count;
 
-	trips = of_get_child_by_name(np, "trips");
+	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
 		pr_err("Failed to find 'trips' node\n");
 		return ERR_PTR(-EINVAL);
@@ -129,15 +128,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	count = of_get_child_count(trips);
 	if (!count) {
 		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
+		return ERR_PTR(-EINVAL);
 	}
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
-	if (!tt) {
-		ret = -ENOMEM;
-		goto out_of_node_put;
-	}
+	if (!tt)
+		return ERR_PTR(-ENOMEM);
 
 	*ntrips = count;
 
@@ -155,8 +151,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 out_kfree:
 	kfree(tt);
 	*ntrips = 0;
-out_of_node_put:
-	of_node_put(trips);
 
 	return ERR_PTR(ret);
 }

-- 
2.43.0

