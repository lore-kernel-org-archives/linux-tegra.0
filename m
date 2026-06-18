Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A31343D8A;
	Thu, 18 Jun 2026 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811352; cv=fail; b=J2CX2yUWFbRXD7Ctj/zAby2LAb9v01GoknKUhJpzo/ElQHSojTJhBQRVMNFzJAXxxnRZeVRkaQvtzU5cLzkzGn8jVRNKSnu6Q10yME/BDSj9DjeogxLsOZfEkTGulvFgnqK1YCv2iwLDT7UO0zHsXBX5ay45UrvvlrJWkNxuWZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811352; c=relaxed/simple;
	bh=SEf512XQi4BSAQvOuKJp3js0DtbqCGyRQ6hJ2jvzyns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s481HSo1S8vbDkvgHf5HDaLtSjC6O0WImb6r//m9URMVKZJ5cvIvdhcxO3p7loCjUS29Wv9FXwULv3hsfQ9TBdo9zB+fokMIIzIcTX6/3dKC+UVE2cQ90oxhKjSSqmt2MdeGLjDCcl/KFv4iRkaiPjiZdAAYZTlEVOSG02Pv46I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RLuYZxcA; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RLuYZxcA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAL87ZregJ9xzsOSg5HxTv6n8wKpcPBF1q+kgfxt24+llROn5diYGmiR1ELETML4dHzzBNI9LMI1OiU0SGs5GpJSru/yf7gWzAawdkgfnzMBoGVpHvj0aNhK+49FhzF/eJ136M8tFGGKzTOrLTgHnqMaQbOBwANG/ZWg5JySza1LtGdUQbvWX6vr0JxoQ4NK+LHrpsE9s1dkIT5B1RbXpLvmYQ7pd8krgtExi8WinMd960xzkHYGhEVZlrSuDm2n+d+23HuW4FccbmPERX8tuEjHbis5X1so2AQCgQgGF+0dTSeKS30EYkPWsHMNV9j2nsvwCB8F1FwtdfV04ieRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG+phzadvR5frCOuFqd4v1+9N97TAgc2Ju7m09jnEbo=;
 b=IZiFGC3b+jP0ILDrTgEOlYVLp+sn4XirsMkdt2oQ7lpKz2AIyDC4YJ30KP5s/T777IWZaLS0NVuVzWPopQYHnvENRsNz5XLQvPit6MBt0yHu0jLANSNKcY6EpehA3ROGmyK28MJiMa0CbJEqzI/LtpXoWEPvySKQV5D5RKM1swYjURr2ly9m9tKaKM1FRMU34k/2s0wEsMpgeqpOLjkDEMeYHF0r3P+j+cR+z46avWK4YBWWQjWv7lSCllc1PClWaDH0mbi3Y+pppdivtOkCB2bRzd9/K07YtFO9gr2otdaBgAP1wZVOAqMdafnSRdgktdq62pOrZPjRlljRP6j4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG+phzadvR5frCOuFqd4v1+9N97TAgc2Ju7m09jnEbo=;
 b=RLuYZxcATD9rzRwb5bZ5QjYybB2Ksf98SBIOSVcx+cunTuKljs4RVWtht5VYXTaqxuw9GKaVmSbFlg9P4yNGQFEuNUazD81awTAIK1xvnydRUvsj2Be44vQn5zNyKkD4Eqe/KSOQSgGg2QlD6Xsn3Gy7H+4rcJ5L2I91dOyPA9eeNtgrUjpMkWzU05BJeeYHUCewwD80jbMZhM1MmkRAcpe5KjfHCRv0kAW+2DC4Aymrji0MClLM6I58J0wPCEmh3VGsIrnLNmwbPu3KcezaZFN3pUxWG/pVLP58UsJGjxvMT0WnTDhtgBNHiapUypVN/XSCn3TxOtC6KvzV+mZfqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 19:35:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:35:44 +0000
Date: Thu, 18 Jun 2026 15:35:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <ajRIhqyT8bSi3EkN@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
 <20260616095429.3947205-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
X-ClientProxiedBy: PH7P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c21eaf-4f55-4066-2669-08decd70ca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|56012099006|11063799006|3023799007|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+wiczm52a8MephlXMzVvg/VzK6pqeZf2bQjF2uDhmrNJpy9TDjcdZH/i2b1a2JRshP7j/ITCTtCNvx7W/yvX1ApiEAEZ7ppWIX6ffeWtsMaltATInNnBTtXZm2Otb9H9kT38IwP4mIiaEhRZ8wQtS6O0k/r2NWi1CKLXb2OO9oroGt5F3N6BioMvwzLJEdLsOo2/F2ZyhSsl07sfsKrTAQAt7ijSsKIKy3l1uHR8Nwe3aTr5jR5yHqMhnVFc0krhS5jQs/7lFHOoTocC1lkunwy+6xBzprnEIbnYEho9wx9QAsDgQImfR3Ng9J4phIlgjOkYPXuQJcQjMBERlrR1MoMnm14fciiyxu0u7r1vCKt5vzqhq+XgPUu2xA6sxvNDU1zu0bcdZhpd7b+AFnFsB9GNL1gca5BPVzYMGCnU0IIGTKL//tLINwACtzydTtdvJ4mEZO+hTOaSYqKMtqrtrgI/iNpoapvZ+SX+gFRZW/MOabn8XPjISEY7s3+p1XrJwPAj2Y3zyYX3cGypTU21idpkx3FcFlvDulA3bXi9WKE30n+P1Mp2jZmtg4ppciRoqRBsMtq1/ChrX38BDOuHjdOocdMXuQg1xT6C03Na/yQnp6QH7qUgBAESYC9Zizs8SBggt+mYByajLDd12XGdJrAkwvnnHzKbzdhitMCogpxb8d7ewXlBquOEr0yoGkSXtKBEdYSAgJqagbsI4p+pFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(56012099006)(11063799006)(3023799007)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ngMOuOMtuShTJGkDU+D5AEXmg3jSbfh1sOznLa5KgT+zt5cWaXqWVrhz0VF1?=
 =?us-ascii?Q?AsZQ70oC7swrgihjkFFFgfbpvW4f2p66vELQ55O9lFYQKjf9+EHPqtHDneJf?=
 =?us-ascii?Q?ypDUV1yjQz8vIYkTejj+f1ycv5dYwWiszU5h2TUuF3RrGGBYOWy9321KuE+Z?=
 =?us-ascii?Q?WmXh30sP0UvK1S2HcbnJJS0ZK5JoSVB2dupPIBayH5ZM59jNhXfGCuhOVyhG?=
 =?us-ascii?Q?9Fbmp74/qIoo03K/sH/C46Rz/k0FCt9dnXWsuh7cI10f9h7I76mwPo1+Yn4c?=
 =?us-ascii?Q?Z9TWDAYeJ7lNRW2oa86QAnjRE4Pg76MT86+o/KwEHioyOThePkBUa/94RfUt?=
 =?us-ascii?Q?lEHwIBc2sbFTjYdLu6w78EdN3PzN4hqA7EwNkedNQZJPpRMtW/xnxXS6+gP3?=
 =?us-ascii?Q?qUGgRRC4pvW0ciNcg2ifD2KDn9DiXfXetYUiV6OAfEI9tzlJAlCLYa7ikd5f?=
 =?us-ascii?Q?BSN7iCAg3EDiIm6UwkeFhtTCbkYunuVUe3u5sHg8Yl5mBSC+UUCi6yFC4/hJ?=
 =?us-ascii?Q?PPshqZ3VUb8Ku1DmZkcfOK6r/SJFq0lKiTIQFOZb79os7dtiOTXTAMR5Brmd?=
 =?us-ascii?Q?VpCaB8okEioUeRH5XDNRGA7ifBFwk+zFuYf8Om0/8izwlIQAxbdx9+gtY4qV?=
 =?us-ascii?Q?uXT0OI5sDiiyStwfwxqLqg1o84SEcoO8fW4auN+sp6NuibPOBHRZQzsJS94f?=
 =?us-ascii?Q?XhISqj1TuI7+oIKJ9Wfcyj/6agEz+kWnEVTogK/7/4UsI4KkR4+AUuI+RX5O?=
 =?us-ascii?Q?L6GuCfwS35Q3gOoRibxQHb/Ft0xN7Kiew1jS09xLR9Q60wmCPLIeYwwjW6oB?=
 =?us-ascii?Q?UXZL/Yz8bqhMC8Nn2eGZwvsCa7zsDlkDmQraDKYz0z/M9h23f7pXcf/iZ+xg?=
 =?us-ascii?Q?GaM6AhFBrzQSc2dR0wOJvW4aLnTr/8gyDcENF0CDfWwgERqhvDLkfpwKHx8J?=
 =?us-ascii?Q?ncQlpvBhEGs9MwHScVaR0vJxsQynXVymQPDibCHdHyHvME1dvYKJt/nVJsz9?=
 =?us-ascii?Q?5tVxKGQd/k4cjVNRVHmwVwFV2OaANoFBd7kTGztz9H+HP2WSOyYPX4dd9YHE?=
 =?us-ascii?Q?C33u1hsIMNWLmm62QXKro1y0uSVs6cSLt5A6ktagYeJBmfKpE7E2JFzhCOgw?=
 =?us-ascii?Q?hugbXei+ji83rAmZDFxmBExpE4u4CPUrq+lThyh+WX74M1Yhu+P8UvEodc63?=
 =?us-ascii?Q?nXcQZBZwBDmi1dUfJSgEdWsL2YNYwvd7S25rRHoZ8M3z3Lfhgsst9T8UMtkJ?=
 =?us-ascii?Q?GZAgMZKb741cAxoizHF9DA2mrfAbM67+o/gGpCAFCXNOOYFLyAwPm6Dz/ryD?=
 =?us-ascii?Q?t+9hRukI85doUlS158A98mU99zSEjfD7H8/Nbog+KjkndQFn88NIqvce1WRL?=
 =?us-ascii?Q?guZXvHdiFi0+GuWgI8CmNBS9TM1Z2CmUEAfUwOwRaJ5hKaM7EXrwbTNGY5Or?=
 =?us-ascii?Q?IiHKdYzY+KusNFicFYt79AVW95GRkQR/8Wa44OtwDP2EVGIJmDx7UPzT4SWr?=
 =?us-ascii?Q?vJjB+fqytUYoU/PRJOtoohV0ORKZIsIMr+w6rnuXCAFy8xZ6fv7YO2L/H94Y?=
 =?us-ascii?Q?chw59+neage003XSfIOtxGni7uaYimToGwoMReGC5rUQsR+lG0PsQDrpe84W?=
 =?us-ascii?Q?QLiNKgImhrlQilaPQFr99NhL1kg/QgjyKZE1+3yQCPaRxpOqvpyyLReL4iQM?=
 =?us-ascii?Q?jPu30aHXoRhvBd4nihaL1XLg2XZoCeqhvNfe2yjayJtZ0MmlmM1r4/mHu2KT?=
 =?us-ascii?Q?A52I4LRFDM4sI88jBDpxVb59LM09DTj+naFy8LrLRWdzObEpi7Rl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c21eaf-4f55-4066-2669-08decd70ca18
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:35:44.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1tnvdrKPOLG4DjKduMxjiRlh/kTIZ8sK3B7JCwcAmW+Reggmpnilz7XU1KU0gH+8elfx8/ilhCIoG8BiO5Tk56PZpLlXkJcGVgUOP93ezmluePlNtOxFROSD7x8efYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

On Tue, Jun 16, 2026 at 09:54:15AM +0000, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
>
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
>
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
>
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/i3c/i3c.yaml          | 36 ++++++++++++++++---
>  include/dt-bindings/i3c/i3c.h                 |  4 +++
>  2 files changed, 35 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd785..5603f2e7807d 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -31,10 +31,12 @@ properties:
>        described in the device tree, which in turn means we have to describe
>        I3C devices.
>
> -      Another use case for describing an I3C device in the device tree is when
> -      this I3C device has a static I2C address and we want to assign it a
> -      specific I3C dynamic address before the DAA takes place (so that other
> -      devices on the bus can't take this dynamic address).
> +      Other use-cases for describing an I3C device in the device tree are:
> +      - When the I3C device has a static I2C address and we want to assign
> +        it a specific I3C dynamic address before the DAA takes place (so
> +        that other devices on the bus can't take this dynamic address).
> +      - When the I3C device requires SETAASA for its discovery and uses a
> +        pre-defined static address.
>
>    "#size-cells":
>      const: 0
> @@ -145,7 +147,31 @@ patternProperties:
>            Dynamic address to be assigned to this device. In case static address is
>            present (first cell of the reg property != 0), this address is assigned
>            through SETDASA. If static address is not present, this address is assigned
> -          through SETNEWDA after assigning a temporary address via ENTDAA.
> +          through SETNEWDA after assigning a temporary address via ENTDAA. If
> +          SETAASA is used, this property is not used, and the static address itself
> +          becomes the dynamic address.
> +
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1
> +        maximum: 0x7
> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment from a
> +          static address are supported by this I3C Target. For each defined bit
> +          position, a set bit indicates support for that method and a cleared
> +          bit indicates lack of support.
> +
> +            Bit 0: SETDASA CCC (Direct)
> +            Bit 1: SETAASA CCC (Broadcast)
> +            Bit 2: Other CCC (vendor / standards extension)
> +            All other bits are reserved.
> +
> +          This property follows the MIPI I3C specification. The primary use
> +          of this property is to indicate support for SETAASA, i.e Bit 1, but
> +          will allow other values mentioned in the specification so that it
> +          mirrors the specification. SETDASA will remain as the default method
> +          even if this property is not present.
>
>      required:
>        - reg
> diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
> index 373439218bba..78b8c634aad8 100644
> --- a/include/dt-bindings/i3c/i3c.h
> +++ b/include/dt-bindings/i3c/i3c.h
> @@ -13,4 +13,8 @@
>  #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
>  #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
>
> +#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
> +#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
> +#define I3C_ADDR_METHOD_VENDOR      (1 << 2)
> +
>  #endif
> --
> 2.43.0
>
