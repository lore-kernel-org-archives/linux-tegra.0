Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F614F9EF;
	Tue,  7 May 2024 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074309; cv=none; b=p10/G9TsdT4XbVdPeZlA/kZYSCPKu4Dc3BOB+tLk8KAQapOBE8jEj2gdEKAbhpdzdAtOJvFrEctV+L+0LojlbRJ9DpLBZqcprb91LATCPVKOK2JYzIJkxa6MWbvfNXZMUJNJP00JQKEGF4tFyE+xz/MpCgZLHwmzqSAa4giC+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074309; c=relaxed/simple;
	bh=pT8kxPPIHqGP+sc4e/x8X4WNXSvEXnrh6cP/LO1XPbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OppcG1PkLcTSW4bszjoHwZkANRQWcIYsPgspQUmY5n/nixwXsZDftVDoly0flGEwhorCNvyaW8gvlHaZ9Z5LlCgTtSB6S5dG3ep5Jcl+JFb4vF0V5+yQPswduWjTYoiBKfejzBBXWFBaZkd6eApGyZikL0cgDyzLWDvuK5JmjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=ULTOLkBW; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="ULTOLkBW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 75406600025E;
	Tue,  7 May 2024 10:31:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9oV5i2l_6aNt; Tue,  7 May 2024 10:31:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2F8D260022EE;
	Tue,  7 May 2024 10:31:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715074303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgGMmPtcLVM+7hmZ90Vbsj3RW0TNyS68Jmu6nXEazTU=;
	b=ULTOLkBWiTtvoTo0uvWyvPwlNwOV/kAt7AmjdiUm/0Rm4AB3aSBxNyeDo/Mrnw/ttNC7gE
	EYekZ9dKkS4NpcVs0QLMoOvSjUTIJRmNv9daOf2T7Yc3p744lqp07i/NHQhTk8/qlfbQVk
	9AxekchKQ44WHG61MCowyaLTnSpGnOk=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 10EDE36006F;
	Tue,  7 May 2024 10:31:43 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH RESEND v3 4/7] memory: tegra: Change macros to interpret parameter as integer
Date: Tue,  7 May 2024 10:30:47 +0100
Message-ID: <20240507093056.3921-5-diogo.ivo@tecnico.ulisboa.pt>
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

Convert the macros that manipulate the delay values to interpret their
index parameter as an integer to allow the introduction of loops.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
 - Add () around dev macro parameter

 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index a9e19dfa9856..bfb01918270e 100644
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

