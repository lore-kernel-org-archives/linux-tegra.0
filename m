Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE983C3BF7;
	Sun,  4 Oct 2026 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142169; cv=fail; b=cqE1jIkjtWlSPoBBVqmCGIeQP7XDRd3tZmvaBfkjjj/gvepZcxQUdEa+NbTPmvAdT1yB4URPRSY2+exqzasoOtN6Iqvtmkgn4caqKsJ816FU4lWMSvvW6/T/uGcm7C5oEsqeBGSrNMiLnTnHURL1iBSV3odTUI3ETaoaCaztq6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142169; c=relaxed/simple;
	bh=Rq50fSboN41frkMMBkjV9T9dk+emTKq0AdhvHUyhZxk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HHuAffWRFenwHaZr6NItYyfUFacJX5kBjadP2zJb5iKxDS/Oi4oPKCjMRG8yW6CWimLycNVuFHt8IdqkXudaoz3VyhFsRo9oqZcWB/7cgH/D6kn1FiIHkc9p8piX0t70E3qBL8zk8Vu1nlle2FkPYjw/X6XvTfG9Qw/UqnED8HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r+Tiz0uE; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+Tiz0uE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCRhyNIKcJp5+7NF0Ijcte+j5CC7D3KBKEJNjqkraU8bvvIIq1lYqfQUwH+sI5FzmvJB863LS+wXrgJDV5FgCMVxJ4uA8qLHUa2vPPEF1fYhtBzSZAv0KsYXPdUaXx3zoSxE3cryFE8zIfcQKReeV4vT6mpaaWHvPJC3sIzc8lY4opQOqEVqZ0cprSPJjUGElY6qKAC5OaPYZhNfeer874eSsaknqFrIOMWMH518y7R+ZEKTwXNQdt4nc8fVbIPq+Xhf6cYuY+BtdHJwOy51u933UabuKJ7zObvfBLC28hpZ7plBV5FholuIVvQ0he7F/I8OaLxgey3LVc+2JnrLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIVSbRytsZYlb9sZarGz/ybKJJjNiG5EkgvgRnM+Ntg=;
 b=BeCMFNJIOuAgjthkyiQAERAo/6Ip7cdE548gLaskxq89IJhsnO4jLw2HEzHc6zP3Baxq9Eby5fN6MgmYTq6qnXCg8UDa7+RGzKJKTgp04C+6qXNnYidLqRHyePaDpgKFcww2oFhDkGR13K+AsV0dGsCZ0ABTmHgUUVZ7gKa3wwUxdUVNsie1Iath3DEKPkBLsAs9JBtKlbjCyYtzuBM6hKsp/E2VOaYRItMEJ/YrjsnqghWARZYEBmpqmcaKcM8qSqj6y7x1N4hJCnO4H6oeh6Sksyfy01kRGbRQlbbkTdMA0jYvY+w+xAPHwey+YaMJtlA5OJay6srxGO1UeMp7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIVSbRytsZYlb9sZarGz/ybKJJjNiG5EkgvgRnM+Ntg=;
 b=r+Tiz0uEvL7XmSIBYVMHJlTVwBJEDqBwSxH6cY8DSDvaXI9qODncK7DWE/AjNXT5A9eEurtQkDDXEwoeAGi/W0n0tl0l4QuvNPNelzZMf3fOTG9h62RaBcn6vCP06VsaIena0WEx9G3hPBOaYEUhIWfe2kYpKDqIW0i3pxAl5OjJXb2TV30xEr6B4m5WvX7WO6mCLV7Mv79RZDOlKr7Le8ACWMs/pO5SDm2plrmj1iZYRYfe+Abh1+q3fFTIXCcIy9az74Qh4ccWvBixKSEXpk3Ou9N9z/LHStlmbvQ0Xtp8R4Dx95eG9dvdRuwxMp+AbVkw1xFScnhW2LlVOkvIzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Sun, 4 Oct
 2026 19:29:22 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 19:29:22 +0000
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
Subject: [PATCH 0/3] Add Tegra268 pinmux support
Date: Sun,  4 Oct 2026 19:29:18 +0000
Message-Id: <20261004192921.2460405-1-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To CH8PR12MB9815.namprd12.prod.outlook.com
 (2603:10b6:610:277::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9815:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f0e9ed-018f-42af-d607-08df224dcae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HM4sPGkFYO6JrspnGOksxCXqjf0Mn5KMbvbm61/BAgrjYtKg6Z11chga2IdxxsE3GOCbyuSl/teoGbPpXeq/L7Mrswiu6SzumCNE//0cMPKx2tOkA0bwJ3l9z89G8Fviz/SitAKSey4CzmYxj5tdndkB9F9hgtNdc4FfLmA3q5JUZ/1/txwWKfHRTyrCm8skYZgpqIruHOMp014PgxQaU56kxDACZqQn6VLT/W7UJqM2t4F9I4CDESGCeh+eP6JpgcwheZL4zxdvGUagCOghROhUKC7+SuRuyVOclHK9aQXG9oRLgW6c5j00XZCRrOGL/lbGDC3hoozl8Wy87fK+1uZpyWtVB+6hzEoHjEE78maUnfJZatb/P4gj6djkHwbrnsv3Ej/9WSFfHn8MA/BI7tXVv8JPLXyIsAXi/OV0rTvbclN0sCbHdp546H11lNXGtLKt4lXAUqjwS/Vpwxerw4meEkyXg2V6nQKdhiVmNtHBi3LhWJdMUW9PC1XgJNcKEJ8kYgOoxDOvs0Ho96XuXKvmrAIlEKn0DhYkG5tJ4UHWfh25+zbrDpGrlTy+7hb3yXrt4nOabCqetx1Vi0lH9jAY5DR8yagPtTEM5Rn1IGl9Ua0XVPBSdOJR6UPZMB1B40+fjTDCvHjPDK9l+FvsE2d91agWZxlnkFu/6Dcbhro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bg1ibZFal9vEyOhMxT7lZHNv9AbBIkKIS1vjOSIhrC5CnyxlzSVVGmhKgD5D?=
 =?us-ascii?Q?1tzcIoKxMhRfi8raEWY2ekr1hHkuuwn41beojZ4cxGYkO2I3Xfrip4cbY4iS?=
 =?us-ascii?Q?80Z85RkxpW2DvaGFCfYNy8LloJZgaz+qpu8vzrTdGatg/yZLENRU1X9l4uyI?=
 =?us-ascii?Q?JewYKhssL8E5yM9v1rHneJUZoXXjZlDbM0b+MIz50jCrCcR9GpMDKz0hENP+?=
 =?us-ascii?Q?GHkrhl/W7WTqJm/2889hUmwcI08RqJgbdd8E0eDtL39Rx+sF6zZoP4Atk79G?=
 =?us-ascii?Q?7QRYh0quq7Mrwsf7WsM7wiPtUnvHwd8B2LpVDAhp0QrWEvPkVDSrGlXDENBt?=
 =?us-ascii?Q?L3wMQFKnVuHUccqC3VWU0UF/uQobUkCplq01MeMiLUfVQRUE/Q8u2oEZ+5Qf?=
 =?us-ascii?Q?nTKPHFw4H2jeQJ/NXqeQ2Xa4hV2AaQqm/UeQXR44Owd7L9UTBiH2YS2WixKf?=
 =?us-ascii?Q?wu6nq3EG26JET7TDHALPT7+dxei+Or1thQHlGekWFsP+aPCr0hesu0NtnSAR?=
 =?us-ascii?Q?XV0cPifSGNdxYvTWAgdTG1EBWJ3qhXx8pTjKIxJGbWobNlCWqcuVTS+uxD4V?=
 =?us-ascii?Q?1CCGmoeKKbxSkhXvqpIk5YSHNnt6HW6h4jRLrAqSnQe2qcq120eMNL+EXwAL?=
 =?us-ascii?Q?OkNZznzR33C2jwk/RjTO1v+7bplFwm3FGbQ5zIRbvM3VqyVU6yZ6R+2fClRy?=
 =?us-ascii?Q?yryT8/i5pyhkaJToDZ3/dM3AYpd6sg+ou7VCV+dq2t1BbATTNxMBX72cumjf?=
 =?us-ascii?Q?CgB3fxKGry6HHGIkkyiQdlPSoAxDotMNcdADNfS2WGwzgVHFVzZC94X/mAZY?=
 =?us-ascii?Q?Whkm1x+Y8QlmQ3wIvkBYm0tOocZBeTYnhnL3M5B+5oNh3gTM7c8bAzjHpZNt?=
 =?us-ascii?Q?BP9ElxdwK6nLQAS0hKb5DaAzZCIYD7EL4GahrE2eVgQyd8Wf6cAqlanFTLy7?=
 =?us-ascii?Q?JEV89lobhcZLGkxR6YH53IpNiT1utKCOX8vOteKlyW2bZ6F8hIB5I/3cYpKo?=
 =?us-ascii?Q?GRHqjoYLQF/m+YYmAZeiz31UiT0JaMvxCW2lbzEuUlFjqaT7a8Z1gZk7YURk?=
 =?us-ascii?Q?UIWjv+Bf3Ec9zGp2vxkPX5jBI/BJ+BMBm9tz9OYqxUcyMHcyvYMfA7+HBKg9?=
 =?us-ascii?Q?dNij3WpPIUZKVZwiWyuMR+q254VEg+kQeNV7/kZKW6OKKLrwQEGrU3btwoYa?=
 =?us-ascii?Q?JjEZHlFZfc60fqZotf9Uc0d1qF/17JrZeIM+yfaUGyfD3j3BUPPFmcBwKNDK?=
 =?us-ascii?Q?x7p9P3EpVxOD/R9c38M2tcJ2HcqeM/XSDjAec0mqiFELYRX0CVc01xWSrrKO?=
 =?us-ascii?Q?Em05cwpxGB/+cyFEcWzjzzX+5A4sy5+zlWRk3tb2BhPMPKL8Iufim0+wn+qh?=
 =?us-ascii?Q?X5cx//wZc5gTq+8JYB2863olOL+Q51KtI6SH9bn486eYE8GAMi5cIviwbBj8?=
 =?us-ascii?Q?ysuOwj6Wob08C0kO3QcMeBtqQkqBXKY1Y6fFWLBrndiiqvHHRpjGCFNOXUPn?=
 =?us-ascii?Q?9m/kbmAO5pD9nQm7lDcsUtYL127rifvqRK1XcYQEbxtBDnWQLr2SUmSUPjhz?=
 =?us-ascii?Q?h3h1aGW+BfdT1RY1i1xrUKzZvKu8MV7fSNz2D3jsdLCwKs6oZNXFv8OfeFet?=
 =?us-ascii?Q?BDziF1dIf1yRNlpG4VXirMRcn5TnFaqA0rEjzsy8Czj1NDbw2aC5VaP7td1n?=
 =?us-ascii?Q?R+Ni0T8N9k7shdhE08lPzXeYVqk2JK/OdqiYmuCr77l/pYsh24vb5z1jDZb4?=
 =?us-ascii?Q?BJZiuGogCQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f0e9ed-018f-42af-d607-08df224dcae2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 19:29:22.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVH31GjIIZ/IyqSF9HvWsrLIVITFSYdJFKxr+V3Sp0uOCLWH43bGmh3337JIIiMVdH74zxwJr/mF/6t8z6IL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299

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

Prathamesh Shete (3):
  soc/tegra: Add Tegra268 Kconfig symbol
  dt-bindings: pinctrl: Document Tegra268 pin controllers
  pinctrl: tegra: Add support for Tegra268

 .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |   78 +
 .../nvidia,tegra268-pinmux-common.yaml        |   84 +
 .../pinctrl/nvidia,tegra268-pinmux-main.yaml  |  136 ++
 .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |   75 +
 drivers/pinctrl/tegra/Kconfig                 |   11 +
 drivers/pinctrl/tegra/Makefile                |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra268.c      | 1944 +++++++++++++++++
 drivers/soc/tegra/Kconfig                     |    9 +
 8 files changed, 2338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra268.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.17.1

