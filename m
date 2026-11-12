Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794446483;
	b=ID1FfgU0hE/wSqZj9cbNi434wnnQIc3sTBCC88PqMREjriDxZCdR+XhF9J1eqfCvmT1v
	 LeZuRmo8UvWaco8YOVBbYaiw6cK+qcX9XCnDXAQQmCF77fHamhbktX41R7vCzBO9aMSID
	 Tx1aOP04o+v3vuQXGrt3YkRMAhWkYlMkntXUyiu2SpMe9CdDsl8F6d2d+Hg60Wpvh0Xfr
	 qzSZagRKuj36opGF3oFNWkNd7T4HC7XovEumkZKibpS5jsUHbIUaCBoETKjhPnQmvgMfM
	 lxBIspmVGDIpWwTJ9AKpBQQyAo4Pqu3YMhJeHys2w3bjOCNQF4r4+VFe7sjy2+PEkcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446483;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
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
	bh=uR14w8pTREbKmhYIIjAZO/XpkzUWV+xjmuAZ+6vcCFw=;
	b=msNWpRpoZoOv85JrC+XwTHVqC6CAioytl+wtB9AGj+MJSOQq1n3iUrPfU/mOzDeXpdSE
	 7aBtXW9P7YjAS7aR7Hs6R8DwskYku3Yz7391Zqjomg0l8YAleM1U/4ojipnF3OHnimeN/
	 smD3R7eKzqFvUTl3VDkbF5aNzUT31iObGnBBufNSpITDlAOo6U2P2TBkvWia8EszawnbM
	 3gQR0yEnei3IDoA59n8rmnRB/5SFn4zKF4D/mwpXLufOKcWZ8dmrsovPu+KQLtUYeEclW
	 9756BbNo29tJ7ZkD/BCy6NM5VPWqzHIcPAighU6BHAbjew7l8RsRd4P8YTOKKYexNtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MxMvrBcJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.52
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F4606A31C;
	Thu, 12 Nov 2026 01:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MxMvrBcJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAqeujJtHUpklGvqYR+llcduss+v1awKiOM+arbIEJ0Ak/8nrYVRcjU8+y3K5W63tpA7fEEJ7Jfpl56jAr4tfWMmPkVfDzrnmbVXzNVXS4LEYKarlQNLA8pFrNMZ1DrCk3GeToOseb7Zj88s1r6gfdVJOV2gPfXeMX2Pp1GxC6FlHTLs/EqoxMYMhEm4ZVnYkJe85CnYIGyUwhdPafxHIhSfTxyGrWkgNEwV/sXnWSp5AiSmQXhS5Ga073DZLq/yW2j7jgwPC5lIeeJk3UYyN6rp9gok3NjXUlOKu/AgtPBTvCxqyaOhyjt9k9j7gE3n0XevJkSDvbzFQnz2LdBHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR14w8pTREbKmhYIIjAZO/XpkzUWV+xjmuAZ+6vcCFw=;
 b=OdtgbrjCTcSW7KiAFZD8kCnaIzJ90C7kj2XpbO//P0SfZ/utm8fcEIhq54MvDqLPZ5ba5FjD2Oud1yF3eYxxpsSy0faA0XzBDcSnMwT1DrD0jhuQW9OdiFJvZeWzWv1SKkf9aK1aTiH2gup4CT0jWtbD0vFBVqF8almPs60ggJbyH7tY0uOk/nTHPeFS56nt0qFA9YncAtZH3ccFlP7W2MZkNQZ+wSkPOOq38jCrGBUjbFJkJXjG7TzR+e3W7kVg2OhL6VW0drkOM+yiGbgp/2F6SwrZPmLA44zKlwcq0GUDbF5dk2MGn4utKg2EO+a9K3oAq2SBSO1yIHN9VCNNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR14w8pTREbKmhYIIjAZO/XpkzUWV+xjmuAZ+6vcCFw=;
 b=MxMvrBcJWR6CLmbumZ7/pPhb8edDvuOKgKZlXThSIMCtMn2hRVieIeMjlD9+57z2WDWsiy6bXdgo/diUiKi44Z6qPCFW79h0i/3JIO78kwWZ0dZ2E2Kie/aGOVAGkacqzaxxlhaeN7qR6Sla4LkRzE/htUDjGOOIrUwVAb3oSimfAdDJZCloCUNTdGurnYQLEfmOetYLMLecEGccskJm3JtSbgEzfAqJsPJMuVAg8H/u9WvrqppBnMDlSQWXj7jRTkd5a0p4DyaUtmjDHQXbKAJnv+dWzIVjxxp2L0qIbmx+nvFDS5BvnCcPnVNQSBoI4DaeA7hQGyrjjLwB394gPw==
Received: from DS1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::16) by
 SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 01:21:14 +0000
Received: from DSM2EPF00000011.namprd02.prod.outlook.com
 (2603:10b6:8:242:cafe::61) by DS1P221CA0025.outlook.office365.com
 (2603:10b6:8:242::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 12
 Nov 2026 01:21:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DSM2EPF00000011.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 01:21:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 17:20:54 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 17:20:53 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: Johnny Liu <johnliu@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] Add Tegra238 BPMP support and fix stale EMC clock rate
Date: Thu, 12 Nov 2026 01:20:14 +0000
Message-ID: <20261112012024.3947256-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102121202.2431928-1-johnliu@nvidia.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF00000011:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e4446f-2dcd-44c6-607f-08df405b3e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|36860700016|7416014|376014|82310400026|23010399003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZWKDG98suBjM+WQ0nRO9NFSoyH8qTUS30G0IStUU0JDNBvbqQJJ5wZ8PSYEokjkcZcz+gGtEOscMIXvq9xEDadcLIL6bDEt9ElMEfIzqJl5RfQu+AaShM9Iuea1pi4SFngfDNmEb1ER6OhdgbSQ2D96qrZ48+5aB05ELTVs7rsLPTda+E8fZ3gFDcfqDE/mxtDjUtsTY/mDEjp0XySJLL3gPGWf1DhXLEn5yLh2mEdctfY9vmuvbk4KNHvXGtpiUiLwvQa7g+TOzAoz1vlACPxRZt40yaQhpwb1q8CWDQucoiKQXkLvUoE2eE1p59zvLn69bmxW8XX3YMDiLO0/nO8+QDKHfT5HVikBexLO7gJEM6C5i3NqmBPqfS1TZ3fKuN2CbTIyhvOroUAB/11Qawb237Kio1A39dd8GeOYl4MhtmX/Vy8tXg7F6A/S8PDIEKy8UK9KDYg4LPuY45Oi260VnAqBchFsxd7+YsuFc3YpI65MMtKkUnkkUAA4ifDwLzostXHcU+O7V2jpLtdRHrpHfnJerjChE0B1DSJlLVFxyZRgJ1PnZFm1xUQNY59lSJ6JFkimuhSqmECXkY5QFoKfvedce6Lp7OFwvQLkNhDkY2L+DLxRda+kSl11BlaGnk3/rdin/P2txhIP7dXirPqk2VuPsPMcjPbV34gGyQ48fIM15lIE0vlGE1V/P+fPxdBuJ0lfoiBMNz+m1xWeWlg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(36860700016)(7416014)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t2KU3ahODeQ1VlBlh74ffxzveB4wSN+qVjjP10U3p3UFMOuoFXU7jZqimNBa+4mcaudsUm0BAXY0WN4tDCSavVGMw3TW3AUxoKYAxvPBamTofwjr99Kae4iKammaz3K9LW3AY5tRV/e0ijq6zmn41QlAQGNuJdRJhPoHpp+ud9JZwDXyvJbq/zUoEQ3D3N5X+oOoP1NvSJaH6IFKMxRHx91pYZRVqpHZjkTwsZXlXdk/VlYfRXn2fRL/QZwIzcnZbKbkBj4+/A2c3QqsqEmmMR7kqfH7EO6sxl8b2kIONKMz1z7pVq7uSAEf4gv2EJ8QUjbbU+YALNVC4fwJRt7RIh6RoCQv4sTDfE7+psQD2usGxexcw/R9j5iXD+WWsjjF5IcBDvIl/pqPlKyN9sfBEci6D7V30xgXYT9lPfZTmnMe/HBuKc7z2fg2fjfbA0QR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 01:21:13.7490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e4446f-2dcd-44c6-607f-08df405b3e26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DSM2EPF00000011.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

Gentle ping since I haven't received others' review for a week!

Just wondering if you’ve had a chance to look at this patch/series yet.

Thanks,
Johnny

On 2026/11/02 12:11, Johnny Liu wrote:

> EMC clock scaling is handled by the BPMP firmware without kernel
> involvement, so clk_get_rate() on the EMC clock can return a stale value
> cached by the common clock framework. This series makes the EMC clock
> rate uncached on Tegra234, Tegra238 and Tegra264, and adds the pieces
> needed to identify the EMC clock on each of these chips.
>
> The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
> TEGRA238_CLK_EMC=43, TEGRA264_CLK_EMC=290), while the
> "nvidia,tegra186-bpmp" fallback compatible and the tegra186_soc data are
> shared across several chips. To avoid detecting the chip at runtime, the
> EMC clock ID is carried in per-SoC BPMP data selected by the device tree
> compatible.
>
> Patch 1 adds the "nvidia,tegra238-bpmp" compatible to the binding,
> together with the Tegra238 clock ID header. Patch 2 adds an emc_clk_id
> field to struct tegra_bpmp_soc, together with dedicated SoC data for
> Tegra234 and Tegra264 built on a common TEGRA186_BPMP_SOC_COMMON
> initializer. Patch 3 adds Tegra238 support to the BPMP driver, including
> its own SoC data and EMC clock ID. Patch 4 then sets
> CLK_GET_RATE_NOCACHE on the clock matching that ID, so that the common
> clock framework forwards rate queries to the BPMP instead of returning a
> stale cached rate.
>
> The series touches both the clock and the firmware code. Patch 4 depends
> on patch 2, and patch 3 depends on patches 1 and 2, so I would suggest
> taking the whole series through the Tegra tree with an Acked-by from the
> clock maintainers.
>
> Changes in v3:
> - Move the TEGRA186_BPMP_SOC_COMMON refactoring out of the Tegra238
>   support patch and into the "Add per-SoC EMC clock ID" patch, as the
>   refactoring only makes sense together with the per-SoC emc_clk_id.
> - Keep all Tegra238 specific changes (Makefile, CONFIG_ARCH_TEGRA_238_SOC
>   guards, clock ID header include, tegra238_soc data and compatible match)
>   in a single "Add Tegra238 support" patch, and reorder it after the
>   per-SoC EMC clock ID patch.
> - Reword the "Add per-SoC EMC clock ID" commit message to describe the
>   intended use of emc_clk_id: the BPMP clock provider sets
>   CLK_GET_RATE_NOCACHE on that clock, as it is completely managed by the
>   firmware and the common clock framework must pass rate queries through
>   to get the latest rate.
> - No changes to patches 1 and 4 apart from the patch numbering.
>
> Changes in v2:
> - Squash "dt-bindings: clock: Add Tegra238 BPMP clock IDs" into
>   "dt-bindings: firmware: tegra186-bpmp: Add Tegra238 compatible".
> - Reword the binding commit message to state that the Tegra238 SoC is
>   fully compatible with the Tegra186 BPMP.
>
> v2: https://lore.kernel.org/all/20261028155000.1205739-1-johnliu@nvidia.com/
> v1: https://lore.kernel.org/all/20261028084900.1047287-1-johnliu@nvidia.com/
>
> Johnny Liu (4):
>   dt-bindings: firmware: tegra186-bpmp: Add Tegra238 BPMP
>   firmware: tegra: bpmp: Add per-SoC EMC clock ID
>   firmware: tegra: bpmp: Add Tegra238 support
>   clk: tegra: bpmp: Do not cache the EMC clock rate
>
>  .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
>  drivers/clk/tegra/clk-bpmp.c                  |   3 +
>  drivers/firmware/tegra/Makefile               |   1 +
>  drivers/firmware/tegra/bpmp.c                 |  61 ++--
>  include/dt-bindings/clock/nvidia,tegra238.h   | 279 ++++++++++++++++++
>  include/soc/tegra/bpmp.h                      |   1 +
>  6 files changed, 329 insertions(+), 17 deletions(-)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
>
> -- 
> 2.43.0
>
