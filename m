Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688871DA30D;
	Thu,  4 Jul 2024 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092713; cv=none; b=aQWAo/9WjLC13eBWEK1nbK7BDfM0hHSMkAZbbI/ywAGjn1QWa1L3EVg2RujQuNhOUsrVWXvXt8jEzfNfA39nyiKQG6gqEH0peu42710JPRonyjnXubhoXwOCyuEbY7J+vY1oRsfogVGOE8J9G0QRMCLbdAYzPLPusIwhhmeC8SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092713; c=relaxed/simple;
	bh=9Sh3tAClsJyJKcGbDy+P6ZvkeV1elIlxANmbsLEcOjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaCehui79TqX5SLHiEabO6oLJMbTAsvVD6hGsMxNSy54MgyvMO2HAuikcKS/Ri48LO9AKHMrwlB54EtUsiG6Xrg8SdTN+6HKXk2CLfpp6WwSTcs4++URDXxyyHyZ+ERzXwCpL/ZmnAWNwcwI7pS2ymuszbmyWXJBBeUtO1bDjVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=jjGxKYR8; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="jjGxKYR8"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6BCA86003430;
	Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id qyvXNto7vnsP; Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 1CD016002C0D;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCLopPBocst09FhM/r2fltj1mn3/NPUqAr8ZWKtnZbg=;
	b=jjGxKYR8jUOY3okQCqJY9eSjhryazPVVTm6320He9Txoa4w9j2EWsbpCeVQYowLdUGGCIX
	fpyvDy6vOzr5oo8sjmR4+foVXD50++HHZdOunj6DyllsTtfsSGzKOKH41DtrgB1SSJ8OlN
	g+J3au7T2M1OS66CMrCCHGkV2u5KPLc=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id F393D3600D4;
	Thu,  4 Jul 2024 12:31:38 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:20 +0100
Subject: [PATCH v4 1/7] memory: tegra: Remove periodic compensation
 duplicate calls
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-1-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=2068;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=9Sh3tAClsJyJKcGbDy+P6ZvkeV1elIlxANmbsLEcOjE=;
 b=AD0ZaqL8Q7gWiEQXRkTfsiNcXhyEX9gCb9A7PvBXNa68vSkVti4ijjA1wgJsT+l/LLQzH9Ugp
 F9qRjw2vvQNDXokwg5Gi7s6Ye8ObC9JN8CzBTfe/GXr/D9oNfj0FasE
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

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
2.45.2

