Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842823;
	b=lrtFnZpFP/MLYHj8R7ikPYdyKFMv/SjnYdkDJL6T+eKCniC+FVXg5DeAFY8zwv2Kry63
	 NsCSypZ8jh5o8IYXi9sTSC63asjRvP4h/rq2VPYBl7fTqjR7gVuawOheV1QOkM+hAha5k
	 dG8wyLhAVriyJcCvhbUOZjz7KdA1b/p93p0xXn6ote5JOa4gJAkK4Yv6wK2qGyqRiqPUA
	 KVwNh6q3iI6xd7xjImOsXAk4TdqbMRhuRBRONzRNtCh4Jk1o1Nbi9zgbtWOrAbH1J78YG
	 J8g951cKRNpksV08Pd49nDm2MXSdobS55rX0/pExo7VJtY0Yov1MLNxtQEfqSn2fBCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842823;
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
	bh=I809MMvart5TaDqFr2I7oaCXZcX37iOWsMw5YkOj9WA=;
	b=PmwSe1r6XzDy7Pz79y3ngf4Xlkz+fU14kkk5sGSOn747ZdQQu6n6C+7T//WpDY6zGnZj
	 Jn3Y9lew4K4Np4nDPyzBH8EQfNwn57vzH5TQFFhhEBiWcqmT23QgT+TwBqYqq7ej46nyM
	 HV0arREcShumGEWaaLJ9DcQ05GwcvY5qf0KdyrjV2jDoCgF7Wt8Cs6UmdQcI1wjaDKRa9
	 4n0SGEqMBVZasXEDkR8BK8lPHFHJzrM7JY69bE1+Ex+3NUyleK029bfpSkGSmPhglamEU
	 r6qnhcWOIM8OuihDQtSzre0c18NlTJSQKwASPwYHJWIe0AaipF5OhJq0a49T7amAo8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MUC6zgKJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.56
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E035606A32A;
	Mon, 16 Nov 2026 15:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E035606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MUC6zgKJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsgSoi1gqHgtxerB+z815Hu1MzUYZc8aFu1vrM/HMAqbp7eyckOeNfFhQmbevswMzvSuM1ubDM3Z+iKNkb9EPESEK47cT7EF5OKjvv6dJ4FX41rzBKZ/itA0/JkU1R+Upz/QRhRzPZJjVcHOB2JEDevepjh4EAC8LhW92lGFKJAAucsrmkSK3/DG8ruynQB20uiaOeECJDQ+8EBK0SmCKeXuVasRYBEIqp6pGGUiStxUcaQNxBUFxRj8xV7h8ZhWWcEO94EHKd/t0gtx4Xb6SA6p9Qm8xU0W2zHVsvVoLKfe7i3B8x7v/oVnYOtSijOGYu+OriJFMjKnMFPz+ECe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I809MMvart5TaDqFr2I7oaCXZcX37iOWsMw5YkOj9WA=;
 b=U03NYQBgZ2dMarBl2fPnV3CXNHUWCv2I68ulBQasewRfkfsBiWmXCGeWcVYK3d5Y4j/rdHNYgLpeCo194Sxy5wOQkaskord5jzaCh2jD5UudrR9xmCiCBNGr5KayEKbPTykFtoS/AplHgL3n4xkYLxNmyhjQbcUwd+mzAoFkpJzadA38ioCI78N/XwECyr7P4Q7rcTwkXj3d0nF+qNzfG4ZQ4g241cNYe9+EkUixjYQ5Z2qS85ZASjoCNm/4z/IhCisC5zquw121w3Vtdntu+/D7fWsXIIywix/J8pao1peYhxGW6MQBnpHKA6nIlcUMKLp5nCDEMYQURuYGs/2k7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I809MMvart5TaDqFr2I7oaCXZcX37iOWsMw5YkOj9WA=;
 b=MUC6zgKJ7CU+EIQVSUf5FuHA74QDF83+jPMWyORv+/7ZtFuoS2vzseJGDScV2OXBF7WEXffawsJomyi/KqqvV2UYBQxSj3l5oIMKY2/oBhc2utU0AQyvHRilU18IbxbizGSRyBDtEq1UeKwgLEx4euqo5V7vkUvzlrWk5lGOXSmlKsOYhVbo4FyHBq4tYxoXwEJZSohV+Mad2a9KaBVsgyBnsos1WEYlwAyRC//4pGu0tBA6+VG5ivMJBWn54UnjnBKTjqwdBrPo41Yut3Qqbtpvter3i1GRZSCg/lTs0Rah1BQmGnQ/i6oTBRoGItatb2DAkQy3bsEf5Sg/SSK0dA==
Received: from MW4PR03CA0172.namprd03.prod.outlook.com (2603:10b6:303:8d::27)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:46 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::33) by MW4PR03CA0172.outlook.office365.com
 (2603:10b6:303:8d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:24:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:20 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:17 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:01 +0000
Subject: [PATCH v2 04/12] dt-bindings: usb: tegra-xudc: Add Tegra264 XUDC
 support
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
Message-ID: <20261116-tegra-usb-v2-4-42efc03a9700@nvidia.com>
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
	<jonathanh@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a48afe-a8f3-4472-11c8-08df43f5bec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	M9gETxV1LB4nslDrJWda6KaImDgA5wTGan8pKlhm5uc3urtyP0tOk3mX9yhDPUi4ntrFbJCzVSiaWdgm0MgisNo2z6Yi/QioDnrMH2DsBHOBApAQ38gRUpqiGIu8sLGd9s+lWJ8Ot+hjKZBfNvXJJBhyTEMoYWmvwWuFMlSqozalr2FCkCrYummWmWl1mFjUJjZwAQQtvm8RxlkUJ00ouGyNDhEkN93cUXvyzbam6ufscZDjiMP7sA9vcDJq8lB0aVVYvJPtdCV2SYCp6D8EuehZP3nWJIUBRsn+9IP9AGFhED9Lw4EZXX4bZF0JUBmV7QtvbjAdMdguRL8gSaRoIRZpzNPD6Vf1SSCcVSAOzCcvpGHDzrY6kncIcfgw9Z99PkTwXcNL12opk5LS1wnWhDUVLO55QqoSViJg/AuHhRUNUg0rybmAeVvdfR5aK1xDoM20oQEHdl26p11cFsUv+Iala4lVdtfnpp3EvO/KdyO3Jd6H76Lcv6hC9JPg0LeXjJ7xmbpVsDytwWMg/0pz790289VcLchO3SgLlixKMtrDfuVhsYldlwNfVZfBiHjnBEdeRimQsuG3vj+n/soLCuWFSNy6D2vKKUQH2S24yg7eByCOEYTb5MEIJuqyPBYc/jExXTe1wS68Q4lUkLpfX3mfyhWtoJiWlTC4saHOgRDTLNNRralAtLKDgTL8yYMX7IjnIVXqGJJHcKwFGic19w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E6NOolcxt0dXWIptmhAwgxh/puWb8K6Pf0cvmwG3mEPrqinwuoCUfbGuUV0LlPe0ULSHbpnkm6xWXf/C+PN/S/Z8Kn7GREiquxHdLvqJ36vBIh6W8IsTMeGnoMSenW1Cfw9gG3gEyVfh9sQYP+NexPPRn/Ol4ojFGVtY+1Vw0aE3GIQKzkCkGGiWFGRKSQ6qnGcI4Pz8setlbp9bciKlDzq2XcBDwFH+OGZD/+DvYSELlraCR2AvJ/5URYIzLIpmC0SGz1DJNyOT/LIa3x+n6ESRltOfIz0OcAHY4mj4s3VaP8bjj/+wRlvCE6j4AtjYzTCuRpT1mmao0sNGRQdHECegxVNHi2LSIhlG7KNrZVBwZoi/TBnwjYMwafnBWy7HvBPTJmFAOdAYtCEZXZXFX/i4CBwBUvP3WsSuRFWxrBY8LSO/kKSypkTvzKqTHvlz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:45.6096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a48afe-a8f3-4472-11c8-08df43f5bec4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001

Add a compatible string for the Tegra264 XUDC device. The Tegra264 XUDC
is similar to that found on the Tegra234 device supporting 4 PHYs,
however, the register offsets for the Tegra264 device are different to
previous Tegra devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index 99a6322eaceb..aca525c937d2 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -24,6 +24,7 @@ properties:
           - nvidia,tegra194-xudc # For Tegra194
           - nvidia,tegra234-xudc # For Tegra234
           - nvidia,tegra238-xudc # For Tegra238
+          - nvidia,tegra264-xudc # For Tegra264
 
   reg:
     minItems: 2
@@ -182,6 +183,7 @@ allOf:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
               - nvidia,tegra238-xudc
+              - nvidia,tegra264-xudc
     then:
       properties:
         reg:
@@ -201,6 +203,7 @@ allOf:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
               - nvidia,tegra238-xudc
+              - nvidia,tegra264-xudc
     then:
       required:
         - dma-coherent

-- 
2.43.0

