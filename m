Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201254;
	b=CWrC8n3/EEyL9F2lIJ5q7HxddkE7KnagqrsFj6tC1SK00jUPdYfXkgmrYiGC0IoX+3uk
	 srBMlz2heObsGqc5yox7UsXoBsFVpUb0qUi4aDWebcHcABrBYWc+V7uSazBliNE1Nh54q
	 mjiMutAN5ciyhdbgKMIGCnGc8ACwlBqz8G8+UJE5qsItd/6z93kq+2USIIF1c9rS65ky0
	 TypX/TwDTLhX45EArknz5BNHIKE/+jQe7dv0x31Eo7Cqjv7OG+fvYfgln/26dchUyZ2SC
	 drQvbvxFbsiTm12fjyR4SsKQ4YaHw/KLPoy3coEfvFXwpzrTBsdxD60n/G5YFVLR3RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201254;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=jTznGtH1AMgwhCPxk+NmeREOzjfKMl9qgsWCc49wX7Y=;
	b=rY9CvOaXoi0tIa2kle4LZdJRuUDu9ZSvWwcW68lwExDBHjJCrIEIMgiO2MV/F44ubB0W
	 n/kPuH8X8/R+IZ5sntEorr/rL3xp7+w2L75Tz0CYmLQ7L2ias6M4zfKU81g/KqHTeDuJs
	 dcdS1GkV6TMlG/YBihYKjq8xrQ/6+WCCBl7syZVmB51k8MI0c258xEa3stKn6tzlWmLki
	 eBHjKQZiKYieSpLG66TC9DKT5ma7qOMUERNhVaNWCUIJiaazTaTbhGkMJoDwx6muLhopw
	 k1Gpvx19vMGg8HFhYiQCV8EUCGqi0kpgFNqAUd4nOlmPVktpM5rSoqUgIZZAT3xvj0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SjdBfp+B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.46
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EF9606A32E;
	Wed, 28 Oct 2026 15:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SjdBfp+B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJSVGyQRhLjww2V+CC1hX31l40t24HAJkg082LhWwaBn3z+t2Psm4PE7M8KBLEnRtP0d0biR5LlhFQlK+g/5r40KlTxOd1Ce84XSXRFTnYeA46BH9e0FHU69WB1+p/5TA62R+1v7egI1dRXMUoLp3PtwEFRGoAo0eGewE2elXWRoZ0mTBtqnWYuEgC2o83lcq+vv7KP6D8KDs3kq14TzsRANPfHpWTAcB2jrHHaUR7DvgF+6D2JgOZcGer6HK9rPXxRhckGhXsrA97ymhzFj2nKIYp5ZwEAF5yLj/Ym/Kyd9dU6NN3Qfe6jY3jsPUgfNeOU9Yd9e1DG5Xu4/uSvFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTznGtH1AMgwhCPxk+NmeREOzjfKMl9qgsWCc49wX7Y=;
 b=Nzgz6D0coaXZVIzDfavz8gMPbEiOsUWS+k096S3oq/K2k9w+sTQ+tend5q+Y6d0lX1zGn3E6L8NILcZW5lhf8BCXGIsQq8Td7JnFkmIaYhlX83BIVGucSyXk/IyhtBiVvfRK9vcMvsHaBZJJpS5wzF22vHevSEKKWw69xoV3j1IEz4xkgM7VULHJPwczi/VUOP3Jq0sd2gAfYxfw2VVxGosaHBAdOWfELFURDj8kBDSbE/ciJQx6TME1o7yQ7MlVmka8yKhmxbDTWW9vnB4kaF1WoIVbbtNyZHIRqd4iCJWz0H0/fF0w2mVjfmeM6ThqvPrWHDJGUIeCnEaAj+063A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTznGtH1AMgwhCPxk+NmeREOzjfKMl9qgsWCc49wX7Y=;
 b=SjdBfp+BpVh1zjmvFWlYA1cnwmkryKBLzhR9PCmHIx6k/DVIDy5HI+LFz0DPA5KIEqJ0f7NUPmwcp9kdYVlorDoQf3dLsbBboLi+TnsAr94KNMC49vn/kw9RfLjPNhzTRVwA6SMh31tOkIcfoZfJMlTcoILeBMIq+urrfhuxFt/TtykGJhpaAnAsJZCcWI4xmGevUB1tTdegOou+I8JwLfpsJmrYo4X4+pQDSDas14hcBWHkQvNJ0Jpkw0+YeRtCKEyIcVdTSANPMKDBwWiqunGOpWwc2zqlsbZ5Um4cOHxNr0bHxpPVjmLvL7hv1Z5UE9Df+m2VNaERn/khclOwZA==
Received: from BN9PR03CA0983.namprd03.prod.outlook.com (2603:10b6:408:109::28)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:27:25 +0000
Received: from BN2PEPF0000A992.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::33) by BN9PR03CA0983.outlook.office365.com
 (2603:10b6:408:109::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 15:27:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A992.mail.protection.outlook.com (10.167.248.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 15:27:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:19:27 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:19:26 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Thierry
 Reding" <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Douglas Anderson <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible
Date: Wed, 28 Oct 2026 15:19:13 +0000
Message-ID: <20261028151915.1190522-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-wrasse-of-sudden-endeavor-b74319@quoll>
References:
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A992:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d122bd3-5dfd-4c23-8818-08df3507f80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|18002099003|22082099003|261028144727099002|56012099006|11063799006|261026140227099003|10067099003|261022105027099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	b22bDqwspOUoJmRBABGqoA4bWwNDIrOl0wrqJb9rC3sPve8DHINIqcOAHRdos0nAgVKXmtCpXpIUjIyJ4ALbx7SnU0U/3PnrvLfFeR8/dBiFB7/iisMt8eLgXFcbxtKemtTkvynv2xtG8DFvhxzOxgC5rlKjG88j+Jph7RiO8M4P1rGlMJI6kg4uQsUiSpOTT8CZZVQn57gBNc8VrmgZavZh6xO1cSo89C4tLRdfVDXn+AxerybYlgjguuDmck09X1U/wL0RS+WXSEzv4nUydlDwqf0icGnqMt/and4kLhRHHLGJ2pthI6829nSmpBikZb31+6WrxicDXOP1ITvqW2VCBYl+UbjJDwXHwyXREVzoCvu7GbfZlEv5pgzxf98f/xqsPK3OiYrcUhIv54ZaG/0WJgvUqSuH6YifpVVDBabzDaxchu0EFgwWNTjhkn9NZl10tyJiDeZfC92chI0jj8YuRJZpLsw9H4kSCnn4arkcr0Giyh8VV0ZBDZJsR+r+O8mq9bywdfO1O6bvm/xtq38E4aLFg6DgB4G3llbAlRGMahw4XdpCf/sTV2RI4fOvil5Fz4R0M5DTSEvb+B9yBHCZktgwZDA1+PF9BG3mW4NNCOui5N9qj9JYQOzle56QTOWZQ+qpkaOhS/mgJDDnCIWMRdSMRVSuiOawIkZs008/T/1eSxm1EWL6+BWJNstIYp0TlxQiJX8PcN5mDePQxA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(18002099003)(22082099003)(261028144727099002)(56012099006)(11063799006)(261026140227099003)(10067099003)(261022105027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gOsktsphvi0KnxKXgi18fvmVEDU3VrEvoycel6VDcyMAcvBxeKjg11+BhALWH1sJuCDv1e44Acn1j3uEyJu4rrnD0cBo8Zl1q7ypcUrzM01dBdglk1JJxIGKNewyOwofVppMUod4CJ0yfaB2XsXRblPJ5y/ZEL5L4R4RVzuLASy6Xj4lQgwcaJbto0cTFaSxi4HKKEsFmif3alL83CacOIK4vERzKQZA/RoFz0Q7UHBItpgOan5GvaiOq/Py3iKexnN7dLD+S0dGrIDbBSAAiAoWpniHDUgsGCqV9Xo2Nvq/EWEFM9wEP3AiFQwfkf/O5cCFfOx4d42XJx19smJzBN+OIf93W8leWGseCeF6MnSoJZYnZvQKjtU9CbfCoMXCbLhjlT7AlwyJROoTwd29J8oXU1dbab3zK9eO0kSwavIXDCDKZvyloK28/rscenz8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:27:25.0839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d122bd3-5dfd-4c23-8818-08df3507f80e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A992.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714

On 2026/10/28 13:54, Krzysztof Kozlowski wrote:

> On Wed, Oct 28, 2026 at 08:48:57AM +0000, Johnny Liu wrote:
> > Add "nvidia,tegra238-bpmp" so that the Tegra238 BPMP can be told apart
> > from other chips that use the "nvidia,tegra186-bpmp" fallback compatible.
>
> That's redundant. We do not add bindings to tell chips apart, because
> they simply are apart (or their SoCs are). Just explain here the
> hardware, e.g. it is fully compatible with Tegra186 BPMP.

Got it, I will update the commit message said tegra238 SOC is compatible
with tegra186 BPMP.

Best regards,
Johnny Liu
