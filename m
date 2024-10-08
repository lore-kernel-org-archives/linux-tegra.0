Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29441C1736
	for <linux-tegra@vger.kernel.org>; Tue,  8 Oct 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378021; cv=none; b=VSs9m66rdXLrQPphNKiqZo9ht6XFqj++Gpi4dg4TVWHSoMHntlnPwg3xAj07ranmxeZ/QBBrDTPDnp0B+0AVj6YkgUXPRTWr2XBwxPDCPcXHuyFWM+ELCVwQMIBqPYbbP+RFerkmi3YpgFsZCXlQXkMX5eptEy32CZLBLSbe1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378021; c=relaxed/simple;
	bh=dOaAo7NARlHfBILXFifIyTQJ6/ayWSqio+ubJS4mi6g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FRdGORD6vUVH5rcx16YROyQIObHYDlqevv2LxBun/zYFV3TaCebbFk8HEw8GbAB79Ar0sb7Fk7HneAgtkhIW1ZvfFgnjaZoTjV57pNdexZyRNqtn6TxRnw8f+16zSi1PR9cljpdhRIIgEIuNiQW0qWwSI41G/WHnb0P8gvunYSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzjUrhdU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzjUrhdU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a995d7b37ddso16460866b.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Oct 2024 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378018; x=1728982818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXPa4fFlrpkPdHCBu+fsHa7xsZh6Iyys6CsrsjuF75w=;
        b=WzjUrhdU69QA4v475hGwua10V58niEJIiChLodaAR2cYowRkF2JyoXZdamVfVCoYej
         TlovS3jSpCPhQEo+c2dqeu5PUwQ4RG0KIMHPbW+TFZUPvrI9hCMBxw3I/0Ggkmd9EQfF
         iJn6WiOUkUQi/fri53XEeRBGYkiiuVVEABNjEnD8L4Z48wcxyMM9Xs88XXsO9SaQY2SE
         HYZCunxW6I/Sg3bLCABlhJkE50EpdsL1J5XcbO/J2Ygmdqlj6vkXVT0wk4CPF+HI9ItA
         z0kAu/OMdjDoOBs5FsOHT5DExBHYobsBX7dTdz7Y+a3g6n9D3Fd1Nx/Xm8g2aYOVzJ/7
         c2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378018; x=1728982818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXPa4fFlrpkPdHCBu+fsHa7xsZh6Iyys6CsrsjuF75w=;
        b=N++Z+Y9OKm6my8dogZYlpr7N075F6xaaXCAAiIsDgKPr/ZSrok+IFJuIau0Om6Skh2
         4fdR5r8iuC/5K9kYSSO057gl756AvYzsRZqrciXEA/waHbpMjJ4QhnAOli2aaL4iGfLu
         ylXvAy5QlaP0a2zxzsXSHPI93TVrkeBFntuFj3EsZ5x3rJrlNDpU6KT+XLpQxZa+HLdg
         rq05AWKlbkIFEx0kSFzdBeyL8Ia2LgUAxJauDqX5PTyVWF44doArXvAjbfTwebk+nJs2
         JV1LWv9iQ8FUFh2LHZL3DCbTcNZpOvG0aPf+ZFmNlxXA5VAFqv4wdbNxD1GUAoY9F4i9
         ktMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwRELBR/4k6xysMelSNqCoEAyvRp0Os14PzN+aD2vRo+QBqheySE14xUkveEKpMPtFN98n0Sv2Fd8L4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzF1rdYH20edxqBdZ+Mx5PVvNJfIpulZS/H7d2vdYzHBncy1MY
	inaDFljPPuovNlL3IazlM5ItTYDb2PHChDz6SX6/PIVvtkiLhtZLoUMUYm15Vgw=
X-Google-Smtp-Source: AGHT+IEq6O3RO4uEDoXe09VkiTBtsNLE0dDuH6C5d6cgLS0mDm3/gMWkLxOZY1XH6RAF/fAV0B+Iew==
X-Received: by 2002:a17:907:7b8d:b0:a99:5cd4:67f with SMTP id a640c23a62f3a-a995cd4554bmr185284066b.3.1728378018194;
        Tue, 08 Oct 2024 02:00:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/6] thermal: scope/cleanup.h improvements
Date: Tue, 08 Oct 2024 11:00:00 +0200
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJD0BGcC/5XNsQ7CIBSF4VcxzF4DlEDr5HsYB6SXlqRCAy3RN
 H13aSfddPzP8J2FJIwOEzkfFhIxu+SCL1EdD8T02ncIri1NOOWC1kzAXYAZUPt5hB6CBR9ahHG
 eYOoxPvQAnMtaCGqMtIoUZoxo3XO/uN5K9y5NIb72x8y29Q88M6CgNKtqhkxyhZfBeR3DKcSOb
 Hrmn6L8QeRFNIiNNaKhQtVf4rqub5vtQHIjAQAA
X-Change-ID: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dOaAo7NARlHfBILXFifIyTQJ6/ayWSqio+ubJS4mi6g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSX/J8HUTPruAZlvbvad0CCX4evRlZ4uxfRH
 Ef97A3Jq2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0lwAKCRDBN2bmhouD
 1/PZD/9w03iNlw5sbATN88IYXSHnnTDi7OSN9Luom0fCP4yBDI6hs1udVwvVxL2F4BZmpYf/u3f
 wgbM/XXPY/+KAsF+zr5gCEJr42/uuELCMW1dBhyRKWzxnniEnTsnR1QoBN2Ch12UkKj3qvHuI39
 mUl7ViJFTMQyFZicJQYZwJNuDw8TCoyOuJD4aLJ3BH6PeSEcNmZAavYAuZMlu9XEHBlxc/DG3wg
 uCaPPhIhcPihqw/71CcF/zjGAz4Aw7q13otMHmeJVjA82CmJS5QzYuYgtBwCeidJ17dChiCp5jl
 Nf8y6HUHs+WPKvtQEt5nvxsqVPC2TDqagdrsjDlw0eqa6EeTQEVtwEH/0htQ9FV+xIvljT1Vw2X
 Gp2EApkWATLZeF42IfmQvU/F763XtuKNkhb/Id1VqAL9DtAD1R4olp/wyntz1wV+5lVCY3M1Iqx
 CCegUa14EQNt+cNikea9jSfnw/iiNnq/Z/orxm2/s4BgMGhhJXRcPPxKSGF/WPZqXOZ5FIbWmjJ
 p4rymvJK+8TJugViklUDUnYU24yzTKPst9pBJlnYZ9NQIMTeNBvU3iIsTIpfH3yoMm1eSIxcoMC
 hMu8TrZD6I1jVgZ2aOdU7k6Z4hDEY/j2TShMIrFo+e7/dscOVDM9ToKBaTfOLmGtc4OKZhN7mYC
 /Y2AT5LpvVp2zTw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v3:
- Rebase, because there was bigger rework in thermal code.
  This made two patches obsolete, but brought new one:
  1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each OF child

- Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org

Changes in v2:
- Drop left-over of_node_put in regular exit path (Chen-Yu)
- Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org

Few code simplifications with scope/cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      thermal: of: Simplify thermal_of_should_bind with scoped for each OF child
      thermal: of: Use scoped device node handling to simplify thermal_of_trips_init()
      thermal: of: Use scoped device node handling to simplify of_thermal_zone_find()
      thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child loop
      thermal: tegra: Simplify with scoped for each OF child loop
      thermal: sun8i: Use scoped device node handling to simplify error paths

 drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++----
 drivers/thermal/sun8i_thermal.c          | 11 ++++-----
 drivers/thermal/tegra/soctherm.c         |  5 ++--
 drivers/thermal/thermal_of.c             | 39 ++++++++++----------------------
 4 files changed, 21 insertions(+), 41 deletions(-)
---
base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

