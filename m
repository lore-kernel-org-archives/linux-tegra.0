Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202919;
	b=rcl8yPhkjONhWCSJP21xT1T6vHyjKcDrOM3m+sGxIuTvjp/UdbB2e1Bqp8xlSUlEKu+h
	 a27qL8jIx0BrmExtxMzBdsTJNHji8YDvEK1bsTiYgcIFENnHDQIOyium2J45EBPJEZ+8N
	 M4kv4/HTyxB9QxOmXXtPWX6lghZIvwk61p1+UjeNClSScaFLGVpwJACBxF6kmr6uDMM4t
	 OSFGEj/2K+0a1JzxkQEY5lBCE56rVbhgbLWYwcmOjzgaNEENKz2ONDTeDoGiv/mZh19s4
	 lWc5dnxBa0JgoT3a/gPgZQ5fY0vaGV9dL7U9WczLmy1C7FPzzpjPc0XKQSWbJXgoAvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202919;
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
	bh=SmXAmjipfq4C7UsxIF4o4+9Mxld+kTCmaejJECGnXdk=;
	b=QsRpj/tcWpwLabX04k2rtpHXkgsrnWAECUaWSJshBu6kp+KkoLfuvzUjFQTnCQDifsn1
	 Z12qAXpaISzWFeIf307OKNusFs7si6DD6RkcjmGMuvwMOInNOP8PcKRlbV8DX58p89yIr
	 FI/Lc8070MouTxDsDOCvBCt/EhRGGW7w2cgVD/0zRwK1Md7/nHlHqCMLi/f3pJjP7dsYt
	 KrGwDc2RgYMII3Dk2HCmOr28n1I+b5Qdn5tCEbIJ92bMiIP17/a4c+7p1o+MusZLFqVub
	 mF15LHTHkBVCJ+LA83/toFpoN7KKF3UDKlbiKtJ75WoCMmHXWJpPjshzG/pFDzp+rUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o8AxZHbA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D63606A31C;
	Wed, 28 Oct 2026 15:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=o8AxZHbA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PldfXuwrs43AWiORoO0+b52Bftl5fVTRZ7GvXssmB71I9xJ0+BnqZQqe5/BNSw/MEnsqEOfLsvHoZqRjwKyOTv6LjVcZKLLUL7EoAa38366+gCX6+PN9BV6R52fCsfQCtpdi/DOjHwzVWRn5cNpHjzUR2bCriyBWLbSE2YSHS27/RfAcRSBCdwMcKqXIDur46Wj/Mi6ylzITVfQpBE5/eczuTDrgy4t47MSA6zjZ43a1RmCm2QTKUE4gv+IBhiPmEmVCjF2ozHHBaDNw5ad+HojGt9fQJpUnKc8IqKCcTTw1U3VPyFexYj2JP0wxkyANCeP+polq7hmndPVhQo8vPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmXAmjipfq4C7UsxIF4o4+9Mxld+kTCmaejJECGnXdk=;
 b=HdDROYs/n54BaggVXbpVo5xMOyzjqt68ZfJr8+hw55LTLx3dnfygv0Goeqkwdog0rhI7PafaPwJdtSEf62As7keF60jDvevYHTzHmpQXsF7xMYFbIVCltDlvmBw2R8PqFcv67Y7oT2x7vXfL/7AxczwrblP1WxlvyGPMqvXYTCEcBWhNREsqfyRxIUL2o7HSlB5Bp4QHImT0CDXe986FnWKe+2CxnD/ZQavqrOm5eQTwTiioxDjHuHux7NsJDoDUAIradWwZemPD6hvXYraFp3u8d7la2FA9AzstgqRFHmH8lC9yrj45+PPJM+nI9X2WO1HQ/4hGIWnHlTPTvIb+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmXAmjipfq4C7UsxIF4o4+9Mxld+kTCmaejJECGnXdk=;
 b=o8AxZHbAl+6BZIXS2Mgv6B9f/cmJO0SSp7uK5/eL59P/P8nXCiuc60gLDT71HrGK9A+ec/nnNZmN7prnZmtU06TmxaziQwnPI9b50DxMguKBpnxQkigwQxcLsc0ZKxC0dqK+tuJmOtuL2Phry36i+XP1StlhQcn6ul6ovuSRvhREQAPWNVmZB44X55mrkaTNpXYppWEBdJYfR7grh/asL5AqOYBTupRxuNQBsJb0OTrlz6WC0szCmR/xKxECLGaHPwUI4gpv0kgx78v9wuvSVF87x1HJ2BX4JvKZ0MHuDIV8qSDt/2gotYYXC/6f46Ab+DRFTXUd63YFiwpijSyEOA==
Received: from BL1PR13CA0140.namprd13.prod.outlook.com (2603:10b6:208:2bb::25)
 by IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:55:15 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::76) by BL1PR13CA0140.outlook.office365.com
 (2603:10b6:208:2bb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Wed, 28
 Oct 2026 15:55:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 15:55:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:54:48 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:54:47 -0700
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
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Tegra238 BPMP clock IDs
Date: Wed, 28 Oct 2026 15:54:33 +0000
Message-ID: <20261028155435.1207356-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028-enlightened-khaki-leech-7a3fb6@quoll>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|IA0PR12MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb0e764-bc56-446a-d180-08df350bdba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|56012099006|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fOU0vJWAdrtT+phLmh0PyGRYipvhYL2z3DL+G36jpFCoCp4Wc9v/DU8cxxOybpfquk6xwjndzaWCNeGJE8TIhju4cysjmhC9rIIdbb+GRCvCzzMvigEV7hBTBP0Bu51HOmMNg412Y5/vVdvkVWmtj1nwsq4thrqzyPxhn9xOaAXJz+cVg0UdYDAzwBfAnD3Ud75wE1W/ebFEvQnM3GhT5YfNZbB49IWpc/00vzXC+lRytLQPmXUHjVuCtiI0Q6WNsiLPgsL7KV3bCNfdSuDRoWTdxLIAS7IvQ/9e9iKu9Q0UJeEMhRGn4ik6SXS22Ju9rPtpdH4Qf24gDCbFBdpRviBPDu4XTaX/a6TYRelNub+XB0fW7TBV/7H3v95GhbENUlCoZyziMRMnkRewXjduW8rCOnnssqfx7OWmdQEepIhYleJi7G4XIapQQ5fi9DbMjkIU9K8O1EpaW/8Kkj4eIzS1xK+QTwKDJO8tS6ltJhkr3CFOODDTe+XxtoRwEN8VYJxACGsRklyDKb0zHFUwCSZtvW4oLwrkry4M5ud2CUrsTyHLYofxlqwszK7Xn/luj7lrJFXy584ch3MOXiwfGTUgZHVOkIP1P77jZ4f/u4ENWhpTUC+/E669poWH+900+rEk+YCsi9hPIaLb7PAzsqRhj65UZr96RjS5blC1ivgZfTkR6xcbjb6dyvwit9PXzqiHFw2I+AzlruVcgyPzNA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/VkXzN441jjvx2YO19Qk2Q6v46XVUdnQSr0JdofH/cuQHOZuKBsgTW3giXDhB9MsRbyHtbzG43ahUwhvVDmpFIMoTLWCrrMLyKIRy9iIQGCqgaxe5FjIlhZqC9SGmHwcMdfu14QHW6HAuKH1o8FXAXfTW24cP31AYbkIsNp2FpYQaKxaJz4/n2NIYVv/k/M/5jdBk8JoaPONa2N/K/pTJHBZU2oKj4u/weAKysJ3l0nlPW0G969GrHqjEGQOWvfIfjoJA/mNe0GAzxlvzIoLeT3yavcrEJLQqosL0hTG7RnVdvDUsyW8PdmXVURc0czihgBrFMuq/2jtw+p3U/4jnruvD0IEVzkPGaZtFalm81JYmuoo03Ae+R8gqQj8Rh8+saIRbShsyyTEAHgBCd+xJLkIXLfwl4EjcihdMk1rEMb0E4PxcFG6cDh3snV2jh1u
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:55:15.2905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb0e764-bc56-446a-d180-08df350bdba3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8422

On 2026/10/28 13:52, Krzysztof Kozlowski wrote:

> On Wed, Oct 28, 2026 at 08:48:56AM +0000, Johnny Liu wrote:
> > Add the clock IDs exposed by the BPMP firmware on Tegra238.
> > 
> > Signed-off-by: Johnny Liu <johnliu@nvidia.com>
>
> And the compatible is in the next patch? Then squash them. Bindings for
> a device is one patch.

Ack. I will squash this patch with the next patch in v2 patch series.

Best regards,
Johnny Liu

