Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E780BE7
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712656619; cv=none; b=Wx1Pf5rdnek0h0VA7D8ry2mB9xImimvHZ0l/ooV2ghrykFXolj8kcnBtdiZVm5tfqRh68AFXwv+7hqFzBDIi8NN83Xiu++wTe4wLFHFal67WBXgJ61Cn8VjVggSE9V+Pgrp8xmor3PPj8NlLMe0Jxst5pcXE+QYBJlSTRvhcbtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712656619; c=relaxed/simple;
	bh=8NWOjYXGp6F23bnbuyT6TToyFdLWl5EDECnzDwdXpzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcTIAEBzdhQ/LRYiwQLZpQVG+lg7leaNoSTZ9klfNLtKe4y45o4cT1kfPDZbBo7ZFb+yNd8+C0Ovd2Df9iMrnXczhgc8dfXyDcxEh5gT/7j785cqG0yT2T+MZHeglHwR02rhdKDtJMmHvvavSf9A+GzYgJyqhaFkEXmbfSeQDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=CJjbHNSX; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="CJjbHNSX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3366760022F1;
	Tue,  9 Apr 2024 10:46:51 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id PJF5D6lRUKaL; Tue,  9 Apr 2024 10:46:49 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id EAF5660022E7;
	Tue,  9 Apr 2024 10:46:48 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1712656009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXA9O7J9Jra2JDryhxVIZp4cb5+WzCWkGEEda/NoRLw=;
	b=CJjbHNSX3iHC/6jHB8sQsXYClwgaWYNFAnsGoVSdz764efu3F4nF8A/hcriRjP1Xb6E5f9
	w+SQYlIjB96Jw48Ca2HR6+MsFdqlOFMd5mqWHUz+tshhhkP9FbVExJnh2lWeD4LWARwuCZ
	lBNW6rjSgD3+/e0QqeXKbpBuvmQgwLc=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CCB9C360083;
	Tue,  9 Apr 2024 10:46:48 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 3/7] memory: tegra: Reword and correct comments
Date: Tue,  9 Apr 2024 10:46:26 +0100
Message-ID: <20240409094632.62916-4-diogo.ivo@tecnico.ulisboa.pt>
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

Fix incorrect comment on periodic_compensation_handler() as the call
update_clock_tree_delay() with DVFS_UPDATE is responsible for dividing
the samples accumulated up to that point and comparing the computed
values with the currently programmed ones. While at it fix the
indentation of a nearby comment.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 15048f542367..a80c3b575612 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -451,18 +451,12 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 			__MOVAVG(next, C1D1U1) = 0;
 
 			for (i = 0; i < samples; i++) {
-				/*
-				 * Generate next sample of data.
-				 */
+				/* Generate next sample of data. */
 				adel = update_clock_tree_delay(emc, DVFS_PT1);
 			}
 		}
 
-		/*
-		 * Seems like it should be part of the
-		 * 'if (last_timing->periodic_training)' conditional
-		 * since is already done for the else clause.
-		 */
+		/* Do the division part of the moving average */
 		adel = update_clock_tree_delay(emc, DVFS_UPDATE);
 	}
 
-- 
2.44.0

