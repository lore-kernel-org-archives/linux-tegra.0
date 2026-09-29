Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E793E4FD7A2;
	Tue, 29 Sep 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676004; cv=fail; b=ZdKOnyowMVYnvYpZuOgy73dg+HMZi1UHIOhAIa7XWDBrvZrA3G5MvDmdsDB4ZRhI33u71GBXwgb/JPcL7SQKyUx2ZDb5a5J1FVqaH4MkvKcGDr2HDAy3p+BQv1xDdzMlz1AJmCdOuEOIJ8kKERCnDo/qsZQddMX9lo08sP7OcLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676004; c=relaxed/simple;
	bh=RKvCpPcdCa4Ib3tBKBpe2UlTktbqvUfuMQnLN1LSUgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mp7LeLAVXljV0jWGszwVlOtEvo0E6HtzzmBCAqHTLWUUDE8kVdj7NGZic5EkeRNmf/BogNFMpx4hSsLo/jvcVscLl0ghWjUaOFA0aoTFA36ZWCvhTnrTlYxpQkShkm1/g49fAHtIEb1aRUlmMboprx0T0X/uLOxV7/zeFHvXP2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZkSeLrmW; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZkSeLrmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXDXoqavmN7DYMR4P4P/lu5nRk+VgOQJptJn4PrcysWVWlT9AFs74IuaZDjN4roXg77mGNFyFhD4OqVk7aKiDGCA00BPVTRAFh3enG2iqyzRH8I69NBcvhb6FUayIy/HTrpauechpOC4kNncnVqT/ff0tVlzcOQwXR8V/TmCIV2GuZV83ka0EdDzXfkI6BTnUugPunRygK0TLSiCX6kvfLb+pL7sSIEe22AxVgr5kuBLtl3Smb1E64S1ipf5nL5cLXGM6XD5rkxHqWM2GGvc0slEg+UMMYfgtXzbdNOzCXg7NWZS+AuapcRQLuGy+kYRKukoI/CucFtazPNL/2Bprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd8HKpLrWlC3R0o1Nd1/YC/zI6YFHYjgLg9lp0CnwZo=;
 b=SV/ULPmEyeiPNgza1lQ3Q3EKgrxvD3xoqFp1kBeSNXJRFmP9YCvlfr9ryckfOtU/fKh+CVFpTkXu/hN2QfU1DO9KvXfp6Equ9e0KpMY8HTQGVLgaer1xliVqM1dCDsLRRj2jmAAeyop3kCE1KZtfBOEmSh+d5sYeYkFXeicNnxjN11XanU+PNRSOVHCAvC88lo8e5XM8GQjL0D8pwlJPE3QqOApueOaKh+P410qy+liPX7aI8YUzGkzzuC67yr/le13/qyVCMBhUzESA8DAeCkGe2Vcvcs/bqzhOcfb8lz+y+Rst6a55gc0Txe4ivpb8Fw1s7I9Aqq1+fUg2IW9dWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd8HKpLrWlC3R0o1Nd1/YC/zI6YFHYjgLg9lp0CnwZo=;
 b=ZkSeLrmWFRske4oZcYD4YtJSs9UVdl8vLsbg3RRibElQiprCou1OSymwkJxG0E+cYc1V6JnlUQ/nIZYp1X044yZyxUJ4aVebfI1G5PNqIYP7hhlt+Cen9LworUcNaC2TluT62KrH7UfY+PWzZPw1J9MzYSJkac17J6knnkN9bSu60NGesakNl7boeC+EzFy1wf26Q0xKZT3zO2zrlExdxLrsxsI0hKZ4QDvQI8vTslhGLZNew0QSL2/5rU1PhOJS8w8JNRp7OyvhclRe2HUE8jx/q761Sx2JY49tpIQO9YACrLQc12e9qneoW0PwWRhB0TNvcOIPkhPoQ9kC0W60Ig==
Received: from CH0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:610:32::18)
 by CY1PR12MB9625.namprd12.prod.outlook.com (2603:10b6:930:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:59:50 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::2f) by CH0PR07CA0013.outlook.office365.com
 (2603:10b6:610:32::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 09:59:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:34 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:33 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Date: Tue, 29 Sep 2026 09:59:12 +0000
Message-ID: <20260929095915.2215685-3-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929095915.2215685-1-anrao@nvidia.com>
References: <20260929095915.2215685-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|CY1PR12MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 4118c348-b226-4822-3cf6-08df1e1066f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|22082099003|3023799007|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	wTwCh9qxS+ZYzQ53hV3l0mNYL+p0H9rAdBSXpQuzdZIljyhZ68SOLABV2D5vmD7qlsfx1M3CMmu0j2/RPBNqlVWppLnWePAtbRXW0pdU8JEiCB4YeJ44akIDsCIyKisAfqvb7PvSwK3Ldwu6M55Sb+5Q0wG2gi3/uj80/0+wy8f2KJSCUbAo17eyuexLFHkyaeqD7oM0nZSJjlVkAmwqawDZpkUSLWm1brkbHoRqdiTUAhPSnNvj+/kBpd8YZ9HMb9FXOmjns1L1Wyid5oQAL83BA0ZdHPzgSCp1H6pzobJKcJ9KZm6QU6DD3PwYWmKeVWY/lGpVubRmZVPfaeQT2Q2rdTW6fTruehTQiJbD6NsrRdO4bj+tGpN/6efjr93W66ATyCeenx8iL5mnxq2tdJPlzzhspb3wNNvrUd6nnonsLOZzJI3nOhmr7B9za6SUjXoK15AiPcCOY5yIz6iPIVPLPMUV6Pd8IRqoR1euklNjiJQrdTjTQ5QCe8mIZq9GQtu2TADWxtzH26ty+P1kgpTvB9sqJHqTlwbJdGu+LDuqOKFMzK4ZTq/zWtxboGcepAmnJt6cQjS9k2ifMAKXGQQLS+cClKVyFF5LKY80FOVwnbNLjmWqeUHeakAhbc7K9RJu08r3GEaMbsfFIFVs5TNC6s9fRoWCaTZpkLd2I1PID3R3GokvOBNCKqZ4IeeEiMSlnBI67mtPZLm55m+pFA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d7CKCr9+53OPjKSHOSwT3pmDHHQtEXS5bB+xKekJhDTzcw3emY6i3DJeJWnTnvD5ps2mRb87GLNei0iDlsxVS0qUTaXcrQfDLdvKt+N38YXUcbXIfjuwUbuwPdBANadqQAGMHHzDPchyQsLsHadiF4ng2tOnoJ1xaq/FEOrfvLB9yWTnHYq2lkM1LImjlWR0G2yhxfmIty8PQLrDcCeGdg1NhK5l8oW3PuQ7/evc6YeVNo+TXJ3tTuFdNBHlLQAFP+EEUWTtZYZlnfH/S7zXbmDKPiTNiginKQgn2nScUYtO5CSkFRLk/5IupLE1l6oAA3+8gj5Y+JFLD9Z7NRWwyGKd0ujFD8jORRqVQWkVC/PgAHeENNY4+c0xOziJc7GvF5l1qOBW3uhdNOY6Mau8IBwjpvl9jAiFek+RvmdSct5cA5nJ8TaCoQMCCAqqa0ez
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:50.4162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4118c348-b226-4822-3cf6-08df1e1066f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9625

Add required changes in the Tegra BPMP driver to make it compatible with
ACPI-based platforms.

On ACPI systems, IPC is handled through an AML method instead of the
kernel mailbox and IVC frameworks.

Clock, reset and power-domain providers are not controlled by the Linux
BPMP driver on ACPI-based systems, so do not initialize them there.

Keep transport initialization in the SoC-specific init operation. Use an
optional init_providers operation for DT child and provider registration
after BPMP communication has been established and the firmware tag has
been read. ACPI platforms leave this operation unset.

DT transports register an MRQ_PING handler for requests initiated by
BPMP firmware. This request direction was used only by a diagnostic
command in older firmware and is not provided by firmware on ACPI-based
systems. The ACPI transport therefore does not register an incoming
handler; its init operation only sends the outgoing MRQ_PING request used
to verify communication with firmware.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v4:
- Move BPMP channel allocation and ping setup/teardown into the
  SoC-specific init/deinit operations.
- Add an optional init_providers operation for DT child and provider
  registration after BPMP communication is established and the firmware
  tag is read.
- Add an ACPI BPMP init operation for the BMRQ ping path.
- Remove ACPI-specific setup and teardown conditionals from the common
  probe path.
- Drop the redundant NULL check after device_get_match_data().
- Explain the transport and provider initialization phases in the commit
  message.
- Explain why DT registers an incoming MRQ_PING handler while ACPI only
  sends an outgoing ping request.

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

 drivers/firmware/tegra/bpmp-private.h  |   6 +
 drivers/firmware/tegra/bpmp-tegra186.c |  14 ++
 drivers/firmware/tegra/bpmp-tegra210.c |  13 +-
 drivers/firmware/tegra/bpmp.c          | 265 ++++++++++++++++++++-----
 4 files changed, 246 insertions(+), 52 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 07c3d46abb87..163b1c82d445 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -10,6 +10,7 @@
 
 struct tegra_bpmp_ops {
 	int (*init)(struct tegra_bpmp *bpmp);
+	int (*init_providers)(struct tegra_bpmp *bpmp);
 	void (*deinit)(struct tegra_bpmp *bpmp);
 	bool (*is_response_ready)(struct tegra_bpmp_channel *channel);
 	bool (*is_request_ready)(struct tegra_bpmp_channel *channel);
@@ -26,4 +27,9 @@ struct tegra_bpmp_ops {
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
 
+int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp);
+int tegra_bpmp_init_ping(struct tegra_bpmp *bpmp);
+void tegra_bpmp_deinit_ping(struct tegra_bpmp *bpmp);
+int tegra_bpmp_init_dt_providers(struct tegra_bpmp *bpmp);
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 64863db7a715..c34f6d2d275c 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -325,6 +325,10 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 	struct tegra186_bpmp *priv;
 	int err;
 
+	err = tegra_bpmp_init_channels(bpmp);
+	if (err < 0)
+		return err;
+
 	priv = devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -352,6 +356,13 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 
 	tegra186_bpmp_reset_channels(bpmp);
 
+	err = tegra_bpmp_init_ping(bpmp);
+	if (err < 0) {
+		mbox_free_channel(priv->mbox.channel);
+		tegra186_bpmp_teardown_channels(bpmp);
+		return err;
+	}
+
 	return 0;
 }
 
@@ -359,6 +370,8 @@ static void tegra186_bpmp_deinit(struct tegra_bpmp *bpmp)
 {
 	struct tegra186_bpmp *priv = bpmp->priv;
 
+	tegra_bpmp_deinit_ping(bpmp);
+
 	mbox_free_channel(priv->mbox.channel);
 
 	tegra186_bpmp_teardown_channels(bpmp);
@@ -373,6 +386,7 @@ static int tegra186_bpmp_resume(struct tegra_bpmp *bpmp)
 
 const struct tegra_bpmp_ops tegra186_bpmp_ops = {
 	.init = tegra186_bpmp_init,
+	.init_providers = tegra_bpmp_init_dt_providers,
 	.deinit = tegra186_bpmp_deinit,
 	.is_response_ready = tegra186_bpmp_is_message_ready,
 	.is_request_ready = tegra186_bpmp_is_message_ready,
diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index 6295f5640c15..dbd02f750c2a 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -166,6 +166,10 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 	unsigned int i;
 	int err;
 
+	err = tegra_bpmp_init_channels(bpmp);
+	if (err < 0)
+		return err;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -220,11 +224,18 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 		return err;
 	}
 
-	return 0;
+	return tegra_bpmp_init_ping(bpmp);
+}
+
+static void tegra210_bpmp_deinit(struct tegra_bpmp *bpmp)
+{
+	tegra_bpmp_deinit_ping(bpmp);
 }
 
 const struct tegra_bpmp_ops tegra210_bpmp_ops = {
 	.init = tegra210_bpmp_init,
+	.init_providers = tegra_bpmp_init_dt_providers,
+	.deinit = tegra210_bpmp_deinit,
 	.is_response_ready = tegra210_bpmp_is_response_ready,
 	.is_request_ready = tegra210_bpmp_is_request_ready,
 	.ack_response = tegra210_bpmp_ack_response,
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 0eb99b1c5068..bd8564865638 100644
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
 
@@ -733,7 +844,8 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	spin_unlock(&bpmp->lock);
 }
 
-static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
+int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
+
 {
 	size_t size;
 
@@ -773,68 +885,95 @@ static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 	return 0;
 }
 
-static int tegra_bpmp_probe(struct platform_device *pdev)
+int tegra_bpmp_init_ping(struct tegra_bpmp *bpmp)
 {
-	struct tegra_bpmp *bpmp;
-	char tag[TAG_SZ];
 	int err;
 
-	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
-	if (!bpmp)
-		return -ENOMEM;
-
-	bpmp->soc = of_device_get_match_data(&pdev->dev);
-	bpmp->dev = &pdev->dev;
-
-	err = tegra_bpmp_init_channels(bpmp);
-	if (err < 0)
-		return err;
-
-	platform_set_drvdata(pdev, bpmp);
-
-	err = bpmp->soc->ops->init(bpmp);
-	if (err < 0)
-		return err;
-
 	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
 				     tegra_bpmp_mrq_handle_ping, bpmp);
 	if (err < 0)
-		goto deinit;
+		return err;
 
 	err = tegra_bpmp_ping(bpmp);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to ping BPMP: %d\n", err);
+		dev_err(bpmp->dev, "failed to ping BPMP: %d\n", err);
 		goto free_mrq;
 	}
 
-	err = tegra_bpmp_get_firmware_tag(bpmp, tag, sizeof(tag));
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to get firmware tag: %d\n", err);
-		goto free_mrq;
-	}
+	return 0;
 
-	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
+free_mrq:
+	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
+
+	return err;
+}
+
+void tegra_bpmp_deinit_ping(struct tegra_bpmp *bpmp)
+{
+	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
+}
+
+int tegra_bpmp_init_dt_providers(struct tegra_bpmp *bpmp)
+{
+	struct device *dev = bpmp->dev;
+	int err;
 
-	err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
+	err = of_platform_default_populate(dev->of_node, NULL, dev);
 	if (err < 0)
-		goto free_mrq;
+		return err;
 
-	if (of_property_present(pdev->dev.of_node, "#clock-cells")) {
+	if (of_property_present(dev->of_node, "#clock-cells")) {
 		err = tegra_bpmp_init_clocks(bpmp);
 		if (err < 0)
-			goto free_mrq;
+			return err;
 	}
 
-	if (of_property_present(pdev->dev.of_node, "#reset-cells")) {
+	if (of_property_present(dev->of_node, "#reset-cells")) {
 		err = tegra_bpmp_init_resets(bpmp);
 		if (err < 0)
-			goto free_mrq;
+			return err;
 	}
 
-	if (of_property_present(pdev->dev.of_node, "#power-domain-cells")) {
+	if (of_property_present(dev->of_node, "#power-domain-cells")) {
 		err = tegra_bpmp_init_powergates(bpmp);
 		if (err < 0)
-			goto free_mrq;
+			return err;
+	}
+
+	return 0;
+}
+
+static int tegra_bpmp_probe(struct platform_device *pdev)
+{
+	struct tegra_bpmp *bpmp;
+	char tag[TAG_SZ];
+	int err;
+
+	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
+	if (!bpmp)
+		return -ENOMEM;
+
+	bpmp->soc = device_get_match_data(&pdev->dev);
+	bpmp->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, bpmp);
+
+	err = bpmp->soc->ops->init(bpmp);
+	if (err < 0)
+		return err;
+
+	err = tegra_bpmp_get_firmware_tag(bpmp, tag, sizeof(tag));
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to get firmware tag: %d\n", err);
+		goto deinit;
+	}
+
+	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
+
+	if (bpmp->soc->ops->init_providers) {
+		err = bpmp->soc->ops->init_providers(bpmp);
+		if (err < 0)
+			goto deinit;
 	}
 
 	err = tegra_bpmp_init_debugfs(bpmp);
@@ -843,8 +982,6 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	return 0;
 
-free_mrq:
-	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
 deinit:
 	if (bpmp->soc->ops->deinit)
 		bpmp->soc->ops->deinit(bpmp);
@@ -867,7 +1004,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 
 	bpmp->suspended = false;
 
-	if (bpmp->soc->ops->resume)
+	if (bpmp->soc->ops && bpmp->soc->ops->resume)
 		return bpmp->soc->ops->resume(bpmp);
 	else
 		return 0;
@@ -939,10 +1076,36 @@ static const struct of_device_id tegra_bpmp_match[] = {
 	{ }
 };
 
+#ifdef CONFIG_ACPI
+static int tegra_bpmp_acpi_init(struct tegra_bpmp *bpmp)
+{
+	return tegra_bpmp_ping(bpmp);
+}
+
+static const struct tegra_bpmp_ops tegra_bpmp_acpi_ops = {
+	.init = tegra_bpmp_acpi_init,
+};
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

