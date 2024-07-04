Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CA21ACE7B;
	Thu,  4 Jul 2024 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092717; cv=none; b=UmsSjJ8X8K5dd7tqLLjijD8KfCmt/fve7Bd8806Omr0amnpd1UuYZjmGMO3l/A15sumghcq4YLHfMGbV83Ui9C4odXP32cD1ZmUM14NI0q/WIpDSnw0y6BnBKCzvP+E2BLOfnWj7pKvBZnR4hDGNui1pqblaw78ytNF6wb/MtgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092717; c=relaxed/simple;
	bh=g+KvgiUFmd9xrj0l0ct8gTjWVRQg4/KONtBXm9V0EdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVwO0zGd1rc9r1l7YXwJ16D44RiXPFzZCVV2y9CY0e97dhQzTBeXt9BBT+tTlJtnwFx0B5jq8uCUN5uHS45NIAI1ShNduB8YV0KH07a+yU7raAZbwwTNlOdEBMhCbazonz5J+AaDSdXv8KYYXTVtqtkh9h5wOKeeOcafXVXWyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=kZ/id+70; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="kZ/id+70"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id C1306600343E;
	Thu,  4 Jul 2024 12:31:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id qh4uRhew_bJI; Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 880216003033;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWBSr6K46TszUgTWhsBBw0C5K5wULzSObaPjEDgFPvs=;
	b=kZ/id+70Pb2mbGTBpouRTHmBdeEDGnijD+J0ZumLNrvII0UF5div6XACsjSVXubMH+9z0R
	pHPEj0oO3n6GH7DEp767LV20LAr8rmju23jnwCV2hgW6mDEle/+IOEWwLFygiAYm624HjS
	VWu1MnrQI9prbDrdlYPrKOtH5zyCOxk=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6B4E03600D3;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:26 +0100
Subject: [PATCH v4 7/7] memory: tegra: Rework update_clock_tree_delay()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-7-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=6209;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=g+KvgiUFmd9xrj0l0ct8gTjWVRQg4/KONtBXm9V0EdM=;
 b=o3h1BP1nd1LimKWsCKyCJHCy8F6a2OxrF5lvQgCYApWu3yxhYXFs+kPO4/QIJAVGkfwGTVOMb
 VgkMa7kMm1XBc3iOhietfWvBdlOUUiSMVSPo5SAIv2eY/hXogdGeocE
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Further streamline this function by moving the delay post-processing
to the callers, leaving it only with the task of returning the measured
delay values.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 122 ++++++++++----------------
 1 file changed, 48 insertions(+), 74 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index a8a217502f0c..a30a646ec468 100644
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
 
@@ -130,93 +130,53 @@ static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing
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
+				delay[idx] = (clocks * 1000000) /
+					     (rate_mhz * 2 * dqsosc);
 
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
+				delay[idx] = (clocks * 1000000) /
+					     (rate_mhz * 2 * dqsosc);
 
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
@@ -228,8 +188,8 @@ static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 	u32 i, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 delay[DRAM_CLKTREE_NUM], idx;
 	bool over = false;
-	u32 idx;
 
 	if (!next->periodic_training)
 		return 0;
@@ -252,16 +212,30 @@ static bool periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 
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
2.45.2

