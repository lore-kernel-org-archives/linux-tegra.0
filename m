Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3158C39FD7
	for <linux-tegra@vger.kernel.org>; Thu, 25 Apr 2024 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021394; cv=none; b=P6Cy2BhEAEcy8aL4Pu8GYqIfuZZwY9LHffx/vOyFKnUOdMAyNo2uyg0t2hDjY4ULsTUEggjGAezBPoN6ye7VQTMdra72rHKrDtxYjb10UQUVtVzJlVii/p/jh4Gn3pw5kh0dANuYLzq5XRialFs9vNRbMN6v69bwgIWz2ZqQ2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021394; c=relaxed/simple;
	bh=+bCiYkTayzPrq2odbezHfKcHWNVrV6mr9K4D73yU3tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7Qgxpszbw7CHWhUEIsW5ah99JasjMdUt4FNk8mraQ8ojhWTCwn7RI4Mu6SIrAenB0DwqRwkyg9WfO8OYxOytksrKE2XNSpnFF7TxVuYOjBduv60HGepXPkJ1gHwNMhcb5fk8tZFQmgv6dhGkelXLcyC7FDGSdAlfQalJCJKgU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=dEN3vj22; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="dEN3vj22"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ReeraV7ufn60/mkW2+TUO0nmEAQXtsBUw1AVORBcKCg=; b=dEN3vj22XsRRFc86Kry143Q83Y
	kuNb/uVgYVubRVM6XqPqnwWG9fOBXAJSMFW1LXXone2PUhFCbot5mJV7UNmwXzrrSKFCx2RMNAwPj
	PXr6CHiSsKBmj0LVAUSrvO1ncFhknLDn45uIlutkL5lkrdFZZzlaIIQuj00SFXkPbg9rxG1q4Ek+S
	LKZ1fDDVBgWUD7CQm0/hTEM7BFQ3BwhOCxY1CLpvpSCgYYWVze/aulNxVpSZCx/cbfkecuTk4txsy
	jCj28R7iJdQYp2YJnZ+wEyW8TisjgtZ4qyTQH9kxRshvhpJdtDfbvskPEA2d+7etyoX2ZaXv14nW6
	6UX6Kp1A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rzrG7-00Fmla-0l;
	Thu, 25 Apr 2024 08:02:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/5] gpu: host1x: Handle CDMA wraparound when debug printing
Date: Thu, 25 Apr 2024 08:02:34 +0300
Message-ID: <20240425050238.2943404-2-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425050238.2943404-1-cyndis@kapsi.fi>
References: <20240425050238.2943404-1-cyndis@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

During channel debug information dump, when printing CDMA
opcodes, the circular nature of the CDMA pushbuffer wasn't being
taken into account, sometimes accessing past the end. Change
the printing to take this into account.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/debug_hw.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 54e31d81517b..4c32aa1b95e8 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -177,7 +177,16 @@ static void show_gather(struct output *o, dma_addr_t phys_addr,
 
 	for (i = 0; i < words; i++) {
 		dma_addr_t addr = phys_addr + i * 4;
-		u32 val = *(map_addr + offset / 4 + i);
+		u32 voffset = offset + i * 4;
+		u32 val;
+
+		/* If we reach the RESTART opcode, continue at the beginning of pushbuffer */
+		if (cdma && voffset >= cdma->push_buffer.size) {
+			addr -= cdma->push_buffer.size;
+			voffset -= cdma->push_buffer.size;
+		}
+
+		val = *(map_addr + voffset / 4);
 
 		if (!data_count) {
 			host1x_debug_output(o, "    %pad: %08x: ", &addr, val);
@@ -203,7 +212,7 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				    job->num_slots, job->num_unpins);
 
 		show_gather(o, pb->dma + job->first_get, job->num_slots * 2, cdma,
-			    pb->dma + job->first_get, pb->mapped + job->first_get);
+			    pb->dma, pb->mapped);
 
 		for (i = 0; i < job->num_cmds; i++) {
 			struct host1x_job_gather *g;
@@ -227,7 +236,7 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 			host1x_debug_output(o, "  GATHER at %pad+%#x, %d words\n",
 					    &g->base, g->offset, g->words);
 
-			show_gather(o, g->base + g->offset, g->words, cdma,
+			show_gather(o, g->base + g->offset, g->words, NULL,
 				    g->base, mapped);
 
 			if (!job->gather_copy_mapped)
-- 
2.42.0

