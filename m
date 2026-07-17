Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD73FDBE5;
	Fri, 17 Jul 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294686; cv=fail; b=jHz53Ckk+HOn+Lfe+dEyXOhUTdTWrwnrH51bOzc9vWaTGyt8K2qFIIMK4UJtTHdeAM9l5h73WavBJg932pdIcol3J0+L3S+WMrUOAeRVMX/lSksmJR2ZTGfAoPnT0ubOzWK59kbuPRimRDI6JhBoBMocSyFGdV9jt462UM/atNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294686; c=relaxed/simple;
	bh=YcCASvpTDNpiBr0GWwEIWY+ePQzbmuxg8cvpy6YNRNo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gsQnxlN+OnU6ZxKPd/nNRSJOKmShjJNL33eJ50Q5SJI6Y3SAPIIO3wqWawm9aiLq1YjfPRMW7bP6sz5FTQlzSeTOxvYwNnHZtqv6lmzVQ1g45jIRmvgeXyafv6QlESrM77u8wiDzHRJCtqp5zdwiAkwYm+k35M15UDf6Sz5FpIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ntj9NKKY; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ntj9NKKY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWNHa3w1VfHKqoLX2P7kB+Wbxoe6m+a/8V7wS6jUaWRwkirKX9Nw32pue/M4kTIlNKF4WPBSxu3uOiTQ6B+C2Rbg16gEsVjnz3nNJiRcz2qzeJUMz1jokoJ6DQ/pIcbI9jOJgM/4G7+y2vKdQunBpMc/V2q0cnSQ3YUOyyGWE4nINM1CNDcaO47C7BOMKFN5raAJYL5fciNzviZYOLOvFgn31hR5ePWQZIWZuDIb2fiX703aC8PfYuet6h9mI9J6RbcDAZZCAsDyoBfSCz7SV9sx7Mt0LYSdafzviriLQNK4agNvBQXbwjXmU6paUNqqG4js/RdF/0yie5ULUHLSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEoBgZBLV/nMUl+ZPlc/rpVgbx+orhtVo97xvT7AGxg=;
 b=RNyTLas35V8hmP0iZc/xjYDiyiL35QM00hB/fP2uA+awdOdy8GDuD/21HWrwuqcJXx5ne+1BAty3i9Papj+TLlAyWF80Pvl+5G91f1Ch/K2PcAU9s/GrbRRKNtL/tmqnLem09rMvB+tPWtWPEgxl+DmMXAXoJWT0/xp1kPAsFinDjA4yNetmEyb+P7R8mvRdX04U73I+7LuFi0rDRpFGfJmA6v3RXzhH53dO8TItM2kj8rKHilnh2E1R9OQFuDGp1V3NIme2dAdUxvN5HbL0budohQGuuf93+TnJaPm4ObnbVq5lpG3M9+uP5vetG4E3Mbp0DrJhlxZExh0pEvbLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEoBgZBLV/nMUl+ZPlc/rpVgbx+orhtVo97xvT7AGxg=;
 b=Ntj9NKKYYiw9rSngkrR3QRH74SKYpF7sU1tb3KJufuWj8hckiOa4Mc/WvvdZ/Gw+hLViWMkXVtgjmkMx4nWb4/Mstx0g3ncFSlcaR5Vw7TXC8mz7CbXaPcchjvDzr8nJLYKpgMw6DPodF2xy8U1JhXRZDMhC96Gcz95QL693Nx6GLwtdCBnV+Y7evNx2+zGkMwlU9dblOwYEpWybioeGdVz6uwZxjA+gw3rNWbodMUqxhZO/3+fQegdSIdCS64w4GVRXjjNbVBaYuzu7ni8kmtFFH6JKG9kageZ5V2ecLUEBsBQbro7bm0T7kZlQxVCWHfpLxfKex6Zi6sYNEykFpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:24:41 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:24:41 +0000
Message-ID: <5aabe234-6c85-472a-8be4-f6cbea7172bd@nvidia.com>
Date: Fri, 17 Jul 2026 14:24:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT
 pin names
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org,
 thierry.reding@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org,
 bhelgaas@google.com
References: <20260717113210.599463-1-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260717113210.599463-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::19) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 583e703d-8758-43d6-5f19-08dee406c250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EghBUuPfO8QJFnZMMaWREP1iiapAn+6cMcHOtyO6+L7w+2pVAHYKUInl0509d35jutsvwzPOtjx7MhPWS4SFvm03LhzqpS6iuTqdrTBFuXxGqgsym8hZ2a7xMuEgIbvftgzte425HSf47ti8ms8sagmCHUfpAU0v3/Nn00CC1F/6iyxNHBBSKO7fb5TLUiSI09hxRCi4thfCHZ4RmUpQLAaOYusuGHknW1o5E6bsHeWq6wr8k6Z7PjQJlVIQ9M5PAOa1hTonxOnkVMJAiikHLWTWmji2a60JPFq5LT0eQFEJjx56F3bw1+KCUq1LNEEbDhb8Wi9+MYvJ4wE1OgovXu7+Z9bfLHHzru5AwRKLQYf2MsM1IopBNy2O81HstGdHAMjakiOEqvKkN7uCzs8rFJQ8GSNB0KFUmDDF2UBuFNTXEn81hVxXAa8Pr3nEhDVnu6RREBrpTxYNvER8ztrRvIArLx+bjUqiM2l6UipRoDrXMz+Hc9V+Fo4PjPPkvh9Q9+yHjOq0WTAdM0U7/Sc+V5BM6MZwrIBoxKTvJ9EuDIfJ7t13AlI6ilFglPr4PKHFLTWL347vC0wGMFvKDF66DUf9JFW3YTtkFs2vxYroWUkOrqBsSclNmk+pC4pWNSiW+vwu2IxpDLqmkBSbmYveLTHWTmxMrIO6gpsbQeuncqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZDa1Yvczh5MkJLOW9uYjVjbmoxQTh2My9HY0V6WVNPQTJ3djA2RG55NERa?=
 =?utf-8?B?RlpDMFRPVjdpYjBpdXhJdUZXS3Uya1Q4REFMdGRiR1hrRTlsaDZCN1UwdjFr?=
 =?utf-8?B?NUVqRE02RVEyeDBacDEyK2VUVEJlTkhlZFhzaTNvWlo5c1I2TGhxYU9QRDk2?=
 =?utf-8?B?OTZKdXo3Sm5LQ0tLVlpsQm5IMlRTazBmTG5BZ05UVUllMDhmRWN5dk4rVEhE?=
 =?utf-8?B?OHJUR1RqcnJGQVVjM3Nwb24wOUxXYkY1NzUwOUxSN1F4MXIrWGhJZE4rRks2?=
 =?utf-8?B?dHZlN203TG41RkhlQ29qbCtGZjUwaEE1TXQ3RDRsVVdYMjdsbitTNERoWVpK?=
 =?utf-8?B?TVFjV3E5VEU5d29WTW9iWFpVbzBBU0xwOWtKcTdpZzNZS21LL25iZlFBZTRH?=
 =?utf-8?B?cDlSRGRPRkczK3JNL3YrV212MFRTUCtYeWlhNjk5S2g4VXFFcTRYa1BjR3U2?=
 =?utf-8?B?S0Qwdy9nbFNSNzZJbmNDRTB5cmh2NFN5bmdSR2RvMFREeHc5M3VWbWhONjJk?=
 =?utf-8?B?R2lURnZZZHRYNEN6bnQyNlpKTVdWS09FT3Ezc0FqOUxtWDg2QjlzZ1BNZ25G?=
 =?utf-8?B?RjMvRUlDd2NmUEV4aTA4MFBJM3g1NFZPTU0xK0ttK0RSbVJaVkx1c2txV3hk?=
 =?utf-8?B?SmhoRWtGdGVBdW5CT3N4VDYrdXNoMVVLL3dTeFFGUVRsNVlKZEhqM1NHZ2No?=
 =?utf-8?B?OXJnVnZ0aGJYY3g3OFZWZll5eXpnV1FCSVEvTmJ3TlJ6bloxeHNTU0JsVGR0?=
 =?utf-8?B?YnlVeEVGUkRoSSsvemJqbDh3NFlYc2hVSXdnSThLeC96ZnBua0pETjgrN3VI?=
 =?utf-8?B?bXJQOUxWRjlNL2xEcjVIamVObkV4RzQ2Z1RVVXFIT0F3eEl3dFI4TEplRi94?=
 =?utf-8?B?Q3k5RkFUM0cySS9PYmdPNEdNVEFPMm1zZVlmK2M5UVB0V2c3RDJjSndvdm42?=
 =?utf-8?B?ZGt3TGdxeGY3SHRKRmZ4UG1nc2RtMmtDVTcweXA4R3dmSlRlNmFXNkg3Q3Rv?=
 =?utf-8?B?Y0d0ZjN3a1hNRUFJS0VIdFlGNDMrQlFRUFNNQlFkdWN4ZVZsYzd1YmZROU4r?=
 =?utf-8?B?TTJxT2lnTCt2RGtqTDdHYTFrUlBkRjgzK29vK05FWGNaUEQ3YTdsWHp6dGpv?=
 =?utf-8?B?am9KMlRETnRhMEJ3cnVZT3VNZ1htSmZVVENHR3MwNDNLSHViN093MHFpZFh4?=
 =?utf-8?B?anBsWWpBeFpRVzByTlVEckFkNUFKYU9rQWUyaGk4ZmFOMHhoNWN3V1g5VC9i?=
 =?utf-8?B?bVF2Z2J1STRmMitoTHJVc3FhbHg1N1NxV1J5MXhGYXE3aXE3ZUxSTjZoRkE2?=
 =?utf-8?B?OWxyeThyclZpVEdzdk40TkI0bzBoeERybEVrQ0NPenovdUdJRVVqcUVIN1lj?=
 =?utf-8?B?QTBTZWRYZmZkZm5sWEtUTXh3YjZjWHcxakdvdk1sQmNORE9IWjZmekNqRVBi?=
 =?utf-8?B?c2swL2k0NzRCNjl0WUllckhTbEZ4NEkrbjVxMSt6NE5NQUxRNnlWZERmdm5z?=
 =?utf-8?B?alhmNmx3eXBkTVFqakRJUkF4NnRKemFTaXNmYkFxZ0tiV3VycHJHejZDd1lZ?=
 =?utf-8?B?THJzVGJiWEFkeVJ3Nm42cE04dHlYeWlDYmVGS3BYSEN6a0YveUFPN201Z2Vp?=
 =?utf-8?B?SWRqNzZBN1EwODcwdDZOSWpBeGdERTJ6QjdjVW9rU1g0RWZZcVh3MnQ2UFhQ?=
 =?utf-8?B?QWFEYmFMWDNjY1NtNURZWFY5ZjFBeFdFZGtsaWJRZVh0ZEpTNVo2RUl5ci9B?=
 =?utf-8?B?NEZhaHhLVWE1U3J3UDV3WmJ1WUd0elRnMUEvalFCOUdpUzFySUJ4SG90QWoz?=
 =?utf-8?B?NVA0SmtHRjQ2RCtac1V1ekIvdUppL2x5cnpPMUFZK0V4QXBQNU9jYzQ1R3pM?=
 =?utf-8?B?NTNjd0dMNkpjOWp0OXVibExidWp1UnNDOUJmcHREUkNhQ1VZUURkVGxBQlBi?=
 =?utf-8?B?S25PK3IzZGttOXQ4TUFmaVFTVUNHVFRDODFzL2NLbWxjSFJFSVNIOGczQ1N6?=
 =?utf-8?B?ekJsUWtMZ2tZVzFEcjN5L2hPdWVveTVJSnN4OTRWbmZGeEpVbU55ZGNVYytN?=
 =?utf-8?B?YkI2KyttYUc5Nk53UTN1ZVB0dzJJOXNJL24vM0IzR0t6MjJwOVVINHByKzR0?=
 =?utf-8?B?ZkV2cU43bEtiT0dHU0xwakxTNkpTbEk4dXVibzFaSGJrNGZ1Yys0azFkYXZB?=
 =?utf-8?B?VHdrVUZUWSt4V1BPOWhXN0FlWlRWdElqOXVLMFpJclFHMzdsYk9wNjQxb1pO?=
 =?utf-8?B?UExrdlE5NEhzbi85WnZsZGFtc3dyclJvRHpLTk12bjRac2IwQlplN3VHZktD?=
 =?utf-8?B?LzF6VHRBSVVReUxUU0JCQnRuV2dyU3JpKytEZWlieW1XWUgvVlBEMWtibTg4?=
 =?utf-8?Q?JtkXGCm1KHj77LCi5QiCtyJw50WBc/pHhqV/tv+jN9uo4?=
X-MS-Exchange-AntiSpam-MessageData-1: XKGNLMMEBb0CKQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583e703d-8758-43d6-5f19-08dee406c250
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:24:41.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a23kJo/5QUyBI611t2SJSgVs4MxO+zIGjKMjYS5V3ToaYuzAgrhXyMgoTn8bTOyYDBfFDyG1ZoczeEQGH6ceLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418


On 17/07/2026 12:32, Prathamesh Shete wrote:
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

