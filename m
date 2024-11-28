Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C20813FD86;
	Thu, 28 Nov 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732784400; cv=fail; b=SHmjv0Z8dmFBBpKSYtvOCKwquqToyPETcA5ZUicugdDDLFi8AQrwgA2bMBSc2nQCtmL96ALO/r8V/xxqRF88wFBzuU0VJyjgZxu0/cKno2IboAqDCC6J6PTP4YoU4T2w7ZjufBPo2dj7LuCBBu7NpDLLbiSkIp8NkQInjQsj1ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732784400; c=relaxed/simple;
	bh=2Dk8B5Wn6SdFsMO9DEvRPZLF/s6b+974mtUHyPN4oa8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dukrn4ETfyeKwAtoxkSNGt8w+KLkBbHgA82lsKTTsz3mcWWLub6083xAE3pKe2yRIR2VSpVBXUSZDGBhNzEJoy6PG/0YFnZ6yP8MrcwyTOKGFOghO9a5VLyXFGvFjG/eMk2Mv4IANG++pxpiPwbAVX8/86JdBq5G9Rq1Mj4Pqsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bARc8p2H; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bARc8p2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SisYS7kcuxdPPorxn0Xsuj5f5dtC8a2ZEi2TZrYQxPQzaxd50zcAxJFg3uGaD+JQ2J73LF9zialEM+euvCpIdtaI1LOG5cZpv9LpRAXDIZynK5Yp01cB/mboANopmx7Qt3r7IJSzEdt11sDIW4tobB+Zk5+ra0Cw5KDT8LdA/qJW4kVQlqrfxKvKIBmj1L464UTRQBZsvCSJuTDk8P5ef6p0XzrbsxkRpwuuzdJ9xPsjei9XKjHybZmuSAdWIb9/hOVbXMxTiSF6n8rMNLXVr4wGvnVW7wdn/+8RsxB8Z/YKwR7MMMLqIf+oxnpWxVoV5Afiikl1yDnomCA7X6EpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFq0NOiKQl4VJo2vhzbkJwSYeHpUW4HKr0aRql5lJlI=;
 b=vChqEmCL2LZE9ivMEQR/rinnC2CaUZ4uISCn5ayoCKpDS9HpVdKs0a/5omJU6hz3g4BdrRsJtjJbPDPiIdpQOFQ6WUuvLkbo0fXcTPToj/6yx3eqmgzGtlCMCQ5A6lsvH3ZRq1czEVsanbneCDOvBevtKjZxZ8sutfmNHpbjssdYph3feuLR7K/O1BYBQFeqCKBCdhWCJdd3u0k/zhrwZFdVY9z7FgS/vahFQzzB/aCEe4rj2a+1ShgLzHefQr4P8I5HXUFnVb6lPsgWISS69+EtzK38ijp3jcOKuzfTPPp8XlcKtgmFI3yN5ToNPsy6P1AK9EaPg/WKR6OeWMu7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFq0NOiKQl4VJo2vhzbkJwSYeHpUW4HKr0aRql5lJlI=;
 b=bARc8p2HJPiuBKfoXTrM2s1ebGfdeth5laiU2FcnCkVwZj1ETk1VBx+8utB6a+DulrD0VxCOQcb8gg2z/tPPoUxA714F+QlSR8PcSJks2V5DEru0kVfgKSfqp4lN3V+5khJIaj3L96Rz6rJy8r8XOTmN0zfdK/jFkZKezNjFMyZxh0oduKZHvRV7Vz8uiKmxzBa/Px2vQ0XsH/4/XDmCn62GPFZXRHF8Jc5kR+VrSezdVs09Hn0edNlOthOcEAffuyykiKXnbA5oLbEPynjkOnVedDtVkSbsTXY20lbRvPZ7HuTWRz2Ls4OClTXCK7W4kkVZFGc6+e/O9wZ4siGFXQ==
Received: from DM6PR02CA0155.namprd02.prod.outlook.com (2603:10b6:5:332::22)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 08:59:55 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::d0) by DM6PR02CA0155.outlook.office365.com
 (2603:10b6:5:332::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Thu,
 28 Nov 2024 08:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 08:59:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 28 Nov
 2024 00:59:41 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 28 Nov
 2024 00:59:41 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 28 Nov 2024 00:59:39 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mailbox: tegra-hsp: Clear mailbox before using message
Date: Thu, 28 Nov 2024 14:29:30 +0530
Message-ID: <20241128085930.52571-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: ded726ef-c167-4574-3193-08dd0f8b0717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yBoEgop53Fgf1ZidiaAbJo4sIxeAWjXgwAXOfa8HMV3o4wfM7AF3xKJ+W1w4?=
 =?us-ascii?Q?cfswlHeegfgLiUGwbFK9QcVrf5pwQjgUeWBcqZmEjHQDvSLw3SdC1nd5FdJn?=
 =?us-ascii?Q?1ZjCrtcBk5sx85HJFvlLjmvJOa/KmbKCwJvAwx+F0gKBBSiniAXTYD/ROgeK?=
 =?us-ascii?Q?UFrzQjO5lXfmxtLJuiwu4YWugKFiZqCbCWRzZ6549msEnncxroyYE6HpzytY?=
 =?us-ascii?Q?dkLFg9NtFoAU7OSS+7Anq9SVXcB4VXrik6XZttrkPvTiVuEig0GS4rPsY+7o?=
 =?us-ascii?Q?qGIjboudyHdqIgnqOaO/UvpkIC+xtpORvUJjA8hkqeGlvdkcxqO6Vbbop3Kn?=
 =?us-ascii?Q?cP7iDp1zWtNNuZtxISP9/CdnxY3usjvGti7Le2C2jMTPwPHT/n5uoRUrjE7J?=
 =?us-ascii?Q?yiLH1vzs3WJ51E8lcM1jqTfk5qFdVMAmn2ZH7rCIo+oMRTqXUIDmByUn5+of?=
 =?us-ascii?Q?KeMG/55hkJ4k1lQ8TYp9sal+kdaNc+YAeuY51FEtNctsYjxAAB9wsEYj/w2J?=
 =?us-ascii?Q?oBlDYwr3P0gvhkEpFLFn16udb2un2GCjusxERfT3MyMUdTlgtbo/qQi2NQHg?=
 =?us-ascii?Q?QA01NHadSSx0F2b3VkrkvAyEIWUCAqsS9OjDtsLn2ki1VNbPXttjae6+Wwul?=
 =?us-ascii?Q?2gZ+EbobaQtkKOWX7ee0RjEHTcwNwI6qRWuMEdhFDxhl5TAMo/A00D9xWUL8?=
 =?us-ascii?Q?eVHyQJw+oXGYh5eBEFFRmfga8j4JT5NfQDFLXQUd8DoIZ4YDimSVmVrxO/wj?=
 =?us-ascii?Q?Jfhp24ZKyFTNo+naSi+EIgMnqm64ATJHUEkpZ34gPuoZGSteJUiqt2g/joEM?=
 =?us-ascii?Q?BmkID9MPM5HNeC+akNhyvmzp5zpqExyE491WEM7lQAHBQeREOtJufWHYk71c?=
 =?us-ascii?Q?5XRT7kpcMauDNOGEX9WU4Ft1LHmYTtPsZIkxhXiVfxQPyVEM4VyRzx+qDNmc?=
 =?us-ascii?Q?ll6ZbZRLdo+OyZKQ6rzUXJLCNcxkjivFuSJAF7xf6jvwMKRMUpxo+arNTqjd?=
 =?us-ascii?Q?KAV6oh/Pg5qaD0OnKalepIluE2m5rf7Ov1OVQJQAYik6JqbUCR8izCa3yXwd?=
 =?us-ascii?Q?QfmgUgmg4YAIluSpqBxPJRh2ZB+tiwDXBXN4jM4eMzdLHTvw8T3N3/nnekr3?=
 =?us-ascii?Q?zsqrlTiHCaJVWFd56bEiHIkfnV2YafUN2/rrLKTJISfYZhBwp/t7bcB55WaF?=
 =?us-ascii?Q?qNof/jUXH4bmIpfABNE+GroARiCwkkiVg0Kufk4AwP9r0Up7ErfCQzs4yPGH?=
 =?us-ascii?Q?PnE4h9TjHLP3tWXxGUBWdAAJC9JVDkAKI3A3aC2ZIkvKYkCZyDOSKDO4Prk9?=
 =?us-ascii?Q?PYSOfT267EK8iqmSKU2yRR2YJJT0NSIpA76pzdli0NoyuiSOdAzs6w+2b4IP?=
 =?us-ascii?Q?yGLzEH8wBOgwqKSvUuMmsI7mntiA189UQBvAXmZ3TPqTYrXhu+s1hXhl/mI3?=
 =?us-ascii?Q?7dYDGuIc/h3fXDo59JVc5QXxZUBGo5ju?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 08:59:54.9216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded726ef-c167-4574-3193-08dd0f8b0717
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674

From: Pekka Pessi <ppessi@nvidia.com>

Some clients depend on mailbox being empty before processing the
message. On RT kernel, the thread processing the message may be on
different CPU or running with higher priority than the interrupt
handler thread and they may act on the message before mailbox is
emptied.

Fixes: 8f585d14030d ("mailbox: tegra-hsp: Add tegra_hsp_sm_ops")
Fixes: 74c20dd0f892 ("mailbox: tegra-hsp: Add 128-bit shared mailbox support")
Cc: stable@vger.kernel.org
Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
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

