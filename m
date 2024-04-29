Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23A3FBAE
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386004; cv=none; b=IIRYIK/D0KMj64o24OcbsXSFaiBcfkSaPnpxdM+vbM6U3QyiMlNPrFmQzjygCuodt2BAKxJugvSzC0iebFAazmJA17DA+JqNAAxphg18Oogb/+v5NIXJUx+79O/5K2b1k1mQhTJhPwri2tg2CYq91oiNLmLzpTI29KzfignIW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386004; c=relaxed/simple;
	bh=vpBqM8bJvUUkYE6+NxJnmOGo7c+ugEfWVYOW2LYnaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfrMi70NiRR9LkHho7Oi7pvB9AuqAr8wPLNz1JaSQJ9gTlFSTvfddVW82HV0rmFT7U10nLjHNZyQyAhX6ssJA5D1E7/N4NXVl2Kr93zrDRSJKV311SKHeNbZIFD4xTBJJR3JGoJymPKDKV+mwB5o4NoJYXTMcH4vKv6yPeyx9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=ZF8VYEih; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="ZF8VYEih"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B0AA560020CB;
	Mon, 29 Apr 2024 11:19:51 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id tL9Nfm7DeRWf; Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6C2EF6001422;
	Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xdOoT37gzO+Vg7wLp5u2Bjs5YPRQqIugNsS8h8uC0rI=;
	b=ZF8VYEihMeJstosZEoACWIj4mXK0fseyuJLCVAArC4wdWopw4QsWR0uKhlUNMX29cFR2l9
	GoGwB3N86XqMAq5GAZNOXcOwMERl8eRcs2lLDjThNGoeW+hp7AOS7BCPsJfUQ0nt/e7dwQ
	l5/XFwycuqGx/ixyo6sM269qTIas+I8=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4D094360085;
	Mon, 29 Apr 2024 11:19:49 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 5/7] memory: tegra: Loop update_clock_tree_delay()
Date: Mon, 29 Apr 2024 11:19:28 +0100
Message-ID: <20240429101933.11500-6-diogo.ivo@tecnico.ulisboa.pt>
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

As the current form of this function in a completely unrolled loop
over the RAM channels roll it up two levels to improve readability.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 322 ++++--------------
 1 file changed, 67 insertions(+), 255 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index bfb01918270e..9262da658189 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -125,7 +125,7 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 	bool dvfs_pt1 = type == DVFS_PT1;
 	u32 temp[2][2], value, delay_us;
 	unsigned long cval = 0;
-	unsigned int i;
+	unsigned int c, d, idx;
 
 	if (dvfs_pt1 || periodic_training_update) {
 		delay_us = tegra210_emc_actual_osc_clocks(last->run_clocks);
@@ -136,276 +136,88 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 		udelay(delay_us);
 	}
 
-	/*
-	 * Dev0 MSB.
-	 */
-	if (dvfs_pt1 || periodic_training_update) {
-		value = tegra210_emc_mrr_read(emc, 2, 19);
-
-		for (i = 0; i < emc->num_channels; i++) {
-			temp[i][0] = (value & 0x00ff) << 8;
-			temp[i][1] = (value & 0xff00) << 0;
-			value >>= 16;
-		}
-
-		/*
-		 * Dev0 LSB.
-		 */
-		value = tegra210_emc_mrr_read(emc, 2, 18);
-
-		for (i = 0; i < emc->num_channels; i++) {
-			temp[i][0] |= (value & 0x00ff) >> 0;
-			temp[i][1] |= (value & 0xff00) >> 8;
-			value >>= 16;
-		}
-	}
-
-	if (dvfs_pt1 || periodic_training_update) {
-		cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		cval *= 1000000;
-		cval /= last_timing_rate_mhz * 2 * temp[0][0];
-	}
-
-	if (dvfs_pt1)
-		__INCREMENT_PTFV(C0D0U0, cval);
-	else if (dvfs_update)
-		__AVERAGE_PTFV(C0D0U0);
-	else if (periodic_training_update)
-		__WEIGHTED_UPDATE_PTFV(C0D0U0, cval);
-
-	if (dvfs_update || periodic_training_update) {
-		tdel = next->current_dram_clktree[C0D0U0] -
-				__MOVAVG_AC(next, C0D0U0);
-		tmdel = (tdel < 0) ? -1 * tdel : tdel;
-		adel = tmdel;
-
-		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-		    next->tree_margin)
-			next->current_dram_clktree[C0D0U0] =
-				__MOVAVG_AC(next, C0D0U0);
-	}
-
-	if (dvfs_pt1 || periodic_training_update) {
-		cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		cval *= 1000000;
-		cval /= last_timing_rate_mhz * 2 * temp[0][1];
-	}
-
-	if (dvfs_pt1)
-		__INCREMENT_PTFV(C0D0U1, cval);
-	else if (dvfs_update)
-		__AVERAGE_PTFV(C0D0U1);
-	else if (periodic_training_update)
-		__WEIGHTED_UPDATE_PTFV(C0D0U1, cval);
-
-	if (dvfs_update || periodic_training_update) {
-		tdel = next->current_dram_clktree[C0D0U1] -
-				__MOVAVG_AC(next, C0D0U1);
-		tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-		if (tmdel > adel)
-			adel = tmdel;
-
-		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-		    next->tree_margin)
-			next->current_dram_clktree[C0D0U1] =
-				__MOVAVG_AC(next, C0D0U1);
-	}
-
-	if (emc->num_channels > 1) {
-		if (dvfs_pt1 || periodic_training_update) {
-			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-			cval *= 1000000;
-			cval /= last_timing_rate_mhz * 2 * temp[1][0];
-		}
-
-		if (dvfs_pt1)
-			__INCREMENT_PTFV(C1D0U0, cval);
-		else if (dvfs_update)
-			__AVERAGE_PTFV(C1D0U0);
-		else if (periodic_training_update)
-			__WEIGHTED_UPDATE_PTFV(C1D0U0, cval);
-
-		if (dvfs_update || periodic_training_update) {
-			tdel = next->current_dram_clktree[C1D0U0] -
-					__MOVAVG_AC(next, C1D0U0);
-			tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-			if (tmdel > adel)
-				adel = tmdel;
-
-			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-			    next->tree_margin)
-				next->current_dram_clktree[C1D0U0] =
-					__MOVAVG_AC(next, C1D0U0);
-		}
-
+	for (d = 0; d < emc->num_devices; d++) {
 		if (dvfs_pt1 || periodic_training_update) {
-			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-			cval *= 1000000;
-			cval /= last_timing_rate_mhz * 2 * temp[1][1];
-		}
-
-		if (dvfs_pt1)
-			__INCREMENT_PTFV(C1D0U1, cval);
-		else if (dvfs_update)
-			__AVERAGE_PTFV(C1D0U1);
-		else if (periodic_training_update)
-			__WEIGHTED_UPDATE_PTFV(C1D0U1, cval);
-
-		if (dvfs_update || periodic_training_update) {
-			tdel = next->current_dram_clktree[C1D0U1] -
-					__MOVAVG_AC(next, C1D0U1);
-			tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-			if (tmdel > adel)
-				adel = tmdel;
+			/* Dev[d] MSB */
+			value = tegra210_emc_mrr_read(emc, 2 - d, 19);
 
-			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-			    next->tree_margin)
-				next->current_dram_clktree[C1D0U1] =
-					__MOVAVG_AC(next, C1D0U1);
-		}
-	}
-
-	if (emc->num_devices < 2)
-		goto done;
-
-	/*
-	 * Dev1 MSB.
-	 */
-	if (dvfs_pt1 || periodic_training_update) {
-		value = tegra210_emc_mrr_read(emc, 1, 19);
-
-		for (i = 0; i < emc->num_channels; i++) {
-			temp[i][0] = (value & 0x00ff) << 8;
-			temp[i][1] = (value & 0xff00) << 0;
-			value >>= 16;
-		}
-
-		/*
-		 * Dev1 LSB.
-		 */
-		value = tegra210_emc_mrr_read(emc, 1, 18);
-
-		for (i = 0; i < emc->num_channels; i++) {
-			temp[i][0] |= (value & 0x00ff) >> 0;
-			temp[i][1] |= (value & 0xff00) >> 8;
-			value >>= 16;
-		}
-	}
-
-	if (dvfs_pt1 || periodic_training_update) {
-		cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		cval *= 1000000;
-		cval /= last_timing_rate_mhz * 2 * temp[0][0];
-	}
-
-	if (dvfs_pt1)
-		__INCREMENT_PTFV(C0D1U0, cval);
-	else if (dvfs_update)
-		__AVERAGE_PTFV(C0D1U0);
-	else if (periodic_training_update)
-		__WEIGHTED_UPDATE_PTFV(C0D1U0, cval);
-
-	if (dvfs_update || periodic_training_update) {
-		tdel = next->current_dram_clktree[C0D1U0] -
-				__MOVAVG_AC(next, C0D1U0);
-		tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-		if (tmdel > adel)
-			adel = tmdel;
-
-		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-		    next->tree_margin)
-			next->current_dram_clktree[C0D1U0] =
-				__MOVAVG_AC(next, C0D1U0);
-	}
+			for (c = 0; c < emc->num_channels; c++) {
+				temp[c][0] = (value & 0x00ff) << 8;
+				temp[c][1] = (value & 0xff00) << 0;
+				value >>= 16;
+			}
 
-	if (dvfs_pt1 || periodic_training_update) {
-		cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		cval *= 1000000;
-		cval /= last_timing_rate_mhz * 2 * temp[0][1];
-	}
+			/* Dev[d] LSB */
+			value = tegra210_emc_mrr_read(emc, 2 - d, 18);
 
-	if (dvfs_pt1)
-		__INCREMENT_PTFV(C0D1U1, cval);
-	else if (dvfs_update)
-		__AVERAGE_PTFV(C0D1U1);
-	else if (periodic_training_update)
-		__WEIGHTED_UPDATE_PTFV(C0D1U1, cval);
-
-	if (dvfs_update || periodic_training_update) {
-		tdel = next->current_dram_clktree[C0D1U1] -
-				__MOVAVG_AC(next, C0D1U1);
-		tmdel = (tdel < 0) ? -1 * tdel : tdel;
-
-		if (tmdel > adel)
-			adel = tmdel;
-
-		if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-		    next->tree_margin)
-			next->current_dram_clktree[C0D1U1] =
-				__MOVAVG_AC(next, C0D1U1);
-	}
-
-	if (emc->num_channels > 1) {
-		if (dvfs_pt1 || periodic_training_update) {
-			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-			cval *= 1000000;
-			cval /= last_timing_rate_mhz * 2 * temp[1][0];
+			for (c = 0; c < emc->num_channels; c++) {
+				temp[c][0] |= (value & 0x00ff) >> 0;
+				temp[c][1] |= (value & 0xff00) >> 8;
+				value >>= 16;
+			}
 		}
 
-		if (dvfs_pt1)
-			__INCREMENT_PTFV(C1D1U0, cval);
-		else if (dvfs_update)
-			__AVERAGE_PTFV(C1D1U0);
-		else if (periodic_training_update)
-			__WEIGHTED_UPDATE_PTFV(C1D1U0, cval);
+		for (c = 0; c < emc->num_channels; c++) {
+			/* C[c]D[d]U[0] */
+			idx = c * 4 + d * 2;
 
-		if (dvfs_update || periodic_training_update) {
-			tdel = next->current_dram_clktree[C1D1U0] -
-					__MOVAVG_AC(next, C1D1U0);
-			tmdel = (tdel < 0) ? -1 * tdel : tdel;
+			if (dvfs_pt1 || periodic_training_update) {
+				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
+				cval *= 1000000;
+				cval /= last_timing_rate_mhz * 2 * temp[c][0];
+			}
 
-			if (tmdel > adel)
+			if (dvfs_pt1)
+				__INCREMENT_PTFV(idx, cval);
+			else if (dvfs_update)
+				__AVERAGE_PTFV(idx);
+			else if (periodic_training_update)
+				__WEIGHTED_UPDATE_PTFV(idx, cval);
+
+			if (dvfs_update || periodic_training_update) {
+				tdel = next->current_dram_clktree[idx] -
+						__MOVAVG_AC(next, idx);
+				tmdel = (tdel < 0) ? -1 * tdel : tdel;
 				adel = tmdel;
 
-			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-			    next->tree_margin)
-				next->current_dram_clktree[C1D1U0] =
-					__MOVAVG_AC(next, C1D1U0);
-		}
-
-		if (dvfs_pt1 || periodic_training_update) {
-			cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
-			cval *= 1000000;
-			cval /= last_timing_rate_mhz * 2 * temp[1][1];
-		}
-
-		if (dvfs_pt1)
-			__INCREMENT_PTFV(C1D1U1, cval);
-		else if (dvfs_update)
-			__AVERAGE_PTFV(C1D1U1);
-		else if (periodic_training_update)
-			__WEIGHTED_UPDATE_PTFV(C1D1U1, cval);
+				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+				    next->tree_margin)
+					next->current_dram_clktree[idx] =
+						__MOVAVG_AC(next, idx);
+			}
 
-		if (dvfs_update || periodic_training_update) {
-			tdel = next->current_dram_clktree[C1D1U1] -
-					__MOVAVG_AC(next, C1D1U1);
-			tmdel = (tdel < 0) ? -1 * tdel : tdel;
+			/* C[c]D[d]U[1] */
+			idx++;
 
-			if (tmdel > adel)
-				adel = tmdel;
+			if (dvfs_pt1 || periodic_training_update) {
+				cval = tegra210_emc_actual_osc_clocks(last->run_clocks);
+				cval *= 1000000;
+				cval /= last_timing_rate_mhz * 2 * temp[c][1];
+			}
 
-			if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
-			    next->tree_margin)
-				next->current_dram_clktree[C1D1U1] =
-					__MOVAVG_AC(next, C1D1U1);
+			if (dvfs_pt1)
+				__INCREMENT_PTFV(idx, cval);
+			else if (dvfs_update)
+				__AVERAGE_PTFV(idx);
+			else if (periodic_training_update)
+				__WEIGHTED_UPDATE_PTFV(idx, cval);
+
+			if (dvfs_update || periodic_training_update) {
+				tdel = next->current_dram_clktree[idx] -
+						__MOVAVG_AC(next, idx);
+				tmdel = (tdel < 0) ? -1 * tdel : tdel;
+
+				if (tmdel > adel)
+					adel = tmdel;
+
+				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
+				    next->tree_margin)
+					next->current_dram_clktree[idx] =
+						__MOVAVG_AC(next, idx);
+			}
 		}
 	}
 
-done:
 	return adel;
 }
 
-- 
2.44.0

