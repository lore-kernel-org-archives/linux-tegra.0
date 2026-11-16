Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840723;
	b=iaxl3Q7DGtlCop+MP+oHCXFdrDEj18/WZL9fw0Qt+xVCcAJ8N5MnmGEwfeHSAliuK441
	 d2K3jnU7f4VJV8kH0EsjXJyTAvsHw5SLIAj38ILomiXQN2PwGua1+VC0nuEFanFrzmffv
	 CHRLfrPC7bWAfnDTH/YhMSBOhmte75HHRTDVoDhL9NCUF1csJE9/QUBx0AO0aEl/JTXtI
	 pBl6fHui0mCoz18OAUFfGcSDSxsY8FnrBVzePNdpotIB2ncnVTX1Qli2DggwzhtxKnvTd
	 8kcsVL8jk0pT+yu8WAOQzC6CHZpi6k1vVm+Nd7B05gMfgr8F2VIgeoQx7MN5yrgKmWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840723;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YrgRtf9nyrljao80bQFSGGyUCylZiug3iZTRXiyiejs=;
	b=xTzfXaNIcK/B5Djaz+WaNkkB2To6Y2Kt5CNXAW8lRZ9WToTr5s6Et+huQHyCokf4tFa0
	 ibtaaPjsb08sPwGyC32aLc7nqO40kM/BqO1DkQRzVaSX0dYpqkSxkvRsp+iEv0x8jkmMv
	 km5b+wKqulqYZWiZt1BN59faZlaw9Tl6HScEmsWZ5f2Qpxr+Vy+JW+AvKA2qRjMgsJLyd
	 rzgWDPy2RqTlXlnVbN333ftE+yRgOjeEbMs4rrZGzit0IFISxR24XKBFwEj6s2UkPTJ6x
	 INQpPeP7Das1hC6Phl5e3glXd1v63lq9pY0ap5W3mB/7oegWbhSghaYZ8x2EiW7r7iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZAmMxplu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.48
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E9606A31C
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 14:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZAmMxplu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVtZo3OVTtU94D6GwfsDfHeWizr3hgY4AQrG2YbsamTW7LiRrCqjWe/dhQ9UEPUygCAJxk2wp/BQPUyKB3yKmR9skkOTxJTrnk+lxwOYmMZzgsPi6AznPkw7Hl+M+5LkAU1JVrPJic6Bhh5T12hpW99v9P3ZRuFxcxeQfUhS09u0QOEjk/yIWDTJE2cEuPFnCDrt1b5QPnKOZa2LhHxDI8u+2Dy1R32IE7Z8ob2icYhPXZR3aBWBO6kOxvbxmWfWCmGLZoUlQIFrPBxbKi83n8Hswpe0bwhAx/OvaiBJRDN5xtjRYk3Xek5yOy2gArYrtGWTpkhhDmjWeII0Pkl33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrgRtf9nyrljao80bQFSGGyUCylZiug3iZTRXiyiejs=;
 b=efxcLnOT17zYO6ltG5X9IBPis4i/HBQeIP0ShY2h43LsCO6mKVNuJ0Tr1Dk7iJHpY2IGUEl51MxjJb4UOxl8Hz4Pv6MjMeyI2ysmgs/R2SoqkIqBQJswqv0jMzaU9HlOmXa/AAR/wp/UBeS4mKM1ulTULztnDOMdpG9CjfIiaSKNHVK51MHx7pT/EgST2qLUPJ53Eb4L0QQI1VCg/aH8cOMsodztshPSzbgTpmu1O+9U47+3Wc/0hhRZhgE6Bdeyeog7Lqu530UH08wCUzZ/eGeBYzGrjht/wO67CIsCmlt2n/j6gzGufNUm5IT2S4pxj+tOwIaO8DnevtTZVuyDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrgRtf9nyrljao80bQFSGGyUCylZiug3iZTRXiyiejs=;
 b=ZAmMxpluPLJFkd5O1GKgre7lnBqVvU556ao6b5OGA6WJ+tAM8MWa6+tsviKMelEAlxIkVF84tExRYTGZ/jC6lnMMp8NxGQtkHW68lQdIekO+op6wyVCoIW6GMu2n/Lb/vtFd1MpJb/f9cDH0AgM7RAdBLy5OJ2p7OVtYLZknCaA6hNNlCJbb1Q3ihLUfhaENVgmmGPI1viK9JT8hKE6neRoktM++YYDwhCQNl451FPEwA0kwOKHGNgfqTLS87CzfXhdfqgozJU2u9u/+GgDi9CLJ5wC7WHklU5uv07O0YKprd9hYAErg9XkpkaQXucxrdm2amdAYkFx7x8PJz8YYjg==
Received: from SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::17)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:51:53 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::8e) by SJ0P220CA0008.outlook.office365.com
 (2603:10b6:a03:41b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 14:51:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:51:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:29 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:27 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 14:51:15 +0000
Subject: [PATCH 1/2] soc/tegra: fuse: Add USB fuse calibration registers
 for Tegra264
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-phy-tegra264-v1-1-a82b8e10a553@nvidia.com>
References: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
In-Reply-To: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>, Jon Hunter
	<jonathanh@nvidia.com>, Wayne Chang <waynec@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|PH7PR12MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 403a1471-d506-4a02-ae1f-08df43f1271b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CCDZc/aaMK9+tghPZJiR7fyL1gXWNEjwZw39BdWWlcjNaSHe9Ndbu8IYF180VtGxd8p8L3Sje0jJaJrwTrX6qAKGJVo5rU10v5emPU46jVLM2tFG9uvjG6sbUmjcfqoByYd2Sha2hJTyYHuyH0OP+yTpQfBUU/cUW/eyUbooLTHT+ZQEcMJTKV/LD5sVAEWrH8jZtp5KCcN/ZEUA29JXLUN3V8ubPWZm3JuKI8VKxdONMup4zhaJtpy7zxX3Ng8X62F8GBjuv0/QLx/SMbeH0q9kNU3CFYmtrU4zP95Pu8apiywR0k1Gf8qnostqyFMKIMmmIuOyVI/TCnfQgNV3C5YXI/w8sGXKLmpS8EiNkniaRJgD0HEP/o4Fd5IgJp/5Z+6YVvssHGSqE3xHD1wlvSjs0KDrxiTvEkDPDNtb4GYc7Z15Npu4gmdskallqGdKWSFNGNO5C7UjX1H2L7HzjqeyJAPj8qQTtEMKpkWHypGeBthZRKcteqLV8telHzABcTrTgmdAeqKUAslh3e2J9s6rmzISDTw8tgxdjuLMHDhGeL2S1IiGfsXsyJ4cByCOLGaF4oNyrR3BXOmp0wCC4ZJuIcFsV3W74S0FIs+3ar8irY1mCbYU7+pIqY1mTzb6N7dvRyjMx+AOvlyRS/ih26YWrHg3N4baXtTvUfwvVzGr2OuTmP3dJPUea+tSQMTIpb2BpYMTTtKeiEvfqOJ3MQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0bLP41l7DZTb6Wu1koyXAUB6st4dmkBb/1LaJ9hPnLmezJkQX6JXG9WH0huJUydRQ/oO0tQZFLVBy6nv4P4s9GnAFPM0k4pgFqE8reN3az/9Pp+G83RazfpPXhZaWGQtv7TR09UVknyRa5FcU0QUPselTfZRvc2Ohos2GmkgNrboNwByoIqW8PtQ1NpKqEakjjBLo/KL/ATZfTWa0eOcjX1hcQt81y0YDF+F6FGZtDiF0lUIkZwGvzVUUbn7AHc0QDwQ2nbYE+y+1q7rNyMnlbU/FYOPbkKx+p3Cwm0y6NzgRdsiZ2c4mJnt/DdmrsmmLnS4VFqkXU6GL4kXZ7EDsX87hI1UzwBaWZHW4HbkXYGRWXBUacCfRhxIzvqa0QG12Ugrbeecw1XPEwrSvrJ77aohDpvvpKLxyu7nblscWqTYxvoy4gyDwoWRkwn3Cq3e
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:51:53.1811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403a1471-d506-4a02-ae1f-08df43f1271b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736

From: Wayne Chang <waynec@nvidia.com>

Add definitions for the FUSE_USB_CALIB_EXT2 and FUSE_USB_CALIB_EXT3
registers which are used for USB calibration on the Tegra264 device.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/soc/tegra/fuse.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 14822f981fec..5063707839dd 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -23,6 +23,8 @@
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
 #define TEGRA_FUSE_USB_CALIB_EXT_0 0x250
+#define TEGRA_FUSE_USB_CALIB_EXT2_0 0x2ec
+#define TEGRA_FUSE_USB_CALIB_EXT3_0 0x3bc
 
 #ifndef __ASSEMBLER__
 

-- 
2.43.0

