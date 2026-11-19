Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071176;
	b=dfpPxQsAnk5VQP/vvjut8T0NXs4vUkEWIY7KRaBPuPlNBnRQv1ZwB3r8kF8Hes06sLOT
	 6yhkIHzMUtAHk9IjBBvYbaDUvDKVDV4QRNItacWtWCIGUdG+QXGZVTfS5ERU6jw3h3lZs
	 Gd3ssHL+qwKmYXmVvjMLDnRuOcaGX3i4suLAjgVr3TVDCNCpDW0/zYbJFA+buiQ7Ijh5C
	 FaEhGdoaq0L7dk5xPYmmoYhCPmA6rwii2u/fMNf0jeUNvkbsKt69+cqMaEKb7QZiUzFrt
	 bYepXXtUPmSphEWB5mrVMXTkAAORGS5f4xEvJ2dop736qa/GBn4UryqjwXqmLLnpOgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071176;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=a2Pax44gEuUq6TQPi/xNjqppIeEnWSQtARDas0QEE8k=;
	b=mOTDF/KjcKjEy7eg4AtRKWMZge5yKRAdKt2Nw+Ou0K3CxuxVrRcywkmNw/qFgh6uFxPE
	 KzrIPTYI41SeowYdMnD0dtDFUtRj9fPlX1mrdt4TL4djD2clqpaDb4T8S/Cf3dGfPUI7g
	 waNZDXYbsRKp8tSavfwRNTM2DludnnLlUcZkeSNt3Ly1tQ1Yf90umq666E5jlYNjRHW/w
	 qwP7+C0R7k+2w6aUEONT8YxEJ8n6Ym6XMEcBH259OTimtfsJzgldgVXPVzGNsBwy/MGNt
	 IWy/P65Z3DxERZe7p1moGclhgIUNGpd4UcwOwk3PuPTMhuy1uDCtagicwNNrP6q8lTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JRCxHVmd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D5606A320;
	Thu, 19 Nov 2026 06:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JRCxHVmd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAnylsQgeZHM2Qr4Y8vz7U7rm8C/o/u3D9SetqQQsisSYimFNX4AO3KbykLQEWHC0MMS5sMtX612H3jJQ+8WAjlAQIJ4LBMK+eHwkMfpirm+r/OSOjo/qpzXxMTpvBBEQLS6PsZWm0EBYvSdOtEZlVRfuxc7DekaOlzQZGlyBLGwFhilDAGWQgH+8W+WHN27PqXWYx/G4a1TkwaEmPhkMd4VD3XGVpuBgschiZY4SnZ1Tda6AFbAHufjc88sYaIriGeFyhPWy5z3saMZURpmUix7r+4VdF0tRMDNjQVnFF6T0zrjhAsXGgyd76Rg0qCa+qLNY5UVOjLP6CbsUk1XrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2Pax44gEuUq6TQPi/xNjqppIeEnWSQtARDas0QEE8k=;
 b=sVfiA24MW9j29ioFRQy4uwDqKuAisJMi0CbzjOZfvwcDF+GCBOYijcTIx0aVgfs+fsMyEC8e0M9pF8Kw/VMI2Bbiqb3dWIDLhuvVkST91om88Gst04C8aD/BV5yKUVaWfuOYXhPfvfMViPfLTW5/m0IzykRqAK7IynJpBRnrNdQyBBMaBhrgNnblrKVTiha4DcVBJOWaJvfg6xFqR/VqlYeRgn5S91UQKqbJe3YQjZLFx9atBIOKsq61W9WAkS8IJelp0lhItC9iltf1BH133hh4gG16NHVmhcTPWjgoUVHrqR+8JrSa5NPN4wwWk+BmugGX/vrXUsLHcIlJ1fVBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2Pax44gEuUq6TQPi/xNjqppIeEnWSQtARDas0QEE8k=;
 b=JRCxHVmdY0L5abmUfKJdnO6ZRpxM+3mV7ihxbWxlwF4qoICDGVeL7+gWj6t96Bgc2MLUS351NCT9vWUlCdKswdfYooJgUUlxzDvUDOp4LbZ0LHTPWKCM0NXpdOT4GiPpoy9ASvVJpfCY1D0cCUgfll3ANpFcgVHKfCwVPSvN6SOvse8LPjg776XMn59JMBcNAADpqdQ0s4xmvpdU2kIXTv+loJQAENzOBDB9pVBoiSN84A29whfFQcjh8qxIPQAW9RGTXdpjwAmsYQOTQJy5NbM0Y1lcxMw+Oa5tIV3Qrhcf+QtzB5c7iJDszMgrovXtxBH+U/FYEUnceaTm/ZS1yg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:52:51 +0000
Received: from LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725]) by LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:52:51 +0000
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
Subject: [PATCH v3 0/3] Add Tegra268 pinmux support
Date: Thu, 19 Nov 2026 06:52:46 +0000
Message-ID: <20261119065249.2425224-1-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:303:8f::34) To LV5PR12MB9803.namprd12.prod.outlook.com
 (2603:10b6:408:306::15)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9803:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: ef25fabd-cb02-44b5-3d3f-08df4609bac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009221227099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eWY3vMD/8EuQB8VcKWdm+Dgg8jySi8WsxKzp+Tvx9JipX6kKBzSZVLO0zxW8IKrvNGFzzptjTjALI5t3r8SMeMNzAhoq/wuU/tAhVzOZ8IoYnFZKBBWTcv+GgbAXFQMw57yPggyGdnPn8792NQr3CT/wVYWV4/2L173/c6FrV4JgwbirfdL5DQRv9Obg7iXZkAlhQetLHR13X8qBWeIXGcdO5gwe3aP85rIFpRvuGpytR/sIjSPYFTZSA+334sG9On1vHfpb/FdP4SRbYaGzzUwihh9JJI285EpYbn4Y/Ly6Y6M+8nlyRZpr5PuyKYxuCStKzrF8tQaJSIPUP7uFjaZe+3FpQaOX8wqJ9BLPKCvGHTGKHD/BwzrkJDs+6icfXfZ349ABVPGS8ZI6lQIhGnMM92asSVbfJqJkEZNYwvkrLnev6H2AVszu9gPAP088hSpseaDtvcenOajbRMTNGx/tMXftfv3TqEZ67l/d6QrSy0F5zy6Z4M/Q3aUq4ByQfgLmgt7uOSHbJxEiGpzChAXQoni3eqvHxsIXUf+VQEsz/DFL7FwgLwWgVBB6Tjg5fQ0UGavoW0plUz9xgUk2C2jdEP//iCIiIJisWX7cps0+o+Hbl6Zyxyf3pACQbSryOEB/ceooPHMyf2p+dgSDZzEfXhMqqrn+8dDdIm6ktPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6p7Yv0FqHIkadhOPoe7b7HVerhCPdOnmPYVPfbYc5ek/p5jJnoB2F3yCXnk?=
 =?us-ascii?Q?4EGRch18GbdVyg6qTcqO/ce26Jfchyl8vQ2iH2M2HWKsnsg///25WzcN6MwP?=
 =?us-ascii?Q?vj9qbWqZ3jc2VU42ZGeJyl3wsuBfConJSMYA3FJ8G1ja+kJxuMkFM/0BqmlR?=
 =?us-ascii?Q?YNst+r86NbP5sv6etQDQwApyRmCCBlqwa245Ko3XVrZs+FKprKWcRD7oD36I?=
 =?us-ascii?Q?kRelAFjUBAcx4d2TWxjfp4kFvzayKixyE0+MVyC+UWEEXkdemG5fnrUtJxYl?=
 =?us-ascii?Q?Fp1H54kftMHTJ/ANW1qDdd9X0piNiBhS8x9piYIWsN6uaYenyhxn8TWjtnf5?=
 =?us-ascii?Q?oCieKvJb4V8UhBy8PCGr5MobjER8gkfgDRpmIyuawaEKL9njrd91z1zvtBo+?=
 =?us-ascii?Q?5ZG2NmLof8CekKnMs6+faKa0dL2bkd7EWTBDhMNhaesrOM15pJZECOFPyuu1?=
 =?us-ascii?Q?sG+/nCHMySt5vCZhfjHT6WzxHP6eEd5s+uIMHsfIDMW+uolLabGkXVaAeNZh?=
 =?us-ascii?Q?wGoZcMQ/1oxCn0idjo58Zmhde12y8ZZUxnmPW71C8SgOFdT8hVEJfxUaGqH/?=
 =?us-ascii?Q?bQv+k8/eqxctZlh+OHEScfFnIOksGBJOASZsOxYBSFH3BMzXLLELsFmjfTlV?=
 =?us-ascii?Q?NDrd1FhyIVsZDd1L82xaIwYClSnwIQZUJpy74Vpjv84QPqCS7aCf7x9LCbFr?=
 =?us-ascii?Q?STCOO0YPfCofJRC/2CvbOZhkanrKx6bEXMpOkbooiJ66jur8UKCwMX13yhjQ?=
 =?us-ascii?Q?slsZZbd3ojZ1mOGdPQtfegWFrK630UYdo/aJiIXgHvRdgwCN+r7+NkcJogvJ?=
 =?us-ascii?Q?R79oKlWZAOIDaMANHY2BrpDDQlJLqMuLT7yAn95pM+UKwskaOSA4zQLedk2u?=
 =?us-ascii?Q?NglFQz9KdO+JxK7nU+dfSetGKMEboMPZmYO1e3ENm0yFYhDCDnGzrpZg51C9?=
 =?us-ascii?Q?1f7areQPYA4RSvZULvGxbGQir7V/1qMRPgbgx1S4Sp9jT9z8Ninw4a/cekOu?=
 =?us-ascii?Q?AiBL4HOe0sxdmOTlWdtnsYbE4UJLzufhFSljyfsJFO+YIFqt6gUj9U+mvGAk?=
 =?us-ascii?Q?9txcqM68QDnAEN4XT2FAAi9BD+BPUEXyRwe320GN2DUD0ST12LejKvaq/BkV?=
 =?us-ascii?Q?hQb//yDpI/EvI2igQd/oT4+SBe8iVSLzTm5rP4kyxrEXbdbmf4suEimFXwqY?=
 =?us-ascii?Q?jPFWDsj86VxLmLltAnlDCGLWdZD5+LKjM9q54hT7FylqPH9ewLWEHtluvKfh?=
 =?us-ascii?Q?FowoRqxTw1Hzu8/vjqFNmZviSu+4TUcpqfyFSgOtQ4HZGzM+9mViG8WohJyw?=
 =?us-ascii?Q?NT6w7AQ7Fftd0pTBTKVtr28xLaLin1DHXkqe5tqWHo5g1Ke9iTln+PcG15L6?=
 =?us-ascii?Q?+2mCAFxbwlVE/3bj0VwF/Cxe1Hrywg769cAtPa5lY6jxaYWo82szyWUhBWPo?=
 =?us-ascii?Q?ONuvP1maI5H8G63tZQWlVtvo8cMlgNkcf271qETmboBvpRoOyugA/6VyUXjx?=
 =?us-ascii?Q?ydW0P+Ny6FeTiyj3fsqL6PhbiYjqMQUoIREfgu4KsQdkcNgk1tCcjGf80sg5?=
 =?us-ascii?Q?fm0SNwRseFhDCZGk742fy/ZsMG3Rsi5Gy4iE1L9H9RvIumxoFkUn3noes7SM?=
 =?us-ascii?Q?pikD8uifDwUmXG97ziwW7kYh1zY+j9oEU9d4KlvB1nFU3ck96HLq8/EzGM0l?=
 =?us-ascii?Q?1B5FM1iTpfDB6PGW0CR2HWtRCdmjVv4OAjvc5d+PZajQD3sMdK3XKJOvva2P?=
 =?us-ascii?Q?cb4WohpGDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef25fabd-cb02-44b5-3d3f-08df4609bac1
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:52:51.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VF1diBj7vV6djA+joLptsJRMMZ9EkbQhm+GmnmJAZc7TaSXaVWMewGHMmKrrUs4nLEFwCnBJyg+vhgJXEwa/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

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

Changes in v3:
- Rebased on next-20261111.
- soc/tegra: Drop "depends on !CPU_BIG_ENDIAN", which has been removed
  from the other Tegra SoC symbols now that arm64 no longer supports
  big-endian kernels.
- dt-bindings: Drop the explanatory comment from the common binding
  (Rob).

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

v2: https://lore.kernel.org/all/20261014104210.3978188-1-praagarwal@nvidia.com/
v1: https://lore.kernel.org/all/20261004192921.2460405-1-praagarwal@nvidia.com/

Prathamesh Shete (3):
  soc/tegra: Add Tegra268 Kconfig symbol
  dt-bindings: pinctrl: Document Tegra268 pin controllers
  pinctrl: tegra: Add support for Tegra268

 .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |   78 +
 .../nvidia,tegra268-pinmux-common.yaml        |   64 +
 .../pinctrl/nvidia,tegra268-pinmux-main.yaml  |  136 ++
 .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |   75 +
 drivers/pinctrl/tegra/Kconfig                 |   11 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra268.c      | 1742 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    8 +
 8 files changed, 2115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra268.c


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0

