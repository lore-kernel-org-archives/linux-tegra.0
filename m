Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73A33E367
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713737; cv=none; b=MRwCV5CNTDI9EhghizuC5+xqNcohsDFfRTomV1KjvRfFhmY1NuNaDHsBmFDK6Cg7V395btttZJjKORFBCLYbZFfRxaY5AtVHK7JNgnE2AKAQhzDy1j7TxdBE/2I5WVzK6ywAzoqlsYh1qSjYFvmPJpXAALhi48xf9mZ8vHV3owo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713737; c=relaxed/simple;
	bh=DrC66QymEO9nAP2JwTUCuXUxnRrbolFKst7vhgyU2Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aai6+1kTXW9oJLNAo40EW1q8iwV09ZApTISbcjghLCWdES1w+hDCaYhwfDAq0YHAjYYLi/pH/eNX+kjuzve7/OdBKMiQTgC+VobD8AhRhVUFbXJEkqM9sp4OQctEqG4sApfThUFlAspREwgugGP7qSfoPWl11Q85tahrXShhXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bjn4o48h; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bjn4o48h"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c05dcdf49so30365541cf.0
        for <linux-tegra@vger.kernel.org>; Sun, 02 Aug 2026 16:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785713734; x=1786318534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhLsx2yXoOqDNB+btFBoUrdkWjE1+pOOwEBMJSftsog=;
        b=Bjn4o48hq/BRkcIPgh440idMEE/w5tCVOVLK70dwoI61DJG/Ix+Alcg2JF2uQVsfQH
         IFX533ns1zY/3sjuOWQHYtASa/Da3yX4sar+wd4Zd2Ew0lYKiL9JFrh0GeYdw0wmassP
         gYgz3aA+ZNsfO3KN/Tz3j3UajFooxNOKr9mO1G/TVQJM6nouGmyJkyPF5GasZMS0+cV6
         r6G2wJNzT7nAtVjNjqa7qkf1hjT+wJwr7E20FvE/eCB5FVs60nccqdOv/ydb4CCntKUd
         dh7fQeNa3DzLJrxz5n7RIOWsGYjOoSX+bZjiHUTrL9GMn5F+0oE3fXVmBv+gAoRuZbcw
         R94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785713734; x=1786318534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhLsx2yXoOqDNB+btFBoUrdkWjE1+pOOwEBMJSftsog=;
        b=AkfBQnKebnawiyOzghq+JBybkE/4Evf/4ubucZgVRIwH478/Gr9yQL8Y0GXrrHczgk
         d3KGg12CfdYmM0q/n05kJd1U4zP0oLlYUubfB+b2s2gGl08HGaMeBcV0tFjOXA+MRl/1
         gQwGN06QeZzz7J1YaywYiJC7wbefnbsuWD/yJoVxLWbpkWudPLOdp1B+wz3FUBrC910t
         KapDzAwm1KnBeANxwXALkzxx7PuLtbmnFUIsFcQqXuRb83t21AsxwXYlVTR6YHW7wS6W
         Jroopi+J8O0q0R5cBNT1ce76FCN67lNysKy4uMZcchbDLk8IQz1iCz61z5xKfimGAKC9
         hVPg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1lOk8oLB6Mt6Q+CSud4cM+2oKEgauvDD2mHjjhRQ/V1gEZImX+p9wVIQ5O2QlXoRRnVvwotoRW309Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9evFN7306alKRBWE61Btj5NSCznEnw6h0NRRAIEdsCbavGX38
	Bsd3d3vhs6XebMRsN4BViKXfUOsGM4Wgsl/3EGNP+sIpcpJtz1UEisPT
X-Gm-Gg: AR+sD12L/LloynkcfqQo7vMIKEzzCEAAtIZGEa8ctCDGMa/bJe8RF7+8dm4bZiT00lB
	INsYn1BfrjOmMWmRObLI1Rn6hggYTn925qlSXi021Wez2BZpSoNSJ8CES/n6BHRz/cdOhDL0DtP
	AVD6HYYt+yX64yFwoH4frAQp53hc/8gg6WiFQLrJeUSDkLy4ECardR4Vh4VDX4Bn1zBo3WE6dAM
	CW0Rh0Dq/BEY0V8i++YTzv3mZpqT0Fbj6bl8xDkAVi0FJ04EtKEwHz6w6pUkzxo2I246CbCWXWJ
	sNDt15S67x5MSAXi4se8wfRtdFKkibWQV3gFCy2i1S70OmjrMAsDnKSyiA0T1FWASiXwkfmckQU
	jlTGGfDrYQs8iqu5HMjheCi7jnVgpF82C4XFXTkJ13MeVcOhX6zqyeuJS215NfFD98GO3FP3Nro
	FNPWDd/s2ehoFbFWpkPt8KK6OFLOP+ghCQprc8S7D5R0lfZxngIYQeRQgONjBNZH7ItMJFTb31j
	i1TsaFfqno0QvW5lQMhzJiFj3bsWCtYMdja9QD1MlidyS9KBAgUt8H9EmQO2RQ9MZ2Mk9yaDe4=
X-Received: by 2002:a05:622a:2613:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52b5666ccedmr169933671cf.5.1785713733710;
        Sun, 02 Aug 2026 16:35:33 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435ed43esm63242606d6.40.2026.08.02.16.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:35:32 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: daniel.lezcano@kernel.org
Cc: tglx@kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] clocksource/drivers/tegra: Unwind timer setup on CPUHP failure
Date: Sun,  2 Aug 2026 19:35:29 -0400
Message-ID: <20260802233529.598707-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra timer requests per-CPU interrupts before registering its CPU
hotplug state. If cpuhp_setup_state() fails, the function returns directly
and leaves the requested interrupts registered.

Register the CPU hotplug state before registering the sched clock and
clocksource. On failure, unwind through the existing IRQ cleanup path so
that no registered clocksource is left pointing at an unmapped timer base.

Fixes: b4822dc7564f ("clocksource/drivers/tegra: Add Tegra210 timer support")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 35b6ce9deffa..bfcd0a57d856 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -331,6 +331,14 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 		}
 	}
 
+	ret = cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
+				"AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
+				tegra_timer_stop);
+	if (ret) {
+		pr_err("failed to set up cpu hp state: %d\n", ret);
+		goto out_irq;
+	}
+
 	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
 
 	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
@@ -343,13 +351,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 	register_current_timer_delay(&tegra_delay_timer);
 #endif
 
-	ret = cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
-				"AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
-				tegra_timer_stop);
-	if (ret)
-		pr_err("failed to set up cpu hp state: %d\n", ret);
-
-	return ret;
+	return 0;
 
 out_irq:
 	for_each_possible_cpu(cpu) {
-- 
2.43.0

