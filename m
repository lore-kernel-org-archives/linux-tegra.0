Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56A35AC1C
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009319; cv=none; b=LuYcUxHf+cEdIMLEMYHLMHIPfopBldu2TuGeONSzxrKDFfOVnaFQx3bOSWC039CwTkoKDQMISw70e7HNozttIPzp0j2ufphyY3c7uhD7D+3QGZKezaQEeeVuTaU+bKtThfJskLC2p5wcIof6jmEHYpgVImOK5HgM/RAwuASYXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009319; c=relaxed/simple;
	bh=EDBxatnEUburKx8/zwpFGL7C2qiZgLPMLEqp6wZqtG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCz2PzTYzzcX4vj5JwRj8VylDzZFbOJiBnYvHuMlmVBqZWRVNJlcVL+zhl7m2IBkh9fYTwJf5aTTiEXpS0jtn0bpNUaQk4nmakuzabPkq+E7jJHvBssBQ6wAs7mXoMcnhyOdABNGlB+0v+p6cJrah3BV8y/jjvuJagOB15TrRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME1tqFPb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME1tqFPb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f6092eso573498f8f.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779009316; x=1779614116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaCaJ0wOxTOll8aVdydgJ1rChHHJqX36x9WrjTxVV0A=;
        b=ME1tqFPbotSkt0qS0HPKTEEhhpAbmWeKt8k7e9hcdux8ISc3tTJBzFBWIVmBX7HSm1
         CQtTNR0DRuzcHBJyXffAWuJJVRH7cocOYdhISeDbT6ntxKkCcd3JxuIgptfTQKfsMTjW
         7TVO8zO0JWN/smoFOLlDuj1OSSvxEl3BzDh3dyjndE3GqPRrMd1xHp5bIMtq25tf4C/W
         Ufsnd+1QStCNfkEsP/doqHT/I4eGL+6oEueUkR9eh7GkKvzk163nsxcLzlg6jRhRMfYZ
         /O5UfxsvzFJ0CILoyievzkkFxa3UNWU7SmHcEFYM7hWnFDvr1sECd1m1xPXSNm+o5yL4
         45Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009316; x=1779614116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaCaJ0wOxTOll8aVdydgJ1rChHHJqX36x9WrjTxVV0A=;
        b=WZIPcB1QHxOJjZSbfVfeYeloKTsuPScK5P5mOvracjimK6p401E5klQMmfyzErbuSS
         2RktaiwQkL8xKsvtNRUxVuUfD/kpsxF4HqdOpfbP3nWWSfc04fjoyxBvvVLrS4BrIk8j
         z7B1q5WErxrIo3+PcpA5TgWLV974f4YgbuYDDwSDy00yXS7wh44r18ZIjeV8OfuM1DzL
         b5q5ZBIbkRRommX4tbQYamtycrdi46m3OBTAcfhfeEzE1epk1j+g9+B7Y6vBpnVnSP2q
         eemVgjwGNufrouIL65w66SvcQFAKPU/BYpWRB8ZKZhC3XkaMzLy4Cr2vkHuscZTwXKsY
         EukQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u6x8LzUibgSPNzgmGsTX2CibO2sedo0VJ8nkRXI7b1IG4KSe8gVfzGSMgja6LknVGTZ2CULrMhhs29Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhjP5nw5/L9Jv8L4WqE0hfA8xeEfNU9K09GJB4wMwZGfDCaTwW
	Y5DToUd6IJBR2vZ5Jh6c3xpK9H8cHkNMKpFyeLrKXOrjmuIM2hhUSd6G
X-Gm-Gg: Acq92OFiIoyVc1qnD3W0lnoTzAGURU1TSvwNEZeF1gyr86Ie+ReJgGoaqqlaFn/co4Z
	2YvJe3h7WiHfsFmG+mULlM4wMo8weoAurOrhRuVbdQYcr0NgVsAELj2p6mdVXcChwHGBFVTT8YJ
	SjZpw3inSoFct4UoHzVuCYEEBqFByddqnrqiO1DGDuBf5oMstejSS+Jv+qNLe3sZFpxOxOUTXjV
	aTWPdYurHguDHMOfs+HbD84uWKGEVwCQ4cIrI6U9DbR7/V7nGcL1Zo6lvbcPxuTqqf6onyYdFoj
	Uwh/qObvzAWy9GZ82ykKBiUf3o6orLMACGzKKSlAMiWruUKTM46gQxmBvU7XZzfZlfW3n7HTbaX
	DeI1F6vR0Wk+dPlvSPo3eG0DWF8RSPmSjPYula5U0IVRGnhymXVyNzqOzzDmTdRCMBkDOsTZ8D8
	TgNvUyg/Dxhurz
X-Received: by 2002:a05:6000:18c6:b0:45e:73a1:8db5 with SMTP id ffacd0b85a97d-45e73a18e91mr1859932f8f.40.1779009315567;
        Sun, 17 May 2026 02:15:15 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm29560235f8f.22.2026.05.17.02.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 02:15:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ion Agorria <ion@agorria.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
Date: Sun, 17 May 2026 12:14:50 +0300
Message-ID: <20260517091450.46728-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517091450.46728-1-clamor95@gmail.com>
References: <20260517091450.46728-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ion Agorria <ion@agorria.com>

The current power management configuration causes GR2G/GR3D to malfunction
after resume. Reconfigure all PM actions to be handled within the GR*D
probe and remove operations to address this.

Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 13 ++++++-------
 drivers/gpu/drm/tegra/gr3d.c | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index e4148b034af7..892e3450b281 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -100,9 +100,6 @@ static int gr2d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
 	host1x_client_iommu_detach(client);
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(gr2d->channel);
@@ -280,12 +277,18 @@ static int gr2d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
 		set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
 
+	pm_runtime_enable(dev);
+
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to register host1x client: %d\n", err);
 		return err;
 	}
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+
 	return 0;
 }
 
@@ -367,10 +370,6 @@ static int __maybe_unused gr2d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 47b0c6c56bfd..388e47943d5e 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -109,9 +109,6 @@ static int gr3d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	pm_runtime_dont_use_autosuspend(client->dev);
-	pm_runtime_force_suspend(client->dev);
-
 	host1x_client_iommu_detach(client);
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(gr3d->channel);
@@ -510,13 +507,19 @@ static int gr3d_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
 		set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
 
+	pm_runtime_enable(&pdev->dev);
+
 	err = host1x_client_register(&gr3d->client.base);
 	if (err < 0) {
+		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
 		return err;
 	}
 
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+
 	return 0;
 }
 
@@ -578,10 +581,6 @@ static int __maybe_unused gr3d_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	pm_runtime_enable(dev);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_autosuspend_delay(dev, 500);
-
 	return 0;
 
 disable_clk:
-- 
2.51.0

