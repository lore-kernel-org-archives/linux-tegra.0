Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CC4C6F0B;
	Wed, 22 Jul 2026 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718404; cv=fail; b=DldVaqqpXPcp0SIPrxNErMCDs8AvYs8u0embefkIDARFcQsH2pGuSdy/Nz9/128MQleFIQWeLPvsDCw401bseuwoUFxH7LDTw5/6PXGnE5m+dLmyoYtET1UUhAbUKvZkWwJcVKvURazT8kdI3pUXXXcjwc1f8rfOI/QC9Aa/DtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718404; c=relaxed/simple;
	bh=XZ7eMpCosCSAfKhE1J51/PT5HQoCtV9SvXdsgr+PBgU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/XS5+ci6jHWSGnP+eMKxJUKEz4iK1y0Y15Yo+BvMewDkMpblXf2b+4J5v06GghloS2WYS8rY02LuqXH6I9h7yMgmR4AgIWwokZIxZiP2LHOs2B4hYy96mHxRkT3qmn1souAlK2UQhTO4iP1xy2ZYfUfO3FLCwbDVhkhxnZ+G0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qki3FCvJ; arc=fail smtp.client-ip=52.101.62.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qki3FCvJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px2233yDVuCq/BaSC56xHKc6ZKmtEWNyBjsTQB8x1xaI5FhWjvyl4ELA7EBL7diK/hAym4ig42311aXZXu51QinRz+6dxfiq5L+E2/b9omG/rifrIsM4EcnKd4CvLlAA8K8ZKS05/qTqyUJY4WS0mcJeXIp9Jdd3N8WCzfO3R7vPCGUB0TY/athzCgRuGCMAplxSSZuDZ/FBxMBs7z7j/eIG0Pax4E4jJYj4LUyimAOwXg/52NJiBPg/AxAhrUO2liCMOZtwMLsMg9yFu7C/l1KBTCCGhveBZRyhDqE3iZgSjm8j/AC970ATC4NowzkbgR0OkLecpdkdcmSBY4pQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/0fSSOPXiHd1AlseO8DSfy1hpkYlVVI2z15PKHfZks=;
 b=oqfopvz59QXrZTFgC1xqsNPJgn11HPeucrNXrGg0bnbun+t0xPeKuiHv+sYQcxauLrckSONdca9faAbLf4qnPeccMf6R8Fo8iVMlf/eo6VAZ7NN9GcvJxBzCh3fXaQpYKDtNHrP3rDo7JIN3TnWsFAFnamtewttJkwkOo5Hjq3wjhWHl4SeZTNdeGj8mBJw4lFQbD+RD7UhXHdbb19H2zhCJvegUXHg0KgqtYmYsYwPkH6Djuks8iOF+isT/FPkKEaDMh3R+VKDHRozQDUL0EiohMGDuV1ixi1vGbgY/NSYbiOYIxqjU7YFjg10w01adUZiAMUehfIGs3aR8tM02Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/0fSSOPXiHd1AlseO8DSfy1hpkYlVVI2z15PKHfZks=;
 b=Qki3FCvJj8poUVEe1q9HL0axUod9BnJs/9XEli6i9gV04kwIsL/SK51YeTwxWt8S651u+6bBNCKZEHOmF40EIH9t0Zd2Xg/gEJvFN6AK3c8IjzbTrUyoNu7wpc51UTN0BxGQmJbmMhTxFP7kJVM8eLcYid8aFxWzOSRqo0b/IrPVw4YgtBynTmY/zfyBj4sWJcsFq5x2Xchfoo91US26CuVikY0o9JK5RlGPgaZVTKgyc+D2k9XPIS3iieuG2xY2OENKx3hZ7rAC23N/MLLKGV5PyLMBYDdvPxDIRuvjqzC4MjcBk/8FFxARYrYRxlNTt5KZkj+SqoUJ7CCSvNoraQ==
Received: from PH8PR02CA0032.namprd02.prod.outlook.com (2603:10b6:510:2da::11)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:06:36 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::c) by PH8PR02CA0032.outlook.office365.com
 (2603:10b6:510:2da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 04:06:20 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:19 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 2/5] firmware: tegra: bpmp: Add ACPI support
Date: Wed, 22 Jul 2026 11:05:41 +0000
Message-ID: <20260722110544.193551-3-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722110544.193551-1-anrao@nvidia.com>
References: <20260722110544.193551-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 327bc27e-8e97-404d-593c-08dee7e14bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QkhvFmut6iI1CDm+m1z122I44/MS2gJEDbUcRuEjiJNOHUa8vH3g8HarplCKtO8WytQrxE/0kQ6Os6IuaGfeyCBCBWpQGoTKfv6I15hFAfXsR0LkOSCXZH87g1GRG38OOPdmw2xWFsGpQbgcLjBflPYOrnBnmPdK54I5hi6kdd9yZYTLmwTeP93a4w9GdvU493F/2CXNkZIlla7L8UcWMZuwfqcWAHE57MWGlvShDOoo7VhcBfbERJgdE/wloXfZ9peSU3wT3hxaysLqUp6ZyYe0hTtmb7AkcXdW1fW1LI3bIxHwJO5naa85YB5E1SzXDujwaKderOzYVdpqfmN8NnnAqkJJ8j7N949PbxVnlLLw5+58vzsJ5LiLj4JRME1cbK3BNpWHRJFnzTiZ3fVhg6k2YOTiqONa4ufrmIVE+Lwrbn/rxZWqYYO4RH4mmf46hXTyzfi4y0wdhCyKZY/z+OIsrcnuPKuvxyVlm2W1PVSZZT+Cb+h3o3pJoUXYUN+5EWd3sCoW50No3+Y+sTd5EuZLNNV0Ycs6kYE3YitpD5wE+t6l++3FZA5MV6bUbeEZKyiNz+aqdytgUJT7lHHHnnb7RMO/w4csbiy+Np1ZvnVBXdaqtKzb0lpLpPysTeUAVH0OWwixfULwoPP8y5tI1M1EK6eI+ISq+SnejdG+YdQRhTP/+ePPFwjyL0y90Fbvyf99SRYF+UwoEd6IyfclsA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ebdXKXR1ini1U/2xjtEb/smUNH99nzLQ3mCzUWclsAF3HpMAtcL1m1e4kZcCjMqBqeYTO+j8lgVcRLgETBzT5AG1ivl8NaCRlrhRfUcN95moo73xWbtTR7nI1+PjBO2+HGGpqHkhVM16qCQ9sDtsAt2JrL2Z1DqiVcrLwaG+Q2SMpq3kO2OSwfq02w5mKI+hAX4tcTa5XPmNN/bqw+eoKbxW7xGhDn0HTm2tCkU+58pStYsuPGxXVF33BVgJhKS7NNF+6JslnRd2BPUDK/SWrDXo+Qd/1qaHKAKoy/zv7m8uDLDEljkvKOam94iFxG693iPIcfxNv+KYCMRducQqWC7zaXyR8lHqNNOEAOWreEHdI/ljZIcS2orsS/PglN8i1lgek8TsygBO8dM6aB2ZU67Mys3wNk4rrugcexKJN6Ky14OwtoCJE9VdtX1wADBB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:35.7761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327bc27e-8e97-404d-593c-08dee7e14bd0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

Add required changes in the Tegra BPMP driver to make it compatible with
ACPI based platforms.

On ACPI systems, IPC is handled through the AML method instead of
the core kernel framework using mailboxes and IVC.

Bypass clock, reset and powergate init calls as these are not
controlled by the Linux drivers on ACPI based systems.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v1:
- Use acpi_extract_package() and a common cleanup path for BMRQ replies.
- Treat short BMRQ responses as errors.
- Rename the mailbox transport helper to __tegra_bpmp_transfer().
- Avoid a dummy ACPI ops table and call SoC ops only when present.
- Keep OF resource setup guarded by the OF node in probe.

 drivers/firmware/tegra/bpmp.c | 221 ++++++++++++++++++++++++++++------
 1 file changed, 182 insertions(+), 39 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 0eb99b1c5068..2dcb74a45b59 100644
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
@@ -343,12 +352,99 @@ static ssize_t tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 
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
 
@@ -389,16 +485,13 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer_atomic);
 
-int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
-			struct tegra_bpmp_message *msg)
+static int __tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
+				 struct tegra_bpmp_message *msg)
 {
 	struct tegra_bpmp_channel *channel;
 	unsigned long timeout;
 	int err;
 
-	if (WARN_ON(irqs_disabled()))
-		return -EPERM;
-
 	if (!tegra_bpmp_message_valid(msg))
 		return -EINVAL;
 
@@ -428,6 +521,18 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
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
+
+	return __tegra_bpmp_transfer(bpmp, msg);
+}
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
 
 static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpmp,
@@ -606,11 +711,17 @@ static int tegra_bpmp_ping(struct tegra_bpmp *bpmp)
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
@@ -632,6 +743,9 @@ static int tegra_bpmp_get_firmware_tag_old(struct tegra_bpmp *bpmp, char *tag,
 	void *virt;
 	int err;
 
+	if (ACPI_HANDLE(bpmp->dev))
+		return -EOPNOTSUPP;
+
 	if (size != TAG_SZ)
 		return -EINVAL;
 
@@ -783,23 +897,32 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
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
@@ -815,26 +938,30 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
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
@@ -844,9 +971,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
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
@@ -867,7 +995,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 
 	bpmp->suspended = false;
 
-	if (bpmp->soc->ops->resume)
+	if (bpmp->soc->ops && bpmp->soc->ops->resume)
 		return bpmp->soc->ops->resume(bpmp);
 	else
 		return 0;
@@ -939,10 +1067,25 @@ static const struct of_device_id tegra_bpmp_match[] = {
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
