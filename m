Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2027E7F47F
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523542; cv=none; b=peuq64U9ghnrvZ5Tr0n18x1OhRxx0AWmjlH7++D11AeHjBV5Xc1W5Yma9HZaAWSlOy4Z7DjdPcQdpXYwvByRDVEZMhrTEO11NfPI71s+WYMo5Mw3WFWoy1UzbU4IBrg3by5I/TxhmJowoS/+9GzxhG8+luZjtK96jXrhpZLAN+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523542; c=relaxed/simple;
	bh=PTCSil8/SxoNsfEImZjaEYfVbDMGgnn8ye9bAN0bkKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPPva0e3FOUQx8HJY9qo7ScJIESLIJlrBLR3ZF8kRoJr2/JItfGjma6NMPRHFm/jSG9J0Roi/z9MIY1lQWf+fEr0LszhRfaIumzU+w0wa4gcu0/8NwU7jc7WtqXC4/ZngJVs2fIQyMlSK1QWUFpfCXKH8CETjFLEb/DnFugNR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=VwNhk7gO; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="VwNhk7gO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 8FA6C6005400;
	Fri, 19 Apr 2024 11:45:31 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id t_GStKC43b0v; Fri, 19 Apr 2024 11:45:29 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BC54D600540C;
	Fri, 19 Apr 2024 11:45:26 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zzf4Qj5Wo3tgV9hSnktdSFWwSLMM7493bkuuUEE5NCc=;
	b=VwNhk7gOMlMzjHn5VhYCj8NveMWomMIze3ZTkV1GHTWgP62djl1MLVctCIXixlQsUqSSK6
	PBJH7A1HJP1Kg9SOkfJ2dtujyKJdyh+pR2LaoYU4dJn+BSp7hsfoqGJ2wuTTaQf3avlJPt
	8jtZLmW4NCTRHRM23Qlu96jmxhvk5l0=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9F8B53600AC;
	Fri, 19 Apr 2024 11:45:26 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 6/7] memory: tegra: Move compare/update current delay values to a function
Date: Fri, 19 Apr 2024 11:45:14 +0100
Message-ID: <20240419104516.308975-7-diogo.ivo@tecnico.ulisboa.pt>
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

Separate the comparison/updating of the measured delay values with the
values currently programmed into a separate function to simplify the
code.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - Correct return value of update_clock_tree_delay() to bool

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 86 +++++++++----------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index dc6e60c13cc8..338c9f3b1a66 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -113,19 +113,35 @@ enum {
 #define __MOVAVG(timing, dev)                      \
 	((timing)->ptfv_list[(dev)])
 
-static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
+static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing,
+					      u32 measured, u32 idx)
+{
+	u32 *curr = &timing->current_dram_clktree[idx];
+	u32 rate_mhz = timing->rate / 1000;
+	u32 tmdel;
+
+	tmdel = abs(*curr - measured);
+
+	if (tmdel * 128 * rate_mhz / 1000000 > timing->tree_margin) {
+		*curr = measured;
+		return true;
+	}
+
+	return false;
+}
+
+static bool update_clock_tree_delay(struct tegra210_emc *emc, int type)
 {
 	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
 	struct tegra210_emc_timing *last = emc->last;
 	struct tegra210_emc_timing *next = emc->next;
 	u32 last_timing_rate_mhz = last->rate / 1000;
-	u32 next_timing_rate_mhz = next->rate / 1000;
 	bool dvfs_update = type == DVFS_UPDATE;
-	s32 tdel = 0, tmdel = 0, adel = 0;
 	bool dvfs_pt1 = type == DVFS_PT1;
 	u32 temp[2][2], value, udelay;
 	unsigned long cval = 0;
 	unsigned int c, d, idx;
+	bool over = false;
 
 	if (dvfs_pt1 || periodic_training_update) {
 		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
@@ -174,17 +190,9 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 			else if (periodic_training_update)
 				__WEIGHTED_UPDATE_PTFV(idx, cval);
 
-			if (dvfs_update || periodic_training_update) {
-				tdel = next->current_dram_clktree[idx] -
-						__MOVAVG_AC(next, idx);
-				tmdel = (tdel < 0) ? -1 * tdel : tdel;
-				adel = tmdel;
-
-				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-				    next->tree_margin)
-					next->current_dram_clktree[idx] =
-						__MOVAVG_AC(next, idx);
-			}
+			if (dvfs_update || periodic_training_update)
+				over |= tegra210_emc_compare_update_delay(next,
+							__MOVAVG_AC(next, idx), idx);
 
 			/* C[c]D[d]U[1] */
 			idx++;
@@ -202,34 +210,25 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 			else if (periodic_training_update)
 				__WEIGHTED_UPDATE_PTFV(idx, cval);
 
-			if (dvfs_update || periodic_training_update) {
-				tdel = next->current_dram_clktree[idx] -
-						__MOVAVG_AC(next, idx);
-				tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-				if (tmdel > adel)
-					adel = tmdel;
-
-				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-				    next->tree_margin)
-					next->current_dram_clktree[idx] =
-						__MOVAVG_AC(next, idx);
-			}
+			if (dvfs_update || periodic_training_update)
+				over |= tegra210_emc_compare_update_delay(next,
+							__MOVAVG_AC(next, idx), idx);
 		}
 	}
 
-	return adel;
+	return over;
 }
 
-static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
-					 struct tegra210_emc_timing *last,
-					 struct tegra210_emc_timing *next)
+static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
+					  struct tegra210_emc_timing *last,
+					  struct tegra210_emc_timing *next)
 {
 #define __COPY_EMA(nt, lt, dev)						\
 	({ __MOVAVG(nt, dev) = __MOVAVG(lt, dev) *			\
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
-	u32 i, adel = 0, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 i, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	bool over = false;
 	u32 idx;
 
 	if (!next->periodic_training)
@@ -253,23 +252,23 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 
 			for (i = 0; i < samples; i++) {
 				/* Generate next sample of data. */
-				adel = update_clock_tree_delay(emc, DVFS_PT1);
+				update_clock_tree_delay(emc, DVFS_PT1);
 			}
 		}
 
 		/* Do the division part of the moving average */
-		adel = update_clock_tree_delay(emc, DVFS_UPDATE);
+		over = update_clock_tree_delay(emc, DVFS_UPDATE);
 	}
 
 	if (type == PERIODIC_TRAINING_SEQUENCE)
-		adel = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
+		over = update_clock_tree_delay(emc, PERIODIC_TRAINING_UPDATE);
 
-	return adel;
+	return over;
 }
 
 static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 {
-	u32 emc_cfg, emc_cfg_o, emc_cfg_update, del, value;
+	u32 emc_cfg, emc_cfg_o, emc_cfg_update, value;
 	static const u32 list[] = {
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0,
 		EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1,
@@ -327,15 +326,12 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 		 * 4. Check delta wrt previous values (save value if margin
 		 *    exceeds what is set in table).
 		 */
-		del = periodic_compensation_handler(emc,
-						    PERIODIC_TRAINING_SEQUENCE,
-						    last, last);
-
+		if (periodic_compensation_handler(emc, PERIODIC_TRAINING_SEQUENCE,
+						  last, last)) {
 		/*
 		 * 5. Apply compensation w.r.t. trained values (if clock tree
 		 *    has drifted more than the set margin).
 		 */
-		if (last->tree_margin < ((del * 128 * (last->rate / 1000)) / 1000000)) {
 			for (i = 0; i < items; i++) {
 				value = tegra210_emc_compensate(last, list[i]);
 				emc_dbg(emc, EMA_WRITES, "0x%08x <= 0x%08x\n",
@@ -516,11 +512,7 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 						     EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK,
 						     0);
 
-		value = periodic_compensation_handler(emc, DVFS_SEQUENCE, fake,
-						      next);
-		value = (value * 128 * next->rate / 1000) / 1000000;
-
-		if (next->periodic_training && value > next->tree_margin)
+		if (periodic_compensation_handler(emc, DVFS_SEQUENCE, fake, next))
 			compensate_trimmer_applicable = true;
 	}
 
-- 
2.44.0

