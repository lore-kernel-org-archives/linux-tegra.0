Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4DF13A888;
	Wed, 27 Nov 2024 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688484; cv=fail; b=qetfwdwgictiFbIogRaCQnnCMzBfGDAZvqkdssNm2ivziJilsJcLMZJ1ADdibanr5DHM8Y0efMA0UuHDRPSgL6LtTmzAAlnBHIuA9fK2FcUxQlUwG913NGQhBtKmodbXpdooLteMDNvOGTB+H7e6TO2JhvpK7MMft4Lh7DfrQLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688484; c=relaxed/simple;
	bh=raJXFP0Dt+eGHVqe/H/NJdiXKovSktEin0mhykO2Brc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IcbJA4YiXkY/5SwhiFR3nRfZbyRsztc1MB3DbBqcQZSslDx0x8rmBrqhBWsPDAf0assmq5pWU1OjluqvnnXx4+Jd1s/h3vlJfjqjejgeuJ33Q3f9va+3Bivf+3i1v5l3qlSx7AHrE+jshXX0Io3/lnv9oK4oI3X4InQLOS3tb8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KU4XmOaL; arc=fail smtp.client-ip=40.107.101.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KU4XmOaL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLZRW6ejiwwfY07i5qEopq1ndbqoUs4nnPhSVmjTvjfwtYwypkFy1BexCO257iYFM8Vfq68x1dSqwJ6VDmsKHNEoT78QAxdluSiP3ICQfqWLXH411vOHnMWQbvTnu15DAZuKPZOmyqWIwxatK3wYWVW9/Zf4CHw5/TQkneZ5dJY3v9Sn9qmWazP35bGJR0blQylyZTl4K3uWaBoeOhEOvkxeHW8WKo30HHMa35WsA9NCG7rasIKW6m0Z3arWUzF2rW8truxZXc5pta1DQwBrhFdRX6kPUa9YtTGsy1KhQHhkDsAk66ZMOaK19PswHk5V1YwluJgEX/7Iis3fI8sIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I85a30SAIhykL5pdzTSuVHQpE+4lu1VfEEikt+5pdPM=;
 b=VR0DWVQPr21/qq9PMsVNXrcI6DTmDw77ENSJEfMEPlJ3FG8M0woSkhyoyuH+LnIJV8+EgZOmco2/2AgR8o3NWheEpA96hnrYDKHfQ4rHt3VReBRwZwUT8y1S3H5hYbSY4SjibuL/+MEUzmY87L+z/30wm8WW3n/HQWkLvY0E0Lyo2j4YTafw0HHNENw+AfVg501JUMd9BERk0vnrZqeWpaLDKxlEDdldMOgoJerApn1DvG2SWNPM49XrMH7cv3H8z7aQavr8IlOy0wHqq+3JNEsYIcqsyUAR/TBI2p9PBz6D096XWRbMxJqqFThxB13U6/nYNpbOY5aRcUPBQf489w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I85a30SAIhykL5pdzTSuVHQpE+4lu1VfEEikt+5pdPM=;
 b=KU4XmOaLx5uIS7+sDuelcekm2VgUlzKwEAwYcnZG13InCSI+UEu290w6Tm+nswgKUlEqJQhM67z6vbDFPjruJJApt33CNrachMX60yBLEbDbU1st4wjeazFjG7C4Ntr6Ea6WtBgUkp9boswK2tZoQbGGv08nK1g6ynAq7QfttEZoutjnct+Mp2DVVgB5YUUR2nXfh4HUxM/SZugFt6XMq1hREwamYnJy8a1DoPUIDq+cM3SWZP+YBSy9zuBuZMNCG+eqFiNLaFzI/41XudCvJtHi5t0tu0R+I3wuujlioz2gcaHVcc6encVa1aUgRNz5yUsp/m5+gDR430guTADxqg==
Received: from CH2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:610:50::37)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 06:21:19 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::ad) by CH2PR16CA0027.outlook.office365.com
 (2603:10b6:610:50::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 06:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 06:21:19 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Nov
 2024 22:21:04 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Nov
 2024 22:21:03 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 26 Nov 2024 22:21:01 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] mailbox: tegra-hsp: Clear mailbox before using message
Date: Wed, 27 Nov 2024 11:50:53 +0530
Message-ID: <20241127062053.19165-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acb7ec6-5df8-4642-9a9c-08dd0eabb4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOkr809UvFcqo8MuZWu8zIRApWlVrAPeJm1fNEF9Q79p97UVlN5CxpFCQEH1?=
 =?us-ascii?Q?AusKiVpj2gUibL/cVxEQy1KWuU9+7D0jGgSzn3rqG9rVKN41Vq119iu/IeYz?=
 =?us-ascii?Q?Nm+YghnNj7oHNwouo3ujTTonfDVqBMv6pEoYBJp0Sia1qP8ImleOST/8IiVH?=
 =?us-ascii?Q?PTTbp9M+0lZYEc5F5TjXBmAMba8UegMMP/qN/7llM0N9FQ5X13a66CKQsIJv?=
 =?us-ascii?Q?e5AK2PGCsTYopDLN+CWmWV+QoWsd/NBu51NvEUPZNDmHAPzxet3KWPFDPkV/?=
 =?us-ascii?Q?qvERT/EiZ0a2ercdJxMdt3kc3uS2io3QuAdszIHcp9VOT46ul2sr6C0pE6ex?=
 =?us-ascii?Q?WoF9QoE1DYzpYbgz+AIWcQyDxpESdRCHV9Y2RE2E3mUx8NXakkfj2qds25TE?=
 =?us-ascii?Q?UZxm+Pgy91SbvQuZUmgelt3tKGfBX7Z49dvbTiqKc4brpMG0xn19QOi90Z/g?=
 =?us-ascii?Q?hhHppb/SD2Eh4upuTn3cApuBziOhHQBUNRFi/AbjwNBUE+rBqkG5U8tVBrUY?=
 =?us-ascii?Q?pRP4ojx9edgV+t4zNYgv4p/MOAv4I8C7Q3/7dZpntkY1GeXGiKiYmz0a7XYi?=
 =?us-ascii?Q?YuRabzvawWWZyGj1B4dNGoVOJQmPmkKBXgfM50dLw738uDGIrJLSdR45wsbd?=
 =?us-ascii?Q?4C3teOK18GMk5+In26109L8u7h2XQP9OhHNX0czwMeFoED1/Iv3tJ9P+mqDu?=
 =?us-ascii?Q?9phPa4vhxYJ4HFyqtghOVRa2W8cs/fFaXaAnQenEsxu2IxGrQS9tWLAK4/T/?=
 =?us-ascii?Q?kzoXoIxvgePoKHSxprEo4rsT23E6JiCG241tOrRz5F2khvIwVdHNa+Jvp39U?=
 =?us-ascii?Q?L8Cb6KgY1d3Yi8gbiFJQHn3tS4R/hZGqVX+GyCaTo2rrBRDLv2nM+2A72+tI?=
 =?us-ascii?Q?uN/6/M5jR6IH4I5I9FeaSkoDtJMz7J9CoQd6t1zskFFi98qGpX8OHJggUQus?=
 =?us-ascii?Q?vwz9Vk8ieYcwjBnuZYqbic99HMsbBN2hNMZmAqVWZFMdk/gDThbDwqSsRrea?=
 =?us-ascii?Q?NgaA4BXLvU++C/z6MIm9Mf3rFE3IVB7U+ZCFYbjDIEDiyuGsg3R6PM2C7PY4?=
 =?us-ascii?Q?HRq8OnYxgCYTA9Wx9nrnTEeUmm+5DlVVk1WNplFBwrD42FFVdbgYPPtrugaA?=
 =?us-ascii?Q?sFhkwsvdFrAucxFbQ7sMztqn8fS5zQjj9E1N49Pb3og4pesI9bu+QwRTFLdi?=
 =?us-ascii?Q?n7hdUCuBDHyIoMFHMCyzH5XlhWmy/d1d0vKCMg7+W/ITPJg4ZYvhE5c6Lrx6?=
 =?us-ascii?Q?bNDRDGY6s3BtgZG/H3cg0wx9/C/n183s63xHe5zH8mQXpVtisDd0BC0TbFTK?=
 =?us-ascii?Q?7kVCQl7ThpT0vcDoDgXes0mxXZwAcl2TEghWUjek+BbOJMnBtVwcthLpSzKN?=
 =?us-ascii?Q?B889X7Zz288ZPDBEMTMy8tQ1lVBcLSUkpX39Bf2wPJFL72LrtcaZF3D6V3OT?=
 =?us-ascii?Q?QfxEn7lU/iYvb9frcUPcASd3uzfODzmT?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 06:21:19.1993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acb7ec6-5df8-4642-9a9c-08dd0eabb4e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956

From: Pekka Pessi <ppessi@nvidia.com>

Some clients depend on mailbox being empty before processing the
message. On RT kernel, the thread processing the message may be on
different CPU or running with higher priority than the interrupt
handler thread and they may act on the message before mailbox is
emptied.

Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 8d5e2d7dc03b..9c09858edee7 100644
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
-- 
2.47.0

