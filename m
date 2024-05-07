Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB514EC66;
	Tue,  7 May 2024 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074295; cv=none; b=MYFlwBxVpolWK9U+wQoe6SWcM11yk5ws86qXMGRla5D8mBeMl4JwN1qUfXP5IKePslN2pxdS5A4cf10UenywJ9tdCySSncsP/1CLEny4dVxK6Z8ldTnWGgbgnlQsrPjlJe4pPHK6SrpiRoxq9M28KK3YqUK11CLOQzroaADgBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074295; c=relaxed/simple;
	bh=h3B/iHxIiuZ20yNInGM3iS/oSRk0sH2ZyDs3SZSjg5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dITApHKoUAWCs0B5pveCMdjhtOLdjioIIADyOvU3v90BghMgCNPcqrVGlyc9iXW2jepwXtonGDQ/S4RJgHmPL+YW7mmSqacmVKpGubE3LcmTr2AZjRGRzc5RQ6/ECBrUbKqMUzCSjwd7dyX/LfUQI0ybC04n93FDQxaY3+91Pbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=UFwrUml0; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="UFwrUml0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9854960022FE;
	Tue,  7 May 2024 10:31:28 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ouCQ_8kLqxmO; Tue,  7 May 2024 10:31:26 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3A62B60022F5;
	Tue,  7 May 2024 10:31:26 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715074286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVadnsK4bFte+vfSQ0rGftLRVFRW5Se0kh1kqTWlCPw=;
	b=UFwrUml0t0iS6QmwwE+Wc2wcfMMHcESlNII26ZEnf7hGcjoRTIb0RkdL9lz42eGAOY4cBC
	zlams1mbF504MTidUdR4N2ufHg3uz4ZnX2NfEYS59NQ14xVE8v2HPTnz+QRKe4GNl4uceP
	49TdxHti2N9fgkWqBPO1Bg+MBUSiN0E=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1D2BB36009A;
	Tue,  7 May 2024 10:31:26 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH RESEND v3 2/7] memory: tegra: Move DQSOSC measurement to common place
Date: Tue,  7 May 2024 10:30:45 +0100
Message-ID: <20240507093056.3921-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240507093056.3921-1-diogo.ivo@tecnico.ulisboa.pt>
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

