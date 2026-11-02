Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.93.194.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793621567;
	b=A0Ly+7xC9QU5O51PwSchjpk+tLHniYzxG2Hq203GgQtifgL5RK3Oas/fVczd+xJwf+Xd
	 z+JTn3vuFBOsDuvv9j8sL52Ms6KS73zpD2TQCMNYyd7N9HyqEokeBXYqvqQh67XVdLRiZ
	 MMSgyWjqHT++3447AmNDnfOYDVFmMz6CKX7QvfBhp8ivDBk2cp/myHFfdVsF0bLHO2haH
	 S00gpz5DdvfiOUHfLDZmGRlOb0EXnq1LqJ6ydqGh5+vFrzlbI8V+zRKzlzMmry5PeOa/l
	 ou3bm/Jae7bYACy6str0hLnt5Hpogw9bETE0fbDkxPLSUbTftZ/AyCLMeHXQO03sjhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621567;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type:
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
	bh=fWtGoco0wUwGXc6EC4LO7/lRnMvHQ1HTjq/y0BRADoQ=;
	b=1MBokKTGtDC3n8ZYex+WQ6g6rS5cwCmWoprxkI2SHnlWP1kNEL0Wx6gDvjg8ODEi9lI7
	 +5h4Lbvt+W/m6BVQyVGtAM+wKhNe2fISzFQPyPm63Jjy1PdEa3BzSYMo1NbQ6GpmeNq6L
	 PO/QlaSS9aMacYVJN3WOsQskRDEukyoZLpDeHBNDbVj7cNR+RTzsRpiayhtV9PI+HeDyI
	 Qz5HGSeY6rpBO+b6orqESVer711zZiXjwkYWCmcJRuxIHSGPjY/vON9/6vr+iayIqA1ra
	 0X6dh/Wz6oBDlk6+qmhA86aL0M6VyT6KyEABr5cMxJsYNfcMR0lFtLxcrwbc5VeFWhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NJ3+07aE;
	arc=fail smtp.remote-ip=40.93.194.29
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B544606A32C;
	Mon,  2 Nov 2026 12:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B544606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NJ3+07aE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p04UQAclb42KL2S5El2Vs6QspMwXY/kUQW2HAxYnLxoXhUGb+NUR6sM4Kb2cX5tNZSaEMqD8Hjp9KEkRysYvylXZ7txGreXujX/imNIAIRvYmVA36p2bbZJkl6mmYE6Lzn/MM7eSgecNeWPMwG6kSVTNhYiVzuMo2kqY9etjX2EYEzrNnXeNQcff+9FlVtN1yHHAuOhGPoA12czgFEPZMS9e5s9fxvGEMauBrKwBclaQdmMnvXh2GtxeEDQRrDZSU/H36/sB4jMuVMoHEDxhK79BJJKrvsOPxrznP4dRI1G6ezIk3HqVY8tWN+dtZ/ZYtiuPSiZ/PnQog8yyEadg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWtGoco0wUwGXc6EC4LO7/lRnMvHQ1HTjq/y0BRADoQ=;
 b=gjH2NdBnek77iKbOUQ3dcG57QscoMsTLIZiIJiTKfED3gnJ9dbycgl1rDWQq4hq4mfyiwvPX4YkUVAeDOkxMfHI7m//f9lSpu7giuuxt28u+eX/CadtJg+gEcT0bO/q9QwIqqcDOCOwj7hSCq+O6xXJH6Z10sgadNkCRikAJtyr6yWK/vdHhUNEUCyS2IkMwoyya62ug1Be1APHmBg7dg3pGxKqLb3HqPQlahXVvN732J0yXRimJzAQAzXU4CFom3frhoct7ykxIns7e2jz8moew42dnLyzg802HO8w2AbigzrJ8xASMvItUt4mwRelixN74XkGpN6YnRzwHRJsFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWtGoco0wUwGXc6EC4LO7/lRnMvHQ1HTjq/y0BRADoQ=;
 b=NJ3+07aEeWS1tuJlGXEXPkDKTH26V5drRzTAw50Hi2qbaQHhJZR7FqezkCuwdQxsS8xzYP9I7s3fTRI58Z7W+LfLVoyph7/sUMk3BfbmJcOZUJJcH+AHyxM6dCJOdC2bOfukkvArAljXwXhnfKD7PL1Mn+oe0ZxKMe7su4DPjhu8T1C9qfwsmOEE+JqKwjYfjoCpb3x2Qu0wCEtqPDYcszqA6n2qMOr786YOBFmJYIt09F3D0yK2fdQpf5zkSKIM/9WwgtukuL5nelMRK++vOmXEDSpOHH1H847PP8Rr1+KS7LRkoH2ZZdAjyBjKhe1U35yWqp1z3RcsZ5xWjzX8/A==
Received: from SJ0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:a03:33e::13)
 by SJ5PPFB332093D3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:12:43 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::76) by SJ0PR03CA0038.outlook.office365.com
 (2603:10b6:a03:33e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 12:12:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 12:12:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 04:12:22 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:12:21 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v3 0/4] Add Tegra238 BPMP support and fix stale EMC clock rate
Date: Mon, 2 Nov 2026 12:11:58 +0000
Message-ID: <20261102121202.2431928-1-johnliu@nvidia.com>
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
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|SJ5PPFB332093D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 39660aa0-e697-43f8-8556-08df38da990d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|261021123027099003|261021121427099003|261022105027099003|261009223027099003|921020|261026140227099003|261026121527099003|261028144727099003|11063799006|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	dY//Lyj1sHm9YNMATbuWnntJHGUIm7tLb4auwZaQ8+QFxvAu9/4fKi6ERmfLCPVNfPoR895J5gyyMQJZ0pMoE9yqqGtnMxKeYPR9LgQrAOrfX6afmkUgpV9qnmNOiScYgyJEfOlDo92O+hVbx3GQa4uyPE9YRqWv3mv/CiRRWJcW9HfZHjAZwIxkMBCQJFlZkH5Ovy3wADE0x1+199SoQ5XESfFSS0FGQcBnHF3GfV559bJg41EJzfVFRC60W/tl/PdQDw4qtI5rianfaem4vOqOQeGzyAoFuOtk9YvMkLw22VrGG4u5hFYj41uXwwvylDxZmH69E1pQuExu75omC0I1H2m6qHEjDuX8lv/09r6l8BkBVz79UNQ6xf8z1KA0tT+sezQ8ivGDk+/G9e5O8HikCZkf490fKS0srF1bKYOZVTonXwyq+ZOAD/hP9L9LpwKvEakFP5AvkzeuHjcuAUDtd+YefHc+M1Hpgos+N2X5D2XLoePCJBmCc3+Oohgn7ivtMWnN10HTBKxSpKyQ53njFu1e4k4t/2St9hZ5uNlP+zL/vJtdQWkl7fm4t1Rf0XotMdiXJ/NdLwvhw+jLmYES5fX+Icq6fVNmcXoSWYlqRXgpkDDkmIYPNbjV7evpSSG/cnBXHfKE8E4PbZ6wXLZ3CdZkUWkuEa6XewTkX9BrkM+J7WzxiyYifLPu23JmetFw3A/AA6g/SU3skyGabGrrtIht9BAXkc1ebZSTD/fm4uHpi6iRvQh6Ap5IHOHe
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(921020)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YNYaw7C8t6XOy0DpDEGQQyRdrwG5dbmZQDSlH731MvzYdZNCPL9Q4kjEccRuFyeqqFpgXgvCKHlZF4M0GulbUix480yMibWqpI3MMvf03RoiPdAa2g+GyaB97XWPvgb/zNa/fYFQZn7ndyFJTDIQjohD9E8oZPt3o+AwYJNrSEUlFEdN7r1q+XPP2JFeM5K4kfwqSUWi3qZl20o4YMz1XSBKWKpKjNJav3tH7MDRogCohnOmt2Rnya+9IkQMb2CRZsEzKd1E9EmU4wdA0XsmRDlRoq6gGrVGnNdrqjaKI72GTJga5eQEeoGUvB65qmJy50GIv4KpFa9EVOS/Qwz4LL41DkpZHVeChdLZoiwXJRlrg13iNsWPxQ6fMeRc4nWYfAnr33DiUPqH5finFen+yHa2zQtD7zsDhTRykCYbRQrskf9J2D/cAm6e/OgszzeT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:12:43.1394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39660aa0-e697-43f8-8556-08df38da990d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB332093D3

EMC clock scaling is handled by the BPMP firmware without kernel
involvement, so clk_get_rate() on the EMC clock can return a stale value
cached by the common clock framework. This series makes the EMC clock
rate uncached on Tegra234, Tegra238 and Tegra264, and adds the pieces
needed to identify the EMC clock on each of these chips.

The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
TEGRA238_CLK_EMC=43, TEGRA264_CLK_EMC=290), while the
"nvidia,tegra186-bpmp" fallback compatible and the tegra186_soc data are
shared across several chips. To avoid detecting the chip at runtime, the
EMC clock ID is carried in per-SoC BPMP data selected by the device tree
compatible.

Patch 1 adds the "nvidia,tegra238-bpmp" compatible to the binding,
together with the Tegra238 clock ID header. Patch 2 adds an emc_clk_id
field to struct tegra_bpmp_soc, together with dedicated SoC data for
Tegra234 and Tegra264 built on a common TEGRA186_BPMP_SOC_COMMON
initializer. Patch 3 adds Tegra238 support to the BPMP driver, including
its own SoC data and EMC clock ID. Patch 4 then sets
CLK_GET_RATE_NOCACHE on the clock matching that ID, so that the common
clock framework forwards rate queries to the BPMP instead of returning a
stale cached rate.

The series touches both the clock and the firmware code. Patch 4 depends
on patch 2, and patch 3 depends on patches 1 and 2, so I would suggest
taking the whole series through the Tegra tree with an Acked-by from the
clock maintainers.

Changes in v3:
- Move the TEGRA186_BPMP_SOC_COMMON refactoring out of the Tegra238
  support patch and into the "Add per-SoC EMC clock ID" patch, as the
  refactoring only makes sense together with the per-SoC emc_clk_id.
- Keep all Tegra238 specific changes (Makefile, CONFIG_ARCH_TEGRA_238_SOC
  guards, clock ID header include, tegra238_soc data and compatible match)
  in a single "Add Tegra238 support" patch, and reorder it after the
  per-SoC EMC clock ID patch.
- Reword the "Add per-SoC EMC clock ID" commit message to describe the
  intended use of emc_clk_id: the BPMP clock provider sets
  CLK_GET_RATE_NOCACHE on that clock, as it is completely managed by the
  firmware and the common clock framework must pass rate queries through
  to get the latest rate.
- No changes to patches 1 and 4 apart from the patch numbering.

Changes in v2:
- Squash "dt-bindings: clock: Add Tegra238 BPMP clock IDs" into
  "dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible".
- Reword the binding commit message to state that the Tegra238 SoC is
  fully compatible with the Tegra186 BPMP.

v2: https://lore.kernel.org/all/20261028155000.1205739-1-johnliu@nvidia.com/
v1: https://lore.kernel.org/all/20261028084900.1047287-1-johnliu@nvidia.com/

Johnny Liu (4):
  dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
  firmware: tegra: bpmp: Add per-SoC EMC clock ID
  firmware: tegra: bpmp: Add Tegra238 support
  clk: tegra: bpmp: Do not cache the EMC clock rate

 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 drivers/clk/tegra/clk-bpmp.c                  |   3 +
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp.c                 |  61 ++--
 include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
 include/soc/tegra/bpmp.h                      |   1 +
 6 files changed, 329 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h

-- 
2.43.0

