Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB143EFFA5;
	Fri, 17 Jul 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294709; cv=fail; b=m0aJgVSUG2I9g2mwNvdyHA4QPqPbWGJMJefYrC8ZpI/UKeW8KCvCq2YpM8A2PGvYKQEz5PNjOV3wbS8Da/vdidc/IHdSUT5jpZLz6ZXCzHX4fQZxt2RexvLKWRB1BmKbnrfFHzhpQKLlNqdTodanoJgNjUEClPFmeuJEhTpY4Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294709; c=relaxed/simple;
	bh=rQta/WuNr2HsecwxVB8t8419AptNqs+oVL5ORlgIPuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UwobY1V7oxB6tOKcBJaJqtT8kMIX8n4rmO2mmpjvP8Z2L0fEwsP8UlctXk2Ktev4jXsWxcTlbiGOUihoZq/gHS1avy2oKk2Pw55zven7Zlu8KWWeGyDcg7CwRE5k6KTPY3toxYfisYFCNjMpYGisOhxjChT5pVGuUrOu1mwUXmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JxyoZ7Bm; arc=fail smtp.client-ip=52.101.46.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JxyoZ7Bm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDyLawgErIj2blDZvZeJT1CvLZfu2frIN0lwnmsFs/RzcOp9DMkJXLykZClgRy9UNntShioiaP+siQmQOz19OKJRL8o4vWfRif1EluhtIlpHwpWzOHO8n5cVRsTqBJ3mZgzX2p47Rqh1oDAsn1aGhBMtwAierhfXS2WpQRhbOQxRDCbvKr4RAxDDBooA3fyfpXGgZvuc2GAxXr7a7dT0+FnCYWWib9jZ8BM0js4J14mLhbx/4ToECIdTk52WuyAk2vXLvkAG8aHBzx+R5/l+WGEmo7R5f6qgrBZXO8tQyVUf/rBkGcTmnkBoJhoGmVN1Sbgen8UexWtaPTCjalpjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xhyd05HvwW3cJy8i+UEtaiievCWIAy2T6ayU661Q6o=;
 b=bc4nP/fW5pg7GA5+46qBfktpstKZevf9+3Lxq/jMGmfUvIy8u9+lfy54b+wPcWx4SBuxVWoY+OS/kNmFXlaMnrIefxzkLb0il87TS5sfh5txUboMqMR4toMGT7dIXqv6i+63L3yM12ZPXJJb4wCC8KTPWGqPP/u+dZE0NI8No4xWJ4J44qrmSg9XbF/6X/9A0EWxL7JlvgPLsB5HkPY3Zq/yLrbeQLnFWhp+mTTiTJm7lbsnldLm4kBPJTh6gTmeTFlTklD1q/cksHp5fhfeN0MXpJQkpH8vXL07wGy351mAGkEgktT2ZV4Vnl11OmVUbNcW7TcBT6/FYVQJANfXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Xhyd05HvwW3cJy8i+UEtaiievCWIAy2T6ayU661Q6o=;
 b=JxyoZ7Bmyi8j/UzP9aMsJUQ1iIXFBvxUs6kpPkWzs/P5a0uS0AVwSCwotYUrhKHmxxbWC25eSMpRvxdAhUINECshjL1OsCevYTArLQNJJYm1ZY5j3CYYyYZ0qDOi/VaoAu/0XDLtepVigHsfVMlmF/Z0uSoQcdfmGQ2aJCf+bgaReHxFxz/8LCeiBr3U3qSKqFai8Q5RKSNrT69VfCFPRZ9SQOg4SmB+lYM4jyK8sUHaOc7RDTdDW95gE/JtqWgzs/S86SvjgwBA/ypLnPtwKSZIwhjb6gV0DEFjjq2/k3Ebbc8RGRbPx6r0KrLCnPoSSZ6bA8bfxzBCznEVbKx+Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 13:25:01 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 13:25:01 +0000
Message-ID: <fdcb59e2-fbd0-4dfa-8a8c-12268e8646b9@nvidia.com>
Date: Fri, 17 Jul 2026 14:24:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin
 assignment
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org,
 thierry.reding@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org,
 bhelgaas@google.com
References: <20260717113210.599463-1-pshete@nvidia.com>
 <20260717113210.599463-2-pshete@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260717113210.599463-2-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 30113a7f-846a-45c1-7e52-08dee406ce15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10070799003|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	518K2u94o3T6Kxka4pNIxSDgaTm5ecpA7lclw0plegeU9W8ZuPpUk2i1vx4XKeWerg4L8PozSt31aJY3TbREldYRFiUWBaJCanRvHJw8qB2hWyb/d5HZMuG5KexEmB0Ss1BVUNFU4BjCsgD+JdvdfEZvIy0xZR/W1hmWm/97GHS3YMRWKJsUQdUjaM8vm5XaXaVnG3CT44lOeiWYuBY2Ie2Nn+purBU14FNJxm3J3FwnDg9a87n7jFwPqRObnm4yo0vNjmBmNichiIl+W9qdg/f/+LHrCDAH7uKX7O8kn5KGxjMDFgeo6PJMhiYmMxkH9TRv49saFxpuvRMfldcdt9EhbjCbp5R9lFFQS5AXf9OAYVBTB9FheIYF/hq2zjx/vAuM41VaKhv19z+kehyHwBpNBtubDJSiVT0VQ0fCTZVuTL4P3+fyXLMX9NEyNnOo4HFK0fkDmogt/ebvpdgxCdtPfsxgtIb5DqrIVxdhphH4LXyvrSO44ScbMfInKCAC92y+TvGASrEh10+MeN8gEk/hoyKoF/OALtD7cWhfqa2QEQbmsSpWsJu/uBnuN+MBHsc00DI2OPIbuvuJDh25GCnELerMFZoXgHs5jqNVzCctb3/lJ97C9zN94JB1aOQdMFW3Mg8322hPjNmCx+XfzA16oFEcfUH1pqu7J2oHO2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTJEVk02QXRpQXhKdEVyVlZNeEhtUXRKelQ3MTB5OWRkVjNQZzQ3OEcrNmdZ?=
 =?utf-8?B?Uk1ma0pRQVEwTnNsYzVKRE5MRGNYVjJzeXRtUWZsa3p2MjVwdHMwWHJSZDVC?=
 =?utf-8?B?ZlNqWXJJY2h6ZEhyU2NLWVlzQi8yQWQ5YndPZ1E3UXJ2dWxwR1BuaWlsZXRM?=
 =?utf-8?B?cHY4RHkreUhXVURDYUhoTC9YcmpYeWdFa2dFMklTSHZRejNNcUV3TmZ0bHNW?=
 =?utf-8?B?TUZkc0orSmdMU1FmOU13RGpBdmxraEVtb3JUK0ZCb2ZNU001RG9SYmdpOVBu?=
 =?utf-8?B?c2lhVmlHSyswcUZISTJlS2g1QXF4WXhNRm9RY3pISzFubWlmMG1GZjlIbHd4?=
 =?utf-8?B?ZjJYOEFMVndhY3NaZzVYMGdJV0hQNG1kTU1KVjFRMy83eGtEZkZIWmdnWWlo?=
 =?utf-8?B?UlZkeUs2Sk5Qc2lvZmdXOXlodUdBSGlvZDByQ0hyTFVFTy9EaEtDRmJvZ0or?=
 =?utf-8?B?Mzl1TDRPQ2o0UkQvSHd3T0U1YTFtZnNtd3VRZVRKOWNSc2NTVEhYcEo2ME4x?=
 =?utf-8?B?MzNaY2JaZkgyK3ZYVER2Q3VoaGNnQlo3YTluK2lIQStGeHJBS0tjaVJQa1RN?=
 =?utf-8?B?RlJhcmR2YmZUS2NRMFVCQ2JJZEFuVk5jUmNrdGwxZ1NsYjk1azlOR3VLSEtv?=
 =?utf-8?B?NXB4eXIydkpCR2hHOG1YMjBrYjFVVzRUeGE0UWZITjNaYTJpRjlEMVFwT2Rm?=
 =?utf-8?B?YVZSMzdheFFwampRTkR0clhBMjhTTFRVYlZPZ0d6a1p6WGZnY0NvSk5HSzlQ?=
 =?utf-8?B?aGRYcHpXN2hRd2YrZ05DalVaT1ZLT1VMYzZpQ3dMY1BYZjd2cDJJcDdJY3F3?=
 =?utf-8?B?UTY1cHVXbTd5SUVMYWIwVExXdlZCaXVlNXp0OTRTN3E4RGluK2dOc0NRUkRq?=
 =?utf-8?B?SG1YbzhxVmh3WlI0enMzSWhLU0ZRNmV0V0ZKRlhBNTFsWlRITms1ZGNPTndv?=
 =?utf-8?B?WkoySjBxMCtKS0hVYUF0TDdUS1BMSnFsTml0ZTY3M0F6NnJIWjJuWjEwRHhq?=
 =?utf-8?B?Mms0VWNlVmtYVm42aUhacHI4QWtpbjVCWUlmU2pSVkRNZmtZdzBKNkw3akxX?=
 =?utf-8?B?NUJYSlFaVkJhMHRYT3owd2RleGZHSEk4VUZ2SDM4WGZybitkUGFEMnc4Sk1t?=
 =?utf-8?B?TitYaTZvWjZJbHU3bGdheWR2T3hFQjk0TmwrQ1ZYcm9MdHNqdUVkdnpJVEJv?=
 =?utf-8?B?d1ZPSTMwdDlQd2RMTFZCbzI2KzBGWnI1azdIVW43L2k5YlhtL2RxblVoQ2N6?=
 =?utf-8?B?WTNiaGpSdDRlcitIRWRJME5STXBtUTdveFU4MTcyNnBiMzB2M3NQTkZLLzFI?=
 =?utf-8?B?cTA0TjdkVFVwQUk5U0h0RlQzZHVjek82ODl2NUlJay9ia005aEZ3bmpHY1lh?=
 =?utf-8?B?MzExK1JiRk9yQnRrRjVDaCtrdHlqL2k4QWZ3Wk1Oc1VMMEV1MUhGRWF1MHlr?=
 =?utf-8?B?OVZHRjQxcGZVbXNqb2FlKzFEQ01DbC8rZnU4a1VNNHNrc0JESHlMUFgxek5m?=
 =?utf-8?B?SjAzWmtDUllkWkhuZFpRTGNPblVLNmJ3NUxHd1ZzdXBGU3NtQTc3Wm4zcy9m?=
 =?utf-8?B?YVF6eHVULzNGVjZ0bk4zNmtZL2h3a09rS2V5TWdNMmdkY2NhMGU1aCtQOXA2?=
 =?utf-8?B?R0dCS0wwanEwSEZnQjlWdDNYN3lnQmpUUDFOejR5b3BzOVZLNGFTQ0RtbTZq?=
 =?utf-8?B?Qk9yQVVWV0FHNDFPODVzVERIWHY2VFVNQ3Jkc2hnVEpIOXJMazdZZlBQQ0Rt?=
 =?utf-8?B?dTJrT0VMZXdybWxLNTJKZ0U1YUlzbWdCekVRU1p5TzBDZHoxUm5TV1FxT2lk?=
 =?utf-8?B?Rmw2bTF6VnUzOXc0dmpsd2d6aHF4Wk9XN2VuOTg1amk3L0JFOGFDbytvYkM2?=
 =?utf-8?B?U2haZ0p0ckhoSDZtaWh3cU84Uk95NEVRRGYzdldaL01JSVBOYUd2YTJRTktV?=
 =?utf-8?B?eWV2cldRVnlrcFlQc2F0OEM1eWNkZGFEZ3ZqeCtycm1NVW05M3lFTnlMVVBZ?=
 =?utf-8?B?UDJWeFhpZmNRZGQyT1BDZmFWcjBHdnRhdytFU1pxMzQ5Wk4xUW5vRWc4OE8w?=
 =?utf-8?B?cENQbGNPSnhpL3Y1OFNNOGwzL1RyWHNsRWJaVW5tTHMrS0ZURk4ya081SnRR?=
 =?utf-8?B?OCsvU2RWaWVlZlV2MHJjazU2MHN4STZZb2tsQmNNQ1BjMHpxbnRjOXVlbUlh?=
 =?utf-8?B?eHpnaDR4RDMxMDdDaXFncy80NE5pY0RZbGhtVXpiYVg5QXVhRXRySy9BYWti?=
 =?utf-8?B?bHo1UUZOTGZtS0JJVzEzeEI5ZURyRjVrRTF4aGpaVEpWRmhONlFXQmV6UU4v?=
 =?utf-8?B?cnkvUmdkU2RnRUYwd2lpV3k5Q0lXZ09RYURGU1NBalk4VS81dGk3Ym83bkcx?=
 =?utf-8?Q?MfHrtNSkdR+CrwunX1KDGosavx2Pd+wPqzfMWpgAZIeMD?=
X-MS-Exchange-AntiSpam-MessageData-1: LIhWT/8g6ILcPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30113a7f-846a-45c1-7e52-08dee406ce15
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:25:01.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcKd2q8a2I/Dd+sE4MhgHtCzgBHgKI99yTDktXWZG0Jymo1HH8w9n6b3QWF5V04L1sjwhIDqxhCLuuSHDGhH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509


On 17/07/2026 12:32, Prathamesh Shete wrote:
> The dap2_din and dap2_dout pin groups were given swapped ball suffixes:
> DAP2_DIN was described as ball PV7 and DAP2_DOUT as ball PW0. On silicon
> DAP2_DIN is on ball PW0 (mux register 0x6050, drive register 0x6054) and
> DAP2_DOUT is on ball PV7 (mux register 0x6058, drive register 0x605c),
> as reflected by the board pinmux.
> 
> Because the ball suffixes were swapped, the groups were also assigned the
> wrong primary mux functions (dap2_din -> I2S2_SDATA_OUT and dap2_dout ->
> I2S2_SDATA_IN), routing the I2S2 data-in and data-out signals to the wrong
> pins and breaking DAP2 audio.
> 
> Rename the groups to dap2_din_pw0 and dap2_dout_pv7 and give each pad its
> correct function (dap2_din_pw0 -> I2S2_SDATA_IN, dap2_dout_pv7 ->
> I2S2_SDATA_OUT). The register offsets are already correct and are left
> unchanged. This matches the board pinmux.
> 
> Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
> - Rename the pin groups to dap2_din_pw0 and dap2_dout_pv7 and assign the
>    correct mux function to each pad in a single driver patch.
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra264.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra264.c b/drivers/pinctrl/tegra/pinctrl-tegra264.c
> index be64fba34dce..f8afb0bdb68a 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra264.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra264.c
> @@ -96,8 +96,8 @@ enum {
>   	TEGRA_PIN_UART4_RTS_N_PV4,
>   	TEGRA_PIN_UART4_CTS_N_PV5,
>   	TEGRA_PIN_DAP2_CLK_PV6,
> -	TEGRA_PIN_DAP2_DIN_PV7,
> -	TEGRA_PIN_DAP2_DOUT_PW0,
> +	TEGRA_PIN_DAP2_DIN_PW0,
> +	TEGRA_PIN_DAP2_DOUT_PV7,
>   	TEGRA_PIN_DAP2_FS_PW1,
>   	TEGRA_PIN_GEN1_I2C_SCL_PW2,
>   	TEGRA_PIN_GEN1_I2C_SDA_PW3,
> @@ -329,8 +329,8 @@ static const struct pinctrl_pin_desc tegra264_main_pins[] = {
>   	PINCTRL_PIN(TEGRA_PIN_UART4_RTS_N_PV4, "UART4_RTS_N_PV4"),
>   	PINCTRL_PIN(TEGRA_PIN_UART4_CTS_N_PV5, "UART4_CTS_N_PV5"),
>   	PINCTRL_PIN(TEGRA_PIN_DAP2_CLK_PV6, "DAP2_CLK_PV6"),
> -	PINCTRL_PIN(TEGRA_PIN_DAP2_DIN_PV7, "DAP2_DIN_PV7"),
> -	PINCTRL_PIN(TEGRA_PIN_DAP2_DOUT_PW0, "DAP2_DOUT_PW0"),
> +	PINCTRL_PIN(TEGRA_PIN_DAP2_DIN_PW0, "DAP2_DIN_PW0"),
> +	PINCTRL_PIN(TEGRA_PIN_DAP2_DOUT_PV7, "DAP2_DOUT_PV7"),
>   	PINCTRL_PIN(TEGRA_PIN_DAP2_FS_PW1, "DAP2_FS_PW1"),
>   	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SCL_PW2, "GEN1_I2C_SCL_PW2"),
>   	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SDA_PW3, "GEN1_I2C_SDA_PW3"),
> @@ -827,12 +827,12 @@ static const unsigned int dap2_clk_pv6_pins[] = {
>   	TEGRA_PIN_DAP2_CLK_PV6,
>   };
>   
> -static const unsigned int dap2_din_pv7_pins[] = {
> -	TEGRA_PIN_DAP2_DIN_PV7,
> +static const unsigned int dap2_din_pw0_pins[] = {
> +	TEGRA_PIN_DAP2_DIN_PW0,
>   };
>   
> -static const unsigned int dap2_dout_pw0_pins[] = {
> -	TEGRA_PIN_DAP2_DOUT_PW0,
> +static const unsigned int dap2_dout_pv7_pins[] = {
> +	TEGRA_PIN_DAP2_DOUT_PV7,
>   };
>   
>   static const unsigned int dap2_fs_pw1_pins[] = {
> @@ -1834,8 +1834,8 @@ static const char * const tegra264_functions[] = {
>   #define drive_gen1_i2c_sda_pw3 DRV_PINGROUP_ENTRY_Y(0x601c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
>   #define drive_dap2_fs_pw1 DRV_PINGROUP_ENTRY_Y(0x6044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
>   #define drive_dap2_clk_pv6 DRV_PINGROUP_ENTRY_Y(0x604c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
> -#define drive_dap2_din_pv7 DRV_PINGROUP_ENTRY_Y(0x6054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
> -#define drive_dap2_dout_pw0 DRV_PINGROUP_ENTRY_Y(0x605c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
> +#define drive_dap2_din_pw0 DRV_PINGROUP_ENTRY_Y(0x6054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
> +#define drive_dap2_dout_pv7 DRV_PINGROUP_ENTRY_Y(0x605c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
>   #define drive_pwm10_pv1 DRV_PINGROUP_ENTRY_Y(0x6064, 12, 4, 20, 4, -1, -1, -1, -1, 0)
>   #define drive_soc_gpio170_pu0 DRV_PINGROUP_ENTRY_Y(0x606c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
>   #define drive_soc_gpio171_pu1 DRV_PINGROUP_ENTRY_Y(0x6074, 12, 4, 20, 4, -1, -1, -1, -1, 0)
> @@ -2051,8 +2051,8 @@ static const struct tegra_pingroup tegra264_main_groups[] = {
>   	PINGROUP(gen1_i2c_sda_pw3, I2C1_DAT, RSVD1, RSVD2, RSVD3, 0x6018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(dap2_fs_pw1, I2S2_LRCK, RSVD1, RSVD2, RSVD3, 0x6040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(dap2_clk_pv6, I2S2_SCLK, RSVD1, RSVD2, RSVD3, 0x6048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> -	PINGROUP(dap2_din_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> -	PINGROUP(dap2_dout_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> +	PINGROUP(dap2_din_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
> +	PINGROUP(dap2_dout_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(pwm10_pv1, GP_PWM10, SDMMC1_CD, I2S7_LRCK, RSVD3, 0x6060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(soc_gpio170_pu0, RSVD0, I2S7_SDATA_IN, CCLA_LA_TRIGGER_MUX, RSVD3, 0x6068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
>   	PINGROUP(soc_gpio171_pu1, RSVD0, SPI4_SCK, RSVD2, RSVD3, 0x6070, 0, Y, 5, 7, 6, 8, -1, 10, 11),

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

