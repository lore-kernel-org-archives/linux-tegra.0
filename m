Received: from pv50p00im-ztbu10011701.me.com (pv50p00im-ztbu10011701.me.com [17.58.6.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD817E8ED
	for <linux-tegra@vger.kernel.org>; Sun, 16 Jun 2024 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718523576; cv=none; b=qsPRkLSJl58ZHfJTvn32boIhQTVmd8dZSv33BA1LRBrjMFS2HapvqZdKLVLn8JeOxSobxCjAy8JqXvY2OvngSIUpZlMJkIiG4D291LpqpZPkYvb5E9k84JQ2mxds9D/JTqA4EFBIP7o0D7m/DRx0bVCca9wMJsiDq8ag6oaNSx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718523576; c=relaxed/simple;
	bh=6ZE6SVx1Ny99HyfSh9kAhRJi6qjVKY2jR+Gk2CKUTsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GJ8XIxIMnw8nGO+AGN4dCxjQvKO2/xeO//C62dSmkgFeLkV+9ZUUQ9DMK706ubh6zw7JVk/KmRykR4PgtMyZLahXLZ/ps8HMAwr0Ug0Jbt/2xJV0hnigNx3IYDg7ZxeeSClTjIG5c53tsrDTNCbRdohA8z6AZ5oFTvn6AuKJNqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org; spf=pass smtp.mailfrom=qlogo.org; dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b=g6hGDl2Z; arc=none smtp.client-ip=17.58.6.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=qlogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qlogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qlogo.org header.i=@qlogo.org header.b="g6hGDl2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qlogo.org; s=sig1;
	t=1718523571; bh=tsLFH4pWEShc5YjnqUODueUGlPm0CApxPhaUEVDlXSM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g6hGDl2ZoWLb2IklexnTBp6Tro+IIMC4QhmSJnWIxmXwNLEdsEoK1Uq9IlGGWmJVI
	 wZzUiL1jCza0NwfUmeoK8ZB7swQnVqQZ4mT+5LSS9XlfmE190+jRdsVl3eNugE2p94
	 ydIZm2nwCi+TukEV+jV54ju5KrZB8ovrqAcSs7BsOMuUNJZ6ss85FbcF5BygYEkLur
	 itGFD0FUEsyFLwrqLkcptY1KLxWot6LYoaprpHkKESrZ6LGVS3zsnAFgSUG4kZB6B1
	 skY8/s1A0UhaWJZa0tsT00RJRWnFfkt+Nq9wq5aPzpajTbA9ZbBRxcdG4ZWDHnN1zh
	 R27vL4jhhnqKQ==
Received: from fedora.jas.ddns.me (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztbu10011701.me.com (Postfix) with ESMTPSA id 8B3EE7401C4;
	Sun, 16 Jun 2024 07:39:28 +0000 (UTC)
From: Jason Sikes <sikes@qlogo.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	kkartik@nvidia.com,
	rdunlap@infradead.org,
	frank.li@vivo.com
Cc: Jason Sikes <sikes@qlogo.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix warning in tegra_fuse_add_lookups
Date: Sun, 16 Jun 2024 00:36:57 -0700
Message-ID: <20240616073721.5696-1-sikes@qlogo.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3RPpWRiuVpFqz4iuViTEbOlXDhaq0hjt
X-Proofpoint-ORIG-GUID: 3RPpWRiuVpFqz4iuViTEbOlXDhaq0hjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_06,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=741 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1030
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2406160059

gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
used in the first, but not the second, of two size_t arguments.

Signed-off-by: Jason Sikes <sikes@qlogo.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..d27667283846 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -127,8 +127,8 @@ static void tegra_fuse_print_sku_info(struct tegra_sku_info *tegra_sku_info)
 
 static int tegra_fuse_add_lookups(struct tegra_fuse *fuse)
 {
-	fuse->lookups = kmemdup_array(fuse->soc->lookups, sizeof(*fuse->lookups),
-				      fuse->soc->num_lookups, GFP_KERNEL);
+	fuse->lookups = kmemdup_array(fuse->soc->lookups, fuse->soc->num_lookups,
+				      sizeof(*fuse->lookups), GFP_KERNEL);
 	if (!fuse->lookups)
 		return -ENOMEM;
 
-- 
2.45.2

