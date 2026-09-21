Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260149158F;
	Mon, 21 Sep 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993198; cv=fail; b=j7lQlfQ8qkpU8fLOGVUEFkOhUR/3zvnJa3V3y471gveE7jpL5ieo93YOMqt9upuFgOTGPjMUzgZ4P6Ssjf6zxJLoqrwOsK0F2ZXVdevTDcCrUCng1ceTDtNxq2Gug/Y1a113/VUhDQYzgJoD7eVMxE/Ud44KqxF2sx36HN7Jinc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993198; c=relaxed/simple;
	bh=2ta5ZdNUmWAJhz6sp1w0Q8CD5VEKyn4B6M2cIcxCSbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DwkCR9Egx6N8sCHybtusF6MQnPleHoe3CcBBvNzX0BPedEbQSyAvWXn4c+AJGtVf9Mffax7jA2BFSTZg9IpM0eFum6/qnC1ybCTvv1FgXNy/RlP2vxMETTjEdkOjcBEliR1PyQGrZLuiHaqns1htWiDLPal4F/9j1/7AKCLA5zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T4JUhL6s; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T4JUhL6s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq9OHppiL+2v9nNN9kGkFb3aXDGthVkqIR/9XKX1jV6J5/PNdrpS+9P0CPom9/aVflyTH9mnPEWlEdVr/wwizvgJyx2Ob+msxXKwxvFs3/lAvLE/RZOoVO1Sv0UXAJZ5iig5snx6oUrf0bm9gOKT9eJpsVIpjvCkrSJTVi1G6rSJEEr8ggdmNjml3U9lxHXB6ghtKC7bxOl8AVoIlhEkvfAALu/iQFlIqerR4jN/R8C0CGaz5RXPRcv83mrYMwIC/0bi2o+W1aiArNgVQ6KcO/9fYR4ufYESxktYoe38Ew5deA2Lzm+/BrqCz3z37VVBuzZcApTJ2BZaB8udtfxu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFAeW20J4mePOjvIdRZdQJ9StvicCJci+QQ+YSFM5Sk=;
 b=ShOUSUdgQxooGQaUf/DgqbmkJEjDqemClxIRetoJlKHtEn2rdbtnvHXPtkU8y2UaEsK9ru+VFltjklfM5tjjhp+9q8skuUBMm5jGJkXjc+QhucWzTEm8kCcJV4ZN6zW2RYs5Wx/lODyjxiZl8zZLlBy0tO3cm90RiEpJY6WT3NHqCKqLUESpvF1+5LlYrcq8+lo4RTm7j3BaDg0QlPmCJgbsR7e0BGgRDA/pF/nsLmeLHH3YbuEiDmGevtyHkDsOMh1z2BvfAIpE/LEv6EcPCtjmKVWlITy9iIqNsq1xagadY0TdcXyUCyyko6CSs9rX60cvba30hVJsiZpK16IAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFAeW20J4mePOjvIdRZdQJ9StvicCJci+QQ+YSFM5Sk=;
 b=T4JUhL6sZUaQayiKwvM4QJ/+QQqtDMnbk0JGIxmieFJk9kqgaBOmQOX/u6XP8p1vvXjn+I4xiUBr1vvc6QAJxJR9mzDZZIE9x8yaijaQ4N180rV0Uk58mxPBDr5l++K1gg64CvchHTAaNl6vDElStEevgcLMSzDrrPK8aoVBsagqqn5p/7/DeySFREaJr4HkiiVdpXqfJ+fmkFZzoDJSMh0vJSRwfQ+NooGSNi0utfrZBm41q/ZbseT/WfsRQdSNzHuqto7r0kVI8rSTRXNOXEmhRFzIm4UlMW9N+8+WEWUl90juTLeCAo3kFzIEL307is3JgX/HETdzLWlYSgj4Zw==
Received: from BN0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:ea::8)
 by DSVPR12MB999171.namprd12.prod.outlook.com (2603:10b6:8:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:52 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::2b) by BN0PR04CA0063.outlook.office365.com
 (2603:10b6:408:ea::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:34 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:31 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:06 +0100
Subject: [PATCH 6/9] usb: gadget: tegra-xudc: Add support for Tegra238
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-6-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|DSVPR12MB999171:EE_
X-MS-Office365-Filtering-Correlation-Id: 834c4c91-a2f6-46ac-7ed9-08df17daa3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	23k2uY4jk9BRvn/bxBeb1OOzOcMh+Xaq37POXdt5UqSOFfhV3r7IQpNn0jx48d04rMS/MTKMabRQUz7ZHNBue5LIGGsynnfLq/b+QzQOgZhx99Pi2lsAzPwXYtt5k66i+eGJNhF0+05N1BY2oB07FrVzzzsK/SGsvcY9tVzJUbMJ8axNioYIRM923Qrw/DsRGJhBLjZLFz6/ir6TV+jY2pHnbCTnqy9uQED1rSY/sQebjBVbdQHqL+KN63TwORldMdoQpFkGR4yW76jarf4+o0ve0Hc3J4Dj9U6qXZbCecAA19VWuzgB/9AaJxWnr/Z0sWqiR0IaEn43CKYqe80+WHeIuFMwh0ZDZRc4r4IhubEOGFPhPaYjsSurAyve15lbmmJKe/XwURzN5s/vvu7MQk1DnrL9Kr8NIWdy5pFlrfSZqjcLD42WuFIPQrJ0mif41jTt9gnMdMBJhz1OCXvZ7LjQ+MWK2FrQrOJD2nQuXPAvmTIo7A4h6IB6dWrp66jCMHCZ8ONXWs05zPs+3XBXBLBW4ILNOk6cA3bQnqJJiO5tkf5PBnurt9iDTOV2+TtrIYINjUH/TaFoy0EuCPlB8qgciccJ5kIs5uyX4jdgFw3P8qvF0T8c23bekpkn2eC3BNmhhrLldKZFsQXdc5eTuqJdFjQPzlos0IK48mwbA+2kHLRidDwmpdx4H9TmfJ3yU9Tnd8IsuwzScnEcVvQLNQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gqAI7A3t/ISKWt92zOivn1rbYCNmgnE2VvAbixlNFgrLAsrh9zFUxtTnQk75LOXpKxhGKswMAUX7ao1fz7p/PPW6+f27wyknmKQDHqbAzwIMw9u1ALcPTiqRcJ1uslxs/B3jk/bsFZ1qqQVDJUphmRsm+6vrgLdzVULdYqxIdMZRs7OFVlGwSWQGethrwBtWV3H7OhF143YJocdZcBLagMTULbVsXgaU8/xwC/cj4ukIisExziy3Qv+fL8uMY1+iyPZgRcibrnIGuVg04dBLwSCRwy1EVOd/7RmEp6HB563eRQiVJ+WX0HgEYsM1buRT+f5C2T66kT47Qx4UKK2mb4/0KH6n3e37nZkSn1QggV/YJc9iNRgIo2leRxLtkXDhs7mSSw+P5C/hMpGBoKFh/+3wAq4yY+4m70X1t9YRtsO3sbtNbcH9a6INjwpnrWl6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:52.4023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 834c4c91-a2f6-46ac-7ed9-08df17daa3a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999171

Add XUDC support for the Tegra238 SoC which is similar to Tegra234 XUDC
but only supports 3 PHYs compared to the 4 PHYs on the Tegra234.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 02002221c1f2..0b88c1610f27 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3692,6 +3692,19 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra238_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 3,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3709,6 +3722,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra234-xudc",
 		.data = &tegra234_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra238-xudc",
+		.data = &tegra238_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);

-- 
2.43.0

