Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D049370D7B;
	Fri, 14 Aug 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700232; cv=fail; b=RKzs4f6DwbxGhIG5uhPb7+copZHoKvslpg0Oa4cjS2P6Ic1N8TPLJckUPanYbjFdMF3winHXgASgzarttu34H5dMwlsQgcYeQD/TVegnMN51X2fz3z2/sIfNbjTIFfq/0LwJO0/2lgPxB1AWuffle3eOYcZyWMDnoMmsbaFS75s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700232; c=relaxed/simple;
	bh=4+F+hWyJTbl6Se7f39Xhx+ThffI4S7+9bS0DZxkbUsc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGUEQCZErMRK9zaAB/dUXf6iZUODR9g27Zl8JcdUMnnpbbfNlvLqjO6KcmfPqqljNhg1IP6og7bRof74ri8um7VGQE/CmAdRUiGK9dRLI5bodQWNp/qLilPQvH1lOyjYoj78CMEyYMywQtMeTd1ia8kccXZfdHktQp0rCrQXa4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UNPRpR3b; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNPRpR3b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ/tC0y8QL1jF7nby0TmjRoQCdIR/+zfNX89oXp+ToOqcYBjeDsPmxx15LaNwBK3GEsgPELxprkrWtZxzy83ESOIUfyXo3rQjh2vCnOXC2zqhSbTjm+1ErJDUTYECox0L1TOObPSifXJA6LQHL/CvtjplFruuBg5bsI/kqflQ5OKKi9bq+6/OwQ06whB+LTrQcwH59yWez9g55v07z1A5Jjr7PFn0YjKHClQV3pu3KU4By82Q2PTycqhYEE10rMevWVD5Zbkr+Jpyx7crZ939QoP+7g92crkWJTedCGEOJVFAUWKhIuPuWD+jM1roC9vOs18ImBM9kxGU9Zbldncxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8sizn/JSiBCN5FdjhslBcImKhmeeJtkH86uiqpv93s=;
 b=ywOJoCnOJARVY8MhAMC+Hf9cnRopuHqOBftEqIa1TcFpomahlLc7n/wkbyd7NqJLP4JNSySIUAWHRBqfKo380FTpZbpShhsrCvy7pRYFc9XMS6IK3U9ipy+IDLBkHT+nBd1BT3SRynrtT7UutTf9Z2kP1LgXAF0lp0KDNpIbebIkZvMyE3A3B3sktmSP8DynsHKQ/WTMj4AYbZBW7pDBNJl7oRb7EhGq/xWrnKbitkETJVt082NUoQ8Jw97Ggh1pZtM3B36Emw25YcH4AaVPrfGVNGzeVxUZTDaQ9tKBfdMgtLtT5y7sAdYtvCttUCgH85g1PP/Io35tZBDvO5Ds3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8sizn/JSiBCN5FdjhslBcImKhmeeJtkH86uiqpv93s=;
 b=UNPRpR3bnCrL7JVuiQPqqtz1LMSFF9dKMejNRwtKVVsFDbUJbk73yFKSe4pkaA8HdVQtpLlCnWtWjV5+iiwPK02Dv1hO+z1s/3lmV71+Q3TFf4bLgQFD3+LeWkknfEINqnaqEESZsVjqief40dnn0XtqvuT5p9YfaosXOTWSi0hNWn+0/gQ7fexyfKQwYdBpPA0/loQvfC2GRbQDNjqIhGKAaQliW3qjrC8HKis4Ffx4/EOOrttRzuvGIFnKocT/1oumaWZJZW4p3Qep6lb0AtOz3BGilhdpVZyaVAiIiM86J1vXIslWqoi5yc96jlpTdbciOlU61UVxbePfSCtFLA==
Received: from BL1PR13CA0129.namprd13.prod.outlook.com (2603:10b6:208:2bb::14)
 by SJ2PR12MB8064.namprd12.prod.outlook.com (2603:10b6:a03:4cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 09:37:00 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::5c) by BL1PR13CA0129.outlook.office365.com
 (2603:10b6:208:2bb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Fri, 14
 Aug 2026 09:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 09:36:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 14 Aug
 2026 02:36:44 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:43 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 2/5] firmware: tegra: bpmp: Add ACPI support
Date: Fri, 14 Aug 2026 09:36:22 +0000
Message-ID: <20260814093625.1567353-3-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814093625.1567353-1-anrao@nvidia.com>
References: <20260814093625.1567353-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a6603e-6b21-4629-325b-08def9e79715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|22082099003|18002099003|56012099006|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	/DwqwyA6DbcaZne5pdNlJQkEWW0bbmJiYWWx5MdVG297KhkjqP/vyApq5xykcyyI4hU/Qt+81psB52L9lrouRDlau3KsEdPrbUvGSFbcGiFE5NvtPsxQVXKt1tU3QTAZ+7/SRtxcC3mcIxkLrjLLCaxi/yVX7O6W9F57951QwQZw54jbabGQGKPl0DuRc7nM+1mrOQBLemU8dWkvMIDchwOInnBqwqnP3sEQ6nQy0X0DwGGeZK57FbOT9eV3Ljz9S0K4+s1kOfiR/DKZ9iu3WDm4dCgVy0yIt3XjDyStQ4NtudAKbDmv0UItoeY0YIzD60DjWQGDxMQ8piHsfFRDOlWLh0jM30ug/8XPaTlLBnxPK98EH8le8CADOJZqpECXnpSZqSn3siOQpREJkhIBfxDa1mUxf1GjRAan3IwFtPj9v/srDuAlW+iaVlKnaQBvttRAjrvv1sWR9Pps/rUxP+QfuIafhoJ4N3cACB3eanIaQLYViXHwZS9cE49gCxGkZbTSTmGVJIlZ6D3G2tq0phXXMYVMrxUUVxpnPEEa4Q70UTUim8SJBWaRha7pRqaDWOVumqAWkyHJlk8i8l4f3muvzvAbdcZGKhR2Quky8Z3DXRHXhTb0X1A3A5N8yhpQVM/82hjJe9z6/6kLlAJgyzHBDy5SmalFFKB3dvOCzwydadhJwUJNB3f6r9SzajE3aMOUCpnW/eNFKx6L2LqLag==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JBKtzC8udMa0CSQgTdKROjS0Ey5DF9Ru6eAHJk1m8/11XtnbYQ/UXyOhJC2xlDJMLb+ENdYSnHBegXFDv6O1F1LD7t++uAW0K5yVLA+/pVGEvafpovcU6Mye0q/FyWVQgqyJKd+Bd0Aqy1pFrL7pAOCrAfZJ+/CqGyMoMdtg4qEH02wSrajiEUKOvmSrtrdQEtixNVuryS8JYxIKVRrLTKi+x/0loMV27wQErpPmSlqc3mebng96Bu06fiReid2Wr93FNPFMCiXPS9eUBTJN5rx4eqwzlMryCfH8aac6FL4RJoCch75D5oeBZbf5FVLsh2fS/Mq/Jh/Y0g7ItMFXQzgIakWc6eGzQa4mIPZM7QptCBc0+1TWfIgkl/HE0RG6CuQfmdmoKWUHPERB+pSE5cCT9Ec67+hfB7T16Rx/BLxPlD6tosMmVmt2ZRLTVuOO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:36:59.8719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a6603e-6b21-4629-325b-08def9e79715
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064

Add required changes in the Tegra BPMP driver to make it compatible with
ACPI based platforms.

On ACPI systems, IPC is handled through the AML method instead of
the core kernel framework using mailboxes and IVC.

Bypass clock, reset and powergate init calls as these are not
controlled by the Linux drivers on ACPI based systems.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
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
