Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1371FAC52;
	Mon,  2 Dec 2024 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133991; cv=fail; b=mcFfXfi31ywO9sn/1DZqUKx3zyj7tw4ZP8JdE4I6avlBoJsAM5mnn5PYlA0rqmDk8nhxDSdCk7NJjIJFYHLZmUZRj+97OQnR+hDGshqHUFyTlx3/pnlzEpNbF9x92duzV/ef3OtEPJE1xbt8UvB0TM5FcuPFcQ/BVKrl7VI2JmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133991; c=relaxed/simple;
	bh=i7bvnpJsaTAuLBVEtSJgptPoAMJhzM6rUWZhcHB0kSA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tCSyNl8MdfjcWL4fqnAD50a4u2puROY/8FUoFkjIWlpybxdtzCg9OME6jGyxC2Ftu+zyb7az5gpFSZcZQtRiWHzdYNYRF71fq/yC0iGv8pBFRQ+EdUF+qnju/9bDcxyeos7zKWTbi+3Cifc/xiPL87Fula6gPZ3O67dBRz/eVfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=riX7jh+y; arc=fail smtp.client-ip=40.107.101.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="riX7jh+y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEgDNayMunUE90qgm7VubrO3jQmgNwjMUkFtLNehcaT8J+48PHpc1UATY6SiJmZAlattY0jwbsyxkqnvcdvmwJ6jkvqmKu1pVm8YTyd7R2yvxUWgS13qEdp1wz7ATpNgFEdXR/7+B4O0w4xXq6tt3MEY4kipkZZRJmQ/WtTsHvBac5Qbpd6r/UgsSrB7wpoDwE4TXRc63uE2rJgZX4HSFw1u/RFDSSCeq+evPZ2RlrVQijryIyAJcZX3QHqv0weYD79awc7A3APlT1aKzVYRjBNyQEUP4BiWlmp6jsGVXmIfSzEX8GU/VBOX+U4gYTGVxjuC/FNsAwmfcVNUuhRoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96kY+g4oKSyzvku69Pssn4Yvn9adFJRiXqoXeokRzds=;
 b=uu6Ao9dosmtjVnM04DiiZ4AXIJpoL/shZos+wHa+/QgwmFMtWJ+8pE1zNomYo5DnL/PtiNRe70IlRHacNZ2ZEUZ59umUbK2Tbv13+S4rq5lcq9orsj/EAIc4/WFgQJ3cFuJAR9Vll80MbprZnLAPbuQRGMIW7rA6qgPLkWJlLTLjhltIRvs31wLBcS2tcNeCr/nCpYryvmWLESRD+iIVQkKJmNpXzHdVJ/8F5WjqHo6YicqjyDjK7Lh9hJHY43/KlUkqv8XAZoy24ejXdjs5LlmAaB2rl8SHUIQgp05o1nqqJIOAnntRJOLiGmSbahkX5rxfmELD14VqePdqiPL08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96kY+g4oKSyzvku69Pssn4Yvn9adFJRiXqoXeokRzds=;
 b=riX7jh+yePOva2fIBd2O001HOSruTqZJOtX52eO6kk8kOTXh9cUXGR6bVKTbZrV5/4Haa3dXyzbzCKf25tWHyHKA58MPFBkoWUIV6+FCBUfmgVtG5hF2NApi8OkB891vr4Meo5jpoFnFS5L+X6aehCzd5YFbRvjsJ/AHo181Wioc6+akSLkgPLFrwV3PVaF3Z1lGnY2ZQ9EPRnSA6nA8W5c4wAW9o9VGkUm8sHiP2EShNvi2rbTyGGpLyYQDh3F7Xoi2i1OsMIW//dvxGcpGds0TZYWsZYIy6XAN4n3yNpJR34xoGG94R9UOClzbTmrCRhh6S823z/1hRDhI95ujWw==
Received: from MW4PR04CA0161.namprd04.prod.outlook.com (2603:10b6:303:85::16)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 10:06:25 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::e1) by MW4PR04CA0161.outlook.office365.com
 (2603:10b6:303:85::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.15 via Frontend Transport; Mon,
 2 Dec 2024 10:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 10:06:25 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 2 Dec 2024
 02:06:10 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 2 Dec 2024
 02:06:09 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 2 Dec 2024 02:06:07 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] mailbox: tegra-hsp: Clear mailbox before using message
Date: Mon, 2 Dec 2024 15:35:59 +0530
Message-ID: <20241202100559.57984-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: c491ebea-0dc2-4cbc-c83c-08dd12b8fb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/XTy82zwcRiifnscWeM4rJsxg8jIWPssJB1NivV75q1grNGE36EzJDDo3l8n?=
 =?us-ascii?Q?d5F0zrVnVbfHO8uTtPE7LBntR5YN3r3VYcb+L28CD9RKIwcl6nFfD4d6yGTU?=
 =?us-ascii?Q?LH1kZN8hFPhQNMywmUaNc7WMkSjHpvyQMEj6TtOk6Q1qfKNeoxmCuVLGxuCW?=
 =?us-ascii?Q?bNx8KM0gF7ZxJnh8nCqkBCDkjE15DVoDrpBnIYNrayrVSJq3huaq871Ik37U?=
 =?us-ascii?Q?xPJmriajJYc+t1znYwONvTQW2n/WRD0o72OTRCxuJW0qMP0X9P5msqnbQS0h?=
 =?us-ascii?Q?qvu+HdyakvbdsbuqGRTWx4wG6bwKLp1yDkzEl1F9CpsaBWZ7kVUwEYGr5SBM?=
 =?us-ascii?Q?YTBpvyqPSwX5ueKxyGBwMez4Vvw4t177Jio4Pm3YEtfn1+TbPIOrkdvP6HbX?=
 =?us-ascii?Q?tvCq7k7+eX6tVOItT988TKpAu3Ta/utZvjUTpXO05AN8DwEPzfXP1ypmI7S0?=
 =?us-ascii?Q?UxKQDK3SYo6+4VfwZXgL2tCf3/rJhApEMArup2MUA8Mpodc8LnJUb0Of6jBe?=
 =?us-ascii?Q?28mlEUAb7lvSFOTlmXJqci6XRS9PTAJSzZMooYYrlnE+svRs3paaqzQ/bUsb?=
 =?us-ascii?Q?HCeQt5T7cyKX/1st6yJuYI/ygna6K8KbpFWLEcnKVn1qeKV4XWx4oewZ5nSk?=
 =?us-ascii?Q?ToNe8jnHI3rrJdtoKEzxsUOHSS+YJoNg4ipzisnuM31PpgnTh7qkW5yMcK5f?=
 =?us-ascii?Q?5jQtuBEz/61TdkduLM54u05g4vR/MQpD2E58HD3PG38gdXswiAAoiCLHJWd/?=
 =?us-ascii?Q?VyeGAJgSjYXWj8GoQp3dMySI2v21/Kruq5Aw7MJjHy3MNFHIqJhYcZ7AGZQz?=
 =?us-ascii?Q?cCGMG22T+X4aLjrpqYNcIAytgoHULMoy6vBO8OtKt8FzgwCWn6F+evfc8nbF?=
 =?us-ascii?Q?Xuw85pebQAFBx4+aH0r9ueI5Ok86kQb6k1CdMr50paVxo1+pDfCjEfwNitZY?=
 =?us-ascii?Q?EvmnOIhXjfkLyQw2B6cgqT/Wh2++uvoD36phjuutqK2ux5zX3rojG5i2VvBA?=
 =?us-ascii?Q?Zy/f9vdLiLJlEMKBsNS1GYxSYqjL+9iLNcZdDwC95XkDnMUuveOqUO32fq39?=
 =?us-ascii?Q?eR9MyrZ+rtRUaqXS1VrB1TsAzErpkJ4vUjWZSiaIJiOqjvSscvs3JZVYe52u?=
 =?us-ascii?Q?/scO1YsYHkyl770W61zJp0h6h4k7nkNoJBXKP5eZmx2tFzjeKLc+QcbdYWOV?=
 =?us-ascii?Q?psN4qhAjECguaExbGz7lPQ27uLzVF+s7bRTz6lWumgm2PLzJBP5JTimCrvef?=
 =?us-ascii?Q?uLPPfoZgq5QeqIgt+0rQlUI42KZNalOO3qgz2NIxmCVn+BKGzR60I8etG5mV?=
 =?us-ascii?Q?z03JDTy4iNPsoZ04CUAo6lsjwIArUAvmuFCwFRF6OHScaL8xzXk66t++p1M2?=
 =?us-ascii?Q?/1zVgc/7NDVfT+c9VgyrqHqY9uItuR5+AhT8hUQ1c+DmBRLbOgOHKXz/LHna?=
 =?us-ascii?Q?ynuG7RHuomYEqHAI0ad2yG+9AYcNfKMb?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 10:06:25.1463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c491ebea-0dc2-4cbc-c83c-08dd12b8fb17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

From: Pekka Pessi <ppessi@nvidia.com>

The Tegra RCE (Camera) driver expects the mailbox to be empty before
processing the IVC messages. On RT kernel, the threads processing the
IVC messages (which are invoked after `mbox_chan_received_data()` is
called) may be on a different CPU or running with a higher priority
than the HSP interrupt handler thread. This can cause it to act on the
message before the mailbox gets cleared in the HSP interrupt handler
resulting in a loss of IVC notification.

Fix this by clearing the mailbox data register before calling
`mbox_chan_received_data()`.

Fixes: 8f585d14030d ("mailbox: tegra-hsp: Add tegra_hsp_sm_ops")
Fixes: 74c20dd0f892 ("mailbox: tegra-hsp: Add 128-bit shared mailbox support")
Cc: stable@vger.kernel.org
Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v3:
	* Updated commit description.
v1 -> v2:
	* Added "Fixes:" tag in the commit message.
	* Made similar change for 128-bit shared mailboxes.
---
 drivers/mailbox/tegra-hsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 8d5e2d7dc03b..c1981f091bd1 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -388,7 +388,6 @@ static void tegra_hsp_sm_recv32(struct tegra_hsp_channel *channel)
 	value = tegra_hsp_channel_readl(channel, HSP_SM_SHRD_MBOX);
 	value &= ~HSP_SM_SHRD_MBOX_FULL;
 	msg = (void *)(unsigned long)value;
-	mbox_chan_received_data(channel->chan, msg);
 
 	/*
 	 * Need to clear all bits here since some producers, such as TCU, depend
@@ -398,6 +397,8 @@ static void tegra_hsp_sm_recv32(struct tegra_hsp_channel *channel)
 	 * explicitly, so we have to make sure we cover all possible cases.
 	 */
 	tegra_hsp_channel_writel(channel, 0x0, HSP_SM_SHRD_MBOX);
+
+	mbox_chan_received_data(channel->chan, msg);
 }
 
 static const struct tegra_hsp_sm_ops tegra_hsp_sm_32bit_ops = {
@@ -433,7 +434,6 @@ static void tegra_hsp_sm_recv128(struct tegra_hsp_channel *channel)
 	value[3] = tegra_hsp_channel_readl(channel, HSP_SHRD_MBOX_TYPE1_DATA3);
 
 	msg = (void *)(unsigned long)value;
-	mbox_chan_received_data(channel->chan, msg);
 
 	/*
 	 * Clear data registers and tag.
@@ -443,6 +443,8 @@ static void tegra_hsp_sm_recv128(struct tegra_hsp_channel *channel)
 	tegra_hsp_channel_writel(channel, 0x0, HSP_SHRD_MBOX_TYPE1_DATA2);
 	tegra_hsp_channel_writel(channel, 0x0, HSP_SHRD_MBOX_TYPE1_DATA3);
 	tegra_hsp_channel_writel(channel, 0x0, HSP_SHRD_MBOX_TYPE1_TAG);
+
+	mbox_chan_received_data(channel->chan, msg);
 }
 
 static const struct tegra_hsp_sm_ops tegra_hsp_sm_128bit_ops = {
-- 
2.34.1

