Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3699F3FA5C7;
	Mon, 29 Jun 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725693; cv=fail; b=nQyZuVXp9k2qIf0o3/DRgUla35t/KjPsF1RqDjgYfPqMyFTfUH6kvp/X0Onf7magadBVY2H+qjasVf2xWqDIXEg4ZnYBW3DSjQKy6jXbGDJXy2n5zmnJ17UE/NBK6b5AcV93UR9pnEXzg6c3G6U5axThF2+u6wfzjMRX0SGYrhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725693; c=relaxed/simple;
	bh=8D2QxXpxsYIvaKHJ+Ib/OO8ZSu4xi/7u7CaNjdGEgms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSygtkmJCyWLuv6wASQTEm8xaso/6xbURTHImjpRIFHBaI7Het8bonhLF0JdhBsVTIK7g6ExmB1XuZVLLjvIp2edeCuugc+OiOD1XSLfWlwC72rfqVycHuF4TRZWB24ZJNIpLguqamj4kSo2FNTC0fZO/Be+3pN7euh5brS8aHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=paR3U+yS; arc=fail smtp.client-ip=52.101.53.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="paR3U+yS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzGsdDJ2xtSu80t8+UsVvxHKI9AloEArYrsnasmNeM/bFMt2tYt3Ajih7B9VSrY0Ke/6uzBz5gu6IYXHUol10X9L72f1clQyP6dJ4599igPdNlgGL2sphghAjDj+jzeD7BIM/Fr8ZjLeXqWz/5grCrlsAw415HAyxCCzBL5UJ6Bj0JrxGNK0FWlE/kqo4aRMVjkBCldG/cu5Qog9TYU13TIQK4sAFnMbltSu/W6fHEEz1dV6vHp/gzRU3/l4jcrl0hoTpl2GTI+MoL+ZOllYZ2S1KT4HUH7tntsSDVJauzX6sSy3lgxhxObr0kuN/KdM4iI471VJwdy8pwrLKrVylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W18+wqjLwRpBsSqR7tLr4jwt1B5he6Vn+LT7+I64JrI=;
 b=a0fKjM/EyAe1p/jyw+7pWVvL80eYmTGW4/h53jR3M1iCShnotghOnm4B0XnmdEv4T96A/heZtGlhxtRYALMY97xxT1kHXwYer2aWc+Z6LnLI5aCqhEpiuK9gbZf9iit2DrzEvbRKbC6vet1kdoPq8n1+DtnJgNea+iPypUbWDiYoD3FMMyTslMzjvJc8HVxTnX/3/SHEuMQ7a9qu4EedfxxhrnjMmpdSMB8oTLf/nQHQLE7FK5p5rXwx750X7LXPGfHJ10qoizVnwt9gUa2zsnn49Jv6tr7YoJMt7SA21Yu9Rmfo8kvV8dE3aHvqRXFh131vJVUQ8KDLYWGu9COINA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W18+wqjLwRpBsSqR7tLr4jwt1B5he6Vn+LT7+I64JrI=;
 b=paR3U+yS658/Jy2S4B/e771AMqesCA4nR6/n1jx5v03Tr4jRTys/3BDdmVLE8vQ5yBatAXXUoVxGz6M7D/p6HmiqSqMKeUh6S83p+0lOJ9lAEJXIO6Sc/hS5PCr4p8dOqCTPXpXDorFGgSESfMRoxfRDDhAyRXSOpYG/ZoRvfC4esB70ZcxtOUKnavrF17CpCS0RPfs5DDjOwQDltY0ltDf4xprUn0AUzUmJwNMSHMXLGLc32Qfl/Nzm5AFiDPJX9icmm89tKwqpiMSE7WC8WWpw0NnbrlQVhjK2EqxquARl6WsISTXZNiSKHk+Bx6oeAAFmIXFAUIxqYuYQPDOtjQ==
Received: from IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::16)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:34:47 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:558:cafe::1e) by IA4P220CA0007.outlook.office365.com
 (2603:10b6:208:558::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:34:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 29 Jun
 2026 02:34:37 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:37 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:34 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>, Sing-Han Chen
	<singhanc@nvidia.com>
Subject: [PATCH 4/8] phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking clock
Date: Mon, 29 Jun 2026 17:34:02 +0800
Message-ID: <20260629093406.1118594-5-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260629093406.1118594-1-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0c1a78-5b7f-497c-7fb3-08ded5c1a941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ToCQxJktkV59/dpcZKmak+caWU5SACC6jV5SLzdhnLYp+gl59y5WASY8wGmOSVScwTiv+u+X6yui9IKcoe0J1sGnmRqdgX7zn/MgGQeGI78Bm3PPIhYaYkUYRNTrKlXBlQZMhOULQEH3kbeFlPtmr1O18+++/DbTcWLDULPznGYKT1a7jOWnmDkRvJmb2UcG927wdrVfhF6NtyeYx8JIMpIe54NSrAP4sX2vuzlZLbsb3ZtoULtERkXMtRuZWAkNOYZBhL3SzQQvZCtPHE5XTMXeqvp9KvSymzSsOLtyXXL0sJSufdU7qmuKc5m2hgq7ugFyXE+S5+zCFSpEQVhbH5MFNPHuq9NIWB7152vbvCwcB3OQIM+tPbQi/H2MRJLQSITNjNGTH0ZJ57h4TaqLCpAcZJGQKB712Z3NJZnhpgTCkWyIPhfwnV0lDLxzF5Qj11NOmY68vI/eci59GJUMtesBlk2ePIc2LzVKQyIbZmbV5bXAwM7FJDSpnRZD7TrkLbT/84A4gVVih2GhJn9VJLYTW4rWHneUk++1GFamoGDTKWKfCtvh220W+f2EmDY+EKrukFuy7vjtMrrKLlPLGqPtxt2omc/UHwWsZ4sReMQ/DRKE9OICDHFFJh5fOvMbefL5gpClV57nzbx/z604sHGitLqOwpVwB2KVm3t10VmGJMQoK8x+okOy+kUYqTerso6HVaRWX7JFo91DA/VHnQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YsVXm53fLQF+8jecyL6dAqTL3digi6nQrfxoQN5oYq9sRHhDwkuAI+WhsCv7wI7CYKtI8x4y8YZT/8YtrFbdQtJIep3iAdu50aSoauMJKJAcwzLH48s7Aj3iwVISWQtWsdqKGW4SeqpZBtrfL3PayzPz/tMjwXOPRdcQyo/q7owAH06H7Ya5LDQBfOaWbjMlP/SXJepPQBNXrE2lTQeaSbxewAEF1ZRaT2fxJhEHHQ6tBej0qKXrGjoTp7JRHgpEg5KmJQO/6ptS/l5QP9fuyTLvBOsSpSOmcQ37SO2woleenVRhripsTnFWSGx9z4qlovJLaT9pG1jym/tTp/c9KkSPmMuKauukqKHjCcL+qnv/LknjBMg7QipcjhazObbhieIlKTEomz/mxKLEGHATvVkD4iYGlH8eVIdO8IAIY56DPoUxon2hC5upnl6fFGD/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:34:47.6397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0c1a78-5b7f-497c-7fb3-08ded5c1a941
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979

From: Sing-Han Chen <singhanc@nvidia.com>

The USB2 PAD tracking clock is an optional clock so use
devm_clk_get_optional() so a missing clock in devicetree is
represented as NULL and probe can continue. clk_prepare_enable()
and clk_disable_unprepare() already treat a NULL clock as a no-op.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 60156aea2707..800be0cbb3f9 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1045,7 +1045,7 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *padctl,
 		goto out;
 	}
 
-	priv->usb2_trk_clk = devm_clk_get(&pad->dev, "trk");
+	priv->usb2_trk_clk = devm_clk_get_optional(&pad->dev, "trk");
 	if (IS_ERR(priv->usb2_trk_clk)) {
 		err = PTR_ERR(priv->usb2_trk_clk);
 		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);
-- 
2.25.1

