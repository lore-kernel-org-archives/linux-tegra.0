Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A88084A3C
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656619; cv=none; b=m1AOHJ5ytKPL/BLjFNTACshoqNjrsWSoMQkd87TufGfnipnJ/ZBE8ezK92lOeHzggT4Ich5r/GL2b4FgVMr9/pXLdLAeHdAOZ4fQ8B2Doshd0VydNN/sfmfSXIOhAn5NIAuZtdHTT4R+xqDVqtCnDA20xecESGH6Wnn27/kvjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656619; c=relaxed/simple;
	bh=s+GurV1Ek0xBwi74b5GL/OWxz1Ldt/BDqgyVglTNnQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnfANTX1cnPo8Pg7/oveCxrlJDdJEqDzWmzKuC9Z397C1zbdSsN/fpTwICwzWyAawldEHAyFE6TJGRAw8ti4bd5m1GxgZLG02UyOBg6IGZXnUsIy1xiI3L6ozWIYPzKCcSHBJ+p+VOPiqPiXuymCmlOqxVwBycb/U/K5gqZxXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=KnAJ37x+; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="KnAJ37x+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A6B7B60022E6;
	Tue,  9 Apr 2024 10:46:51 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 5Q3MPJXnwbUu; Tue,  9 Apr 2024 10:46:49 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5A5FB60022F2;
	Tue,  9 Apr 2024 10:46:49 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1712656009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTAlR6jYbf2kRbzuM4gHPu3xBcA/ffWTOvGrbuP4xBE=;
	b=KnAJ37x+Koizjb/hwjsnhgkpHrbXWaygh1bLsZwXffaRaYBaSAVMpscE+yQTyrp2w9K7q9
	Mw8vw+gkQgFo2C6o/lK+V4sB+QymVQha6WyQRHJ6PmxxuFLE/TfixnICI/mGHCZ+564dgL
	7QMrXntV5LsVZDR7gzBDq3zEqLWImro=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3E1CA360030;
	Tue,  9 Apr 2024 10:46:49 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 4/7] memory: tegra: Change macros to interpret parameter as integer
Date: Tue,  9 Apr 2024 10:46:27 +0100
Message-ID: <20240409094632.62916-5-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
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
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index a80c3b575612..65157bd5dc24 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -75,29 +75,29 @@ enum {
  * The division portion of the average operation.
  */
 #define __AVERAGE_PTFV(dev)						\
-	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =	\
-	   next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
+	({ next->ptfv_list[dev] =					\
+	   next->ptfv_list[dev] /					\
 	   next->ptfv_list[PTFV_DVFS_SAMPLES_INDEX]; })
 
 /*
  * Convert val to fixed point and add it to the temporary average.
  */
 #define __INCREMENT_PTFV(dev, val)					\
-	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] +=	\
+	({ next->ptfv_list[dev] +=					\
 	   ((val) * MOVAVG_PRECISION_FACTOR); })
 
 /*
  * Convert a moving average back to integral form and return the value.
  */
 #define __MOVAVG_AC(timing, dev)					\
-	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
+	((timing)->ptfv_list[dev] /					\
 	 MOVAVG_PRECISION_FACTOR)
 
 /* Weighted update. */
 #define __WEIGHTED_UPDATE_PTFV(dev, nval)				\
 	do {								\
 		int w = PTFV_MOVAVG_WEIGHT_INDEX;			\
-		int dqs = PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX;		\
+		int dqs = dev;						\
 									\
 		next->ptfv_list[dqs] =					\
 			((nval * MOVAVG_PRECISION_FACTOR) +		\
@@ -111,7 +111,7 @@ enum {
 
 /* Access a particular average. */
 #define __MOVAVG(timing, dev)                      \
-	((timing)->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX])
+	((timing)->ptfv_list[dev])
 
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

