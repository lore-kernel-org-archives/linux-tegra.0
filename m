Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6DB2F28F0
	for <linux-tegra@vger.kernel.org>; Fri, 21 Nov 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732176; cv=none; b=pRL+jmSZhKwGayye5Vw2Rs8SG4dfOexxC+nZaNq176c6KGQ7QmFoIdQyn6KIfvDbb5aYqnIShssdDlASn+6VW7bbemqCWzg/Ayt74wZQvNhZhUmBoJLW1uP5CmoJ5kysF0D9Uebjhe2mAl5HiSzYZjn1X3th7Wkmmh3qv6iB++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732176; c=relaxed/simple;
	bh=SNhnVPvZIHPLVZ/on1Eao7513kU/koRUzcXYbd29eE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7as3m65is3kqEgJpPjwYlo0gpTETg4mjaaQAxXFCgtGpI+3IGMPaHZs9nY+FbC68hSuMD5LIGoXHy8TS2HY/noHn27gWKNVTgrN4I9a9ChM6XZsaLhLqY/TvdDt00ja7ePVSbT1sAr+VbfKF+60IWwZHllLqx8y+uOKtYvwMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8xmGul7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8xmGul7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so14303435e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 21 Nov 2025 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732173; x=1764336973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2PesaBKduBABW9/nRvmlbqH9Oh7ml3xkQQS9Uo3etk=;
        b=K8xmGul7gA6zEUP9/ajlGjmDm3wHEiURk+sai2bOMZZgMSAgb8r+Sj5sBeGrfAsIDS
         cjtm6XvnSbkSg7yr2fGs1/EuW/IJDNAJNavci3aDCPbiZOGSN9E3uydW2i3cB9d4LZlm
         FHdmG0pmQCFN7lFdsLa3EdcXhsS7KQqZLcNVPdqwnjVRE+NKwxLotGTpNUiuYRuIfpA0
         2k1QSIuncVCFOVeBv2LFDZ268Q8i4wAdukm7rcQPyJfebQy4Plpb4W5X+xewwyeYTimJ
         1L68ZzOQ6z4IkP/LTK0mLobYryOhySFpZznrsX5vTX3/qgZVboa2YETVwM2ilIxMAIcy
         Pt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732173; x=1764336973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2PesaBKduBABW9/nRvmlbqH9Oh7ml3xkQQS9Uo3etk=;
        b=Tt6fEQ3pDVcrnv8OnFZVwMIpQ9tygTYn2MLcRuAsG8kNNvgGP6mwNZbUKIUagfLjoF
         N9nGHGVwUK226JFRPfRbAD3uNpQAdzFJtIVc5spy7/TgXjDJzmQR4lDyOPKcAk3gIYSV
         BjqOAMxHzOYGIvKy2B1xIcHqmZFJY2Y6r43Vd6dMvH81msRPWLIcc+GOqD3lPFrP2BN8
         sWmsxR3MbUWV3BophOa/l+nBsjlmJkPucFVMFhc/REQHryvG0r71ZYBsm0GDJ6JNxlMz
         r2PoiT+R4S36dLe/fiOrrAZiGJl9po7tOHFLQEQsxNLWjqLhEaMdcd1aRUdGHM2b6DpH
         WScg==
X-Forwarded-Encrypted: i=1; AJvYcCVu4al8DuwR4wa5H8P3WFI0ObMvhnrQEk8ZRF2m+VRmcB7Yr6bkXtt11eo/vTp93Prd4YHBizLgAYN8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcfncwL4sgwTIHuf82xyHawHirTHke9m30xarUSZxp6csMK4fv
	sN9yxjNmUlAib9rD3HucWqohvlPz6yBWHVDf7m5DyJi/pGDSCdNUnsUad0ez9o+WZS1yXV9Agx/
	Dnofe
X-Gm-Gg: ASbGncsfXB7jfmzaymbl/68ODnlf8YClBKo0pK5Pi13o95rrnCYIarXdD/o0X2SCGql
	+s42r3oflZ3OLt1ILlcSqRwKtR/DSkRPE/VDXPmCR900CL2lhFKMctE4+/25j8LPM8bFXA99T/V
	88FToBEnXydH7Wg5LscOcj55pSCgzvh0i1UShYujZ7IcX4wnCrx1hNJOikcQjHlExORUuOfATqe
	t+sH5l6eFyOIz93K8MrX/gfpWTdTPMSMJETbNtiiMWGQLTD84mP3FbB/ewJzMDn0gt89x1iGbiU
	1A9YjngHg6xnkFYzHOis1t6Aw/KCifIBUlXz0m6XZKm189atS/tqILidV3zS4gBKWa6V5Xzmrql
	SIq6RN+L6TvCHiTycmfKY+6RjsziJaL+ZyIwr8THXaulpku22/dmWiABbpn6hv19zcpxVv8toLi
	wAyHTlav7x6R4GajDuvmM/cxabv0c=
X-Google-Smtp-Source: AGHT+IHmKits0Ab8ZpUqVmd4qefREverhE79kiAHHxNwyMWrDSIyB6s607/u5/y6Z7cp7ArOd07/MA==
X-Received: by 2002:a05:600c:310f:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-477c1125568mr27673535e9.24.1763732172938;
        Fri, 21 Nov 2025 05:36:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9dfd643sm83520865e9.14.2025.11.21.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:36:12 -0800 (PST)
Date: Fri, 21 Nov 2025 16:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] memory: tegra210-emc: Fix error codes in
 tegra210_emc_opp_table_init()
Message-ID: <aSBqyISKPN5TWbGu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix several error paths where the error code was not set correctly.

Fixes: b33c93babead ("memory: tegra210: Support interconnect framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/tegra/tegra210-emc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 397448cb472d..c97ce799d53d 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1981,11 +1981,13 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 
 	max_opps = dev_pm_opp_get_opp_count(emc->dev);
 	if (max_opps <= 0) {
+		err = max_opps ?: -EINVAL;
 		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");
 		goto remove_table;
 	}
 
 	if (emc->num_timings != max_opps) {
+		err = -EINVAL;
 		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
 		goto remove_table;
 	}
@@ -1994,6 +1996,7 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 		rate = emc->timings[i].rate * 1000;
 		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
 		if (IS_ERR(opp)) {
+			err = PTR_ERR(opp);
 			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
 			goto remove_table;
 		}
-- 
2.51.0

