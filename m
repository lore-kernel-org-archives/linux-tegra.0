Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16194351FD4
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456096; cv=none; b=nJ9L53eG0mdt8/XdvFMOXJHojbYXrLs5Tz92phWCEcFdYJT4CsLMAtvx/530M95j3yRIBKOonoV02PxiefHYnTGvbPedk3nNBxYFsqz734lourzzSO4yq/VMRq6AUIAic6lSI/69vENWI95c+brq/qWL9CI21eaTjh4rW6KLttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456096; c=relaxed/simple;
	bh=JUijnBRGu0gt5BmJL1AM+Ht/YwmL8eWcsQcfAW02eOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pq9LktmpL1YJ7VRUURgcaywbpd2poQDycgwcbkQMu25XAIwlOn1Cw+47CQzEhwAAfaIfSSlROkFnO7VsOqsa5xOCRS0Kxx6a9na9biRQKG2UVEpd9Naqg90yePzWOfnjmyQ1r5QEC2gIF9+itp8Kd6BDqyc1mtKN/hfPhW9nNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywvo39Eh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywvo39Eh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b725c6be585so19955066b.3
        for <linux-tegra@vger.kernel.org>; Thu, 06 Nov 2025 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456092; x=1763060892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=ywvo39Ehduhw/1w5qNV1Rd9Qi/11oS+v7O4ALGwDv+MHMehRV0SsVxVRRtszWC0Bd+
         6wC/c2h0qJ/3LxtJJXqkN0QgMhZ1anLQ22EEm27VRq+f/+U3KhUKcPb8hSYNNgiajuYi
         DtrKvhUjwWtzmBALS0NWXA+GUX9AvAFDxHvtSz+Jch0M1Qn4ghTl+FjpsqExVb7Ygk0M
         B9ZYcx6LUcTaQdACLJEixFn+8iIh6EuyNNi7/W5zp+BlvLudk9pOyzl52sSDC85QElgT
         OMSP0RSKGogxbgcl7FVpfrJAHtceEOplf/C/KzD921A/5G0vogn3dvDs3mO0ysKNXfIe
         8euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456092; x=1763060892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHx0ijyt7NNWrg5OZkXcDWeNAbRVfwuusWhyx0gnMK0=;
        b=dqyXf62VRSs76d/pRfFJa7Q58kvo4ExMrxbsqn1paj7CXsP5ADPe8q9Bm1iwCBzmq1
         A7lYttDBcMtsP/GsG8o8GpJP0JGds1wKq4a8oYItE2wpoA08nlZJPYNK83cKN8DG4lo1
         DJEShUYyR4yXKyrMwEJUv67lhzt97ZBDOpC7DzGuuYxK+/0de0n041vZnwDRcWqplqjy
         o9TNtNzA35nJvK0KYGZRLcUpZfK+/awgaK7UWd3TurGAwTUQpW/SVXJYFX6nmvzzD8+8
         V5YEPn0tZ1VIPSO8WLPULg9bUnf6xWzxAl2gOofvptEv1slceq4zxXAUdr1mPk/AdQDJ
         yf6g==
X-Forwarded-Encrypted: i=1; AJvYcCVdmuL/NYMz8i1yRH9J1/I9g2CywWlShv8FY3X46mZMrpbyG1GSwgp7UbSHz0ITmQ+yN9X9F7ik7qd79Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbxkQwInwVk/vyiTRFVob6Q3o6+0TrF2bpKSfdrqCU8tGbgBbB
	4YREbQhdGPhf5Nr2hvy1dRxP6yh6Q7iPlP3VEpRwTE1RGJbC8GaRFD+9toeQLsxDWlk=
X-Gm-Gg: ASbGncvbPmmnS6aOxpPzhxqvoQBIvyURZIO9aA0c9MKKrmRJNhHFp3VihhYtgac72qd
	ORgPqNZTs2+YTWZKJcbet/d1frzC2eRaqT4hU3lzt7KT2B55kyj/kqLnmDAjuo8sLGCFCXL0C3A
	438DuOcHUy3oeg2H3wLPLpkTLBsfFc02dqBDwHmSE5R8SLoXjpJ0C7EsbtDT4CAyABmqYMRra7W
	5q11lf8XEdZhiH0x+aPUIDyr4CjMWegj+8p/OsMPl8k83PtSWKIe2ou4xsqv9PAsfwcj3Oqx8Zc
	C5fjd+lClPjjt8kp0Qpp00bCg2y4Hx6jhZcd3IlIxcpSkzBs9psJ1oekCDR3jSvj9GM+94m04Ra
	qaJoIlE97Pz7JLyITEO+6FWt+d4R7mkoNOkvMkfznm6YZYauWZNpVkqh+GE2ZFFnvlCq+Dj2CpS
	pC+ilLac0eSzyMxH7u
X-Google-Smtp-Source: AGHT+IHEirr3Jun5greVbFzCCT3Fh3wTZA5ZwGfVN2ya/txpM9j9JLnmbgtXU2cagXUpIzPh9ex10A==
X-Received: by 2002:a17:907:3fa5:b0:b70:b45d:d9c2 with SMTP id a640c23a62f3a-b72c0d9ea7emr14466166b.9.1762456092426;
        Thu, 06 Nov 2025 11:08:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:09 +0100
Subject: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JUijnBRGu0gt5BmJL1AM+Ht/YwmL8eWcsQcfAW02eOY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIKQkvxWPYTlG0/11v2qnF+WGB4lyWocQIsb
 E+BCX699yWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCgAKCRDBN2bmhouD
 13ftD/0Sb2L3Qr4nwf5h7Cly6LwsxSlZoJjp/W9v0WGxNdDeNrrC98D1uHWpz8WejUoTpe8FhvD
 /TvAuRvEANS+J/AyAE1J0evzHcegvDXb3QfmrpU6rIDNmDvMJ1MFHJVoJI/oBoh3Uf7RTWJsuSE
 v6xr6ScHY74ZSWqNtd/LlAeGoPXSLptXE1kVtWdhrxCgJ2SLG8wix8wA+g+yJz2ieJq+n0DbkmA
 eyMuFIi/0hL+W2kOFEYsO6kaIbHZOKlCWwGKnIes+8VxOLq5MTJDwwjgBNutCffRlu5f2WDSkcY
 6aifYmVkyUO/xmUTHb6aVpoa+m8plHAADVnWf6x3xFsKrZY6kb4DJZXBRHm4nfsaLeRhO0bSNca
 6vyTRvy3Ccsafdfrt3/olOOgGzUUE0UvQUHeyDAUROoTBo1IgN+in6qEA/GVNMqirxajkfNyrru
 yk0S0U+rvDq/GJDbvDTKlTvsD3RmL9oAb8PJ7FqRQSfehpAQ2KBxRy9skz0z9keE48KRKWjgEoT
 6+/QF5WcZZgZmi80F7k/Pb0doeBjTMKJ8o0mqJXKJmZWN7aUfUL9DtGtG8+uE5ef/FjgLfzC41X
 dUDk/Ndr1cvlzd5G+twl5YJdjGEbL0Ub98gORPtqCbpk9Fvb+BTyoQGLhNcLC0NrbZ9lH56bFRX
 pFHmzOtqHLnAOdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with two new helpers: of_machine_get_match_data() and
of_machine_device_match().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index dc11b62399ad..a1d11ecd1ac8 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
 
 static int __init cpufreq_dt_platdev_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-	const void *data = NULL;
+	const void *data;
 
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(allowlist, np);
-	if (match) {
-		data = match->data;
+	data = of_machine_get_match_data(allowlist);
+	if (data)
 		goto create_pdev;
-	}
 
-	if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
+	if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
 		goto create_pdev;
 
 	return -ENODEV;

-- 
2.48.1

