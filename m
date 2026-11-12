Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517572;
	b=JZR5K1ylq1fLnFz0t3QB+l9guXBTncrZjJIsGgrD7Q15H45YM7pKt5l84AEIaPGWEzo4
	 PUVDmgGC2ThkFETT8s8/uf2z7qp1m61buH1Mi5Lx5g+ahOshRKz4Hh7Dr12F48VqLMoGN
	 bB2q9MVe9dR0dY3Bn4fvGs4ekFVrEoaEvV8TIyhjveHev+PJ85bFbLm+zo8ZTrNenfaSs
	 a3eSSigBi0fwFTaBk8YNUm5hHF/a1YFCwxQLvZKeNkG1WRw8HOdazvA7b8tJChYG33itS
	 QRAZfS+tkOvIDfhSOonh7nM7oR6DrNBqLSYOI1iBh+JISMDXnwfWY1EZgBCdMI6hJRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517572;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=088SWogfLhQ/ouuhbH2un1VO1akx5u1lLEMzvvcW8eA=;
	b=OqH+6dFEzNJy90amoR1tizE/Cbyrje9RFev0Sm+SPRtsrdeItYF7w3Yqut7oT5m6dcL4
	 xMx5muYSyze1Gg81bVUo6WhPGEABFJ3Pe2xyKQ7n31LxNAge1t+gFUjCLQLrI8xbD58X7
	 gJ/iy59xW019EHHVgQAl6toQJSw94zJEDbpyYyEHsl/9r/1xQxYhPQpJaJiCODkyQ7ffB
	 SGh+EItM2/feX8iJKzXMez7wAvOXM8EVgSwhIDmaCCpYExUsZ9AYRqJV2OU120ej9S7hT
	 KbEFMXDEUzwocpsHp09ZVUt1r/qRb+JNuScFdzs/XWIPrYxJM3PEVKIj0Apoha7dFJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YXVOzEg3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.0
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8C9606A31C;
	Thu, 12 Nov 2026 21:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YXVOzEg3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfpGQTRJqvZNGvF4i2M7PykwK08EUjhVK/+skU11JtujKRF4xny+1HKf3bsw4MMBB5SJO2ssDvhuYV2KpgNIDYJK1zCsZgUwFm8xsAKHR0Mo4G51rgSOj3dqpFoXGoW1FYORgdLd+2XXbwI8Eakr5hQkdFYb55cOIEnwZ0zNKW76yNVCdINmwM64y/8C4uhXC5HADFsUcN1R98zFEUsKe8+LMbw2ltyFulx6xt8y2Ht5ac/CPm6JP9N1ZtcHwfHH8R6xDxrwKYMBF0rZ6TZ8Bl2elk/KzgpI2Q4wTFCg8Z23lDti3Xq7c9RJ+QxzcJHek6YvZZzHU8ceuwqi6/7rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=088SWogfLhQ/ouuhbH2un1VO1akx5u1lLEMzvvcW8eA=;
 b=yYoHF+6MCBdhFQuoTjMgRkkNw0pe28kQwkSG5Z2jZJCq/j0V7y4DJalQ3/QxHVqjCYBiGe6rPyKoM9UWaMOnMR8gAOz/rkycCkyse7ffN3AL2PTnt2YvPnF3zuKju/GB/c6jmGwLattHBzX8mj765DMtTvPNAyDZxR1g2XxKoK5IEeqg0SeBHGCVuosXgR32cTl0bnbQMhQ84w2J7LpzBzrBHBRtRxCRodvfzoXNSOqN36RvCnLBkmM+jwdJeDpfJF+hw8wVlRYIklq0fgZo/0UN+QvkiCtBZKOJ4UPfIRCde5E3nu8R+GVCk/x2t3+4dTjxItKNW5Z5226509c7CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=088SWogfLhQ/ouuhbH2un1VO1akx5u1lLEMzvvcW8eA=;
 b=YXVOzEg3USzFytRqBF3cIKLZw2lRxGeGDX5DrF+HuAlxem5+tZx5arTjKohcBp1s8Eb5/Hpvbp+8Pvz3btriymQYqQ941Naz/qC2trEfn4ptn/pDKB3IeLepMfdLD1p0epHDS+3kuTZGqTHE/xtOCbwhzqLOt9kEbs1YPVEX3ZVjapcZVE6yqgaxC2N4lgysbjpOT7uurCRV32jeD5Zfown+FTF6x9sjUIiRBBHF+Tk0qnvJJTRBI9Leq7l5ep693d+JGMnOejF2nemrvyDmWD65PWWlBZIOacP58DSidrCYRTjX9tvxN0u6bl8Tjw4FpOQ0uz9D7NPAL2EbFv1vSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB715228.eurprd04.prod.outlook.com (2603:10a6:2c8:44::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 21:06:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:06:09 +0000
Date: Thu, 12 Nov 2026 15:05:56 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Sheetal <sheetal@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268
 support
Message-ID: <avYqNEiy2ZiNItlK@SMW015318>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
 <20261104110932.1097294-2-sheetal@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104110932.1097294-2-sheetal@nvidia.com>
X-ClientProxiedBy: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB715228:EE_
X-MS-Office365-Filtering-Correlation-Id: 3606ed3f-ff4b-4e5d-d537-08df4100c609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261009223027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	0AHz8cO/Hy4AWeHxDEccyR7k8zjN1fzjQTjFtMqOnmOWjJfRw7XClJcGt6H3KigD78U3aL+deSfMvRLXh4cUsijDoGijAYYDx9Aq8SI4vb+A4BJuI9kY6kVUrMXZY7SiSsjUwDUGJ6ShjY6I5YHwnkbupePA3YcQjcA6yjUl93t4r6AQwPWbTc7p4qpb84czL+cTiOJHnLGMor+h8jAPmcYGf6itRlh/My4afNos0T59g3uCDP7Iu7MuxVk23ngmwNC1AyQCAVuzaD1qum0p3CzzdEL/EDnoJyIh4puyqz9DsJZkP8XBHxNGMhR9ri9/ak1+mo/feeoHcdaPNzfiyKJspTzC6irosOBnj5yZfU2lahU+rSr+uAOvGHEcbFiWjh/qHjsksVrfyL5RX40M8bVVa1ZuZ/7aHm0DJqMZl998zb8gKvk62RsSlBsO4EFBvohQTxJe3VZXr7K1C0RLJKotxyoDn8yTKm+ldeIa7Aa4oMTcqECHFm3nSAzmpe13WAKqLF/dycUn9BqZHSIWhG8JJkUFuDwdx2FYWKMNjZB63hOgqxaM+Oe5N4K2aSUJLIMYyHxRv421KaPl1RuvYozOQPfywji6I/LzjXz7G7m0VihBBh/DxU9Bg5CyuGiEEZfDrux0AHGAeYy+4JIC/2MQZ7mtVEPuTCXnv1xK/88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261009223027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kmhp9576Ju4T0vp1NetYGNhUE4Jib8FfQtZSmfXGZ30XmjCuYBSC8OapV4PD?=
 =?us-ascii?Q?udBstOTZEjD1z7kby+4SlHKym9QSTinT34zd1ka0WS0m/v8izlsCQ7QxM2pD?=
 =?us-ascii?Q?r4ax0etp2vn8AD0/1IiV/W3EfEtDHrcUbbx/zfgPJlAPx0qemX/jHq63SHjD?=
 =?us-ascii?Q?trqaNa3esKCC0PQeBDQQodIvj7t0UM9A96XkUHqJIie8s+NY3fZd2r0YS++S?=
 =?us-ascii?Q?+C5L2XGeswWtoaC82bbYL6lPfpB8iE7SXKmYdLo6tYIaL+L1fI6cx6Luw26E?=
 =?us-ascii?Q?MI68ZlJthbnCIG93W9ciI2p4c/x4Ys/evYoDLTQBLzCC03g/8/fy+j1zNUUZ?=
 =?us-ascii?Q?4sV7e1l8YNMPMtpSDcKao4HwpepmV/orA5onFAHtEhLxn2SZ+7G85UXxUK4U?=
 =?us-ascii?Q?71rw0MBPe2gqCREMEGziwkA0UkhYnTq+nAjwIGgt+vmZ4kZgq1xL+4OoK1rX?=
 =?us-ascii?Q?1CpLxj6uw63rQlfgGdmB9UGBxvmuOBejVAmNnUdwZfXvp7jisN9KvdCO10lx?=
 =?us-ascii?Q?oyORJX4I/T+io/hzRROX39NFmTDzHCjt/bPgwNJ59ifbtYiD2e8Iodt4soLY?=
 =?us-ascii?Q?SmuqRycFbkCgOtSwdCaGFUX69hkx4+Gq2eeEUsDZQEPxH1ajUoHjM38NDGgG?=
 =?us-ascii?Q?CMz0D/lE+7K8ixtGMbaCHQK2f5Z6qRvypIp/yL76x/vqz/dDkA8eM9cUKUWF?=
 =?us-ascii?Q?uHaCh0lwFWiwKypiLOw/AifbMJgGRY8CJim2IOnEAJitrBDz2zKlJnIUIA1b?=
 =?us-ascii?Q?FUEsgTTCg0J6SYGj0ezWuStjsIQMJAn7mGQlPL4U1KfM6hREop+8jlsFi31y?=
 =?us-ascii?Q?B603Gg8yTXpfpfXcwwa4pC/xP4/phVX5ZxXos89yd9PbEN8jdod3eGxiFYuF?=
 =?us-ascii?Q?nKSk0CMPIuUZ/N+3Gys5jfYf5Dycex/TB+rA2D1aBT8UPnbafzownugVyQHK?=
 =?us-ascii?Q?yKKk9pCXFJltkaXNewR+FmxFqq9pBbok7Js16fKWrBIX4Ndlsh+PARbkvBYE?=
 =?us-ascii?Q?AkC0edDJB2BBO5ZKonSDydMmzu/Yo7x+iwS9C3EZ9a2r1kDHwX23eRnV0Hb6?=
 =?us-ascii?Q?0Qlzalu76FKUFJ3PU+/+uHtDtVkWbpOEtNBu2OR7ZICgI3n1rwtvf1fsTjA3?=
 =?us-ascii?Q?h7gFXD0PRi9UCVziSZFXiVCgd9bpycGmXUm8YxW5/f9thLOXYEXUs/C6cFeE?=
 =?us-ascii?Q?A7rbW4illeS0o5Fv2Pi9z616vVch8tTTMNC5mGR2A4ORWzpbYnSmiBwMX+TJ?=
 =?us-ascii?Q?P7VJipE77TnS9AHd/bHrcwM+LwEvHCmom/BGqhLvsE3Tj8lHQQDx08/2KLcG?=
 =?us-ascii?Q?mhFr2SFCd4u8je3UcJuIDABcvxasWi1R0LeE9FtPBS6UjlicoSaRUwgvT9bM?=
 =?us-ascii?Q?hy4KsMoVZ2JiD0yKYuzU9aw1LH+vxXEZlAAMG18GUTANiRopGLHgGSLi95rC?=
 =?us-ascii?Q?Cf7sI+7u3ECijCqve7TUG94SPpVrq6Y12T8xhgiMGI+clQWzK3nJrtcrn3xK?=
 =?us-ascii?Q?1eVlZCwuWr4/3y1YOJt0p5/DYWMIihKEp/mK/XyVAZeB3l7SrDszEKRpiIKD?=
 =?us-ascii?Q?KI5z3ycTGFnuzcu05rGAZmX2VtWB5VROKaBy8i/giLK/0XdUK2e9EspWl6pi?=
 =?us-ascii?Q?dGmeQ/D662m5XCWwuMng63MPtT3of6K9Ajr/ixVgvEgDIQ9d98zFcsdftM3l?=
 =?us-ascii?Q?HgRLyYl0WQhzfMbGPiQ3ygxg5GSB1WWoWM7fEApTv3pha33DpblDSzM+t6LC?=
 =?us-ascii?Q?azcGKLLJaRAsnEIx/KV9Uq9DvZz/ZDfN+On5Sa2yVc+Wj+WT6lnh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3606ed3f-ff4b-4e5d-d537-08df4100c609
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:06:09.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylvU7hoB0O1lVLA12+RUGcivIofoO1Oh5YaH9SyeuX3bUe6I8kozq0kTj+sbhjxSd+dQHJO0naFg+zavgIa1iWZrLl/00678aX1oZwSdZ4evfBxehY0U9b0eDepA0Kih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB715228

On Wed, Nov 04, 2026 at 11:09:30AM +0000, Sheetal wrote:
>
> From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
>
> Add the Tegra268 ADMA compatible. Tegra268 has 10 ADMA channels,
> so set the interrupt limit accordingly.
>
> Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/dma/nvidia,tegra210-adma.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
> index 269a1f7ebdbb..6aa9b83b90d9 100644
> --- a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml
> @@ -20,6 +20,7 @@ properties:
>            - nvidia,tegra210-adma
>            - nvidia,tegra186-adma
>            - nvidia,tegra264-adma
> +          - nvidia,tegra268-adma
>        - items:
>            - enum:
>                - nvidia,tegra234-adma
> @@ -100,6 +101,17 @@ allOf:
>          interrupts:
>            maxItems: 32
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra268-adma
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -107,6 +119,7 @@ allOf:
>              enum:
>                - nvidia,tegra186-adma
>                - nvidia,tegra264-adma
> +              - nvidia,tegra268-adma
>      then:
>        anyOf:
>          - properties:
> --
> 2.43.0
>
