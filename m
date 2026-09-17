Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB74B1D05;
	Thu, 17 Sep 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636597; cv=fail; b=PzdZ2lB5imhMRgFT1i8lENpIz78ccOGApzkCOWjMq7NWRuoY4YARZ2+RFWBmZtmrjajqjvlxdqtCMKVp/CnH8CeANzpbdNZNYq3F7F9DHvE0YOB0V6botryZcT6OHZzWV0MrqUxx3MmQQxzMTYnqu3/XiPWIj/otlycQUxP3gcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636597; c=relaxed/simple;
	bh=nAKv/VkUTZ9OQ7i5v+Z6GDCUZc67UUFg6e0ms8UHkjY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=a4FsSoylNCGBWHOFCtRH9wnNrHBeqiG1Ev0dWawBaWYrddVpyG3svk54cd0aBUAk6jSlmdeTDLxtIz5uHW9xVmf4D+zJHznoLZCjk85oyYaJgTJpj5I4u3hWJyWwE894pw0J2UVv3UAd/NuMv+EcjBWi2KCulAcoB/dHIGKbeXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZQpf8GyM; arc=fail smtp.client-ip=52.101.85.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZQpf8GyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCUJnyFlpqjLc0nXck5tI5vR18bWd2aTXWaWCy1S0CY9FEZqW33bj5yjmo+DfMYe1WN8swldph3IoZaA83Z1/xPZtmPDzCCUxx7VG/1IIqXRSyctfxDDj0iJB0KBnf33oV66Uqtll+A0GrZzMZEgUXpDfTMnWx/BeKdyivf66cSBwdL3k3RknFgLps5u77/rMrM2mMg+KG5kXtiBj5VqZfSIQMq3+iHajDrh3ApcZi9pByLnWtGolJ9DmJ5Y5NIfl5/cGD00LapcDYpQtOEGbOC8iR3BC1pk00hl5ugTK54x8zhqBnlwNxvKO0oy0vkir5F3xJuZ0n4Z0IZUnYFSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTqvtZdMAYMNVlEPQ//TfqLlNhX5XUUH1LikqcCRZsI=;
 b=oR2li4G+BuYKgLxvUTRh8d5aYRQbNlvgdEfAGsBR1hGhY1anSD6UuwkZo6fZCRMTPrkhpo0zsHAxC9o7KiQ29eP3IcSP1BWwvZJP0DW5sYWOqc3SsOG7eO18+8+xUepAaMf2vAx+SX4nfwubv24kaDsxEr/cVOrcAHiQVCTXGUHaf5ziO8zovnoCQJtOZCIsG/NIdEWpSAdeXdaDS7K35ZL5cWa/k4QnhoRUfW1B4Ze/JsAN0VyDniVShoJZ6hlfg4Zj23br6+AbKDJPLc/FLmtf9nH5GyE/rynGqOghvonK3p02iz2O97MGXmiMR0lOWyX+BxJF+Op2x143/B9OlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTqvtZdMAYMNVlEPQ//TfqLlNhX5XUUH1LikqcCRZsI=;
 b=ZQpf8GyM5mU1/OyD1Lij2Hu3gIsF4OEZzYupsMs8R/TOXPspuoZMPeWdYgmFLaQKXs3hT7Fwkeb2lT9r2Xd2lzKAuQjnVwYV3uDE6p2NAOHlmlb2e9U88t2dDZI5qsMmZ3CaY++2a4vh2b05P/4fLGHstk0UBQxW0/pE6zRhIUeGnVGr0s7qCvVRPvGijFOXHSPvToPXgZ4vwYZTFSLL288dbv1JrLvvKUf5+fuLbGnivg0CHCL1opdbJj0j+avnEqgDS0IUisVRsQ5EUBiseUIi4Rd/VzAZe3Hrj6n069UvUYBLf7N3If+ndwbyjIt6nOD8HKudfb3dC5fxQew0Cg==
Received: from BL1P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::34)
 by DS0PR12MB7972.namprd12.prod.outlook.com (2603:10b6:8:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 09:16:31 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::a2) by BL1P223CA0029.outlook.office365.com
 (2603:10b6:208:2c4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 09:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:16:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:08 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:05 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 0/3] soc/tegra: fuse: Add Tegra264 support
Date: Thu, 17 Sep 2026 10:16:00 +0100
Message-ID: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCvq2oC/yXMQQ5AMBCF4avIrDVhaJO6iliUDsYC6SAScXfF5
 iXf4v0XCAUmgSq5INDBwsscgWkC3ejmgRT7aMAMTWZzozYagvsXTan6XUhpbXKvLerCeojPNVD
 P51etm9+ytxN125uC+34AZhirrHcAAAA=
X-Change-ID: 20260916-tegra-tegra264-fuse-5561d592539d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|DS0PR12MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 402ce4d8-dffd-4b69-38e0-08df149c5cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|10067099003|5023799004|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	bohnV0VssSo3NpAzXAFZUep9M2MllU2snTw3eb97x+O7m0gulEoU2pnNocfMAvmXmbXSbQQr0IGAHwSscZlKpIenKJMJTaXh+E0KyfM69cSq7I4nCbSMduyWUFY2t1PSZ788IdB89ZoMMvA3r0l623IDLNu2VVUBsP+7SFLVwdcgN9HcRgJWY4ATjUQf5sj23I+N4agPae+n1UCF48iDfXdiF26f4gQLJ+sKFUDOX550eatiQbwSh3gDNeB6Z6DeintPUgkx5Txo1f6icxORooyynyo7xNct1bxMjBek2PIrcN2GGfUoXhI2lY2P0xiBhgowy5hh4LU9gHGGgvYjVISy6GXP+RsnradM9Dy78J1/b1sVtkrVp0eT9Xc1XgPKF3eAmoSev5cyN3yFi6e+O75iQ1sWialAGsXO8lQX55gdeIKEQKwgEn9CZ8sxeNNtu9Y7vte85u9KFkAFTOnY0RgxrrZIBd2DObwbYo/VHTxE9rXbJ4aoaeXb8alKKQBXDRkeHqE31tkTWcyWR7h7ssXNa7SSbYbDfnZjDP2SFVAOReN1Hmm/ILthI7RotEzgwGasPq/ykheRdHp0V45PKmXDGiTZfO4Jtb2mSfQZMqfJnN6jB4ohMdYwPmSog8vcKMwcFLNHgfkJJvMefByt77+2nzne1BTP2L3041g4hf8SDx7PwdL7c65D67n669iSZI3xUkOLIAq0YkuGQHam3A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(10067099003)(5023799004)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WiA91E7fJ1LykeO7May7mjOp56nJE4KrEu2e6kAK9ODlqL+CiSlEUBORSPr1J8CIch0Vekz/GcytKqm1gxv0YIn6DfeG4XDQ9nI4tupKqYb9v6VmeLL3D1TTF5Ff+6P0H35vbrkRAzbs88163w5VBA7iml+eYD8pd+OBvGjB8AUfPkkZ78k9bCEr2Or2OlPM7OtiUlNFO+rx+DrV7ls4wszVx7iXMnxAyAjOzXBfeA+jw3fEfH3S9yao6qoj6b4RBXcJqQo1/6l8UHhRAndomzAsllAfPqWQ9Pi6sFUiUmtGLqZs/fAvYNg4eySe4DjN1NFlk3m6J4wvYDInirwkOT4UfzaNm1ACYUmRnxp9ea0JxSXZdXSW3O5/c/LbUPxlp3nGnslbSpiOE47ZBxN0fK0w3baSl/7k05p0CzNFke6JOOlqZ2ZZSZYdfylHA0MI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:16:31.1758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 402ce4d8-dffd-4b69-38e0-08df149c5cc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7972

This series adds support for the FUSE block found on Tegra264. The first
two patches were originally posted by Thierry Reding and add the device
tree binding and FUSE node. The third patch adds the Tegra264 FUSE SoC
data, including the register range and keepouts.

Changes in v2:
- Reword the device tree binding commit message following review
  feedback
- Correct the register range for the efuse block to map the complete
  address space.
- Add Tegra264 FUSE driver support

Link: https://lore.kernel.org/linux-tegra/20260320233822.2578569-1-thierry.reding@kernel.org/
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Jon Hunter (1):
      soc/tegra: fuse: Add Tegra264 support

Thierry Reding (2):
      dt-bindings: fuse: Document compatible string for Tegra264 FUSE
      arm64: tegra: Add FUSE block on Tegra264

 .../bindings/fuse/nvidia,tegra20-fuse.yaml         |   1 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |   7 +
 drivers/soc/tegra/fuse/fuse-tegra.c                |  11 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c              | 168 ++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse.h                      |   7 +-
 5 files changed, 191 insertions(+), 3 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-tegra-tegra264-fuse-5561d592539d

Best regards,
-- 
Jon Hunter <jonathanh@nvidia.com>

