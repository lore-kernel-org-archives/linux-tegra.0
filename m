Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2231B830
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072392; cv=none; b=hUOOxMuvUc4gjc7B1SvhOjvV49g2WSsth+5bIZ8C1owL6Rb5Wv4H2xMzuvS+c264Qr32bRiGVNbG46CkQtr5Hd5PpA0zfeZ5u0YtdY6QOmXyTjmcZmz5SgVe+yICQ91qMNohkHg2i7oeDtMAJrvqD07biUHLjmNPqrI23TNLepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072392; c=relaxed/simple;
	bh=0XVqOHYcT7n720wnH1cgjwBE24hrHgCE0m9zaQ1pJGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O15ZmKe3SAwlRgCBb3a0Gr/gv6dqydaPIk4RLFoCFGKGr4cjpq4FOi4aFP+VJLBkSGrKf0plSYOzZr15JiaTZjvz7JxXsIiQV7E/5Tifb9J2AmyDTO9dZNs6oWSzLq1CzMlesLqMaD5iXcR+LiwQcsJjDUp7w7zJVkqd1DsqgQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InJSXmoC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InJSXmoC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso6477975e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072389; x=1764677189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5WNlBYT2Uj6LLmyZJ3IXERmQU06xOhrcyW5MYrfiFA=;
        b=InJSXmoCeiiQx4ai9bvt8iF885jElanQAoPbfwo+ftnh2+zsww+e9BgzuP2URAzBHx
         d1Fw1gMjmbBhYQhwy+yi8zOa5LtFkE4top+9tI1f+fVv3QFD3iHlUsG/6MCU534fdOgb
         d03nW38y7WmuX+CM6ximquQ/u9e4Fsg6YglH8jaxOna1Dxhm8YTrJuxY25yedKcWuwSL
         5YAL/ZdCGEeU+YO3ED058LHe1DMT2hbDYma4lJBxwY7XslVwkOrfnWseNTn28yoc+DV+
         ajQ65m5bi9ZCxlc6/GmKY1Sw4CWoYUV0V9ZOdUl3If0s60ZwMEPON09OuWThRmXUF5Zx
         9epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072389; x=1764677189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q5WNlBYT2Uj6LLmyZJ3IXERmQU06xOhrcyW5MYrfiFA=;
        b=IldtCJcV4A2auRHQtfeoJpwJACPi8aFdiN0JBjWXbOnMVF8eBnJwIa3oTNes69F4a6
         EJETHdULfOuBJKYg/xst43cQNPMrS4GKagjsscgp8frM1N7JYVPXOpfQeGVGzBjIvWr8
         3vI1ExljaHRFeeg3HG28c47UIxTbsOwG4F53zpnG5GmKkjP4Tdw5mmzERQmau9etp4ur
         /g4Hs/fQdgkRAy4fxyJsQK1CtRMUqiV+z3U3moovkDzLWdjDJLVnwjGTnuOe446Eonz2
         xiOB3szxyOJZQZ3dRTjF0JPScql8HZBKLsBGj5mJZMg1BZqlY5k7N6TOwbE6KFCINFSn
         MhHg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ99h1S70p9KKMLwmFlrYEwZ1/kNC/95Z64292vQEVRUAJHsbGmG9MySNvmautljN+mfyYPRx2a5WmHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPoE+6UoGq1F/mTWmcpOE7mZiWXgMd41uE+UjmYv+mLbC8wkG
	h0/pxOsyJtO95lDQwg8ll6BDFxYNDXbeBtojw4MgH/nx2vVV8taGHbEQ
X-Gm-Gg: ASbGncs3KoZRiEncml/c/qd+NAo+d3goVJaz9rOreo0Eqe+WQF8/znep0XcdOI50UFe
	bIuP01GF+O1eDb4IVylGO8gHzejcy/Bb/2joIS0U1KeJHnj/ywSUHcCr+L1CkZKf4ASNo2uc0Fk
	h2+m5FPpqyRxWTH8ND9wUeGXsnoIo7FdsOM/wSpVAGRlqJHs/8NDuhBtyNUBqSdPdZeu2t+qZKk
	MffKuWAq7FjUkxgjap/2pe3ol6apQsTyzSMP8J2tjqaDZ5TAp1nLBXtl4KWxlzafsofyDyID9dN
	3zLgjZvy54dNGdUokGnoaDIpcAaZlmEOCmsCpWbA5RD90ywhhQrRjI9ieqGaOMKNLkoL6/Kf2bD
	hZJSW1/xQ+1hd+MX+C38pgxG7eyrfwjphVffLXVVYB4Wva3ypl+chRFceqUpmAmsl0PECarL0fk
	xtY3y6E0zhcg==
X-Google-Smtp-Source: AGHT+IHsvV73iCsg1Nwxo/fBsVh2b9bPW7NvyGDXndOdwYhh1h8BJuTE0RXG2eDeb0/M5MiGhzgcdQ==
X-Received: by 2002:a05:6512:3c98:b0:595:7c47:cd47 with SMTP id 2adb3069b0e04-596a3e983camr5380015e87.2.1764072388565;
        Tue, 25 Nov 2025 04:06:28 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 08/12] soc: tegra: common: add Tegra114 support to devm_tegra_core_dev_init_opp_table
Date: Tue, 25 Nov 2025 14:05:55 +0200
Message-ID: <20251125120559.158860-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Determine the Tegra114 hardware version using the SoC Speedo ID bit macro,
mirroring the approach already used for Tegra30 and Tegra124.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/soc/tegra/common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 6292a1c72071..2264dd38893a 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -143,7 +143,8 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 		hw_version = BIT(tegra_sku_info.soc_process_id);
 		config.supported_hw = &hw_version;
 		config.supported_hw_count = 1;
-	} else if (of_machine_is_compatible("nvidia,tegra30")) {
+	} else if (of_machine_is_compatible("nvidia,tegra30") ||
+		   of_machine_is_compatible("nvidia,tegra114")) {
 		hw_version = BIT(tegra_sku_info.soc_speedo_id);
 		config.supported_hw = &hw_version;
 		config.supported_hw_count = 1;
@@ -156,7 +157,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	}
 
 	/*
-	 * Tegra114+ doesn't support OPP yet, return early for non tegra20/30
+	 * Tegra124+ doesn't support OPP yet, return early for pre-Tegra124
 	 * case.
 	 */
 	if (!config.supported_hw)
-- 
2.51.0

