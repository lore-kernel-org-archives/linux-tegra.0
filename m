Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9F1A4F1C;
	Thu,  4 Jul 2024 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092713; cv=none; b=C3ejoSW+kCMSBXThBAOZa/zinLUWKc7JaCKELqa8St4+Iah1i1CLwZp5G2m6+D7KKonqzFkUsPFGCiCRqui/prp1l15RZWYIe/9QHqNTtiIoiJKttDfaUDwGwvpomLauuIkKOpvY6GFFKbzyXVnxO1cHQfzyJjJKC/ljpGobwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092713; c=relaxed/simple;
	bh=NQo0bPEs1AJu1S28vtyG+gQwwEcVWxxTjFT08hacRNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSludTEo1Y3OwDsxO4rhLWgz7nSaoUEf7Quo3PNiAE0ul7CsXQrZdIZPT19bg8sXl2YTT/vIbyrP2prcv7F6bL6sEKKpS1+5eJfgnaRTQQqfeaYg9h62WRaAx4s+/2MljTZ4dqZfMkKmprG8XOGNvXwHDBapQeJBdr7rJzFUk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=txhsbLG7; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="txhsbLG7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A4CE0600022E;
	Thu,  4 Jul 2024 12:31:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 1bnyE6q80XRx; Thu,  4 Jul 2024 12:31:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 41BD7600301B;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1720092699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUPMG3xyXh7tjl0JZ8b9Zsz155NWbnXfi/GYazU1aIs=;
	b=txhsbLG7PsR8cXU3GeqDVR6Aap4svHP1O4myUKQ0gDF3s91rxTNZGDEXkVv1rin2NcMvnA
	haHIZelHLdI3DsMBIA/EI8LtyQDJ/WKCN6etORwTRaGi6ETJPSza6GwkLsUYUAyTrWbNB4
	i8ZAWCnxnMOAM98rdACIAJgKN+Orx8g=
Received: from [192.168.1.53] (unknown [IPv6:2a01:14:8073:1e10:c362:ff08:aa85:54c6])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 250EF3600DE;
	Thu,  4 Jul 2024 12:31:39 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Jul 2024 12:31:22 +0100
Subject: [PATCH v4 3/7] memory: tegra: Reword and correct comments
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-tegra210_emcfreq-v4-3-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720092698; l=1381;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=NQo0bPEs1AJu1S28vtyG+gQwwEcVWxxTjFT08hacRNI=;
 b=kGbfaCNOI5OSmLIu4rbJhaTP+0UwPUcNJf5PeLjLNIxaGdWZrMpbmeamkh8Q5NYJ8K4gt6Mwp
 WOP2HTH7d+iC3MhDgOcG5Z9YzE3og+5/UHJeVpoW8bzkodZUrYvku18
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

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
2.45.2

