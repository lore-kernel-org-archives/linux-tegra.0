Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A12EA746
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583810; cv=none; b=HSD/5zDILDQXIXcUVKjZ6YqfNXQ+O4VYaauwxMK6CRT14T2BHTJLSRx+zPNhqeOOJDQZfXcM0pTuhgmkITY4rKRvGdFJdHTccHTRqt4DJrr7AFViY9x3/C1tJIQt1/TzhUCMf8eo61BMGpNM21lcb5Ocp/UMUN9Ey1wchT5nvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583810; c=relaxed/simple;
	bh=6Nfelk8we/spFGCx+ei3U6dWXt/N9VWtBSSo7INtAMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FlWXhWibZyeVc8dx5C7bkdm4WomlqnknSfN3snWr0QiW9XECZU5WYzEVGJSea4tfB971NdtHE134e4IvMsCzsIIWD9M0K9D6azwva9w1hYYFobhRPVgya3SgVolBtBEMLfBkNjMx4IWTtDIIphTLhjZr16T5U9+WDBxnOmPtZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QO2OuRB/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QO2OuRB/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de5246dc4so764185e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583807; x=1758188607; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OqM2iNax8fMYe2BD1zgNFkTtPj0x8TH/vXpn14pXm4E=;
        b=QO2OuRB/Oiy4RBI30pErMKCf9+NCLssOIzM1WY6ArgLpd5Qgyu3t7M0/VjdBWmxbbM
         F4nCJ2ynO2DYmPEmC15uYnDIwEhLPdDqoiEHn4kb7DfgF+/S49s2vmapD9jcZWTILpkQ
         xzkp1WLdUWgp2kyplbC7ucewSTJv5IgiPlGt6E2xRw4ST5OmEweVFznx0Acxjn+VKWLT
         cRt2Se78Wl1f3F0zCPdOIFZ5X7d/UnQjsLxcAQm2kUxyHuZmOna63DLYqtl5OGf6d3do
         OplxHG/AXtsyvqQAELZZE8uwqXH6m+XNJ0H5vtpaYkwX1j2PcgRIG+702Gq6w9L16t0a
         0SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583807; x=1758188607;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqM2iNax8fMYe2BD1zgNFkTtPj0x8TH/vXpn14pXm4E=;
        b=Pddrc0H4FXT/XF0LlS9TIUrdgLdERSFwpVGNoHbgykIaMkwec0yS2ez0E/ZMQtXc+X
         iF91KS0nGmU/GxTHWN9HPq3xqygd7bu4ImLN5e01bPc6tqgz7UPPJBc59eiLvMMoN90g
         1Gkk5gxJBjGfV7SV483GtSMSMTsmM9A6Tu5TF8X8wxBzROra/t5tcgWCzopXIMfJ6/sU
         jWHLtX0ASQJNXKNswFbrcGQPLa5a2CZoVFVs8cxbqN+VTZ/OWVsbuBdU0tvrtC/BdF/l
         /l3Ie4aACNa1xiIq5cSkQJ8+PYkUNo+qU4jSPbVVrdaUAOsfwHM/vDlqsR/OBtR9x3j4
         YV0A==
X-Forwarded-Encrypted: i=1; AJvYcCWt1JBMcZIvDFPQz7Z8KO5ClQvoPVT6ZN4lhmoS15LfVkb6qNgwhMBybwsRjwTseGWAZOwna3S94igWnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvffd7iOPW/k+Sj1qfhXOyWMRKvmrekPnJH65ZvgJEzW8utqY
	op50uwJ0dYJ3un8tHlbiouJ29fnbJIj/4W2QAsdQ83lV47AUL6Bpw7QXXdII4zeqMFiVdStpeKL
	TTdAs
X-Gm-Gg: ASbGncvIcXEDe2jqDRrVcZclbClEmNPLx1QLXq9/22VN4uJMcMNtlm5G+O1FgqqxYtU
	PIlp3imONP4tvGWPkYXdc42vEr8ejWWYX0kSeclwCBQ7Y/UDd8nRg8H+iNNo2dSEA5qy/wW46du
	P21I0P1JDMSDS5bf2BUmh9RWWgxk42FooYTFlWO9xCo52RjDjht2uKU4fup+TOZhx+Y1wjDz+lY
	92vNcwPznEMjFqRM4nzo8r0aYlfnhXqnos+MtwxGiKrpQllIBweK/KP61EX6AAFelEwHpJe9EZr
	pgzhN7HW2MhKmHDzZ4sQnLzmhgK93LU/zQm/ql5EghRskRmzZFK+Jj5ngm7P9/hqi7NCNk6ui59
	oRziKqOCgLEdZDIE4vO+60Sh7vOr/7CYFjpMaMb8=
X-Google-Smtp-Source: AGHT+IEAtJiyzz5QVT0sl9vtM01SgxMOGZzNQYGtAf4uefNisaafRdN2E6N87GDF+AbsTplVywIudQ==
X-Received: by 2002:a05:6000:2003:b0:3e5:1d05:156c with SMTP id ffacd0b85a97d-3e6437411ccmr7855190f8f.7.1757583806868;
        Thu, 11 Sep 2025 02:43:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/13] memory: tegra: Several cleanups
Date: Thu, 11 Sep 2025 11:43:11 +0200
Message-Id: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+ZwmgC/4WNTQ6CMBBGr0Jm7Zj+BBVX3sOwGGCASaAlLRIN6
 d2tXMDl+5L3vh0iB+EI92KHwJtE8S6DORXQjuQGRukyg1GmVJVWOPPswwdXHgJhOzG514K6IdW
 V/e3SkIWsLoF7eR/ZZ515lLhm63jZ9G/9E9w0KlTGttaS6arq+pjEUfBnHwaoU0pfqjFT1rkAA
 AA=
X-Change-ID: 20250910-memory-tegra-cleanup-1ba0d5f86ba3
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6Nfelk8we/spFGCx+ei3U6dWXt/N9VWtBSSo7INtAMY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpmx3ggHHe1j1ynzFcZU1//FBv1mIiIfWyO1I
 qMuFRkcqQiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZsQAKCRDBN2bmhouD
 1wbzD/wNjicMsmL82x1sol8b5e2DHGx1az0fVc6Gn3E7/+RQRtOjmjcOn4/4zrGLsIient2M+nn
 6VlfeKfA4lHTQ3ouAyUsO8bpjK/3hcw9mGhz1BnYVlVdgRXSFRZ+zruqjo8NEzMVA+FGLHhOv/+
 6zs2GVAOVJosyfPo4yQKVZS/RU5N/qSZcOY/dlrxXGRs2olxn9I7WtFby2MesSZToibbb6Hz77b
 FbKpiudCDZSDFOpJO/Yqon49k8jfMd8xYkPZLFd577Yf9za+Bq1hM5r7wzkFrczjn8TO+9b0Q00
 K00Qa0fp+/KRVXo+fkjggL82QY8H2PbeRjI07JnfGVoFwv+4nKesblZuulXG1IDTPRYOB2+54et
 lwMg7vCBgfkv2k3NgsiCHgQVBpLPbWzSAz2TguWOJkgleZB1L07e1h/54rMYsS3xW4VyI7rIE4t
 NnHfNnbVD0SJ2WuGDWQ0OxG7vVghF/qLuWfOQsAXlmx8l7uaIcnaUWFulUsvUAhna5uT85OdZjK
 oT32eSig5jk/2a9yqSNHgDGlbPtcUj8oWyfnH9+bwEGVimm8x9DV1YeKYfm44EttfcrDMTUYR1F
 hYueavQnAFA/5RDjJp7riYUvWqeilyxQbxey/dd9RRhSCJFNyPu06ETLaiKp+1oZf7N+ZXE7wxW
 sLHXOg62UGw35yw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Fix commit msg copy-paste in the last commits - proper number for
  "tegraXXX_emc".
- Link to v1: https://lore.kernel.org/r/20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org

Few cleanups for Tegra MC/EMC drivers:
Deferred probe, few simplifyings and function name unification.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      memory: tegra124-emc: Simplify return of emc_init()
      memory: tegra124-emc: Do not print error on icc_node_create() failure
      memory: tegra186-emc: Do not print error on icc_node_create() failure
      memory: tegra20-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Do not print error on icc_node_create() failure
      memory: tegra30-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra20-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Simplify and handle deferred probe with dev_err_probe()
      memory: tegra124-emc: Add the SoC model prefix to functions
      memory: tegra186-emc: Add the SoC model prefix to functions
      memory: tegra20-emc: Add the SoC model prefix to functions
      memory: tegra30-emc: Add the SoC model prefix to functions

 drivers/memory/tegra/tegra124-emc.c | 140 +++++++++++++++------------------
 drivers/memory/tegra/tegra186-emc.c |  39 ++++------
 drivers/memory/tegra/tegra20-emc.c  | 150 +++++++++++++++++-------------------
 drivers/memory/tegra/tegra30-emc.c  | 119 +++++++++++++---------------
 4 files changed, 207 insertions(+), 241 deletions(-)
---
base-commit: 8b8040499c8ab3076edc9115c9de2b248f266279
change-id: 20250910-memory-tegra-cleanup-1ba0d5f86ba3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

