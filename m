Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35E2C11D9;
	Thu,  3 Sep 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421570; cv=fail; b=tFUyPHgglqi88XDlQDKJtKm2AvsmAo/cxhOu4cHjCjpZSMOq6dr1sI0nTm7y94aZSaDtDKo7nm/bgdfYYSBqAv/P6Y/nZCm8Q2okoI5t76aAhrMy5h5I29v03lH0Y/ayozMiVhbOBBWYNGmNwj9PhtGYF8G7PTk7QEMBWDUDid0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421570; c=relaxed/simple;
	bh=itZuLPXbm9hPsHJ3Anfxwx+p6o7CwvTU7WQn8Gyk7v0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L9nV8b+nbmoJ1ge2DdDEQ4WAK1ZY/YRUy8vZUPe+tK67zxyyvK8EANvvY8jnbkifg9waiS3bI3ScTLb7TYtLFg2j4kiJHwPFDns5XNWWabjwcGyhP1cN9ZbM0H8t9/tCW3n2b/0ZnR01rY8jjCPIuS0f9qdHsjZ1zw+Zc7Uv+cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UATjB+qM; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UATjB+qM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su8Vn784Tvv1p1qI1jngkoUDF6ToZZQPbCXRREvhw3mh4eUvZnwmA7NemEV3rszmTbzlJhK7LWTAY1nPkqtS1LmByj2c1CAI5bF1CGC74lW2VVbqIqWiqV5aFLhcv70Cn9YOgHAImzfEZiP5PFKLw0smkeVgkMyBUZiAp3JfNt5cDzg3FBrTo2Ggi46rBo/YFXwgPhgMraX1Sk1WVhNqCwnk/k8HiyGVtyuaRRlAM/zPGykmhtpx4Wm+qly72iZXo/N8InFAiwhUa8N1I0b5s3w3AzsjAJZH5lsvrey7qy4AJNdUWNol+/sefX1d+5vCtkuorNnKSxa3BWCyJdZycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNZA/nVZOyblzz1O7eICD5g4p3+pd3k/1uq8RmatpUI=;
 b=M9xtJ9gCXQ/jMIM0ulf99WRW/D69wnluW+vYAWye+ALqWwO3y97hSwHjXLlaF4z8m/FvHFuXvk+gYeUEom6ecXjYtaaWg1O7NkmBUX+ChcoCl1PtDkOWddqGmsSjhpuaKmtcR9AnvFleWQ2VBeHsuDdKaLGzBYOqcj6boOxT8NpLPppFKerad6L29GiKnJhuLQfgjOeM0pfdAcBRQX5bBNUt2EddeFGNgRFSjYbSgrMR/okXHcvenqVXmNH/LDdrxx9IBeLIRhGDctnSvdzgqxWZ1l3GLNFZgVLCnoMcZW4SdQ6VYcIk6+TQY6udroc15mOukNWs08FFOOt0Da3uxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNZA/nVZOyblzz1O7eICD5g4p3+pd3k/1uq8RmatpUI=;
 b=UATjB+qMRetyjJMa0DLcloaOE2+vP9zsw73ZUQb17lhpGgmpT+KVmXrIk0B4XhHmU/W3BnVYHJXd3MECBYdMXguuP2LuoeHqrqk7KXJeyU7IRLMgzet7g/vDBY7/djInoLyeuiSZ7GAx9RzUBMMZeSwXEzFrCqHQHyH3JVyG2f1UzIPG5Gve0UH1NggK/YPeF/IHyQYZjE7Rq7RsaPdjG5JuTTWtl6rES7uIJeLqFQHcswGiGpZB1xAun7YBHH2q/mEuIaFfNIbWDCpYZHIA8dusjFm+EM7cJTybhITij4q7nDCSwK2TbeouooHIwY7GpZMFOuWSAYt7ChNUIchRxg==
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by DS0PR12MB7746.namprd12.prod.outlook.com (2603:10b6:8:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 07:46:03 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::aa) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.3 via Frontend Transport; Thu, 3
 Sep 2026 07:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:46:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:45 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:45:44 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 00:45:42 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
	<mathias.nyman@intel.com>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 0/3] usb: host: xhci-tegra: Add Tegra264 XHCI support
Date: Thu, 3 Sep 2026 15:45:36 +0800
Message-ID: <20260903074539.613220-1-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DS0PR12MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab82336-b252-4280-5b96-08df098f67c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|10067099003|56012099006|11063799006|18002099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	21abMLZunBWEMMU/R+DxSLoGxE4l996c1Chks87I9pQcxJrk3B7qhcmG0ZdV0AKBb3KyibVIR9WEcYTTgh3KhJKsqGAVTO1ONvvcDzhSLCzPCaLMZW8fihxwmfXYcujtpGrTfXeePFWrmvSRRVj1tX4PBjoVxz8XmH/HuMcOuf3Hbk8MbZQVaLZJBRHKL2bWh22Y9ahTjYaNOLt64q3V90Mr3ItvnfaFSOMjJCHnOkm+UshYl1PjBzadoyOXLap2jL+86D3Pek4zU7oSDmyT6NX8g/UBgj8z4B5ovQLpueYxNPMeywmuxWOEUfUjQJGMZoGB2nuhXsltyzUkyWVa5sM08D9bPzfUqqPupE08+7c9AZzGF3tQ+km0Fv524bKC8GPKjW9J+hxQTRI74lMaFqy67fILFetAOsJscAi6f/F2ivsR2Cp6OCnbO7tFS7WZ3ZG7rtRiOa8a3z1XPA532GAz9/dObYIA0U4t23Y7Tx4rdowgw2AUVkML2LageVVJ/MJ4/rGjhxjLfcCDH3M0k3FnMbPBFRPHnx0B+inixifGVxa+56KlEnJ0NUtVDe647JU4mwUBVV6P1Ku2HmX3JBtuWbzR/M6y4vca9+Lnk2sxec/Um7bunnYhdeuObsfrfGNnaQ32HTh1DdBd47mBoBaekp1U1+JWVOkdd996STgKiaGSXFyyhfG/aK7ZIN6DMeMf3fi3cy3+5EbFXyc7yA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mmZssloMFoWz2iOiRHBGmmECVKjNEJArlO2E8Ot4+wvt2yLneQYpO1RH6BkJaCFUgb/0OHasnEmszbNLFl5wIVj8W/RwgI3BzEpNuOfgy1mo4yurYwewo7NWQHXpKdH7fv/X4xtqHvIybeRdQU77Lbybuz+J3DsWE7s9ZpfEW5Y1LXK4qFKbn7euZZ1baJ4kulDyx2qf5JUZRQvzah3GZksj2yZkoxL58TOz6y7LDC59R3yiKqi+LCADMxVg/IbDUfkW0lvtznxi6N6wNWyBt3er6nu4pwWifjYonL6TJ4pnAGUq9Lh897OCWu3KZ0MO1MIP8mMvjV0AkN80csInI8sCd5iS2x2g60YF2EMNB15aUYAkQyLBNOw7o7rQ0gs4eYynPFpd2JAp1cwArPNhZ1AGMsxHTtYSkm8S661K2rs/34rE9aFv39YcBgUiyv17
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:46:03.4030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab82336-b252-4280-5b96-08df098f67c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7746

Add Tegra264 support to the Tegra XUSB host (xhci-tegra) driver and
its binding, as part of enabling USB host functions on the Tegra264
Jetson AGX Thor platform.

This series was previously posted as part of a single 8-patch series
covering phy, USB host and arm64 DTS changes together [1]. Per review
feedback, it has been split by subsystem so each maintainer can pick
up only what belongs to their tree:

- usb: host: xhci-tegra + its dt-bindings/usb: this series
- phy: tegra: xusb + its dt-bindings/phy: separate series [2], sent
  ahead of this one
- arm64: tegra DTS enablement: separate series, to be sent once the
  binding patches from this series and [2] have landed, since it
  depends on both

Patch 1/3 (dt-bindings: usb) also addresses Krzysztof's V2 review
comments: the iommus entries are now listed individually, and Tegra264
gets its own allOf conditional pinning interrupts to 10 and iommus to 5,
instead of inheriting Tegra234's wider top-level bounds unconstrained.

[1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/
[2] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/

Wayne Chang (3):
  dt-bindings: usb: Add Tegra264 XUSB host support
  usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
  usb: host: xhci-tegra: Add Tegra264 XHCI support

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 52 ++++++++++++++++++++---
 drivers/usb/host/xhci-tegra.c                 | 37 ++++++++++++++++
 2 files changed, 84 insertions(+), 5 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
--
2.25.1

