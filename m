Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9B1DEFE7
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567060; cv=none; b=aOLhTE1exzU0bboSVjWBAEo6jxrVAJ6J2D4FzVkN+Ne3X7Dbea1AJkAWi2XuSTWvhJWKwGmQmNEu9EyHOBwqWEdV0eyFUzVUSZyg7xmL4Jgi4n9dv90hVmFgMzoSK3OXznr0aG92+AgfesYfmZdQ5UEK0FsSsB3eSo0RN6xywxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567060; c=relaxed/simple;
	bh=6BCfp0zPANDJPDOd/HKnwKlAyokufVrNNgQx7Dq+064=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+d2tXvtjLeL4wqN7dKCrr6otGQoIMKecJEwZXDNzMFhPU5a0QWxYpeN/N3q7NX4tMLIcP2zazeE5HCaxaW4vo6wt4P0m1RO7qLk6/ve4E6TTypMt89yrOwGd/RmKkIUo4mZDDrum9sTkYtrgPUAimAFshWcU72fESfeuhqs3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQ3Zy+G+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQ3Zy+G+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so10873665e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567057; x=1769171857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oapfEXyvjd1ZotchAdhD2BtN/ho5Ruxlai3C43e6Q1A=;
        b=LQ3Zy+G+M0Y2+JS6A5xJABLfPP+yGsVBMU4y4WhiHo1svVxEc6FsBOO0CVJJchtq8W
         yIgR5oTVjG0VPFgpweSCUFeacWbOQLbAGmGg5akw3zYy/JFAIq6a67T2R3B3MmgKombZ
         WYyNQw13eitVeO8kenKPzMP2SDBAJ8UnQnEQX3ZYpLPZu2w6gsA+fwSA9mP7IBcBiCTA
         xbypckM5cf0+fQADC3OkfQ0/XtFvwVsPAUvN7tThzo9rsuKrbDX9uGsTMAMViSc3TJdy
         MgF8r3LAvK7VoNi6zA3sO+sv6J4LXIlT/yzhTYEjp9s6YXJ5x35YxXKoClnhEPeRbV0/
         S99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567057; x=1769171857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oapfEXyvjd1ZotchAdhD2BtN/ho5Ruxlai3C43e6Q1A=;
        b=dxyNaweMwKD7zl8fHE0YYZ5RaplFqNIHQKvzrcGawNNs5cZh2h2lQxuPhfZbMlSqXl
         pRL0/93UKHooZSmcw2fO5zJLSSoJvNQzuu4IeXaEfjP6ze8Lw7v33eI2wWu7EBJxbDLk
         SpP8eIVDxDaDxdN4Pp+tynlN2akOz2Rnb98818kvZ7bZEZIwkuyMGzN7WX2sXVfyQJ0w
         Iqlgvi6U/vmjl6XEYmYZQgJUIT0Eyv0wyTMiGjg1kJPkmTjdRUnLRuz7zeYog0WJq70m
         4hkIWc/D76iheM9Q2FWrQEvs4u00oPwTnq6NCj+GhOvT2u1qGQLeliww+Q9HND3rfhA3
         iVeg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Aoc7TDv866spsPKrQYTpBp5D97vJuv+HanXPtYEecx4eB/JTk0wB7fPe3QhkndjBVgoJMHqaTopxww==@vger.kernel.org
X-Gm-Message-State: AOJu0YydG2E27NczsE5MvutquLYsYU4USD24Istipr2ZbtFFQ8kd5Esa
	QPUpfGMq+m3w7M2OnoUF6MqElfXcJPsLEuAX2Y17/1Mvwt5iVdiLSzZi
X-Gm-Gg: AY/fxX5awPNfbGOn8dS1Ll8Ynb5NDrwQfnd6Dhh6uA4zBeygl112+ngR4gRq2j6MBCQ
	PrJ1FYTKmfdHFwyPY+TauSb+DLNobtWVPkOx63fyYEZ4luMMSq9FvtB+ZfcamuextCUXHeQ7eS1
	8oV+/DOvxGGNt6Mi6+n5P4VPkSa/Ix64ngiUIvnLPybiB5kKMJhju6Sup9uc/Eg3oZbXbtKWKxf
	CVKvIQXWgK8BNdqOAO5YENzKS6CC7Cc2Ql7vyh8NwXa7Oy4HKtGlRaqM56pEFKb1JTUeQ7YYLgS
	sYLFQX3FvFkl7w9p4ZEE/HY+iBnljKTAxvWXkDRmZzky1I6KSKo4oU0l1f4ByH03iVkQQt2LnFC
	27L74cOOp8+eA+oimRQ0050M3BA6pPcWRHOS2807iNZU66AmsKADmiVFD6p/nAUbs8+TM7TVnki
	V0cUCyGQrLOI2Q7qtBU/4i5+nFF5LB8fu0Dwzr8+CF76ch0Wgm7rpTOZZqFvV+crazbuXD2IKPW
	JrwtF8=
X-Received: by 2002:a05:600c:8b55:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-4801e350a41mr35890215e9.32.1768567057425;
        Fri, 16 Jan 2026 04:37:37 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm40428815e9.5.2026.01.16.04.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:37:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] memory: tegra: Add support for DBB clock on Tegra264
Date: Fri, 16 Jan 2026 13:37:32 +0100
Message-ID: <20260116123732.140813-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The DBB clock is needed by many IP blocks in order to access system
memory via the data backbone. The memory controller and external memory
controllers are the central place where these accesses are managed, so
make sure that the clock can be controlled from the corresponding
driver.

Note that not all drivers fully register bandwidth requests, and hence
the EMC driver doesn't have enough information to know when it's safe to
switch the clock off, so for now it will be kept on permanently.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- convert to dev_err_probe() (Krzysztof)

 drivers/memory/tegra/tegra186-emc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index dfddceecdd1a..03ebab6fbe68 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -22,6 +22,7 @@ struct tegra186_emc {
 	struct tegra_bpmp *bpmp;
 	struct device *dev;
 	struct clk *clk;
+	struct clk *clk_dbb;
 
 	struct tegra186_emc_dvfs *dvfs;
 	unsigned int num_dvfs;
@@ -328,6 +329,13 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 		goto put_bpmp;
 	}
 
+	emc->clk_dbb = devm_clk_get_optional_enabled(&pdev->dev, "dbb");
+	if (IS_ERR(emc->clk_dbb)) {
+		err = dev_err_probe(&pdev->dev, PTR_ERR(emc->clk_dbb),
+				    "failed to get DBB clock\n");
+		goto put_bpmp;
+	}
+
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;
 
-- 
2.52.0

