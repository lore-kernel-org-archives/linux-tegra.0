Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAC39FE0
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386000; cv=none; b=uFihsYA7w60q5TbuXI+SJ3Rk9PLwyLNMrOrzho24cAdHqAf4LKlhc6z8wpGg1oPCUrIJOD2ETwiEGrVwcRAKceZi9s1kZIpdtSv8WZtCo8ATz/IradZk5x+beTSyg7jyIR6cRl1m9k+hv1+fgFl4MQKv3R2j4FhTvzxgyNSRjkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386000; c=relaxed/simple;
	bh=h3B/iHxIiuZ20yNInGM3iS/oSRk0sH2ZyDs3SZSjg5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPznGMSPGEBLNFZpyxp8orO5W88OaIUpCVEWJy8b2iHxI6qBWGrRIQ4q7E2Pcti72ltgPTfn0TOqQ0ab1sWQcyedkCrTefw1FRpY76cJipaW+cBcOPz7kiIHk/HyIJTKF8YZg1tau/rA2LEM87n1o0+hyPkymHfDIj10uVp0S0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=plp6XIas; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="plp6XIas"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3DBEC60020D3;
	Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id bvXb_Uo46CqK; Mon, 29 Apr 2024 11:19:48 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id F20696001435;
	Mon, 29 Apr 2024 11:19:47 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVadnsK4bFte+vfSQ0rGftLRVFRW5Se0kh1kqTWlCPw=;
	b=plp6XIasK/JZ4NR4CywTAJWb9CohoaqFZF/E4s6N3a8kIOsGtGw9KYc7gK3e3NEPHscrW1
	S2yDUAwLuwnCtbZLCB4at99gBkmUWCeZAS+10PZPTq/73eWXN+Rt9Lv68yLOOUVx6rRAxp
	SOu5zq5QwKI7wiWF4QO7Shjb9qoqR4U=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CF6C7360083;
	Mon, 29 Apr 2024 11:19:47 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 2/7] memory: tegra: Move DQSOSC measurement to common place
Date: Mon, 29 Apr 2024 11:19:25 +0100
Message-ID: <20240429101933.11500-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the calls that instruct the RAM to capture its clock tree delays
to update_clock_tree_delay() in order to avoid code duplication.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v3:
 - Rename the delay length variable udelay -> delay_us to fix compile
   error

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 9ec49ced8f91..a3525f3b8145 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -123,10 +123,19 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 	bool dvfs_update = type == DVFS_UPDATE;
 	s32 tdel = 0, tmdel = 0, adel = 0;
 	bool dvfs_pt1 = type == DVFS_PT1;
+	u32 temp[2][2], value, delay_us;
 	unsigned long cval = 0;
-	u32 temp[2][2], value;
 	unsigned int i;
 
+	if (dvfs_pt1 || periodic_training_update) {
+		delay_us = tegra210_emc_actual_osc_clocks(last->run_clocks);
+		delay_us *= 1000;
+		delay_us = 2 + (delay_us / last->rate);
+
+		tegra210_emc_start_periodic_compensation(emc);
+		udelay(delay_us);
+	}
+
 	/*
 	 * Dev0 MSB.
 	 */
@@ -409,11 +418,6 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 	u32 i, adel = 0, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
-	u32 delay;
-
-	delay = tegra210_emc_actual_osc_clocks(last->run_clocks);
-	delay *= 1000;
-	delay = 2 + (delay / last->rate);
 
 	if (!next->periodic_training)
 		return 0;
@@ -447,9 +451,6 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 			__MOVAVG(next, C1D1U1) = 0;
 
 			for (i = 0; i < samples; i++) {
-				tegra210_emc_start_periodic_compensation(emc);
-				udelay(delay);
-
 				/*
 				 * Generate next sample of data.
 				 */
@@ -465,12 +466,8 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 		adel = update_clock_tree_delay(emc, DVFS_UPDATE);
 	}
 
-	if (type == PERIODIC_TRAINING_SEQUENCE) {
-		tegra210_emc_start_periodic_compensation(emc);
-		udelay(delay);
-
+	if (type == PERIODIC_TRAINING_SEQUENCE)
 		adel = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
-	}
 
 	return adel;
 }
-- 
2.44.0

