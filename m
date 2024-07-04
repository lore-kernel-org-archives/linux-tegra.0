Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF01A4F39;
	Thu,  4 Jul 2024 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092713; cv=none; b=LTLixcuCqYTvFiemzkYHD0j85hbSckYdOQ1Sfo3pXzxXt/Nm8dsiJgNXRkciyIBxcFzmCdfCK8uHITLNMrhyBhxwTSupgzexTyq/reKHTDhYoL1Q6VmCWILk+LVfYOXMBgMVDeSisjeiOFQpSwzaJuIM1AjRQFWXpOOfsTswKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092713; c=relaxed/simple;
	bh=P+VIsBaToqSuZyn3oqMxbEdInj19YTcNks4MOjE3Qlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKO0VSJ3vZtx7aM81tYAL6piXwV/O4Wt6DRC19Xps13Y7/ab3SBOXrhDEWXhPX1T2c+gBXMlZIlZbTYiry9GoGq7Bq8v/R5fWXPSnuZp5sG5/E3Svg3j/RSOdUS29zV3cQjM2xZUuz6eTbEW52+ziJcAHbKGgCpHm2QnY/Z17Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=YhxQMINW; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="YhxQMINW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AC0DF600343A;
	Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id dQGr6uxxefqS; Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 538106003021;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCb1//4WiRiDJlF8jsGZO6RUoUnT17uajxXjVw7rxFw=;
	b=YhxQMINWj0bvKlkTzJFg5ow685Ugw2fHsqQHn5vx1OIvboTrO3fhNZ+C9hh9TaNH/KcQgY
	08Bv5eKo/I3/20enM+NHFLUYHpEI/ZmKwRKJ9yHTKvcOOSCDGW5XqyYqR6CuHnZd8VF3Vv
	p+L9DEXQ91VsKscWZ9AYfcsXXVj1XMU=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 36EE73600D3;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:23 +0100
Subject: [PATCH v4 4/7] memory: tegra: Change macros to interpret parameter
 as integer
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-4-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=3449;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=P+VIsBaToqSuZyn3oqMxbEdInj19YTcNks4MOjE3Qlo=;
 b=MvFk2edALOhCM64OHDzkRNHza86+WDyIOJczMKtYmRcVJWcw3KLxXRRF+2StYnuwSrjJA/n6B
 7FFrKOvs2rZB10Tapg1Bb+gGiTebFMSYm5pQTCtBy4z0Yohd1QKmuYv
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Convert the macros that manipulate the delay values to interpret their
index parameter as an integer to allow the introduction of loops.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++++------------------
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
2.45.2

