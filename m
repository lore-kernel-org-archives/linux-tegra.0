Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B334F476;
	Wed, 21 Jan 2026 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009457; cv=fail; b=hjlegEX9FksGApc3klgv+nJ9PuPitOUMNXxPl8MTedQiz24qwAuKVl9QQQMqn+PhkHOGvVv1OYprpr1xPWCxvQWAjgfZDYk5j+DsJlBqTgDqU0lwSILNjqn/aXAiVaHZ+SQNgh9czSMief8w6ZS334F7N5jymxLL05XbDRE3cPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009457; c=relaxed/simple;
	bh=wvKBrYil3lJv1ZjUk6HE0tJoURZd2wnCX258RYfOJM4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqNLGSw/pxP081xh/yY78JA8V5+suQO5KiHypUiUWIOj+uzL8yTQEBdfuqFYMVpdXCxy1fqoV1drLp5sfDt4C7UO+NdtvP92yC8weIdjanlall+FBmdew37jrwyeE6/miUEv0CMTunAZ5Wko1K96iYuQAFfZ7ZSlBQcgSEd0L4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QdTZxWZ4; arc=fail smtp.client-ip=52.101.62.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QdTZxWZ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnXj+NtaPxAEUbds1ZMNHi2TkD025nP2c+z+kVf6RWmJXb0Jfdv729XGlcpUtTctbZ91AlubbE8Q0tI3NngLFptdDuHD2d2CmbrK+ZujgqRdRetrorAjhiLubNcZbYgvV0rKHhTk5AIONY62vvxKZNfdXdVtxi/rIAi1aoagU4cDj9rwQSLG3lrokxrZgOKf8hwriye2fTGoVubukx2Svs6cVaJsD2i2HV4nUMLcWAWSl1lxk1JuQCKI2HkkiQWMJQGHaYZH4LLgHWdkvahuqaIh5NMcjW8efkM0arbDGJzrA7vCzr3bqswoRKHFBPH6IluL4IE3fMdcSz2T0IYHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/4MxM0v9Q8nvavAj6lDMKiYujcnbDBrIp8y4RrY/vo=;
 b=n2Zmt4uinKjyVUMuCLjkNBEEjgFtByjzzcCQ5KBb6dkiYbJlDPcZ3yifY4HHIN9EPzB3s3DEjDIYlhoGsfz4LcYPn4Rvt7o+McQlw8ZPCyOYZvt5ZLEFel4vxTeMInPGYdm45j+LRXNWx45RUvedbZ2pTIq1upZFXZF7EFh0Xpt9MB6SqiHtbvFy8pqjHJOjTMQLIvpbnFlJMwEk08JSAp5HiND3jeoSDD36QXXvyIfbRJpwobcNFontcxaVHVrS3hwzBVO7LCY8KSWps9y2lJ+cs2jVeRfY+6m4BN9eo76eAj46PXpOYxLAPieBoD6t+Sx0OTeKXKpL0vmEYaTavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/4MxM0v9Q8nvavAj6lDMKiYujcnbDBrIp8y4RrY/vo=;
 b=QdTZxWZ47S0S4EeEqkI9ERuxnuYK11OWghoPbcw8wMAPKW3YSPid7f5WSAGIctdNlIFSMAthX2+KifcB7MZ75ttNhkY/z+9E9d+1ahvlLordrFPm95P5vgPHqAM2fJYAa7vvkVBMJSHDWCjkSnDk3RnggMPXv5wrHQqiARr0Ed4PK43nQhxqdkmD6o/rK+hAqt/sxsM/sXwlVCtbXlKn1wmd1vQ9eMhe4FXfGqhtLSO/O4jD9M8EKM6Rj72QPW9mg80uUK2sW3O/Q/ctGtcAyxNKdQvrEJAuohZ6cYuFY5ZX3mPnqbOe3yyePot9h7qo1yLWw+NDg2/n0SM7nrWHKQ==
Received: from BN0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:408:e5::30)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:30:51 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::b4) by BN0PR02CA0055.outlook.office365.com
 (2603:10b6:408:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:30:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:22 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:21 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:30:18 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v9 1/4] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Wed, 21 Jan 2026 21:00:08 +0530
Message-ID: <20260121153012.92243-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121153012.92243-1-kkartik@nvidia.com>
References: <20260121153012.92243-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0687355b-48e0-4bca-7e79-08de59020f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JZylLoenw9MN2700OMHc0hp4hn6eUkf+oEPgQ5mTuJ1NwBj46oLQzd/ex4qd?=
 =?us-ascii?Q?tTySE3XDdPwOB/MPOcDg8UxmIGE4ACDlVCXyDrH6+YbX7QJSQWYBnX8e8awb?=
 =?us-ascii?Q?/zbxL3q6kBWOeoYyJgH00uwi1X/NjVpGDJ78JqHjwLvHmRQjrUHZ1lCKQ8VI?=
 =?us-ascii?Q?JxkvKlvfHBGn6cpvA1vaCfhTFseq/min6L4sVymFTKrjzR4f0akGVhf7RLNX?=
 =?us-ascii?Q?4Z4duTb/Xk1mW9dNAXaxNEWIE53lhvj0QmRzuPcURedIvIFl7V2s2j5GdX4l?=
 =?us-ascii?Q?TREKcqMiTFwpXbOixTcXYmjS925+pQByDLwrebJW5VVR1wdQ51cng+1KEdn6?=
 =?us-ascii?Q?/YGuU/8V+I8FKljVG38OsCWigGmbu7UDXVLaR8IkuTcuLwQ9hGwk1J0+AdMv?=
 =?us-ascii?Q?zG4ZoLID0EqNVLW5FhdWS6npUMm6iz0ZnpOsDzCqxQ9sxxTV8IHmq60aBLtv?=
 =?us-ascii?Q?tbGDuHhYrTvngWXMD9SPyaeipjWecf/PU2ZUJJmxNF0AXv49Y2f+8eXR4WJA?=
 =?us-ascii?Q?5jBCkh3Cu5T4V2BiVoyf9GX1C0PZjFubEYudqkQBCc29K6LDr4QcAw+xF+kD?=
 =?us-ascii?Q?S4jCDe5Ae4Df0GzhUwPK8194vmQ6HQHT8VBTsWS/da02VV1VJeFO7Whg9Dfz?=
 =?us-ascii?Q?wcgFFhu+23P71QwcvbprkBOwlpeN0h9qH/UW40yW6nZVccx8L8AG74rya6tu?=
 =?us-ascii?Q?gy8fH5T5uOTbjAJfeatF9MSCV4i2/C6UqT1cxR7BwOcoPl/pud97VflWvvB1?=
 =?us-ascii?Q?C6+xjVCniVhTohAVPMgJVOUQiSXZxbw0UKWtNnLFCY/eU2yDkIP19Mr8Ya1Y?=
 =?us-ascii?Q?Z0a0KSF3AU7+vYk+DSwkwzrCpcHlzSmcy2chZsjeW1XsRb+CVh+HRSYg7AaR?=
 =?us-ascii?Q?03otSRTl54UGTRGJ+ngnOHZnFr00Xzu/7We71IrwumrTehWh9HQSfy9mfgUR?=
 =?us-ascii?Q?Ofq3OScdWRtQ9OdAzNx50Vk/tTjbw2yOwNq4+BaydNfRzwq4Lkbf4PqPMgDa?=
 =?us-ascii?Q?+kiaxXLMhonhvZNOeWBrT9+WqTmkkYU53+QL/ybVqJcQzP/eNU5TdPmjFLbc?=
 =?us-ascii?Q?Ji0107p2qo+GKEbWZuHmt6J8R+IbjnxpXbyXuZW4V676qXyMIOILJ7o/xxWU?=
 =?us-ascii?Q?00cp0nMLZ8vyG49JYmixCcqvoaTG+4fNULRtupJRIqopafBe9e/S72oOCCvQ?=
 =?us-ascii?Q?m7GwQi+gGBAMd7zEnreCsJjcgh0EG2RDsqKLiskNORxFTDYffYdoJ3oHMXzL?=
 =?us-ascii?Q?vMDrWF+e3TqBOqgEPGwfH5Q1yBmsV3FUSCimtAbxDIcHBGnufvKUn2hs97k+?=
 =?us-ascii?Q?VWgphp9YrmmstQtkEzH0tBPJO1Kl6/cKv72Y0XdGhAAfKhL2+x7sfYU5G2sn?=
 =?us-ascii?Q?wJl/EcnGt5x1Zh1UnM1LXc0FGl3lHlqPZEfqzGBe4hSBFezUl/8XAJKdU2mf?=
 =?us-ascii?Q?fBxEnaysWT9yX0jSbhhEhg2paOG7YvJdiOM8VbRNTHwyRmObKAR3XZLuzMXH?=
 =?us-ascii?Q?dRdnSDV1gHrpCCHWx0gJm3WQbfh7+O4lTravaP5+zZW+XqwR+U4NfBPSbvGC?=
 =?us-ascii?Q?kLNAzvQ1Xh49Joa+a1N9f+5+aMyZXO78I5yw7Lg+3rDFvoDBrNHqfvUQMMjn?=
 =?us-ascii?Q?i8xXmGQKZj7Wev1o8akPVEJM8Np3+OEcUaWbl8pQL1YZ3OUrpeYYu6i+E4MK?=
 =?us-ascii?Q?T9vnsLxvFAovLeDNQitdslbdDZw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:30:50.9745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0687355b-48e0-4bca-7e79-08de59020f1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

Replace the per-instance boolean flags with an enum tegra_i2c_variant
since DVC and VI are mutually exclusive. Update IS_DVC/IS_VI and variant
initialization accordingly.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..c2c60ba4fe5e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -171,6 +171,18 @@ enum msg_end_type {
 	MSG_END_CONTINUE,
 };
 
+/*
+ * tegra_i2c_variant: Identifies the variant of I2C controller.
+ * @TEGRA_I2C_VARIANT_DEFAULT: Identifies the default I2C controller.
+ * @TEGRA_I2C_VARIANT_DVC: Identifies the DVC I2C controller, has a different register layout.
+ * @TEGRA_I2C_VARIANT_VI: Identifies the VI I2C controller, has a different register layout.
+ */
+enum tegra_i2c_variant {
+	TEGRA_I2C_VARIANT_DEFAULT,
+	TEGRA_I2C_VARIANT_DVC,
+	TEGRA_I2C_VARIANT_VI,
+};
+
 /**
  * struct tegra_i2c_hw_feature : per hardware generation features
  * @has_continue_xfer_support: continue-transfer supported
@@ -268,8 +280,7 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
+ * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -321,12 +332,13 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	bool is_dvc;
-	bool is_vi;
+	enum tegra_i2c_variant variant;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
+		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1913,13 +1925,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
+	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
+
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
 
 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
 	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
+		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0

