Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE73AFD1B;
	Thu, 10 Sep 2026 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030813; cv=fail; b=WBUdn49j9UjCCLsaCzQVH5QfJT9NuLXd1Q1PIHHO+TvjA1eXlh4n2HV3k+55P+eyjNBxyUPhyMH9JiHCDxjxJkE5/ZGuWw1Z9nfpqd06QVInQPcwXD3mch6Cqy2Ld5SaCxrCb/gSYipTU8GDoYl+JedC/ceCiGnu8gkDHDRgAaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030813; c=relaxed/simple;
	bh=3NqO6eVbrXX/cRQeGKUaJ+fn1JWd+H66/vjlZAx6154=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiKZDd5rFb7cLDTXcZ3PhqlE/mv9wpGfXgRp3De7w7aHjR5cI/Ndlp6q6qoHScLaIN7WBPFXOy36zUcNHNmzT5JJX9Q8xZFr0xHOcLt7PUq0ViGX7fqZeL9b0NQ98TEwc2czd/fKP0PSWCt5NBXRK63A039/dbjDI0envuehWkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y740rL6r; arc=fail smtp.client-ip=40.107.200.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y740rL6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpHp1HlMaVNZo4DqtuYaF68cCUYQnE2q6ghWRMvQp+TkNnG+8KypkhM7W7BsODFxe6tKnY/ZRi4K8x8Wp/IfgJ0eSSN/q+0el/foEaG+uZBysrW8UU1ldBrxTPtCW9P+r1pf8t39+CmzuCpOcejIMr652hUwuXz+GE3xW+pB4l4Wp833PTc0VMvU9BCBg7IaiFrxwYJNq0q+nv1tb4cpKp7h/u/wd7Z0QwzewprfgN0+QpODaZPX+XxFDMbOHI2NaStUhibTkJOX1cnjs85sGu9g6nqVZrdhSUeBkVVQxapGlnRYdjCIldgEUhebS7bFp3gBEJ7Nkkoy4QfHRJ326A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAifzju3wZ1A+xHtqfgAtF8CkQ0wEMWz/MvzsNxctj8=;
 b=w7SdwUBgJIiTfvwqO0d/ya6eELrG85JREHWqZTkoDWg+kpRFN4xDVj0yRzlmDUGuEp47wk7fCNu2ZC47aeSGKjU1lwQacIxLNgrxbxot2A4B5paB1M6jTqCvkJhABqU7xFMEWXgj1kFpwpxgLAHm/kpVlWNKD0UKJzcZfdeYQs5V3Pq5pjZmslo4I5c+rzwjNIykNzJ8MJyh1nCOzMbzU/Tj3srAaMpwRc1j6VsWZnJMbJhm4rASaOCNGCUcpUrjBMZ3+/4+VdJkxFcb0oHmNYbvcnVurHRg3ZUtLJBYzGSBkt+Qv258iRWPrfwVWez/Va8w7Zr8tMwK8JvMmqey6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAifzju3wZ1A+xHtqfgAtF8CkQ0wEMWz/MvzsNxctj8=;
 b=Y740rL6rBebjL2fAS2Wizxqqt21bvbPMJTPxlK0//BBWcFPRh0xBjho5331qY+c1ptYzz6kzn2eP8hJUKMIbrpGK44PjE19tpdWETh/k+eiHSTp5HAV1/K/7pwoKwqZknMlEVuDO5jzx+BzCWT/HD/f7Z/UIYOagc4jfBHAs39JBs1aXm5wHTvDufR7HM03vpIukYDnE/9E6Bo4VlW+w26mg2YJia90+43fKzQIbCJn3T344gGdS8A69poSeCClMuB4C5vo2wKUrameLNgadcbyzrWc6pWumVqVM5JeY36tYqJgXGnI4Jbg+6nVtpgPoQ8rIxur/oErDYqt54pJwEA==
Received: from DS7PR03CA0046.namprd03.prod.outlook.com (2603:10b6:5:3b5::21)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:59:53 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::3b) by DS7PR03CA0046.outlook.office365.com
 (2603:10b6:5:3b5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 08:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:38 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:38 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 2/5] firmware: tegra: bpmp: Add ACPI support
Date: Thu, 10 Sep 2026 08:59:16 +0000
Message-ID: <20260910085919.2522241-3-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910085919.2522241-1-anrao@nvidia.com>
References: <20260910085919.2522241-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cee797-137d-4b1d-f6c9-08df0f19e0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	u6Yiwz9QIIVML/GvCKsTFB03kVgPQ1rQTu8sqmANMm1+qWyAmAD1c59wpdLLnVYym1EdjYMRbAJ8F99RR9xtF7hB3x7ehMAE7s+OHLhqAq+Cq4/dht7ypc32Xzv7ZnOaEGNhF/7y+Hn7B3hi4rB+0vbwm7F80TkBKLXKD2Djk6k4b4cHJpgEak9qj/0kY3/yWnkDoCEUaXLLJ10NV4OeaAJimvAjfptoAHTgWgVQKvc80YZ7jwyKFNQxpbPOlTvMjeT4vWk+Fp0EsxL0IXNUdbEAGo609gFWqT8Qa3eKwZNcF36KEoa7hmXR/c2BDLfj7lYSBFEaER3NHjtQH3mRw5/wuRZ+VrLLPJOQm7VtPf68gSoKdu4DX7LLVDceMBk5uuZWhHu7e1eBX3nHlQd2d8vWCh7C3kg3zxIBFWaGEDlhVA9T3012KoEzluuoHfXRY3bQsQGwZZuXshezryv76dFxMq5MGyarwWpt8Rr1dit26aAQ+KaH5clCkl//eTrMhpXL6RRE1fLrX8x5xRq0L32PKNBNBNS3zmVM/dUj5B5ankWAsCmsffKRsFvN8J8TYWi1KNKdsIuQt/q+RXMc4eM3irTJd3ol2HLYIz0cy5RqciSRxV/NZk5pKzNimuXPg698p5sDl0vaLxoTtuLO5al+j3xybmmHCAFei+uC9135LVuInLNHj+dkw4YW1QOdAnPqKRHCfEynXV58XWp3Dw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8HwapbRPvHHwBo3ZGnN5fscSWrKajLHWBRn+OvfCuw4UqjhFpmZcY+DsfhV9/pK+kJzhHvsQBipcfeRB8SprHmugFRM47FOt0UqAYdfN8sF2UGSVQmqgV7x02hmAHIYbuxIj09vq+K+g8+RK113Bum3Rh/ZKP7HVvJ+FV66K64NsqQDi6h/GThqjsu97tXwgeHPaHNYIB5rXCPHCIs07RKbbWJ2PQFLfKT19bVU57Vp3XUm9W2GDO8iAXTgX3x1xG/5f9HfliBlz1Ekmxsrv6r+7qsV/dzicre04ihtHKJCzHQqKI7VMReUsK8FNIe/Yyvq2doaX1Sgkyc6DrsnXvprfO1ChOzyxsf9AJ7D8r1OI45RbbLtR9TdMPqwOU5B7gPFWihxda0mo7Sjho7BwrLZMRkUWCVF6SWUz6iDgu/4ruxVNs1dmF/zqyHQZV23K
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:53.0486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cee797-137d-4b1d-f6c9-08df0f19e0e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

Add required changes in the Tegra BPMP driver to make it compatible with
ACPI based platforms.

On ACPI systems, IPC is handled through the AML method instead of
the core kernel framework using mailboxes and IVC.

Bypass clock, reset and powergate init calls as these are not
controlled by the Linux drivers on ACPI based systems.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v3:
- No change.

Changes since v2:
- Rename the non-ACPI transfer helper to tegra_bpmp_transfer_channel().
- Keep the common BPMP message validation in tegra_bpmp_transfer().
- Remove duplicate message validation from the ACPI transfer helper.

Changes since v1:
- Use acpi_extract_package() and a common cleanup path for BMRQ replies.
- Treat short BMRQ responses as errors.
- Rename the mailbox transport helper.
- Avoid a dummy ACPI ops table and call SoC ops only when present.
- Keep OF resource setup guarded by the OF node in probe.

 drivers/firmware/tegra/bpmp.c | 224 +++++++++++++++++++++++++++-------
 1 file changed, 182 insertions(+), 42 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 0eb99b1c5068..e6cf08764997 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
@@ -11,8 +12,10 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/semaphore.h>
 #include <linux/sched/clock.h>
+#include <linux/slab.h>
 
 #include <soc/tegra/bpmp.h>
 #include <soc/tegra/bpmp-abi.h>
@@ -23,6 +26,12 @@
 #define MSG_ACK		BIT(0)
 #define MSG_RING	BIT(1)
 #define TAG_SZ		32
+#define TEGRA_BPMP_ACPI_BMRQ_DATA_SZ	3960U
+
+struct tegra_bpmp_acpi_message {
+	u64 status;
+	u8 *data;
+};
 
 static inline const struct tegra_bpmp_ops *
 channel_to_ops(struct tegra_bpmp_channel *channel)
@@ -343,12 +352,96 @@ static ssize_t tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 
 static int __maybe_unused tegra_bpmp_resume(struct device *dev);
 
+#ifdef CONFIG_ACPI
+static int tegra_bpmp_transfer_acpi(struct tegra_bpmp *bpmp,
+				    struct tegra_bpmp_message *msg)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer format = { sizeof("NB"), "NB" };
+	struct acpi_object_list param_list;
+	union acpi_object params[2];
+	struct tegra_bpmp_acpi_message *reply;
+	acpi_status status;
+	size_t data_len;
+	int err = 0;
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
+		return -ENODEV;
+	}
+
+	status = acpi_extract_package(output.pointer, &format, &response);
+	if (ACPI_FAILURE(status)) {
+		dev_err(bpmp->dev, "BMRQ: invalid response package: %s\n",
+			acpi_format_exception(status));
+		err = -ENODATA;
+		goto out;
+	}
+
+	if (response.length < sizeof(*reply)) {
+		dev_err(bpmp->dev, "BMRQ: response too short\n");
+		err = -ENODATA;
+		goto out;
+	}
+
+	reply = response.pointer;
+	data_len = response.length - sizeof(*reply);
+	if (data_len > TEGRA_BPMP_ACPI_BMRQ_DATA_SZ) {
+		dev_err(bpmp->dev, "BMRQ: reply buffer too large (%zu)\n",
+			data_len);
+		err = -EINVAL;
+		goto out;
+	}
+
+	msg->rx.ret = (int)reply->status;
+
+	if (msg->rx.data && msg->rx.size) {
+		if (data_len < msg->rx.size) {
+			dev_err(bpmp->dev, "BMRQ: response data too short\n");
+			err = -ENODATA;
+			goto out;
+		}
+
+		memcpy(msg->rx.data, reply->data, msg->rx.size);
+	}
+
+out:
+	kfree(response.pointer);
+	kfree(output.pointer);
+
+	return err;
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
 
@@ -389,19 +482,13 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
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
-	if (!tegra_bpmp_message_valid(msg))
-		return -EINVAL;
-
 	if (bpmp->suspended) {
 		/* Reset BPMP IPC channels during resume based on flags passed */
 		if (msg->flags & TEGRA_BPMP_MESSAGE_RESET)
@@ -428,6 +515,21 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
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
+	if (!tegra_bpmp_message_valid(msg))
+		return -EINVAL;
+
+	if (ACPI_HANDLE(bpmp->dev))
+		return tegra_bpmp_transfer_acpi(bpmp, msg);
+
+	return tegra_bpmp_transfer_channel(bpmp, msg);
+}
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
 
 static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpmp,
@@ -606,11 +708,17 @@ static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
 	msg.rx.data = &response;
 	msg.rx.size = sizeof(response);
 
-	local_irq_save(flags);
 	start = ktime_get();
-	err = tegra_bpmp_transfer_atomic(bpmp, &msg);
+
+	if (ACPI_HANDLE(bpmp->dev)) {
+		err = tegra_bpmp_transfer(bpmp, &msg);
+	} else {
+		local_irq_save(flags);
+		err = tegra_bpmp_transfer_atomic(bpmp, &msg);
+		local_irq_restore(flags);
+	}
+
 	end = ktime_get();
-	local_irq_restore(flags);
 
 	if (!err)
 		dev_dbg(bpmp->dev,
@@ -632,6 +740,9 @@ static int tegra_bpmp_get_firmware_tag_old(struct tegra_bpmp *bpmp, char *tag,
 	void *virt;
 	int err;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return -EOPNOTSUPP;
+
 	if (size != TAG_SZ)
 		return -EINVAL;
 
@@ -783,23 +894,32 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (!bpmp)
 		return -ENOMEM;
 
-	bpmp->soc = of_device_get_match_data(&pdev->dev);
-	bpmp->dev = &pdev->dev;
+	bpmp->soc = device_get_match_data(&pdev->dev);
+	if (!bpmp->soc)
+		return -EINVAL;
 
-	err = tegra_bpmp_init_channels(bpmp);
-	if (err < 0)
-		return err;
+	bpmp->dev = &pdev->dev;
 
 	platform_set_drvdata(pdev, bpmp);
 
-	err = bpmp->soc->ops->init(bpmp);
-	if (err < 0)
-		return err;
+	if (!ACPI_HANDLE(bpmp->dev)) {
+		err = tegra_bpmp_init_channels(bpmp);
+		if (err < 0)
+			return err;
+	}
 
-	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
-				     tegra_bpmp_mrq_handle_ping, bpmp);
-	if (err < 0)
-		goto deinit;
+	if (bpmp->soc->ops && bpmp->soc->ops->init) {
+		err = bpmp->soc->ops->init(bpmp);
+		if (err < 0)
+			return err;
+	}
+
+	if (!ACPI_HANDLE(bpmp->dev)) {
+		err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
+					     tegra_bpmp_mrq_handle_ping, bpmp);
+		if (err < 0)
+			goto deinit;
+	}
 
 	err = tegra_bpmp_ping(bpmp);
 	if (err < 0) {
@@ -815,26 +935,30 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
 
-	err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
-	if (err < 0)
-		goto free_mrq;
-
-	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
-		err = tegra_bpmp_init_clocks(bpmp);
+	if (pdev->dev.of_node) {
+		err = of_platform_default_populate(pdev->dev.of_node, NULL,
+						   &pdev->dev);
 		if (err < 0)
 			goto free_mrq;
-	}
 
-	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
-		err = tegra_bpmp_init_resets(bpmp);
-		if (err < 0)
-			goto free_mrq;
-	}
+		if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
+			err = tegra_bpmp_init_clocks(bpmp);
+			if (err < 0)
+				goto free_mrq;
+		}
 
-	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
-		err = tegra_bpmp_init_powergates(bpmp);
-		if (err < 0)
-			goto free_mrq;
+		if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
+			err = tegra_bpmp_init_resets(bpmp);
+			if (err < 0)
+				goto free_mrq;
+		}
+
+		if (of_property_present(pdev->dev.of_node,
+					"#power-domain-cells")) {
+			err = tegra_bpmp_init_powergates(bpmp);
+			if (err < 0)
+				goto free_mrq;
+		}
 	}
 
 	err = tegra_bpmp_init_debugfs(bpmp);
@@ -844,9 +968,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	return 0;
 
 free_mrq:
-	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
+	if (!ACPI_HANDLE(bpmp->dev))
+		tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
 deinit:
-	if (bpmp->soc->ops->deinit)
+	if (bpmp->soc->ops && bpmp->soc->ops->deinit)
 		bpmp->soc->ops->deinit(bpmp);
 
 	return err;
@@ -867,7 +992,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 
 	bpmp->suspended = false;
 
-	if (bpmp->soc->ops->resume)
+	if (bpmp->soc->ops && bpmp->soc->ops->resume)
 		return bpmp->soc->ops->resume(bpmp);
 	else
 		return 0;
@@ -939,10 +1064,25 @@ static const struct of_device_id tegra_bpmp_match[] = {
 	{ }
 };
 
+#ifdef CONFIG_ACPI
+static const struct tegra_bpmp_soc tegra_bpmp_acpi_soc = { };
+
+static const struct acpi_device_id tegra_bpmp_acpi_match[] = {
+	{
+		.id = "NVDA3001",
+		.driver_data = (kernel_ulong_t)&tegra_bpmp_acpi_soc,
+	},
+	{ }
+};
+#endif
+
 static struct platform_driver tegra_bpmp_driver = {
 	.driver = {
 		.name = "tegra-bpmp",
 		.of_match_table = tegra_bpmp_match,
+#ifdef CONFIG_ACPI
+		.acpi_match_table = tegra_bpmp_acpi_match,
+#endif
 		.pm = &tegra_bpmp_pm_ops,
 		.suppress_bind_attrs = true,
 	},
-- 
2.43.0

