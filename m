Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C57F7D0
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523543; cv=none; b=MGsNq7dpAyt1xracWLgtCiGTxZqCpybwA4t2M3vzP0flHmE+cw+RK97Znw3sgfam5hYCZohwH3uo3+WuUUSJS97c/Rd6aAZxRZ9TQ49gmqL13EgilDo2IjK8ECpSpWswq+cfLXYoPXrdN/kydqVdjQdZ4Jzpygfbvf+A1ao/8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523543; c=relaxed/simple;
	bh=fQJHKsxzEnvyHYVoLy469Ew8WlOfjH2KxbM5Zu4a5E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZbDkXu1u4Xaf3isUtO/3ulkNm+zJVQxf1tWXNUZRU43/YNUT36BqsLA9jeblG6Yon4rl3dk+G3pt6XxE2UOurYlcI+laIxth4buCu8lb3FzcRXV46WkDB4EyaOUW+TR6YFXnftVUAD9Tx9UKL/ydXOcQY1JqdTBwoGucghpaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=BJ/CzqJg; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="BJ/CzqJg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 8EE866005408;
	Fri, 19 Apr 2024 11:45:32 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id roXFRWZFcsy7; Fri, 19 Apr 2024 11:45:30 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 53B156005415;
	Fri, 19 Apr 2024 11:45:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kux4E0YyOMHhNcXQz9XJeKNHT7wCdDkvtSAS2WBV4Ig=;
	b=BJ/CzqJgKy/u9rTCHN6NdRzJLQSj7bOO8RB82RoJ2EQ8NHKtfK9UdK//LR0ByLYv/l01Q8
	fgHrDe1LG9djhAjhikeyL1ePLD0kAWmCj8eQmGhy5lCB4gM12+g65Hw0QL1ffdWVlds19Z
	9/KJNTLsyoGYJJgRsg8a2IiMbxmLMsQ=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 320323600AC;
	Fri, 19 Apr 2024 11:45:27 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 7/7] memory: tegra: Rework update_clock_tree_delay()
Date: Fri, 19 Apr 2024 11:45:15 +0100
Message-ID: <20240419104516.308975-8-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Further streamline this function by moving the delay post-processing
to the callers, leaving it only with the task of returing the measured
delay values.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 120 +++++++-----------
 1 file changed, 46 insertions(+), 74 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 338c9f3b1a66..1b1141e4b4d3 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -105,7 +105,7 @@ enum {
 			  next->ptfv_list[w])) /			\
 			(next->ptfv_list[w] + 1);			\
 									\
-		emc_dbg(emc, EMA_UPDATES, "%s: (s=%lu) EMA: %u\n",	\
+		emc_dbg(emc, EMA_UPDATES, "%s: (s=%u) EMA: %u\n",	\
 			__stringify(dev), nval, next->ptfv_list[dqs]);	\
 	} while (0)
 
@@ -130,93 +130,51 @@ static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing
 	return false;
 }
 
-static bool update_clock_tree_delay(struct tegra210_emc *emc, int type)
+static void tegra210_emc_get_clktree_delay(struct tegra210_emc *emc,
+					   u32 delay[DRAM_CLKTREE_NUM])
 {
-	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
-	struct tegra210_emc_timing *last = emc->last;
-	struct tegra210_emc_timing *next = emc->next;
-	u32 last_timing_rate_mhz = last->rate / 1000;
-	bool dvfs_update = type == DVFS_UPDATE;
-	bool dvfs_pt1 = type == DVFS_PT1;
-	u32 temp[2][2], value, udelay;
-	unsigned long cval = 0;
+	struct tegra210_emc_timing *curr = emc->last;
+	u32 rate_mhz = curr->rate / 1000;
+	u32 msb, lsb, dqsosc, udelay;
+	unsigned long clocks = 0;
 	unsigned int c, d, idx;
-	bool over = false;
 
-	if (dvfs_pt1 || periodic_training_update) {
-		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		udelay *= 1000;
-		udelay = 2 + (udelay / last->rate);
+	clocks = tegra210_emc_actual_osc_clocks(curr->run_clocks);
+	udelay = 2 + (clocks / rate_mhz);
 
-		tegra210_emc_start_periodic_compensation(emc);
-		udelay(udelay);
-	}
+	tegra210_emc_start_periodic_compensation(emc);
+	udelay(udelay);
 
 	for (d = 0; d < emc->num_devices; d++) {
-		if (dvfs_pt1 || periodic_training_update) {
-			/* Dev[d] MSB */
-			value = tegra210_emc_mrr_read(emc, 2 - d, 19);
-
-			for (c = 0; c < emc->num_channels; c++) {
-				temp[c][0] = (value & 0x00ff) << 8;
-				temp[c][1] = (value & 0xff00) << 0;
-				value >>= 16;
-			}
-
-			/* Dev[d] LSB */
-			value = tegra210_emc_mrr_read(emc, 2 - d, 18);
-
-			for (c = 0; c < emc->num_channels; c++) {
-				temp[c][0] |= (value & 0x00ff) >> 0;
-				temp[c][1] |= (value & 0xff00) >> 8;
-				value >>= 16;
-			}
-		}
+		/* Read DQSOSC from MRR18/19 */
+		msb = tegra210_emc_mrr_read(emc, 2 - d, 19);
+		lsb = tegra210_emc_mrr_read(emc, 2 - d, 18);
 
 		for (c = 0; c < emc->num_channels; c++) {
 			/* C[c]D[d]U[0] */
 			idx = c * 4 + d * 2;
 
-			if (dvfs_pt1 || periodic_training_update) {
-				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-				cval *= 1000000;
-				cval /= last_timing_rate_mhz * 2 * temp[c][0];
-			}
-
-			if (dvfs_pt1)
-				__INCREMENT_PTFV(idx, cval);
-			else if (dvfs_update)
-				__AVERAGE_PTFV(idx);
-			else if (periodic_training_update)
-				__WEIGHTED_UPDATE_PTFV(idx, cval);
+			dqsosc = (msb & 0x00ff) << 8;
+			dqsosc |= (lsb & 0x00ff) >> 0;
 
-			if (dvfs_update || periodic_training_update)
-				over |= tegra210_emc_compare_update_delay(next,
-							__MOVAVG_AC(next, idx), idx);
+			/* Check for unpopulated channels */
+			if (dqsosc)
+				delay[idx] = clocks * 1000000 / rate_mhz * 2 * dqsosc;
 
 			/* C[c]D[d]U[1] */
 			idx++;
 
-			if (dvfs_pt1 || periodic_training_update) {
-				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-				cval *= 1000000;
-				cval /= last_timing_rate_mhz * 2 * temp[c][1];
-			}
+			dqsosc = (msb & 0xff00) << 0;
+			dqsosc |= (lsb & 0xff00) >> 8;
 
-			if (dvfs_pt1)
-				__INCREMENT_PTFV(idx, cval);
-			else if (dvfs_update)
-				__AVERAGE_PTFV(idx);
-			else if (periodic_training_update)
-				__WEIGHTED_UPDATE_PTFV(idx, cval);
+			/* Check for unpopulated channels */
+			if (dqsosc)
+				delay[idx] = clocks * 1000000 / rate_mhz * 2 * dqsosc;
 
-			if (dvfs_update || periodic_training_update)
-				over |= tegra210_emc_compare_update_delay(next,
-							__MOVAVG_AC(next, idx), idx);
+			msb >>= 16;
+			lsb >>= 16;
 		}
 	}
-
-	return over;
 }
 
 static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
@@ -228,8 +186,8 @@ static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 	u32 i, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 delay[DRAM_CLKTREE_NUM], idx;
 	bool over = false;
-	u32 idx;
 
 	if (!next->periodic_training)
 		return 0;
@@ -252,16 +210,30 @@ static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 
 			for (i = 0; i < samples; i++) {
 				/* Generate next sample of data. */
-				update_clock_tree_delay(emc, DVFS_PT1);
+				tegra210_emc_get_clktree_delay(emc, delay);
+
+				for (idx = 0; idx < DRAM_CLKTREE_NUM; idx++)
+					__INCREMENT_PTFV(idx, delay[idx]);
 			}
 		}
 
-		/* Do the division part of the moving average */
-		over = update_clock_tree_delay(emc, DVFS_UPDATE);
+		for (idx = 0; idx < DRAM_CLKTREE_NUM; idx++) {
+			/* Do the division part of the moving average */
+			__AVERAGE_PTFV(idx);
+			over |= tegra210_emc_compare_update_delay(next,
+						__MOVAVG_AC(next, idx), idx);
+		}
 	}
 
-	if (type == PERIODIC_TRAINING_SEQUENCE)
-		over = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
+	if (type == PERIODIC_TRAINING_SEQUENCE) {
+		tegra210_emc_get_clktree_delay(emc, delay);
+
+		for (idx = 0; idx < DRAM_CLKTREE_NUM; idx++) {
+			__WEIGHTED_UPDATE_PTFV(idx, delay[idx]);
+			over |= tegra210_emc_compare_update_delay(next,
+						__MOVAVG_AC(next, idx), idx);
+		}
+	}
 
 	return over;
 }
-- 
2.44.0

