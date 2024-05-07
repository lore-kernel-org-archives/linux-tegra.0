Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4C414E2D6;
	Tue,  7 May 2024 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074295; cv=none; b=mgM2AYE/z6C7X9EZevue8VSXGgBB20AB7iI1j+nf1lliGSbt1+bEUEAzJPtXriM7cxbNqYV7kDI49WDneKZj5eilvzSp/GDK+0TJVO6MJY7BXFtEDJiE4/QdZlj1TsDUI1/pdhYUJ/O7KvphfsmgOuIzf5Xl8v3AYkPD76YfYbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074295; c=relaxed/simple;
	bh=48e42rpGIqwsnSPcGfLXH8Uv/Hunfs2kOG892nNEFxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t80znlpjVa32rFXlLgdvPM+AhhMNBhorJboqN5RwUr4QKmDCcF6QwAcKk0FvL7klAKO+96jBov4F8EllAse8lZqgep/uLKxmqMk72Ri5b9qnNQgV10+NsODAG9R9xRbkSCtkFH+2cieVXjJuwzb7izweBqKY4JczBTiMpffXcjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=m0r46sYK; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="m0r46sYK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5DE006002302;
	Tue,  7 May 2024 10:31:23 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id drv6Q-3o4uEE; Tue,  7 May 2024 10:31:21 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 1075160022E7;
	Tue,  7 May 2024 10:31:21 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715074281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOWi5Kvsv8Ir9mYtzX4oMt7r57mv1EqWeeYXt47rh9o=;
	b=m0r46sYK8qJhHlKWTRO0EHzlzgjlduNmOyMUrfMUkF4TdUxoZ/yiOAru0/NVqx1xtJHXMf
	Kze6vzHu/7i5HeBQ5rlTEdnsUfJjU0uXM62Uf9vmnaBELQneJ/ZzYFJSheb3TO786TvH+O
	JFEBPC5kjTntFslvrT8aXrCbr3h955g=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E4A8036006F;
	Tue,  7 May 2024 10:31:20 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH RESEND v3 1/7] memory: tegra: Remove periodic compensation duplicate calls
Date: Tue,  7 May 2024 10:30:44 +0100
Message-ID: <20240507093056.3921-2-diogo.ivo@tecnico.ulisboa.pt>
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

Prior to calling periodic_compensation_handler() the code is doing one
extra DRAM delay reading which is unnecessary as this is already done
in periodic_compensation_handler(), so remove these extra calls.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 4cb608c71ead..9ec49ced8f91 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -492,7 +492,6 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 	};
 	struct tegra210_emc_timing *last = emc->last;
 	unsigned int items = ARRAY_SIZE(list), i;
-	unsigned long delay;
 
 	if (last->periodic_training) {
 		emc_dbg(emc, PER_TRAIN, "Periodic training starting\n");
@@ -530,18 +529,9 @@ static u32 tegra210_emc_r21021_periodic_compensation(struct tegra210_emc *emc)
 		/*
 		 * 2. osc kick off - this assumes training and dvfs have set
 		 *    correct MR23.
-		 */
-		tegra210_emc_start_periodic_compensation(emc);
-
-		/*
+		 *
 		 * 3. Let dram capture its clock tree delays.
-		 */
-		delay = tegra210_emc_actual_osc_clocks(last->run_clocks);
-		delay *= 1000;
-		delay /= last->rate + 1;
-		udelay(delay);
-
-		/*
+		 *
 		 * 4. Check delta wrt previous values (save value if margin
 		 *    exceeds what is set in table).
 		 */
@@ -734,11 +724,6 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 						     EMC_EMC_STATUS_DRAM_IN_SELF_REFRESH_MASK,
 						     0);
 
-		tegra210_emc_start_periodic_compensation(emc);
-
-		delay = 1000 * tegra210_emc_actual_osc_clocks(last->run_clocks);
-		udelay((delay / last->rate) + 2);
-
 		value = periodic_compensation_handler(emc, DVFS_SEQUENCE, fake,
 						      next);
 		value = (value * 128 * next->rate / 1000) / 1000000;
-- 
2.44.0

