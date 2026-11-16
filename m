Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840718;
	b=xed2nxgGJWZk7gkuzRhbKkxPWoka/5K4ejqP6Q/CY7DpAriI3SKgyKoPCJLiTSVl6Skh
	 BFOeoLO4lfsGJrox1nlnaVDrC8jUamwhj6WMArKgXIRWClv5lG2V0eDugo11Uvyv4xJIz
	 vyrVKtoi0TOPDZlASa+1KxmT45Ja6M+8IafLr/rd8ry2oumSjfFVQKjTI0U0+m1laPhQ6
	 LyZecZig4JHgXdQyP2KwVUxIQfQb0UWOU6RVHQcHfRMC8OiBoAR1mPNv1SESS8oEtpsMS
	 ytZ3I4YO5SKWSh8fQSNnvibLNzI2APD/Oskei4VcP4DPqxfE1QPKKMU2dlRbxBfnIyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840718;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=KRrh5C+ZhWN5a4+Bqdlnx8pU3BCL5x2ITxz4paJSZ+w=;
	b=DuXektmM3itg+EpfBwa7q00901JO1tzKjxPdpJbfwBBd6XZr0dYOZUHXwGwWY5beDbsX
	 MMWIkOpHrp3fVydU5wsPaVKiP5l98Ku4CMqytXSGW/b2+YFvDrBkZmYObo0EHiIBoZ+0p
	 Crhj5Q7/pmlRz66vq0kayM8utQtQ5e9zMQKCfRT8y5MjlkKsTKOvenza0XyDEAUmt3+ev
	 1HAWVITwhhifICWbFa6/D8OInbzQ6nXOrqUCdZFpkL/9qjL4Ek8Q4HvMxeJBAmba9iReA
	 uEttcTNtL17+4nciDlm47srdXpGpSxhWqhTwWMM7FcmiwLt2n+rS+CaX/p0FDZkpULA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTJtP7Sj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.10
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74756606A323
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 14:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74756606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTJtP7Sj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJFkJWXlXPCJz24d1Xmy67iHevwekf1myKpleseRtg2K/LSZo5L3z1g3SqLUyk+Rmp9qQucOY+CxXOR20K5F7T5EE5bWzF1ZqQ3LUyAvXuIllUbFOr4EIkPqqJNnMZ6rAD0SyQvtAivP/VP3K3/4xTeYpKps35GuCGh/M10/I9Znb70NAZBSDBMXG4am0909Jkcjn9aHSBFWA/v1apeRlva3WQvD5QLzOezOAeykn0IHk+y2wAwMmlhBa1IxChlChjInAbpYCG5B40r+z7dz2H7odPuL/cx7abDtXBuDs5VDP+nVYX2n/hpHsy1mWX5ONhRCF5oAOB2zCEz23zrFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRrh5C+ZhWN5a4+Bqdlnx8pU3BCL5x2ITxz4paJSZ+w=;
 b=W4WCfztpnF9L8H41MTFLQtH1e06jnq087HmZTZUAX695mIvpAQuq8JL6k/Js9zxF6SeuBn6JqAJO5hh1mzyDMVYo4/JTT4EWJQSeW0xSEUcDDbB7tzACMwOeq+Tvhnz442XgZtQ558lywmKsxJfJmR0q0F9mq5NHHsgOHT6wH0MDQ6BjKNfPZEDXDMCgLanw+7FUjU5mJgieLdoft9X/2vxj65vLEzAz1tpsNo8AyfiWHYhhMQBfO1SUWst6a9eR+yshaCBxlAGvQbAUIA9p3dqiYL19qnSqQB7en79Cp7fqC5XQ2Whd3nlI+S+BzzFY3G5SzQT9IeBXb7hBVo36Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRrh5C+ZhWN5a4+Bqdlnx8pU3BCL5x2ITxz4paJSZ+w=;
 b=HTJtP7SjkDNv3EEV0U99nTOiHb1SaUE4I/VKFWisyR8+sea7Qzh8dVSYiICFMGH8FZYznMq+Yaw1t9QUTgMiF5ASJMddgzbJuREIqoVixrumV7wtY789cXnsGgSYFXP95yvYUBOJLinsh4To4gPN7CE+3ZY5Ouakrd/QsWMi0vAGxAcV123HaZVbbuLnyuux5eHSJaphmuntWymSEI76al2LzvRJyDStrwLdokTlZpYvTGk/tUGfgZpZDwIrtZJA/siuDThScJSh+/VzvKANsQjESbD4u7GHrcswrW4O+NAmYB5LrIr4KU2Ec1jUpz+rH4iLyAsz41u8zEhznR41NA==
Received: from PH0PR07CA0040.namprd07.prod.outlook.com (2603:10b6:510:e::15)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 14:51:52 +0000
Received: from SJ1PEPF000037A2.namprd04.prod.outlook.com
 (2603:10b6:510:e:cafe::75) by PH0PR07CA0040.outlook.office365.com
 (2603:10b6:510:e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 14:51:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000037A2.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:51:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:27 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 06:51:24 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/2] Update USB PHY fuse calibration for Tegra264
Date: Mon, 16 Nov 2026 14:51:14 +0000
Message-ID: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
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
X-B4-Tracking: v=1; b=H4sIAGIY+2oC/yXMwQ5AMBCE4VeRPWtiG2nEq4iD6mAdkBYh4t0Vt
 /kO818U4AWByuQij12CzFMEpwm1QzP1UOKiSWfaMLNRK3rfqGU4/6VNrrSFs4Vj5EVH8bh4dHJ
 80ar+HTY7ol3fEt33A3vS4jt2AAAA
X-Change-ID: 20261116-tegra-phy-tegra264-2bedb8d1e48f
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A2:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc9512a-aef2-4dba-2888-08df43f12609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8K25NhGELzuVy5paABFBcEHB56ylhR+0jKwk5nqkaiAP7mjgVhwJTvG3cHYh6nm8XV83HCUmAN3KFF4wt8RgpgfT7TqpPEXpXxHDk/DK1UpcXM+UXPgcD1QqCbxJQva72it+QXTvWx3e8hkW617izWdIniAhRNrInc+xQ/R/SBAUDQDUhYgtPX1R72PQudrTDDxyBETrXhF/DqznnoYnx77erNaygQyVAfeUxsMmZ8eVD/QovOYanQEo7lTIzNYkeu4ur4crBOJY3JqhJG52zvMQkXts+LPQPZab7c1+wIMm35NLRZzYa2s9s7+MyJsIS1+GmPTDiEaPTMDYMVi9IDzwDtaosa8SdT0f3OqiWZyL8pWg99yWSlnevx9yZeSjO3fnMUffibCRPax8F9upLKfyvDOlu4+1WF7QrcWcTdb9BpKBzMBTZhh0lMbF4gyxLOmDp2xbVzAENHJBXq1TnjXkZxaruqT/ow1tcoooGPbPtzPd4whsf2ES9d1KmSevd7Tv2UmB5utJ7Xa05sN+oB0bIip24j9668B1H0Lxd/1OAdj7eC8jivUnCBeMVzf7yvtzR1LkotF2mTIqrB800jm/BLCsMAO/ohbM8MGtuJKni5vl3jnLnuudldaQ/zM4nGLPliTcWtmTxwq6WWPGYLu1ZUNRyqka/U02iya09xX6iNFR4xQ6tFra2O2eIxAa6PrHVxZqjDJvWrpFlYLiPA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fRMI7xJnniwKsHe+btGU3m+tPzbokKRBqYx2zUetfLMwGo+h6Bh8nhVGLVY2xwT5errkxKkQi7mWrp+VGQVPhm5nppj49ObO0lqXnPj9wDWwpsc2tyojHEsjJTyis+13rSeuuPAsVJnGL4qOh97D8kE+zPSpVtsnttjMIfPB+xovzjWib0OF6P4q6p647DF1adHEg/1wEkzO58sT0GwGAkSj3/mfIV9dbUBoUFCkR0kzAf7xjOhDyXXl/qVvVxuW8nW/mat09S2l4UU//kMKpQm/nTAnv4t0my2fCmtpq1htGUVxkKLYtubX0+bmGRGf8LSZKIeZb9pVLRf3bKcI1jsD6RwHOQhez+iM/gpK6RH+quYC18UkeYyAuFaoQg5JuRtN1N1rt7vdRO98q02+YWTue3lVq+eFXdDcwyqHS9AMvLF1cu3l8sryihcXSGSO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:51:51.3904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc9512a-aef2-4dba-2888-08df43f12609
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160

This series adds additional fuse calibration for the USB PHY on
Tegra264. The first patch simply adds the definitions for the
additional fuse registers and the second patch updates the Tegra USB PHY
driver to use these registers. Given that the first patch is trivial and
there are multiple subsystems touched by this series, it is probably
simpler to merge both via the PHY subsystem with Thierry's ACK.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Wayne Chang (2):
      soc/tegra: fuse: Add USB fuse calibration registers for Tegra264
      phy: tegra: xusb-tegra186: Extend Tegra264 fuse calibration

 drivers/phy/tegra/xusb-tegra186.c | 57 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  1 +
 include/soc/tegra/fuse.h          |  2 ++
 3 files changed, 60 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-tegra-phy-tegra264-2bedb8d1e48f

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

