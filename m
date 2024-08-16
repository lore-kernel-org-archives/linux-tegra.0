Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942D197554
	for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723805688; cv=none; b=n91YZA9xi9oFMs4lbZ0ur0Kb0m3dWJvVIR4pQ2JxdMI9g9dpOhq4Rapr52+HoL/QFr+iojUogXSX1SFe+XCBwr0hhkwNvH2OBlmhHimTj2Pc+qF6UK4wABBL85BaSgxF0R/eOPNYoh74MSIYkxE8v1juDbXdbIbdu855Ny4/Uhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723805688; c=relaxed/simple;
	bh=2UwlDFsvx0FENZTR3WL94gVz3cLqUmxrINSyGxA/NxI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J2MC5rxmBb5JL18KPFM7QmY8bf4odoWZ7n9omNmpoftJLca2RNan9swuOLi0cV2DZQkJXO/ssDmqY+YlcZlthJXMXN5b4UIsz3vSoDUOlrrxQXE8LRC/TiHmVOyikDIl1VL/YZ5R2vodRSdCwFfkNExD+6TAQSLYJQINEp9vmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJP8UUWA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XJP8UUWA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3718eaf4046so758228f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Aug 2024 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723805685; x=1724410485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tYPp0NsTOxhLjR9Ww3ZqtUjI7/iF6gTBv/X0BXKx08s=;
        b=XJP8UUWADXaoLUikqjPKxwzSixzW0SAsfSdjKvhHP2dfpEVEqR65+JuibPbvBEItMv
         MssnsJ0w0P8GHKScKffjLz1kNl4zzbvjd37e7AriViwjhI66r6f6L0Om3QE2wchajpT6
         i/ArypEYMFXl25aT8od47qaj174bm4x7DRdnT0lOGVoLFeVt4jGnkqcLELM8CcRBX+9g
         OwBuJILJl7/IAQk/gDBm5EKbb37Eajy/B1nkNKyGv9qugZWeo0fj2nB89wzN1UbEFN8E
         eKRerl0k8daXqtN+zj3TRyuMuFk5Y1GOYq36MUwbiL0bXIXWuJATWRpkd00DGGXpacwM
         OGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805685; x=1724410485;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYPp0NsTOxhLjR9Ww3ZqtUjI7/iF6gTBv/X0BXKx08s=;
        b=PFEprnUHU2iuO5O4/HZejFZsZBRv+JpcVb7JVbOd1V/ih3IIO8S6Z6aiyOfObEkF7V
         yqshWJz3jataF8toiSxH4yHOcV0uigchrZniF1P8RZURd34aUW61aHwmiPi+Q+oWu/AQ
         NlqEncw2laFpTOkl3n6ldZSyXvJfUUBBmHcMxgyQpptEcwbdgfRROBnInlvB8LFHzANp
         Fxh2HJUrKZwPQ7sRZNJIJH4B6ZJs5W1NK+A7sjB49Lonam+2ERrKNql9mAAiJHX5flMv
         VDOE6eYNAr3tlBe/bvbCl/eTXRhtIlVwXguf0V96TpYulI6IoglyjCl9yfNqVScAyn0w
         DkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoR3gIVfB7Y2kxiz8XTm054oQmBaeJga+uCz0Yuta6n6MsxBhAqVgozj1CBMQo7miBVo1/MnUyPUi1EfkdiqhqHs85e/our/5RhHc=
X-Gm-Message-State: AOJu0YyFWqVDiQFM6I6WNeya0VItT+uTaloHp5QpvNU3whfqqw+TeLpV
	wBBu7heIZUUGvdn2m2qTIaLC9O6glzTBtJc5GwafmkO9ovmCrqd4n5UX1Y+Hz54=
X-Google-Smtp-Source: AGHT+IHHvawl5XEfEGL+I6Vq39YTQapEbBWFGCGvUkRJ46B0XFDy0y8IVU67kRwXPNSR2rjsEPylrA==
X-Received: by 2002:a5d:5592:0:b0:368:4910:8f43 with SMTP id ffacd0b85a97d-3719431561emr1605829f8f.3.1723805684861;
        Fri, 16 Aug 2024 03:54:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945cesm19461935e9.40.2024.08.16.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 03:54:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/13] memory: simplify with scoped/cleanup.h for device
 nodes
Date: Fri, 16 Aug 2024 12:54:24 +0200
Message-Id: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAvv2YC/42NQQ6CMBBFr0Jm7Zi2SgVX3sOwqHQKk0BLWiAaw
 t2tnMDle/l5f4NEkSnBvdgg0sqJg8+gTgW0vfEdIdvMoIS6ikoqbAcyfpmwx+DQB0s4LTOONIb
 4QWu1JfmqVS1vkBNTJMfvI/9sMvec5rw73lb5s3+GV4kCS6FLU7mLllY9BvYmhnOIHTT7vn8Bt
 jdD6skAAAA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2UwlDFsvx0FENZTR3WL94gVz3cLqUmxrINSyGxA/NxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvy/kBBEqhpXjMi8XcGTKE6afT4vE1o4FulDg7
 ujMEz51mUOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8v5AAKCRDBN2bmhouD
 13OgD/9Lao5pfe/Gv4e/sGD9rnGL0Qq9TO3361aYYrL3qW/oHUal1cCVeioK8fpPY1cjlnPkrJP
 wPr86G2hVX9eXMeCqkVR/btO/AMLqD1UyoZm96Chr/n4wDstwJSYlpOiMBugsFQS9wjpQmyRtRG
 JhJCc5TZMVUbkDQIHdnf63dXnACBKmZbQ0vf05z37T4TUbS2fhVizHcfdVCPvmpi81KqfpZ+Brk
 0pjnfQP3/AwPwCJvAnCK+Ww8w7RhqwblPscpq4FkzILrIAsmQpkWQe9XaVbXfoIICXo2HqU6FvB
 8vgDjAhIfJGX2aSLx2V//vwwUr46mxv52jfT9/wp3WA8ROHttQXJpuMkJZ0cmvvwytm6omt/wAQ
 iqqMA4+fBetSJlZCmQo03dNlCFpOZzHNQ0io/S8I0ATFF7UsZfmquheffuxHVmrq2fzUHYU/U94
 i55XKETUwW84kNWHIlVWiRzSUuO1Ixve62gmEGn8R2TESeXG+/gsIzijXhl3+fyEMLm+Qlo9zlA
 xMxPsl/vBLEZD3TBbi87+gtmwS+zujDEuOKeQk3iKabX3qi0NZIVHNQaup7oRNiyp07B7VbkHxm
 8lJsfKFWWVvzZwV0f91GuFjn+dsdhK7eHcYDFUlVQDFL5dNhgRo51OKT4/HvzmBPYgvPb6ny3m4
 LUM1YTR6ADFfZAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Add tags
- Wrap lines before of_parse_phandle() (Jonathan)
- Few new patches (see individual changelogs)
- Link to v1: https://lore.kernel.org/r/20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org

Make code a bit simpler and smaller by using cleanup.h when handling
device nodes.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      memory: atmel-ebi: use scoped device node handling to simplify error paths
      memory: atmel-ebi: simplify with scoped for each OF child loop
      memory: samsung: exynos5422-dmc: simplify dmc->dev usage
      memory: samsung: exynos5422-dmc: use scoped device node handling to simplify error paths
      memory: stm32-fmc2-ebi: simplify with scoped for each OF child loop
      memory: stm32-fmc2-ebi: simplify with dev_err_probe()
      memory: tegra-mc: simplify with scoped for each OF child loop
      memory: tegra124-emc: simplify with scoped for each OF child loop
      memory: tegra20-emc: simplify with scoped for each OF child loop
      memory: tegra30-emc: simplify with scoped for each OF child loop
      memory: ti-aemif: simplify with dev_err_probe()
      memory: ti-aemif: simplify with devm_clk_get_enabled()
      memory: ti-aemif: simplify with scoped for each OF child loop

 drivers/memory/atmel-ebi.c              | 35 +++++--------
 drivers/memory/samsung/exynos5422-dmc.c | 90 +++++++++++++++------------------
 drivers/memory/stm32-fmc2-ebi.c         | 23 +++------
 drivers/memory/tegra/mc.c               | 11 ++--
 drivers/memory/tegra/tegra124-emc.c     |  7 +--
 drivers/memory/tegra/tegra20-emc.c      |  7 +--
 drivers/memory/tegra/tegra30-emc.c      |  7 +--
 drivers/memory/ti-aemif.c               | 48 +++++-------------
 8 files changed, 80 insertions(+), 148 deletions(-)
---
base-commit: cf4d89333014d387065aa296160aaec5cec04cc5
change-id: 20240812-cleanup-h-of-node-put-memory-dd6de1b92917

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

