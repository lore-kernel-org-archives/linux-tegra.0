Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842679;
	b=eXHyJTtb11gbaiuJqrjphAcL/XoWhS6YRad6Z6Kr/49HEWNrG0HcAZLGgyUwpn6jFHUO
	 XZPc8RRDi6dqujGB9wn9lhFc+AqcrtnXOueHWne83m7Cr5Vk/92BDc1Pek2HViIZ7MD30
	 HL2ZwlZ0Vh4NPL1RvG3jiPtR36+kBvSut3V4VFRyNI4ohupczWFnqbZF98KKIMsfC2ggM
	 d6UG/hDbEccWZm0a6o6HfTYLOIDxMS8DtXAquS28joFSd7sZM1HJk52VyrosZbGPOXRMG
	 VUH5X29CwAOLYc0rqA545eVDoBHeeEqXkR4FG3iMAY1arp7Gfs/0E0nYoJMfcWovatA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842679;
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
	bh=rpNeN9IbKJ1HJmbgrpLkqSDxv2pdhN7OY9BUVAxfJwI=;
	b=ZDRQY1BOK0lQdRSLbvNlibuHoxivfxUQE4B7iBOURcdkY7LWPM9BqARkBOc++ZqCspRA
	 BG1s2gukD9zFYyxOV8YzKkVsunHBmW2sUXnwtVb6ioo2O360Zaqu4d2HpHpxg3SOoXERZ
	 T1MMio65Krpeh4HCrnGbja6YFl9n3CAO7AHuHl1AxQx3zg5lzwMFPGQh0cXrLMx/vBfCl
	 DFr1STZ7rkVhZcw8oGemARl5p7hSOpZxwYKA6pJgiMPlofzL30YGmrCzm90nuiq6BjYS4
	 ftLQFqEMTKj0FMvCfRat5h6kUlYah6gzVBJKz+m+V4OKS1Xs5DKXs2AEA8AuVe3kI1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=urLOcjZe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.25
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D9606A332;
	Mon, 16 Nov 2026 15:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=urLOcjZe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8CHALVZkHfQu9cLnnL44yE+Qrq9y6whMwx7YzNCX+ooT4jgwfKS7BWnfy4ER90KN01NoOORvkhlg9ZwshMuOUHXFI/BQkzTZ03Geh0nsSSks/El+ydewPb/35Sh2AN0po7muVtJb4dBwNuH9utjCgm8xmGRytf1mpuT5qNdzJ/A4F9LRKPM0Tjox9a/8Pr5/LgtrrR8GQ/S9zBOslv1Vqd4rwaVyaliF22V125Fy8Qoiweu9vqjWPj2cWeyokzkKT1McdsPjf5b96xKeF3QofQmmWAbwHuqu+HxmSyCDiv0sOq0K0dvQEOgH5qocebeY7Jjwr/wAfP9GHqOm0BUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpNeN9IbKJ1HJmbgrpLkqSDxv2pdhN7OY9BUVAxfJwI=;
 b=DoXQDs5/xL2ko9AFylm2zDyxAm/JNqZ/6aYGGA/jWskAjBRVZiDVk1vZdIMP7PBFgrffClPEgag+5b//icQgA4lE6UcoYg9V4PlhSXlnZchIf3URt1Yn69uUL6OmvipYyKfYeIFyRfcaQdB5e9a7c2ZPt98GLFG1QPk02RFoy3ifFcJs5XOhaPR3aUbAIpvxiQTfZZI0gX/g6tRUp+zzoS9KyHKNINXITtFzKwgCrPKaS/sT3tE4U49FIyxuiWP4ESiK7TQQBHCsmNoc1nd6Er3ca+6J1BsmeHOJUd/AcYe7dyFOWmoetS501ecs+G3KHnZzT4lDn7NFNnYmSFyhUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpNeN9IbKJ1HJmbgrpLkqSDxv2pdhN7OY9BUVAxfJwI=;
 b=urLOcjZeGREyucLa/uSeQef2+O6zVj+n+YLtXZfH1TsTa+NRtYvtITXv5pbFv4j4fGwguMugHMYQ9YQ+YILw1xBz5QeYM8EoIcpF3Va928cDKKvgvB4Miu2jHquehhJM/4405HJthpjtOobQ5mnmYn4O/8qTlpHUTCvjFpljSnT+x0WGDuySXRNEQFosjIDPNS3X0tnkoTuvr43vXavnkPElLNwPHKZCCrEFhYiaYwlXsqq3AiB+6YPtsEK2tyY3cKGelZHdoImke9roswX5tw9F4vmtrudGLU5TjNL1My1GOmpNiLCQE9ngxh8awGUiRXecqhOLaYzrs18CfWs/rw==
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:35 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::5a) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 15:24:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 15:24:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:10 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:06 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:23:58 +0000
Subject: [PATCH v2 01/12] dt-bindings: usb: tegra234-xusb: Add required
 properties
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
Message-ID: <20261116-tegra-usb-v2-1-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|MN2PR12MB4391:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cfb2c2-362f-4c28-5c95-08df43f5b852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|23010399003|18002099003|22082099003|261009223027099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	bIK7Y6wL7uBYeQrT35EfXw8/a/X5AdA5aC9jP/BF2ao1wSmB9fWqaBRQKeercPbaT5dxanMFJWgT2IjC8Sxe4n0YgBU4GmDemaeU/BHH9P4oE9tHHLS5YWF6fMWg/KGMmGtgmrRWvbKoqCboDuaWmBEado9vNPWwkMMv4jSNv5OHmBSnXvSziP7uP5c8pHFWyTccia3dZqK3xNrr6PUEwFhwgu9Rx7iQQ4EfbwUc4+JxtJwqzs2BqliMrM1jbQlu90tPu9gqcN/aF17muo9p6P5WVQjegpUJGXv2jfC3clET1B8ObYJ3xRCU1tZfH+IGAM2XS+gpmEt9hoKL/cf8Ld2kO0YpUS5RXwuuDKs9dwQiVvdKUXac6H127suxI9XQj3vRcZWCYNZhhSi2sd+2NCTvHeSrCjX7hx4jyKRtHOrkhP24raPG1CHrSL1duy6zvsScelY0VZNiy3athiRyy1zRGeKAgIz5zFvIi1yNViMWoRZ9Oujp1nwSvmT6erAyGgosz6wjiSi+jNE5IBBf9YmchOWXk9WQKykP7zuJoCI6j8ML7liIUwsyANUBhqTuriIdwAq9iNkSAkL1umGOC+x61IreLcSRVg0I+cJuZZREMt4vdXRe43ZkzwBv8+revWH1aPTv/Rg9HEZfPAFiUuAZhjQnUSaMFZ5dLmOJVahXbzSTI6+eDUccbubk6LV6Ns/2O5vsjgtk1LaTDXKIGw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mPVl+878/5rzvXku4Ghh7zDc8DnRD6UWGYF1XWGf95T5UNoMBE1eiSnJFVLjvX6VdVa0nkfXP87bWiwnp+gPQzpu64ro2mpm0vJltNqE1inqUvW8Q4QRpfCCRS5GgUkA2rAarO5ZDljt1CauWDcFlMAKZaPv7GP11KsUMaRt6RrpF+LKnRm1yuE7C5YmpcoF9fUM1WgHp3kZznuRk+0pWhJsGfm6azY++AVIaaOAuygvF/xmca2QE4GjXWwnwOKI1P4TF3bbAUzBkfOgU+oEhKBWRaLWB1F1xUOuSQH75W30zHSOWVw2FIiE4cWSRYS/Jnq+Ey/EZyspnvqOMPpdpGck62PsLQzuVlrNP6Zpm4oRznGKL13NXUsC7+tYxdIsGCmkCIEsj2CM+7lRZpAvxoQFiMslBI8ALHq0b5y4Wv/6kakSiIOr4LjiFrpEnDY3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:34.8108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cfb2c2-362f-4c28-5c95-08df43f5b852
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391

The Tegra234 XUSB binding does not specify any required properties, so
nodes missing the resources needed by the controller can pass validation.

Add a required list for the registers, interrupts, clocks, pad
controller, PHYs and power domains described by the Tegra234 device
tree.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra234-xusb.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
index 3f56110be915..4e4d7fc352f1 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -152,6 +152,19 @@ properties:
 
   dma-coherent: true
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - nvidia,xusb-padctl
+  - phys
+  - phy-names
+  - power-domains
+  - power-domain-names
+
 allOf:
   - $ref: usb-xhci.yaml
 

-- 
2.43.0

