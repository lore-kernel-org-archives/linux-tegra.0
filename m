Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183D1CF2AD
	for <linux-tegra@vger.kernel.org>; Tue,  8 Oct 2024 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378027; cv=none; b=jCyINYg6bHVqV5eMQegwy1pF6ku4vq85z1GU6YcHDR9YeTcRxwLSLqy7jSoEXN2uHtGDIcpzficksv6L9ezin0iUqb7MAIxCIEWY6+zWhAylgAQDHHVaU8ynZ+WuJwm9DVoPBXfF+6D63x9pAKUbDMzsBQ4eC2h50RClDWrjUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378027; c=relaxed/simple;
	bh=f8R4vPEQrLlg+uQU0hqpfy7huKkBhYLvXSmkKXC3XkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8bYeVQqpCIhMn+1LiituMV2SBT/YiOe099TsCagcqz9+BDkVloHSKp98CvX6ioTP6bEmiXSeldTz0ZsB58bV+B0NV1C7ffXIy1baBv8anx9QspxIK+rc87ZZ/Id9HsFiEmO7ZMbg/eJJHPSEtqMkDgrG1s4VTEWwis6i2NWdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=seCLATiI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="seCLATiI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c877f18276so971838a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2024 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378023; x=1728982823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VqC8VxguTcsDUEEbczg9yl17o4tpL25LM2OL53pKrc=;
        b=seCLATiI4R+AewsoPujGGIfasJHzykFQjKzivcfiHn7fW+gC4IglKMaX/6dWK1lWyX
         4drF+POUMjKjzF17sGtjo5hdhU/y3k8I4FDs8USAK8sDmOAgiSP6Ra5rm/XAvWAa/0za
         3rUnyyTfB7kllQe3zuz5Ikcf0lYhgnk1ffjccFQOWzVlOoWZPYzfjUIt3t5mT4mpJCYr
         sNXoXywmoV0DAbwaA+OyvgksMwqUTIgWtSgJEnhx4fRH0QThplFn+TJLzStlYQ3ELMVk
         ozhr+fNs19GSvVHnO0SZugKy6BOr3+Tf5Qbhiuuu1wkySy0dVO9lYGTYAvWleAnXproy
         ITrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378023; x=1728982823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VqC8VxguTcsDUEEbczg9yl17o4tpL25LM2OL53pKrc=;
        b=JaozXHsSkR65q+eNC/xn47RR2oPqmgdyiE5LKFSVqOVr1vfmup7nuc6ZuMyHt4Ft4O
         RWBnKOgn+gFL3PltSSPTSQlE1xg1S7db/p3ur3/6n15Rlp3qZi9fUAzWuDyoFcEsegS4
         VjI0Q+v6zDwmxzrHwCS9ozeRWnK8Hw9ID+SloCqyck0/zrhFERAsu8/jDspkvToO2WZD
         q1XDb/2gVngfIJy+kyTBQs8D3wOvg4vKbYkTx+Z3kXBcdgIPcEJrQqDquW4KXIqtn2PU
         lIhekJRxQQOyV/CgV8+iFD3fk8My7mHeJ1s5JLk90rXyj8qNi2189EXAUfX+sXWjJ15c
         ejTw==
X-Forwarded-Encrypted: i=1; AJvYcCXcV53O8XkqQwOVTBMdEK/1RiaBbvCnNJSSbNLiAk7emkuaUuJ69r+AhyDNWvx9Fct9v68tutY1+pmpdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjquEjNgibeHM8jMgDE4f28ZhZeLGACbtZJVeAyxa0gMIbREfW
	u6Lg+jBcsop1zRNYlVsHQSIzScpeWYfSvL5dC/9HpWhS8AoFVgnWTqT2fQt6kzw=
X-Google-Smtp-Source: AGHT+IFEyUOTrrK9/MFjPogQ0jScCR6ikh+1YFZdLnlwxjJjHIEA4i0X2pX53X+tA6dUtRJR33C3mQ==
X-Received: by 2002:a17:907:7f8e:b0:a99:63d8:a1a8 with SMTP id a640c23a62f3a-a9963d8a3c9mr114298866b.1.1728378023275;
        Tue, 08 Oct 2024 02:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:03 +0200
Subject: [PATCH v3 3/6] thermal: of: Use scoped device node handling to
 simplify of_thermal_zone_find()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-3-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
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
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=f8R4vPEQrLlg+uQU0hqpfy7huKkBhYLvXSmkKXC3XkA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSc31927xZQcLU9qXE2lgs2BbLCHiXUAd+pK
 iFxi47CEw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nAAKCRDBN2bmhouD
 15oeEACMPR9GWv/Lx6eziZByXPhR16yhAuUFH+uuwrhfEAQ4OoGlvn4Hs2p2xNeK0o23LSFTF84
 5/585BxDyRxRxD5QUwVkAG4hjhOtM6d36WED3JkfWf2JfMOuDD7RyUlhBJoaQpoKTdqlFxX83Ho
 WfacrlEkzaUrb/lDCXRkwqvT/W6txqPHYu7/58XL6uJw1B/HFLNqVHgMNik3twv5hYXuxQDYYJf
 isAjLv4jmumNsZmNKMGCJzd2m7iw38DG6IbBb9YpRLHrFpE2UT/wSR/5FUE3vfY/gbxZq3IV+/K
 uJlL5QNoxac2OIN9gAaq4VPhFEfSDJ093n2ndKb8077Nin5Xlx39Hu+/OHjcuYhQEKWrR7slXDv
 YSYn+LMPCogPt+pSAwNuVcl5TDGqdaP5jzuEzM5CdPWkO1JUn3BpdmRMkF17skarY4Ah1+dkio4
 vevoWc3Nxi1eSXIk4pyN1kgARorqU2h2aNa9b+JDg7JZmB2w/QD6AFO0+zQZRuIUheJinukanpq
 UwOx7kKPX4tn6V8IU0E09c5RBpmgLh3h8u/TuSVvVauunSDe4uykBA0zgeoilt1/oWEPkY1e5ym
 o5+1PlHncSFlWKZg8nT5fdBt8AOCn0Yu/0hwRQ/w62u1UbZBA+VYMI6sL3CepEpBJApQcx7Cg+m
 +cvCh7nM/j/YjSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/thermal_of.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index d7d6f62caa13d545e5f7fae4c8ac1e737bf4c4b1..a2e20986668b7aa465f3f2ab861f70101d2111c8 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -134,10 +134,9 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 static struct device_node *of_thermal_zone_find(struct device_node *sensor, int id)
 {
-	struct device_node *np, *tz;
 	struct of_phandle_args sensor_specs;
 
-	np = of_find_node_by_name(NULL, "thermal-zones");
+	struct device_node *np __free(device_node) = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np) {
 		pr_debug("No thermal zones description\n");
 		return ERR_PTR(-ENODEV);
@@ -155,8 +154,7 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 						   "#thermal-sensor-cells");
 		if (count <= 0) {
 			pr_err("%pOFn: missing thermal sensor\n", child);
-			tz = ERR_PTR(-EINVAL);
-			goto out;
+			return ERR_PTR(-EINVAL);
 		}
 
 		for (i = 0; i < count; i++) {
@@ -168,22 +166,18 @@ static struct device_node *of_thermal_zone_find(struct device_node *sensor, int
 							 i, &sensor_specs);
 			if (ret < 0) {
 				pr_err("%pOFn: Failed to read thermal-sensors cells: %d\n", child, ret);
-				tz = ERR_PTR(ret);
-				goto out;
+				return ERR_PTR(ret);
 			}
 
 			if ((sensor == sensor_specs.np) && id == (sensor_specs.args_count ?
 								  sensor_specs.args[0] : 0)) {
 				pr_debug("sensor %pOFn id=%d belongs to %pOFn\n", sensor, id, child);
-				tz = no_free_ptr(child);
-				goto out;
+				return no_free_ptr(child);
 			}
 		}
 	}
-	tz = ERR_PTR(-ENODEV);
-out:
-	of_node_put(np);
-	return tz;
+
+	return ERR_PTR(-ENODEV);
 }
 
 static int thermal_of_monitor_init(struct device_node *np, int *delay, int *pdelay)

-- 
2.43.0

