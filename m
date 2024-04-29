Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246F3C47D
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386000; cv=none; b=VDaJdvTmOCdJoQtj54Rd0rM0cTPPlvUBT383H2bk9p8796wRwqITGRF+t1q050FqHnRJqUPDuBPheTTlrCArPqGcXKiI3AGqoDNFkGcXJIoTwWkV6XZXkjmrkCWl0NbHc2pnaZxzTDDEs+oZcJMKGlpdHh/9DRip47jEsyJFLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386000; c=relaxed/simple;
	bh=1kHS9gTW/vdKQ2DSJwOxFgkLLlmgZhfycPn9RQZXnlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWGd3+XGyO2ryzZpNkUp2NiXxvxSjQRy5oev43lhVTbhj5wBsVFr2JGRdh7oruJEHkJoC3FAXs+/alR18FqDPqc9zCqkhyX0HbJSwdcZNLfrSH3SKtoY7CzjEgG94uU2J6YAQC431GLzgq48BRnFU5fxVDftGtagJjKNWi+lf7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=tXRPVPjr; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="tXRPVPjr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AB836600025E;
	Mon, 29 Apr 2024 11:19:50 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id yv5Wihi5Sl7A; Mon, 29 Apr 2024 11:19:48 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6B28A6001437;
	Mon, 29 Apr 2024 11:19:48 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1714385988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dip9csTyctnK0Q6ZQrAI1DDImEQn17t4I8e7cMVHbzE=;
	b=tXRPVPjrQYf8UdhXFOUOT9pVAn1pst5eMiP+rqQcqJJxjNQlwc3nlwkPpqmU+QsDnI2FO9
	pV66ErVU9rPAQC2RBpjz9yV+dOn2l4sz2Bce8umNSrlCfOzzLGHIBtl/vYz6LQRT9PYq51
	0DGg+kB71EK/4NcMTR0GUjDp9+b22o8=
Received: from diogo-gram.BROTERIALX.local (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4B958360084;
	Mon, 29 Apr 2024 11:19:48 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v3 3/7] memory: tegra: Reword and correct comments
Date: Mon, 29 Apr 2024 11:19:26 +0100
Message-ID: <20240429101933.11500-4-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240429101933.11500-1-diogo.ivo@tecnico.ulisboa.pt>
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
index a3525f3b8145..a9e19dfa9856 100644
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

