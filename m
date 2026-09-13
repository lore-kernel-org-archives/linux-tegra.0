Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13BF3016FB
	for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2026 04:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272378; cv=none; b=H8IunepVm9PXdjxpqdHTwo7lNicx1soxCq17tYpxQxsDfUv9dkxJRe4SOedossog3BMeT+vzFPo3v0rkw3+lr4YwvYGL4m8a0s0/uPQidIjliM6Ii3780DY1ywdQi2wKnQ5FIypEFqUoiT41ROMO+Rk2xpX7XEj21R0NzN3VR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272378; c=relaxed/simple;
	bh=DXmCkQye1kDbUZPYw5KB8SL2D6gVtjoWUrghFucJ2ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LO5E3KklnCBmtI3WT6opJrERnEK4zSyaPdJfjGkAkpScLxO5HZF3QxYUMtaj5FxzKka2wFctE8tFd7HSeN4gykpO4qa75VUyN8gSM+NXXs5fzmKmmBVZ02RnvHNH6yUO8pgpWvqOlRiJf8ldTfbK7HBlI2hruGBX7Kp6SwagL9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BabGGvSG; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BabGGvSG"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-530e1b6a689so9062731cf.3
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2026 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272375; x=1789877175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6qUThvMWk3OXMzannpQNNV81o00j3uVEX2Exkp10Qw=;
        b=BabGGvSGwrZ5fqVzq/RIILGv1XepcOr/sSlw09jdxUMjBxmyZbb1RtMrH1Jh0P5FKd
         rDg0G3IW2DFOeoM/1LtrCa6HA9Wfs1Q+wXJ0FFlNCsdrdSGNCOYnmu+0sav8gE2+fhP/
         bMXxn3QnHhV2fnV2XRk3bgQA9GGSkueZ7WPn99BQtwGFNxxgGZYp6lVJVOaFWGly4EOA
         F8TPMgYp3O68OZEC+AYmcolFPdFSB/alsrBXJFBri9TomcWRyiznRDwWN06YGghfDCDq
         MW6eLTFIkLoVDRFQXupJwgWxJSTd1Za4tKOSzbsXSvgI2ufthiZWVG26uW+9MVmjwMhL
         G5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272375; x=1789877175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6qUThvMWk3OXMzannpQNNV81o00j3uVEX2Exkp10Qw=;
        b=e+xgqDJQzoda7J2YSTAbjQOFp6UP0W7wLesmH+4uoYHHFTCdFk0X24H2HAtWHKN60z
         xoV5gU8nS/A2rqHzkl8z75yXL81qia1vnqfgBzeQXJDkqOKj8gLT/nLiyu9GeAUHs9fS
         qa7GBHE9DXk0Ve5OfpVLEW6LXexcEZzljE/ydJd7kLkj3hIgskvq1yKi+/YujDiwpGGS
         7L4g6MN95NQVOc/ztUNtq5meGerQbhIyt2t1jzw70ouJVho5IGR6kyOjGx6MARRc1/E+
         tsuj5eU+5oxivRN7WGzXw9Gvhj3bvKggVV7z3gFx/N3m7Tm8sckWgcke9JkBGms8M5d/
         6hwA==
X-Forwarded-Encrypted: i=1; AKwUvBySN+UuawlyLKC+kpX5vY/4AIQkEIKgQJzJrXNgCGa1xEiZgsi8brgJCosZ0jLpoZDWwttPWnvRymIdAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m49oiiIxAivNWw/DrY3lWw57P8GQGT04Dfe6N2a7DJ9EO3xVOy
	2GMC1LIveS0uFZELLODv42M3me1RdF27PMgLhuUXc6PEwI7B7iFrTWc=
X-Gm-Gg: AYBFou0mxH3pTg2DCwKRtu6iHHgqvQoZqQlDiqeG5nkGvcZVZkSUBBsQbb+wtsZ2n60
	aOp0RI2DVC4yntRUwjYppCqND4nSVOMuatLT5Nv7W0WYmjmDSK5RPj2VxzdobIgwRTA7UnfsVZk
	KTRAtBoEcJjlKVRftorrio0OB9qfOR1qmwJH2/KAgK/oFKMdP8qQYLzDC1IqSSvU+RIax86M3VU
	NZ5FvQZQvZyN/4n/VJgZTqkQJDwdzFNSYeHXDer5AtVSmiLnqblK9KjCf4IEqR+b6qdamYiqp1w
	Mr/sd1J44PMuk62wCCRtdHfp+LeoOKBOo4CGXKUK/joBoumv7tOs+dyEDHUvRA1d4XHqgf9a47G
	tkjzygLTnCjoGft59fbwphqrgkOk3Gbz+ccTvOC9+buix310ACml4ICuGAqcyKoSlZ/PK+/9PxD
	K6gkjGT0WKr4qWvM57n7lO4VS4THpB3QPTdMrNVhf4Ks9XyTCMChf2sw657WT4CueW2xERUBaaT
	TEOhu9El62HvxDyvzW4C9GFhuGwlZaCnfxoCzT+a7agJahOaH8wZxfGQBpJukO+Dvf2nVj8HHIh
	rVoI1wM9hSlRlBmIjLUC8D4RnhZxEievUA==
X-Received: by 2002:a05:622a:386:b0:52d:ca81:e5b2 with SMTP id d75a77b69052e-530c84d44dfmr167443301cf.5.1789272374653;
        Sat, 12 Sep 2026 21:06:14 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca50c8f1sm61459631cf.27.2026.09.12.21.06.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:06:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] pwm: tegra: Disable runtime PM on cleanup errors
Date: Sun, 13 Sep 2026 00:06:06 -0400
Message-ID: <20260913040606.23272-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_pwm_probe() enables runtime PM before requesting the initial resume.
If pm_runtime_resume_and_get() fails, probe returns with runtime PM still
enabled as the managed driver resources are released.

The later probe unwind and remove paths use pm_runtime_force_suspend(),
which disables runtime PM on success but enables it again if the suspend
callback fails. Ignoring that error can therefore also leave runtime PM
enabled during resource cleanup.

Disable runtime PM on the initial resume failure and when force-suspend
fails. Do not disable it a second time after successful force-suspend, and
preserve the original probe error. The failed resume_and_get call has
already balanced its usage count, so it needs no additional put.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3da9b0feaa16 ("pwm: tegra: Add runtime PM and OPP support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pwm/pwm-tegra.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 5cdbe120b..55287afcb 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -346,8 +346,10 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
 		return ret;
+	}
 
 	/* Set maximum frequency of the IP */
 	ret = dev_pm_opp_set_rate(&pdev->dev, ULONG_MAX);
@@ -395,7 +397,8 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	return 0;
 put_pm:
 	pm_runtime_put_sync_suspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
+	if (pm_runtime_force_suspend(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
@@ -408,7 +411,8 @@ static void tegra_pwm_remove(struct platform_device *pdev)
 
 	reset_control_assert(pc->rst);
 
-	pm_runtime_force_suspend(&pdev->dev);
+	if (pm_runtime_force_suspend(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 }
 
 static int __maybe_unused tegra_pwm_runtime_suspend(struct device *dev)
