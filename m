Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E443E5EF6;
	Fri, 10 Jul 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676668; cv=fail; b=BxhCfXpmvAPqK48t/hNezsPMorULvu4ZtrHPUW3JjO6WTdwTeh2xF6ww0gxXc7Skp4ndQWPhvEX/XPBbdoKFbTMtVFloZ6jtCKQydQ5ev5DhfmySc3snUnDC8+AXb0VEaMFGV4UYjtBUGHx+5CKZJAvg0x1gcGSwfqSHgkKeSos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676668; c=relaxed/simple;
	bh=UHvXBsX0y5ftp5Iwk7xBRSA2109yfAYSOf/lr8+FzG0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pdgn00eWHGVps+7rDjkTLfIPquQBd2iCEuTttLyGIkihhi/XZMJ9W2wl87QYtIWADThqNr9zCDmUz5fzMWGS2LBM52/AaFaWqbpW4vIKFg8Bn7S9DZcvtwFruZ6fdLREexECbO27rOn75kly/cKM35cLtMNKF9ObVimUopclHGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X3506LSU; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X3506LSU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl8VeBr+hI2p7QHuzwD5gpnGnYQQJZg8yfvp0szbRnl/EpNg9b4eBdwrHIWY2z9xacsY7t48cPt832/nze53V7OxLE1AOV/W7r8oc62aPOTutO4BCiVfKJUv/75fxYDcyj4E/M0++nMdZtytWev7/b2Q/sQY9DbOieEQzDkSlbD1Ew49NsCZBWeEIRcgia8L1qtyt8njIO8uZytdiROxh6bD7bX4H0SD42kcMaGTlbqVNZJt2eXueKtyAZu0onj66VOV0ifyHyZU491UygYU+z4pCShDs3QJ308HQ0zpR6bIPeUFETxuT78Ts25MbE908BUO0aE1FGgQn5Hec6a7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kQe53IPHEeZX76n2B/chuTiRHtvYDsTZJgqpXBFnLw=;
 b=YQ+eMKkn+Yz8gSWv9xOqzfqRpvUYo7oYRDUo13fAK4cfUA9h0Or8A6ZsZaNAMDSKoxKxcxIZlCvNX/NEjRB6S8XtGLZQS41a3ORxL8pZD92KJaBMx4aJyVdTa2qGKJvDNq5rbn0ORfD5sV46cM3roT97U+uRZgGXQL5OcFU5U6XGwfxV+0iIHAiOh4pzTS20y/gtbJUI8q12ztH7XVnW4bodhrh+NwBWhmlDIYloVnWyysQ3PKgJQtkWKbjNrqdZKR7o9hOlqc1U+b0EhYwRKIooUmWraB6kHMjqni9Ys9MZY2JBqgcOIa5q1IGzhyPG5PDW+SEo+fIbELoYqMOc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kQe53IPHEeZX76n2B/chuTiRHtvYDsTZJgqpXBFnLw=;
 b=X3506LSU3iwCljFgmiPJYa4cXf4Io/dFy6ouUd/p+00/47vGxzzp/DXrpB1UsVl/PfTbQREGLybLtqIm1ew+BAjUcPrNB+btChgxzsAxF6uK1GACikx8FVAl9b/9/gjMCVSkEbviNL3UWxUjJJE7LTfzYKoM2gC6ak8QTindHUfkEFeMZLvfjC4+hIpQRP6C8WNI+BRB9juXRLzfDw7v9UKjUgPM++QILnL3Ij0iHj+xpsTUMAfDHs94CDx0O5m653SxvRHLC5xCEx/OqQB8yUDkcPHGXkMVcqVR1WgSXW9IacF0c9mzjCx1juXJCZ90CwEGFrMk0ogMRnNVIPF3Wg==
Received: from CYZPR14CA0027.namprd14.prod.outlook.com (2603:10b6:930:a0::17)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 09:44:22 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:a0:cafe::19) by CYZPR14CA0027.outlook.office365.com
 (2603:10b6:930:a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 09:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 09:44:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 02:44:09 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Jul 2026 02:44:09 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Jul 2026 02:44:06 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G
 . Piccoli" <gpiccoli@igalia.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2 RESEND] pstore/zone: Emit registration message as a single pr_info()
Date: Fri, 10 Jul 2026 15:14:04 +0530
Message-ID: <20260710094404.995355-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8a1c21-0337-498c-4027-08dede67d1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	AsTqry2nlOQ2dFB15gRmtqehszwyVZziN9gNRd9x9A7bi3hA+xo0ke5pc6yCOkGpd0Qd+Witi32udBCrhZf1kAN85uSJa9cirAZbsQT+pPAepUn/a/T4QuW47mp2zp7dfXDWVvGEgVuW849WSwZVyU1J2OQGkF8ueQdaKjd8SeztpfJ/rQOK+6hr9DMYN+Daf4SYA4inoUx2iMG35F+BzlCVhIEGF3VwLCE8ei6tglPW/mLPJ00+75CkpXdyc/VnSR3EPqKvnoJojzB7bbqp9wnyy4dgiahTjm4RK7+4GcgzR4dt0dqOACuiNFvH7hMbvckpLm4iYEmxHchtsWk5u1y9afXjqlmnXsMZgJm5ub8xAuJf8tM64cZVEF6mr38B15WhZav36knUVHCYJRM5i9zE64ceYqj4oGyWp6OiXIetPih4483NOg3IMj4AKNBRqtryfc7+eF/hyeLm+3Q36Cu2gneVk9h7JkmgZ7fS4ucCkWze7A/G8tq8ZkCOjNV2H+j6zOgioUvL34XGwt3W0xEsB7fGbaGGufuNdcufjshHItQh/pP7KkJTzb4MEsOjBYmwhV6N/y8Q6oQH7ANde8p5PdrN7p1/mOVq22CBhPEjlXAZdutUq3C7t07nrD7DOtqOV7RCnBkJRgMQQVX/B27thjO6EeZHOOfqDiDMvviD4o4Ipola32H/Ska0RAVZSLIg2KFFxpp/K/UdSCVgRQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vI10wNRLbAEOjszk6k2EI5M/5clEvTo3QbvWX1vtNbAWB1py/D0WmgT5hYN9bbLEX/lS/hUvlF7hMuChTyRDsnP8/bLG5qwOMQuOr/OOSRPOQKwsDW5wScvWfzi5QzbfkhDRKeXKJETyiHygLC71OmnVFI6WwSTIEDfI4vN2i6dFJQqSYagQAslmdTK6E5Lrvv8FV/x4z7cDPDX8fSIgdzL/zZzNKpYGusRztYcDvc6RYKuMUhlEicPzerok37u4gADp82DLzgB0Us9GB5cpdNIcM9auzqdRrLCKFZs2hNnjxtz5GxhmS8n2AzuhMgWu6xs3TgHWSPAjobhkLI4YP/fTuNZHQaLFjwzPXzcplLdQou2Ao74TxvG9jzvRW7s9c7ZFZwF39gmh7PyO9P8fQ6h/8Qm9AzQ9XktMO5SXibYQJKpKFeh5ofpHMFjiGsEY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 09:44:21.5925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8a1c21-0337-498c-4027-08dede67d1e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

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
Acked-by: Jon Hunter <jonathanh@nvidia.com>
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

