Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34A12F585
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024140; cv=none; b=J2U3kccbDzkLKzv98SSHmZ0K7PuE5iQo3XMRnIUaOlm4Ly65nsQ702tK64r6OsgOJG2hqyM5cKLM6z7BuUcprzEE1/Cm0QpkMV/e+RaOR6FD5KPq4mIuN1SIVvH99V+73+MBQCGVI2fyfU2zdR57cUYU7I19FWZQqeJQvvsXCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024140; c=relaxed/simple;
	bh=n/GOlLkjoVGOj1jYUFcCfZJAUDFyu8jOKIReoDlB+Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uSxiIeO7fA5UnkfXTBA5gVV/xM5VTJSn7apuAOvttqQb0ZNJPLfVEqJw+1ZKWvo0W6775B1+khEC2pZMdxq/WJFp78/VTJE8PEbIA5AUppSSN2/izJrUPlYElayhiKKddbAEAtDcfQ0bXLopEbnLa7pejolP3s6greL1lFh/uXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJS1yzFm; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJS1yzFm"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93cc1ab5f6cso559985085a.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 17:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024137; x=1792628937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z04Lon24T05+gWKIStNI+3p/AYPWvmLhaYNJ4Xy1OFA=;
        b=qJS1yzFmLUvpPyAH3oCaOxzrpQgy6VZl+qdBuHCc4BR/9aY1kyH2pwCu46wvUFGcFL
         LVVMFQYYdyl+9opuN4YEz2xnzmHETXhK+qW4TGqxv0rKCm2Uc0Bzr0pUDS2SWbAz4ca/
         ogI0J/4WhUCh7FXtzJYSJ6rWfvXrJtyMc12oL63W65ptnnRE2/8ZwkUVfkcqpnuWQdLv
         Rr6H/ipTMRjJyKq6GXXqYM6mLYGqF+fPWstqjUvTJ2kE5XRM21XVUrU0+r00Qx41se60
         wFdxBti57PwTua6kd1EoI5m5o+240wdJS6bfNN5kwy/ImqYxB8aglaxYLD9VagsxQPcG
         pLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024137; x=1792628937;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z04Lon24T05+gWKIStNI+3p/AYPWvmLhaYNJ4Xy1OFA=;
        b=d5D5O4arUyUgkvQqmtkXAUy/3N1a1fLTodXxiLVs0Lta6nRXk46y2m90Z1bV9ffMq/
         hIhFi92i2LlEA3zj/6l7Hwx2VIucAV6GjT1bpq/sfYj3qUXfwJIU1fL6cF7lQrl6eHzn
         uqqu/XNjPQjBQog+S4I7r4BHP8alc2xzS0KwvmGI+xHYZQbj5efRH4OxdRIZE9WDPk3J
         Ty3YfCWg+eALf3bhgifGOsJ9m5Pa4jxE72664AHNIt2Ud/7nzoEWCe83OyrLpNxP0tCW
         QB7znzB9U7gRRj1vUD/dVRWVZ82ah/41jj6Prh8cGl0x+XfEphIvlzWGNpCz5wfl/7km
         OrwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWBQ+XZNSSINxKjJtjZxKQFLKdl/HjaDFFttTtoReBBglP38FjztI9msv7RCZCz/pEpNP1jpzo7HVYxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLHqUBf8YrJf6BBrAsmUit7trTUV0zv7KR2yveJgB10BAlua6zu
	UvYkHh7PlpVMwm5+AGfc/qUvPt4wAhEcqTW2vzz3HWpWd3gH4arXVdM=
X-Gm-Gg: AYBFou2PwtGq1TVb9ZuZGo6eoDhMCgqWAt5vimJu4Ppo4P+uYiPt/XiqN1YznDnBA76
	GE7GGY44BTe225FhkI4bxnMSX2a6KeC9aiJ+DoWwq9lEl+onTORb3zJJCvG+XyIH6O7dbzuRfXy
	GpLwlJnbxV6ml1qwzcQmxN9gaiqkhr8CHHiL65zrT8Mt81hCljOiP0hNF9EgMbkk1cxdC06RpEj
	cXE8r2os5to+xt8aLvCCulSimmAmF+x+ff3SZXNlSHRVv4YDb2S8FUTtF2kgL3dOOpcvoe3mMid
	3sMlk+DowRo2kID3NIs4i1sW6RgRih3/8GuukqATzkBJK1e0YroGX5IeFVww6TmDD6bOYmdvLNj
	JqPKb6v1CTM4hRDILORbwSLXHttH7g3r8uQrTocyXWK6o8sxCW8rYtO4cVDJ4mYwssTdnjnmQ1R
	zexOeG6r4PECp8eWRHBZ9fzKqHsI/8RMN9s3BpCxJ3CC9vUN4H06ExHbHZpwa9nCQG/cJItCHMM
	AyOoPwR1kCRztacCAcMhYTT7AjiUQO0/pAgd6ttiKeH4r//U/3R7j2SAz/inlm3wmqgLjhGzAUi
	T3vHBw==
X-Received: by 2002:a05:620a:40d4:b0:937:6c0a:9b65 with SMTP id af79cd13be357-93ebd0c0a5bmr2853916685a.7.1792024136942;
        Wed, 14 Oct 2026 17:28:56 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97be6583sm67081666d6.41.2026.10.14.17.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:28:56 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: krzk@kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH v2] memory: tegra: Shut down Tegra210 EMC timers before teardown
Date: Wed, 14 Oct 2026 20:28:52 -0400
Message-ID: <20261015002852.2159841-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The training and refresh timers can outlive the EMC state on removal
or probe failure after clock attachment, causing use-after-free.

Shut down both timers before detaching the clock provider and releasing
the timing tables to wait for callbacks and prevent rearming. Initialize
them before clock attachment, since set_rate() can start training.

This issue was identified during our ongoing research while reviewing
kernel code.

Fixes: 10de21148f7d ("memory: tegra: Add EMC scaling support code for Tegra210")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Replace the static-analysis attribution with an ongoing-research note,
  following Krzysztof Kozlowski's feedback. No code changes.

v1: https://lore.kernel.org/r/20261011160034.93d011b386c2-1-mhun512@gmail.com

Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/memory/tegra/tegra210-emc-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e8d4cd8..044ec6f 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1946,12 +1946,6 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 			config->same_freq = true;
 	}
 
-	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
-		goto release;
-	}
-
 	emc->clkchange_delay = 100;
 	emc->training_interval = 100;
 	dev_set_drvdata(emc->dev, emc);
@@ -1963,6 +1957,12 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 	timer_setup(&emc->training, tegra210_emc_train, 0);
 
+	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
+		goto release;
+	}
+
 	tegra210_emc_debugfs_init(emc);
 
 	cd = devm_thermal_of_child_cooling_device_register(emc->dev, np, "emc", emc,
@@ -1978,6 +1978,8 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 
 detach:
 	debugfs_remove_recursive(emc->debugfs.root);
+	timer_shutdown_sync(&emc->training);
+	timer_shutdown_sync(&emc->refresh_timer);
 	tegra210_clk_emc_detach(emc->clk);
 release:
 	of_reserved_mem_device_release(emc->dev);
@@ -1990,6 +1992,8 @@ static void tegra210_emc_remove(struct platform_device *pdev)
 	struct tegra210_emc *emc = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(emc->debugfs.root);
+	timer_shutdown_sync(&emc->training);
+	timer_shutdown_sync(&emc->refresh_timer);
 	tegra210_clk_emc_detach(emc->clk);
 	of_reserved_mem_device_release(emc->dev);
 }
