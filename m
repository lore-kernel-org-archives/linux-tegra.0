Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301A15665C;
	Wed, 14 Oct 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974537; cv=fail; b=aurn+JBs9bgmeVBxXWsTElTbnigqLyZ759BumkC1ePuEAdHuNEoDpjcssRCnCeiPqLKNN0FUB09ygGGEmAuj4UJ7nhSq3GS+PGLsJPej+eRvndb22lEoOEeDX+cNwOORooj+pygsef18hDubSTlnggesBO1Bm+ZUtYxkm+Uz/eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974537; c=relaxed/simple;
	bh=VfRSUAiXRs6LHfHH6weACkBOvY56g6cQ3ihXtmSJ2iY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lGac5IVKv62mUAgiGekArAKAkG/4tqreUnXynC75OLXNflgYC48uBfB6X13w9K+2fQozUNvD7cDLzf4KVxgqkBXKA+AxsVgALuUgsv6rk2XuxZhnZPd5dJQ10RAq2OpRSTbQe3xwnJRmzQOiHMioQbXs5PLNe8yXVUPl06CWdJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VZxeXZvA; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VZxeXZvA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhJbhu2Nb1mRe16xN+mmVscCAjHO/QY6F4Y1RLoDMx1NM1abF0v2kGF8G6Jqyel74KFURtDknqefwZvNRACyV4TSRCaVXCdykwPaqmxESEwmkh4dBBZVQHWA2ON4oNF1lVLpgEqDiYj4Ymxzdxc69LPU3G96GxKFiFvwfllEj1qRJDpHvi6lrn9/XldUAvtu5wFXar/SNS/Zg4QDA8kvNaH2e5caBZSARKVgvE+xfWNsrI/i4NPmwWJq5Og0YSeRJUGn6PESj3zCLLTjhRkG+B9hKAfuHfdbiEMCd7JWoS+a7+piaklscuxyZLZMExc0tIJvlWWCi+OgiU8Jt9onBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mklzf6cCG5l82v7ND8AputH9w3boMVSFPEXk2y39YfQ=;
 b=u7ebqYha6l/lSVzFWjzZHJQ7LTko+ok/iztAth5UOVTygwZpFqppRZRToJeLWO+g8MDnznm8WslrkEtT2OXLfbEMDrays4KQLygG91MguzjBwUf9h6B2ls6hsPJ4qk6QpkFUPxcBZQSZVS5tgoQrJ+ef5RWCitA0z7dsylqvQbNkoaxRoByx8JpB+Q8YyyZHrB7PP5m5ybDXH7QX4ZQwwaQGyvKwKq4kV5OUlRgUMWphL2p4FwlPCvN68cPjCpk4xtRraeXSyDhqjPpR79izV8OgbzPyOxj71It2bgHISb/XeSUQuS51CjgsugK3xY0o6fi3D43xRxZ5a2dZw9AR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mklzf6cCG5l82v7ND8AputH9w3boMVSFPEXk2y39YfQ=;
 b=VZxeXZvALWtDJ8Nt5f0eNgwFSjlQxyZTfm1UPa50PqHnRkh1xMHHesObOUZ/Oo0ITX+7ebx8iuz6JZDrRhaf7mGoYjmjuYwk9bEt9tj2hJFp9MhgaJTOOF506ggqIFxFaxk9sHnx6ihRSbSVlIVc5VP+6zC0vaJHGbuaH/NbkQNaoskmxYlBBsdt3Q/fZ5LjCSPnI4lQBrG0x/ROepiI2dm1lZTB52jHd6M809RSo3Cb/QBt4RANrLJXin+oasnj6cg05dapvqVG+upHYcwtquwQ2Si/L7gm3zfspRxJnN6ud2AErufKk7pxf+cwp8k6Q7LwbGqA6EeuIctqA1NTdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Wed, 14 Oct
 2026 10:42:12 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 10:42:12 +0000
From: Prateek Agarwal <praagarwal@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Prateek Agarwal <praagarwal@nvidia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add Tegra268 pinmux support
Date: Wed, 14 Oct 2026 10:42:07 +0000
Message-Id: <20261014104210.3978188-1-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To CH8PR12MB9815.namprd12.prod.outlook.com
 (2603:10b6:610:277::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9815:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: e1748e4b-a508-4e1b-5f7c-08df29dfce19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	orABZbImrvJNFx7owdJfcP4BmU9yM7Orq+Y6RYoX3EJZfV37lj4J5dZKMre7t97H0x58uMU9ED8+AdV/EeR672NN/fVWnlIevF/0xYEcd1lSza5nZCnLojnHz1/wZ6rGvNPS/tOCVb2G2kSgqXlZN+fXI5PhKFxJSJdglZA7LaBThKhubr3xYdRr2ZW5xd7GeMUQgLosaBIMrcWy//+o5OThSnmQdVAQYW4RruhBO4rbh/0otCXHlaxGBqRZqIRK+9LwlXfnmoY3oZ0nXK+iQgSgGIYlu00VzXIBrpWC7uWpTl/jWD0J6DFJ9f2BDJZ3EXggzL8xGeijj8PHvb8I4monGiyIvbFfsXS92udpruZSHxiU6v5ong3zHdpOLrlEUX5dUaVyZNauiiEVedsjbVyTRjyrhCpms93Jf8x1X34wd3MVYyl78soyvBoujoPMf/1+EhrXHqn0CEbGaIWDNozmPh/4aF2Ko9PwMN8ygvbKJPOgn2R6cKdNLycxRmUZzxSPnwAzc1r2OfFlhEHZZftiPxSFQXCz4/euO7svHH8vb/HhikTzFb8bHSX0k30vjCDgPLDmtolZjLyKfSVn0cAl0lYioIZ2ctpoq8OBYbnbBs38U7WDumjGP1nE/AuuwmPfqdzg3oXd8LX9bb4oxSSiXGEeGc37NscSZcxsYfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yJV2KK0s+JWoHzJK8WjeINsSyvPJ68BaPyarMGUYIzbh3/i/11JO82c30kPJ?=
 =?us-ascii?Q?v8+867ELGAQLf83A3t2mLlUQVE4/VRUsOXaayTsOS4+nAgdHbXJaduzPv1+9?=
 =?us-ascii?Q?ZO4ETDR+JH3QXvBRv6fEKCVVehnGsw/d/PS//Az8TrxhR5lfpJktaw9E7atT?=
 =?us-ascii?Q?bqfKLzy4SdF2nHTGtBRn69fepmk9oOr232QvJ+3COFYRtnTEfjhVp/Rkjw3I?=
 =?us-ascii?Q?YMAhYB6IeP2PADnsvPR7DVZYyVa4kVMbMlG4ytsXuonxMNcbXja+76OtWGEM?=
 =?us-ascii?Q?1PdN3D4wmXN5lQkuvmlEvf3mv2Adqup9G2BeQxhkPdyd6hNkIYIpwB0Vg5TD?=
 =?us-ascii?Q?3IerXaj6zjZZFP+2omJtGm2kjLeyOSsRr+DqO9qQpI3qIwz2UG8197vQ2qAB?=
 =?us-ascii?Q?cqEk5rX4YgXsywu7ODrk1BHB7XGTnLbv8RyLjthxjtBMTTt1GHnEU7zrZGCL?=
 =?us-ascii?Q?/nu8WU7WyzIcAY5awQ0d8e6clUoNLSh6ZV5yDtccz5TOTEO/VurzqtnLIk3Y?=
 =?us-ascii?Q?e+99sFIKWzbglNv6oRRmLVJ6lEkdwr8wnIANASF9hEQ0CwwW8ppSGah7vC52?=
 =?us-ascii?Q?u6ufiODGnJNOvKjZwRhwpgRFvqIJmuxJ1ZhNvIvTTS0cGGYbpOsqMmaJCFEb?=
 =?us-ascii?Q?AiCfD4tIaWMrjm0aw7s+pNet3bafDJvyByw9z7Ouz/91E8+sJse+y+5rVYLv?=
 =?us-ascii?Q?zcYZEIDVjYRlVzB9BFpbthxecUPFxfTF9LleXVvWpXW1JenQsQ0/wPb5wvwO?=
 =?us-ascii?Q?wfA3lg4upPV+aDAAqA1ypwCqhyNRUWyLMX/Kms5oMr/vUdkZle/elGhcLyqH?=
 =?us-ascii?Q?CXEj2oiAuSpDzJXLbaHXmWxz8ufQ/hDqlrB6f27fSzBswM7KikkpdUeL+zTp?=
 =?us-ascii?Q?Fg4PpLVTsVgE4wBEkWn3rvzUSkFKPOkiAJKa1M3DmS6WuvhbY11eyr6lb7he?=
 =?us-ascii?Q?t5O8zUTC2K6TXGn4izIEvi5fgQaqZ5RL4co10Y4w0a+6QQYpLFiSkOKA4+Ii?=
 =?us-ascii?Q?BjKDy3HMOlNh3B+gqfaVwlKoXbXECaz6ecGAtBdTguvr94dxy08FrabVFWPp?=
 =?us-ascii?Q?TV6z2IM+HAqWI4MfoGlkGG+SIsEi7nbSDxICVIO3OW282kJ5nxMJnW8qaeeU?=
 =?us-ascii?Q?3xAE4LK0djhPZ2h9+ze9UIryGbhrhq52JjyfwNtnR/PjVpN0MR9KwlgRHU++?=
 =?us-ascii?Q?bsvRj8Di4e2FVEv8tvOzMk5YoCr0K5+nwCI513ktE/SHJatL3LHJCAsUjo4D?=
 =?us-ascii?Q?PH9PFiJX0Uv0ZDfmkQNmVMn10wzb6Rtd3rJDwl9h3R1qcA0ghBHvO0I6NfO9?=
 =?us-ascii?Q?SVEVIpUGMcVuLX4SlhApSdvCp3+0G+BF6BvHlAxCSRBw5tdtkbBwuoImUogr?=
 =?us-ascii?Q?NNy6hkeEEJL/eRkXx/yYSNHUVih0djU69UE298M0L63pL4y7gXZHJNrUX0Sr?=
 =?us-ascii?Q?SSZDTnMK2X9V/WfMJXqM3aLbG3NQLX78Ow47FSi2HDvWDPvKFMfp/8Xt8n7d?=
 =?us-ascii?Q?rabY0aqWKJfqiCpgFzWC2wbFzJ2VZZ9fz7ED0Au3pSmM5QrX6aaepbmh3L/h?=
 =?us-ascii?Q?L0VLEz6M9pgtY6mSbR79oAgidZYKrwm5KlWxmJY6NJOqI/GxJq6hPnDLvuRw?=
 =?us-ascii?Q?4syfs2ZETWg1TtOHtU29Mj5//nT19TIH0XnIpOx22idsYwpN6nEj+LKyGJ5m?=
 =?us-ascii?Q?LkPDLEW8TUCnQ3hwfTBKbFcFHEVRR8Ij/V1gfyxVEYXtDLeSxUzjLgqYADsW?=
 =?us-ascii?Q?OWjuDqEnlA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1748e4b-a508-4e1b-5f7c-08df29dfce19
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:42:12.3443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fKgomdoskRzZTOw11goEVDAWEK8C4LGdrQJwPEtsawKkK8aEb3gWdB0/Z+AyTQ/78ezursAsJcupkDW+WEUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

This series adds pinctrl support for the three pin controllers (MAIN, UPHY
and AON) found on Tegra268. The pin, function and pin group data is
self-contained in the new driver.

Patch 1 adds the ARCH_TEGRA_268_SOC Kconfig symbol. This symbol gates the
Tegra268 specific support code, and PINCTRL_TEGRA268 in patch 3 uses it as
its default. It is kept as a separate patch because drivers/soc/tegra is
merged through the Tegra tree rather than the pinctrl tree.

Patch 2 documents the three compatible strings and describes the pins and
functions they provide. Patch 3 adds the driver and the PINCTRL_TEGRA268
Kconfig symbol.

Patches 2 and 3 build without patch 1. PINCTRL_TEGRA268 only references
ARCH_TEGRA_268_SOC in a "default m if" expression, and Kconfig treats an
unknown symbol in that position as false, so the driver simply defaults to
off if patch 1 is not present. Patches 2 and 3 can therefore be applied to
the pinctrl tree independently of patch 1, and no temporary build break
occurs if the trees are merged in either order.

There is no Tegra268 device tree in the tree yet. The device tree nodes for
these controllers will be posted together with the Tegra268 device tree
once that work is ready. If it is preferred that the bindings land
alongside their first consumer instead, patch 2 can be held back and
reposted with the device tree.

Changes in v2:
- pinctrl: Mark open-drain, io-reset and rcv-sel as unsupported (-1) in
  every pin group. They previously defaulted to 0, so setting one of these
  parameters wrote bit 0 of the mux register and changed the selected
  function instead of being rejected.
- pinctrl: Remove pin, drive group and function definitions for pads that
  do not exist on Tegra268.
- pinctrl: Return -ENODEV from probe if no match data is found.
- dt-bindings: Drop the functions that no Tegra268 pin group provides, and
  rename the example node to match the pin it configures.

v1: https://lore.kernel.org/all/20261004192921.2460405-1-praagarwal@nvidia.com/

Prathamesh Shete (3):
  soc/tegra: Add Tegra268 Kconfig symbol
  dt-bindings: pinctrl: Document Tegra268 pin controllers
  pinctrl: tegra: Add support for Tegra268

 .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |   78 +
 .../nvidia,tegra268-pinmux-common.yaml        |   72 +
 .../pinctrl/nvidia,tegra268-pinmux-main.yaml  |  136 ++
 .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |   75 +
 drivers/pinctrl/tegra/Kconfig                 |   11 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra268.c      | 1742 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    9 +
 8 files changed, 2124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra268.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.17.1

