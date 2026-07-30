Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15DE3F44E7;
	Thu, 30 Jul 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403127; cv=fail; b=deHaLTSKGCRc5S6XZkp5cJS5UYtxAGlEfD76EzuN4MVGfdV/bDuzUgvRqncXD8UH9Zvhk3UmZN82kuwX8c6J61t3u1UXGZ8zet1qaYz3enwXafDjlUbf97HMnWt7HZWwqyB6DqF/tjmiXKvj0sVCPbCJAoqF+ndyq7pdjko//HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403127; c=relaxed/simple;
	bh=q4fWSePnxxxcvRC5NceoIpAxAwZUDS9vyexw1zhKFpM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K8PRlLb0pMYyDwtTzZM2qk0MSXNOw4b5+g4FbijU1sTcGKLTGK0aM4/edtzqgnyIcwyVxp6kcU9lGrd8JwJOaVVIz206Rw9qaHJnHp/2nDH5diEy3Wu2msRbok8DcnxWksOplzOXvof0IoRCAg5fLXFWfBmnoto8Eg3f5k8a4wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zg4NXQr1; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zg4NXQr1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK5w6/kXT7ztzwy3Vrh9VZStOLc0f3E6VNiaAoux54csp6vsyaIgLUbCS/mvkWmxsDzabvH4lGfbI4DWw/XcPb6hVLuITKIW8t/G0fRiNoAZBqTjOB6Mo3r8pmL6tajFsan8CuJKGylCHe4PvgtyKGET9x50uUw0yfaBkaWXKdGzGE+Ci0yZmhiWkXcdxuHHeuX0E8qRAHaNXtvbpx28R8G+4AGl3aOdWbFbZv6XeNWhMVnGpzCmzCebd56jKM/iGcaO1T0rF4kGPHC/U3XKefTt6ljEuqgRdVpvY8EdHClYhLppGF+sFvpaDd66O/+G9Gnn10wrwwuG66aj8Q5pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J59oYZjyiol6pAb68RrHSj9SiE7OIj/OiBDd1yO8ODA=;
 b=NrWLB/lH1lFQT0jYq7vG2HMeWuK9mV4dQeyb7tN0WYmDTdYVcTz2ouFksbeJ7UYYbuJv1cNoe+JjJNhebCLbY+1vFfionkMCCZCfUxV2GpyJG/XD3HJfprS9WFF8GuUW+cwRqI/Pp8wkTgK5gwyqJZ60ySgc5JkJk3cFojYkl6Y3y0TztZQB3lJBJs6rmGfnO5aJEEQR5mj6zwCdBvkygtjt37yqI3VUyhon8ld9fh6tBIA4TV1yc1iSXT49lawBpH2bTTQbq5ZMlJeddJlWxBbc4jQna/HPgSZFGgbRlSESJBSgZElnuoEIiiVkRYAPbHeq9BTFgWvKx7cXDVl3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J59oYZjyiol6pAb68RrHSj9SiE7OIj/OiBDd1yO8ODA=;
 b=Zg4NXQr1W2BALQwTKl2Ubftfz3x75fz/CwFGI+8DNvt+4CZB9EJnkr6sCfba0/xYQwNSZZtxuGxcmntAy0t1e1zMJHb3JGt7Mg9/nteXOJiY0ZejHkdxq0aMXaz/9Ojft4O/UxxxbcwgwdZNh8aOAV1LwFwlv2+aPavbu3DQrQNM445/VbfGlRhzwA/PaMJ0kQmybDrcb1kESfZauwsC1Xh3nQA4sQp61dC0CqDM88JrVT0HdwKfr+4PgMjUEMZ/E7FmpteFigxaue3uUtPDdvh3qGp1+0URG+ROr18NqDwYTzBMRqlfaYtyhJMkUn7B7a59hmeVxGugR3o1SU0fFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) by
 CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.15; Thu, 30 Jul 2026 09:18:41 +0000
Received: from DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06]) by DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:18:41 +0000
Message-ID: <edebb04e-d6a2-450c-a5a2-27a2f171189d@nvidia.com>
Date: Thu, 30 Jul 2026 10:18:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND V2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin
 assignment
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727141121.772110-1-pshete@nvidia.com>
 <20260727141121.772110-2-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260727141121.772110-2-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6063:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fba4fac-2cf0-4931-bb51-08deee1b8bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|6133799003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	j0eYLelG/pmWV1jQnQgr9OlGzTmAXHsJVQw55B86rqHf8s2GwVEcAvl0y7qOzWFNV2EzCysTToLguOMASPtJR/XzCZWw4U9DuofT3VEVwvLQVeT1z8ynGLEloaWAndzwYpksbLsXf+wMNwBOE0DqEO4Vuj2GilddtQSNXjBYxjbdT8e7uI5L7h1gGAXsYQKjn48By5g/oTFGZky8GRIiogh1iwa8/NyL69Wbx6PXAtMj/Lu/l9vye9foDUnS+g/4a/ERmUwQR6ZqsezZHpo+Ix8nTsZzNqKlZLUuxrdzaLWurDfSAbcpZ0ncvjEercrkGt4pED2tpWwzaGJkXRFOGYPtHyIht7401px+BafJn3DBiOtPW9/7yOw3QiTAMSoPC9odsqBKaLPJMLISCQ9SOLbuXgH1SjF3xAewm3mbxRTiePJYM1WEKs6SvbYw22XTonC1NpQqWkozijyf2UFtLUhMP9v+3GK4gaip388EnxR9I1qPk1AQPWlO1oky3SqBFnTazRZiO7MU7Sp3U6ADx/j96oPdsooQij6MR/qB5b74amxr+VticDGkG4m0qLjF0j9KTgniM2LEa4rY5vKB4mY9uYABI6wMTlcpDfRkYjcFEe8JrmaT1qfx9FT011dUSC9rkst8n9+T2QckFuSLGYaaChRtF+gOhjRXJ8XQKEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6063.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnVDbkRWMTR2bmxKNnF6QS9nV1N2cGE3MFJjSFl4ZGxuNFFGVlRpN1UzQm5i?=
 =?utf-8?B?YkFTcG9WRW9Icm9ycDJzd091a1NaeTkvSHkrWGVLUjBGcnFDaS83emRHTlJz?=
 =?utf-8?B?UDYySUVxWmpnVFlXUW9BQ2QwSWwwc0dFdmxndENyS1hJeS9HbVdsSHVyTGE2?=
 =?utf-8?B?SkgzeTA4amxiQ2tBNE9ZODhFckx0S0VWTXlZS1R3ajE0L0cyUkFGbG1zUFhY?=
 =?utf-8?B?SXhJMUJZQjZjYkVhTEVwOGRCWFlnblo1QjZyR1p2NVVtZUFUYUlobEFFdXhD?=
 =?utf-8?B?czBOeEhZOEV2bllNOW9lb3VaRUQ2Qk51dTcrcDZLVkN4RVRSUGwzbUxta2pp?=
 =?utf-8?B?VHQ3dndrVDZvd3NIR01LeFFoRkpSMDhRVmpFNEtuK1l0NkVFYjFrdU0vT1dt?=
 =?utf-8?B?ZGpScnB0TDZ2aThicTllSnlXZ2pWTks0V3lSN0ExTFNiNCtSK1pkVWlCZ2hR?=
 =?utf-8?B?MktvdDhYSnZYYXJSbFR2ay9JME96KyttWncxVks0NmFJRlQ1OHcwYU5OOUpy?=
 =?utf-8?B?czFXbWN0WXExU2dTblRNT3E2VzZ4cXNwKzR6MVNwK2k1VldMcG02RDJqZ2Z3?=
 =?utf-8?B?Uk56cUNLZnBoOXdxRFR2K2cwUWtEQTJTMU82UXMzazlZZktSUmM2alFiRys2?=
 =?utf-8?B?Ujh6eTdyUWhMN04zTjJrcHNDRUdVaTJ5S1pkYXd2dmt4cTFWZmJnU2FnNkdG?=
 =?utf-8?B?RmVhR2ZzSkJ6VmtNcWhRTU9GV2JLR0thUUcvMm1zdEhYanFaQlpUeElqY0JE?=
 =?utf-8?B?T3FObEhscjlobGtQdzhLbU5TR05QUzA3OEI5YnBYbllKSHFNTm5jN0lEL29s?=
 =?utf-8?B?TnpCQnRIWDZOTXNkSDdQVlN0TjdjejR3RUU0MWdKaVUxSWhyM2dGa2svcVUr?=
 =?utf-8?B?eGlWdy9IeVdkMWQ1bWNjYmpncFFTZlRreE5oS0JLQzFTS1Y5dEY1UUNDZ1M1?=
 =?utf-8?B?TVJWU3c2eHRsdWUxZEE3dzFlV213eW02bmtIejRFWStVWkpsNnloMy9HZUo3?=
 =?utf-8?B?cU1FQ1E2cHVha3VrTmhndm5CVHpNRStCZGZEVVZMSEZmMVdrSEJkTFNiZ09Z?=
 =?utf-8?B?RVQwRE9uS0M2c3JZaWNHK2hCL3dsSG4zUXhhL1hyR2Vtd2tyK2h3NTN5L3Ez?=
 =?utf-8?B?bXBWc3NnU0FIQkpzeVdHdXoxcVVzS1lINm9jZmppU0grVVdaakVPVHluYnQ2?=
 =?utf-8?B?WjZoTjVzV0RZSEJGa1lub0FyZFBVOGx5TURmL2JGZTc0ODRkK3E0N2RDbHEw?=
 =?utf-8?B?NCtUR3VETGNFSEMvaWZacVJOVmZDRy9WK2Rma3Y4R3JNV1pHSG5SKzhtWll2?=
 =?utf-8?B?SGZWNlVnemVES3BzZmg2L1RUTXhXS3NEa2w3eWRkQzhWaTFPcG9YR3dwTitL?=
 =?utf-8?B?MVVsVTdGamtMU0pTajUyT2VpK3J6aVNuLzk3ajEyLzhHNzFodEZZSWhkNXlY?=
 =?utf-8?B?OTJHajF6dlFEVzBkYlRsYk00cGo3WDZRVjVnMWJ5MUk0UzVPS1ZEZnhkY0N2?=
 =?utf-8?B?OUtmUWJ6aUxXRDJIVlF1MkdCWStBbmp1bE5wZ0xGclRwdFY0WU5rdWV3SzJT?=
 =?utf-8?B?MnpDdDdmcmN4WkxzaWtBNGlaM2s2MTJ2d1V3YzQyK2NoYnR5MDV4TnhuRzBK?=
 =?utf-8?B?UkdJR1lnM05WY3BBNGszdHpMWWR4WU9KYjJGcDZZcGp4TzZaOUdkakcxakk3?=
 =?utf-8?B?TG42TDRHVElDT1pzU2NYSFM0c21ZTGFjakZ1YzNyemsxUGJEd081Yk0rSzIv?=
 =?utf-8?B?Wnlja0RqVEEvc3B2SDBhaTBUWk56bnVGZy9PNHpiVlk3THQvMEZ3d0lIM3Vt?=
 =?utf-8?B?UjVXcjhFMjIyekQzSkVHajQ1aFdWNHNmOWpqbllFNnl0aGltNFhOekRTQytS?=
 =?utf-8?B?SXF0a2gwaGRmVS9xbDNjbGNtMVZzTjBVR09pNW5WSlZDc3RGeUIwdXd3UW04?=
 =?utf-8?B?QThXKzlXK25COERid0dIMVhGYUVCK3JOK25KeEtvbnpjRFQ0VlRubHZJdlFi?=
 =?utf-8?B?R3VSR3N2S2RoaUc0cXRSQ2poZzN6bnU2Zy9LdmF6M0dicUhBM3ZyYTBQWGdr?=
 =?utf-8?B?eWg5MWxjenRjWU5Sc2JPVzZIdWlRck4vTTZmSmxVN3pocDhoM2hCNlYwWlNm?=
 =?utf-8?B?R0R5b1V1ZmowejFKMzNpNlZxR2N4dG10Y2RpcVdlVmlDbFFGQkZVbm85RS85?=
 =?utf-8?B?bi90RGdzNzg5b3RFbmR5aDNhUTQ3V1REdFYyTFZ3clcyZ1U2NkdNc0hPdUo1?=
 =?utf-8?B?QkNDZGhVQjhFKzJsaTd1MHJiNmlLaEhHckdKMHRsZGV1T2UwNkRZajFCWm50?=
 =?utf-8?B?ZFM2ZmIvQ2JwMkxNV1djb2lGcDBUTVdBc0hVY2RnMjgzait3bmVGZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fba4fac-2cf0-4931-bb51-08deee1b8bdf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:18:41.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwZ/0FalYU9gn0SYul353vOcHR+ZKH65MW/Wih5ZVJdHUZ1jc2gDKQO5LH43v4DLQC/jKtJsp9cu3oMjJe7maA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249


On 27/07/2026 15:11, Prathamesh Shete wrote:
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

