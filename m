Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB043BFAF7;
	Mon, 15 Jun 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512690; cv=fail; b=tYQFH5h/sEAr05Ber0tyKf6N07aOere8aWK6mAU93952LwAnjXO/jdrdO+sBF3eW/pfkkwQbEEurrTThL+kOWg43t83tae8nSkhGmA62c26mpETl/vbP2JNtld7sx3cDThcBrcz18/ux4llOi/vUcOcjkoz9bqbGiCcG0elJbeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512690; c=relaxed/simple;
	bh=55HcSOB1i6hMvp9TL6vqBFwG2NuhR0MV8O1qG1hYwPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxnVRZvMkD0qZ/qbA1dc5uy1N91rc5JhCA1lzG3LoS8QEQANaG+RgsEYGC6hJXkcZD+EPXMyibL1Q24TT0AhdojuRDvN5wdXCaw1/v48tw20SAwvOCKQAc+hJXUn+0Rl7k2T7MsaFEM+Mv5anORKkKdV3vYqk6w0qWc1PL3rGLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QNUh0Zol; arc=fail smtp.client-ip=40.107.209.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QNUh0Zol"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiVLk3h9OLLGl+lyEa3UGY9brmDG/loFHqL2em5DOnx2WeLr3TBmPb2uA25WudgJqWgHyOCxhF7wuWv3FsIfvL01GwBMqtGvMq7EBlPlZKWpFJeXGeYFRDRAn9VFO7aDWdDRY5KS0NBuTHFEV7W9CKDMz/ln9Bz4p0HAa+ffOnN4hXrHsT28/GUh5uOzJxgK90Fx22wBXquHFlsuw6LXP/1fJ5dH3Dbr9DZLGhBFjLcfSxdcWe/PtIOQCgFrkUo9EOoHpTd9GnNMbvdZvfwT6RTRsQ/DoLTMb+Sju9Givy3MIetkojkjMuu3/H3UN+pKdBhCUOCZqS96hg9gYfILmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnqOKoXcu4Ayy+gBOG82hl3O00O1BqEJLnuUWqXR/B8=;
 b=ZgMQxkLSsGOsOeEDDcekqN5sXTzyylxaEVxUwhZ6CRSMfkMTyCZaYlhxv+JZxuJmGkljtIjJ8KOMRuDsbMm9UQjD2Feo0mQBcKyLB3/wCNbXIKubfKyoT56fZCyjHfJgX4fcL9SEsIY/wJrI9fbIftq2BKe1P9cUmYaOdZW5mrfDLyos7bzOpIijt2svDk86bXSBXQ0tfsjVtj+RwUNpYScUzkrSmm1w/CAbkZTAnQW73Ieyz9rCLIWjJwvRkb1+aGVUswPZqGPwvww36uHmKEiHiIWwWSQpanu/dpXbjrubIIwTSbBARbvaLmSzfDxmUZ+GExcbYvnM3JZ/Pc2QPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnqOKoXcu4Ayy+gBOG82hl3O00O1BqEJLnuUWqXR/B8=;
 b=QNUh0Zola1hNZjF+0NDfws0iOTYhRZm6w9RxTg757wXp66J1CZlzRNfRxi8i9uFM850PN/irNYEPO9mbLpgBQMU+19uSKiHNol5N+WjrUqY0+ZdSw3oUEDChPXt2SeBL+1TG9NxGO4LFve1S8RRowFKdDK4EACJUdcu66sHtRKLnqKH0/RLVIE/D72Td7udL5Tm1n9CVlOmdnKn79jJVYAzs50QMewNIAVzuVC8/FxacnLk9euYYdxog8a5Q/npo4urPvi7XMoy4uy0GqEn6v9wzF1wnlvTkwqPQBrwv7+RoSz3ocr+2Y02nopAFe+XDAHip3SsI36wP9/wLBUlNGg==
Received: from BN0PR04CA0006.namprd04.prod.outlook.com (2603:10b6:408:ee::11)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:38:04 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::6d) by BN0PR04CA0006.outlook.office365.com
 (2603:10b6:408:ee::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Mon, 15 Jun 2026 08:38:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:51 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:50 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 3/6] firmware: tegra: bpmp: Add ACPI support
Date: Mon, 15 Jun 2026 08:37:28 +0000
Message-ID: <20260615083731.888055-4-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615083731.888055-1-anrao@nvidia.com>
References: <20260615083731.888055-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: e605d6a6-41c9-4b57-8d2b-08decab96a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|6133799003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LVXNJwqsKi6jpUHYchci6w+cvD6LvExChpaloNgXsZFnoKqyLsKpOo/NN4xXb1kgtqNnIj0jqkB0KaLyO+R7z9LsMvcW2PF/iNCB7lGYzJ7Wjijj3dis8ubN/tdyJeQcbFdmMBd2DOp21YUYtMtplHMFPNvg03ECK+FZw+AxaQMGQ6gUzu+Wm3xdXZqAxUkaPoF+8gz7VrLr//9qpTcS5Kl/vKR4UlTt/mAC936tscGp/2bInDuVXJ/F0sClzhcglmSHYlcEnD8sgPhxRQxS5PRwXCOi2UtWI0yGJ+Tn4OqhfUJBeanay0pxyIdkuZljhqJ4BYLhdMsAu5gbXv1BifKaxncheH71owwvU36xV5HuuL/ALleCynr4M/ceq65aRQEyMV+SHLGqB9zO73m+Ij6EoJzVphOuArO5mY3dgEAs137TKsMQg9IHBwemRmcyhmp0HG+EEZvPKNrL8GYu7IOw3HNyzkv9t+O9lbehTtzIKAuPOYL74ECmFq8Q2ljhiyDsdwSCz6/OLPc4lK8yT+feiGNh/2R6M77e0D9GsU7fEJhSpSDZXCb+NwEXTI8Umjy5w5ObpJTLFXWKGkUTs0V6ZD+S0BO4bFxsi+d127ifBfdwO224Wqk+z89K6mBHj1wMOCn7oj78GhqGzrCuEFNmqUhLxvs3JgN1t9I+L6XfSWUkwNasOUzZ5gdDsyfSotWMcQ/1DG3Wto8t59Tn12wnFMqWNDtXLbnxlj20oXg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(6133799003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UWh6OxRYGtsFmusT1ho9wVHd3ww4UnDwHT/8STj//a2TQtvyCUY7CXOtZdwkduKFa3UOgYSwhEyEzaWk9uIJZ2kYFyBbTuvXMJ/m3LVbkbjUqZ0JtglR7Meam23/1PWa3T5lzAvt0y5LvzpyjPaOeSIn2yq955GUo5k7zeItSjsx4NnHrMnBH7JGjjkK8MN0A4DpUZYOSHkcTMkzhWOUXDGHtYQeVZdDet/vl4UcxnwdIQPyFwRUVxGWnbSvUrk0CQCYG8xANwfh5ESJBsC9hKQe91VA3sBemfNxPx54OBv0xAgaC2iNoj9jxLPnhLdxEpw1K9CxkCvSWF+5sWw6/8dcQb67+NLub/6iqAocvgw62B8ZwX2oLfLSX5/IOsTIzsMCm3daWurHBcHm8jYwbcEWOgG4x/XuYagAHf4J54gTsQQN71k8ZK6HjtssESYn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:03.4829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e605d6a6-41c9-4b57-8d2b-08decab96a71
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026

Add required changes in the Tegra BPMP driver to make it compatible with
ACPI based platforms.

On ACPI systems, IPC is handled through the AML method instead of the
core kernel framework using mailboxes and IVC.

Keep the existing TEGRA_BPMP Kconfig dependency on TEGRA_HSP_MBOX
and the TEGRA_IVC selection unchanged. The driver remains a single
implementation shared by Device Tree and ACPI platforms, and the
Device Tree mailbox/IVC transport is still built unconditionally. ACPI
systems bypass channel and resource initialization, MRQ registration,
and mailbox transfers at runtime while the existing Device Tree
transport and build model remain unchanged.

Bypass clock, reset and powergate init calls as these are not
controlled by the Linux drivers on ACPI based systems.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 drivers/firmware/tegra/bpmp-private.h |   9 ++
 drivers/firmware/tegra/bpmp.c         | 178 ++++++++++++++++++++++++--
 2 files changed, 173 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 07c3d46abb87..ebde0e36ae20 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -26,4 +26,13 @@ struct tegra_bpmp_ops {
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
 
+/* Maximum ACPI BPMP mailbox data buffer size. */
+#define TEGRA_BPMP_ACPI_BMRQ_DATA_SZ   3960U
+
+struct tegra_bpmp_acpi_message {
+	u64 status;
+	u8 *data_ptr;
+	u8 data[TEGRA_BPMP_ACPI_BMRQ_DATA_SZ];
+};
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 16ca0d104c1d..e9c0d6d3e24d 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
@@ -13,6 +14,7 @@
 #include <linux/pm.h>
 #include <linux/semaphore.h>
 #include <linux/sched/clock.h>
+#include <linux/slab.h>
 
 #include <soc/tegra/bpmp.h>
 #include <soc/tegra/bpmp-abi.h>
@@ -343,12 +345,113 @@ static ssize_t tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 
 static int __maybe_unused tegra_bpmp_resume(struct device *dev);
 
+#ifdef CONFIG_ACPI
+static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
+				    struct tegra_bpmp_message *msg)
+{
+	acpi_status status;
+	union acpi_object params[2];
+	struct acpi_object_list param_list;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	struct tegra_bpmp_acpi_message *pkg;
+	struct acpi_buffer format = { sizeof("NB"), "NB" };
+	struct acpi_buffer extract;
+	size_t rbuf_len, rdata_len, rx_size;
+
+	if (!tegra_bpmp_message_valid(msg))
+		return -EINVAL;
+
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = msg->mrq;
+
+	params[1].type = ACPI_TYPE_BUFFER;
+	params[1].buffer.length = msg->tx.size;
+	params[1].buffer.pointer = (u8 *)msg->tx.data;
+
+	param_list.count = 2;
+	param_list.pointer = params;
+
+	status = acpi_evaluate_object(ACPI_HANDLE(bpmp->dev), "BMRQ",
+				      &param_list, &output);
+	if (ACPI_FAILURE(status)) {
+		acpi_evaluation_failure_warn(ACPI_HANDLE(bpmp->dev), "BMRQ",
+					     status);
+		kfree(output.pointer);
+		return -ENODEV;
+	}
+
+	obj = (union acpi_object *)output.pointer;
+	/* Validate returned type */
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE) {
+		dev_err(bpmp->dev, "Invalid BMRQ data\n");
+		kfree(output.pointer);
+		return -ENODATA;
+	}
+
+	if (obj->package.count < 2 ||
+	    obj->package.elements[1].type != ACPI_TYPE_BUFFER) {
+		dev_err(bpmp->dev, "Invalid BMRQ data\n");
+		kfree(output.pointer);
+		return -ENODATA;
+	}
+
+	rdata_len = obj->package.elements[1].buffer.length;
+	rbuf_len = sizeof(u64) + sizeof(u8 *) + rdata_len;
+	if (rbuf_len > sizeof(*pkg)) {
+		dev_err(bpmp->dev, "BMRQ: reply buffer too large (%zu)\n", rbuf_len);
+		kfree(output.pointer);
+		return -EINVAL;
+	}
+
+	pkg = kzalloc(sizeof(*pkg), GFP_KERNEL);
+	if (!pkg) {
+		kfree(output.pointer);
+		return -ENOMEM;
+	}
+
+	extract.length = rbuf_len;
+	extract.pointer = pkg;
+
+	status = acpi_extract_package(obj, &format, &extract);
+	if (ACPI_FAILURE(status)) {
+		dev_err(bpmp->dev, "BMRQ: failed to parse package (%s)\n",
+			acpi_format_exception(status));
+		kfree(pkg);
+		kfree(output.pointer);
+		return -EINVAL;
+	}
+
+	msg->rx.ret = (int)pkg->status;
+	if (msg->rx.data && msg->rx.size) {
+		rx_size = min_t(size_t, msg->rx.size, rdata_len);
+
+		memset(msg->rx.data, 0, msg->rx.size);
+		memcpy(msg->rx.data, pkg->data, rx_size);
+	}
+
+	/* Free memory allocated by ACPI core */
+	kfree(pkg);
+	kfree(output.pointer);
+	return 0;
+}
+#else
+static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
+				    struct tegra_bpmp_message *msg)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 			       struct tegra_bpmp_message *msg)
 {
 	struct tegra_bpmp_channel *channel;
 	int err;
 
+	if (WARN_ON(ACPI_HANDLE(bpmp->dev)))
+		return -EOPNOTSUPP;
+
 	if (WARN_ON(!irqs_disabled()))
 		return -EPERM;
 
@@ -389,16 +492,13 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer_atomic);
 
-int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
-			struct tegra_bpmp_message *msg)
+static int tegra_bpmp_transfer_channel(struct tegra_bpmp *bpmp,
+				       struct tegra_bpmp_message *msg)
 {
 	struct tegra_bpmp_channel *channel;
 	unsigned long timeout;
 	int err;
 
-	if (WARN_ON(irqs_disabled()))
-		return -EPERM;
-
 	if (!tegra_bpmp_message_valid(msg))
 		return -EINVAL;
 
@@ -428,6 +528,18 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
 	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
 				       &msg->rx.ret);
 }
+
+int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
+			struct tegra_bpmp_message *msg)
+{
+	if (WARN_ON(irqs_disabled()))
+		return -EPERM;
+
+	if (ACPI_HANDLE(bpmp->dev))
+		return tegra_bpmp_transfer_acpi(bpmp, msg);
+	else
+		return tegra_bpmp_transfer_channel(bpmp, msg);
+}
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
 
 static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpmp,
@@ -506,6 +618,9 @@ int tegra_bpmp_request_mrq(struct tegra_bpmp *bpmp, unsigned int mrq,
 	struct tegra_bpmp_mrq *entry;
 	unsigned long flags;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return -EOPNOTSUPP;
+
 	if (!handler)
 		return -EINVAL;
 
@@ -531,6 +646,9 @@ void tegra_bpmp_free_mrq(struct tegra_bpmp *bpmp, unsigned int mrq, void *data)
 	struct tegra_bpmp_mrq *entry;
 	unsigned long flags;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return;
+
 	spin_lock_irqsave(&bpmp->lock, flags);
 
 	entry = tegra_bpmp_find_mrq(bpmp, mrq);
@@ -606,11 +724,17 @@ static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
 	msg.rx.data = &response;
 	msg.rx.size = sizeof(response);
 
-	local_irq_save(flags);
-	start = ktime_get();
-	err = tegra_bpmp_transfer_atomic(bpmp, &msg);
-	end = ktime_get();
-	local_irq_restore(flags);
+	if (ACPI_HANDLE(bpmp->dev)) {
+		start = ktime_get();
+		err = tegra_bpmp_transfer_acpi(bpmp, &msg);
+		end = ktime_get();
+	} else {
+		local_irq_save(flags);
+		start = ktime_get();
+		err = tegra_bpmp_transfer_atomic(bpmp, &msg);
+		end = ktime_get();
+		local_irq_restore(flags);
+	}
 
 	if (!err)
 		dev_dbg(bpmp->dev,
@@ -635,6 +759,9 @@ static int tegra_bpmp_get_firmware_tag_old(struct tegra_bpmp *bpmp, char *tag,
 	if (size != TAG_SZ)
 		return -EINVAL;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return -EOPNOTSUPP;
+
 	virt = dma_alloc_coherent(bpmp->dev, TAG_SZ, &phys,
 				  GFP_KERNEL | GFP_DMA32);
 	if (!virt)
@@ -737,6 +864,9 @@ static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 {
 	size_t size;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return 0;
+
 	INIT_LIST_HEAD(&bpmp->mrqs);
 	spin_lock_init(&bpmp->lock);
 
@@ -777,6 +907,9 @@ static int tegra_bpmp_init_resources(struct tegra_bpmp *bpmp)
 {
 	int err;
 
+	if (!bpmp->dev->of_node)
+		return 0;
+
 	err = of_platform_default_populate(bpmp->dev->of_node, NULL, bpmp->dev);
 	if (err < 0)
 		return err;
@@ -824,10 +957,12 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
-				     tegra_bpmp_mrq_handle_ping, bpmp);
-	if (err < 0)
-		goto deinit;
+	if (!ACPI_HANDLE(bpmp->dev)) {
+		err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
+					     tegra_bpmp_mrq_handle_ping, bpmp);
+		if (err < 0)
+			goto deinit;
+	}
 
 	err = tegra_bpmp_ping(bpmp);
 	if (err < 0) {
@@ -949,10 +1084,25 @@ static const struct of_device_id tegra_bpmp_match[] = {
 	{ }
 };
 
+static const struct tegra_bpmp_ops tegra_bpmp_acpi_ops = { };
+
+static const struct tegra_bpmp_soc tegra_bpmp_acpi_soc = {
+	.ops = &tegra_bpmp_acpi_ops,
+};
+
+static const struct acpi_device_id tegra_bpmp_acpi_match[] = {
+	{
+		.id = "NVDA3001",
+		.driver_data = (kernel_ulong_t)&tegra_bpmp_acpi_soc,
+	},
+	{ }
+};
+
 static struct platform_driver tegra_bpmp_driver = {
 	.driver = {
 		.name = "tegra-bpmp",
 		.of_match_table = tegra_bpmp_match,
+		.acpi_match_table = tegra_bpmp_acpi_match,
 		.pm = &tegra_bpmp_pm_ops,
 		.suppress_bind_attrs = true,
 	},
-- 
2.43.0

