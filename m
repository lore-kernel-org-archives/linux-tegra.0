Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122517B43F
	for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469662; cv=none; b=PdoOkIf3bhmbIePeZeOOvfLK7QYGPxJqDP2cbj2dLg2yY1pCwyjm7/1dG17ueZ2cGJ3n18gvoU7Tq5Il2g0ak18lDgFCyDBHLM/h2AqcyfeVIAYeVe0qOv0rhmjsLUHxIZjJ4bmf4gBcBx1C6Lv+Iz8fPK1z0KAcywDsEz4i5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469662; c=relaxed/simple;
	bh=H8kaYJ2UVmG5D5geD0TuiFhX+chgtcGynCXf+srDSxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kX+sInMKu/03p2ij5U51/HOs3w88coMun9ATT54DUV/khcT0N4LJ859tUocc6HBT4hyQ1z6oA+0Xa0qE9134pVr73thVDzgA+oIeAFVl7LeVa+CLkxrBT6nUd22HJ3GFQ8CuLh5kH4hR83QL3gWsq6wxoxmUUvAHlmEjdNfvU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/RlCLib; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/RlCLib"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428141be2ddso32744585e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469659; x=1724074459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ9EsAfNWCNGsBTp/zuUJbg/d9ugsX/M8WUijMQTUKU=;
        b=B/RlCLiboOa05eYGpMv10D6TmWYyR22SBQSOC2IWMGDOZ2rCPRfYfiFTHKXDhRTa4A
         wK8ImB5PkIS9QPCP9GMM1iJRJH/TQs8GgqDpXsvqphLZLO8URFhMgmEfE+Y3dLEQMDTY
         hRxIVugkoOrsn+j0WRUq6ImeC8o70+akTRZUkV8//JcIu0ry8xR1RHcqe7fXoZfWTwRG
         FR0AsICtzAKe8/Fo/EBGc6yX1plOG06/Woou+Q2G3GsIyjICy9uHnMWRgNl3ojyjpR1D
         xmJm0GV+dujkuMKiH5Q07A6hpNPQnoEqPC+VCUr7VOx3CR3J34lAuPYgxQR8m5L3Rouy
         MThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469659; x=1724074459;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQ9EsAfNWCNGsBTp/zuUJbg/d9ugsX/M8WUijMQTUKU=;
        b=O7nXM6u/w+b0ODG0sxB4+5wma2PCSDTJZGIpGS+ORWsReicMooXes8PIfXo7HGYoa4
         habJzThXBMXgzASSqtVQOm7NcNHRdo/Us12u8WZTuhTZ8hzbIIIhhZ9jP3Mcue3f/A7G
         ENOd61GvsdJtqYN/Vz47FZ1saS/BcRTuZoOGRKZ2nKTUGyIGLJSYTTd1qX2GlzUAS1+E
         sd5rawityfcUrkMXMaBsLQyFnPdnc99dwNH8ib6XRoJ4s6+VhUwtoWghlTBLCD6aoCa2
         lVpkgeYtNS0Ijq8SWSopy0YdRq2B8mKuxBx0oCdcnQtkpVDA4XtDXaBBDswpwtB42rFb
         gGTw==
X-Forwarded-Encrypted: i=1; AJvYcCUIeixR3SZH7NWX1aN6Hx/inafPodMM9CL79326MPoef5aBTJNaUyUhV2xazEW/m94OGliNYK29xvCN/nWYmQArIpAUX9DDQtrKQ3Y=
X-Gm-Message-State: AOJu0YwTaWmLFGymg9l1Wx7SSEPn2n4ducDKgXRCyQzFacx55ci6P9o/
	JoxCnjOnGqLAwP1qinFD3IzFPA52dOWdg/L1+oojZMTQJm8pbzFaoEJGftulJAE=
X-Google-Smtp-Source: AGHT+IE1KeUxZr45wg8GO4bkox3rQPd8HA1lfti7444qmFnozdlwHtMIevcYiwqGJFzIO6QVhDVBxg==
X-Received: by 2002:a05:600c:4584:b0:426:6379:3b4f with SMTP id 5b1f17b1804b1-429d4893818mr3637485e9.31.1723469659100;
        Mon, 12 Aug 2024 06:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/9] memory: simplify with scoped/cleanup.h for device
 nodes
Date: Mon, 12 Aug 2024 15:33:54 +0200
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIPumYC/x3MQQqDMBAF0KvIrDtggtjqVaQLdb51oCYh0VIR7
 25w+TbvoISoSNQWB0X8NKl3GeZR0Dj37gNWySZb2qp8GcvjF73bAs/sJ3ZewGFbecHi484itcA
 MjW3Mk3IRIib93333Ps8Lb52N/24AAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H8kaYJ2UVmG5D5geD0TuiFhX+chgtcGynCXf+srDSxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9Og7Sl9/SIc/9Vq1Ixg2W4m32wK6q+8y6zQ
 qEYeFt7MrWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPTgAKCRDBN2bmhouD
 102+D/9BLrZ01YnrGcAHBZt6bd8l0wpghqUDKqb9lER9jW5q0eqdTUBYaEZqhXWLrhZz04wW8V5
 2PvdATezI856kVuXZ1VeKecXXA08oXa/3aDd74af9fkb29HcPi9nI8siB8e3pvF3JmpJ6CEsvdW
 HYxvlI6TDyB+SbKbBwCHcNa4y5nRFoOGL95+dqqyLOA7c+G4GfT3UOjHLgHLWVJn/AV58Al3ich
 Mskup0lPkDu8E+E9knsiT79x9k3yInyo3RdLYJUvcogoSo0kUTvc/EgkcE3ZlfZ2MngHqI/xS4m
 N+4HpTRy6fTKNzfFC4ZfjfMxDG1/0cEUoHQbkg9FTRhQ9gfnoASVNByBYrK/x9IL7t0ephvaZzX
 xNec+GhbAUCJrt5QJ+nhnbUm2vvy7Cpp25r1rQdHd79LOz26GrAt+BuAyn7tWl/nYeXhE4B0/g1
 cu0KLmKDs5LnZZEeNOn9kCMMAiFXcg/Qto8KT/LgVMJfFHsYp5qwHOdsVs3YPEPsLLKg2JUj4iB
 KLxYPUjJ2YYp7kNh47gDwIi0ffiHZlW+tv74fd6NdwJgC9J2W20sQZlwbqAM+Sno19sJ/N8jHsJ
 NS67XppXifcWhqGsVg7elPMvkGNQ85Pc4GM1kI0Kv47VZ+0RfbiFlrd4R0lRHelSBcTp1CHLZ6k
 3tWtClDb4DnY3oA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make code a bit simpler and smaller by using cleanup.h when handling
device nodes.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (9):
      memory: atmel-ebi: use scoped device node handling to simplify error paths
      memory: atmel-ebi: simplify with scoped for each OF child loop
      memory: samsung: exynos5422-dmc: use scoped device node handling to simplify error paths
      memory: stm32-fmc2-ebi: simplify with scoped for each OF child loop
      memory: tegra-mc: simplify with scoped for each OF child loop
      memory: tegra124-emc: simplify with scoped for each OF child loop
      memory: tegra20-emc: simplify with scoped for each OF child loop
      memory: tegra30-emc: simplify with scoped for each OF child loop
      memory: ti-aemif: simplify with scoped for each OF child loop

 drivers/memory/atmel-ebi.c              | 35 +++++++++++----------------------
 drivers/memory/samsung/exynos5422-dmc.c | 31 +++++++++++------------------
 drivers/memory/stm32-fmc2-ebi.c         |  8 +-------
 drivers/memory/tegra/mc.c               | 11 +++--------
 drivers/memory/tegra/tegra124-emc.c     |  7 ++-----
 drivers/memory/tegra/tegra20-emc.c      |  7 ++-----
 drivers/memory/tegra/tegra30-emc.c      |  7 ++-----
 drivers/memory/ti-aemif.c               | 13 ++++--------
 8 files changed, 37 insertions(+), 82 deletions(-)
---
base-commit: cf4d89333014d387065aa296160aaec5cec04cc5
change-id: 20240812-cleanup-h-of-node-put-memory-dd6de1b92917

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

