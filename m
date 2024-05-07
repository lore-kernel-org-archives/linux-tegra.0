Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D2150991;
	Tue,  7 May 2024 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074304; cv=none; b=KDeudJEf/rJgC0MKlLCpBk+wYgSqoriWhf6+CHESXBsnKdlEKVnVDWxrQIbfM6yjDemr+xkC1mh1JhIVRhJR/ytNwi9l9KQc1agOmBLQcrVhwB+5zcUsJHG8LLmmiA3NEqT/3fpemwb6Nlsu4AmMVTU9m7cbfArg6PN9BKA5Oh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074304; c=relaxed/simple;
	bh=1kHS9gTW/vdKQ2DSJwOxFgkLLlmgZhfycPn9RQZXnlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbO0xNcKyLet6iSY30a2vi0NnRJVOfQXYc5tHzOgihhhpklN/jkA+rt2fC57whqqQvroNr0rgc66iyChoEJCM2MOFypSQI87N3wmVvZng5jhoCtjmpu0Do8OzfEQT4LymkV3qvy+EtmEZiWt3e/l1tzXSsQJT1LK4nOpwx5sOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=TAXZhgzQ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="TAXZhgzQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B2EAB60022E7;
	Tue,  7 May 2024 10:31:37 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id SJrxCwHjgeIE; Tue,  7 May 2024 10:31:35 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 77F6A60022E4;
	Tue,  7 May 2024 10:31:35 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715074295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dip9csTyctnK0Q6ZQrAI1DDImEQn17t4I8e7cMVHbzE=;
	b=TAXZhgzQ0XW3TU/M5sxw0uvVgDcMVNQrX0wAKa6RC6bzAL0YMyO09cpxDQU25FwmA47oWu
	CL+gRpKsShqM0spNfiaPK9ro5c8d/I1soKZhkfp2t6uVG3qpAHCuG6toH+v0Nv4bPVBnkd
	98E7BolArWSz8/7uTi5+bcDNbGWfN6A=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 553C236006F;
	Tue,  7 May 2024 10:31:35 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH RESEND v3 3/7] memory: tegra: Reword and correct comments
Date: Tue,  7 May 2024 10:30:46 +0100
Message-ID: <20240507093056.3921-4-diogo.ivo@tecnico.ulisboa.pt>
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

