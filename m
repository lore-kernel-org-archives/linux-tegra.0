Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647D120FA99;
	Mon,  9 Dec 2024 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733723516; cv=none; b=rLQFLge4qdWGzdnuf95vT0wn1ta6kyaRGxQGX52KLPIj2NilpzwYWW64HNt1UkI4BApQpm2GB0Q7etrVjrpOgxPyP4afRnKVaj1RdXukmr4ZTeQth+VkS52pCfZfQAe0rFpG5oGOg2oxZKTcWi0xawnH4U/kOiLrjt1vqCiu9uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733723516; c=relaxed/simple;
	bh=72x7djgpfN8f8z64Q8Ru1LS3POSY02SlwAPXFqu/VsY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QUgC1OLa2b15qBm9h65+LkGYzykIw9f5VSr4CIbNMPSJ4eZFPXwf2x6MdbAMXGR1tqPDachyuBT8vAuJ61yzgXli3pDc3ksO4RBMDfwrfGRXmWCFZC9qeu0u5PXXckKrTw2X5YbL1NtLLXrWwR3EGuDpI/ZWtR9UbzQI28zcSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee667568575e38-bf70f;
	Mon, 09 Dec 2024 13:51:49 +0800 (CST)
X-RM-TRANSID:2ee667568575e38-bf70f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66756857496c-a2309;
	Mon, 09 Dec 2024 13:51:49 +0800 (CST)
X-RM-TRANSID:2ee66756857496c-a2309
From: liujing <liujing@cmss.chinamobile.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] soc/tegra: fix spelling error in tegra234_lookup_slave_timeout()
Date: Mon,  9 Dec 2024 13:51:48 +0800
Message-Id: <20241209055148.3749-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error in tegra234_lookup_slave_timeout().

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 5cf0e8c34164..c74629af9bb5 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -277,7 +277,7 @@ static void tegra234_lookup_slave_timeout(struct seq_file *file, struct tegra234
 	 *    which timed out.
 	 *	a) Get block number from the index of set bit in
 	 *	   <FABRIC>_SN_AXI2APB_<>_BLOCK_TMO_STATUS_0 register.
-	 *	b) Get address of register repective to block number i.e.
+	 *	b) Get address of register respective to block number i.e.
 	 *	   <FABRIC>_SN_AXI2APB_<>_BLOCK<index-set-bit>_TMO_0.
 	 *	c) Read the register in above step to get client_id which
 	 *	   timed out as per the set bits.
-- 
2.27.0



