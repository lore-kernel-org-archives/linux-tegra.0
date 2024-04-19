Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B26B7F487
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523539; cv=none; b=XIPiHibSS1GimSDEH/f71gJk/VxZ0jR2/xcPJPwDuDKOUcA9GpYvpoIfsUlfv9SjSgno11TIrIDddIDRSL9/MVoQWSm5ZohXblLrltMIMpMFVpOMr7XNVSuw6XQWKSlR+fkg+cMAwn0hdscTDQN0odY4wHYgNYjA/mkPXoN0e5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523539; c=relaxed/simple;
	bh=VMHeHGmnHolZjsziq/DbfXEXsJJkKB5jjMirQVXM7Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3JKYsjZi0OnW9OIMkDeoR4ozbcaOkLMmGvRhMCiqpjzSqKArEnpUpE1mJEBTw+ExgALDCI4x/Iaf/uqfBw39LQt8+xcOaLWUQNkjimxbyxtFLkVUMVXAh/y5xJyb244bXN4qGhRaczhbuIexwUk2C+1+DD3x/Mhkw+lzuowsc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=hDd84dVh; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="hDd84dVh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 68A89600087F;
	Fri, 19 Apr 2024 11:45:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ITN7L9cR9Lve; Fri, 19 Apr 2024 11:45:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 24DC66005400;
	Fri, 19 Apr 2024 11:45:26 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JXpIhEcOeSVndQM8aMyPMnXbE/F7ieFH93M65KPPmI=;
	b=hDd84dVhoJe7/hq9fUslsKMoRnHL/DeUKMr1SBId7LjoOWJKzDqDJgkBjf2uTXU1bVHtr/
	O5iIOzuk+kPFqymqxcVeacoLE37xhm1MZNH4UU92Qg1UUopzv4MJqUB75dgGJ+6nQntjim
	jhhsWMFlBictniq/aM/igJJtJp9Q9YM=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 068E33600AE;
	Fri, 19 Apr 2024 11:45:26 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 4/7] memory: tegra: Change macros to interpret parameter as integer
Date: Fri, 19 Apr 2024 11:45:12 +0100
Message-ID: <20240419104516.308975-5-diogo.ivo@tecnico.ulisboa.pt>
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

Convert the macros that manipulate the delay values to interpret their
index parameter as an integer to allow the introduction of loops.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - Add () around dev macro parameter

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index a80c3b575612..4741d626556d 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -75,29 +75,29 @@ enum {
  * The division portion of the average operation.
  */
 #define __AVERAGE_PTFV(dev)						\
-	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =	\
-	   next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
+	({ next->ptfv_list[(dev)] =					\
+	   next->ptfv_list[(dev)] /					\
 	   next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 /*
  * Convert val to fixed point and add it to the temporary average.
  */
 #define __INCREMENT_PTFV(dev, val)					\
-	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] +=	\
+	({ next->ptfv_list[(dev)] +=					\
 	   ((val) * MOVAVG_PRECISION_FACTOR); })
 
 /*
  * Convert a moving average back to integral form and return the value.
  */
 #define __MOVAVG_AC(timing, dev)					\
-	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
+	((timing)->ptfv_list[(dev)] /					\
 	 MOVAVG_PRECISION_FACTOR)
 
 /* Weighted update. */
 #define __WEIGHTED_UPDATE_PTFV(dev, nval)				\
 	do {								\
 		int w = PTFV_MOVAVG_WEIGHT_INDEX;			\
-		int dqs = PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX;		\
+		int dqs = (dev);						\
 									\
 		next->ptfv_list[dqs] =					\
 			((nval * MOVAVG_PRECISION_FACTOR) +		\
@@ -111,7 +111,7 @@ enum {
 
 /* Access a particular average. */
 #define __MOVAVG(timing, dev)                      \
-	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX])
+	((timing)->ptfv_list[(dev)])
 
 static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 {
@@ -418,6 +418,7 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 	   (nt)->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 	u32 i, adel = 0, samples = next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX];
+	u32 idx;
 
 	if (!next->periodic_training)
 		return 0;
@@ -431,24 +432,12 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 			 * calibration then we can reuse the previous
 			 * frequencies EMA data.
 			 */
-			__COPY_EMA(next, last, C0D0U0);
-			__COPY_EMA(next, last, C0D0U1);
-			__COPY_EMA(next, last, C1D0U0);
-			__COPY_EMA(next, last, C1D0U1);
-			__COPY_EMA(next, last, C0D1U0);
-			__COPY_EMA(next, last, C0D1U1);
-			__COPY_EMA(next, last, C1D1U0);
-			__COPY_EMA(next, last, C1D1U1);
+			for (idx = 0; idx < DRAM_CLKTREE_NUM; idx++)
+				__COPY_EMA(next, last, idx);
 		} else {
 			/* Reset the EMA.*/
-			__MOVAVG(next, C0D0U0) = 0;
-			__MOVAVG(next, C0D0U1) = 0;
-			__MOVAVG(next, C1D0U0) = 0;
-			__MOVAVG(next, C1D0U1) = 0;
-			__MOVAVG(next, C0D1U0) = 0;
-			__MOVAVG(next, C0D1U1) = 0;
-			__MOVAVG(next, C1D1U0) = 0;
-			__MOVAVG(next, C1D1U1) = 0;
+			for (idx = 0; idx < DRAM_CLKTREE_NUM; idx++)
+				__MOVAVG(next, idx) = 0;
 
 			for (i = 0; i < samples; i++) {
 				/* Generate next sample of data. */
-- 
2.44.0

