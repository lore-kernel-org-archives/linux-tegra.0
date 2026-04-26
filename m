Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013048.outbound.protection.outlook.com [40.107.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505842AA6;
	Sun, 26 Apr 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777194593; cv=fail; b=B1fLlRneyhK2VfVEieEpkenJJhCl67ko01Z0UNqymWXUg23IHqyXDamKLsmHZtnyNGd/LfbcdSXDh/ZdFVrxXmTN9ymotkIlrwzjbqiVtWcGBVv4kR4p4IPBRWtK0wvty8HFb0xd8izqIDDUa1IZylypKc62cvleJecEjqZiB58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777194593; c=relaxed/simple;
	bh=fDraKgvOFLlvXfzjDpYMS/xor7A/bgiWtcVuKWQLvFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mCne5X9QbTaePUEqaUUUlDt2KpdLu/qGdmUECAFiM6r/eynjYZWsdFyc675bliwUa8fgtegHvKadmQ2Ru7Nrf2Nx9AERVObjEKY7CqHnbhjqn2P6NNAtZ13tEMYFCTzB1bkmU+LV7qQg2RiRV5RYSzhWwV9HP8UHni9Dg+7J51A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=heN0uw16; arc=fail smtp.client-ip=40.107.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="heN0uw16"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia36tQoCPcqCYk2yXXqJQMXLjD9UL4l9GFv9SUwidLwArt4OEpkSm3dNXH/u8RgwTpDhYHuECDmC59x0pxLjeTapOB6NqI0YZBxjV9HjPZ2QBN2mvAMQrGAX1RMSpJizREsBseeEHbrsTCPqTm8a97hPXYowpJVSxaSdjfp8OcVHGjYAqie0UsyLYKI+Qj4mDPgcB6okym9ayCC5r8UgFm1HCbyqgh73vAmOwVOfzMv3tDXfPnf5jsFy6Z7yzJBRm5EEvk7agJ13ZpZzM8X1Xu5NpbABgKo63ZGs+hC+YOXc7RK3zqkO8Ok4m4rNAVvRS9MmEBfQzijRHqzLSwnIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XmZuu4wEMQOvKPD+5ilBagXcgWkuw59QHGNge1jlYk=;
 b=Lb4tMGrL/jam0UrUv2YU8me2+NA0hTzPgz+uzjjcTpbV9XjsEc3jB1q5aQ3+N5t6VZ1A91tctwxeN5YaUhFGC4i/GBiJDozDim7EByOqTRB2ZkBLFUHR4OasJ6mrzybp+Llw0nQP/M1D6nKTgnVa6ca444Z1G/sZILaI3h2xEkpbWO+NaNoCvhdyg7G+s8yVeock7hr2VjHdhbrSoOupxbtiyZry8HcwXOwd4SpYDD8755gQriFdZm3CeC4G/44MXcm0qyv4MYt7MM7P8UemalNYCAIxfs+n7/2v9C28sDfEoWTRfKMEiPB0po1WWYW/XnhsIB/yKorHAJB+oJfozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XmZuu4wEMQOvKPD+5ilBagXcgWkuw59QHGNge1jlYk=;
 b=heN0uw16gtC1e5nBaXvgrG72dJv3NyRTe1jOVrlh7FXiCbZpxDRw1w/i+9wOGcVeQ0Apx7o10MstXlsBs8Wp+c27YFBx8Fiw6EgYDtqAwKhdV6i8e9KhUHej9UpYewHo+nDKZeT8+H+/gKTS1ZeEZ578HogEmeCjzjgDQvM5APlnodDFqfFsXhe9ozk4qa5MoPQKTjsMLF/9xBqHQvVTIdn2l7ZB3duHmYdujwT6mRyuCQGOGt9ehmwQWMyiQyOvLPrYyu2BDJFHNP1qbakTTevgO8oSCRe4C+4Qlk1v4PIi84fKd2tq4pbaqNEVV7NoN6UAmUEt6Pry5rDFlqWr1Q==
Received: from SJ0PR03CA0262.namprd03.prod.outlook.com (2603:10b6:a03:3a0::27)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Sun, 26 Apr
 2026 09:09:43 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::91) by SJ0PR03CA0262.outlook.office365.com
 (2603:10b6:a03:3a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Sun,
 26 Apr 2026 09:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Sun, 26 Apr 2026 09:09:43 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 02:09:34 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 26 Apr 2026 02:09:34 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Apr 2026 02:09:31 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G
 . Piccoli" <gpiccoli@igalia.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2] pstore/zone: Emit registration message as a single pr_info()
Date: Sun, 26 Apr 2026 14:39:29 +0530
Message-ID: <20260426090929.1528232-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: e72837de-049a-4d53-2c28-08dea3738df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	I3IY5aDrtKKTCheYnasDpOZ6T84FfUNWw1rCXnzQl0gbmFDL7q1PSdvlZe+TzXsd1QwvIgWs9sUpYjeusN8W3bVrF00rkm88H9pXnF1eeoKD2KCSiUi9LMbH5xb5+zGZpwELcXOOrfuDwMD5gVAqYcpBAyeYsXQXZZP7bYXjD+VKIoA1V4Tg9bznKUKTPxRxxH3KOqofgbVIMb+s3ASsv8C1872MWOQYtwF/uTW2ooBi9WOpuniAP3PQNOzOHdIlRZVhLrXr5q/Z3A9vHYhOMTCte4gZd0eU3oJzSuR7ggGHFf03cP39DYlbVeYRo0PqkUORgAiYsyz94AYuwk4ZBtGvOAcUH7dkf1ig9EKazE7EXOc88cxO5l/898cfGqCPMvMhCZ6WX80FURGO/aZ8M4brT0xE4huNUi21a3+XYVD0ky+go8qkOWdY+RU8obVGkO2ZlmfUys5uEzsgV0miv6xzQz6ld6KX96J8/ZUxQRDtaJmR8Nevx+xEUFdWPB/pOO3osUJ7Jo8TJJCInloE5Ypp9jNgJXGlKOtcFI6xGKrTaSyEMYguTlj/NlXp376SlgoSIkkSyFIz6J4NVrJ+fdW4aG7m98Uy9U3VmV0PDRJOs93AsLqN+/u50ojjcN7qqHmPxiI633ZD0yRb/W7auaaLK6kNYx1N1nJeyqzo2olr5BLpCqVE7uqFAA1uNyK1H86z+TDj5sJGiV2Wn1J/0oJd807tF0T4gFfwdJr5UzTAupsDU+8peMsG7EBXGQxDCqhusc5gi7bwcNQp6Nzz7w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iuo4ImYa7xFh/IEn0I2eplG5LP0ymRnCLnUg2lGkNwfCwvOI0EvowAVXFiLpN2vLqvgb84jt1isa2nAnjmMwnSSrKazr8plheTD7m5wtw1ld3yPk6njRO7zEstKq6quVB5TgwoV85rLyeqkcRFm6bWRQ9rX71Ce58XY0LfUpzvQxJAQiZWbVd7lTl2vrlCJyOmwLLaHq3r0DWRQnZCfM0jz3QZd/F+9EEkbpVMERCGpzVtWC4D65f8e498ON1YlyhLn/6rmu6dcEbDN+5aXTyDPlqcdvoL/Z638COw7tJCs3g1E2rK4XV9AqsJ/gJuNB0jCHFGLYrAVlx+X9KJOwI5vlRUHdiN0Z/SFrJ7AOah9/uninRYaNZ0m4ijML3vmVjUh57IvaNzGkzmB0pyuNrXzeMGSOM6ZXrDr3SzlV5UdP6jt0Vv2PLST0mLWac/h8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 09:09:43.0976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72837de-049a-4d53-2c28-08dea3738df3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12

register_pstore_zone() prints its "registered ... as backend for ..."
summary as a pr_info() followed by several pr_cont() calls.

pr_cont() is not atomic and has no log level of its own. It appends
to whichever line was most recently opened by a printk(). If a
pr_err() or pr_warn() from another CPU or an interrupt handler
preempts the pr_info() / pr_cont() sequence, it closes the
continuation between the fragments. This can cause parts of the
pstore registration message to appear at the wrong log level and be
interleaved with other messages.

Furthermore, this causes the detection of new warning and error
messages in the kernel log to be unreliable.

Format the registration line into a seq_buf and emit it with a
single pr_info() call, making the line atomic with respect to
concurrent printk() callers.  No functional change to registration.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v2:
- Use a seq_buf to build the registration line instead of scnprintf()
  calls.
- Link to v1: https://lore.kernel.org/all/20260424095820.1433700-1-kkartik@nvidia.com/
---
 fs/pstore/zone.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index a3b003f9a3a0..004a5d5f376b 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/mount.h>
 #include <linux/printk.h>
+#include <linux/seq_buf.h>
 #include <linux/fs.h>
 #include <linux/pstore_zone.h>
 #include <linux/kdev_t.h>
@@ -1301,6 +1302,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
 {
 	int err = -EINVAL;
 	struct psz_context *cxt = &pstore_zone_cxt;
+	char buf[256];
+	struct seq_buf s;
+
+	seq_buf_init(&s, buf, sizeof(buf));
 
 	if (info->total_size < 4096) {
 		pr_warn("total_size must be >= 4096\n");
@@ -1383,30 +1388,28 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	}
 	cxt->pstore.data = cxt;
 
-	pr_info("registered %s as backend for", info->name);
 	cxt->pstore.max_reason = info->max_reason;
 	cxt->pstore.name = info->name;
 	if (info->kmsg_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_DMESG;
-		pr_cont(" kmsg(%s",
-			kmsg_dump_reason_str(cxt->pstore.max_reason));
-		if (cxt->pstore_zone_info->panic_write)
-			pr_cont(",panic_write");
-		pr_cont(")");
+		seq_buf_printf(&s, " kmsg(%s%s)",
+			       kmsg_dump_reason_str(cxt->pstore.max_reason),
+			       cxt->pstore_zone_info->panic_write ? ",panic_write" : "");
 	}
 	if (info->pmsg_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
-		pr_cont(" pmsg");
+		seq_buf_puts(&s, " pmsg");
 	}
 	if (info->console_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
-		pr_cont(" console");
+		seq_buf_puts(&s, " console");
 	}
 	if (info->ftrace_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
-		pr_cont(" ftrace");
+		seq_buf_puts(&s, " ftrace");
 	}
-	pr_cont("\n");
+
+	pr_info("registered %s as backend for%s\n", info->name, seq_buf_str(&s));
 
 	err = pstore_register(&cxt->pstore);
 	if (err) {
-- 
2.43.0

