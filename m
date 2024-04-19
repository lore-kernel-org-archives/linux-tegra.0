Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A07F489
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523540; cv=none; b=kNdeCEqiyQ0pxJ5FO+lTzmENnD4nhqYJfkuMjPG8wCy9AoReq4GE5u/HcqqDEEQmf8p0oTD+tnfAk28LxOpOgFQKQ9HWZlTPzZkB0KEw1m926nIasfLf+ZFCzvflyzFerozVnoiY0Zrqn7hDgXsy9YD6xaN5j1tNlQcwRnsQfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523540; c=relaxed/simple;
	bh=t174l/JpglhdMqyxF2apqNtKKKLEEIMQBAahDOBGZys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtmuWYRsYQeYSn77kZWm52CS6Erbn7a2gbH2BaeFnxkodNz6uTh+uUPjbW+JL+N/e/X2NYBZDI6jRWTQrHsr70ZkZpz8eZVEHugHxJyXToUiYnrlXAKsTt+wRpp75q0FYrco/BufSmLXyzqhslYiZFs6RCPxJEtKvMJ6MrzW6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=uBzVSt7T; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="uBzVSt7T"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B2CEC600541F;
	Fri, 19 Apr 2024 11:45:29 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id xSPzxxZdWRZb; Fri, 19 Apr 2024 11:45:27 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6074E600480B;
	Fri, 19 Apr 2024 11:45:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ5O89eTRxRXpUWL9Uwb+NLYgnko83YKIOLFy2ST9vU=;
	b=uBzVSt7T3XsNVpmofO5b+OLHnB9cWqlb7AyGU6czTtMUpYjrhkwSFKHh478BmYqETfIhQR
	uKEWqEdACJtMBRf8Qiz8wzQ+Wxj4zsUvmSDfcuTtRW/ltdAdtehpP+jliXSrXvokvNIDdd
	v05tdFPXVjnTnBlk6IWCvEswLlCLiAA=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 414443600B1;
	Fri, 19 Apr 2024 11:45:25 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 2/7] memory: tegra: Move DQSOSC measurement to common place
Date: Fri, 19 Apr 2024 11:45:10 +0100
Message-ID: <20240419104516.308975-3-diogo.ivo@tecnico.ulisboa.pt>
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

Move the calls that instruct the RAM to capture its clock tree delays
to update_clock_tree_delay() in order to avoid code duplication.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 9ec49ced8f91..15048f542367 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -123,10 +123,19 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 	bool dvfs_update = type == DVFS_UPDATE;
 	s32 tdel = 0, tmdel = 0, adel = 0;
 	bool dvfs_pt1 = type == DVFS_PT1;
+	u32 temp[2][2], value, udelay;
 	unsigned long cval = 0;
-	u32 temp[2][2], value;
 	unsigned int i;
 
+	if (dvfs_pt1 || periodic_training_update) {
+		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
+		udelay *= 1000;
+		udelay = 2 + (udelay / last->rate);
+
+		tegra210_emc_start_periodic_compensation(emc);
+		udelay(udelay);
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

