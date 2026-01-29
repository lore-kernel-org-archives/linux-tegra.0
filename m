Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D933FE01;
	Thu, 29 Jan 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682772; cv=fail; b=D2lhVaG81+IpY2F1Hry9oLdh7N1FlAtjHGgz7QWIYrafke6hsKDKxplXLYm/jERsrYYfpauLwK0FEsBNtYIB1Y1XXgnoqP1mXhvdpJh96AcHdLLz1Cy6rjzYXaLrrySoqe3m5BDE9Z66LYbCHlrPk+0gMxXniWeba7MQPSOFsf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682772; c=relaxed/simple;
	bh=lF1bXxKcpA2cuNPGzIJcFZMT+h0CoQNA0guTSAxE0Pc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FXii13K2PmO79fpzsCtTvmC7seq4JaJgl6MzZ5xLGyHxcqZSUyWWx7ax5g6jzdPxpQ0MD5qkZrE9heImwsHalfE3A+YmhakLXooa8Ku16uX/95nSWXlWqdy/2Zx0/TkC/qFteKP9et4jlY0l5huQSOiHeNKHa8QAVNHMA7FBjgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j4rUXLWS; arc=fail smtp.client-ip=52.101.61.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4rUXLWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CayBbj6Yg1JFZbEozGTWpzzffhCf5uRZTHROVvOmSGfW0tPOMKhHvPS42sVqCXNQnpSsVWKN1ddv3c+J+t2b4ze0K0kk/UwHQZ/BHHaKzHpOQ3asEMkcpeqS9JnhCW5MBQhgjjD2F4tZY6dgYUrOVW0hHoBsm2EXspadbwsrFn/WsHlxtBN33VRg23sVA6x0nGlC+1mWkn96W7+ZzgWmCgc6YVbfnJYjGAviWVLEKs60kk40L+gjYvzPoqDmnteDwlPfhB9wxfEkIwOwiVwbtdi9zW+WvpVO0PEt05PBlSyhUwLdnwepIOSB4+CfbqpvVVrIFHxnNX8nFmEX8aWxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUhnPIG7l5ITlIzFJbP5ENhysYWUrPd3bkQrPU1g1A4=;
 b=dNwuCa7kNZLpLDpfC1QKDY9RWOmY6IQfY/O5DpDBdkGlcleqNSX2GHupMdL73u+Rclg/MsB85sd/CBU9P9fJBl8us3ksv5r2oJeJb5m5Hu9Az64ZWYeg618AtJdUi/M7DDJN/GTybwHCzO7+1AK/gUFwuwkfQdo+fiIxAHhzqTBHzuC1+izhGBXx/g0/EIddchbW5q3GMDvkz7LJHyBBwlGZNwWlSPn1onYmgUiFvxEY2Gz+0a/3Wg8Vrx8wZYIB9KlO/AGd7xk96NhlNjUybRKpJY8nDVADYOlOLXc4ytn8DnltJ0sPzu4jWJrMjfNtcfXBpzX3PgRxK2m+7AgJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUhnPIG7l5ITlIzFJbP5ENhysYWUrPd3bkQrPU1g1A4=;
 b=j4rUXLWSnpuEpASDGtDjDRjgGlGDpiQhuIfrHEmvnG8k1wzffut8GCubbkjHowLHQN8RRgb7dV8ZdPFWK2J9h66frGJkS3zNBOE5/W25R9rcKuu7bGD5N5J/nPkzrx1XDZOaSweuexwBPJDAN4W1WTLnlW7JE0zSCdqS1pXhGBQu9NnkVxo2lGcgtrR5ghwYOjaHCb488N0namVo1JmYizKVPCdefKE3mg5am+K8Akc8KcFbV/9giTsYbfNXxovlnCgD3tD0jxnb4rIgZ13mX6ZXP8j7YComcmU4nkty1m2mLGJF10MZ3hhlXfVgE7JSQEuYw031Y/aRolUOV1XGLg==
Received: from SA9PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:20::29)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:31:29 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::ef) by SA9PR03CA0024.outlook.office365.com
 (2603:10b6:806:20::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 29 Jan 2026 10:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:31:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:14 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:13 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 02:31:10 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 2/3] i2c: tegra: Add logic to support different register offsets
Date: Thu, 29 Jan 2026 16:00:42 +0530
Message-ID: <20260129103043.148490-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129103043.148490-1-kkartik@nvidia.com>
References: <20260129103043.148490-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f3cc79-a61e-4d3f-af53-08de5f219026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yxvZY4YsvRpKHePU+a1DU3YJLpIO/zcEH8qRJjyD1LwTSx/Z17nS8ltrxunD?=
 =?us-ascii?Q?AMnVU97HcwtxnnFeSvk8kuJhvl1Om3LuAsXtlWVbs1j/vBecZ0jhyU3JqN1H?=
 =?us-ascii?Q?c9nRJIULloCmX3ejbroW4ElGOW9HVR2tkam40cy071PfTRz0B+9gqaoKu6p4?=
 =?us-ascii?Q?JR4SC146QXdJ1FfXb5rrYk+GDWEEv8I/DsR5aqxk2tdxrkieb4B4oVmoZMn5?=
 =?us-ascii?Q?tgavfksQYEuQ4omnuqN9t56h4BFL6TT89XpCW7Mctu9twXuQNPZ3E1d/gfEj?=
 =?us-ascii?Q?Dzq1J+YaDquLi0rRFAdcPJ6mFE4eANCXgnyOWMYAHeLTKnDIzGdZ967VpB4m?=
 =?us-ascii?Q?6MEsbvu/b4ZPqNbv2nJxmbV8+Fi+qWqRPrKIvVVnlsrMkqIegT1+OxgAlFP0?=
 =?us-ascii?Q?uOx55x7hQkX1WCm8IgTa5Lxgsx4qbO9ryAljbD/CkXss3uzeT5HQ68glrI5V?=
 =?us-ascii?Q?KHW+fpztOf/9wmYxwCiHH043T/yZWpgyfP5QX4O6YTHMv8SttDhuYI2R6Lq7?=
 =?us-ascii?Q?Re21B/q6e+GkFAYo5zLuzsA3K9tmuSWWuqgUhifvcMP/Q3xEfrVYiwy+YVzH?=
 =?us-ascii?Q?MbELgJr5923VCI2mbZ4KHpUJe+gNN4IRGBE+6+ucXkc/+3vQzInz5tmhzXAk?=
 =?us-ascii?Q?wvRx4RzwzEZMZaTuDVytEwHQjoqdJLPTEz2XVyEDAqCAcMfJy4EHTUSWmjUs?=
 =?us-ascii?Q?uMjlAHw6aUfsagLlGDRb5J3xjR/8r6PwfZ+DFGwuhwlFqrBWJqGlrh+nRIC6?=
 =?us-ascii?Q?r//1T80dY8Im+J2EVOvQML8J8d1s1nV2q2U6OThRvSBtD7LDFrfAJmDlbr0H?=
 =?us-ascii?Q?AIqazFjh38NvKHR/+Zv6NSi6QQ0sgBdbzedIOOazFaPV4Q11nQ9e69PI2VGF?=
 =?us-ascii?Q?DfPgMhXALyxsG/29YuRbeQ9E+hWL6V25flmB8lAvTzSw3qNl+iKf/zqMQu+N?=
 =?us-ascii?Q?8kRigQWZUxxBeuT0iLvhIwlFAU2Z2iLbA5g3nXrGuY8oXKoD3oXuixA3ByUh?=
 =?us-ascii?Q?BUxMihr6Xwss4tPB8NrTBhispVhguZiqtjz2ufc6Zptv/uWAdGw/vnztOuEG?=
 =?us-ascii?Q?1CvbmKAtrHnyII+Z1fqkUUarw2rVewKv5gWJ/lE5vIsvYIH+uKxKCC0fYU8Q?=
 =?us-ascii?Q?4lO/PANibWIFDnzZGuAvZE9ozLsyWQQOg+FLkWIUX0GhWWV4ljyBtfOTkHJ6?=
 =?us-ascii?Q?mD1TcokpOQpYX0bNd7keqzPLOwsLgGEYulRYXZgX+QH1ORHBTfNp0yOOncyP?=
 =?us-ascii?Q?xaOu97gnIltONm+HJ/T9E+qPtyNHew8MsV+Hv/yNWRWSRiWABTAPx7oS8bbS?=
 =?us-ascii?Q?rwxD+2U69g6QLtBiaaKJEh+J/az8TNGXmP9pDU24cbyOtsHi0qU7keSRG4fi?=
 =?us-ascii?Q?GlGy1nHzA3dsNxhvHFcKpMW6dT5r24Cqj65r5orWezWRewsToom8d6SnXmIP?=
 =?us-ascii?Q?dgnq1skwovGwlOALYSpU8AjkBH7GBpNxQrLrb2IJbnCZRLXEV1rbV6hSeB80?=
 =?us-ascii?Q?y63qaRewQop1fzAmfzYz8hKyE2AwucGGvvS3f+IDf0IzIp8p1oqw1mdS5Eqq?=
 =?us-ascii?Q?d3IhEyz0vBY0Rp6fISm9LqLjiCcvYaT79T+YVhqddLmtxraHYyF+IGo8psjq?=
 =?us-ascii?Q?PLGN2X1KasZqH5+ImMrTCG8FLMqAVJr6W7755q9M2zU7IgwV4Y/Ei9aDZ4+J?=
 =?us-ascii?Q?wb2ab0p0iOAtVBlUKLFiw7PxM+s=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:31:28.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f3cc79-a61e-4d3f-af53-08de5f219026
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

Tegra410 use different offsets for existing I2C registers, update
the logic to use appropriate offsets per SoC.

As the register offsets are now defined in the SoC-specific
tegra_i2c_regs structures, the tegra_i2c_reg_addr() function is no
longer needed to translate register offsets and has been removed.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v9:
	* Do not remove dvc_writel() and dvc_readl() calls.
Changes in v8:
	* Replace usage of dvc_writel() with writel_relaxed().
	* Remove dvc_writel().
Changes in v7:
	* Fix Tegra256 reg offsets, change it to tegra264_i2c_regs as it
	  supports SW mutex.
Changes in v6:
	* Do not remove dvc_writel().
	* Keep DVC registers defined as a macro.
	* Correct Tegra20 DVC register offsets.
	* Remove sl_cnfg, sl_addr1 and sl_addr2 registers for DVC and VI
	  as they are not used.
Changes in v2:
	* Replace individual is_dvc and is_vi flags with an I2C variant.
	* Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
	  patch.
	* Use calculated offsets for tegra20_dvc_i2c_regs and
	  tegra210_vi_i2c_regs.
	* Initialize registers only if they are used on the given SoC.
---
 drivers/i2c/busses/i2c-tegra.c | 359 ++++++++++++++++++++++-----------
 1 file changed, 237 insertions(+), 122 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2ef5fba66b0f..d845b8782f4f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -30,38 +30,29 @@
 
 #define BYTES_PER_FIFO_WORD 4
 
-#define I2C_CNFG				0x000
 #define I2C_CNFG_DEBOUNCE_CNT			GENMASK(14, 12)
 #define I2C_CNFG_PACKET_MODE_EN			BIT(10)
 #define I2C_CNFG_NEW_MASTER_FSM			BIT(11)
 #define I2C_CNFG_MULTI_MASTER_MODE		BIT(17)
-#define I2C_STATUS				0x01c
-#define I2C_SL_CNFG				0x020
+
 #define I2C_SL_CNFG_NACK			BIT(1)
 #define I2C_SL_CNFG_NEWSL			BIT(2)
-#define I2C_SL_ADDR1				0x02c
-#define I2C_SL_ADDR2				0x030
-#define I2C_TLOW_SEXT				0x034
-#define I2C_TX_FIFO				0x050
-#define I2C_RX_FIFO				0x054
-#define I2C_PACKET_TRANSFER_STATUS		0x058
-#define I2C_FIFO_CONTROL			0x05c
+
 #define I2C_FIFO_CONTROL_TX_FLUSH		BIT(1)
 #define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
 #define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
-#define I2C_FIFO_STATUS				0x060
+
 #define I2C_FIFO_STATUS_TX			GENMASK(7, 4)
 #define I2C_FIFO_STATUS_RX			GENMASK(3, 0)
-#define I2C_INT_MASK				0x064
-#define I2C_INT_STATUS				0x068
+
 #define I2C_INT_BUS_CLR_DONE			BIT(11)
 #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
 #define I2C_INT_NO_ACK				BIT(3)
 #define I2C_INT_ARBITRATION_LOST		BIT(2)
 #define I2C_INT_TX_FIFO_DATA_REQ		BIT(1)
 #define I2C_INT_RX_FIFO_DATA_REQ		BIT(0)
-#define I2C_CLK_DIVISOR				0x06c
+
 #define I2C_CLK_DIVISOR_STD_FAST_MODE		GENMASK(31, 16)
 #define I2C_CLK_DIVISOR_HSMODE			GENMASK(15, 0)
 
@@ -94,50 +85,38 @@
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
-#define I2C_BUS_CLEAR_CNFG			0x084
 #define I2C_BC_SCLK_THRESHOLD			GENMASK(23, 16)
 #define I2C_BC_STOP_COND			BIT(2)
 #define I2C_BC_TERMINATE			BIT(1)
 #define I2C_BC_ENABLE				BIT(0)
-#define I2C_BUS_CLEAR_STATUS			0x088
+
 #define I2C_BC_STATUS				BIT(0)
 
-#define I2C_CONFIG_LOAD				0x08c
 #define I2C_MSTR_CONFIG_LOAD			BIT(0)
 
-#define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
-#define I2C_INTERFACE_TIMING_0			0x094
-#define  I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
-#define I2C_INTERFACE_TIMING_1			0x098
-#define  I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
-#define  I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
-#define  I2C_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
-#define  I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
-
-#define I2C_HS_INTERFACE_TIMING_0		0x09c
-#define  I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
-#define  I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
-#define I2C_HS_INTERFACE_TIMING_1		0x0a0
-#define  I2C_HS_INTERFACE_TIMING_TSU_STO	GENMASK(21, 16)
-#define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
-#define  I2C_HS_INTERFACE_TIMING_TSU_STA	GENMASK(5, 0)
-
-#define I2C_MST_FIFO_CONTROL			0x0b4
+#define I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
+#define I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
+#define I2C_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
+#define I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
+
+#define I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_HS_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
+#define I2C_HS_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
+#define I2C_HS_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
+
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
 #define I2C_MST_FIFO_CONTROL_TX_FLUSH		BIT(1)
 #define I2C_MST_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) <<  4)
 #define I2C_MST_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 16)
 
-#define I2C_MST_FIFO_STATUS			0x0b8
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
-#define I2C_MASTER_RESET_CNTRL			0x0a8
-
-#define I2C_SW_MUTEX				0x0ec
 #define I2C_SW_MUTEX_REQUEST			GENMASK(3, 0)
 #define I2C_SW_MUTEX_GRANT			GENMASK(7, 4)
 #define I2C_SW_MUTEX_ID_CCPLEX			9
@@ -159,6 +138,143 @@
  */
 #define I2C_PIO_MODE_PREFERRED_LEN		32
 
+struct tegra_i2c_regs {
+	unsigned int cnfg;
+	unsigned int status;
+	unsigned int sl_cnfg;
+	unsigned int sl_addr1;
+	unsigned int sl_addr2;
+	unsigned int tlow_sext;
+	unsigned int tx_fifo;
+	unsigned int rx_fifo;
+	unsigned int packet_transfer_status;
+	unsigned int fifo_control;
+	unsigned int fifo_status;
+	unsigned int int_mask;
+	unsigned int int_status;
+	unsigned int clk_divisor;
+	unsigned int bus_clear_cnfg;
+	unsigned int bus_clear_status;
+	unsigned int config_load;
+	unsigned int clken_override;
+	unsigned int interface_timing_0;
+	unsigned int interface_timing_1;
+	unsigned int hs_interface_timing_0;
+	unsigned int hs_interface_timing_1;
+	unsigned int master_reset_cntrl;
+	unsigned int mst_fifo_control;
+	unsigned int mst_fifo_status;
+	unsigned int sw_mutex;
+};
+
+static const struct tegra_i2c_regs tegra20_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x050,
+	.rx_fifo = 0x054,
+	.packet_transfer_status = 0x058,
+	.fifo_control = 0x05c,
+	.fifo_status = 0x060,
+	.int_mask = 0x064,
+	.int_status = 0x068,
+	.clk_divisor = 0x06c,
+	.bus_clear_cnfg = 0x084,
+	.bus_clear_status = 0x088,
+	.config_load = 0x08c,
+	.clken_override = 0x090,
+	.interface_timing_0 = 0x094,
+	.interface_timing_1 = 0x098,
+	.hs_interface_timing_0 = 0x09c,
+	.hs_interface_timing_1 = 0x0a0,
+	.master_reset_cntrl = 0x0a8,
+	.mst_fifo_control = 0x0b4,
+	.mst_fifo_status = 0x0b8,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
+	.cnfg = 0x040,
+	.status = 0x05c,
+	.tx_fifo = 0x060,
+	.rx_fifo = 0x064,
+	.packet_transfer_status = 0x068,
+	.fifo_control = 0x06c,
+	.fifo_status = 0x070,
+	.int_mask = 0x074,
+	.int_status = 0x078,
+	.clk_divisor = 0x07c,
+	.bus_clear_cnfg = 0x094,
+	.bus_clear_status = 0x098,
+	.config_load = 0x09c,
+	.clken_override = 0x0a0,
+	.interface_timing_0 = 0x0a4,
+	.interface_timing_1 = 0x0a8,
+	.hs_interface_timing_0 = 0x0ac,
+	.hs_interface_timing_1 = 0x0b0,
+	.master_reset_cntrl = 0x0b8,
+	.mst_fifo_control = 0x0c4,
+	.mst_fifo_status = 0x0c8,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_regs tegra210_vi_i2c_regs = {
+	.cnfg = 0x0c00,
+	.status = 0x0c70,
+	.tlow_sext = 0x0cd0,
+	.tx_fifo = 0x0d40,
+	.rx_fifo = 0x0d50,
+	.packet_transfer_status = 0x0d60,
+	.fifo_control = 0x0d70,
+	.fifo_status = 0x0d80,
+	.int_mask = 0x0d90,
+	.int_status = 0x0da0,
+	.clk_divisor = 0x0db0,
+	.bus_clear_cnfg = 0x0e10,
+	.bus_clear_status = 0x0e20,
+	.config_load = 0x0e30,
+	.clken_override = 0x0e40,
+	.interface_timing_0 = 0x0e50,
+	.interface_timing_1 = 0x0e60,
+	.hs_interface_timing_0 = 0x0e70,
+	.hs_interface_timing_1 = 0x0e80,
+	.master_reset_cntrl = 0x0ea0,
+	.mst_fifo_control = 0x0ed0,
+	.mst_fifo_status = 0x0ee0,
+};
+#endif
+
+static const struct tegra_i2c_regs tegra264_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x050,
+	.rx_fifo = 0x054,
+	.packet_transfer_status = 0x058,
+	.fifo_control = 0x05c,
+	.fifo_status = 0x060,
+	.int_mask = 0x064,
+	.int_status = 0x068,
+	.clk_divisor = 0x06c,
+	.bus_clear_cnfg = 0x084,
+	.bus_clear_status = 0x088,
+	.config_load = 0x08c,
+	.clken_override = 0x090,
+	.interface_timing_0 = 0x094,
+	.interface_timing_1 = 0x098,
+	.hs_interface_timing_0 = 0x09c,
+	.hs_interface_timing_1 = 0x0a0,
+	.master_reset_cntrl = 0x0a8,
+	.mst_fifo_control = 0x0b4,
+	.mst_fifo_status = 0x0b8,
+	.sw_mutex = 0x0ec,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -236,6 +352,7 @@ enum tegra_i2c_variant {
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
  * @variant: This represents the I2C controller variant.
+ * @regs: Register offsets for the specific SoC variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -268,6 +385,7 @@ struct tegra_i2c_hw_feature {
 	bool enable_hs_mode_support;
 	bool has_mutex;
 	enum tegra_i2c_variant variant;
+	const struct tegra_i2c_regs *regs;
 };
 
 /**
@@ -351,40 +469,26 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 	return readl_relaxed(i2c_dev->base + reg);
 }
 
-/*
- * If necessary, i2c_writel() and i2c_readl() will offset the register
- * in order to talk to the I2C block inside the DVC block.
- */
-static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
-{
-	if (IS_DVC(i2c_dev))
-		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
-	else if (IS_VI(i2c_dev))
-		reg = 0xc00 + (reg << 2);
-
-	return reg;
-}
-
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 {
-	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	writel_relaxed(val, i2c_dev->base + reg);
 
 	/* read back register to make sure that register writes completed */
-	if (reg != I2C_TX_FIFO)
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	if (reg != i2c_dev->hw->regs->tx_fifo)
+		readl_relaxed(i2c_dev->base + reg);
 	else if (IS_VI(i2c_dev))
-		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
+		readl_relaxed(i2c_dev->base + i2c_dev->hw->regs->int_status);
 }
 
 static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
-	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
+	return readl_relaxed(i2c_dev->base + reg);
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
 			unsigned int reg, unsigned int len)
 {
-	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
+	writesl(i2c_dev->base + reg, data, len);
 }
 
 static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
@@ -405,12 +509,12 @@ static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 		       unsigned int reg, unsigned int len)
 {
-	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
+	readsl(i2c_dev->base + reg, data, len);
 }
 
 static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -421,7 +525,7 @@ static bool tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
 
 static bool tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	val = readl(i2c_dev->base + reg);
@@ -459,7 +563,7 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
+	unsigned int reg = i2c_dev->hw->regs->sw_mutex;
 	u32 val, id;
 
 	if (!i2c_dev->hw->has_mutex)
@@ -482,16 +586,16 @@ static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
 
-	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) & ~mask;
-	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+	int_mask = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask) & ~mask;
+	i2c_writel(i2c_dev, int_mask, i2c_dev->hw->regs->int_mask);
 }
 
 static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
 	u32 int_mask;
 
-	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) | mask;
-	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+	int_mask = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask) | mask;
+	i2c_writel(i2c_dev, int_mask, i2c_dev->hw->regs->int_mask);
 }
 
 static void tegra_i2c_dma_complete(void *args)
@@ -635,34 +739,34 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
 	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->interface_timing_0);
 
 	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
 		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->interface_timing_1);
 
 	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->hs_interface_timing_0);
 
 	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
 		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->hs_interface_timing_1);
 
 	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
-	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, value, i2c_dev->hw->regs->bus_clear_cnfg);
 
-	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
+	i2c_writel(i2c_dev, 0x0, i2c_dev->hw->regs->tlow_sext);
 }
 
 static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 				   u32 reg, u32 mask, u32 delay_us,
 				   u32 timeout_us)
 {
-	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	void __iomem *addr = i2c_dev->base + reg;
 	u32 val;
 
 	if (!i2c_dev->atomic_mode)
@@ -681,11 +785,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
 		       I2C_MST_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_MST_FIFO_CONTROL;
+		offset = i2c_dev->hw->regs->mst_fifo_control;
 	} else {
 		mask = I2C_FIFO_CONTROL_TX_FLUSH |
 		       I2C_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_FIFO_CONTROL;
+		offset = i2c_dev->hw->regs->fifo_control;
 	}
 
 	val = i2c_readl(i2c_dev, offset);
@@ -708,9 +812,9 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	if (!i2c_dev->hw->has_config_load_reg)
 		return 0;
 
-	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, i2c_dev->hw->regs->config_load);
 
-	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
+	err = tegra_i2c_poll_register(i2c_dev, i2c_dev->hw->regs->config_load, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
 		dev_err(i2c_dev->dev, "failed to load config\n");
@@ -731,10 +835,10 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
 	 * SW needs to wait for 2us after assertion and de-assertion of this soft
 	 * reset.
 	 */
-	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	i2c_writel(i2c_dev, 0x1, i2c_dev->hw->regs->master_reset_cntrl);
 	fsleep(2);
 
-	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	i2c_writel(i2c_dev, 0x0, i2c_dev->hw->regs->master_reset_cntrl);
 	fsleep(2);
 
 	return 0;
@@ -776,8 +880,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_multi_master_mode)
 		val |= I2C_CNFG_MULTI_MASTER_MODE;
 
-	i2c_writel(i2c_dev, val, I2C_CNFG);
-	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->cnfg);
+	i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->int_mask);
 
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
@@ -822,12 +926,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
 		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
-	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
+	i2c_writel(i2c_dev, clk_divisor, i2c_dev->hw->regs->clk_divisor);
 
 	if (i2c_dev->hw->has_interface_timing_reg) {
 		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
 		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->interface_timing_0);
 	}
 
 	/*
@@ -835,7 +939,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
-		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
 
 	/* Write HS mode registers. These will get used only for HS mode*/
 	if (i2c_dev->hw->enable_hs_mode_support) {
@@ -845,8 +949,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
 			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
-		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->hs_interface_timing_0);
+		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
 	}
 
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
@@ -859,12 +963,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
-		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
+		u32 sl_cfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->sl_cnfg);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
-		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
-		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
-		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
+		i2c_writel(i2c_dev, sl_cfg, i2c_dev->hw->regs->sl_cnfg);
+		i2c_writel(i2c_dev, 0xfc, i2c_dev->hw->regs->sl_addr1);
+		i2c_writel(i2c_dev, 0x00, i2c_dev->hw->regs->sl_addr2);
 	}
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
@@ -872,7 +976,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 
 	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
-		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
+		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, i2c_dev->hw->regs->clken_override);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
@@ -893,9 +997,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	 */
 	udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
 
-	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
+	cnfg = i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg);
 	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
-		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
+		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, i2c_dev->hw->regs->cnfg);
 
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
@@ -915,10 +1019,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		return -EINVAL;
 
 	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->mst_fifo_status);
 		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
 	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->fifo_status);
 		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
 	}
 
@@ -927,7 +1031,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
 
-	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
+	i2c_readsl(i2c_dev, buf, i2c_dev->hw->regs->rx_fifo, words_to_transfer);
 
 	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
@@ -943,7 +1047,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 * when (words_to_transfer was > rx_fifo_avail) earlier
 		 * in this function.
 		 */
-		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->rx_fifo);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
@@ -968,10 +1072,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 
 	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->mst_fifo_status);
 		tx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
 	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		val = i2c_readl(i2c_dev, i2c_dev->hw->regs->fifo_status);
 		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
 	}
 
@@ -1002,9 +1106,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		if (IS_VI(i2c_dev))
-			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl_vi(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 		else
-			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+			i2c_writesl(i2c_dev, buf, i2c_dev->hw->regs->tx_fifo, words_to_transfer);
 
 		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
 	}
@@ -1026,7 +1130,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = 0;
 		i2c_dev->msg_buf = NULL;
 
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, val, i2c_dev->hw->regs->tx_fifo);
 	}
 
 	return 0;
@@ -1038,13 +1142,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	struct tegra_i2c_dev *i2c_dev = dev_id;
 	u32 status;
 
-	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+	status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
-			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
-			 i2c_readl(i2c_dev, I2C_STATUS),
-			 i2c_readl(i2c_dev, I2C_CNFG));
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->packet_transfer_status),
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->status),
+			 i2c_readl(i2c_dev, i2c_dev->hw->regs->cnfg));
 		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
 		goto err;
 	}
@@ -1087,7 +1191,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		}
 	}
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
@@ -1125,7 +1229,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear)
 		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
 
 	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
@@ -1148,9 +1252,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
-		reg = I2C_MST_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->mst_fifo_control;
 	else
-		reg = I2C_FIFO_CONTROL;
+		reg = i2c_dev->hw->regs->fifo_control;
 
 	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
@@ -1161,7 +1265,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			dma_burst = 8;
 
 		if (i2c_dev->msg_read) {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+			reg_offset = i2c_dev->hw->regs->rx_fifo;
 
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1172,7 +1276,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 			else
 				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
 		} else {
-			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+			reg_offset = i2c_dev->hw->regs->tx_fifo;
 
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
@@ -1215,7 +1319,7 @@ static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
 	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
 
 	do {
-		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+		u32 status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
 
 		if (status)
 			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
@@ -1274,14 +1378,14 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
 		return err;
 
 	val |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
@@ -1292,7 +1396,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	val = i2c_readl(i2c_dev, i2c_dev->hw->regs->bus_clear_status);
 	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
@@ -1317,14 +1421,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 
 	packet_header = i2c_dev->msg_len - 1;
 
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 
 	packet_header = I2C_HEADER_IE_ENABLE;
 
@@ -1352,7 +1456,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
-		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
+		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
 }
 
 static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
@@ -1473,7 +1577,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
-		i2c_readl(i2c_dev, I2C_INT_MASK));
+		i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask));
 
 	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
@@ -1648,6 +1752,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
@@ -1680,6 +1785,7 @@ static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DVC,
+	.regs = &tegra20_dvc_i2c_regs,
 };
 #endif
 
@@ -1712,6 +1818,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1743,6 +1850,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1774,6 +1882,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1805,6 +1914,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
@@ -1837,6 +1947,7 @@ static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_VI,
+	.regs = &tegra210_vi_i2c_regs,
 };
 #endif
 
@@ -1869,6 +1980,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1902,6 +2014,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra20_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1935,6 +2048,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1968,6 +2082,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra264_i2c_regs,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0

