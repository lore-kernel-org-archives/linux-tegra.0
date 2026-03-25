Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6B3563EB
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466812; cv=fail; b=Uw/Z0KHPO+4NWF3NewcH9yKvzDosOc+1Y0xLkmDA3ykMkpKeL8iBC/qYYV+dTkPzvzBBhfw+r6rCY1NRxh+IQfIW2vN8k25EBUEvxtQ/oNVuZI6uB66RU+xxDugqNhBtwrM91vwKsLU5YStWcfYvcX8YSB0BmEqSSIa14pC+pwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466812; c=relaxed/simple;
	bh=8ANWhKCzm9ajvNrDpLL2KT6Azf+4emd26k9urB07R9E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aB1w+U4ozyAFdf6i47Lu0iV3zlAtFQidFLCaPJqWqQ+ERB2KqltOQca0HWLGUL5bJMizoHQkNyne+VMXnnShAe+Ta6U8HD/vh1e/lW5DSPeCPM+iaV4+YH8+bgqaJ/WQBlugC3dyZLToRCYmVU9HOwefAkdo99VdsUZcPV/qy1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PmOMqfIU; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PmOMqfIU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvE6s3TdFRBuq3jPvb5MOw4TRhVWRw5L1qVAxSTYmug9Ax1bGhR2xRzC9CIdwfRcsXXJPAyl9agQ4MrR5evRGyJu0B/Qv8qdCYGCFTwSbH5yHOPEg9T4ysWDqc8ycdLyvl6F/VtH2gqeuRs5EG8YdbfzPeWZWwN4yQTqBdQpa1zdTgRsq4VRO6QaH9Z5oJRdrRSWygrYwL+MC8NPWS4Q0nsjihZAHyqBxS2haVCtDNOiWflGzUmgo0vmP/sJL79e6uJ26vzT/FZW2dRQ5O7auLXsCNQwoFklQzgGX5hYw0EAv63nFkjx0feAS8HY0z7d6yxujs94IQdfuLTZOnS6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvVbCp9H7NKZs4jX1n66xlaO3amLCu8xdiHx3gJOHow=;
 b=vkzrEs20oNrcz2Jtb2AV1Vq9urmNNByTKJf4PBu8YIxUefKHr3gt3BzFlN6h0zARsLv4H2pWNsqWjipA4TpufnGe9YK/kn8jpVVaR5TZT4eAcRqDmViqxpCv5X+C+8f0A8kFP3c+Gce9L7bIL55NQOQAQikeXKR3odwgmd2U/BeeaHByrDJ3M4QMU44XFybPcnA5AoqhPmQ2fxw7hwP/9NxcUVqBF4IfK2W3mSuejNR/uNW1Fze9ngPGYk2o9vfG5LTVvghmSul+6lnFtpAqd2bim7Gdy8YUQhyr3Xeuv34mroBCqp1Z6Y54HsyQif0ir8sKsugimC19bzHYLZ9nrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvVbCp9H7NKZs4jX1n66xlaO3amLCu8xdiHx3gJOHow=;
 b=PmOMqfIUZ6KKZqv9v9uWNSOmiJWhlscPbDbdVXFTIo1o1GxS92VWt9a7yCtvk7f0nDSdUUvCAp+fzSNsTMdvQb1q856DsK4YYB7WL5WR8g8NUdAGkGad8BgXXo5VooFXMm3aKnjb/htSPWM40wtsYxzRvvKiikucuJz1iefIP/+gWKaFKR1FE3p+CKYxJRqYkBJ7Gb9iR1TE7Y0bO2X6WJb5jk5PT5NoZn9MSENG6Nvtnj+8AYrDEDsbu5o0jSBh+TLEsiyLKu81aUxl8ncrSLwjtElxyNoJQpdZyQSaVmfkpXS4sPunPrzmZ+loROXW1yqqdzeQID2DM5jULb/lHA==
Received: from MN2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:23a::34)
 by SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:45 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::5a) by MN2PR03CA0029.outlook.office365.com
 (2603:10b6:208:23a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:45 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:26 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:25 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 04/10] soc/tegra: pmc: Remove unused AOWAKE definitions
Date: Wed, 25 Mar 2026 19:25:54 +0000
Message-ID: <20260325192601.239554-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 314aba07-d136-4f00-ab4a-08de8aa4739b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aIvGvnFkV6u42/Bdv54lK3RXy/ojDOy42VBAEeylhopx8Y83aL8UE2qAGmjNudOCp+/2qsGJXbm+30rl7SwavVGdB+bbLE4hF5ewNc7kpQsg/FCcqx72lxdxWz20NIBkdmF5nPq3ruWbUal7uaqHspkq3NLaQh+R1J3JKZInkdfgkdEp0Rz6YvE6oCxuhk3qYfXCR3HAPETp4rEpb/uK8LSVDGcq7NlItB/PsoyrAT/Ww/d/HK0m5wmaCz6B3JJzXbqFZ0QU5Yrf4Y348f4bspnF/PLMVUYMtptQFgu4Na9rrsNHwCN5WeusN7UgECc/11Xb0OuUl/plvlWrBitxg9JpbFocpOqtjU/tjT6IYZW6TTmG8ft0hMBr9oZD07wp0g9gFaSjHKUNC0qK5rHJL7cYYRybi5Y3LNfxGELsvHhOj0FA1aQHzrhgcixDZyyUdDwSLZ7mWAAwHIrVXcXihv/2I+dkhYYptYM9FOC7CivvbpRapt92o0RPFGltFIomlsLc8SCIwSFE9D0b8SJhkGb8ya+Fg60KvZ5ybJ2o/cowFYy0cAzeJWhrl6RQvLwTHZ9O4SK0jC2+3w8lv5sJLGBMe/g9RtSBPf9eEg5NmtsK37nuqgO3+jBG0m408c1d+VaWiaCUYdogZuZm9/KeP9nac/6ybWQ+XbD0z+bz8D862triFikEfkNVU3jNH5jvIaO/Qgh7vqY5AW8XAKh8+l2WYL5EO4hHkvPfYIscwjRdViXjJYL2rdKo4EiJdM4jaBRrqyL7Zut1Py8/dt33Zw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xxSM0O2rmgsh6UZgrR+tN8ZnjK4+3MUGDStl9qWNr9ChE21kHLZsYfOoqdK4N2JzQuvTJjn7TLMRdsMZ3GbNRMyHTnDszX8m87lRmOIZUSA7U98evPyme0h7uUFdXmpukhAgoh4LdTSmx3rvqFAA7MoP1N+oK6bqJzompQ/aNh2i8Beg9E1O0scfuazhRhdBT8CcyhBW6CiV0W75fw/REyB/YgKcMn5yhlo3FO7A/2GE7JmVYfHLx6ttj4jyyHDKGTswUAs8L9td4SV+yhD0auRh7tt1XauHnTCqOAcVl0cqyH46VL5FW8l3WKytYaMYKVcqUmId85SuotFSVVURqUuMo2ImdXhWRYc8BjDZYkV5hK2v29RIlxfNP6TrJ2+CZsm5EFTl4ejfYFfpjwLzNRPWxRtL5fyFJETLjueplppvSN2mgJYri7Y++7S7kttp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:45.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314aba07-d136-4f00-ab4a-08de8aa4739b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107

For Tegra264, the offsets for the AOWAKE registers have changed. Before
adding support for the Tegra264 AOWAKE register offsets, remove the
unused AOWAKE definitions.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6debaabdaa36..55c1117b1741 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -181,11 +181,8 @@
 #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
 #define WAKE_AOWAKE_CNTRL_SR_CAPTURE_EN (1 << 1)
 #define WAKE_AOWAKE_MASK_W(x) (0x180 + ((x) << 2))
-#define WAKE_AOWAKE_MASK_R(x) (0x300 + ((x) << 2))
 #define WAKE_AOWAKE_STATUS_W(x) (0x30c + ((x) << 2))
 #define WAKE_AOWAKE_STATUS_R(x) (0x48c + ((x) << 2))
-#define WAKE_AOWAKE_TIER0_ROUTING(x) (0x4b4 + ((x) << 2))
-#define WAKE_AOWAKE_TIER1_ROUTING(x) (0x4c0 + ((x) << 2))
 #define WAKE_AOWAKE_TIER2_ROUTING(x) (0x4cc + ((x) << 2))
 #define WAKE_AOWAKE_SW_STATUS_W_0	0x49c
 #define WAKE_AOWAKE_SW_STATUS(x)	(0x4a0 + ((x) << 2))
-- 
2.43.0

