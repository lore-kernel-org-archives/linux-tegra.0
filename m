Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17132FE56F
	for <linux-tegra@vger.kernel.org>; Sun, 11 Oct 2026 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748865; cv=none; b=itjExpuyLUdBtjqcThVAbrx7uJtzmZ6g8YD2I8qCzW2nI43Xu5FXNzU5c2C4gdIpkjm/9kEVmvdw4BmEERU48q3liZbc3gOrqnCG+7jWml35tUfoYiERVpjSo3FvMfzELNPi9inX3WyDZigSfgiEayRq9fqaMFfuCO6oVisBmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748865; c=relaxed/simple;
	bh=8hzuobKMRFUIB5Gkf99Q71AgNKs1zpi13TsIJ+8zIjk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hzv47LqE6IvhRqK5PCjAvZ5ryfGvhtfT8YS4QHCe/ZvkfyDDkWMhX7y/0QGjR8MEt5qb2nqXQ6zY3cvFSptVs6YG+jCszq5ikUHeKUQsyDT8wS2Mb6CYLAhyLmJKNQlRLJichAL5JnRE/dgPITWNF1OgfCUZyMVXpu0FJMjW7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Icvu6A/U; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Icvu6A/U"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e6eb77f0bso134510385a.3
        for <linux-tegra@vger.kernel.org>; Sun, 11 Oct 2026 13:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748863; x=1792353663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjYVCkAhkYx5jymWbenkZ0abyqmM1tuoDhhjTrAOAqI=;
        b=Icvu6A/Un9xQ7lqsGbP/1TR7Eu838z/TBIi7vZx8eA+IcPT7Fha3bbYsQkCifXzXxK
         IR49CUt7dWUNVRHL7q5/J8wm66gU1geG6eJ4pzvwt4TDkkzGcP5v/yzzqJHe8KMsR4nR
         +LRznEnFb2zmglC6yC9HNEfvNw1/XQbce01Pt9+ot/gRXlSSJB1gWVZvEMtxcFYPsvd/
         pURpd/MD7Hr2rF4K1MyPXG7uiqfym2BL8Sb6eKIaBtBaLoswlgefmkmNiZ0mmy8bmW57
         lG082c+UWUaEtjZ3feQVspA4y9L/waOuCA5ele6y1IybT4wOK83fhxmQ+mLF1Glcr9Im
         /tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748863; x=1792353663;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DjYVCkAhkYx5jymWbenkZ0abyqmM1tuoDhhjTrAOAqI=;
        b=dX9oTQuKbDovh8CK9ytNk2JNBEXscIhi0zYGsL33IFaHi86dujGDWRx45Vpb0OzE2H
         pRcpDtr/vbaGqiYstYtncxJ1PDeBlUBCxjA1BoUvfu4HJ9Lf2Ih60i3b3W+V//J5VSgT
         jWvSg3TFvfiDpSUEr2JXsB9StiVUQ1jDnd13b4D3lTH3g+1zqJD1YpqK5+wUE6IGQzet
         3u+9CrR7tbYQStnWye0l+1nmsP5Sxxwd0aHln1mjn0z6Fe1bOteudnjkqppcbXs2KcCj
         7AG+o4gY9DCdKEdIwaPfgwblCocpnb+l2RfPg7CW0R3OdF/Cu4LDQvyj/NborPQrNqx3
         mk3w==
X-Forwarded-Encrypted: i=1; AKwUvBwFkVoheWcIGhwRivtOK2MJYS9TYzgxYWf93yhxNy67RjNV/Nw79LEWRtSWGy5xVGKFbcI/vGihAbFhxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjYyIsCuoRElZHQhZeCU+St27wz6nLZTbT15SKMPxEV9Hw36nM
	Rxegqlvb4NMws5G7M22eaGn5B3SgaPNO2m4/70Ai2tsjTFb+NxZbl34=
X-Gm-Gg: AYBFou0nsDn9N9LQPiOwR7OPOqw/07FVbduOrXfPdARdTutri+0NxZBPRuuV8c/vrzr
	01vvytiXQhhg4r1x4dv1snQAuBV6KunsDcT7FH1UicIOeWmbd45WhBV/hvZqqyq2Gu9quZZDnX6
	ERC3lDu+F+hVALxln1AY9MI9cqkzLDMlqgbQ4eGl+ScJQi7o15MiderJFVcfP4wYSqRz8u5VDI1
	CT9JixLAeqDIaFAx90mxaO4L1wzB9xvR3YO4ImMmfoYoF95dyVcAb6iSQb4+C81vHc5zEz5w+5H
	XFnRO9ILDJCYgVQLCE54aJMjv92gZYrEaEJxRpJmNGrWvSPQ6GPlWMTYtvenB4BSvQ8aewFHq8O
	x0bZFSynq6Xi3+ICTdQIP6caM5b8YnHX4MWvV1YRgFkisrpvbjN2eBoxMKLblhmYALD2LJn7UGs
	gnIrMh5vK5muFVIXyATv1jHgF+Pa8+z3WfJUSn+H8TBXP4sUlcYZwmd8G4CpxKPXPPg1VbhTG7N
	uJT8orzru/3qhr8+LPztMx1WAyQnblCsLnFBoRtS3uXqdcI2QkoWRmbjA+0Ru6GnLV0YbmcTVP8
	f4JcKQqrLe3nprJc
X-Received: by 2002:a05:620a:a0d3:20b0:93e:c12c:9b74 with SMTP id af79cd13be357-93ec12c9f6amr885590485a.79.1791748858371;
        Sun, 11 Oct 2026 13:00:58 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c0cfsm705308685a.19.2026.10.11.13.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:00:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: krzk@kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH] memory: tegra: Shut down Tegra210 EMC timers before teardown
Date: Sun, 11 Oct 2026 16:00:56 -0400
Message-ID: <20261011160034.93d011b386c2-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The training and refresh timers can outlive the EMC state on removal
or probe failure after clock attachment, causing use-after-free.

Shut down both timers before detaching the clock provider and releasing
the timing tables to wait for callbacks and prevent rearming. Initialize
them before clock attachment, since set_rate() can start training.

This issue was found by static analysis.

Fixes: 10de21148f7d ("memory: tegra: Add EMC scaling support code for Tegra210")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
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
