Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842721;
	b=m/+aB4Ljtoi0i/8RWCv8C+FN1Gwv/B1P2/KtpJezyXCSWreYIjXlUzaw618VlBkA2smL
	 1ot0gqc46+k/GbrSjud7Cdvl5+Xcqhf3nFgi3rS5Imd5LVMRgedE1r75bZk3jFg6c3tYU
	 +cfJcFngSa+Q7QYEnJ3ewNVTdckMqKd/dAx3JQEsZUF2135NYL8sRdNVRiYI2s5CfCVSQ
	 gi7eKaYAe7Ae6a6qVT4Cwk2uxlm0coHInJz8GpzyC5zbwhrrv1lqCXFHzxEfzMbMpfjRO
	 C33J3Wr7jRNbQPhv5CIQd/1ij5n2pSfTt+GjeEBAEHudO2j79qAr9fSsxOe4V/0LN9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842721;
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
	bh=KNwlH9/p0BG4rJbgayG6DkY9KVyx+2fMyw3EgxnT2FA=;
	b=jIkXF8eJ7ZKg5Djq7kyjc3ZWJfOaEpENFeGbMFIu5kKSimTJni7cVoghgF4SyEeJRhNv
	 5VR/1/OdJ6yl7tVwhlDoRXuXnJsQFk7bP4FrUDGvrvpJCGqrQbhk3R6Oa9Ax0STOezNw+
	 iBoPmnoT2gSwhBNOIaNvulxKkJCWEfsl5Wg/dhluGJwDAVpmrobKAVCrBnVTdg2USenuO
	 vqGkThv6WFnGY0H7/gROVpueNJMTcMXx2IdjgFkd8zEPwWzElSSfy6tPEjYyZacsl71KJ
	 966q0F+ObFgXtU1nYiGu7jIYzy/xsJb3FHaellAYPJ8uqtwaKGOujfosEQ4V/PjfL3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OdcQlduZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.20
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9D606A32A;
	Mon, 16 Nov 2026 15:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A9D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OdcQlduZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+gJPCCXqZJY0OnyAQYO40MSWfopjovbbb2TIdQh0ZDhIV6ZgfL5/SvBDqIT1X6XkPpSe+YTDL549oeQqKwOa2XpcriSCCoerYZMV8jO5dcPziJaCEVSKg0caBgOYKsKu08b4wwvEct9oGn6WCJeRC4JNCkTd5Znaa5O6hHL5sHD7Q79TT8H1O0E9v5ZoylgUWm+yQEH6MXWM+vftnZuZj1tHGxKT8vGzGsAWZWl602rHE6bLM6hDCM+nwCu/xilUeSJ1Gi6gHeXQLAs2zoTaFDUoVd0OnUTO4J1msd3pLmOPRpxEEE03/NSA9JTw432D8B6foqqcRySCn6qG4am6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNwlH9/p0BG4rJbgayG6DkY9KVyx+2fMyw3EgxnT2FA=;
 b=xhQmPBitMtAyeVxQ3a4gDiKmgplY/v36PcratdWFp/+3FILJgE5xdoQ63rVP+nao0GURC1eZzk9sOVbpoyc/U1wEjW/ZdL4+Kfqc3XnZ9cBONu1V5HZZDlu/ST7nrla7qDg9mJPxwYZNikVQlzcP7OKkZh6Xkr15E6gSuZ3vxJ8BqFm4tyrrzbLHTRrFmsDhZPfKrxQdOEJDqRtGRqWwTgH2TlYoBmk/mWFfx+SGHx1L0XF806jJOdFiBI8f+aK+Z+3iPnUhXBHU3GcxXhyem38e86qTcnip+NECZQP04l9nrYIERWhXhaHqr6CKX0UlFqaYCzghtV119XQlD/F5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNwlH9/p0BG4rJbgayG6DkY9KVyx+2fMyw3EgxnT2FA=;
 b=OdcQlduZsFIc9ki7ymTb91yRU/vmgnQY2j8/kBaXZeoIIDwug2ZyLOuigbkNhMHQ7D4c56fpaSsk3MfUfyXqiSJZTKlFBx8ks2+9rRKDM7NHb5h8eBRahHomF5tcMvCW5Sr09pqrxvbF9MO6pmFVqvlgNVhayq27f/sbnJB58p8axVFU2Ml8UWhgSB/KBwBeYKtOl3noWcRIWn9MdLt1ToSTAxh/NSNmyXtur9gc80fERN9hgRAYlNcyGnxR5+yvuknoYJjGuBTW9xKR14LolmJXH4m+oDUoSHHP4cjB/WdDjhZDOvsLiLRy4Ajdt+I9VZgCVr1b3hF6/hzZSeWshA==
Received: from MW4PR03CA0186.namprd03.prod.outlook.com (2603:10b6:303:b8::11)
 by CH3PR12MB7737.namprd12.prod.outlook.com (2603:10b6:610:14d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 15:25:05 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::8a) by MW4PR03CA0186.outlook.office365.com
 (2603:10b6:303:b8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:25:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:25:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:41 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:37 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:07 +0000
Subject: [PATCH v2 10/12] usb: gadget: tegra-xudc: Add SSPX register offset
 to SoC data
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
Message-ID: <20261116-tegra-usb-v2-10-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|CH3PR12MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: acbb7bca-f54e-44da-5984-08df43f5ca45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261022075727099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7Fp9s/1jRj6Q9jhU0sqPl9dF3p02/SqfIKeW7fxIAOiY/N8Gqaf84DCS3o9JIRsasYGRXC0IH3blIi1g4ufFuzwgliv8pOT2l24wzlk2MAhNqp3gtqKtyq0dejGLjvCNqNN25SspbOyfxl0hIRqz0r5sefXxGGU3RCs2EkSqsqpT6ykpQFbPGT1xE2fxroPo/INUL2ai6AboQuY99LKBBLuAH1Gafja2sJXNex4FFggRlWdGG767tW0Hrwqm4Dy4xsPb9NS7ncgL0tY5fJxHMmEWTKW5Z2IAIbmmpX0s4f/yre0XeapOHfAKU4UOFbUXmDOJ1CZ/y1UpQZ+tGCiqYc9DgG1q1/akwl1+mXDPIrzNwHBSot/SrBLoUPYY9EW8yUu4jlYl0GQlHp9rSVcfBiglSmYo7Zvx72Y2G1qaR291m15/6Ak1Z2KOlMOj495ySc8L4ejTZWfcHEjAnsV1bOVHwgk82JeNPe1uVHQQ3eXqGVSQwFzyk5C3vq3Vp++cCqO05uHDdXbLVI/mJavPcf6hZplbgeFexGrj51eKtHSp8SeG55nNsMelepkwBgPnWFzPmVxH0iHhVVMb2DGbP260/tFOXwKDv5uvdJTK+mHYA+sisrHuHex7bbJ3556VLmYLJSYhKvvbmvFghsVz4Yv8+RtEuIRY6tqi158YmMoQGp0CIxJDuhkVzsIqwrvqMVyQC8wXceEJZqKmYj6ejA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AwyMYqOOQIubWGWiO/HUJyZwnhGB3NZZqHk3QXVGW/BYxmQU/NucHBi8RSeIERXJwIaIUwmfeRoRVf7GRU48JMzZ11avxFWrLFB2eN87J1LjSZWkQTrT4QO9LMSsd+diSKvmISCKqIiOHqHRrLKeaYLOmWVZhoAJSWxa7FkW0w9NWp35fzoofKE+n6WnRKfWB7A3aRLJjyR6q2hn7dpuD1dflZG6+Vv+XmbHt6Bw7kTGrQwx8VseC+1pUcIINacYw/q6/L/uuwualpzgaMyqCiSyXV6zHWSNajKmoMNMSzZf3iG2XDGtbgELIpyWrYWrjhgWQasAzhUJznkl5URlyEvG+ohx20P2MI1hVV09rvyCVPrnK8RTraqD0oyYW1Hf7JNUIKKXuHq3C9emdiTZoPYYcgHriPnqqAHqBbizoiXwsESVkvXIQX1JwQWb+l/f
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:25:04.9067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acbb7bca-f54e-44da-5984-08df43f5ca45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7737

The SuperSpeed Port (SSPX) register offsets for Tegra264 (0x4000) are
different to the existing Tegra devices (0x600). In preparation for
adding support for Tegra264, add the SSPX register offset into the SoC
data and update the register definitions and register accesses to use
the offset from the SoC data.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 90 ++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 3d7254d6ebcd..d11c2f5069f2 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -143,42 +143,42 @@
 #define  HSFSPI_COUNT13_U2_RESUME_K_DURATION(x) ((x) & \
 				HSFSPI_COUNT13_U2_RESUME_K_DURATION_MASK)
 #define BLCG 0x840
-#define SSPX_CORE_CNT0 0x610
+#define SSPX_CORE_CNT0 0x10
 #define  SSPX_CORE_CNT0_PING_TBURST_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT0_PING_TBURST(x) ((x) & SSPX_CORE_CNT0_PING_TBURST_MASK)
-#define SSPX_CORE_CNT30 0x688
+#define SSPX_CORE_CNT30 0x88
 #define  SSPX_CORE_CNT30_LMPITP_TIMER_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT30_LMPITP_TIMER(x) ((x) & \
 					SSPX_CORE_CNT30_LMPITP_TIMER_MASK)
-#define SSPX_CORE_CNT32 0x690
+#define SSPX_CORE_CNT32 0x90
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
 					SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK)
-#define SSPX_CORE_CNT56 0x6fc
+#define SSPX_CORE_CNT56 0xfc
 #define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(x) ((x) & \
 				SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK)
-#define SSPX_CORE_CNT57 0x700
+#define SSPX_CORE_CNT57 0x100
 #define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(x) ((x) & \
 				SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK)
-#define SSPX_CORE_CNT65 0x720
+#define SSPX_CORE_CNT65 0x120
 #define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK)
-#define SSPX_CORE_CNT66 0x724
+#define SSPX_CORE_CNT66 0x124
 #define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK)
-#define SSPX_CORE_CNT67 0x728
+#define SSPX_CORE_CNT67 0x128
 #define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(x) ((x) & \
 				SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK)
-#define SSPX_CORE_CNT72 0x73c
+#define SSPX_CORE_CNT72 0x13c
 #define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK GENMASK(19, 0)
 #define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(x) ((x) & \
 				SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK)
-#define SSPX_CORE_PADCTL4 0x750
+#define SSPX_CORE_PADCTL4 0x150
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK GENMASK(19, 0)
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(x) ((x) & \
 				SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK)
@@ -551,6 +551,7 @@ struct tegra_xudc_soc {
 	const char * const *clock_names;
 	unsigned int num_clks;
 	unsigned int num_phys;
+	unsigned int sspx_offset;
 	bool u1_enable;
 	bool u2_enable;
 	bool lpm_enable;
@@ -633,35 +634,35 @@ static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
 	u32 val;
 
 	/* limit port speed to gen 1 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x260);
-	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x6D6);
-	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT65);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x4B0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
 	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x10);
-	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 }
 
 static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
@@ -669,35 +670,35 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
 	u32 val;
 
 	/* restore port speed to gen2 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x438);
-	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT56);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
 	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x528);
-	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT57);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0xE10);
-	xudc_writel(xudc, val, SSPX_CORE_CNT65);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT65);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x348);
-	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT66);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
 	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x5a0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT67);
 
-	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
 	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x1c21);
-	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT72);
 }
 
 static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
@@ -3413,22 +3414,22 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		tegra_xudc_limit_port_speed(xudc);
 
 	/* Set a reasonable U3 exit timer value. */
-	val = xudc_readl(xudc, SSPX_CORE_PADCTL4);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
 	val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
 	val |= SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(0x5dc0);
-	xudc_writel(xudc, val, SSPX_CORE_PADCTL4);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
 
 	/* Default ping LFPS tBurst is too large. */
-	val = xudc_readl(xudc, SSPX_CORE_CNT0);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
 	val &= ~(SSPX_CORE_CNT0_PING_TBURST_MASK);
 	val |= SSPX_CORE_CNT0_PING_TBURST(0xa);
-	xudc_writel(xudc, val, SSPX_CORE_CNT0);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
 
 	/* Default tPortConfiguration timeout is too small. */
-	val = xudc_readl(xudc, SSPX_CORE_CNT30);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
 	val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
 	val |= SSPX_CORE_CNT30_LMPITP_TIMER(0x978);
-	xudc_writel(xudc, val, SSPX_CORE_CNT30);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
 
 	if (xudc->soc->lpm_enable) {
 		/* Set L1 resume duration to 95 us. */
@@ -3442,10 +3443,10 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	 * Compliance suite appears to be violating polling LFPS tBurst max
 	 * of 1.4us.  Send 1.45us instead.
 	 */
-	val = xudc_readl(xudc, SSPX_CORE_CNT32);
+	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
 	val &= ~(SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK);
 	val |= SSPX_CORE_CNT32_POLL_TBURST_MAX(0xb0);
-	xudc_writel(xudc, val, SSPX_CORE_CNT32);
+	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
 
 	/* Direct HS/FS port instance to RxDetect. */
 	val = xudc_readl(xudc, CFG_DEV_FE);
@@ -3645,6 +3646,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.clock_names = tegra210_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra210_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = false,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3660,6 +3662,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3675,6 +3678,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3690,6 +3694,7 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3704,6 +3709,7 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.clock_names = tegra186_xudc_clock_names,
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 3,
+	.sspx_offset = 0x600,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,

-- 
2.43.0

