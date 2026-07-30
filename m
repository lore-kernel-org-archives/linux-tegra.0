Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453162EC090;
	Thu, 30 Jul 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403060; cv=fail; b=nW/Ik5lPX9fowLTJGBFRTXsqWV7Pn7fppmSmuxEqQ6KXBu5GjjX+rtg4XAn41r6jjKCPBRBtOLtp0Xm7T/B6P1m5Jn9o01qN51XUKSNGdJoE87J969+UErX16QyaxXsF+xoq1WmbpecZltcPMTp3bLWK/dI1SLIvYaCv0dn+SAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403060; c=relaxed/simple;
	bh=YFMzn4sICdJN5pO7pAl5RgFTiXhtreGgFkLHx/9Lqzo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ppAicGYHLdeXxn6zXlGseWHqQqbg4RUufcxT/5sXoxmHrp/4bwZ5rMgd1S+yZ7x6K4Dhxn0EnY5CmsDO0TjsJfY5+GNjdEqTKqykWWwHJKitdne4SGqLRPn1RrCZ/1Ki0qxJTp4AhWMPcQ0mfXMX41HTEos0EHRNfPJEt2phszw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D/ulws+V; arc=fail smtp.client-ip=40.93.195.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/ulws+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vikEiYrSQYb0vj1wVt91EJjXJ3tidsQWQGNKW7bcK2GLqi9llLVUu0+wZyStiDnsqcFL6LpJnRG8wPCf/SRBUt7vJ/uBe8nmV+I4gRJ4HFkzFdhlZgYwS1q+FoJZAwkHLimJ1LaEXow5wS/hcIUxzMuvjuX+tbc7uM8FT0pZ+vzT6pLtrBpCydWsTkQu+U3uUIEpRRmfr3LMacL9lYMitZb7pRpabCBqIJON98qVagVV9tBGGMgWsF+AWkxi+WxOCKzB37Kib+OmVgixyrgTMuJzKQDrfadv52ZGsVBiICqDc5W8uOjzHQfefvtrm8RtKe/uCiw7C1PXrwGheTl5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS9TT5FbzMduAr9H/GAcmvpajEkEy7sx5OzeFSHA/lw=;
 b=xqc+lkFAnpG0PbBYi31akjcqq9Gf47/Vfz39pUsdwjk7cAT+VSe5SHHPj2iUGom6jxFu+deCdw+2GtUczDzZ2+t/zmjQ369X5cgUGWvSK2cMSLMYVOYzFqMA9EHAaBBkKywmWBZc2pUsS4v9qmaRUPTwmqEmxW/47u4Wm0xfJTZhlcfC7T7WA+f8hWT+MI5TQzgyZ1nLxrdpv8fOL3s47usqIaJH9/g40jFTwjHlYJtNna/rU4i1zT69pgSoiaRVBmxnFLO0YmQKRjudqQhSdba20ScdqCUXXz35PxqmsGLALQJ6zA4e5VKJgdZSPS1vUxSkVEDnUDpEvhYPjs/t7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS9TT5FbzMduAr9H/GAcmvpajEkEy7sx5OzeFSHA/lw=;
 b=D/ulws+VgDdfXnH9VelAPIu2B6y9I86kISMDDDprC2T/eveR2iXPxhiD4gYWUmfThwW9fkeMf/jHRIujcauAVIbDY6pCGxh6nceYlf9DKHKPtMuToxS9KdaF4yvZC46g4nESISpCAMU14uHhwg/NZcMjjUow3z3Gr802o+/8OznDb8CdnFK0Y5PLFTSpKb704Cd7InYDN6Bv6AWnxyBDLmAhH+s7NCbmuyWN2uJxw1tkA5aMqTEiCzfnQ6OkgFDJvDQF2hRoUYsHdu5s2viCpzWZzCixiMTfvaVuLiNmK+cbzQQ6Oy0ujxxbHjHfsXVm91leBVjnRNyPYN/tpJiPEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) by
 CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.15; Thu, 30 Jul 2026 09:17:34 +0000
Received: from DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06]) by DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:17:34 +0000
Message-ID: <d981adbf-5667-40b7-8652-02f4acef2d29@nvidia.com>
Date: Thu, 30 Jul 2026 10:17:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT
 pin names
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727141121.772110-1-pshete@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::14) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6063:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebe6966-7b81-4ec9-1d76-08deee1b63c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mH2qvpcbJDqXA07RP3ipKcM9YKJ2zlXAAMpRpBR5SGSeJ6l98me5DaIq/spSvZW7lTFUZk5EFpXvtKXQM768+TJB5h4YFgkIWvujlzwmlUtNFOzJzsN/pooALmxXB/n/GQw3AbUtXVsjmNb2TGPEBGSR4qZ9tHlrXaO6xbRAcEzs8kzNVLVqA3RFzRtOCOpy5s3dCZCFvCeIsowIyRss7CUgcg/eFm5KAZ9F3chSlVx7tDmKSUQkUk9wmeflZM43Fi5pGr4CrNykNxdZvPYlkHd4ehUvIX5DeEUyupNgL1FVuKPhETLG+p0eW+j6pJOW1HSRILaFxSzpaHI/Ph4PUhezE5JBOiKWLRl9+oT60vfh/6Td68KCgJYDhmOYq8rRrggG/A3wOPF23SQT8nxuYpynOefHFnic6iKhjKza5e1cndQWKMPSXbf2NcxTiqnZl3Q34Iv6TFRuilC//fYNAXVGnoP/h6XxELV5nMBJARb2BXwlPvFXJdi0chucqaxX7jZWYoiEweB6ZepnSLzCVeh2GnH+51fSeaHxOdBKUPNc0ikdV0n1WK7CCv614lnGne5dkmYu3HDprtb4Wsa66W+Qd4ETi9MUjF/svcwKEb3qSigXwiUI+/u6zS7380aV4xuF+WeWJ0aNU9ImxIkru2KsD1bruF43q6DuddnZUI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6063.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGs1aTZuVmZ0NTArdWF3TmlqYk9BK1NjZEV1WmZSNm1mSDRnY0xKdGhId2lX?=
 =?utf-8?B?d2NzY2s3VHhPVncwSzNTVU5oUGtsZU9CNWVmZmFLRkZEZWlTMWdEUkpORXp2?=
 =?utf-8?B?ZVdvZjRwa2wrMUVaSituOFhncHpIS1ZGRlRvQ1ZnamNxWDdLcFVva1Y2bk9R?=
 =?utf-8?B?L1hVY3NyM2MyVm5SeGJtN0d4U3BoSjgyTndvUk5hY1lOK0pQckVsbzMvWkJS?=
 =?utf-8?B?TlBEWlNwNDVjb1FaVHFiUEhqZGNnYytZYWN6WHJsbExWTTFoN0xGNWpjdURI?=
 =?utf-8?B?Y3cwQnhwTnBqR0hXVjVWSHNtV0RNNUVUVk9GMGgrZ2tQbE92dTBTSFJiRWp3?=
 =?utf-8?B?R24wMmtlaGphaERsZkZ5NGJtKzVqUHBmVXdPcUxjeWErZFJFcWdoWXI3aDZM?=
 =?utf-8?B?bGJ6dmFKT3Fsb2NZVmwxRCtSTGFoMUFDNkxRTkErZ2pFcGF0WGZjYXlNTEsr?=
 =?utf-8?B?UTQ0YnpXOERMQzdDOGZHd0pxNGxNREh0cjcvZVVMUEhVK3Q3ZGwyNDJ4SUF3?=
 =?utf-8?B?STYza1ZWV2NScEx4YkRtQjFCQk41V1RtMlR1blZBMTdLLzlmUG84RTdCNkht?=
 =?utf-8?B?QTVRZGlyelgxbGhuQ1dPeEhpSnU1R2FvVTlBMFIyTWxWOW01OCtWMExlUFUx?=
 =?utf-8?B?OWxwTTgxUHV5TFlqVW9mUm9qUFgyMmlYYjBZekswU21PNUs1OFRwTXFxTVY4?=
 =?utf-8?B?eXVzbEEzZ0wzSk41eklYTlBESFkzc2RtZXdSVndlM3VNYlNLdnhkdVBieE1y?=
 =?utf-8?B?dUUxVGo2MEtHeC90RUdrZjNsNnJlTURkRS80SnhtN3FvQjJ6NGZkc0NtRzhi?=
 =?utf-8?B?RTlmWFlMSTBUekhNVUV5Z1NBNDUrSzRpMWk3MFhQMk5EVkZ1a28zN2pOSVcv?=
 =?utf-8?B?Y2k1dEdMYW9FeDFObC9zVVhVN1ZpaDdUNkVUZGtsc0RpbThmSmtRVEMzZ3Jl?=
 =?utf-8?B?bEdvQUVhVyszQjArM1FpbExwTzVSSFVCOU9MaUE5aVc1MmtZcUlwWEdCV05a?=
 =?utf-8?B?cnNSQ0s5OElpK25GMEx3cncyVGVDYWFvK0ZoVERHeThQNldZVm9PMjJKUnls?=
 =?utf-8?B?VVRqY0pkeENscVRlVGNzcGRlV1JMQzMyb2I4WFVUZHNtY3R2cUlkOW1VM2tu?=
 =?utf-8?B?K1BCV2k2UUkrc0dnWDZFZERudFkrVVNvZ0I1MHpybk1NbThwWGJsOFBVckdV?=
 =?utf-8?B?Z1UreDZXRFRPcWxBVDllanp2d1d5VXBia1o5elg0TGluakV3bUpPWGoyd0F0?=
 =?utf-8?B?ZDdGUzZmT29jWTZQVFZ4U3UwK3VnMFE2K1oxdFM4akRKRnRlL09FTWZkL2Ri?=
 =?utf-8?B?ZHE3QlVqY2xtZ2FybHkyYm1iUEpMRFh3MGFWZHZtWmlYa0VUWnZJSkFsQ25x?=
 =?utf-8?B?SnZsSitnOTVIamxQKzJOWEJXeGxZdWFhK0hTU1ZHSWxKWTNPa3JQTkY5c1Fy?=
 =?utf-8?B?c3NaSTZscnJwME5UcEp2cU85TTdyM3dWbndKdXo5cDNucU5nSXk4b053cmI5?=
 =?utf-8?B?djBJRDB1Q2pLMHV2NlJyTDYrTmV6bmtDUEVXYkdUYlhEWjVtUXlzUTZRZGJY?=
 =?utf-8?B?TXkwdjl4QlJTRHNoV2NyNGt0bXlTWG5tYVJKSDIwcFZrSnB4WUtkdFY5T04v?=
 =?utf-8?B?NTVUUW9SN0FGY0ZJQVcvbHNMTFVoYTJES3ZUMlp4eDNEYnN0ME9pOXB1a1d6?=
 =?utf-8?B?UU9Zb1pEZUV4REFCUGZ2cXA1K1hVb0N6M200cENXN2l6eEF4dmd0ZHRJR0Fu?=
 =?utf-8?B?cHNsRWpKL1NXaGl1Z3RtZXYvOTBYVWNOakdVMStybFhmT29yY3FJSnBnNnZk?=
 =?utf-8?B?YmdRSFRUNC9KYmRHUTZ0NkcramtqdXpDdnZHbW9DVUhsVlhRUEZFaDJZZE84?=
 =?utf-8?B?OGd6RFJMeERZclNlTmdKK1BNa3FKS1RGcmJxMHlGb202cDlEYk1nN0c2eG9Z?=
 =?utf-8?B?Y0pBZWtmb0N0dCtJY1RkMGlVU3hUMHpST3lmd3NqenZYdVVHdndkbVVvdjRM?=
 =?utf-8?B?dHZ4ZUpWSUVYQldCOHhaOFQ3eFVUOEhRK2NwMDB4Mi9icEZKSjdiUUh0VWhQ?=
 =?utf-8?B?WCsyeXF1K0NhL0RzMkw0QnRVWDF0NGVqZUpQNEZ3TFBycnNtV1pGVEtTVXNO?=
 =?utf-8?B?WXF0MFhTUlVjRk8zMzFFM3JPaU5iNVBOZHJVTHE5QU5vUTZ1VkdpMUVadEla?=
 =?utf-8?B?bk5VdXFDQlZRcWJtS09TYVZYc2NxbFZTTjRESWlTc1p6TmlYZUpUTXRNOW5p?=
 =?utf-8?B?UEw5Q3h1TEFqdHBibFFnMFQwNHYwb0RHRHc3ZVM3ZkMxNG4xUFBUTmlhSm4r?=
 =?utf-8?B?di8yeDk3SXcwRVBtaWJXKzUwY0hYdTM3U0xyaXVqVnNGYldiaGp6UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebe6966-7b81-4ec9-1d76-08deee1b63c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:17:34.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RMIAWeR+NOv2q4TOYjNlspB6hbblpXwfoJKfCpe6hupwIYTCrTez3NjEPEnuu2OxVyTF4Vq4TPXAayhivAz6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249


On 27/07/2026 15:11, Prathamesh Shete wrote:
> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
> 
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin controllers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>   .../bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml       | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
> index c40409d3263c..01db762e82bc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
> @@ -44,7 +44,7 @@ patternProperties:
>                       soc_gpio173_pu3, soc_gpio174_pu4, soc_gpio175_pu5,
>                       soc_gpio176_pu6, soc_gpio177_pu7, soc_gpio178_pv0,
>                       pwm10_pv1, uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_pv4,
> -                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pv7, dap2_dout_pw0,
> +                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pw0, dap2_dout_pv7,
>                       dap2_fs_pw1, gen1_i2c_scl_pw2, gen1_i2c_sda_pw3,
>                       gen0_i2c_scl_pw4, gen0_i2c_sda_pw5, pwr_i2c_scl_pw6,
>                       pwr_i2c_sda_pw7, soc_gpio138_pp0, soc_gpio139_pp1,
> @@ -111,8 +111,8 @@ patternProperties:
>                       drive_soc_gpio351_ps1, drive_gen0_i2c_scl_pw4,
>                       drive_gen0_i2c_sda_pw5, drive_gen1_i2c_scl_pw2,
>                       drive_gen1_i2c_sda_pw3, drive_dap2_fs_pw1,
> -                    drive_dap2_clk_pv6, drive_dap2_din_pv7,
> -                    drive_dap2_dout_pw0, drive_pwm10_pv1,
> +                    drive_dap2_clk_pv6, drive_dap2_din_pw0,
> +                    drive_dap2_dout_pv7, drive_pwm10_pv1,
>                       drive_soc_gpio170_pu0, drive_soc_gpio171_pu1,
>                       drive_soc_gpio172_pu2, drive_soc_gpio173_pu3,
>                       drive_soc_gpio174_pu4, drive_soc_gpio175_pu5,

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

