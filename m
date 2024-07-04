Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12C1ACE60;
	Thu,  4 Jul 2024 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092716; cv=none; b=Wn3mUhm5W0A8zjvdsSadViVflwEoflSYcXvxWW/c8BBQczFCHw0XjYRAjWQhCdfpRl44o1h5jyi8Nt2/FFQSXBC6jlppIkDDJI06eOZxB8vX90LzwrRRX+SeIS7M2V5dBR+Uio2JehxLzSYKHjzFiVif73ggdb1FVVb+yMppVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092716; c=relaxed/simple;
	bh=ptSwvTf4aqcxvxz2kptb09DlC2bH1xV5LSnAO/py5O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzK3o1mEt9Zrwx9pbHPm4UewgJLp2qaplJZ7iQkXBxA5HWpIwmOsUirmXynrj7WO1QiFPPcJfhOjiGDo7nOEYjq3tDOMNKX2JM392JZxg4ZrJVVlA17CLFaq7P9Dr5eRsJfqP2iC9hx6WBEd5dmtVkwbge6Yc9NgK9fL/TrHihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=q/xvZ1YP; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="q/xvZ1YP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id DF8E6600343B;
	Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id h0a8Lwnt59zI; Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 66F616003024;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKgHChouKr6zcNck36/TGYItM4usUQQa1eKrphemAdQ=;
	b=q/xvZ1YPb6Qq6Ky6IVoT6drXcDIUbTXIdfCv4KHA6N8fxVvlHMJPkmR4Fso0oQdakRXt1T
	xxbJFK3s9bwY9A3K07oglJOjypv0jN94iTaRjmOUDLKScK8tIuS/DrWwBzY4KbWj4TkTfB
	M9xOWnsCp7Gb8ID9dcTX4uV/u01UNMY=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 495F13600D4;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:24 +0100
Subject: [PATCH v4 5/7] memory: tegra: Loop update_clock_tree_delay()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-5-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=10608;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=ptSwvTf4aqcxvxz2kptb09DlC2bH1xV5LSnAO/py5O0=;
 b=fw1DeoEtrmKuzmNPNXAe+0aORA87N9g9X8MD38Kn0QCdliU/gpCTEtFLy2e9Bcd9SaUZjHCJ/
 mz8U2lkjGWTALqrObR8HNvvUEoXUbTS/Gk9EGhn6pOqnMRjkuo8tMoI
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

As the current form of this function in a completely unrolled loop
over the RAM channels roll it up two levels to improve readability.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 322 ++++++--------------------
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
2.45.2

