Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071184;
	b=NzCBBktEE9dJVg4ogcZkWKmLcBxDp5jBSE+OBe3EFtQKKFWURZf2X2GDsMZRB9XyBSSA
	 c4D0zNJ4R2jijs8URuVhIa+c/8OImYhMBDKyg+7rYBKhTwFpE5neBBPPhU9/BQudQz3wA
	 FghJycd178r2LTlR3YuSyORhW3Hql9/6z04O8S7qaa6RCpKkRQGskUI6B/LXYsG3jXu+N
	 BZEc0cvc+tJXHbsXeFx5mKszPL9zAv+yGZxi9e4HBbWBhJlqdxqKfsc1nyaDavhoofdir
	 xcFhoYoT7VKWLlN5+MjjUNiEtsRNKQYXDr6oUr8gr2RIhfvgLkz6QDsEjg408nieRPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071184;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2o+rSxBXFIphuX/eGYDk8dBoVdEZjiDs5yvI787ySGc=;
	b=fEhV2Cxh4+PVpwDQj1f7OMVHa56XhVWMJ32KfQk79QHUIWMrU/lmLI0T83uo8ZhwrkkF
	 UDWvbr/cTzvQYeJ+HNQ2sqJa3iMqUgm7oeh8ExEsIkwQ5iakSbWmQg+EDtCs+Bw5yBykP
	 iNtMmcf09nxcgKAj8yzhw/7evmXMKl57zPGYrQdVioxGY7raZMhhPvRtj/7Th+6x/gZ1j
	 pbgyW5Ae7Fhvx8Lyq1UnPIxv26Ks2713PK5GMqN5Tdf2IDP4EqL4SumBNr/VNrbQ7Rz/Y
	 X3F7mm4LWcFGrxHm1tymT/fpRKC4O6T9qTt476xZM5wI+gsy4Su/iC5zPcL82jDUmNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GITzNkm5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.46
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29660A262B;
	Thu, 19 Nov 2026 06:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F29660A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GITzNkm5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVx9mPE7zZDsOeaS7z8SAzQ8PjbvSDPV4C9EkjMsZxhrNSAi8agWn537haof3zPFL6KnxsnRvL20o9tr+ejRIL5efSCGs59GL/6VXnCMGI2JWDfNnRnmOHrB6k7w7qMnyrugIIsal4MSiMZYCtwOoXgD0w2BxrOSEUrdHw6qDHC1IhOIs+qHjD5X1O86l4c9YYJhDrLxzxYpqap60qy2SyCMuBtHkkqKdRQS9VjSMW2j/y84gHrjj3GEK/qd5LskNwvgNMs2u+7Mw72kZFo6pZFZCYMq7NvbP4t/pqSYEs37dmFg7BgZUhl+x4LqpSYeU0AYdFd4GQ0g8nRZ/nCfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o+rSxBXFIphuX/eGYDk8dBoVdEZjiDs5yvI787ySGc=;
 b=tDqMin7OLRywIBSnRhECv3VJg+/Qnk3mhlcWUU0S/RK+zOi2Le09U0I3c6cQSp8SxeRqNJCe+FsDv0EjdK5ZDbUzzl5u9c0Kc4HlXylmb6By1VrCdQdG5hbDJVEINaRj4jN93xAMZOiuNt8a1j15YdMRXlelMn3cf3exrQqLBlS3bKewSc4UxQC4bvfiygCZJCjq0reNwYC++SjvBQYS77Uh2cMm9FziJdKEc9IjeudsexroxePIsXWC1nAi3GVzIj6Z2Twuc0KRaFTG5lFlJdKzHZRupwnLBOKup7JUgTYGFGxhMmeZ6y8dWEh9uq/If2UU7LQ+T4hnvWARRj8WXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o+rSxBXFIphuX/eGYDk8dBoVdEZjiDs5yvI787ySGc=;
 b=GITzNkm5XrmKJCFAtkdHck7I/jONIgb3G9tTA2hvElw9o2cg+QgJvAHJM59Duyv5r4T40PRTBq7M7RgDXsNsFZ4r6oet3G/OhbCYLyB9bwS1uX1YGXLiRE/u5Ob2DBtyx8V3A8UV7j0VkNAa89tJfpiD+t1sD5aHEjyJH8VMy1kINRvuMOAhnrckPxznCq19M7cOzc23Gv06pXd7VYiweWBYd1BR8e6PYHXmKLGWcAi8oZ4uYvAYqWJfSbg0JVhRvTCiZT69Udf+HyCbeTvFCTwyPv1IiYq/RXvI8dW5OH5u+Gn2K5r95iYZ/hRDMwDPF8FSzj207mHvv5k6GI5Wxg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9803.namprd12.prod.outlook.com (2603:10b6:408:306::15)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:52:57 +0000
Received: from LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725]) by LV5PR12MB9803.namprd12.prod.outlook.com
 ([fe80::8385:c5ab:1034:e725%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 06:52:57 +0000
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
Subject: [PATCH v3 3/3] pinctrl: tegra: Add support for Tegra268
Date: Thu, 19 Nov 2026 06:52:49 +0000
Message-ID: <20261119065249.2425224-4-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119065249.2425224-1-praagarwal@nvidia.com>
References: <20261119065249.2425224-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To LV5PR12MB9803.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5cc8c4b0-f49f-426e-3923-08df4609be6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|261022075727099003|261022113327099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZNl2xKfF8JteuHHmhMPkE4WLcIKKYe+tTNT+6HFR4SW3UbcCIsn4tfluI0giy95C28vLJtkUXSINgULOQuHIED27XSlvvuCKl/6TYffFrFWD1PZrHfjaQu/ecdbjG08MH9uOgH+pbm1aG4flj8bocvWfc2GYT2n9ucEfEpAhVFwwCLLVNFh2Sa3A2QscOZERdwYWFrS3RCka4grw6d7/jMVG+tYlKQPdddreo7NVhBTIKiRRgEDtk+6lwlNnq+rqOrZl4dx3E9t5scud5CMcROCQiubYsc8Mb1WRz3QhQ6Hsl7/rze6CT9ZagFiAzdz9cF1iOhe0KEuNtUVVhQbu48jP2aQMi94lFuiE6wi8ZDCGb+9Mj98eZBY76zp6mtot7/LXRMjtfh5q5Ruof22tJ3sr2fMGgCnObXFBw8iBw5OhVV++NSSx506C7Zo+IyjPRoN2iRYAPFuLGRb/Jvrp2o6CoMdTff6wEbjA0y1nP9ioGPaBhG9jU0hE0mKv/m56JsXckLyPL4xy2vq/t3S/i6jlYa25vlDtFxDxCiH6lzazqysdiucBGe2TuK2kHB5I7NHUM55TkMyPXG9ZO/A2jIG5xLEg2bAPXUrYWtlAiRoMADKbKvRWTpS/fxac3pKeiE2xt/kA9plOyS+1exu82ZJJvtHNkDAgR+5xw2AwuHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9803.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(261022075727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W0t6RjXe2ofjmi/I5kdPC7Rga6j95FQluf9ZYYNrcHO8mhx4sq564z4bWp3K?=
 =?us-ascii?Q?MNQiZsW9sjJuYtZDBreBIrD9xpaj8MOZ2C8j9DxPLpMgqC7Jzlu+d9c5BB3T?=
 =?us-ascii?Q?52yZ2akwxExZSSdIL6xV7/55j20rUgao7uvu7qZ79bwrnYaa8YOvIQqGm5tH?=
 =?us-ascii?Q?qjKkpzd2H8Y5oUBGyte0zQ4eJzJvqz+zToeccQgFD0xA3WbNBpPc5DKQtDXx?=
 =?us-ascii?Q?bFfCl403CKvz++wtzq4QdV1GCLxdsggt4mQ7cLKe1GA2h8NVLNWo7f9PK2iI?=
 =?us-ascii?Q?KmjYBFnYxRTGNiPa95i+hVL7i5DEpuwUc7d2RLHiCds9NUJapzYe13CJhw1o?=
 =?us-ascii?Q?xTgH2XmsSlFtoDb9RjH/smGOO8JU/0vQeSrjdAkXAbDnJ4LZCzTotIFlRzjj?=
 =?us-ascii?Q?GYflWmXEb01iV/09gRiuE02HsKUPRjpf4tnJxwCahvUcWRjnlCkiNyl19TU/?=
 =?us-ascii?Q?VrHNAR83yVMvazSy4UmDvg3m+hwB3HfjghOfg40Ax6DtRna+diuLUHAvz5b2?=
 =?us-ascii?Q?03G4iXQSmo6U3+2BBusUUMmPEC07XYpN3/D44K0KFupmDD8cEZo8Z8jemA5X?=
 =?us-ascii?Q?myU2TscBJeCyZoX0pGlgNJ8Ve5/swOZUsuW1lV1fPv06S+TU3ThdBybARsnm?=
 =?us-ascii?Q?qU/Cp8Ta4iCoYl71ATlt+QMniIcIm9zRegaI9iO6wLOM4k/wgsbTZMgCfO2+?=
 =?us-ascii?Q?WamAJpviN8MQMldoT3sW66wcuKx5JwNawr3aWqHW8zoPxvcTD2AD0OliI68A?=
 =?us-ascii?Q?n0etoq7tDD0d47S8+mVKGk4WnlUR68CeuJjyKhjjymPKJQ1t2diIn/PKk0Ks?=
 =?us-ascii?Q?Oa3Y4AsidAFyyiF8tbTMMhkIPXIzJvzGgan4wOtB9bR0SoOcY21Rm+cmU2uk?=
 =?us-ascii?Q?DU7/26YzIvkwPR7MSnsbJMQfAwk9SPed7XrYJ8R8UFINEWvSCAli32RqzNXI?=
 =?us-ascii?Q?SOI50W57XIXpW/LYW5bw2wfMM7iTuPO02HhvQKRY9GUnjBn1tWibL7o41U+k?=
 =?us-ascii?Q?5NOwIln6d7AxKhfMmHIfbNFFAu2M9D0VHbm4sVlzdvUvzp/Ggpzf3PmyQBd5?=
 =?us-ascii?Q?lwlNAQnI1skNnT76VphYXMJWArDt/IfqhUyfH0CDZPrcmkGVt2eHL28vymqE?=
 =?us-ascii?Q?yXiav3xFbiNR7zXJGDugzNC7461+Gvj2jTdawn6TN51W2bEYo0MXiS0lYQSh?=
 =?us-ascii?Q?0A9dA+tppLXSuwCle7HB63PrltwtAxXHZJEoNCEHSNZKruoMD94w4p7enHL1?=
 =?us-ascii?Q?0G3goZOZDEyqPAw9Tc1RhqXGpEA3p0GU+v9ViHadGA1qaoiu8SMysOuM12E7?=
 =?us-ascii?Q?VoxcGlDbzDJ4q1/ZybbJdHhUdXJ/k9acN26jzGPuHro3yqoVP93fZdO0MxR1?=
 =?us-ascii?Q?//EhIFia7Ez7GeXS0wNjBdxPBGtGLdERC15pkuqe2BY/KwO+CNnemE7sIqp5?=
 =?us-ascii?Q?9+pYbCeyR+2Hk1qkaJCRc2EUJLk5z3MAYQV+mxaZY5Rb6PsmQeZ5H3bGFE3g?=
 =?us-ascii?Q?X8XN5vZ/aFmgXR/0Fn9QtEqVhdXh5xf3KKXBSq29uwE5XLUn9a8VHXfXMu/l?=
 =?us-ascii?Q?1SCmGjf4Wjr16Lt3BipDWxajsXGaInHsKchGXbrgzReGB1q3FqMKV2XE/Upg?=
 =?us-ascii?Q?wVbN2/Rq+47F/fPnyPKlw4iDSaBz41jmK8AdTqyKBRm0pH/JbIr2l3DaDzXm?=
 =?us-ascii?Q?288E7TMF1cfUIQfkbbu6SysnKrenqmr4xenYBrviBzs0urhB9cmi2GqqMuzq?=
 =?us-ascii?Q?hXDrhPTzVw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc8c4b0-f49f-426e-3923-08df4609be6c
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9803.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:52:57.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63We4JhasVS/vxpa11yfucHdcDIHohcNl/6M0VImARwqhJiMdJCFZokEo2glMGjwTYgEXgQSrSYK/ifZV0NLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

From: Prathamesh Shete <pshete@nvidia.com>

Add Tegra268 pinctrl driver supporting MAIN, AON and UPHY pin controllers.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
---
 drivers/pinctrl/tegra/Kconfig            |   11 +
 drivers/pinctrl/tegra/Makefile           |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra268.c | 1742 ++++++++++++++++++++++
 3 files changed, 1754 insertions(+)
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra268.c

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index 39a93733efa2..21fe02f5e443 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -59,6 +59,17 @@ config PINCTRL_TEGRA264
 	  and configuration for the MAIN, AON and UPHY pin controllers found
 	  on Tegra264.
 
+config PINCTRL_TEGRA268
+	tristate "NVIDIA Tegra268 pinctrl driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	default m if ARCH_TEGRA_268_SOC
+	select PINCTRL_TEGRA
+	help
+	  Say Y or M here to enable support for the pinctrl driver for
+	  NVIDIA Tegra268 SoC. This driver controls the pin multiplexing
+	  and configuration for the MAIN, AON and UPHY pin controllers found
+	  on Tegra268.
+
 config PINCTRL_TEGRA_XUSB
 	bool "NVIDIA Tegra XUSB pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	default y if ARCH_TEGRA
diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
index 71ade768bf9c..2b84aca0e267 100644
--- a/drivers/pinctrl/tegra/Makefile
+++ b/drivers/pinctrl/tegra/Makefile
@@ -10,4 +10,5 @@ obj-$(CONFIG_PINCTRL_TEGRA194)		+= pinctrl-tegra194.o
 obj-$(CONFIG_PINCTRL_TEGRA234)		+= pinctrl-tegra234.o
 obj-$(CONFIG_PINCTRL_TEGRA238)		+= pinctrl-tegra238.o
 obj-$(CONFIG_PINCTRL_TEGRA264)		+= pinctrl-tegra264.o
+obj-$(CONFIG_PINCTRL_TEGRA268)		+= pinctrl-tegra268.o
 obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra268.c b/drivers/pinctrl/tegra/pinctrl-tegra268.c
new file mode 100644
index 000000000000..19f591061ec4
--- /dev/null
+++ b/drivers/pinctrl/tegra/pinctrl-tegra268.c
@@ -0,0 +1,1742 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Pinctrl data for the NVIDIA Tegra268 pinmux
+ *
+ * Copyright (c) 2026, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "pinctrl-tegra.h"
+
+/* Define unique ID for each pins */
+enum {
+	TEGRA_PIN_PEX_L4_CLKREQ_N_PD0,
+	TEGRA_PIN_PEX_L4_RST_N_PD1,
+	TEGRA_PIN_ETH0_MDIO_PD4,
+	TEGRA_PIN_ETH0_MDC_PD5,
+	TEGRA_PIN_ETH2_MDIO_PE2,
+	TEGRA_PIN_ETH2_MDC_PE3,
+	TEGRA_PIN_PEX_L1_CLKREQ_N_PB0,
+	TEGRA_PIN_PEX_L1_RST_N_PB1,
+	TEGRA_PIN_PEX_L2_CLKREQ_N_PB2,
+	TEGRA_PIN_PEX_L2_RST_N_PB3,
+	TEGRA_PIN_PEX_L3_CLKREQ_N_PB4,
+	TEGRA_PIN_PEX_L3_RST_N_PB5,
+	TEGRA_PIN_SOC_GPIO113_PB6,
+	TEGRA_PIN_SOC_GPIO114_PB7,
+	TEGRA_PIN_SGMII0_SMA_MDIO_PC0,
+	TEGRA_PIN_SGMII0_SMA_MDC_PC1,
+	TEGRA_PIN_PEX_WAKE_N_PC2,
+	TEGRA_PIN_PWM1_PA0,
+	TEGRA_PIN_PWM6_PA1,
+	TEGRA_PIN_PWM7_PA2,
+	TEGRA_PIN_PWM8_PA3,
+	TEGRA_PIN_UFS0_REF_CLK_PA4,
+	TEGRA_PIN_UFS0_RST_N_PA5,
+};
+
+enum {
+	TEGRA_PIN_SOC_GPIO250_PF0,
+	TEGRA_PIN_SOC_GPIO251_PF1,
+	TEGRA_PIN_SOC_GPIO252_PF2,
+	TEGRA_PIN_DP_AUX_CH0_HPD_PF3,
+	TEGRA_PIN_DP_AUX_CH1_HPD_PF4,
+	TEGRA_PIN_PWM2_PF7,
+	TEGRA_PIN_PWM3_PG0,
+	TEGRA_PIN_GEN7_I2C_SCL_PG1,
+	TEGRA_PIN_GEN7_I2C_SDA_PG2,
+	TEGRA_PIN_GEN9_I2C_SCL_PG3,
+	TEGRA_PIN_GEN9_I2C_SDA_PG4,
+	TEGRA_PIN_SOC_GPIO124_PL0,
+	TEGRA_PIN_SOC_GPIO125_PL1,
+	TEGRA_PIN_FAN_TACH0_PL2,
+	TEGRA_PIN_SOC_GPIO127_PL3,
+	TEGRA_PIN_SOC_GPIO128_PL4,
+	TEGRA_PIN_SOC_GPIO129_PL5,
+	TEGRA_PIN_SOC_GPIO130_PL6,
+	TEGRA_PIN_SOC_GPIO131_PL7,
+	TEGRA_PIN_GP_PWM9_PM0,
+	TEGRA_PIN_SOC_GPIO133_PM1,
+	TEGRA_PIN_SOC_GPIO178_PV0,
+	TEGRA_PIN_UART4_TX_PV2,
+	TEGRA_PIN_UART4_RX_PV3,
+	TEGRA_PIN_UART4_RTS_N_PV4,
+	TEGRA_PIN_UART4_CTS_N_PV5,
+	TEGRA_PIN_DAP2_CLK_PV6,
+	TEGRA_PIN_DAP2_DIN_PW0,
+	TEGRA_PIN_DAP2_DOUT_PV7,
+	TEGRA_PIN_DAP2_FS_PW1,
+	TEGRA_PIN_GEN1_I2C_SCL_PW2,
+	TEGRA_PIN_GEN1_I2C_SDA_PW3,
+	TEGRA_PIN_GEN0_I2C_SCL_PW4,
+	TEGRA_PIN_GEN0_I2C_SDA_PW5,
+	TEGRA_PIN_PWR_I2C_SCL_PW6,
+	TEGRA_PIN_PWR_I2C_SDA_PW7,
+	TEGRA_PIN_SOC_GPIO139_PP1,
+	TEGRA_PIN_DAP4_SCLK_PP6,
+	TEGRA_PIN_DAP4_DOUT_PP7,
+	TEGRA_PIN_DAP4_DIN_PQ0,
+	TEGRA_PIN_DAP4_FS_PQ1,
+	TEGRA_PIN_SOC_GPIO152_PQ6,
+	TEGRA_PIN_SOC_GPIO153_PQ7,
+	TEGRA_PIN_AUD_MCLK_PR0,
+	TEGRA_PIN_SOC_GPIO155_PR1,
+	TEGRA_PIN_DAP1_SCLK_PR2,
+	TEGRA_PIN_DAP1_OUT_PR3,
+	TEGRA_PIN_DAP1_IN_PR4,
+	TEGRA_PIN_DAP1_FS_PR5,
+	TEGRA_PIN_GEN11_I2C_SCL_PR6,
+	TEGRA_PIN_GEN11_I2C_SDA_PR7,
+	TEGRA_PIN_SOC_GPIO351_PS1,
+	TEGRA_PIN_QSPI0_SCK_PT0,
+	TEGRA_PIN_QSPI0_CS_N_PT1,
+	TEGRA_PIN_QSPI0_IO0_PT2,
+	TEGRA_PIN_QSPI0_IO1_PT3,
+	TEGRA_PIN_QSPI0_IO2_PT4,
+	TEGRA_PIN_QSPI0_IO3_PT5,
+	TEGRA_PIN_SOC_GPIO192_PT6,
+	TEGRA_PIN_SOC_GPIO270_PY0,
+	TEGRA_PIN_SOC_GPIO271_PY1,
+	TEGRA_PIN_SOC_GPIO272_PY2,
+	TEGRA_PIN_SOC_GPIO273_PY3,
+	TEGRA_PIN_SOC_GPIO274_PY4,
+	TEGRA_PIN_SOC_GPIO275_PY5,
+	TEGRA_PIN_SOC_GPIO276_PY6,
+	TEGRA_PIN_SOC_GPIO277_PY7,
+	TEGRA_PIN_SOC_GPIO278_PZ0,
+	TEGRA_PIN_SOC_GPIO279_PZ1,
+	TEGRA_PIN_XHALT_TRIG_PZ2,
+	TEGRA_PIN_SOC_GPIO281_PZ3,
+	TEGRA_PIN_SOC_GPIO282_PZ4,
+	TEGRA_PIN_SOC_GPIO283_PZ5,
+	TEGRA_PIN_SOC_GPIO284_PZ6,
+	TEGRA_PIN_SOC_GPIO285_PZ7,
+	TEGRA_PIN_SOC_GPIO286_PAL0,
+	TEGRA_PIN_SOC_GPIO287_PAL1,
+	TEGRA_PIN_SOC_GPIO288_PAL2,
+	TEGRA_PIN_CPU_PWR_REQ_PH0,
+	TEGRA_PIN_GPU_PWR_REQ_PH1,
+	TEGRA_PIN_SPI3_SCK_PH6,
+	TEGRA_PIN_SPI3_MISO_PH7,
+	TEGRA_PIN_SPI3_MOSI_PJ0,
+	TEGRA_PIN_SPI3_CS0_PJ1,
+	TEGRA_PIN_SPI3_CS3_PJ2,
+	TEGRA_PIN_UART5_TX_PJ3,
+	TEGRA_PIN_UART5_RX_PJ4,
+	TEGRA_PIN_UART5_RTS_N_PJ5,
+	TEGRA_PIN_UART5_CTS_N_PJ6,
+	TEGRA_PIN_SPI1_SCK_PJ7,
+	TEGRA_PIN_SPI1_MISO_PK0,
+	TEGRA_PIN_SPI1_MOSI_PK1,
+	TEGRA_PIN_SPI1_CS0_PK2,
+	TEGRA_PIN_SPI1_CS1_PK3,
+	TEGRA_PIN_EXTPERIPH1_CLK_PK4,
+	TEGRA_PIN_EXTPERIPH2_CLK_PK5,
+	TEGRA_PIN_GEN12_I2C_SCL_PK6,
+	TEGRA_PIN_GEN12_I2C_SDA_PK7,
+};
+
+enum {
+	TEGRA_PIN_SOC_GPIO00_PAA0,
+	TEGRA_PIN_VCOMP_ALERT_PAA1,
+	TEGRA_PIN_AO_RETENTION_N_PAA2,
+	TEGRA_PIN_BATT_OC_PAA3,
+	TEGRA_PIN_BOOTV_CTL_N_PAA4,
+	TEGRA_PIN_POWER_ON_PAA5,
+	TEGRA_PIN_HDMI_CEC_PAA6,
+	TEGRA_PIN_SOC_GPIO07_PAA7,
+	TEGRA_PIN_SOC_GPIO08_PBB0,
+	TEGRA_PIN_SOC_GPIO09_PBB1,
+	TEGRA_PIN_GEN2_I2C_SCL_PCC0,
+	TEGRA_PIN_GEN2_I2C_SDA_PCC1,
+	TEGRA_PIN_GEN3_I2C_SCL_PCC2,
+	TEGRA_PIN_GEN3_I2C_SDA_PCC3,
+	TEGRA_PIN_GP_PWM4_PCC4,
+	TEGRA_PIN_UART0_TX_PCC5,
+	TEGRA_PIN_UART0_RX_PCC6,
+	TEGRA_PIN_SPI2_SCK_PCC7,
+	TEGRA_PIN_SPI2_MISO_PDD0,
+	TEGRA_PIN_SPI2_MOSI_PDD1,
+	TEGRA_PIN_SPI2_CS0_N_PDD2,
+	TEGRA_PIN_SOC_GPIO21_PDD3,
+	TEGRA_PIN_SOC_GPIO23_PDD5,
+	TEGRA_PIN_SOC_GPIO24_PDD6,
+	TEGRA_PIN_SOC_GPIO25_PDD7,
+	TEGRA_PIN_SOC_GPIO26_PEE0,
+	TEGRA_PIN_SOC_GPIO27_PEE1,
+};
+
+static const struct pinctrl_pin_desc tegra268_uphy_pins[] = {
+	PINCTRL_PIN(TEGRA_PIN_PEX_L4_CLKREQ_N_PD0, "PEX_L4_CLKREQ_N_PD0"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L4_RST_N_PD1, "PEX_L4_RST_N_PD1"),
+	PINCTRL_PIN(TEGRA_PIN_ETH0_MDIO_PD4, "ETH0_MDIO_PD4"),
+	PINCTRL_PIN(TEGRA_PIN_ETH0_MDC_PD5, "ETH0_MDC_PD5"),
+	PINCTRL_PIN(TEGRA_PIN_ETH2_MDIO_PE2, "ETH2_MDIO_PE2"),
+	PINCTRL_PIN(TEGRA_PIN_ETH2_MDC_PE3, "ETH2_MDC_PE3"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L1_CLKREQ_N_PB0, "PEX_L1_CLKREQ_N_PB0"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L1_RST_N_PB1, "PEX_L1_RST_N_PB1"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L2_CLKREQ_N_PB2, "PEX_L2_CLKREQ_N_PB2"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L2_RST_N_PB3, "PEX_L2_RST_N_PB3"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L3_CLKREQ_N_PB4, "PEX_L3_CLKREQ_N_PB4"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L3_RST_N_PB5, "PEX_L3_RST_N_PB5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO113_PB6, "SOC_GPIO113_PB6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO114_PB7, "SOC_GPIO114_PB7"),
+	PINCTRL_PIN(TEGRA_PIN_SGMII0_SMA_MDIO_PC0, "SGMII0_SMA_MDIO_PC0"),
+	PINCTRL_PIN(TEGRA_PIN_SGMII0_SMA_MDC_PC1, "SGMII0_SMA_MDC_PC1"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_WAKE_N_PC2, "PEX_WAKE_N_PC2"),
+	PINCTRL_PIN(TEGRA_PIN_PWM1_PA0, "PWM1_PA0"),
+	PINCTRL_PIN(TEGRA_PIN_PWM6_PA1, "PWM6_PA1"),
+	PINCTRL_PIN(TEGRA_PIN_PWM7_PA2, "PWM7_PA2"),
+	PINCTRL_PIN(TEGRA_PIN_PWM8_PA3, "PWM8_PA3"),
+	PINCTRL_PIN(TEGRA_PIN_UFS0_REF_CLK_PA4, "UFS0_REF_CLK_PA4"),
+	PINCTRL_PIN(TEGRA_PIN_UFS0_RST_N_PA5, "UFS0_RST_N_PA5"),
+};
+
+static const struct pinctrl_pin_desc tegra268_aon_pins[] = {
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO00_PAA0, "SOC_GPIO00_PAA0"),
+	PINCTRL_PIN(TEGRA_PIN_VCOMP_ALERT_PAA1, "VCOMP_ALERT_PAA1"),
+	PINCTRL_PIN(TEGRA_PIN_AO_RETENTION_N_PAA2, "AO_RETENTION_N_PAA2"),
+	PINCTRL_PIN(TEGRA_PIN_BATT_OC_PAA3, "BATT_OC_PAA3"),
+	PINCTRL_PIN(TEGRA_PIN_BOOTV_CTL_N_PAA4, "BOOTV_CTL_N_PAA4"),
+	PINCTRL_PIN(TEGRA_PIN_POWER_ON_PAA5, "POWER_ON_PAA5"),
+	PINCTRL_PIN(TEGRA_PIN_HDMI_CEC_PAA6, "HDMI_CEC_PAA6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO07_PAA7, "SOC_GPIO07_PAA7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO08_PBB0, "SOC_GPIO08_PBB0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO09_PBB1, "SOC_GPIO09_PBB1"),
+	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SCL_PCC0, "GEN2_I2C_SCL_PCC0"),
+	PINCTRL_PIN(TEGRA_PIN_GEN2_I2C_SDA_PCC1, "GEN2_I2C_SDA_PCC1"),
+	PINCTRL_PIN(TEGRA_PIN_GEN3_I2C_SCL_PCC2, "GEN3_I2C_SCL_PCC2"),
+	PINCTRL_PIN(TEGRA_PIN_GEN3_I2C_SDA_PCC3, "GEN3_I2C_SDA_PCC3"),
+	PINCTRL_PIN(TEGRA_PIN_GP_PWM4_PCC4, "GP_PWM4_PCC4"),
+	PINCTRL_PIN(TEGRA_PIN_UART0_TX_PCC5, "UART0_TX_PCC5"),
+	PINCTRL_PIN(TEGRA_PIN_UART0_RX_PCC6, "UART0_RX_PCC6"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_SCK_PCC7, "SPI2_SCK_PCC7"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_MISO_PDD0, "SPI2_MISO_PDD0"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_MOSI_PDD1, "SPI2_MOSI_PDD1"),
+	PINCTRL_PIN(TEGRA_PIN_SPI2_CS0_N_PDD2, "SPI2_CS0_N_PDD2"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO21_PDD3, "SOC_GPIO21_PDD3"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO23_PDD5, "SOC_GPIO23_PDD5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO24_PDD6, "SOC_GPIO24_PDD6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO25_PDD7, "SOC_GPIO25_PDD7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO26_PEE0, "SOC_GPIO26_PEE0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO27_PEE1, "SOC_GPIO27_PEE1"),
+};
+
+static const struct pinctrl_pin_desc tegra268_main_pins[] = {
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO250_PF0, "SOC_GPIO250_PF0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO251_PF1, "SOC_GPIO251_PF1"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO252_PF2, "SOC_GPIO252_PF2"),
+	PINCTRL_PIN(TEGRA_PIN_DP_AUX_CH0_HPD_PF3, "DP_AUX_CH0_HPD_PF3"),
+	PINCTRL_PIN(TEGRA_PIN_DP_AUX_CH1_HPD_PF4, "DP_AUX_CH1_HPD_PF4"),
+	PINCTRL_PIN(TEGRA_PIN_PWM2_PF7, "PWM2_PF7"),
+	PINCTRL_PIN(TEGRA_PIN_PWM3_PG0, "PWM3_PG0"),
+	PINCTRL_PIN(TEGRA_PIN_GEN7_I2C_SCL_PG1, "GEN7_I2C_SCL_PG1"),
+	PINCTRL_PIN(TEGRA_PIN_GEN7_I2C_SDA_PG2, "GEN7_I2C_SDA_PG2"),
+	PINCTRL_PIN(TEGRA_PIN_GEN9_I2C_SCL_PG3, "GEN9_I2C_SCL_PG3"),
+	PINCTRL_PIN(TEGRA_PIN_GEN9_I2C_SDA_PG4, "GEN9_I2C_SDA_PG4"),
+	PINCTRL_PIN(TEGRA_PIN_CPU_PWR_REQ_PH0, "CPU_PWR_REQ_PH0"),
+	PINCTRL_PIN(TEGRA_PIN_GPU_PWR_REQ_PH1, "GPU_PWR_REQ_PH1"),
+	PINCTRL_PIN(TEGRA_PIN_SPI3_SCK_PH6, "SPI3_SCK_PH6"),
+	PINCTRL_PIN(TEGRA_PIN_SPI3_MISO_PH7, "SPI3_MISO_PH7"),
+	PINCTRL_PIN(TEGRA_PIN_SPI3_MOSI_PJ0, "SPI3_MOSI_PJ0"),
+	PINCTRL_PIN(TEGRA_PIN_SPI3_CS0_PJ1, "SPI3_CS0_PJ1"),
+	PINCTRL_PIN(TEGRA_PIN_SPI3_CS3_PJ2, "SPI3_CS3_PJ2"),
+	PINCTRL_PIN(TEGRA_PIN_UART5_TX_PJ3, "UART5_TX_PJ3"),
+	PINCTRL_PIN(TEGRA_PIN_UART5_RX_PJ4, "UART5_RX_PJ4"),
+	PINCTRL_PIN(TEGRA_PIN_UART5_RTS_N_PJ5, "UART5_RTS_N_PJ5"),
+	PINCTRL_PIN(TEGRA_PIN_UART5_CTS_N_PJ6, "UART5_CTS_N_PJ6"),
+	PINCTRL_PIN(TEGRA_PIN_SPI1_SCK_PJ7, "SPI1_SCK_PJ7"),
+	PINCTRL_PIN(TEGRA_PIN_SPI1_MISO_PK0, "SPI1_MISO_PK0"),
+	PINCTRL_PIN(TEGRA_PIN_SPI1_MOSI_PK1, "SPI1_MOSI_PK1"),
+	PINCTRL_PIN(TEGRA_PIN_SPI1_CS0_PK2, "SPI1_CS0_PK2"),
+	PINCTRL_PIN(TEGRA_PIN_SPI1_CS1_PK3, "SPI1_CS1_PK3"),
+	PINCTRL_PIN(TEGRA_PIN_EXTPERIPH1_CLK_PK4, "EXTPERIPH1_CLK_PK4"),
+	PINCTRL_PIN(TEGRA_PIN_EXTPERIPH2_CLK_PK5, "EXTPERIPH2_CLK_PK5"),
+	PINCTRL_PIN(TEGRA_PIN_GEN12_I2C_SCL_PK6, "GEN12_I2C_SCL_PK6"),
+	PINCTRL_PIN(TEGRA_PIN_GEN12_I2C_SDA_PK7, "GEN12_I2C_SDA_PK7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO124_PL0, "SOC_GPIO124_PL0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO125_PL1, "SOC_GPIO125_PL1"),
+	PINCTRL_PIN(TEGRA_PIN_FAN_TACH0_PL2, "FAN_TACH0_PL2"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO127_PL3, "SOC_GPIO127_PL3"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO128_PL4, "SOC_GPIO128_PL4"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO129_PL5, "SOC_GPIO129_PL5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO130_PL6, "SOC_GPIO130_PL6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO131_PL7, "SOC_GPIO131_PL7"),
+	PINCTRL_PIN(TEGRA_PIN_GP_PWM9_PM0, "GP_PWM9_PM0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO133_PM1, "SOC_GPIO133_PM1"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_SCK_PT0, "QSPI0_SCK_PT0"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_CS_N_PT1, "QSPI0_CS_N_PT1"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_IO0_PT2, "QSPI0_IO0_PT2"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_IO1_PT3, "QSPI0_IO1_PT3"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_IO2_PT4, "QSPI0_IO2_PT4"),
+	PINCTRL_PIN(TEGRA_PIN_QSPI0_IO3_PT5, "QSPI0_IO3_PT5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO192_PT6, "SOC_GPIO192_PT6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO178_PV0, "SOC_GPIO178_PV0"),
+	PINCTRL_PIN(TEGRA_PIN_UART4_TX_PV2, "UART4_TX_PV2"),
+	PINCTRL_PIN(TEGRA_PIN_UART4_RX_PV3, "UART4_RX_PV3"),
+	PINCTRL_PIN(TEGRA_PIN_UART4_RTS_N_PV4, "UART4_RTS_N_PV4"),
+	PINCTRL_PIN(TEGRA_PIN_UART4_CTS_N_PV5, "UART4_CTS_N_PV5"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_CLK_PV6, "DAP2_CLK_PV6"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_DIN_PW0, "DAP2_DIN_PW0"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_DOUT_PV7, "DAP2_DOUT_PV7"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_FS_PW1, "DAP2_FS_PW1"),
+	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SCL_PW2, "GEN1_I2C_SCL_PW2"),
+	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SDA_PW3, "GEN1_I2C_SDA_PW3"),
+	PINCTRL_PIN(TEGRA_PIN_GEN0_I2C_SCL_PW4, "GEN0_I2C_SCL_PW4"),
+	PINCTRL_PIN(TEGRA_PIN_GEN0_I2C_SDA_PW5, "GEN0_I2C_SDA_PW5"),
+	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SCL_PW6, "PWR_I2C_SCL_PW6"),
+	PINCTRL_PIN(TEGRA_PIN_PWR_I2C_SDA_PW7, "PWR_I2C_SDA_PW7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO139_PP1, "SOC_GPIO139_PP1"),
+	PINCTRL_PIN(TEGRA_PIN_DAP4_SCLK_PP6, "DAP4_SCLK_PP6"),
+	PINCTRL_PIN(TEGRA_PIN_DAP4_DOUT_PP7, "DAP4_DOUT_PP7"),
+	PINCTRL_PIN(TEGRA_PIN_DAP4_DIN_PQ0, "DAP4_DIN_PQ0"),
+	PINCTRL_PIN(TEGRA_PIN_DAP4_FS_PQ1, "DAP4_FS_PQ1"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO152_PQ6, "SOC_GPIO152_PQ6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO153_PQ7, "SOC_GPIO153_PQ7"),
+	PINCTRL_PIN(TEGRA_PIN_AUD_MCLK_PR0, "AUD_MCLK_PR0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO155_PR1, "SOC_GPIO155_PR1"),
+	PINCTRL_PIN(TEGRA_PIN_DAP1_SCLK_PR2, "DAP1_SCLK_PR2"),
+	PINCTRL_PIN(TEGRA_PIN_DAP1_OUT_PR3, "DAP1_OUT_PR3"),
+	PINCTRL_PIN(TEGRA_PIN_DAP1_IN_PR4, "DAP1_IN_PR4"),
+	PINCTRL_PIN(TEGRA_PIN_DAP1_FS_PR5, "DAP1_FS_PR5"),
+	PINCTRL_PIN(TEGRA_PIN_GEN11_I2C_SCL_PR6, "GEN11_I2C_SCL_PR6"),
+	PINCTRL_PIN(TEGRA_PIN_GEN11_I2C_SDA_PR7, "GEN11_I2C_SDA_PR7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO351_PS1, "SOC_GPIO351_PS1"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO270_PY0, "SOC_GPIO270_PY0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO271_PY1, "SOC_GPIO271_PY1"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO272_PY2, "SOC_GPIO272_PY2"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO273_PY3, "SOC_GPIO273_PY3"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO274_PY4, "SOC_GPIO274_PY4"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO275_PY5, "SOC_GPIO275_PY5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO276_PY6, "SOC_GPIO276_PY6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO277_PY7, "SOC_GPIO277_PY7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO278_PZ0, "SOC_GPIO278_PZ0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO279_PZ1, "SOC_GPIO279_PZ1"),
+	PINCTRL_PIN(TEGRA_PIN_XHALT_TRIG_PZ2, "XHALT_TRIG_PZ2"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO281_PZ3, "SOC_GPIO281_PZ3"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO282_PZ4, "SOC_GPIO282_PZ4"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO283_PZ5, "SOC_GPIO283_PZ5"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO284_PZ6, "SOC_GPIO284_PZ6"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO285_PZ7, "SOC_GPIO285_PZ7"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO286_PAL0, "SOC_GPIO286_PAL0"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO287_PAL1, "SOC_GPIO287_PAL1"),
+	PINCTRL_PIN(TEGRA_PIN_SOC_GPIO288_PAL2, "SOC_GPIO288_PAL2"),
+};
+
+static const unsigned int soc_gpio250_pf0_pins[] = {
+	TEGRA_PIN_SOC_GPIO250_PF0,
+};
+
+static const unsigned int soc_gpio251_pf1_pins[] = {
+	TEGRA_PIN_SOC_GPIO251_PF1,
+};
+
+static const unsigned int soc_gpio252_pf2_pins[] = {
+	TEGRA_PIN_SOC_GPIO252_PF2,
+};
+
+static const unsigned int dp_aux_ch0_hpd_pf3_pins[] = {
+	TEGRA_PIN_DP_AUX_CH0_HPD_PF3,
+};
+
+static const unsigned int dp_aux_ch1_hpd_pf4_pins[] = {
+	TEGRA_PIN_DP_AUX_CH1_HPD_PF4,
+};
+
+static const unsigned int pwm2_pf7_pins[] = {
+	TEGRA_PIN_PWM2_PF7,
+};
+
+static const unsigned int pwm3_pg0_pins[] = {
+	TEGRA_PIN_PWM3_PG0,
+};
+
+static const unsigned int gen7_i2c_scl_pg1_pins[] = {
+	TEGRA_PIN_GEN7_I2C_SCL_PG1,
+};
+
+static const unsigned int gen7_i2c_sda_pg2_pins[] = {
+	TEGRA_PIN_GEN7_I2C_SDA_PG2,
+};
+
+static const unsigned int gen9_i2c_scl_pg3_pins[] = {
+	TEGRA_PIN_GEN9_I2C_SCL_PG3,
+};
+
+static const unsigned int gen9_i2c_sda_pg4_pins[] = {
+	TEGRA_PIN_GEN9_I2C_SDA_PG4,
+};
+
+static const unsigned int pwm1_pa0_pins[] = {
+	TEGRA_PIN_PWM1_PA0,
+};
+
+static const unsigned int pwm6_pa1_pins[] = {
+	TEGRA_PIN_PWM6_PA1,
+};
+
+static const unsigned int pwm7_pa2_pins[] = {
+	TEGRA_PIN_PWM7_PA2,
+};
+
+static const unsigned int pwm8_pa3_pins[] = {
+	TEGRA_PIN_PWM8_PA3,
+};
+
+static const unsigned int ufs0_ref_clk_pa4_pins[] = {
+	TEGRA_PIN_UFS0_REF_CLK_PA4,
+};
+
+static const unsigned int ufs0_rst_n_pa5_pins[] = {
+	TEGRA_PIN_UFS0_RST_N_PA5,
+};
+
+static const unsigned int pex_l1_clkreq_n_pb0_pins[] = {
+	TEGRA_PIN_PEX_L1_CLKREQ_N_PB0,
+};
+
+static const unsigned int pex_l1_rst_n_pb1_pins[] = {
+	TEGRA_PIN_PEX_L1_RST_N_PB1,
+};
+
+static const unsigned int pex_l2_clkreq_n_pb2_pins[] = {
+	TEGRA_PIN_PEX_L2_CLKREQ_N_PB2,
+};
+
+static const unsigned int pex_l2_rst_n_pb3_pins[] = {
+	TEGRA_PIN_PEX_L2_RST_N_PB3,
+};
+
+static const unsigned int pex_l3_clkreq_n_pb4_pins[] = {
+	TEGRA_PIN_PEX_L3_CLKREQ_N_PB4,
+};
+
+static const unsigned int pex_l3_rst_n_pb5_pins[] = {
+	TEGRA_PIN_PEX_L3_RST_N_PB5,
+};
+
+static const unsigned int soc_gpio113_pb6_pins[] = {
+	TEGRA_PIN_SOC_GPIO113_PB6,
+};
+
+static const unsigned int soc_gpio114_pb7_pins[] = {
+	TEGRA_PIN_SOC_GPIO114_PB7,
+};
+
+static const unsigned int sgmii0_sma_mdio_pc0_pins[] = {
+	TEGRA_PIN_SGMII0_SMA_MDIO_PC0,
+};
+
+static const unsigned int sgmii0_sma_mdc_pc1_pins[] = {
+	TEGRA_PIN_SGMII0_SMA_MDC_PC1,
+};
+
+static const unsigned int pex_wake_n_pc2_pins[] = {
+	TEGRA_PIN_PEX_WAKE_N_PC2,
+};
+
+static const unsigned int pex_l4_clkreq_n_pd0_pins[] = {
+	TEGRA_PIN_PEX_L4_CLKREQ_N_PD0,
+};
+
+static const unsigned int pex_l4_rst_n_pd1_pins[] = {
+	TEGRA_PIN_PEX_L4_RST_N_PD1,
+};
+
+static const unsigned int eth0_mdio_pd4_pins[] = {
+	TEGRA_PIN_ETH0_MDIO_PD4,
+};
+
+static const unsigned int eth0_mdc_pd5_pins[] = {
+	TEGRA_PIN_ETH0_MDC_PD5,
+};
+
+static const unsigned int eth2_mdio_pe2_pins[] = {
+	TEGRA_PIN_ETH2_MDIO_PE2,
+};
+
+static const unsigned int eth2_mdc_pe3_pins[] = {
+	TEGRA_PIN_ETH2_MDC_PE3,
+};
+
+static const unsigned int cpu_pwr_req_ph0_pins[] = {
+	TEGRA_PIN_CPU_PWR_REQ_PH0,
+};
+
+static const unsigned int gpu_pwr_req_ph1_pins[] = {
+	TEGRA_PIN_GPU_PWR_REQ_PH1,
+};
+
+static const unsigned int spi3_sck_ph6_pins[] = {
+	TEGRA_PIN_SPI3_SCK_PH6,
+};
+
+static const unsigned int spi3_miso_ph7_pins[] = {
+	TEGRA_PIN_SPI3_MISO_PH7,
+};
+
+static const unsigned int spi3_mosi_pj0_pins[] = {
+	TEGRA_PIN_SPI3_MOSI_PJ0,
+};
+
+static const unsigned int spi3_cs0_pj1_pins[] = {
+	TEGRA_PIN_SPI3_CS0_PJ1,
+};
+
+static const unsigned int spi3_cs3_pj2_pins[] = {
+	TEGRA_PIN_SPI3_CS3_PJ2,
+};
+
+static const unsigned int uart5_tx_pj3_pins[] = {
+	TEGRA_PIN_UART5_TX_PJ3,
+};
+
+static const unsigned int uart5_rx_pj4_pins[] = {
+	TEGRA_PIN_UART5_RX_PJ4,
+};
+
+static const unsigned int uart5_rts_n_pj5_pins[] = {
+	TEGRA_PIN_UART5_RTS_N_PJ5,
+};
+
+static const unsigned int uart5_cts_n_pj6_pins[] = {
+	TEGRA_PIN_UART5_CTS_N_PJ6,
+};
+
+static const unsigned int spi1_sck_pj7_pins[] = {
+	TEGRA_PIN_SPI1_SCK_PJ7,
+};
+
+static const unsigned int spi1_miso_pk0_pins[] = {
+	TEGRA_PIN_SPI1_MISO_PK0,
+};
+
+static const unsigned int spi1_mosi_pk1_pins[] = {
+	TEGRA_PIN_SPI1_MOSI_PK1,
+};
+
+static const unsigned int spi1_cs0_pk2_pins[] = {
+	TEGRA_PIN_SPI1_CS0_PK2,
+};
+
+static const unsigned int spi1_cs1_pk3_pins[] = {
+	TEGRA_PIN_SPI1_CS1_PK3,
+};
+
+static const unsigned int extperiph1_clk_pk4_pins[] = {
+	TEGRA_PIN_EXTPERIPH1_CLK_PK4,
+};
+
+static const unsigned int extperiph2_clk_pk5_pins[] = {
+	TEGRA_PIN_EXTPERIPH2_CLK_PK5,
+};
+
+static const unsigned int gen12_i2c_scl_pk6_pins[] = {
+	TEGRA_PIN_GEN12_I2C_SCL_PK6,
+};
+
+static const unsigned int gen12_i2c_sda_pk7_pins[] = {
+	TEGRA_PIN_GEN12_I2C_SDA_PK7,
+};
+
+static const unsigned int soc_gpio124_pl0_pins[] = {
+	TEGRA_PIN_SOC_GPIO124_PL0,
+};
+
+static const unsigned int soc_gpio125_pl1_pins[] = {
+	TEGRA_PIN_SOC_GPIO125_PL1,
+};
+
+static const unsigned int fan_tach0_pl2_pins[] = {
+	TEGRA_PIN_FAN_TACH0_PL2,
+};
+
+static const unsigned int soc_gpio127_pl3_pins[] = {
+	TEGRA_PIN_SOC_GPIO127_PL3,
+};
+
+static const unsigned int soc_gpio128_pl4_pins[] = {
+	TEGRA_PIN_SOC_GPIO128_PL4,
+};
+
+static const unsigned int soc_gpio129_pl5_pins[] = {
+	TEGRA_PIN_SOC_GPIO129_PL5,
+};
+
+static const unsigned int soc_gpio130_pl6_pins[] = {
+	TEGRA_PIN_SOC_GPIO130_PL6,
+};
+
+static const unsigned int soc_gpio131_pl7_pins[] = {
+	TEGRA_PIN_SOC_GPIO131_PL7,
+};
+
+static const unsigned int gp_pwm9_pm0_pins[] = {
+	TEGRA_PIN_GP_PWM9_PM0,
+};
+
+static const unsigned int soc_gpio133_pm1_pins[] = {
+	TEGRA_PIN_SOC_GPIO133_PM1,
+};
+
+static const unsigned int soc_gpio178_pv0_pins[] = {
+	TEGRA_PIN_SOC_GPIO178_PV0,
+};
+
+static const unsigned int uart4_tx_pv2_pins[] = {
+	TEGRA_PIN_UART4_TX_PV2,
+};
+
+static const unsigned int uart4_rx_pv3_pins[] = {
+	TEGRA_PIN_UART4_RX_PV3,
+};
+
+static const unsigned int uart4_rts_n_pv4_pins[] = {
+	TEGRA_PIN_UART4_RTS_N_PV4,
+};
+
+static const unsigned int uart4_cts_n_pv5_pins[] = {
+	TEGRA_PIN_UART4_CTS_N_PV5,
+};
+
+static const unsigned int dap2_clk_pv6_pins[] = {
+	TEGRA_PIN_DAP2_CLK_PV6,
+};
+
+static const unsigned int dap2_din_pw0_pins[] = {
+	TEGRA_PIN_DAP2_DIN_PW0,
+};
+
+static const unsigned int dap2_dout_pv7_pins[] = {
+	TEGRA_PIN_DAP2_DOUT_PV7,
+};
+
+static const unsigned int dap2_fs_pw1_pins[] = {
+	TEGRA_PIN_DAP2_FS_PW1,
+};
+
+static const unsigned int gen1_i2c_scl_pw2_pins[] = {
+	TEGRA_PIN_GEN1_I2C_SCL_PW2,
+};
+
+static const unsigned int gen1_i2c_sda_pw3_pins[] = {
+	TEGRA_PIN_GEN1_I2C_SDA_PW3,
+};
+
+static const unsigned int gen0_i2c_scl_pw4_pins[] = {
+	TEGRA_PIN_GEN0_I2C_SCL_PW4,
+};
+
+static const unsigned int gen0_i2c_sda_pw5_pins[] = {
+	TEGRA_PIN_GEN0_I2C_SDA_PW5,
+};
+
+static const unsigned int pwr_i2c_scl_pw6_pins[] = {
+	TEGRA_PIN_PWR_I2C_SCL_PW6,
+};
+
+static const unsigned int pwr_i2c_sda_pw7_pins[] = {
+	TEGRA_PIN_PWR_I2C_SDA_PW7,
+};
+
+static const unsigned int qspi0_sck_pt0_pins[] = {
+	TEGRA_PIN_QSPI0_SCK_PT0,
+};
+
+static const unsigned int qspi0_cs_n_pt1_pins[] = {
+	TEGRA_PIN_QSPI0_CS_N_PT1,
+};
+
+static const unsigned int qspi0_io0_pt2_pins[] = {
+	TEGRA_PIN_QSPI0_IO0_PT2,
+};
+
+static const unsigned int qspi0_io1_pt3_pins[] = {
+	TEGRA_PIN_QSPI0_IO1_PT3,
+};
+
+static const unsigned int qspi0_io2_pt4_pins[] = {
+	TEGRA_PIN_QSPI0_IO2_PT4,
+};
+
+static const unsigned int qspi0_io3_pt5_pins[] = {
+	TEGRA_PIN_QSPI0_IO3_PT5,
+};
+
+static const unsigned int soc_gpio192_pt6_pins[] = {
+	TEGRA_PIN_SOC_GPIO192_PT6,
+};
+
+static const unsigned int soc_gpio139_pp1_pins[] = {
+	TEGRA_PIN_SOC_GPIO139_PP1,
+};
+
+static const unsigned int dap4_sclk_pp6_pins[] = {
+	TEGRA_PIN_DAP4_SCLK_PP6,
+};
+
+static const unsigned int dap4_dout_pp7_pins[] = {
+	TEGRA_PIN_DAP4_DOUT_PP7,
+};
+
+static const unsigned int dap4_din_pq0_pins[] = {
+	TEGRA_PIN_DAP4_DIN_PQ0,
+};
+
+static const unsigned int dap4_fs_pq1_pins[] = {
+	TEGRA_PIN_DAP4_FS_PQ1,
+};
+
+static const unsigned int soc_gpio152_pq6_pins[] = {
+	TEGRA_PIN_SOC_GPIO152_PQ6,
+};
+
+static const unsigned int soc_gpio153_pq7_pins[] = {
+	TEGRA_PIN_SOC_GPIO153_PQ7,
+};
+
+static const unsigned int aud_mclk_pr0_pins[] = {
+	TEGRA_PIN_AUD_MCLK_PR0,
+};
+
+static const unsigned int soc_gpio155_pr1_pins[] = {
+	TEGRA_PIN_SOC_GPIO155_PR1,
+};
+
+static const unsigned int dap1_sclk_pr2_pins[] = {
+	TEGRA_PIN_DAP1_SCLK_PR2,
+};
+
+static const unsigned int dap1_out_pr3_pins[] = {
+	TEGRA_PIN_DAP1_OUT_PR3,
+};
+
+static const unsigned int dap1_in_pr4_pins[] = {
+	TEGRA_PIN_DAP1_IN_PR4,
+};
+
+static const unsigned int dap1_fs_pr5_pins[] = {
+	TEGRA_PIN_DAP1_FS_PR5,
+};
+
+static const unsigned int gen11_i2c_scl_pr6_pins[] = {
+	TEGRA_PIN_GEN11_I2C_SCL_PR6,
+};
+
+static const unsigned int gen11_i2c_sda_pr7_pins[] = {
+	TEGRA_PIN_GEN11_I2C_SDA_PR7,
+};
+
+static const unsigned int soc_gpio351_ps1_pins[] = {
+	TEGRA_PIN_SOC_GPIO351_PS1,
+};
+
+static const unsigned int soc_gpio270_py0_pins[] = {
+	TEGRA_PIN_SOC_GPIO270_PY0,
+};
+
+static const unsigned int soc_gpio271_py1_pins[] = {
+	TEGRA_PIN_SOC_GPIO271_PY1,
+};
+
+static const unsigned int soc_gpio272_py2_pins[] = {
+	TEGRA_PIN_SOC_GPIO272_PY2,
+};
+
+static const unsigned int soc_gpio273_py3_pins[] = {
+	TEGRA_PIN_SOC_GPIO273_PY3,
+};
+
+static const unsigned int soc_gpio274_py4_pins[] = {
+	TEGRA_PIN_SOC_GPIO274_PY4,
+};
+
+static const unsigned int soc_gpio275_py5_pins[] = {
+	TEGRA_PIN_SOC_GPIO275_PY5,
+};
+
+static const unsigned int soc_gpio276_py6_pins[] = {
+	TEGRA_PIN_SOC_GPIO276_PY6,
+};
+
+static const unsigned int soc_gpio277_py7_pins[] = {
+	TEGRA_PIN_SOC_GPIO277_PY7,
+};
+
+static const unsigned int soc_gpio278_pz0_pins[] = {
+	TEGRA_PIN_SOC_GPIO278_PZ0,
+};
+
+static const unsigned int soc_gpio279_pz1_pins[] = {
+	TEGRA_PIN_SOC_GPIO279_PZ1,
+};
+
+static const unsigned int xhalt_trig_pz2_pins[] = {
+	TEGRA_PIN_XHALT_TRIG_PZ2,
+};
+
+static const unsigned int soc_gpio281_pz3_pins[] = {
+	TEGRA_PIN_SOC_GPIO281_PZ3,
+};
+
+static const unsigned int soc_gpio282_pz4_pins[] = {
+	TEGRA_PIN_SOC_GPIO282_PZ4,
+};
+
+static const unsigned int soc_gpio283_pz5_pins[] = {
+	TEGRA_PIN_SOC_GPIO283_PZ5,
+};
+
+static const unsigned int soc_gpio284_pz6_pins[] = {
+	TEGRA_PIN_SOC_GPIO284_PZ6,
+};
+
+static const unsigned int soc_gpio285_pz7_pins[] = {
+	TEGRA_PIN_SOC_GPIO285_PZ7,
+};
+
+static const unsigned int soc_gpio286_pal0_pins[] = {
+	TEGRA_PIN_SOC_GPIO286_PAL0,
+};
+
+static const unsigned int soc_gpio287_pal1_pins[] = {
+	TEGRA_PIN_SOC_GPIO287_PAL1,
+};
+
+static const unsigned int soc_gpio288_pal2_pins[] = {
+	TEGRA_PIN_SOC_GPIO288_PAL2,
+};
+
+static const unsigned int soc_gpio00_paa0_pins[] = {
+	TEGRA_PIN_SOC_GPIO00_PAA0,
+};
+
+static const unsigned int vcomp_alert_paa1_pins[] = {
+	TEGRA_PIN_VCOMP_ALERT_PAA1,
+};
+
+static const unsigned int ao_retention_n_paa2_pins[] = {
+	TEGRA_PIN_AO_RETENTION_N_PAA2,
+};
+
+static const unsigned int batt_oc_paa3_pins[] = {
+	TEGRA_PIN_BATT_OC_PAA3,
+};
+
+static const unsigned int bootv_ctl_n_paa4_pins[] = {
+	TEGRA_PIN_BOOTV_CTL_N_PAA4,
+};
+
+static const unsigned int power_on_paa5_pins[] = {
+	TEGRA_PIN_POWER_ON_PAA5,
+};
+
+static const unsigned int hdmi_cec_paa6_pins[] = {
+	TEGRA_PIN_HDMI_CEC_PAA6,
+};
+
+static const unsigned int soc_gpio07_paa7_pins[] = {
+	TEGRA_PIN_SOC_GPIO07_PAA7,
+};
+
+static const unsigned int soc_gpio08_pbb0_pins[] = {
+	TEGRA_PIN_SOC_GPIO08_PBB0,
+};
+
+static const unsigned int soc_gpio09_pbb1_pins[] = {
+	TEGRA_PIN_SOC_GPIO09_PBB1,
+};
+
+static const unsigned int gen2_i2c_scl_pcc0_pins[] = {
+	TEGRA_PIN_GEN2_I2C_SCL_PCC0,
+};
+
+static const unsigned int gen2_i2c_sda_pcc1_pins[] = {
+	TEGRA_PIN_GEN2_I2C_SDA_PCC1,
+};
+
+static const unsigned int gen3_i2c_scl_pcc2_pins[] = {
+	TEGRA_PIN_GEN3_I2C_SCL_PCC2,
+};
+
+static const unsigned int gen3_i2c_sda_pcc3_pins[] = {
+	TEGRA_PIN_GEN3_I2C_SDA_PCC3,
+};
+
+static const unsigned int gp_pwm4_pcc4_pins[] = {
+	TEGRA_PIN_GP_PWM4_PCC4,
+};
+
+static const unsigned int uart0_tx_pcc5_pins[] = {
+	TEGRA_PIN_UART0_TX_PCC5,
+};
+
+static const unsigned int uart0_rx_pcc6_pins[] = {
+	TEGRA_PIN_UART0_RX_PCC6,
+};
+
+static const unsigned int spi2_sck_pcc7_pins[] = {
+	TEGRA_PIN_SPI2_SCK_PCC7,
+};
+
+static const unsigned int spi2_miso_pdd0_pins[] = {
+	TEGRA_PIN_SPI2_MISO_PDD0,
+};
+
+static const unsigned int spi2_mosi_pdd1_pins[] = {
+	TEGRA_PIN_SPI2_MOSI_PDD1,
+};
+
+static const unsigned int spi2_cs0_n_pdd2_pins[] = {
+	TEGRA_PIN_SPI2_CS0_N_PDD2,
+};
+
+static const unsigned int soc_gpio21_pdd3_pins[] = {
+	TEGRA_PIN_SOC_GPIO21_PDD3,
+};
+
+static const unsigned int soc_gpio23_pdd5_pins[] = {
+	TEGRA_PIN_SOC_GPIO23_PDD5,
+};
+
+static const unsigned int soc_gpio24_pdd6_pins[] = {
+	TEGRA_PIN_SOC_GPIO24_PDD6,
+};
+
+static const unsigned int soc_gpio25_pdd7_pins[] = {
+	TEGRA_PIN_SOC_GPIO25_PDD7,
+};
+
+static const unsigned int soc_gpio26_pee0_pins[] = {
+	TEGRA_PIN_SOC_GPIO26_PEE0,
+};
+
+static const unsigned int soc_gpio27_pee1_pins[] = {
+	TEGRA_PIN_SOC_GPIO27_PEE1,
+};
+
+enum tegra_mux_dt {
+	TEGRA_MUX_DCA_VSYNC,
+	TEGRA_MUX_DCA_HSYNC,
+	TEGRA_MUX_RSVD0,
+	TEGRA_MUX_DP_AUX_CH0_HPD,
+	TEGRA_MUX_DP_AUX_CH1_HPD,
+	TEGRA_MUX_GP_PWM2,
+	TEGRA_MUX_GP_PWM3,
+	TEGRA_MUX_I2C7_CLK,
+	TEGRA_MUX_I2C7_DAT,
+	TEGRA_MUX_I2C9_CLK,
+	TEGRA_MUX_I2C9_DAT,
+	TEGRA_MUX_SPI3_CS0,
+	TEGRA_MUX_SPI3_CS3,
+	TEGRA_MUX_SPI3_DIN,
+	TEGRA_MUX_SPI3_DOUT,
+	TEGRA_MUX_SPI3_SCK,
+	TEGRA_MUX_UARTF_CTS,
+	TEGRA_MUX_UARTF_RTS,
+	TEGRA_MUX_UARTF_RXD,
+	TEGRA_MUX_UARTF_TXD,
+	TEGRA_MUX_SPI1_CS0,
+	TEGRA_MUX_SPI1_CS1,
+	TEGRA_MUX_SPI1_DIN,
+	TEGRA_MUX_SPI1_DOUT,
+	TEGRA_MUX_SPI1_SCK,
+	TEGRA_MUX_EXTPERIPH2_CLK,
+	TEGRA_MUX_EXTPERIPH1_CLK,
+	TEGRA_MUX_I2C12_CLK,
+	TEGRA_MUX_I2C12_DAT,
+	TEGRA_MUX_NV_THERM_FAN_TACH0,
+	TEGRA_MUX_GP_PWM9,
+	TEGRA_MUX_I2C0_CLK,
+	TEGRA_MUX_I2C0_DAT,
+	TEGRA_MUX_I2C1_CLK,
+	TEGRA_MUX_I2C1_DAT,
+	TEGRA_MUX_I2S2_LRCK,
+	TEGRA_MUX_I2S2_SCLK,
+	TEGRA_MUX_I2S2_SDATA_OUT,
+	TEGRA_MUX_I2S2_SDATA_IN,
+	TEGRA_MUX_UARTE_CTS,
+	TEGRA_MUX_UARTE_RTS,
+	TEGRA_MUX_UARTE_RXD,
+	TEGRA_MUX_UARTE_TXD,
+	TEGRA_MUX_I2C5_DAT,
+	TEGRA_MUX_I2C5_CLK,
+	TEGRA_MUX_I2S4_SDATA_OUT,
+	TEGRA_MUX_I2S4_SCLK,
+	TEGRA_MUX_I2S4_SDATA_IN,
+	TEGRA_MUX_I2S4_LRCK,
+	TEGRA_MUX_AUD_MCLK,
+	TEGRA_MUX_I2S1_SCLK,
+	TEGRA_MUX_I2S1_SDATA_IN,
+	TEGRA_MUX_I2S1_SDATA_OUT,
+	TEGRA_MUX_I2S1_LRCK,
+	TEGRA_MUX_I2C11_CLK,
+	TEGRA_MUX_I2C11_DAT,
+	TEGRA_MUX_XHALT_TRIG,
+	TEGRA_MUX_GP_PWM1,
+	TEGRA_MUX_GP_PWM6,
+	TEGRA_MUX_GP_PWM7,
+	TEGRA_MUX_GP_PWM8,
+	TEGRA_MUX_UFS0,
+	TEGRA_MUX_PE1_CLKREQ_L,
+	TEGRA_MUX_PE1_RST_L,
+	TEGRA_MUX_PE2_RST_L,
+	TEGRA_MUX_PE2_CLKREQ_L,
+	TEGRA_MUX_PE3_CLKREQ_L,
+	TEGRA_MUX_PE3_RST_L,
+	TEGRA_MUX_SGMII0_SMA_MDIO,
+	TEGRA_MUX_SGMII0_SMA_MDC,
+	TEGRA_MUX_USB_VBUS_EN0,
+	TEGRA_MUX_USB_VBUS_EN1,
+	TEGRA_MUX_PE4_CLKREQ_L,
+	TEGRA_MUX_PE4_RST_L,
+	TEGRA_MUX_ETH0_MDIO,
+	TEGRA_MUX_ETH0_MDC,
+	TEGRA_MUX_ETH2_MDIO,
+	TEGRA_MUX_ETH2_MDC,
+	TEGRA_MUX_QSPI0_CS_N,
+	TEGRA_MUX_QSPI0_IO0,
+	TEGRA_MUX_QSPI0_IO1,
+	TEGRA_MUX_QSPI0_IO2,
+	TEGRA_MUX_QSPI0_IO3,
+	TEGRA_MUX_QSPI0_SCK,
+	TEGRA_MUX_DCB_VSYNC,
+	TEGRA_MUX_DCB_HSYNC,
+	TEGRA_MUX_DSA_LSPII,
+	TEGRA_MUX_DCE_VSYNC,
+	TEGRA_MUX_DCE_HSYNC,
+	TEGRA_MUX_BL_EN,
+	TEGRA_MUX_BL_PWM_DIM0,
+	TEGRA_MUX_RSVD1,
+	TEGRA_MUX_SOC_THERM_OC3,
+	TEGRA_MUX_I2S5_SCLK,
+	TEGRA_MUX_I2S5_SDATA_IN,
+	TEGRA_MUX_EXTPERIPH3_CLK,
+	TEGRA_MUX_EXTPERIPH4_CLK,
+	TEGRA_MUX_I2S5_SDATA_OUT,
+	TEGRA_MUX_I2S5_LRCK,
+	TEGRA_MUX_I2C14_DAT,
+	TEGRA_MUX_I2S8_SCLK,
+	TEGRA_MUX_I2S8_SDATA_OUT,
+	TEGRA_MUX_I2S8_LRCK,
+	TEGRA_MUX_I2C16_CLK,
+	TEGRA_MUX_I2C16_DAT,
+	TEGRA_MUX_I2S3_SCLK,
+	TEGRA_MUX_I2S3_SDATA_OUT,
+	TEGRA_MUX_I2S3_SDATA_IN,
+	TEGRA_MUX_I2S3_LRCK,
+	TEGRA_MUX_PM_TRIG1,
+	TEGRA_MUX_PM_TRIG0,
+	TEGRA_MUX_DCC_VSYNC,
+	TEGRA_MUX_DCC_HSYNC,
+	TEGRA_MUX_RSVD2,
+	TEGRA_MUX_DCF_VSYNC,
+	TEGRA_MUX_DCF_HSYNC,
+	TEGRA_MUX_SOUNDWIRE1_CLK,
+	TEGRA_MUX_SOUNDWIRE1_DAT0,
+	TEGRA_MUX_SOUNDWIRE1_DAT1,
+	TEGRA_MUX_SOUNDWIRE1_DAT2,
+	TEGRA_MUX_DMIC2_CLK,
+	TEGRA_MUX_DMIC2_DAT,
+	TEGRA_MUX_NV_THERM_FAN_TACH1,
+	TEGRA_MUX_I2C15_CLK,
+	TEGRA_MUX_I2C15_DAT,
+	TEGRA_MUX_I2S7_SDATA_OUT,
+	TEGRA_MUX_DMIC1_CLK,
+	TEGRA_MUX_DCD_VSYNC,
+	TEGRA_MUX_DCD_HSYNC,
+	TEGRA_MUX_RSVD3,
+	TEGRA_MUX_DCG_VSYNC,
+	TEGRA_MUX_DCG_HSYNC,
+	TEGRA_MUX_DSPK1_CLK,
+	TEGRA_MUX_DSPK1_DAT,
+	TEGRA_MUX_SOC_THERM_OC2,
+	TEGRA_MUX_ISTCTRL_IST_DONE_N,
+	TEGRA_MUX_SOC_THERM_OC1,
+	TEGRA_MUX_TSC_EDGE_OUT0C,
+	TEGRA_MUX_TSC_EDGE_OUT0D,
+	TEGRA_MUX_TSC_EDGE_OUT0A,
+	TEGRA_MUX_TSC_EDGE_OUT0B,
+	TEGRA_MUX_TOUCH_CLK,
+	TEGRA_MUX_HDMI_CEC,
+	TEGRA_MUX_I2C2_CLK,
+	TEGRA_MUX_I2C2_DAT,
+	TEGRA_MUX_I2C3_CLK,
+	TEGRA_MUX_I2C3_DAT,
+	TEGRA_MUX_GP_PWM4,
+	TEGRA_MUX_UARTA_TXD,
+	TEGRA_MUX_UARTA_RXD,
+	TEGRA_MUX_SPI2_SCK,
+	TEGRA_MUX_SPI2_DIN,
+	TEGRA_MUX_SPI2_DOUT,
+	TEGRA_MUX_SPI2_CS0,
+	TEGRA_MUX_TSC_SYNC1,
+	TEGRA_MUX_TSC_EDGE_OUT3,
+	TEGRA_MUX_TSC_EDGE_OUT0,
+	TEGRA_MUX_TSC_EDGE_OUT1,
+	TEGRA_MUX_TSC_SYNC0,
+	TEGRA_MUX_SOUNDWIRE0_CLK,
+	TEGRA_MUX_SOUNDWIRE0_DAT0,
+	TEGRA_MUX_UARTL_TXD,
+	TEGRA_MUX_UARTL_RXD,
+	TEGRA_MUX_I2S9_SCLK,
+	TEGRA_MUX_I2S9_SDATA_OUT,
+	TEGRA_MUX_I2S9_SDATA_IN,
+	TEGRA_MUX_I2S9_LRCK,
+	TEGRA_MUX_DMIC5_DAT,
+	TEGRA_MUX_TSC_EDGE_OUT2,
+};
+
+/* Make list of each function name */
+#define TEGRA_PIN_FUNCTION(lid) #lid
+
+static const char * const tegra268_functions[] = {
+	TEGRA_PIN_FUNCTION(dca_vsync),
+	TEGRA_PIN_FUNCTION(dca_hsync),
+	TEGRA_PIN_FUNCTION(rsvd0),
+	TEGRA_PIN_FUNCTION(dp_aux_ch0_hpd),
+	TEGRA_PIN_FUNCTION(dp_aux_ch1_hpd),
+	TEGRA_PIN_FUNCTION(gp_pwm2),
+	TEGRA_PIN_FUNCTION(gp_pwm3),
+	TEGRA_PIN_FUNCTION(i2c7_clk),
+	TEGRA_PIN_FUNCTION(i2c7_dat),
+	TEGRA_PIN_FUNCTION(i2c9_clk),
+	TEGRA_PIN_FUNCTION(i2c9_dat),
+	TEGRA_PIN_FUNCTION(spi3_cs0),
+	TEGRA_PIN_FUNCTION(spi3_cs3),
+	TEGRA_PIN_FUNCTION(spi3_din),
+	TEGRA_PIN_FUNCTION(spi3_dout),
+	TEGRA_PIN_FUNCTION(spi3_sck),
+	TEGRA_PIN_FUNCTION(uartf_cts),
+	TEGRA_PIN_FUNCTION(uartf_rts),
+	TEGRA_PIN_FUNCTION(uartf_rxd),
+	TEGRA_PIN_FUNCTION(uartf_txd),
+	TEGRA_PIN_FUNCTION(spi1_cs0),
+	TEGRA_PIN_FUNCTION(spi1_cs1),
+	TEGRA_PIN_FUNCTION(spi1_din),
+	TEGRA_PIN_FUNCTION(spi1_dout),
+	TEGRA_PIN_FUNCTION(spi1_sck),
+	TEGRA_PIN_FUNCTION(extperiph2_clk),
+	TEGRA_PIN_FUNCTION(extperiph1_clk),
+	TEGRA_PIN_FUNCTION(i2c12_clk),
+	TEGRA_PIN_FUNCTION(i2c12_dat),
+	TEGRA_PIN_FUNCTION(nv_therm_fan_tach0),
+	TEGRA_PIN_FUNCTION(gp_pwm9),
+	TEGRA_PIN_FUNCTION(i2c0_clk),
+	TEGRA_PIN_FUNCTION(i2c0_dat),
+	TEGRA_PIN_FUNCTION(i2c1_clk),
+	TEGRA_PIN_FUNCTION(i2c1_dat),
+	TEGRA_PIN_FUNCTION(i2s2_lrck),
+	TEGRA_PIN_FUNCTION(i2s2_sclk),
+	TEGRA_PIN_FUNCTION(i2s2_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s2_sdata_in),
+	TEGRA_PIN_FUNCTION(uarte_cts),
+	TEGRA_PIN_FUNCTION(uarte_rts),
+	TEGRA_PIN_FUNCTION(uarte_rxd),
+	TEGRA_PIN_FUNCTION(uarte_txd),
+	TEGRA_PIN_FUNCTION(i2c5_dat),
+	TEGRA_PIN_FUNCTION(i2c5_clk),
+	TEGRA_PIN_FUNCTION(i2s4_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s4_sclk),
+	TEGRA_PIN_FUNCTION(i2s4_sdata_in),
+	TEGRA_PIN_FUNCTION(i2s4_lrck),
+	TEGRA_PIN_FUNCTION(aud_mclk),
+	TEGRA_PIN_FUNCTION(i2s1_sclk),
+	TEGRA_PIN_FUNCTION(i2s1_sdata_in),
+	TEGRA_PIN_FUNCTION(i2s1_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s1_lrck),
+	TEGRA_PIN_FUNCTION(i2c11_clk),
+	TEGRA_PIN_FUNCTION(i2c11_dat),
+	TEGRA_PIN_FUNCTION(xhalt_trig),
+	TEGRA_PIN_FUNCTION(gp_pwm1),
+	TEGRA_PIN_FUNCTION(gp_pwm6),
+	TEGRA_PIN_FUNCTION(gp_pwm7),
+	TEGRA_PIN_FUNCTION(gp_pwm8),
+	TEGRA_PIN_FUNCTION(ufs0),
+	TEGRA_PIN_FUNCTION(pe1_clkreq_l),
+	TEGRA_PIN_FUNCTION(pe1_rst_l),
+	TEGRA_PIN_FUNCTION(pe2_rst_l),
+	TEGRA_PIN_FUNCTION(pe2_clkreq_l),
+	TEGRA_PIN_FUNCTION(pe3_clkreq_l),
+	TEGRA_PIN_FUNCTION(pe3_rst_l),
+	TEGRA_PIN_FUNCTION(sgmii0_sma_mdio),
+	TEGRA_PIN_FUNCTION(sgmii0_sma_mdc),
+	TEGRA_PIN_FUNCTION(usb_vbus_en0),
+	TEGRA_PIN_FUNCTION(usb_vbus_en1),
+	TEGRA_PIN_FUNCTION(pe4_clkreq_l),
+	TEGRA_PIN_FUNCTION(pe4_rst_l),
+	TEGRA_PIN_FUNCTION(eth0_mdio),
+	TEGRA_PIN_FUNCTION(eth0_mdc),
+	TEGRA_PIN_FUNCTION(eth2_mdio),
+	TEGRA_PIN_FUNCTION(eth2_mdc),
+	TEGRA_PIN_FUNCTION(qspi0_cs_n),
+	TEGRA_PIN_FUNCTION(qspi0_io0),
+	TEGRA_PIN_FUNCTION(qspi0_io1),
+	TEGRA_PIN_FUNCTION(qspi0_io2),
+	TEGRA_PIN_FUNCTION(qspi0_io3),
+	TEGRA_PIN_FUNCTION(qspi0_sck),
+	TEGRA_PIN_FUNCTION(dcb_vsync),
+	TEGRA_PIN_FUNCTION(dcb_hsync),
+	TEGRA_PIN_FUNCTION(dsa_lspii),
+	TEGRA_PIN_FUNCTION(dce_vsync),
+	TEGRA_PIN_FUNCTION(dce_hsync),
+	TEGRA_PIN_FUNCTION(bl_en),
+	TEGRA_PIN_FUNCTION(bl_pwm_dim0),
+	TEGRA_PIN_FUNCTION(rsvd1),
+	TEGRA_PIN_FUNCTION(soc_therm_oc3),
+	TEGRA_PIN_FUNCTION(i2s5_sclk),
+	TEGRA_PIN_FUNCTION(i2s5_sdata_in),
+	TEGRA_PIN_FUNCTION(extperiph3_clk),
+	TEGRA_PIN_FUNCTION(extperiph4_clk),
+	TEGRA_PIN_FUNCTION(i2s5_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s5_lrck),
+	TEGRA_PIN_FUNCTION(i2c14_dat),
+	TEGRA_PIN_FUNCTION(i2s8_sclk),
+	TEGRA_PIN_FUNCTION(i2s8_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s8_lrck),
+	TEGRA_PIN_FUNCTION(i2c16_clk),
+	TEGRA_PIN_FUNCTION(i2c16_dat),
+	TEGRA_PIN_FUNCTION(i2s3_sclk),
+	TEGRA_PIN_FUNCTION(i2s3_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s3_sdata_in),
+	TEGRA_PIN_FUNCTION(i2s3_lrck),
+	TEGRA_PIN_FUNCTION(pm_trig1),
+	TEGRA_PIN_FUNCTION(pm_trig0),
+	TEGRA_PIN_FUNCTION(dcc_vsync),
+	TEGRA_PIN_FUNCTION(dcc_hsync),
+	TEGRA_PIN_FUNCTION(rsvd2),
+	TEGRA_PIN_FUNCTION(dcf_vsync),
+	TEGRA_PIN_FUNCTION(dcf_hsync),
+	TEGRA_PIN_FUNCTION(soundwire1_clk),
+	TEGRA_PIN_FUNCTION(soundwire1_dat0),
+	TEGRA_PIN_FUNCTION(soundwire1_dat1),
+	TEGRA_PIN_FUNCTION(soundwire1_dat2),
+	TEGRA_PIN_FUNCTION(dmic2_clk),
+	TEGRA_PIN_FUNCTION(dmic2_dat),
+	TEGRA_PIN_FUNCTION(nv_therm_fan_tach1),
+	TEGRA_PIN_FUNCTION(i2c15_clk),
+	TEGRA_PIN_FUNCTION(i2c15_dat),
+	TEGRA_PIN_FUNCTION(i2s7_sdata_out),
+	TEGRA_PIN_FUNCTION(dmic1_clk),
+	TEGRA_PIN_FUNCTION(dcd_vsync),
+	TEGRA_PIN_FUNCTION(dcd_hsync),
+	TEGRA_PIN_FUNCTION(rsvd3),
+	TEGRA_PIN_FUNCTION(dcg_vsync),
+	TEGRA_PIN_FUNCTION(dcg_hsync),
+	TEGRA_PIN_FUNCTION(dspk1_clk),
+	TEGRA_PIN_FUNCTION(dspk1_dat),
+	TEGRA_PIN_FUNCTION(soc_therm_oc2),
+	TEGRA_PIN_FUNCTION(istctrl_ist_done_n),
+	TEGRA_PIN_FUNCTION(soc_therm_oc1),
+	TEGRA_PIN_FUNCTION(tsc_edge_out0c),
+	TEGRA_PIN_FUNCTION(tsc_edge_out0d),
+	TEGRA_PIN_FUNCTION(tsc_edge_out0a),
+	TEGRA_PIN_FUNCTION(tsc_edge_out0b),
+	TEGRA_PIN_FUNCTION(touch_clk),
+	TEGRA_PIN_FUNCTION(hdmi_cec),
+	TEGRA_PIN_FUNCTION(i2c2_clk),
+	TEGRA_PIN_FUNCTION(i2c2_dat),
+	TEGRA_PIN_FUNCTION(i2c3_clk),
+	TEGRA_PIN_FUNCTION(i2c3_dat),
+	TEGRA_PIN_FUNCTION(gp_pwm4),
+	TEGRA_PIN_FUNCTION(uarta_txd),
+	TEGRA_PIN_FUNCTION(uarta_rxd),
+	TEGRA_PIN_FUNCTION(spi2_sck),
+	TEGRA_PIN_FUNCTION(spi2_din),
+	TEGRA_PIN_FUNCTION(spi2_dout),
+	TEGRA_PIN_FUNCTION(spi2_cs0),
+	TEGRA_PIN_FUNCTION(tsc_sync1),
+	TEGRA_PIN_FUNCTION(tsc_edge_out3),
+	TEGRA_PIN_FUNCTION(tsc_edge_out0),
+	TEGRA_PIN_FUNCTION(tsc_edge_out1),
+	TEGRA_PIN_FUNCTION(tsc_sync0),
+	TEGRA_PIN_FUNCTION(soundwire0_clk),
+	TEGRA_PIN_FUNCTION(soundwire0_dat0),
+	TEGRA_PIN_FUNCTION(uartl_txd),
+	TEGRA_PIN_FUNCTION(uartl_rxd),
+	TEGRA_PIN_FUNCTION(i2s9_sclk),
+	TEGRA_PIN_FUNCTION(i2s9_sdata_out),
+	TEGRA_PIN_FUNCTION(i2s9_sdata_in),
+	TEGRA_PIN_FUNCTION(i2s9_lrck),
+	TEGRA_PIN_FUNCTION(dmic5_dat),
+	TEGRA_PIN_FUNCTION(tsc_edge_out2),
+};
+
+#define PINGROUP_REG_Y(r) ((r))
+#define PINGROUP_REG_N(r) -1
+
+#define DRV_PINGROUP_Y(r) ((r))
+
+#define DRV_PINGROUP_ENTRY_N					\
+		.drv_reg = -1,					\
+		.drv_bank = -1,					\
+		.drvdn_bit = -1,				\
+		.drvup_bit = -1,				\
+		.slwr_bit = -1,					\
+		.slwf_bit = -1
+
+#define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,	\
+			     drvup_w, slwr_b, slwr_w, slwf_b,	\
+			     slwf_w, bank)			\
+		.drv_reg = DRV_PINGROUP_Y(r),			\
+		.drv_bank = bank,				\
+		.drvdn_bit = drvdn_b,				\
+		.drvdn_width = drvdn_w,				\
+		.drvup_bit = drvup_b,				\
+		.drvup_width = drvup_w,				\
+		.slwr_bit = slwr_b,				\
+		.slwr_width = slwr_w,				\
+		.slwf_bit = slwf_b,				\
+		.slwf_width = slwf_w
+
+#define PIN_PINGROUP_ENTRY_N					\
+		.mux_reg = -1,					\
+		.pupd_reg = -1,					\
+		.tri_reg = -1,					\
+		.einput_bit = -1,				\
+		.e_io_hv_bit = -1,				\
+		.odrain_bit = -1,				\
+		.lock_bit = -1,					\
+		.parked_bit = -1,				\
+		.lpmd_bit = -1,					\
+		.drvtype_bit = -1,				\
+		.lpdr_bit = -1,					\
+		.pbias_buf_bit = -1,				\
+		.preemp_bit = -1,				\
+		.rfu_in_bit = -1
+
+#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk, e_input,	\
+				e_lpdr, e_pbias_buf, gpio_sfio_sel,	\
+				schmitt_b)				\
+		.mux_reg = PINGROUP_REG_Y(r),			\
+		.lpmd_bit = -1,					\
+		.lock_bit = -1,					\
+		.hsm_bit = -1,					\
+		.odrain_bit = -1,				\
+		.ioreset_bit = -1,				\
+		.rcv_sel_bit = -1,				\
+		.mux_bank = bank,				\
+		.mux_bit = 0,					\
+		.pupd_reg = PINGROUP_REG_##pupd(r),		\
+		.pupd_bank = bank,				\
+		.pupd_bit = 2,					\
+		.tri_reg = PINGROUP_REG_Y(r),			\
+		.tri_bank = bank,				\
+		.tri_bit = 4,					\
+		.einput_bit = e_input,				\
+		.sfsel_bit = gpio_sfio_sel,			\
+		.schmitt_bit = schmitt_b,			\
+		.drvtype_bit = 13,				\
+		.lpdr_bit = e_lpdr,
+
+#define drive_pex_l4_clkreq_n_pd0 DRV_PINGROUP_ENTRY_Y(0xc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l4_rst_n_pd1 DRV_PINGROUP_ENTRY_Y(0x14, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_eth0_mdio_pd4 DRV_PINGROUP_ENTRY_Y(0x2c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_eth0_mdc_pd5 DRV_PINGROUP_ENTRY_Y(0x34, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_eth2_mdio_pe2 DRV_PINGROUP_ENTRY_Y(0x44, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_eth2_mdc_pe3 DRV_PINGROUP_ENTRY_Y(0x4c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l1_clkreq_n_pb0 DRV_PINGROUP_ENTRY_Y(0x2004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l1_rst_n_pb1 DRV_PINGROUP_ENTRY_Y(0x200c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_wake_n_pc2 DRV_PINGROUP_ENTRY_Y(0x2014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l2_rst_n_pb3 DRV_PINGROUP_ENTRY_Y(0x201c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l2_clkreq_n_pb2 DRV_PINGROUP_ENTRY_Y(0x2024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l3_clkreq_n_pb4 DRV_PINGROUP_ENTRY_Y(0x202c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pex_l3_rst_n_pb5 DRV_PINGROUP_ENTRY_Y(0x2034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_sgmii0_sma_mdio_pc0 DRV_PINGROUP_ENTRY_Y(0x203c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_sgmii0_sma_mdc_pc1 DRV_PINGROUP_ENTRY_Y(0x2044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio113_pb6 DRV_PINGROUP_ENTRY_Y(0x204c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio114_pb7 DRV_PINGROUP_ENTRY_Y(0x2054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm1_pa0 DRV_PINGROUP_ENTRY_Y(0x3004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm6_pa1 DRV_PINGROUP_ENTRY_Y(0x300c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm7_pa2 DRV_PINGROUP_ENTRY_Y(0x3014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm8_pa3 DRV_PINGROUP_ENTRY_Y(0x301c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_ufs0_ref_clk_pa4 DRV_PINGROUP_ENTRY_Y(0x3024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_ufs0_rst_n_pa5 DRV_PINGROUP_ENTRY_Y(0x302c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+
+#define drive_cpu_pwr_req_ph0 DRV_PINGROUP_ENTRY_Y(0x4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gpu_pwr_req_ph1 DRV_PINGROUP_ENTRY_Y(0xc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi3_cs0_pj1 DRV_PINGROUP_ENTRY_Y(0x34, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi3_cs3_pj2 DRV_PINGROUP_ENTRY_Y(0x3c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi3_miso_ph7 DRV_PINGROUP_ENTRY_Y(0x44, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi3_mosi_pj0 DRV_PINGROUP_ENTRY_Y(0x4c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi3_sck_ph6 DRV_PINGROUP_ENTRY_Y(0x54, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart5_cts_n_pj6 DRV_PINGROUP_ENTRY_Y(0x5c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart5_rts_n_pj5 DRV_PINGROUP_ENTRY_Y(0x64, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart5_rx_pj4 DRV_PINGROUP_ENTRY_Y(0x6c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart5_tx_pj3 DRV_PINGROUP_ENTRY_Y(0x74, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi1_cs0_pk2 DRV_PINGROUP_ENTRY_Y(0x7c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi1_cs1_pk3 DRV_PINGROUP_ENTRY_Y(0x84, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi1_miso_pk0 DRV_PINGROUP_ENTRY_Y(0x8c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi1_mosi_pk1 DRV_PINGROUP_ENTRY_Y(0x94, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi1_sck_pj7 DRV_PINGROUP_ENTRY_Y(0x9c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_extperiph2_clk_pk5 DRV_PINGROUP_ENTRY_Y(0xa4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_extperiph1_clk_pk4 DRV_PINGROUP_ENTRY_Y(0xac, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen12_i2c_scl_pk6 DRV_PINGROUP_ENTRY_Y(0xb4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen12_i2c_sda_pk7 DRV_PINGROUP_ENTRY_Y(0xbc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio124_pl0 DRV_PINGROUP_ENTRY_Y(0x1004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio125_pl1 DRV_PINGROUP_ENTRY_Y(0x100c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_fan_tach0_pl2 DRV_PINGROUP_ENTRY_Y(0x1014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio127_pl3 DRV_PINGROUP_ENTRY_Y(0x101c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio128_pl4 DRV_PINGROUP_ENTRY_Y(0x1024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio129_pl5 DRV_PINGROUP_ENTRY_Y(0x102c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio130_pl6 DRV_PINGROUP_ENTRY_Y(0x1034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio131_pl7 DRV_PINGROUP_ENTRY_Y(0x103c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gp_pwm9_pm0 DRV_PINGROUP_ENTRY_Y(0x1044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio133_pm1 DRV_PINGROUP_ENTRY_Y(0x104c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_cs_n_pt1 DRV_PINGROUP_ENTRY_Y(0x3004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_io0_pt2 DRV_PINGROUP_ENTRY_Y(0x300c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_io1_pt3 DRV_PINGROUP_ENTRY_Y(0x3014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_io2_pt4 DRV_PINGROUP_ENTRY_Y(0x301c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_io3_pt5 DRV_PINGROUP_ENTRY_Y(0x3024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_qspi0_sck_pt0 DRV_PINGROUP_ENTRY_Y(0x302c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio192_pt6 DRV_PINGROUP_ENTRY_Y(0x3034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio139_pp1 DRV_PINGROUP_ENTRY_Y(0x500c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap4_dout_pp7 DRV_PINGROUP_ENTRY_Y(0x5034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap4_sclk_pp6 DRV_PINGROUP_ENTRY_Y(0x503c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap4_din_pq0 DRV_PINGROUP_ENTRY_Y(0x5044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap4_fs_pq1 DRV_PINGROUP_ENTRY_Y(0x504c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio152_pq6 DRV_PINGROUP_ENTRY_Y(0x5074, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio153_pq7 DRV_PINGROUP_ENTRY_Y(0x507c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio155_pr1 DRV_PINGROUP_ENTRY_Y(0x5084, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_aud_mclk_pr0 DRV_PINGROUP_ENTRY_Y(0x508c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap1_sclk_pr2 DRV_PINGROUP_ENTRY_Y(0x5094, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap1_in_pr4 DRV_PINGROUP_ENTRY_Y(0x509c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap1_out_pr3 DRV_PINGROUP_ENTRY_Y(0x50a4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap1_fs_pr5 DRV_PINGROUP_ENTRY_Y(0x50ac, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen11_i2c_scl_pr6 DRV_PINGROUP_ENTRY_Y(0x50b4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen11_i2c_sda_pr7 DRV_PINGROUP_ENTRY_Y(0x50bc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio351_ps1 DRV_PINGROUP_ENTRY_Y(0x50cc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen0_i2c_scl_pw4 DRV_PINGROUP_ENTRY_Y(0x6004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen0_i2c_sda_pw5 DRV_PINGROUP_ENTRY_Y(0x600c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen1_i2c_scl_pw2 DRV_PINGROUP_ENTRY_Y(0x6014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen1_i2c_sda_pw3 DRV_PINGROUP_ENTRY_Y(0x601c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_fs_pw1 DRV_PINGROUP_ENTRY_Y(0x6044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_clk_pv6 DRV_PINGROUP_ENTRY_Y(0x604c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_din_pw0 DRV_PINGROUP_ENTRY_Y(0x6054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_dout_pv7 DRV_PINGROUP_ENTRY_Y(0x605c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio178_pv0 DRV_PINGROUP_ENTRY_Y(0x60ac, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart4_cts_n_pv5 DRV_PINGROUP_ENTRY_Y(0x60b4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart4_rts_n_pv4 DRV_PINGROUP_ENTRY_Y(0x60bc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart4_rx_pv3 DRV_PINGROUP_ENTRY_Y(0x60c4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart4_tx_pv2 DRV_PINGROUP_ENTRY_Y(0x60cc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwr_i2c_sda_pw7 DRV_PINGROUP_ENTRY_Y(0x60d4, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwr_i2c_scl_pw6 DRV_PINGROUP_ENTRY_Y(0x60dc, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio250_pf0 DRV_PINGROUP_ENTRY_Y(0x7004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio251_pf1 DRV_PINGROUP_ENTRY_Y(0x700c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio252_pf2 DRV_PINGROUP_ENTRY_Y(0x7014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dp_aux_ch0_hpd_pf3 DRV_PINGROUP_ENTRY_Y(0x701c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dp_aux_ch1_hpd_pf4 DRV_PINGROUP_ENTRY_Y(0x7024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm2_pf7 DRV_PINGROUP_ENTRY_Y(0x703c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_pwm3_pg0 DRV_PINGROUP_ENTRY_Y(0x7044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen7_i2c_scl_pg1 DRV_PINGROUP_ENTRY_Y(0x704c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen7_i2c_sda_pg2 DRV_PINGROUP_ENTRY_Y(0x7054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen9_i2c_scl_pg3 DRV_PINGROUP_ENTRY_Y(0x705c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen9_i2c_sda_pg4 DRV_PINGROUP_ENTRY_Y(0x7064, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio270_py0 DRV_PINGROUP_ENTRY_Y(0xa004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio271_py1 DRV_PINGROUP_ENTRY_Y(0xa00c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio272_py2 DRV_PINGROUP_ENTRY_Y(0xa014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio273_py3 DRV_PINGROUP_ENTRY_Y(0xa01c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio274_py4 DRV_PINGROUP_ENTRY_Y(0xa024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio275_py5 DRV_PINGROUP_ENTRY_Y(0xa02c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio276_py6 DRV_PINGROUP_ENTRY_Y(0xa034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio277_py7 DRV_PINGROUP_ENTRY_Y(0xa03c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio278_pz0 DRV_PINGROUP_ENTRY_Y(0xa044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio279_pz1 DRV_PINGROUP_ENTRY_Y(0xa04c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio282_pz4 DRV_PINGROUP_ENTRY_Y(0xa054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio283_pz5 DRV_PINGROUP_ENTRY_Y(0xa05c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio284_pz6 DRV_PINGROUP_ENTRY_Y(0xa064, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio285_pz7 DRV_PINGROUP_ENTRY_Y(0xa06c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio286_pal0 DRV_PINGROUP_ENTRY_Y(0xa074, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio287_pal1 DRV_PINGROUP_ENTRY_Y(0xa07c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio288_pal2 DRV_PINGROUP_ENTRY_Y(0xa084, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_xhalt_trig_pz2 DRV_PINGROUP_ENTRY_Y(0xa08c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio281_pz3 DRV_PINGROUP_ENTRY_Y(0xa094, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+
+#define drive_ao_retention_n_paa2 DRV_PINGROUP_ENTRY_Y(0x2c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_batt_oc_paa3 DRV_PINGROUP_ENTRY_Y(0x34, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_power_on_paa5 DRV_PINGROUP_ENTRY_Y(0x3c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_vcomp_alert_paa1 DRV_PINGROUP_ENTRY_Y(0x44, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_bootv_ctl_n_paa4 DRV_PINGROUP_ENTRY_Y(0x4c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio00_paa0 DRV_PINGROUP_ENTRY_Y(0x54, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio07_paa7 DRV_PINGROUP_ENTRY_Y(0x5c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio08_pbb0 DRV_PINGROUP_ENTRY_Y(0x64, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio09_pbb1 DRV_PINGROUP_ENTRY_Y(0x6c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_hdmi_cec_paa6 DRV_PINGROUP_ENTRY_Y(0x74, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen2_i2c_scl_pcc0 DRV_PINGROUP_ENTRY_Y(0x1004, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen2_i2c_sda_pcc1 DRV_PINGROUP_ENTRY_Y(0x100c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen3_i2c_scl_pcc2 DRV_PINGROUP_ENTRY_Y(0x1014, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gen3_i2c_sda_pcc3 DRV_PINGROUP_ENTRY_Y(0x101c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_gp_pwm4_pcc4 DRV_PINGROUP_ENTRY_Y(0x1024, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart0_tx_pcc5 DRV_PINGROUP_ENTRY_Y(0x102c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_uart0_rx_pcc6 DRV_PINGROUP_ENTRY_Y(0x1034, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi2_sck_pcc7 DRV_PINGROUP_ENTRY_Y(0x103c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi2_miso_pdd0 DRV_PINGROUP_ENTRY_Y(0x1044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi2_mosi_pdd1 DRV_PINGROUP_ENTRY_Y(0x104c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_spi2_cs0_n_pdd2 DRV_PINGROUP_ENTRY_Y(0x1054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio21_pdd3 DRV_PINGROUP_ENTRY_Y(0x105c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio23_pdd5 DRV_PINGROUP_ENTRY_Y(0x106c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio24_pdd6 DRV_PINGROUP_ENTRY_Y(0x1074, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio25_pdd7 DRV_PINGROUP_ENTRY_Y(0x107c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio26_pee0 DRV_PINGROUP_ENTRY_Y(0x1084, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_soc_gpio27_pee1 DRV_PINGROUP_ENTRY_Y(0x108c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+
+#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_io_hv, e_lpbk, e_input, e_lpdr, e_pbias_buf,	\
+			gpio_sfio_sel, schmitt_b)							\
+	{								\
+		.name = #pg_name,					\
+		.pins = pg_name##_pins,					\
+		.npins = ARRAY_SIZE(pg_name##_pins),			\
+			.funcs = {					\
+				TEGRA_MUX_##f0,				\
+				TEGRA_MUX_##f1,				\
+				TEGRA_MUX_##f2,				\
+				TEGRA_MUX_##f3,				\
+			},						\
+		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,	\
+					e_input, e_lpdr, e_pbias_buf,	\
+					gpio_sfio_sel, schmitt_b)	\
+		drive_##pg_name,					\
+	}
+
+static const struct tegra_pingroup tegra268_uphy_groups[] = {
+	PINGROUP(pex_l4_clkreq_n_pd0, PE4_CLKREQ_L, RSVD1, RSVD2, RSVD3, 0x8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l4_rst_n_pd1, PE4_RST_L, RSVD1, RSVD2, RSVD3, 0x10, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(eth0_mdio_pd4, ETH0_MDIO, RSVD1, RSVD2, RSVD3, 0x28, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(eth0_mdc_pd5, ETH0_MDC, RSVD1, RSVD2, RSVD3, 0x30, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(eth2_mdio_pe2, ETH2_MDIO, RSVD1, RSVD2, RSVD3, 0x40, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(eth2_mdc_pe3, ETH2_MDC, RSVD1, RSVD2, RSVD3, 0x48, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l1_clkreq_n_pb0, PE1_CLKREQ_L, RSVD1, RSVD2, RSVD3, 0x2000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l1_rst_n_pb1, PE1_RST_L, RSVD1, RSVD2, RSVD3, 0x2008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_wake_n_pc2, RSVD0, RSVD1, RSVD2, RSVD3, 0x2010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l2_rst_n_pb3, PE2_RST_L, RSVD1, RSVD2, RSVD3, 0x2018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l2_clkreq_n_pb2, PE2_CLKREQ_L, RSVD1, RSVD2, RSVD3, 0x2020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l3_clkreq_n_pb4, PE3_CLKREQ_L, RSVD1, RSVD2, RSVD3, 0x2028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pex_l3_rst_n_pb5, PE3_RST_L, RSVD1, RSVD2, RSVD3, 0x2030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(sgmii0_sma_mdio_pc0, SGMII0_SMA_MDIO, RSVD1, RSVD2, RSVD3, 0x2038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(sgmii0_sma_mdc_pc1, SGMII0_SMA_MDC, RSVD1, RSVD2, RSVD3, 0x2040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio113_pb6, USB_VBUS_EN0, RSVD1, RSVD2, RSVD3, 0x2048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio114_pb7, USB_VBUS_EN1, RSVD1, RSVD2, RSVD3, 0x2050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm1_pa0, GP_PWM1, RSVD1, RSVD2, RSVD3, 0x3000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm6_pa1, GP_PWM6, RSVD1, RSVD2, RSVD3, 0x3008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm7_pa2, GP_PWM7, RSVD1, RSVD2, RSVD3, 0x3010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm8_pa3, GP_PWM8, RSVD1, RSVD2, RSVD3, 0x3018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(ufs0_ref_clk_pa4, UFS0, RSVD1, RSVD2, RSVD3, 0x3020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(ufs0_rst_n_pa5, UFS0, RSVD1, RSVD2, RSVD3, 0x3028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+};
+
+static const struct tegra_pingroup tegra268_main_groups[] = {
+	PINGROUP(cpu_pwr_req_ph0, RSVD0, RSVD1, RSVD2, RSVD3, 0x0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gpu_pwr_req_ph1, RSVD0, RSVD1, RSVD2, RSVD3, 0x8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi3_cs0_pj1, SPI3_CS0, RSVD1, RSVD2, RSVD3, 0x30, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi3_cs3_pj2, SPI3_CS3, RSVD1, RSVD2, RSVD3, 0x38, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi3_miso_ph7, SPI3_DIN, RSVD1, RSVD2, RSVD3, 0x40, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi3_mosi_pj0, SPI3_DOUT, RSVD1, RSVD2, RSVD3, 0x48, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi3_sck_ph6, SPI3_SCK, RSVD1, RSVD2, RSVD3, 0x50, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart5_cts_n_pj6, UARTF_CTS, RSVD1, RSVD2, RSVD3, 0x58, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart5_rts_n_pj5, UARTF_RTS, RSVD1, RSVD2, RSVD3, 0x60, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart5_rx_pj4, UARTF_RXD, RSVD1, RSVD2, RSVD3, 0x68, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart5_tx_pj3, UARTF_TXD, RSVD1, RSVD2, RSVD3, 0x70, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi1_cs0_pk2, SPI1_CS0, RSVD1, RSVD2, RSVD3, 0x78, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi1_cs1_pk3, SPI1_CS1, RSVD1, RSVD2, RSVD3, 0x80, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi1_miso_pk0, SPI1_DIN, RSVD1, RSVD2, RSVD3, 0x88, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi1_mosi_pk1, SPI1_DOUT, RSVD1, RSVD2, RSVD3, 0x90, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi1_sck_pj7, SPI1_SCK, RSVD1, RSVD2, RSVD3, 0x98, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(extperiph2_clk_pk5, EXTPERIPH2_CLK, RSVD1, DMIC2_CLK, DSPK1_CLK, 0xa0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(extperiph1_clk_pk4, EXTPERIPH1_CLK, RSVD1, DMIC2_DAT, DSPK1_DAT, 0xa8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen12_i2c_scl_pk6, I2C12_CLK, RSVD1, RSVD2, RSVD3, 0xb0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen12_i2c_sda_pk7, I2C12_DAT, RSVD1, RSVD2, RSVD3, 0xb8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio124_pl0, RSVD0, SOC_THERM_OC3, RSVD2, RSVD3, 0x1000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio125_pl1, RSVD0, I2S5_SCLK, RSVD2, RSVD3, 0x1008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(fan_tach0_pl2, NV_THERM_FAN_TACH0, RSVD1, RSVD2, RSVD3, 0x1010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio127_pl3, RSVD0, RSVD1, NV_THERM_FAN_TACH1, RSVD3, 0x1018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio128_pl4, RSVD0, I2S5_SDATA_IN, RSVD2, RSVD3, 0x1020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio129_pl5, RSVD0, EXTPERIPH3_CLK, I2C15_CLK, RSVD3, 0x1028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio130_pl6, RSVD0, EXTPERIPH4_CLK, I2C15_DAT, RSVD3, 0x1030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio131_pl7, RSVD0, I2S5_SDATA_OUT, RSVD2, RSVD3, 0x1038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gp_pwm9_pm0, GP_PWM9, RSVD1, RSVD2, RSVD3, 0x1040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio133_pm1, RSVD0, I2S5_LRCK, RSVD2, RSVD3, 0x1048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_cs_n_pt1, QSPI0_CS_N, RSVD1, RSVD2, RSVD3, 0x3000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_io0_pt2, QSPI0_IO0, RSVD1, RSVD2, RSVD3, 0x3008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_io1_pt3, QSPI0_IO1, RSVD1, RSVD2, RSVD3, 0x3010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_io2_pt4, QSPI0_IO2, RSVD1, RSVD2, RSVD3, 0x3018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_io3_pt5, QSPI0_IO3, RSVD1, RSVD2, RSVD3, 0x3020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(qspi0_sck_pt0, QSPI0_SCK, RSVD1, RSVD2, RSVD3, 0x3028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio192_pt6, RSVD0, RSVD1, RSVD2, RSVD3, 0x3030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio139_pp1, RSVD0, I2C14_DAT, DMIC1_CLK, RSVD3, 0x5008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap4_dout_pp7, I2S4_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x5030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap4_sclk_pp6, I2S4_SCLK, RSVD1, RSVD2, RSVD3, 0x5038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap4_din_pq0, I2S4_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x5040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap4_fs_pq1, I2S4_LRCK, RSVD1, RSVD2, RSVD3, 0x5048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio152_pq6, RSVD0, I2S8_SCLK, RSVD2, RSVD3, 0x5070, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio153_pq7, RSVD0, I2S8_SDATA_OUT, RSVD2, RSVD3, 0x5078, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio155_pr1, RSVD0, I2S8_LRCK, RSVD2, RSVD3, 0x5080, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(aud_mclk_pr0, AUD_MCLK, RSVD1, RSVD2, RSVD3, 0x5088, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap1_sclk_pr2, I2S1_SCLK, RSVD1, RSVD2, RSVD3, 0x5090, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap1_in_pr4, I2S1_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x5098, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap1_out_pr3, I2S1_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x50a0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap1_fs_pr5, I2S1_LRCK, RSVD1, RSVD2, RSVD3, 0x50a8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen11_i2c_scl_pr6, I2C11_CLK, RSVD1, RSVD2, RSVD3, 0x50b0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen11_i2c_sda_pr7, I2C11_DAT, RSVD1, RSVD2, RSVD3, 0x50b8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio351_ps1, RSVD0, RSVD1, RSVD2, RSVD3, 0x50c8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen0_i2c_scl_pw4, I2C0_CLK, RSVD1, RSVD2, RSVD3, 0x6000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen0_i2c_sda_pw5, I2C0_DAT, RSVD1, RSVD2, RSVD3, 0x6008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen1_i2c_scl_pw2, I2C1_CLK, RSVD1, RSVD2, RSVD3, 0x6010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen1_i2c_sda_pw3, I2C1_DAT, RSVD1, RSVD2, RSVD3, 0x6018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_fs_pw1, I2S2_LRCK, RSVD1, RSVD2, RSVD3, 0x6040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_clk_pv6, I2S2_SCLK, RSVD1, RSVD2, RSVD3, 0x6048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_din_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_dout_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio178_pv0, RSVD0, RSVD1, I2S7_SDATA_OUT, RSVD3, 0x60a8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart4_cts_n_pv5, UARTE_CTS, RSVD1, RSVD2, RSVD3, 0x60b0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart4_rts_n_pv4, UARTE_RTS, RSVD1, RSVD2, RSVD3, 0x60b8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart4_rx_pv3, UARTE_RXD, RSVD1, RSVD2, RSVD3, 0x60c0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart4_tx_pv2, UARTE_TXD, RSVD1, RSVD2, RSVD3, 0x60c8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwr_i2c_sda_pw7, I2C5_DAT, RSVD1, RSVD2, RSVD3, 0x60d0, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwr_i2c_scl_pw6, I2C5_CLK, RSVD1, RSVD2, RSVD3, 0x60d8, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio250_pf0, DCA_VSYNC, DCB_VSYNC, DCC_VSYNC, DCD_VSYNC, 0x7000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio251_pf1, DCA_HSYNC, DCB_HSYNC, DCC_HSYNC, DCD_HSYNC, 0x7008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio252_pf2, RSVD0, DSA_LSPII, RSVD2, RSVD3, 0x7010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dp_aux_ch0_hpd_pf3, DP_AUX_CH0_HPD, DCE_VSYNC, DCF_VSYNC, DCG_VSYNC, 0x7018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dp_aux_ch1_hpd_pf4, DP_AUX_CH1_HPD, DCE_HSYNC, DCF_HSYNC, DCG_HSYNC, 0x7020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm2_pf7, GP_PWM2, BL_EN, RSVD2, RSVD3, 0x7038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(pwm3_pg0, GP_PWM3, BL_PWM_DIM0, RSVD2, RSVD3, 0x7040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen7_i2c_scl_pg1, I2C7_CLK, RSVD1, SOUNDWIRE1_CLK, RSVD3, 0x7048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen7_i2c_sda_pg2, I2C7_DAT, RSVD1, SOUNDWIRE1_DAT0, RSVD3, 0x7050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen9_i2c_scl_pg3, I2C9_CLK, RSVD1, SOUNDWIRE1_DAT1, RSVD3, 0x7058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen9_i2c_sda_pg4, I2C9_DAT, RSVD1, SOUNDWIRE1_DAT2, RSVD3, 0x7060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio270_py0, RSVD0, I2C16_CLK, RSVD2, RSVD3, 0xa000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio271_py1, RSVD0, I2C16_DAT, RSVD2, RSVD3, 0xa008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio272_py2, RSVD0, I2S3_SCLK, RSVD2, RSVD3, 0xa010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio273_py3, RSVD0, I2S3_SDATA_OUT, RSVD2, RSVD3, 0xa018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio274_py4, RSVD0, I2S3_SDATA_IN, RSVD2, RSVD3, 0xa020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio275_py5, RSVD0, I2S3_LRCK, RSVD2, RSVD3, 0xa028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio276_py6, RSVD0, RSVD1, RSVD2, RSVD3, 0xa030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio277_py7, RSVD0, RSVD1, RSVD2, RSVD3, 0xa038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio278_pz0, RSVD0, RSVD1, RSVD2, RSVD3, 0xa040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio279_pz1, RSVD0, RSVD1, RSVD2, RSVD3, 0xa048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio282_pz4, RSVD0, PM_TRIG1, RSVD2, RSVD3, 0xa050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio283_pz5, RSVD0, RSVD1, RSVD2, RSVD3, 0xa058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio284_pz6, RSVD0, RSVD1, RSVD2, RSVD3, 0xa060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio285_pz7, RSVD0, RSVD1, RSVD2, RSVD3, 0xa068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio286_pal0, RSVD0, RSVD1, RSVD2, RSVD3, 0xa070, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio287_pal1, RSVD0, RSVD1, RSVD2, RSVD3, 0xa078, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio288_pal2, RSVD0, RSVD1, RSVD2, RSVD3, 0xa080, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(xhalt_trig_pz2, XHALT_TRIG, RSVD1, RSVD2, RSVD3, 0xa088, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio281_pz3, RSVD0, PM_TRIG0, RSVD2, RSVD3, 0xa090, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+};
+
+static const struct tegra_pingroup tegra268_aon_groups[] = {
+	PINGROUP(ao_retention_n_paa2, RSVD0, RSVD1, RSVD2, ISTCTRL_IST_DONE_N, 0x28, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(batt_oc_paa3, SOC_THERM_OC2, RSVD1, RSVD2, RSVD3, 0x30, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(power_on_paa5, RSVD0, RSVD1, RSVD2, RSVD3, 0x38, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(vcomp_alert_paa1, SOC_THERM_OC1, RSVD1, RSVD2, RSVD3, 0x40, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(bootv_ctl_n_paa4, RSVD0, RSVD1, RSVD2, RSVD3, 0x48, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio00_paa0, RSVD0, RSVD1, RSVD2, RSVD3, 0x50, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio07_paa7, RSVD0, RSVD1, RSVD2, RSVD3, 0x58, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio08_pbb0, RSVD0, RSVD1, RSVD2, RSVD3, 0x60, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio09_pbb1, RSVD0, RSVD1, RSVD2, RSVD3, 0x68, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(hdmi_cec_paa6, HDMI_CEC, RSVD1, RSVD2, RSVD3, 0x70, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen2_i2c_scl_pcc0, I2C2_CLK, RSVD1, RSVD2, RSVD3, 0x1000, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen2_i2c_sda_pcc1, I2C2_DAT, RSVD1, RSVD2, RSVD3, 0x1008, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen3_i2c_scl_pcc2, I2C3_CLK, RSVD1, RSVD2, RSVD3, 0x1010, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gen3_i2c_sda_pcc3, I2C3_DAT, RSVD1, RSVD2, RSVD3, 0x1018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(gp_pwm4_pcc4, GP_PWM4, TOUCH_CLK, RSVD2, RSVD3, 0x1020, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart0_tx_pcc5, UARTA_TXD, RSVD1, UARTL_TXD, RSVD3, 0x1028, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(uart0_rx_pcc6, UARTA_RXD, RSVD1, UARTL_RXD, RSVD3, 0x1030, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi2_sck_pcc7, SPI2_SCK, RSVD1, I2S9_SCLK, SOUNDWIRE0_CLK, 0x1038, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi2_miso_pdd0, SPI2_DIN, RSVD1, I2S9_SDATA_OUT, SOUNDWIRE0_DAT0, 0x1040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi2_mosi_pdd1, SPI2_DOUT, RSVD1, I2S9_SDATA_IN, RSVD3, 0x1048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(spi2_cs0_n_pdd2, SPI2_CS0, RSVD1, I2S9_LRCK, RSVD3, 0x1050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio21_pdd3, RSVD0, TSC_SYNC1, DMIC5_DAT, RSVD3, 0x1058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio23_pdd5, RSVD0, RSVD1, TSC_EDGE_OUT2, TSC_EDGE_OUT0C, 0x1068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio24_pdd6, RSVD0, TSC_EDGE_OUT3, RSVD2, TSC_EDGE_OUT0D, 0x1070, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio25_pdd7, RSVD0, TSC_EDGE_OUT0, RSVD2, TSC_EDGE_OUT0A, 0x1078, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio26_pee0, RSVD0, TSC_EDGE_OUT1, RSVD2, TSC_EDGE_OUT0B, 0x1080, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(soc_gpio27_pee1, RSVD0, TSC_SYNC0, RSVD2, RSVD3, 0x1088, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+};
+
+static const struct tegra_pinctrl_soc_data tegra268_uphy_pinctrl = {
+	.pins = tegra268_uphy_pins,
+	.npins = ARRAY_SIZE(tegra268_uphy_pins),
+	.functions = tegra268_functions,
+	.nfunctions = ARRAY_SIZE(tegra268_functions),
+	.groups = tegra268_uphy_groups,
+	.ngroups = ARRAY_SIZE(tegra268_uphy_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = true,
+	.drvtype_in_mux = true,
+	.sfsel_in_mux = true,
+};
+
+static const struct tegra_pinctrl_soc_data tegra268_main_pinctrl = {
+	.pins = tegra268_main_pins,
+	.npins = ARRAY_SIZE(tegra268_main_pins),
+	.functions = tegra268_functions,
+	.nfunctions = ARRAY_SIZE(tegra268_functions),
+	.groups = tegra268_main_groups,
+	.ngroups = ARRAY_SIZE(tegra268_main_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = true,
+	.drvtype_in_mux = true,
+	.sfsel_in_mux = true,
+};
+
+static const struct tegra_pinctrl_soc_data tegra268_aon_pinctrl = {
+	.pins = tegra268_aon_pins,
+	.npins = ARRAY_SIZE(tegra268_aon_pins),
+	.functions = tegra268_functions,
+	.nfunctions = ARRAY_SIZE(tegra268_functions),
+	.groups = tegra268_aon_groups,
+	.ngroups = ARRAY_SIZE(tegra268_aon_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = true,
+	.drvtype_in_mux = true,
+	.sfsel_in_mux = true,
+};
+
+static int tegra268_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct tegra_pinctrl_soc_data *soc = device_get_match_data(&pdev->dev);
+
+	if (!soc)
+		return -ENODEV;
+
+	return tegra_pinctrl_probe(pdev, soc);
+}
+
+static const struct of_device_id tegra268_pinctrl_of_match[] = {
+	{ .compatible = "nvidia,tegra268-pinmux-uphy", .data = &tegra268_uphy_pinctrl},
+	{ .compatible = "nvidia,tegra268-pinmux-main", .data = &tegra268_main_pinctrl},
+	{ .compatible = "nvidia,tegra268-pinmux-aon", .data = &tegra268_aon_pinctrl},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra268_pinctrl_of_match);
+
+static struct platform_driver tegra268_pinctrl_driver = {
+	.driver = {
+		.name = "tegra268-pinctrl",
+		.of_match_table = tegra268_pinctrl_of_match,
+	},
+	.probe = tegra268_pinctrl_probe,
+};
+
+static int __init tegra268_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra268_pinctrl_driver);
+}
+module_init(tegra268_pinctrl_init);
+
+static void __exit tegra268_pinctrl_exit(void)
+{
+	platform_driver_unregister(&tegra268_pinctrl_driver);
+}
+module_exit(tegra268_pinctrl_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("NVIDIA Corporation");
+MODULE_DESCRIPTION("NVIDIA Tegra268 pinctrl driver");
-- 
2.43.0

