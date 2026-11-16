Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842828;
	b=hf0vjgBEcmoE5z+jlW36EHxEjNo+nUa1Sf/p73VSdkamnWClJOc3SKpNLiGh3/aFY9y8
	 qEOZRDZdgO8Nyo5/5tQPqAOgaa/JlwKCuDTIUj+j+ex4RAtFknm+r38jlxMGwIgtdd4EN
	 TozZECKjw0njsvE9kTBe2H054rHzh9ZDSIKDPT9q+xqGR832DgEaiZf1LMw730ro+1QmP
	 kiiLBscPCEzBljwyuDajVk/Uf/4Mx2lyEbhHgr8Lgg1Ow33Z5H+L7YTGRbtW2zC9NuXSe
	 KXvqPUr6b6PyEN1a+qpHOl/fnZleYs+xEXV0T9ry0mc1yhSrAMywbWSP2kWjIs5Mdpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842828;
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
	bh=nqzBqzAjMWbfRIPmRaBHxV/NvVeRhY2m4aAM3eBwgZQ=;
	b=2CZMt5+Oa+6/rKEm1NV2ipF5pYnUgwTdQAYIPPC4TOaurRqyRDRYfHdU80Z6bUzK5Suq
	 cvWHUPxM/IVItWzRK2l6YIptJ4U3e49IUpO27j1zhsrcMmx+pmkrY9cVBepdAXLpcxlqC
	 4wpSpCfIDt6QQsFkbWJQ5v7yBAAMdvckPs0GUSCsWTpUPCbDT84IKIPMXGuTcirlALnu9
	 KOWpRIDLp7pofbq2d0/Mlwq7IYFUZ4Q71NWjrAxeJVvlT+B7olGKSnJ/gMApmCNMyFjbt
	 A0MqcXsr2cDdd4sGfdeo2Z2Wibnsh3SDFBFyFpZNNKjWX893srhfWUm3XmI21sIgwnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l6A72dDK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.2
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B6606A337;
	Mon, 16 Nov 2026 15:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110B6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l6A72dDK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMdDnvxllB7dzkAAYYikQzFsKlK6PN7AQhUFmgBAflASuUAMy6i8hT8th+yQSi1Y5/eBQtpmo0cV4WQdadJ1JRpmPiyJ+N7v+Ei+AkNnol3v1f+A+XhRvmxsOFf0NdS1KC30kWOLJ1EjuHz9edWhJzxjL9CHyUfcc+buzoB8rlM7yQwik+ysnk1NwmUdpPAxUpgbYjHluDJVtdA+JFx6jawbhn4AoV3LtTuqs3S28K3wiRXJpLoPWSfMa3NmbzfM2omFzcbCEpxPWiQ6g1cHuhPI1CXIhxqe9kvWo79FiHpCbRsqT01MtUWExJpSp3yL8JZIHgAG1mVN6yTWAXoZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqzBqzAjMWbfRIPmRaBHxV/NvVeRhY2m4aAM3eBwgZQ=;
 b=x04uhBm7WSqXN7DZbXRCYIWUJuJE16fytkuKhTBV7MUd/2t4VxTmGuAUQ9l3sckvUSWP6mxwvbhEVWAiGLK8aoBXEN2pgHRIUlw4qgOot5mr++eP34W35t4evUBfl04ENjF6pX+v53YKNy/JKc2qv3wEyUdwcVdAfPyjAmgTDcvWzbnl/goS5oA2ps8v6gjcKlZz/C1ebPj9IxXPvLhrfQKBnfQTT4KmTsBaPHc8oWG0PsSZOHzDxJ/aL8jcyZc8Hbo2PwmQCqLBumq82LBjFLGYDHcZGAxyF/7kYJNUZd03zvjKKTO2e6SudNQk9aw+mKQ51v//Ox3fbqjTuIEPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqzBqzAjMWbfRIPmRaBHxV/NvVeRhY2m4aAM3eBwgZQ=;
 b=l6A72dDKGxfx4GsGsfaIHohoHzGWlfDhF0imiVaN31raZJ1masdKC+wGc5O+Wc8XMWOy0KMTDNMQsAnRvu7Yjm8fZAbjDqXRNO74Tbr12Sl4TDX1OZrbTWNicf41wrgiN1y+CEXO0Pr8o8DuScAwfwc1yLBVYGlZyXHPCRn6L/Jl3tmKCtN+9It9pL0P5Sw3xPcCUd+R8XXrqP580iMTtHykHM1Oj+Zhvw7W7348G7xDZAxASa/02O6O+l+TbSgXRJjxgp4BYC4BbXJSmNB5wULnO7HVOW0IX2mWAQZtKqdT/ksH7GOsrRECELfoVtMb5GZ1i7J/WfJR7X2tdNGVVQ==
Received: from PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::31)
 by LV1PR12MB460855.namprd12.prod.outlook.com (2603:10b6:408:516::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:25:03 +0000
Received: from PH1PEPF00062F27.namprd02.prod.outlook.com
 (2603:10b6:510:338:cafe::53) by PH7P223CA0026.outlook.office365.com
 (2603:10b6:510:338::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:25:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F27.mail.protection.outlook.com (10.167.243.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:25:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:34 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:31 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:05 +0000
Subject: [PATCH v2 08/12] usb: gadget: tegra-xudc: Preserve runtime PM
 across system suspend
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
Message-ID: <20261116-tegra-usb-v2-8-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F27:EE_|LV1PR12MB460855:EE_
X-MS-Office365-Filtering-Correlation-Id: f48cc560-c670-4bd7-afc5-08df43f5c92a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9M7jjy3FASgEcOHJ20Y3Ml/uydBt7/uUc5s35qdIp/aSsvL8pb5yQ7CIQshOqYD7Dz9nmJS5pQNRIAWa/gftIp83Emb6E/hh0HGBsPwnSC8GOZr2+qFLPdzY0mDqsCeVLn2cReoDF6PSJiPelIyFBnoWeHMRvEESSzpUl+HaY0kjC0QJHOJJwghNU6wBVXV/fUiHCqThKrBvAYcLXRGDumcbI0cd8El52WLNvy48R98D+/DIPvp3yf+OhGA1luc3T5N5c4VaPg2AQ0V1R5UeEDo8UERoAs2IRTP8vEaX1PSdFii17zilD2FHHgtoCshzEysKsZqTDyMyKb+1vVu4RlrHnviBRCYZ3eQO9yX9rqGdEzZrqgTcxXwtO9G3JSgGSR0Suqea/7kcXq+39jwd0GHniQ5J0fJPT7jPc6o+DiZlWIN73gAm+W6C4RDYVQrM4sopQChPLr5RlO/8fm1hOhQrwb23Lify6YZmsTNytrVDjQ5jVs5uv9/WsIz4D+M+wnr+Gjj4jiYxmGBJtTs597WWi+dGe7OPowpROrpiRFuqcDsfy/FJjgwZM9d5xya8vBcTt72IsCvfVOFdLuUcT4/wAifrrd2EWvbn5+GzLjb9ArMUeRJqFuGOooKBov5u7CWodmSPRpM1667T2RnYCpTECMZenh3H+KjJ/WQR7GB+IYr/kOFT9dX6GcSXc0OeIg0739UE+5EEm60s0IK4aA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	38lkxr1k9rvUVnd2kd2iKIzPwtzn57ROQa657gORvfKbapLVFD7kfbgM7ZO6iw/knoWLC8KMQLpAr02DffjNiIjLj04P0LW4cY1EjwnxZBYwjvbG3M7AOv7vQo1xarrssy+vOcoepNqp93oLZ8qnJAr0vPgE+5fZg0x1rn9+/QJ0w/FFQXLAPoVUh9bfrEU/4M2DC9+1cS0ldohwYPUwWWvawfqlcaZoyNIYFy40Y0gjN4uJr03FRk/Jz6HOxXJg6mlTyedOo15DwqGvGrbL6/tlvm8Os4ZDfl/7XxQVn/vHoyOOqxQHhWDrbtj7wTu+GnK0YEvIw2+WJebPkXLMWs0+/4xiRFdXz6A0TbV6A9KUr0Ydo25rQ4dD+cpa+RvpSTJZw0ptLReuh3lYGAzK4wF8GC2QojY1QLFFzNdNyPbKcx0FIftK/psh0S5gbSBO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:25:03.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48cc560-c670-4bd7-afc5-08df43f5c92a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F27.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB460855

The system suspend callback leaves an already runtime-suspended
controller alone, but the system resume callback unconditionally
activates it. This enables clocks and regulators while runtime PM still
considers the device suspended. A subsequent runtime resume activates
the controller again, unbalancing the clock and regulator enable counts.

Only activate the controller during system resume if it is not runtime
suspended. Enable runtime PM before scheduling USB role work so that the
worker can resume the controller when entering device mode.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index b2af5107747c..43a1940ed88a 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -4039,9 +4039,13 @@ static int __maybe_unused tegra_xudc_resume(struct device *dev)
 	unsigned long flags;
 	int err;
 
-	err = tegra_xudc_unpowergate(xudc);
-	if (err < 0)
-		return err;
+	if (!pm_runtime_status_suspended(dev)) {
+		err = tegra_xudc_unpowergate(xudc);
+		if (err < 0)
+			return err;
+	}
+
+	pm_runtime_enable(dev);
 
 	spin_lock_irqsave(&xudc->lock, flags);
 	xudc->suspended = false;
@@ -4049,8 +4053,6 @@ static int __maybe_unused tegra_xudc_resume(struct device *dev)
 		schedule_work(&xudc->usb_role_sw_work);
 	spin_unlock_irqrestore(&xudc->lock, flags);
 
-	pm_runtime_enable(dev);
-
 	return 0;
 }
 

-- 
2.43.0

