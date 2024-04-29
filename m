Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870672D05D
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386004; cv=none; b=K3+u1DIxktqaptA/5MAxT0PHYVpgx/TsBfi6wi3Z9z80qgIyJNmYg6gKeH7J2li+OVImHtfwrGu4ZGrMz2spfY77OjVEm3SkwLdVmO+UHI7Wb/P2VsnPnPL/a1j4N8bbfxYZPHQaad+ZXei1L/bXv1RAnUTI/Al08A6pyiKEuTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386004; c=relaxed/simple;
	bh=gBT0/GHP92n03Txi9j723w1y05utrjiv0+U12KD3wps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIBcTaHB4n4s8wK8MVhMzV7RoasOCDeLrCSch24OlkzRT0SZi2qzL3xhViyfHXF2+6GuiYTL/wzU3cUrBliWaYKc7/mNt9Uvse/x33Drw7ITllKQo/6nckBV52isPQ5fEhJzENgzDKJLQPzJRbP7BCf2KiXpxJvKPPwBPpVkkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Xgoc3uzq; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Xgoc3uzq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BDAA160020D1;
	Mon, 29 Apr 2024 11:19:52 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id zkU0GFO9c9RD; Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 809AE60020D4;
	Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6L+o2xBlnX13VJHQyX2QgkyA28VGIf6z49wDsY/otFc=;
	b=Xgoc3uzqKH1riu9WVLUELMj7jdaDh2//IQuweKfbOzDBNKXuE8el8MoQaG9vifxJXz7ciw
	I7hB13SZqRB/ksgikptclEChPNgvkYzapJoTmTxgxWnlgiyFFS/fh+OR5ZIEryT1QfvBmY
	djeS/mY+tHM+0bywoKj5UCW/uiwldbs=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 62827360083;
	Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 7/7] memory: tegra: Rework update_clock_tree_delay()
Date: Mon, 29 Apr 2024 11:19:30 +0100
Message-ID: <20240429101933.11500-8-diogo.ivo@tecnico.ulisboa.pt>
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

Further streamline this function by moving the delay post-processing
to the callers, leaving it only with the task of returning the measured
delay values.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 120 +++++++-----------
 1 file changed, 46 insertions(+), 74 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index a8a217502f0c..277fca62f57e 100644
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
-	u32 temp[2][2], value, delay_us;
-	unsigned long cval = 0;
+	struct tegra210_emc_timing *curr = emc->last;
+	u32 rate_mhz = curr->rate / 1000;
+	u32 msb, lsb, dqsosc, delay_us;
 	unsigned int c, d, idx;
-	bool over = false;
+	unsigned long clocks;
 
-	if (dvfs_pt1 || periodic_training_update) {
-		delay_us = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		delay_us *= 1000;
-		delay_us = 2 + (delay_us / last->rate);
+	clocks = tegra210_emc_actual_osc_clocks(curr->run_clocks);
+	delay_us = 2 + (clocks / rate_mhz);
 
-		tegra210_emc_start_periodic_compensation(emc);
-		udelay(delay_us);
-	}
+	tegra210_emc_start_periodic_compensation(emc);
+	udelay(delay_us);
 
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

