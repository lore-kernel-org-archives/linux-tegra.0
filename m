Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795151006;
	b=rT0k8dl9P/B5a0ZRP7iSiiAnNQsjdJ4mCpmRfctbpI6IS42UL0FPRpS7ME1iwHqI+5ll
	 FSnXXzCSwW7fDRkWPeB0Ho7oZsLRbRig0uZSjrmQXwMol9O/P+Rhf6ZoWyWPAycYMg+W7
	 NIzKO6EbYltuJnAmVDwPr0XjvSTiBAVgWeVglH4Iskosd79ZVGSXcvItj4QtjDpW0779Q
	 4A7o+/ujjshMwwj+gQSdKBiswSL+Bz7QQsIAzWhjAmN6K3KgZnbGimTSsidva2BDa7xVz
	 3XG85a6RzfEd/42dtGp4dCEYz1qPoutM2MQ8I/qL0a1Ia8HzFO4gun1F3hLLy4wbl+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Jj7t+nphV4rGZZSrYrh/7lUBZCIfCYOmNXwoc9G7FgQ=;
	b=wC2fb6lEE8V+/Rr6jiOYv3+YRSJcROGwYCJfJjRSXuqos5cQKKGIp1YRw97k1L0RibZi
	 df39IAlXLTjc+wIKKPPjn3kVh6nPUCp8PLJTPowNrCf+ynfxsQjgbK+h3usR0BYE0DN5j
	 yK7UDl5UKjrex60CzUmYB3svwnKr82IaGLfv7+Q+xKO8gFINJLTx80suwHBclKUhIfGbe
	 HOxnrGA7dMF/PH/oMSoQe+mSQPCKjlTcrv5c2nmVPOesDdzWHZ/mx81hRW8NdliXWWVtN
	 okOINtgtBkh60tqALMzUigdlDcs3dCmzQgXX9NihHQyRHsQ+oJSLeuucWRP0tmr5I5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LEr8DNku;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.19
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810F606A32C;
	Fri, 20 Nov 2026 05:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4810F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LEr8DNku
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu3ThHaF0i77ZEsIPfwTvHbZUy320zOlZYlbknkcJkH9eUINSq6pCHyP5I3WLFAvvI+plQ+H0Gp40wb6vL+XAgjlwVAjz3Zxzh4YqvANaVnVc2yWphKBtJU9LGHs0hL0m8M95mNrW3ffWUbUzIjFYGqSMWDwASPXFe2uNPCuwjL2LcUYN4bfXOoB9gGggUPMDO7cXmCouA2kL9sWbs6+iM3LxaIDHLg+rI6SbHvbsracm3pOH/pmEvmtyAUKrCGfIy8f3O5ihD7QpZU3jK7jj6+lQ2XfKttDloTEHb8HdLvsf5Di8UczZsGvbOZuovOWJXqAuPSLuk9QCGsTW+5WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj7t+nphV4rGZZSrYrh/7lUBZCIfCYOmNXwoc9G7FgQ=;
 b=alIfI9TRZOAFV2EVRT3ft9nWL8R9MvPQAKhEF5te7Gt1YwJrG35525vpevfOpLnbDDLX+44W5WT34PIoMvZ1Hs9WKvuHYHF7XDtTklbrBuTOQHuV7JRkPqoQs46BDAlaI1qUN35i8NfaKfHOlPbsL+DAz5o03d7398UpkLJNgjbmO+Cv+vwXtTzE3Ri5IHdhl14IiIEtRA7wTuhxvTpOYdlK/efloBVdGPFdbTb5GSMEhVfgS7YbzjPpuOMCGlQlIaYEKomDqZtzwHfJkm/RCzzgwniE77Utx4dMMQ62OKUBYcEuWkjlbRObcT8t3o8UZV9c/kRccYInFA/JSN3LyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj7t+nphV4rGZZSrYrh/7lUBZCIfCYOmNXwoc9G7FgQ=;
 b=LEr8DNkutDN7ne1tvHozflgXUqfOPVmgOD+MDo0/8BiofvmsazF3wsIsHDU32Ut6Zs2YK0B+hVwzFQhruXjIz4yiv0rTYirUIk0Rq5G2qYriJlT0A3RjTD39YHt3vLPiOfHc2atwjzthQ3pSF0eFd7+g5MX78uDeWLZwBIc1Mxs6KIYjSPB1vPrLqFiuj+2xJlKBKnhz+T6tRVYf4NDf3lvtDth4/+TdweT/o5xIH0vfO6cc4V+B3ME8p04981Y6fBTFmV6cHCMGcOhCuI6xSUynydpIBFvAdqpeFPo9Y0SbeYzG9QYp8MPQidOnWdD+0PfItDragMng5hihZ4XYqA==
Received: from MW4PR04CA0191.namprd04.prod.outlook.com (2603:10b6:303:86::16)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 05:03:20 +0000
Received: from MW3PEPF00001656.namprd21.prod.outlook.com
 (2603:10b6:303:86:cafe::1b) by MW4PR04CA0191.outlook.office365.com
 (2603:10b6:303:86::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Fri,
 20 Nov 2026 05:03:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MW3PEPF00001656.mail.protection.outlook.com (10.167.249.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Fri, 20 Nov 2026 05:03:19 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:02 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 21:03:02 -0800
Received: from build-sheetal-noble-20261014.internal (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.57 via
 Frontend Transport; Thu, 19 Nov 2026 21:03:01 -0800
From: Sheetal <sheetal@nvidia.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <Frank.Li@kernel.org>, <ldewangan@nvidia.com>, <jonathanh@nvidia.com>,
	<thierry.reding@kernel.org>, <mkumard@nvidia.com>, <spujar@nvidia.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sheetal@nvidia.com>
Subject: [PATCH v2 0/3] dmaengine: tegra210-adma: Add Tegra268 support
Date: Fri, 20 Nov 2026 05:02:51 +0000
Message-ID: <20261120050254.1343679-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001656:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: d62d2861-6e55-410e-fdea-08df46c3983c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|261022105027099003|10067099003|261022075727099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jEVKW4k5uHRY3N6Sn7m3UNUg+RMfTiwCNUMrN0wUv+kT/N3EFdx4Flc9fMNuJjVymMwgYFpaUr23s7Y6arm7VMfvXsHqGyw8UoV2wYYqYkRB2oe6AGNs7TljQukhMJfnjQCKlMlwVb4HAAVJz4Nv6jl1JrSjwHneagOlURsp6LyYtXTI3itmpTH0DvzQ+mkbmZx0VBrzkBSO008XMOhI3RdwagPOdercs/O/LYhBXhIBeG63DEDbu9TDtXi3lZgXDR5jjSs11/EpNa0+kksArlzt2Kfk/L5kKlvgY7y/8DdhrhR9Tw1int2Y2Vb6S6GRhlqI/v7g5rtc/O82jJpTqe4EMEEFNec2Njnt8X/dwJMNoq++wnOaEYAXYJJJqor2kc1/3oY+a4lqCjaBGbyHi63j26nuOpxuwsagSgCC2M7kYU3kWATNb+8T0og2rXfCbFScVuJ73gbW6Pta7JXi+AaOYAp8Ol9OleJMxN1XmYuTp1OXQtNAFDOaYGoQbgO4SBF5ORquRMsyQkoT9mkkpkI/61Ng2byH6M9ampAOWazVYv6c0uCxh+HpqQj66mm+U9tg/Y13XeZDEadU5N4Fsn/mhvc6dCZehsLbXeNKZkxoqV6UyR5oV2TKohkZ9BV67BXlNZS34x5zFwT1gKvtcliGuKlT4oXOWbRIEFxEQ0GoWTA82qMw6WuQ/KSVqUwOLl7mvafXSPLdh7tShH22YQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(261022105027099003)(10067099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Svo7z0B4qseuuRxT4B43yPYoVRZxXrJqLS5JZwWJfG2iQERQ087jJxBnaeN0OQYMgVhpYsaeqe1vkfzqpIO0MWCG+RAIcQzX39SQ7dx+uQp2zpDEuYxL1RzdkhOE6WLu8qDCpPaDisKi3D4ypNEBXdKzygOyCvF4bg4ITeKVdl/yq8zugp/rvafrXo20NFKsVg4TreP/+W8PLNpX0sGjTauUJtFSl2QNBHQJNHESRsUISfNfY2ydm5vGoCVRQUN2kOKz3PhqwyXD86Dyzt/PUYc4L9vq/ZYEDjkqTAwZVI/uqraJPyBSrTZrRamZJyucnziBm9oJQ6PFLmHOZr0cVU+AfItLS+YNs+6rgaQAf+6OBj+q86YUiFOTCm+SeB0fsP/RgFafvmdoBwrp21SGdWtSvOE2Z2K3rQToxWL9U1CdM6YQUkKiox67rEpVlA+n
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:03:19.5532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d2861-6e55-410e-fdea-08df46c3983c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001656.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897

Tegra268 reuses the Tegra264 ADMA register layout but has ten DMA
channels, five request IDs, six pages and a different uniform FIFO size.
Add its binding and SoC data, and derive the shared page configuration
masks from these limits.

Make the Tegra264 FIFO size explicit first so Tegra268 can select its
FIFO size without changing the existing devices' FIFO programming.

Changes in v2:
- Retain the explicit Tegra264 sreq_index_offset initializer to
  address the review comment by Frank Li.

Anupama Kunkulagunta (2):
  dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268 support
  dmaengine: tegra210-adma: Add Tegra268 support

Sheetal (1):
  dmaengine: tegra210-adma: Make Tegra264 FIFO size explicit

 .../bindings/dma/nvidia,tegra210-adma.yaml    | 13 ++++
 drivers/dma/tegra210-adma.c                   | 72 +++++++++++++++----
 2 files changed, 73 insertions(+), 12 deletions(-)

