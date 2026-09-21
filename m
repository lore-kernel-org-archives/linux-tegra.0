Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010006.outbound.protection.outlook.com [40.93.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A44908D8;
	Mon, 21 Sep 2026 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993189; cv=fail; b=K5PQUqkpwD7evzUK91XLkcBcIF2llELgir50bMhwX4/zWDbIUxriuHcn1Sujl2YzO03/H6HCLA0H5UaKZHriaQB0nt7CMvCYh2JPvk8/SerW1HLaZ6vl7Q74olZ0vUadP2SSnCTIkjuNInUKAq0JWQYYMLhg8xUAEbwnqNHmyDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993189; c=relaxed/simple;
	bh=Di4T30OXGGVayfJP/r3Nwv6ssXN7kcDmj5z2huLCxJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DI+qnwVPZumlHZJPH6e/HpBfboW/si/Gh9TSmFh3L9k8suMffOMIpUGOwppD3x9sErQYxXPP70IfM4i62HdtvlzALA02rIbmUN4HzQObwMxNiJ8zqt5jrBQ+UK1xrnfz1jyyys7kTaBECMLymluX1pUldjiybN0DkJSjZ88kVRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UwhL/FuW; arc=fail smtp.client-ip=40.93.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UwhL/FuW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpE/PcPDethqtVfhfSmYVnDc4Rw+Knii1sqh4LXoD/LS34sDMV63GFFUFZwwzam2RJRYMdqX0v07LdE5LwxEkOGVdlaGSgDymQp0KN+T0qAz737HxivYNQ9sewm3EMPWufkrmgaRN1iFOL29zuKPqoESMmBmxjhWKNxYlWBEitnkdUIwo4xGwbitYfCCfESqMsUUSae+lDrrgBVyDukLTuA0dBmSUW89AesCspZlOXQorXDL0I6ugPt1WaZ6uuVBzfwJsvIgb1X7GLnRIsL1mRdJG5t+xUNJzKDf2ZFgGv3tbPbc9f/8bBJWU5PqzJxElPODrX/GWFJKo30mdCw2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PRyrHC+pVk/Eu/MU6tA/Y43yCw4wtS2iDI5SjbsRPk=;
 b=ubyJtzhFp8EjriFI96feG4G+suMUVuEmPofPpvVNDB579KRhb80CQpCk5lKxEE5y5DIbfNgYkZsnrnp6KcH4XusqAVXjbUs1f0IduEPWENYXD+nwgqwaNm+YqZ9VDspPcgktY8riaYfUb2kLbkIGoew32MY6ZJEaa57V1w8OEjo4PFn1mxWZOZsTLpm2229BJjeA8bqdoohxD42oePRrKPba/HEryu5XY4aMKgodeihJRt97WrKNrLJf27880rIlTgKS3Xxh7BdlVLED/shYeCykQVLkMpa2YJrQcCMzIWqZJ1KvcGt4TN8eUIZmEPs5jqnzslfzTwroanodV2neyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PRyrHC+pVk/Eu/MU6tA/Y43yCw4wtS2iDI5SjbsRPk=;
 b=UwhL/FuW5t7HNW6CeCy7ITaSIeWe0mvSM4gfWAnmJSBqhLj/deKwkqhxuldb5FTK5msyoDQaZ9A3OeHJTAv41RhTjXkgNscwQBnCh61m69dDEtYzZdCPMyfiVz/DU8fRBCIrz+q16n1ecLoh+tcCIHas8l6XpwXSAxqzsYMOzlr5EZSxaYTLMpPqJc1YnqyzjtrGfbumiFoUSN++ezT5VmLehicVIKFycIQYwZvsBOIWiKepo959hTJMQRIFSOBWs9h8PqgGE5opXfK3p/b+A2SojvyWTO+jHZs9uZwamRLZl6oVVYdnGVZTwc8AwcgPpwyiQDivwZptNyQ+RvGMkw==
Received: from BN0PR08CA0022.namprd08.prod.outlook.com (2603:10b6:408:142::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:41 +0000
Received: from BN7PEPF000000A5.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::9) by BN0PR08CA0022.outlook.office365.com
 (2603:10b6:408:142::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:19:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000A5.mail.protection.outlook.com (10.167.245.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:24 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:20 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:03 +0100
Subject: [PATCH 3/9] dt-bindings: usb: tegra-xudc: Add Tegra264 XUDC
 support
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-3-74a925a35d82@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A5:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: b6298610-76f3-4457-9cc5-08df17da9d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/ZWQkeOv5b3gX0SBQ/dzto9fBC2FLDT4Dj+5aIG1tW2DNo0ig+GcYJRsXBqMu8ib/XA6OjkJnk2AueCEjCNE2wk4YBe6/4WuqRlcJ9egm2yZfA1oyGvGUZWusJzgqHh0qhav42hegbgt6NikxFgxtK/3NZRCeHGGjTu3Gq/a2YHqGdJ3g8bxdjnmJEEfRvH5C5sIqvOQQVWdK2mNmUkKX0LWOa2/pjIXfHpu1fxwuPKK9xpFJINaaoaURnLJAeO99AAMPfM7p69Sa0RgEVHOmtFoeE/2ItEOHfFeWMBW0NuG7t/6E51tkvUWuEMh+EOtud3Lw1fF2qrF6v3Ct+efggxg0nwjdTwmICoSkmmfSSI4zHr/r4W252RfNiZP0R3hDj7VPYRTuhc2/7D+lb/WI+5Dqg+2ywb2vrwsXWKo/uji226ybh8E6q/QSD5bjxMoJcpcBNh0VGD/Au6V8pdGu/lh1a2q//TnOL8TFhNgteLotR41zAuttK7sjUmclXHb5PmadXgifZ2gKzVM/JXA+b2bM7zdlSjN79unndErHyc4kI33T7b7QLT2YF8XiJOCmIqsk0lxwFvGi+vpqrDCuCeV8doh0IRjoU/WTtWjEm/0SMaph0dwLPlZc3QsXbI/ycX+kYO/aFEjFAsGHD8tN0coWIcFnaZAXxq5yvq58XaeMcpFBl2tt+8qgMPH+nUo2NxaKImNcNbOj5YZojHJcg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DNbblVlL+LaLn2v1jbbBkSRTMxG20k1jQYdlzRIlNDi6foWu84LYNQ8MrcypqQmh8dzCl7brJEM40Nh/T7buDsHzuI6EwXKyiZR1iQjgsaC9N4ezQQKEfa9giqaiovVAhs9NRguI+ArhsKRhD3BCrzGInBa0d2JUJBncLs1xel6TZ912oS3hjIuuteb5g0e9YYU+sT5xcSR6lIZCH19z8xCjOI5Iiis6WKwPGKy5L7Jnd29DTJ8BNXUdcXPF7xyGGcB5xRvAhulk11ujh30fxbAeaHSJ/zhRNnjGSNGUODrGJo0GxtnRmbiDvt3faacWbfj6Kw0H2eIo54VZCt/8+KJe32Vc9l20v3MS3XlApYZGkrYRZqFw8d0Dg+NZkfdbnyUCePQzQO5xTYMNUE34j/zMsiB3YZuBpaEBnXcoM1+zzoCM98ItVb9R5gvt3XGo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:41.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6298610-76f3-4457-9cc5-08df17da9d1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248

Add a compatible string for the Tegra264 XUDC device. The Tegra264 XUDC
is similar to that found on the Tegra234 device supporting 4 PHYs,
however, the register offsets for the Tegra264 device are different to
previous Tegra devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index a57ad8815d12..672b7ba0d89d 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -24,6 +24,7 @@ properties:
           - nvidia,tegra194-xudc # For Tegra194
           - nvidia,tegra234-xudc # For Tegra234
           - nvidia,tegra238-xudc # For Tegra238
+          - nvidia,tegra264-xudc # For Tegra264
 
   reg:
     minItems: 2
@@ -154,6 +155,7 @@ allOf:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
               - nvidia,tegra238-xudc
+              - nvidia,tegra264-xudc
     then:
       properties:
         reg:
@@ -173,6 +175,7 @@ allOf:
               - nvidia,tegra194-xudc
               - nvidia,tegra234-xudc
               - nvidia,tegra238-xudc
+              - nvidia,tegra264-xudc
     then:
       required:
         - dma-coherent

-- 
2.43.0

