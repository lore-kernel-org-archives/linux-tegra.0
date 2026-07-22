Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EE344D8D;
	Wed, 22 Jul 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726403; cv=fail; b=H4e2bJR1yWkKdfrd3kJQ7AVkjpC+QBYUVvTuC/FblRAdTgjqnLg4nAq2fNWPLDNbDVTAOGTnLzXEfA9LtYK25IN6k8Wa5iv84iXkz6Fg7BNR5RByBt78ceTJxbhE9+1bHI2XVh1BP2G9j2NIGC/8lfKDJBe05Mfqxe55uIwRGR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726403; c=relaxed/simple;
	bh=Lo8ORDVS+0msTRo/3kylJLkq6ftzZIlpgJDA7nhND4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LWPFW3h5rJMjO9dVwfuXJSJ/ntedy/H8syhgEmfds+QsfkJNu1YMjurP7VU1zTCujMPwEulZ1lzOXW0uvZ7Q5m6bRdbFI0Y4udA6ZkA1M2SK2tADqNZS6PYTHkmMUs4aKFSJ+cP2V3zaYFAfMxraOqi0aESHw+6Z8YCA9LPLWwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k3CoXHCO; arc=fail smtp.client-ip=40.93.194.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k3CoXHCO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ7i/eyvJjHeafsP5rTIpncZqBZ8nc/w2Z9/MhoTYl8aVVXQ0pW/7Za255PpjIfUqtqZb4nHCYSW6w5QbHqQf4GSWyA/qHzHxWeoyo1A4VFZiVUGFi5Yz3ZNHk9v+Ghca7Xdji5GpplUGrbkmMCuhe5wbZdZhXfNhoHvJ+myvgLZV+N4qeWlGCejtt1YnxJqnX/LOimm89hZdP+XY5eiNpEJ5FXAsrNG27AFba3Q6G1DQmMS0W3jjrGGZnM3PlsOpgQH3FgKbKRGfUNEnYcT5vTI1LRb+IbJWImlkmylhJ5pGyzYE8U9bbhl4vKQfjLgpMDR04gm+WPwYSjk3r+xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0tE+FUuEMBR+jo617axIAMr7kzhlvh02eokOi/8wGY=;
 b=UrirpCT4c5J2hTnVyb0V+vjp0zQG0FUn1cgDJ9N+G+gT96XR8LmkYrQyBjlTe27mAIDCeQkEksHZB+SR3hlkV0E6+c5CdFlpXZyem89XlPm6y1AdPr0z2dpxFqMylmj9uit8mq9vGgYSqnMmt1RLxMJfo3BYOjO4BjJ0Rvhy9lQ+2vODqtSLhLfQOrKOqeS2uQY6zrFPtH/JXF5JWfSwVv8SJYRxjUtl5RqsQhk7F040Zo7t92yRcH3fQ2rbIwFlTkzl9KMu0i/oDQrn8D1hPcS4JpRxNLplDG/FPE3zmc7BxdzDxcey57SOEaZqLQSRK6Djw5GaO1Z5j2jf6c78bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0tE+FUuEMBR+jo617axIAMr7kzhlvh02eokOi/8wGY=;
 b=k3CoXHCOgdGiZUntvvg2ZgBL4mQ1g82slPEm6MBfvL5jBw3Ylwr0Umgomr9rAkT4/+97V5RHyF29bFmnftZeoPEDcLk1wpGoDwgGwdKj4kA6NDQVk4ElpgPnULl02EICgcd7tbeveeXFopjgaPpEWeKODc2sRiN0g7a4TBk2hZP9b8c9ayvOJmHgj5G3bsuKAqvr/kl2B7erXCt2F/Ol4i7Mjex7rzhDBOq1/JLk/cBzy9/lsV3KS5HLcU9hZTuaB3cl7RvWn5kTgG3zzzInYT/sEOyLHiWEpiN70xMUE2pU6ivcYJTdihAYBupPSLpJzEwQ0XCZzg9C0V6vnyDveQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:19:57 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:19:57 +0000
Message-ID: <df8cde1e-cf6e-44f5-b650-ec186c62a92c@nvidia.com>
Date: Wed, 22 Jul 2026 14:19:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: tegra: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1781103355.git.geert+renesas@glider.be>
 <0be8708c53609bb64bfa31d84dffc5c2d56b5679.1781103355.git.geert+renesas@glider.be>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <0be8708c53609bb64bfa31d84dffc5c2d56b5679.1781103355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::15) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a7b530-207b-4334-2d02-08dee7f3ed13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|7416014|366016|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dhNVbn3i9ts/PTgTbtcw3V1vJH9RGLcjpj+p86DHYdUAbi4qz5jCKAO9Ry4L0DPnyhrhmIQnHfzVlhwSpoRpWWUhstXF/x7oV1sFN45O4wAfcnN9hnex/U8iOlwY2SMztLVNwKYnEJUV6zWbsCOpkRKQo5gDKby2OKYlRC+bX2cbrpUJdIbMGha8n1ib4kKz+QGQPUdkdOvYqcxziD4+OOc+NIQdlSXXgXIEo7gvzQKXc6BdjDxuNn+SLPCV5vSq2JkiEulC85KgL32bDlqsvPCSSL5T5xyb352Ia2PmSfS/3KBjsvAiIjcOHt35vFjBuAdk6sVJL7hjq3V5O4365+YMkYzaCh552lBbffzs7DmKtx/w30fV2zWjwMRdu0ShNJjd0Zv+wF7rHNwlWEOONrhCSFvptDDDPdm6QpF733eclJ5ePYYGhEWtTTx1hvcUYxzOCWG4sXrfy0uExhmso55sz5sZTbnXiME4kn11l/ssh8/vun4j7j6PaHB35Y4KAKEjIUK4vnRly6nfAHHmOu8XVImTXzfxbF8bVqfqTruyqCDp2khAZGn9Ym9Z8yD59WmFjPXowBPLuHUbxbu4rPAD0hogFo6mIJdaaKyDbiXGbJtaRh6OvAvp83KUhNGRAi7OfJiZ/gzYjhEC8FYLBjSPaAcLeXxBlbyttxx7ei0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(7416014)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnhvaGVsdzNySFdFbktyQmQweXg3SzNXR2xFeVZEUmdkdUlMazR3S2RFdnla?=
 =?utf-8?B?RjY3N1FjZSt1dHUxZllObFhzR3l0YzdORmJiLzBFME80NndodkFuVUF3Mktq?=
 =?utf-8?B?a2UvL2VoZUEwRTA5bDNnc1FLUW9zQjIyUyt4SkozZWNTb29JYXBGOG91TlVR?=
 =?utf-8?B?UyszSWw4NFRXUGFrSzE0d0d4YUJ0SVQ0akZpeWJESG1BSjBueVVkSDR0N2d2?=
 =?utf-8?B?NFhTTDdjbEhLT3Y2czBmcFJhYnd4bnhpd3cvQXhZTDBTekxEaUVyeFh4Y1Bt?=
 =?utf-8?B?VmFjeWFZZU0wT0lGd2NhUHdZSFlKMm5IMmE3aCsvK29aYVhERmdlc2ZSRXd5?=
 =?utf-8?B?c1o3aW50STNnRW5BTlhPOUZEN0h5U1lLNUZWQkwvVFBUR0U5V1pEcE1YdWNv?=
 =?utf-8?B?QjZlT3JwOGVXQW5qTWVHYWR2WEFueENhQWdubUFxNXNhQU1JT2pqalZmT0Q0?=
 =?utf-8?B?VmtFTkE1V2tlWDRORHMyWjRneXlOcktFYzFoTlM5RHVpaWZOWkxJUnVqeE96?=
 =?utf-8?B?N1h2aDkxcHBLbkNUV0lYSTBqVERBRDUxNVI5OVNEQ2MxVVpnVE9HVU9BR0FS?=
 =?utf-8?B?WHE3VjB0VHBBamFQVE5JY1VpM2FmY2tQR3NOeGJ3enJPK0RFbkxvZG9IMXVw?=
 =?utf-8?B?MVpCWDZMOUhlTEZWQ1ZVMmpBQlVCZjhIamw0aHpDS0ZDTmQ2TzQ0elN2cXJM?=
 =?utf-8?B?Z0pUWUgxdWZ4bVFWQ3I4RU5MUkxiUHJBQ1lGTlJGZ0s1dFZkS3dRdVFUb1A2?=
 =?utf-8?B?OXM3RjVMaDBLKzYzY0pxaDNVZ1JxZTRpZmhLWmNJemc2bmxHNC9OYzJjMFNp?=
 =?utf-8?B?dW1wUXBBVE9obDkwMVNqSzhObnk5MHAyQ3hJSVkzVUZjK05SVi8ydzdxMEZ3?=
 =?utf-8?B?SUs4bTJZdUp2SVR2UklBRzJqNk1JQ0E1MGFvb2V1QXpBMlNxYzBheW0rSmh5?=
 =?utf-8?B?N0UrTVVQcGNNYllmUGY2NVVVYS9oN2xpbm54TXZQVFNraGU1V1EwOVc2dWtG?=
 =?utf-8?B?a2o2bzdSSURTMGFXRk13NWpJWEpiNVdyVUpEbXM3MjJRc1BPVW8wc2pFMDNy?=
 =?utf-8?B?OGJ1NTBZRFl4R2pqYVEvYzZYQW9HZ0VKNDV4UmRITm1GblplMlRFcmszbWRS?=
 =?utf-8?B?MmF6cG1Vb0o5Zkc3Rk5iYSt0ZllnRW81YzJwMEJEN2RwcXVUVWJXc1FGWnV0?=
 =?utf-8?B?dXdWZXBwY1hSazBKaXcrQUlGbTVrdm9uNS9UdmtVd0hjOC9PQXNhdkxYNkl6?=
 =?utf-8?B?VXJ4YXNmQ3BJcEthT3dudUpFNTEzNlZGREM3K0dVOVdFOUVucGp3UmhBa3F1?=
 =?utf-8?B?U1dIVjhQVCtXc1pUVmpPeVpjTXV4dGNBSHpncEtDOHQxTDBWYTVjeDRsMkl5?=
 =?utf-8?B?TmEwQUx0TFRkRy96NDVmbVVnNWdsY2lHZ29qRXlYUHZ6ZFJ6WWsrSTdxZ1U3?=
 =?utf-8?B?T3Vsc1FrV2xUOUdwa3BEeWlHV1pERE9qTnVBOVRqU1NCNGEzVFVWeDVsb3Fm?=
 =?utf-8?B?anROZlBUaHFOMjc3UXRDTCtkbVl1YXFPOUxaVVo5cUJqOHhaWUxtMXdtUXk0?=
 =?utf-8?B?UkkzaFlLeWo0NzNjcFR0UGI2bVUyQlRWZ1lVOEkwalZUZFJ5M3BMaHJMbFhF?=
 =?utf-8?B?ZG9TM3kzd05OWFBxYW1IZ2lrckpUcXVHUUNzVUdFSlFJbTRSejVhaDFtM2Vv?=
 =?utf-8?B?Y2NRVnEvK2l5YWlMU1lCS01nRFZkckNWbkRIWjM3V0pIazFMT1ZLSUo2N1J5?=
 =?utf-8?B?SEp4dUdmckN0clBjYkF6UjRqMDJyc1FJQzk0WkVOUVRZeWwveUNjUDd5ckVM?=
 =?utf-8?B?M0tuTXBZcUJyVlpIMVdJTXZ0MlFIdTM1NnM1RGIzeStDUWhDZTJzalRja1hM?=
 =?utf-8?B?bkI2S3VmMldqaE5GY2c3b2x0eVBQUHhhb2plV3pxVjNmK1hmTGlnUGxqY1Ra?=
 =?utf-8?B?dVFtNWJlTURuMW5Mc1doYzJ3a2xUV3dMNCtWdUQxNHVUVlI0SGRUK2hMZCt4?=
 =?utf-8?B?cG9NUk8yRUdIbjZNTUFqVGU0U2JOSElSMnNCczl2YUlsM0V3Q0FEajZNV2s2?=
 =?utf-8?B?VzJFK1E5NVB0ZUUwaS9vNU8xL1VCa2x3eXNUQUZrWTFLWmVVOWRTTWs0UzYx?=
 =?utf-8?B?b1ZQVTFSTmU1R2d6YXZDSGtRcnVEaEM0V0wrblpHNVpEemkyL3JPSFZLc1d5?=
 =?utf-8?B?WXVGTllCQlhEV25zMnpGUTAxaitMMWZZd3YrM2UrOTdqbDhGcStwbHcrVG1j?=
 =?utf-8?B?bkFrR09uRHFOcGVFS0R3UlQ2Q1NYbTRXODB6RS9MUXNYMWdJMjU1ZTdWUXJS?=
 =?utf-8?B?WFAva09zcFhDekxJallRRnJVanlJaGJjK1I5LzdxQXIyeGlTeHBQa2pUQWIv?=
 =?utf-8?Q?BoOKel+GryGjIYG8NxRdpVUiCYUH7/BqTpfLZyo1h6uFY?=
X-MS-Exchange-AntiSpam-MessageData-1: 27/DJ2O8TrFS8g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a7b530-207b-4334-2d02-08dee7f3ed13
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:19:57.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99cBhjeUwgsK9CumHmaXwAVPRl3KxAeLmKTcRc3iXzfTCeU9AJhtLZ/399h8TSvyhZf5iSGTrIg2wbCiBdcZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454


On 10/06/2026 16:09, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - No changes.
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 04a95b6658caaa92..390609fee09c9da0 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -4083,7 +4083,7 @@ gic: interrupt-controller@f400000 {
>   			reg = <0x0 0x0f400000 0x0 0x010000>, /* GICD */
>   			      <0x0 0x0f440000 0x0 0x200000>; /* GICR */
>   			interrupt-parent = <&gic>;
> -			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   
>   			#redistributor-regions = <1>;
>   			#interrupt-cells = <3>;
> @@ -5869,10 +5869,10 @@ tj-thermal {
>   
>   	timer {
>   		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   		interrupt-parent = <&gic>;
>   		always-on;
>   	};


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

