Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795759355;
	b=wicHXAGjA3zwL8VxjIWxgidcemKslQGNATtemqx4YZoFdFFZf17m2HeGf/dSNxBnqj6T
	 hPjt1L50GH7y0m855CNPz0XTCCHo9lhPuh0u02z1hnvp9MiZZ+IlxitDnyGOtU598QdMq
	 7uNsqG2sA+Io/nL6IU+OBw6XZOvJxKEzz1zcFF3L64c/MGfkCaej2kwEP4157tI0W0fbM
	 emFRqoogBP7MaCFcDzVhIufivQX6StPfkeldrZbT2Q4YnraVhp6iX45vAeL63//piJTAr
	 Cn8lb9YI/C+uxFQ7u086ylequzDLuNpd9CfCXzOwLsjQlsTbzynZRD8k5l4fu6UEUjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759355;
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
	bh=+kG+vTfSoUTCqGX0NynFm/0zMdnz0VnEjiPkxHMRkKY=;
	b=EppDnlAvM/iYIY6omW992D1CuJl0uxN8kpBRv2FQdvtW8ZZNcyE5vpgWvyr+aTheMzW9
	 8utAKEATvzLLo1G/H+BsKkNf3fUKHGz+d+ljZzckaXsWWq1r4/UEYxkYxwCH4H7YelsI2
	 F4GCAHtQpaZqDxxw784IpHI5bdHciyGBgrs5g/xOYOQAMa7dVMisYueGmH7aqjWMX36Vx
	 0rzO17PONwutcM99f9oO3sa1ocq13Zm++dg3DWbWNtDYxv3ZvZFLJS6Vs1Mo+RTlo2fCd
	 H23fLml5naDDXDXkhxuaBYdDlbRU6qvHhKHpLNQYIuZ+VEXe+rZ4KYN4ot6x1/JWAOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J8fD9MdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.15
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011015.outbound.protection.outlook.com [52.101.57.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE2C606A31C;
	Fri, 27 Nov 2026 06:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J8fD9MdS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuyiH5ZQyHRZIOie6vP/t9jQHFvRdPBhqz5Kv6+ER2iFKEFnuCkpXRB5HuRUhHqd3EibdscEWfvlG60rZpxrBPN/Qrh19rNboUYssFkurZOd8s3q90R1/UrGVtKyouP6BHwGPoX+GtQ+5b4q08F/2Y3gUAgQ3KyChyy6O9YBYHGKR6VYp60vNbkiSpRJcXniftWCV+UnAttSBRNZRJ14z6QM3GCph/LWYALXgGwXXtIrIfdAtFOpiIynvXWqWgckqlApCgMQF9Ra2oPBShE3YeR3xOapnSDu4dXBWnImARG2P6RaRge93V3sIJ9BqldWt7HMZ/fzeKoxRUWihS23eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kG+vTfSoUTCqGX0NynFm/0zMdnz0VnEjiPkxHMRkKY=;
 b=pD/98PsqIQPI/D3fw3Eg4BqQFSl1DB+PyT49RX+HiuemQdRRhHkuHpdRaNC88GDZlNYEV/j+s4S6tFQorKReecqIhfUaEAReDVi/RXR6rydngbDQmV6eaIeRpihfOYl1VAlx7KkiTcThYwTIs7jwKSbof15T8SqS3m9u3QDoHzonM1aVs6EIuRolPqrFHn2FRJD1py6OmIClc8SEP/kgmwcCuzjxfdrGr8OjaUP+XPrXfxV70NHjFXD/mODGO+/AUsiZlonnICguJ2FTGcJC83Cm7panlD7hyh9nU9AWLUbYxGsvA9KLGY4Ao1+qH9NIxGHiWmdd9+tS0Mbg7GSkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kG+vTfSoUTCqGX0NynFm/0zMdnz0VnEjiPkxHMRkKY=;
 b=J8fD9MdSjH3D3dbdWWR2VWP9RqpTZqFiqYD1+9bsc19jsoHzjmn7mVXl3DFALTPLJ+dk+Eze1DnbHI3ljWlpMYG3f+hqlgZBOiXbDThMa+2rVU+X38v8pVzo76Q/HKQ3RsfdwnEolNhGGEue9FBjF49ZzArqN8VUKEsVATO06YAfbY83ndlS+iXjCAgGfVrmsKlX4GmLCnuWEf7ctXI5sA70q5N6Cq4s53KvdTyNuQ/qqQbDa2TD1qDswtSEDsyVqsL4aWxD0nhlhGINvgN+9FWsP3N1+ktbDnk4pb2EedWqZnytBjxERRHquVb6Pbnl0B4BjtwcSP1wbqpqtDivdg==
Received: from SJ0PR13CA0194.namprd13.prod.outlook.com (2603:10b6:a03:2c3::19)
 by CH8PR12MB608111.namprd12.prod.outlook.com (2603:10b6:610:704::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 06:02:28 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::90) by SJ0PR13CA0194.outlook.office365.com
 (2603:10b6:a03:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5 via Frontend Transport; Fri, 27
 Nov 2026 06:02:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 06:02:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 22:02:06 -0800
Received: from build-johnliu-noble-20261009.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:02:05 -0800
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
Date: Fri, 27 Nov 2026 06:01:44 +0000
Message-ID: <20261127060150.3436267-1-johnliu@nvidia.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|CH8PR12MB608111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3015abea-b561-4f7c-361b-08df4c4c0420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|11063799006|261009223027099003|18002099003|22082099003|13003099007|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	h1BjuThPIrOFPWK/1abC80eieTugNa+LwSUN3XIMeFxvDttLPaoesrN7oDQtko8Z7lh1z57q3WXYiwjuYPWLNzL2fvDihYM1T4NI0MHrXeOaInJ2SggI9qA+6lFLI+Gxkr714tuGeSL4kqUMk5wMvaghG7IS0VEh09EeldLFyA6p0DB7hQtw4TF5NZTpjg847VksXDRpecjbR/cfUb2/pE+i0zjFntFUvBd8Zsdk3USqwyKGqy8n231hRQAejAKC0vzzsPVz3tPdJInUQLw6rTXlchwta7UxMGfbvYYNs0OU3VbX/mJT70YAfQ1aypxtRsdhRSGvHDas61M2p8sidaTuQDLEJfdlJvK3ILGSCnIzxkhGdc55WIvMMNlpx9tGL3WlkqM+7u5G8kn3VFWPtrMsrRJ1OBbMlzHf9nclwLAsMgi7zBGexZcR3g6SinNKm+jXCw7pB0v9CutpbGSrQOpbgEasfAArfOMN2XXxzoMw7aV6Oz6QNSZQEHjjO4TjwSQuJlmXXalijygSDZ2JEOvPB8qdmYdEwdxrHjWQ4EC9VXknInw2ALvvDpADn/vNNmxxHrowrJAKLsapt8Be+rj6NPY9QXsQzRxI36Gv8uO8GEA+ZMpSr4RVXwNFMRnuEJFLRa11Q/EqnuZ0lpl2HqDCvNpzVI54kxHyRodPtB45i4/qD8qZYV7KaE1HHsJEvxr668OlRKezkki2ls1mkg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(11063799006)(261009223027099003)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ShwQAi2I2qqaYDZrH2epp4YWFJgALi2SJXt80iP0wAw/60mST3Bn1J6FjWzRhjyjCLydv9H0pm8fZyVWkhSwyMvHHzAcyvz+9etFfWIkymJ8LvSpHSJ/mtaxKOD6QNrNBkuAH7B0CqeGZ1PKAFb3lCU0aYM+Sld8Oe7fnIT2dtSuzXo8DnNzCJ7OsOq19CVXJGIKEubRPulfffmKJcMK2mg404xT2rmt1GysRffv1xQE4MI7GdxIe7iXit53FOCZ4iSN/zQxjqrPrUMgaM3zs1lgCd2qkJbiZ5U7SQZJVF3HyJI6ntdnQvkNkVOrNGZp6cngR5orO/Ebh2cXdeysyZKRaJJs2SKGR1xn6KnFWktHAZNjWhEzzARquzm4aSPwSgBkVUWypgHXx4K726tb2+4+0J2g/Yn5ZuurC7yUc+E8ak4ciVYyITCb4G8sS1os
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:02:27.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3015abea-b561-4f7c-361b-08df4c4c0420
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB608111

Gentle ping for the review. I haven't received acknowledgement or feedbacks for 2 to 3 weeks at least.

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
