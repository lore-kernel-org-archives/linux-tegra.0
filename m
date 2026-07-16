Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310FA424642;
	Thu, 16 Jul 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208609; cv=fail; b=Yjg/1UVnaWRd2D7o4rjGbQrZdG9ODfolpO0DAD4Xp5ssQVNnqr666NpmmMEQAoRi4T0GqqFShFeJ5kspSJXmJsw0+KpE2fzsLc13267UmBtAkoMy/KoE8u8J33nSBp457SEu2kyna1taea6q+QBrvm+2NlUsKYRDOKFbjPrI0Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208609; c=relaxed/simple;
	bh=vE2BnyoWjH8SgQHD1Vogy1YG7Q6+wY8fLXhuqFLxQhE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a/6yhbdRYXBCHGkCwEP84IQr7S7ey7mopeWkG05aWQSluEAaOrR1C/bTaFtxlODXib3W1MbivaL4jDF0FzhV+X4bPPZsf70GfAD0efErpsYnztviT2hRM0iPRi0kC4HnVjIK0wVvsX1WO0QWARNehIvjOG9V9aAaINeLewKj3xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EOc4Ac/6; arc=fail smtp.client-ip=52.101.61.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOc4Ac/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLSs3d0vRDL/vo+HwwAbBWxB8KGmnDXc0H4OOhHqUQOl5s/K3xkAkXlTiSHNlLPI+/z8uD3PcB+5JmbdSKgjuWf6L9cYU8EPuaA0XED4ZWxcCrkWNTtnr9K6RWJBWveM8lYhBCuvSfDzQzRIkV8zE3E7ptyvyqGMTDB5lbnfQKTf56LTQRTXuZ8kVC8fVDxMujXyO46+td8HBycnCakiRFhcIVFK8phr/vSyp0zvqCOqne01noF7/wMXnRElI/+iwLFVbNYFFw5yY5DWFO1gc/kTGtks7J3cl18TJ8PsPgLhfmZCsijbXtWSVM6ZcSurpD7wK6IlV4BempCmhw/g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVduMacOxzK0rJm3Juf3cGXh/Ts2YBo+gJCLEftmEb0=;
 b=UcSGnAzdXkUmFsWCG3S0WH8/z/EoBPrr/iHvMUkN5ixFL+gSRZQg5A+mkgmt0wD9sgtLRXGXQuLJLSp+rOuPzDZY1WN+o6KaEVh/ua/Tz9LTz9idF3YdswsIHi/eWNK+UEKuNH17kShdlxksLW9tWcQ92W7JbJqL7c6QOEMA+3iSJiHOubAaApxjMBpGgnO756eNi0Wzv64MWM4B56ROJLJyjEQJ/nbNhVKuZnhuSq3whDnPwHcsj/GhQ9rpV0z8UbE8Dw3iplbrnJo/1OJ87+rbOjKj5P6IUCUVgq1+pctVkPjfAO/LKfjwUahQ2L7XiWCGElh9Cf/IM2crbXBIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVduMacOxzK0rJm3Juf3cGXh/Ts2YBo+gJCLEftmEb0=;
 b=EOc4Ac/61+VRYELrj4Gkc/PClyL53w+Tsecst42PpbSAuIWYFj2+xuOlGKtLdbRK7QURb2dJ6IyJ4wPoA94p8nNRBRmGt8tFzWgbaAQP/hI2/5X6SRGxlzUn86ehe+Q9161VPiqp2CmlyKymX29lAw67eiFHttCmAFZhAEGS6HFNItTU+w9M83pGI1drCxeqT5XLd5RPCf+2KDvslQ9g1yM5FNY/4WfMVHF+OU12Qe9/mgQXiRNl+Eof53Tncp5fhAMBzA82hLiPOUBBaStA4bJVpFADYSF8d9dyGMMQ7YOGqYM3Nap7wvgAYN3PhqP8n9hWz9OPcAymUSwZxQn5xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:29:58 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:29:58 +0000
Message-ID: <85cdd521-5817-40c3-a3ad-20271c1721f8@nvidia.com>
Date: Thu, 16 Jul 2026 14:29:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: tegra264: fix DAP2 DIN/DOUT mux functions
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org,
 thierry.reding@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org,
 bhelgaas@google.com
References: <20260715101636.547305-1-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260715101636.547305-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::15) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: f6933ed6-53f7-4dd6-cd44-08dee33e543d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1tHUdnuysrIdl6M75/rCL3L2xhyO2TtJnB614tWMfnFxTUZ9ZC9QQ/IBwFqojNVZvNFUcHsG2Y2Ue9tbtdhRiTwwsgPdbRuPpbmVJKMARG87NYQQlItwM1pYX83LcortTu8WjNmi8atlXso1h80tl+2oZLLMQIWxD5XdsnX4vo/aECTNHwsf5/b8ENPYfSxLEZpkqcVXDCk5lFhNS/8v+fBsCQXSD0C7ehs9tepA/HxxhzNfBNq+1VpOyg+bAlx3ofHxeRqXwww8iiryI6agzB8xBmZl/m66RhL62EonwnhulDl6uEZ3P5lK/mGzzrj7tZ1QLB4DAUKry2jaJ/1lyG5RoLDpKBOpOnMt1dh4W+bGqYkNKb+ONKDdJb12oIrOgK4JxHZrX8rCdfP/FMmnAltua1kIAKRnJUfDkCGvewLgk9SoW2SADrK4kFnMplR9kADGzEIv98XdD8czk/vrADlVwqEqZhV1lEWfwSUhvgnrgn6IjGDlKlfYmVxaCtD5Ree+c1p1sfthTjdjMDRqwTCAm72CAz9HainZpUvCvKLsa42w47EopYqzECer0HMnzREL/WYa+a408QAOCUBf97m5JixMDWkGDwFQFpZ2SBtLrTGGF7AU5XmuKiWFCeIY50ydAXBzuJdm7kOsUEUrPehtOh9GLQJof0gze9G5+i0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFFJMG40U013VzR3NTV6cVRkR3NPMjhaRmJ3NzVZL2VRdXJhQkFuaVVEY2hO?=
 =?utf-8?B?OExTY1lNaTAvWGllVlZDQmNhSkFTQ3ZkWm44Ni9JK2NvYzJXQ2kzMWJzZmNQ?=
 =?utf-8?B?aGlBN0dabzZJVEFqSzFoVGw4R1JWN0J2VDE4RzRhWW9qdGQrZGliWGlOR0JX?=
 =?utf-8?B?QUtXYkNqNk5ZZjVpVU9mTU9SdW1IUENadDhLeUZRbC90Y2MvaEJBaFlkVklW?=
 =?utf-8?B?ZDlVYzVrZjNBUzArMENsRXhxSE5DdmxkRW8rTlJHekd4YXBuaFFFR2pvanF0?=
 =?utf-8?B?aExDcmVTVlExT2hYTk9rNXdtenJwMWZwWlhlQnRtTisvWHVOc1ROSWN6SEdM?=
 =?utf-8?B?cjFDRmozV3ZzTkJnZW9JaDlNdGpYZGs4MEd6SVM1TkdCMjZzck5wMWFZb3Rm?=
 =?utf-8?B?d2wySXZWd2szRXFHbWdvaUsyenlxK0xyRVNjV3dmOFJsaW45SDBnQzliNWZv?=
 =?utf-8?B?ZHZ5UzBrb1grNDRBWjJkQVBVQ3laVlBPc1pSV0dMWTk1Mjl1bFV4L1VESnhQ?=
 =?utf-8?B?YkVHL2hXZ3VIWXZqdWt1eWpnVEc4UndKYkNDOWNFU29uaVAzc0RwL21CWm1w?=
 =?utf-8?B?SWhpVVBHUEFsVzAxM2xaYithR0lIdkdtNkl6d3IvL1JGcDFQMFhuU0FjdS9F?=
 =?utf-8?B?RHpwaldwTm8wSWNCcTYxNmNZaURkeXowbmhZZUVSc21xV1E2dktQaVJ0WFZ5?=
 =?utf-8?B?RlRWTVliOVpYd0R1eDVJYXBwMm1CNkgyMXdwUzM1anpCRFpVTGZRMVZQQ29Y?=
 =?utf-8?B?S084K21kaDFWemFaMmc4N0p1b1NXUDZZcEVaRG9wcHgxMkdZK0JWdzFIRDFk?=
 =?utf-8?B?c0gvWDNLUTB2Yk5Hb2VnS2U3Vk5udXpuSVRSVFZFUTdlTmUybkNYSmNEcCtL?=
 =?utf-8?B?dVI2ckRuLzQ0YzBjNEJiNm1CY3ZpMUN1b2V1UzE0YTB1Qzk5RDQ4RFR6eEcz?=
 =?utf-8?B?bm1VbWhwM2w4MERqUEtFUWpwVFN0akhNOXgxWVpuWDJ2Wk1VeSsvMG44UzFk?=
 =?utf-8?B?bTRBaEt5UDNGRG9HQ3NVcGQ4eks2enBrbUFiQ1pISTh5ZXBDRFdDZ3VoSEhu?=
 =?utf-8?B?SUxzMG05ZDNHZFdlc3ViNjRTTkUxbE1VS1hMMEFsdWl3MVN5SkhiQWFsNnlr?=
 =?utf-8?B?VEJVVDRqT21EdENQVmZrNlNBTVRKZVlrcmV0dU1McjVRWE91ZlpHcWxadTNY?=
 =?utf-8?B?K2JLemplOVFiajd1T3MwS2hDZmNNWVlvU2VhdFdYdHJMN2pPMDdKM2hCOHR2?=
 =?utf-8?B?VUdiNy8rR0d3QjhCMVR1S3MycmZWQWRXOUhuWDdWeXdIOXg2SlJBSkN1aHdy?=
 =?utf-8?B?SlEwQXErb0NtUk05U1dwc0h4Z2J4ckgybVF4ZTJ3WTNISHRmbG5KYmtFLzJ5?=
 =?utf-8?B?L2Vuc3VGVXRBYXpaQUpGYnJzYm93MUFkL0F3MWxmRFplNlV3ZjZRUkhsYWgz?=
 =?utf-8?B?Yk51TXpoYlJEdHFYb2pLYzVTbW9RK2FTVXVoc1hpUG9iTWc2TXNxVlBqOW5L?=
 =?utf-8?B?TWg0a2hqbXlzSzNoc1VYais5ZXNZL0lBTFBnQmdQa01TeW55SVhDL3g4SmZa?=
 =?utf-8?B?NFdmVmh0Tlh0Q29Td1dtcGVqcFdEcVRha0VrRExsL0dOcjJqdkE3OXNndUpt?=
 =?utf-8?B?YnI1TzZJNStRZmV2WGMxRXl0SU1PQjhDRkxTNlB4MEFSWUV5RmhrMVEwbXEw?=
 =?utf-8?B?bHU5SHpuV0w4eUxER2lrVCtmQW04Z0hURmpkazhKQVhob2QzNW9XVVBpdlN0?=
 =?utf-8?B?TE1vMUQzVlVjY0xCeVUxb0dtSEFQUHMvQWNVV3NHclJpUUh4eFBrSmNiTGNF?=
 =?utf-8?B?ekUwSW11MDZYWGw5d0NNU3pKZ0F1K3FzaVRrZWJXOXBYL3J5eHI4QTN3VXlt?=
 =?utf-8?B?Yi9sb00wWnhjenkxWGhGWjZVQ2xnVnBFQ0o0VFhmWVRqbndGNkxpR3JmWmdV?=
 =?utf-8?B?ZTFHNzB4cW9WZGxCaTlZbjFucU1NQVUyeitvalZCS0d6NWQxbkJ3V3ZWMGRn?=
 =?utf-8?B?YUJaSnhMU25zRW9nWGdIOThZai9QZXkrV2VBVTZNcU9mM3VRcTZqazF5Sy9P?=
 =?utf-8?B?ZmhlVWQ4L1pCak01S2pmUmEwM3dSZm4zdFh0c1cydFlvYTRlV2JBcStjaVg5?=
 =?utf-8?B?R01WSEhBOHFRYzQ2SkpNemJNV3U0dEErY1JsUlg0bjlKUXJlNUVuaEFCZmxV?=
 =?utf-8?B?OFVXV1VsalZGcnhhOWFHSUcxVnFiREtaQlZZbEltREtJWThoTEZCcTNMVjFu?=
 =?utf-8?B?WjJsaHF2R1lZd3VqMDVQQkdCZ1RwUElsdWVPSXBJUWd0blVMdnloL1I3bjk2?=
 =?utf-8?B?aFJ2N2FsVjlwMUZtZ3pYSSs1cTIzYmttVlNUZzNxbEtNMFlwL2x2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6933ed6-53f7-4dd6-cd44-08dee33e543d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:29:58.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo9zq96Cg2HhoPLV3ttCSqx0BZd4chlMfu+Jw0Oh7FoKyj5mQYZhHPrhbAU6rlgQLaflP/KyabGanFLiyhJl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939


On 15/07/2026 11:16, Prathamesh Shete wrote:
> The dap2_din_pv7 and dap2_dout_pw0 pin groups were assigned swapped
> primary mux functions: dap2_din_pv7 (data input) was muxed to
> I2S2_SDATA_OUT and dap2_dout_pw0 (data output) to I2S2_SDATA_IN. As a
> result the I2S2 data-in and data-out signals were routed to the wrong
> pins, breaking DAP2 audio.
> 
> Correct the functions so dap2_din_pv7 uses I2S2_SDATA_IN and dap2_dout_pw0
> uses I2S2_SDATA_OUT. The register offsets and drive-group macros are
> already correct and are left unchanged.
> 
> Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra264.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra264.c b/drivers/pinctrl/tegra/pinctrl-tegra264.c
> index be64fba34dce..3802e480d39e 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra264.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra264.c
> @@ -2051,8 +2051,8 @@ static const struct tegra_pingroup tegra264_main_groups[] = {
>   	PINGROUP(gen1_i2c_sda_pw3, I2C1_DAT, RSVD1, RSVD2, RSVD3, 0x6018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(dap2_fs_pw1, I2S2_LRCK, RSVD1, RSVD2, RSVD3, 0x6040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(dap2_clk_pv6, I2S2_SCLK, RSVD1, RSVD2, RSVD3, 0x6048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> -	PINGROUP(dap2_din_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> -	PINGROUP(dap2_dout_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> +	PINGROUP(dap2_din_pv7, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> +	PINGROUP(dap2_dout_pw0, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(pwm10_pv1, GP_PWM10, SDMMC1_CD, I2S7_LRCK, RSVD3, 0x6060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(soc_gpio170_pu0, RSVD0, I2S7_SDATA_IN, CCLA_LA_TRIGGER_MUX, RSVD3, 0x6068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(soc_gpio171_pu1, RSVD0, SPI4_SCK, RSVD2, RSVD3, 0x6070, 0, Y, 5, 7, 6, 8, -1, 10, 11),


This is still not correct. The ball numbers for these pads are switched. 
It should be dap2_din_pw0 and dap2_dout_pv7. Please fix.

Thanks!
Jon

-- 
nvpublic

