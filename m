Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1771ACE61;
	Thu,  4 Jul 2024 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092716; cv=none; b=t9hMOGRRTgcnqM/mimwkmxz/QZCRchAedLRI2/KCaxzVn+RsvrIMTBTjjmI7P1vfIApdZJ7KTK77T3dfd0/vtDQKZnd7Pw4NCyHxx9hYJX96WMuh5GZLe+6jlgvX1jl0x7DdVazgI5A3IDpwHYF/Je63X6PM4sSVhojkCMSwryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092716; c=relaxed/simple;
	bh=bQEGDdoI+NjnJMt3qiyjwS6JKLzg2rKDWTES38rPr/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDtzjyreCTf0si2uQYFTE3FdHfYoh2uo+z9isY88GD4Asqea0twGxqhddPtHU5tTvsCW/OCFf+fjMjBUWOYjIMaF3U9PczEooa9sDSBK9lbqxcOSnjtjAW1c+pzMy+feYzHqmxom527er+RhwEWZGGfkT/FcflkBo4yvLv02ymE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=kYUfYxKk; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="kYUfYxKk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E77B4600343C;
	Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id j68jFvNV-Zbv; Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 75937600302B;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B4pqU+vcs49UxkLt0f5sUpPUWXXWq/UNCF0pqUTLM7Q=;
	b=kYUfYxKk3lNf89+BCJ2QaynzVWm5ZH0iskIonWhBvcO7ZMsH2n5gAabal0XDaWAGp+e7kq
	sYvtr7+MJfxOIs12nCHNyEup2249fdUYtUK6ZkAoAbACi9V0HRliLW2iZogsrOpeF2ghzs
	LC9eqRfrFGjgnFMJwH6MqdNTJCVlIgc=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 5BF873600D6;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:25 +0100
Subject: [PATCH v4 6/7] memory: tegra: Move compare/update current delay
 values to a function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-6-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=6345;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=bQEGDdoI+NjnJMt3qiyjwS6JKLzg2rKDWTES38rPr/0=;
 b=b/3OqKGN3ea2S2QH/ajIQJhkkZ7fj6Oet7SHnugEVZqhaaTkvGueRwmBvi44nSolIqCpQMQrV
 XBFeSqu9qGsAZtTHSlzy6vg10aKF142BklhyyzjrHaWWXyjjlAufOMg
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Separate the comparison/updating of the measured delay values with the
values currently programmed into a separate function to simplify the
code.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 86 ++++++++++++---------------
 1 file changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 9262da658189..a8a217502f0c 100644
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
 	u32 temp[2][2], value, delay_us;
 	unsigned long cval = 0;
 	unsigned int c, d, idx;
+	bool over = false;
 
 	if (dvfs_pt1 || periodic_training_update) {
 		delay_us = tegra210_emc_actual_osc_clocks(last->run_clocks);
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
2.45.2

