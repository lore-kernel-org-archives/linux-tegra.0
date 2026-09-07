Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B24772B7;
	Mon,  7 Sep 2026 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780738; cv=fail; b=bj5qVHeTnUE3Zf8p1XtPr/yr9BVcXjbBycNDi0Puq39GjFVxkHQmXkepNhiLXnQNw2Ug9HV1FdOjs6wOS7au1380Fz9xOEgG75AoieSsnfzx177fRJNJEEzTEQhIaVSqU3hF+fgWuq4m4XsfJeHnQfnu5u7MysfEpgL1EWXXqgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780738; c=relaxed/simple;
	bh=99Bn7yiB/g12vPm85wqsXqOsB0v/cg+Qcfk6iXU8HkM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p1kVmohdhiGsmLe/ESfC3+13IPwY7W6T/F8Jq6nKxTiLhr/Zkfjek70Q0rbySbV8XJ4jDZG+Mkoz/EbGKbxTlHUXvtYQTXbIIY4N8JcIsfiaf4KMVhy8ynTQxbhhbxmwKKXU3i8sbkkR85XfXYNyPFPDCgvp7n1f6e659B0HMaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oWmtWVw7; arc=fail smtp.client-ip=52.101.53.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWmtWVw7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxYj+OhNh8T8XyTCpnTDkl6dQ8lYq140TZGNVaEErk0p03nvY1pk6HOb0dz2pMBEm5FFsEETXqKd8A1TiaGMa+0GIzQ9Z39fnpGv8MUkVXxh3Ls2lajuRMXI0HlqJQQQovA2QySaaWbgPwjgURIs0PI6KlFZOSiO7xNEY9TgR8fIwGJAs3cDKdTHm5g4jgJJFnvm2E8FgkFZepUIALvD1VrdugAucmPz0IsX4yI4rv4lA+E2+ZQXSx4DTXEXG2gA45vwrp3RNXY0q5/yBujISfR3CklTP97Vp3AuUStGBKmi7NB9l/qocTJIhzpH4IKyvVMAhojMtuuZzAJAp9CBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLKwXf1GYK2SjetzyxCZnxP0MaouXl/nIFj0h3PPy4M=;
 b=qzMfZxMbUHdeN6skHC2q0dMBKQajAlz5OZXUxMmsgeFXYBJoe7Nk3cZU/w2EK/2djZQ0OLyNfxYdb792BJKBezjO8/h5VaoCWdMEuLjX+5Ho2kxsDFDlt9+KykLaR4oJUA6NA6G2We1xiMrOmQpfvOsg/5ewIydsJngfeF6D/CU2jqD2OB+LI0EP+Hu3Xn6BljpnPPp2KcjIHP/dki1ApfDNyZYn6PcI0umnLyjyvj811MhyQTYLLys0SDPlPsykx2BawlLNkyR2FebgfURJZZE1T64hThkjA4S8Vk9wPX05boROHqwEVA/9K7+tC5AyFSX+IO94fFPCuhdyOnxQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLKwXf1GYK2SjetzyxCZnxP0MaouXl/nIFj0h3PPy4M=;
 b=oWmtWVw7PlMc4TJsPTH6y9d6i3aYgT2uk13QThuu9Sp/9Z7bUxruro3KXhL658EPxfSTcWVEfmWFHoq1/fcK2LaCS7JVqyDajapkAAUABg1wfyg4vo5l0JbmyPgUHqwz+iiUjutO49hIKmZ1Y188SNzrizihPuVPzuTpPwLi+bJZPnY6s4ksHlI+R6OdDjrbS8Tg4mMiZXeSuGRwOZEOBHEBKf/BAIKXC28zdjtlGqufSQQgcwpfYgP52ClLoaU4HLq4rit4AkYqpkeJ/NyW1S32+kKvCXrVLhaoQWyer/bY6na2eu9gt6vTJA9MZfhh6Cd8dLcs7IT1jZVpzPL76w==
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Mon, 7 Sep
 2026 11:32:12 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::37) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 11:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 11:32:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 04:31:54 -0700
Received: from mmaddireddy-ubuntu.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:31:51 -0700
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Manikanta
 Maddireddy" <mmaddireddy@nvidia.com>
Subject: [PATCH v1 0/2] Enable PCIe WAKE# as a system wake source on Tegra234
Date: Mon, 7 Sep 2026 17:01:32 +0530
Message-ID: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ec43a0-e203-4bc9-113f-08df0cd3a938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|3023799007|5023799004|11063799006|56012099006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	djdHpAs9HBiIRixM9WZrRxD3hUhVkizdXDLNnvE1x9ogut4T/m7cry//BHUrU2Samr04szyluqeaYjoj40N7mWBdDuCT6l67PiByaniuIlUBxPMnDfFMIczgH+JkSCEAbi/n3c7OP2N1m8rggfZs2Z+Dr8FvCJc9SO8yC2dsVW16qLME6wlCHPeFMHcQrvsMEEoiTDFn4IHDp6Q3+FW1SLv+HB206XohwkaA5aS5aahnt8yNsSkfX+pObFA0ztFlpH5K+0Lwj6vcQ0Hv7S5gxfOPkLGG+WN6NnXj55PBcZBg+ZnqOSdCcGuAphpq4cbN9ZCEZxcq9epQnjDClwwGh5tCgWzH/p9iKs63xtpQYQpA+RPfbnx9EjPiwBvHX7yzU+FCqd2VC1WFORy34ifX/rprLR/qXNfOpiXGbVnZex9yBz9zq7bDr7h1pCafVEigNz0kkro2oDAa/9FoAUp5z2Hu84z3xzK8c+684TCLjpZa7Y6M6mFYgJakNJVBJzAay0iVGrkIkf79hdaqizvZTMaj+vMuDDBChQ168Uv0E1rNCrsa+0D5YpSPoZxNWTmO0QEkpFhlxVNnwslsWGVvKQSNX+iCQavuLbdf4PM3PKvvLbb2d/FQRPDogVeNWb0ZazNdQtUIWYXtgVX2q2D4IgEsPpsvifFlnqHeDEugp/rvJfSq8gv4RJDiQ3BwkWXfXIcl0c4q2Y5BrkCYrylyWg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(3023799007)(5023799004)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d/vYDn3mEsWN3NOwUM3fcPGbDxm7UVIwomNPLm3MJmXEbSFgC6KTk8sRNPleRH2A6gkhKOQXr1H/YOMY99wcRGwG7rJP7isBKbRXHkyS7vL6jxTXgdmtxIbZZU1z++uJ+BOKDeuzvKF+Ig1Sln5c2A/3zHbUgetjLmAlW1CZLos4LlJ7OwEseQz0G0hzDgJmZaBVOTz7RC9SJcOAhG5zxjul6cExyz6GLts4T1GHKe8MDkKrm1nQu5ujCi3Xq05MukmPqQfcAFgotv+Do8DUiA1cK2ScDWJS3ElNAz2uPCzL+YlGzpN2NoiN59475J0yU7EugcSeNY4TMeP829pcTi8TTyYGseYx5YZirLXVbVSn6KNFvzquedkns64Wa0bytxlGzAwInCldweSZpPJIDfyaxWTS30PPHoUxVOIa+l4Yh46YrDqRFU8UzSt8BguC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:32:12.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ec43a0-e203-4bc9-113f-08df0cd3a938
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

The P3768 carrier board used by Jetson Orin NX and Orin Nano routes the
PCIe WAKE# signal to Tegra234 main GPIO L.2. Nothing in the kernel
currently describes that signal, so a suspended system cannot be woken
by a PCIe endpoint.

This series wires it up in two steps.

Patch 1 adds the PMC wake event mapping for GPIO L.2. This is the piece
that lets the GPIO interrupt be armed as a system wake source during
suspend, rather than being treated as an ordinary interrupt that is
masked along with the rest of the GPIO controller.

Patch 2 describes the signal in device tree, on the root port of the C8
controller. C8 is the controller with the onboard Ethernet NIC on this
carrier, so describing WAKE# there is what makes wake-on-LAN usable.
The property is consumed by the generic PCI core in
pci_configure_of_wake_gpio(), which looks it up on the OF node of the
PCI device itself, so no controller driver change is needed.

The two patches touch different subsystems but are only useful together,
so they are posted as one series. Patch 2 depends on patch 1 to have any
effect.

Testing:

  - Verification:
    - Verified suspend-to-RAM functionality with no spurious pending
      wake sources observed.
    - Verified wake up through GPIO L.2 using an Ethernet magic packet.
    - Verified the reported wake source after resume.
    - Verified that regular Ethernet traffic does not trigger an
      unintended wake-up.
    - Confirmed Ethernet connectivity and normal network operation
      after resume.
    - Repeated multiple suspend/resume cycles to verify consistent
      behavior.
  - make ARCH=arm64 CHECK_DTBS=y is clean for the two affected boards,
    tegra234-p3768-0000+p3767-0000 and -0005, with dtschema 2026.6.
  - checkpatch --strict reports no issues on either patch.

Note: the series is based on the linux-next 20260817 snapshot rather
than a maintainer tree; see the base-commit trailer below. Happy to
rebase onto whichever tree you prefer.

Manikanta Maddireddy (2):
  soc/tegra: pmc: Add PCIe wake event for Tegra234
  arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano

 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi     | 10 ++++++++++
 drivers/soc/tegra/pmc.c                                |  1 +
 2 files changed, 11 insertions(+)


base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
-- 
2.34.1

