Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927B39B960;
	Mon, 31 Aug 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202762; cv=fail; b=RZMccNNx7QoXanOuxsNf7lH9OBejiG+9dvA4m8/yDqALt8u2OPdoO3V3RRQBYI61rqGpmCOrh5/UqszKz0EeCqiEVwlUJK+GEFvN2jAHb/z7iixCcoZ8VSa620MrKFj1Xa18QL5LcN4jATd+0XHAqerHfuq8CzVdxx8aSkUN0XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202762; c=relaxed/simple;
	bh=nBu0stHEU8e4cn5QMLD3UNdBvFrNgrYU+kf2C/OCZDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9LXPf5QTF5YnXt1tGFr7EaeN0ZNzb7y/BvnlmEtB5aKieuY5OnfBovT/0+abVE0Xz3AGV1IwX0Gj1ZaFl8T0a8ENuyMQgLFCqTsCFHSImPOYirXygWxnRA5tTa8PENELbc+woCMklEVzwAqt5Zq5OKtHengQG3LdyOwaf2S9MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BgNi8ikd; arc=fail smtp.client-ip=52.101.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BgNi8ikd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kb1XPNVKG1bDg8v3zGYenJI7LXBFpy7pRlKmN62vkIdXrwsKnpiDtrpGU9xG77yOxgieZHXdh20WP8d7aZX0LN+lZmNCiVJ3bWTu81MBJnjvsUn3tfvr5/ShJLeasQ0CL2HEPANMgMEP/X7ItV3g1fgQNbI+fGI8GL1E33U2iA3zWPkbG7IQcJw/F4u4jOOCF3Rs/8JsZfcQGAMdveOC2hfsLYgG3HqzjRyBgTVcv0rSGV1G2ogq1nXI0BB554h2N/NEVR/DZv/QB9xiGMsrfip7089XVZ8Qpm4wbXBiGBcfctVvIUQ/q9POMH+4ChGAkOO54SiSTCxCml2LyMqxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz37pc5KD1bvmDifemS1o2vP7084WxTtF/A076EsFOA=;
 b=p9SWnkNulgetEK6KsaI4vqZr7z1vj63iA7NSNSSe016dF0IatRBz23d5wVLGyUdyf732187o602dRA+tLMd3Rd1Yg4yRoKlAUWkq4XnxD/3Xi3Bo2tn7JyUoFaTXaHuqxz1MOnNNAO4QQRXb5HhlrKAik51yC9GQNMmphk9WUObfohScmabOY7xflF0vDGUuzjJUozLTzdWx+IXlY0ZafFPEJ2GifyvxmT9rmFsfmN2GWYh6GWZ48SGkbtFSdJHunqTOSZx4Le6zVy3pSmUxMhRAExyl1EEf+SMjr9CXDFvkkcCmTF26K6LAR8rgSm3GWNotba1KElyxVOkM2Gza9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz37pc5KD1bvmDifemS1o2vP7084WxTtF/A076EsFOA=;
 b=BgNi8ikd7PY3Gg9PSXZLVLfy9TEfctjmQCKYcD3ujOcK0FlxrzS4u1UA+Lw1VWgM6I0C2VZ0IdtPYqa4lgyQmPC/Jf5M5NNj3cOjAMkKEJNafP1oSw9q1iNzBJjfeHEphdh5NeWDT4JnUga/Yddu6J42QoYu0oa59TtUPYX1ib67E5hOScMKf528IgWPHhhH+7458sU2voj0AC4Q84v9fP1Cun0OwnldEvtqQORA2RV0Cc052OwDZ0JcpQdx2eWGR+SDwJmKjSednpAJRNfFDefWxoFqjf37F2PIF6DWXGpakQxCwbp6/Uci1VJJ45sNZx+Kp9379VMGzdKEME66mw==
Received: from SN7PR04CA0107.namprd04.prod.outlook.com (2603:10b6:806:122::22)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Mon, 31 Aug
 2026 18:59:15 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::a0) by SN7PR04CA0107.outlook.office365.com
 (2603:10b6:806:122::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:45 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:45 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:58:42 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 1/8] dt-bindings: phy: tegra-xusb: Add support for Tegra264
Date: Tue, 1 Sep 2026 02:58:28 +0800
Message-ID: <20260831185835.3732707-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831185835.3732707-1-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e5ea05-f3d7-45b3-66bd-08df0791f40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/3HaR3A0rNiIyKS47r8RWtNf7XscSlBcJHvFdtAuyTkS+6Pi4pHFfbEeDJAQjHNdEHIIE9HDy2gqQDzCllAGaG4y9Sq4X8MOooEemPoSeNo+P3PV5gFN2IFGNbGlXFaljiw6lCkpyKkZTC1s3tDcGUdnp6HuXjdDhhcQoOfVCsD946Zxbu9wwwfhBJc40jzIle0ZB+eMB1FbfptdrsvUexIgnYUf3dBa1PsHH4AYFuxdyRkG6TeBGNeoMieq+83g6IsJVLgBcDnjMbyRveVtIqYV26BN7dd2TguR0VWCzegziC4sFDG4uO5MJoQW1DCkjKD3RufJ9DGF41LJQ1zsKP4iu6FB+7dUMxEqQVUjvq2hGiVZPN35lBZ1uulFX8VwsPX6Li4hI2UJp23Z+6Zxj4yaIe32v7J88Qedi893orPWW5b9hMSlM5JYvPtBdvNIpoy9HROGOVDwihTEV6lHWolOHJNhb9fEabicoiNuKCj+eyEY23VuKFbsBL5EOOzh+yGm7wGnMRWhOE2dkGYXV6cfiQnzcOJ/QQKCLG4sF7jogRBycZkql2DwfW71Cngey6+Cg5u4wR8cQzKphq9E4GcnzZtW6LjIEC2w1rPs/COdb088IjVm4Yun7AwNbn8UEfb1SCkDL/v1Js7/fjCZJCMyvras/XZaXcRx/J78iuqqMQcfNOb+nLaX4vGCS/FKNu9C6dzZOZIEKIqExJ2FDg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	okxz5M7vgEr3Jg8s7LlLY1ebolr2MQapNeLVjeyDTzw538/UNyXt5Uk/bqokBY305slZfbcqaCLxTkHxnRVa2WETZVewW9xWO+coyHdAfotWyPezvz5bcw4/WRCy7Zs2ea117yroD4mwdy/skza4hjmqXOcis+8TKH7+KSNzKieRPQVbFEw+EHZ5pwucaZee9kb3k2ih8zFhKY40irF4DDC4tojR11CPbYBSYx5FoVUVITJbvsDcRNic36OJuDJZ93xp/Yl+RJL2KkMIyoQo5Y3H3qUnZPL+RF8CGb9JUJpQwcaqRU7Lk01dX7wz6c9OJ1PpXPnSoWD9RPmO0mTip3gzQZrhHEk6iU2pG57OoZAOBtSK2idpgVOCJ6HLAOMs1WTRtbeWYQfTDG5Vf89wNyaOG00Ny2QvdvJj0Smam/GqIjFnDNnSziX4oYea3zHZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:15.4710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e5ea05-f3d7-45b3-66bd-08df0791f40d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818

Add the compatible string for the Tegra264 XUSB PHY.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: No change
 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index d8de900a4fce..f6fe3c90b5b0 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -45,6 +45,7 @@ properties:
     enum:
       - nvidia,tegra194-xusb-padctl
       - nvidia,tegra234-xusb-padctl
+      - nvidia,tegra264-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

