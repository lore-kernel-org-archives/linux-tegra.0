Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DFD1946C0;
	Thu,  4 Jul 2024 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092713; cv=none; b=pHgkMpQrBIVgkK5/maji0pctMs3SQvMoSmgDqGNh7BYx6tYQrm3jZ+/zdg7EWbW8RPx7SGeSCO0qBGcRwLsEfzrMZ46w8vjg2ua0hIFoGIAFHtjKf20+2qrzez/HhqNSvJmVgpGWLI8qfojzXqRv86q1TD/QdwK9mA3LOoP0pcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092713; c=relaxed/simple;
	bh=CI423+U23IsxyiSFSw3zvfaqgjcWc651AKG92P0aInQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX+AcE/DCu7zXaH0kMenywfCFtxdiDnYP12jEZFedBrzlWuKqkclPcVtxID1e3SdY9fdFeeFXp2M4ZQXcS9U1ioH5V8f5pVfShj4j4gDiHqSDzi9Ct/NOFNSyv0nMZYL7BKni3/WZYBJVWRcA4gk0Ba2UIDjlhrTa7PGfX8JBWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=uw7J16iE; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="uw7J16iE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 99D696003431;
	Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id wIFMGN3LKGMh; Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2F6FD600300F;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JU2tfL42KVoRnHz3A4tpMpU+LCtf9qHgNx8PG7SH6AU=;
	b=uw7J16iEMviuT/QtByT9QpTp4mvzAaoqhILeGv7GfQ4cFdz5HGaHwZ4qpGC+luimOf9E4Q
	hWlp+zAvj0l9XgR1oJ8xot5AiXwHPdyZsrvdkL7UNlfeC5ZoMW/OJ5u7Vuo2t/Njrrxq+L
	DDjHdYgSNSY1YitBKkoev24zlOKvoPU=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 127843600D6;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:21 +0100
Subject: [PATCH v4 2/7] memory: tegra: Move DQSOSC measurement to common
 place
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-2-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=2349;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=CI423+U23IsxyiSFSw3zvfaqgjcWc651AKG92P0aInQ=;
 b=AzLrkKCPpGRnk35aAFGHqaFYvushJIsmhC5oOVPKuhjsUNFSlZilYer1NBaaOnHhaU3ShCfLE
 3K/nTFzlUikBDjkBFoDZOXw0ptTDYr8rQPoDbdF38No4moW7Rjtkv3o
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Move the calls that instruct the RAM to capture its clock tree delays
to update_clock_tree_delay() in order to avoid code duplication.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 25 +++++++++++--------------
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
2.45.2

