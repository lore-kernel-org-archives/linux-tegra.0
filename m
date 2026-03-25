Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0302E22576E
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467230; cv=fail; b=nzUv2ST6Q0B63OcVM+mzml7/Xs4ksh7c6fom0oryyRwFsG7lnnqzIOfQrdgVzblwXW5/C/xquJeVWeTnD2et6DmK47qn1XDY6p/Uu/pXHXEAH07L+LBTHdCbzPlYhePqpoK+fpF6CuQgkG/CCTkoeI+0pb2PY675GZZ+2c9Yhi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467230; c=relaxed/simple;
	bh=gff+uif0lAHag7rAT/elWloWV/z97be/1rj02EWVGSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GQmCtLsk9Rl8lFzOIITuSa59G22cc5l/FguPF1FyaQKXubIBft37z1uxpUeJWVbiSOxpT6SYhOp5mQyOGDUYiSzNpmKbQHPSLSXpV7ULra6r8N04GGS01t36gz5mkLqJgxF/gtlv+SMmDzvhiHPjqoh40GK3PQBRcn9FRkAZ/2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fouXKc8v; arc=fail smtp.client-ip=40.93.194.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fouXKc8v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0mm/68mhlStjbf8xzCSoJfWKd1F4nJKQ19DxB0HercCS0rOe3qonunBEtttk6CbTIFe54u2hkuUcnE5aEQuikHQPcGu8D6bNvJ/548TuQm6NKrMG7EOYIUTtDbrst7XJ9LgLxIRvmUtirBLinLixRBsRxqD08TZAjZ6T11d1Rpi0nJeyVJ7UIqp3KNumQqu6gSfJIs4IGX8BR6M8/H82WmS6Hh5NexxxC4kvTUuovHbnZ/+s8FzRBfV/2hBf8/m29NmeXWo8409dgYKfQ/crEqknC9RE0B6hSXjpp3xa6z2YMTl67QKMRs6FvFNlmvj6IPogIEndL5/53MCpTMIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlr8L0YZ/IttMXlRV+b7psv4f/x9CGwvI3W/pZmr6Og=;
 b=bcgLs5WXn6PJltp8LaUjhSe7AMslvWvHPCX/wWOWP67i5mQ53aykfhiodR9tuZMrZf18x+zYyf9nCUxnYl+p0Y/Cfbb6KoemAE/Uw6kkCs68BV3S4z1DhPb7TEl5vQeiYWEegkzKMtpQOkk6m5x+jbcht1Ae+L/h1wFSykHdX8KPlXSOSMbE021bsjBWioSNFHe2lAlPMkVLQXF94Zn05pRExz4T8C+NKnx+ZkudrhOznz2LusBiR0WEtRZETj8T33FyhTWyxxCTfTADHsT3TNJ+VCLlZijHpG0Uso60y66yyohdTDUfWB8V23SI8YJhbwUY/+POJBIaIwSHfeILPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlr8L0YZ/IttMXlRV+b7psv4f/x9CGwvI3W/pZmr6Og=;
 b=fouXKc8vZazDGbX1Yz12SL0/K0NMqHNz32S6/EgFlC1+hTdlUVK3NxFiZKmA7nVa2hgArfxv8hpJaMAWW3FtKV1O0sLqS+Ch62iMZaNic78tP8K5Ffo7WxNW3xBDcwiLwnF4nQP8WUNG8pSP/I7nG4rv1fJtelrwMmKoDRreuimr7ZV4I8MZ1j3rDuqbnsQKTPPggZOg45nPX9Mf+hC2U+hMTdk3T6rSFPpIO9dJMpNViu2feTOZQvwicxaxN2TCaXMxeNZmx1FYi3h0YsKgLcemPpLagtiM6uxS+HeLWD069o3Gjtm0in4uF2QXpplwgKhH7ewFwsZQgDL+qIYnCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MW4PR12MB6922.namprd12.prod.outlook.com (2603:10b6:303:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:33:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 19:33:45 +0000
Message-ID: <15d21a29-96fd-464f-90d3-5a8cbe2810d3@nvidia.com>
Date: Wed, 25 Mar 2026 19:33:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] soc/tegra: pmc: Add support for SoC specific AOWAKE
 offsets
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20260325192601.239554-1-jonathanh@nvidia.com>
 <20260325192601.239554-6-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260325192601.239554-6-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::10) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MW4PR12MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb412e6-a36a-4b9d-84b1-08de8aa56df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hqgp6LLlgHSYPxfinST3R8hGYZYcJ4+XzLAVn1dnzv8szupqYR/YVvhGoxveVGhZ1IjTxeTiOJTg7v9g3g57h7TejFOgINSkCYIT0kQk0HVa73yQ9DibC2b6DexdMC31pAVuvKd3C/D1imnhMjPWXdQE4e93V+z9tKukuvJNJDQZ2Orrpnz5/zTctti7V/U83T/6Lr420bJB8gNgiUH/KMb357Gko2zxAcFFImK7DIqiOir21xcbj99YyMzbZpQywUQYY+9sgGRWQLgKNmZrFOBN/Z2+8PvpOdV8uFHz/5gjHRoH6DkCeb3pZtDjcPzKF/EPKZL0ZuvF07E2pfAerZ/ubUDhXSoGXxWv7+Us45yvSsmpuTmPu+m6lp1XboHZM+mqRbWr83HmQCZsiyI6dT+HCE5JwK2YciXk5gLGBPKX9bOY2gBv/+bFAEsx5xI0yeEM439cN1DheS55X0wZuvc1iZzJlyyU9tU4Y0HE5KCv3qxKhIdmiLUE/guHFNONuM5vT6kbBWiZ5wYQiRfoKMWwpndBOLaOn509QPAQLuJVxYeKzk9Zr9bGz3i82s68UzJJFIcLnXkJW1N3fN0qKtUlUeSm4bno3WyfdzBG1ZhG2+utUiH9TO+2q39/+vGpXmxqhA2dWRI2TVU4FFR30Lek1KQKIwTYHBXKIVEJsCOrU6pVwG23qiCh94v0AJhtOvr/CweNKGXDJh/3hvqE3ciUDyM4l2lXmVlQ3GEbt3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VLZnRDeDhSOWM3ajJWLzloKzhlQzNkM2wwZkd1OGxiVjNYRXpCUFNrVjZB?=
 =?utf-8?B?MjZCbDFXNE13OVRxTEMzdTNGN1IwSTFvNk0zUFhvMmlTb0lrckp4cFZBcGtp?=
 =?utf-8?B?blBldlAwZmdwREFmZURnYmdVSmk4dWhYdlU5U25BSWtkVkVXcWR3TzJHZmQ0?=
 =?utf-8?B?VG1yeW5qWjQzSC92NnFYMkZqZHVUZlVRdlNMamNTcStyZmw0My9CWEJXRHdo?=
 =?utf-8?B?L0s3WGFqdE9HY3RNZXZsaDhIV2o0MytDcEdUQWVGZ0M0SUdxZFdCUTlxVkRO?=
 =?utf-8?B?VGUrdmtyay9ZQjNuenQ0cXJEQm80a0pJQkg5cWMxS0F2Sk5DMGJQMWRXR1lE?=
 =?utf-8?B?WktMcFBRSWZBdmxyNmZ2Uzc2VGhYYjRLZXJXUGFWLzQwRmZoQlBYejRPTklk?=
 =?utf-8?B?SkFmbThSajBsczR3d1NCWE5ZUGxIWEptSGp0djhFWFQvc3h0Wkpxd2FCRG9N?=
 =?utf-8?B?aTQ3ZnZHU2hlUjVoanVoblJtVmdmRjNJdjlURld5MzVHZUJuOWkrd0RvUWVR?=
 =?utf-8?B?SklGRitMNmxEVWM4YUU3L2NUbjFWOHNUTDZMT2FmbE9JSEM1ei8yMkVEV1p3?=
 =?utf-8?B?ckY2ZDBrbngrKzFHanVaQ052a3ZlcEhGY2lJTHJMTkFXN0ZENFQ0RnhFbjVa?=
 =?utf-8?B?MHlLbXpqYk5oWUZ1eng0U2V2azRBMGRMTzRKSVpaZWVMRHRrczJhbWQwUVVx?=
 =?utf-8?B?MjlSLzdsc0NGM0hJVmYrdnJVS1c4ZkRXUUwrdTJSaEpuazJHdHlpa0NhQ0tK?=
 =?utf-8?B?MW94TFoyMGV3LzRNeEdyS2FIWlRTdzRzOTBuVEJ4UmtjNEg2bVcxYXVLaE8x?=
 =?utf-8?B?anRPSFNvMnRweStQWkFsRGpJYVRaMXVXRWlsaFZEK3dLRGpsQXNMTE5QZVFN?=
 =?utf-8?B?SytNOHUzWWxLVEk5Qzg4djZUVSsvSUdVQ3l4ZWZPeC9KTlYxdVYzN0x5QkRL?=
 =?utf-8?B?dDZHMkVmRnRkQWsyNzdkelg1NzhPd2Jpejh5MFpJc1k1REh4T0dUMDdvUXlV?=
 =?utf-8?B?L0FlTDdWcUxYQ1d4ZWREUkpNVmIrLzk1Ykw0Sk5ML2cyK1hoZGVTcTZTZzJD?=
 =?utf-8?B?M3J4bnVnMHZ2Q1Q0T2JoU1dwQzNGdmJvN3JKay9POUFmOXV6dHdmd2dpQ3pE?=
 =?utf-8?B?anFkd2gwUXh1cW9vekVMNDFHM0pkQ1ViVEtwaWErRmpZZGM4bC92ZGtKeTJy?=
 =?utf-8?B?L0hoZnU3UVphU29Lb2JmN21NYlZGYVBXNUJxZlNjc1RtbEFtVk5XMkRjNHN6?=
 =?utf-8?B?VnF1emxUY1NtM1JlKzdGbUNIbEZIY0xFTTVJdzdQUzFWaTNEMEoybFNuU1Rh?=
 =?utf-8?B?N2tlbG1FK29kM1RtcDJpRmNaeDhwckdpaTZmei8yTDVhaUNkOHI3blFxUUtw?=
 =?utf-8?B?dnRlRWFwRWhDR05UVWo5RUdsVERmYUZ0UGl3OG0zK0dGdk5QNDZjcEdXM3Vn?=
 =?utf-8?B?WHVsbWppOUpGQ1lad2J0d2Q3aXJJc2oydEJEMjdTcXcxZmd2RGx0NjVrejhi?=
 =?utf-8?B?bDE2cXFHd3VZT0NOT2Z4K1VNckNybDhhU2FjcitjOU5DajF4d0Vic0NlN0g1?=
 =?utf-8?B?dVEvdElIVzdoZmIwekV1cFFTRnNsQ1VpMWhVeDJZdFZkcWRCeDA4SlJIaU80?=
 =?utf-8?B?cUl0Qk1DTGZSS1dQVHZ3RHQ1YXEwdUxFUkRiZ09sR2ZBQXdDTzFYWk9SVTVl?=
 =?utf-8?B?UXcvUnBzU21iUFBWYklQRS9XT3RpTC8wTWtjVmoyR0xKVllBekpSbklwTGg2?=
 =?utf-8?B?Y3JqN2Z5OVBYcjREUENJNWt1aHRpWVZOaUQyUmtqVmREMjhON3k5b29UMGFk?=
 =?utf-8?B?UkYvdEdZalNqNEhYUlpFd3NqZ3V3N3BneDNJKzArL2hZMTZhUUxkdWp1TzdM?=
 =?utf-8?B?TFV6VUNCTXZqMXRESW9HL2NwL0VDMlRnRFN5NVI3d2RRd0ZBVUd0a2k3ZlUr?=
 =?utf-8?B?cTNhRXJKU2lvZlZiRkUzK05yVm1KbEJzWXpUdm5xN3ZMbHpwYlpJejZFbWlU?=
 =?utf-8?B?RmplRVpPcDgvaXNUbG1YOG16ZExFMGUzRlJMd0hjUURlczVJREpJck5jc2xE?=
 =?utf-8?B?NVZvdmVtcCs3U0lwVEpUajI4cHJ3RU5SM2ZGV1R1ZjVPemg1TVo1WmRwL1pS?=
 =?utf-8?B?SHZ5YXdUenp1ajJWWE5GRDFLTXhUKzFoaEkrRUwzQzNwSHRrbjZld3NMS2pP?=
 =?utf-8?B?cU9Cek5GTnYwNXdMU3IrUXlEL2pZbkhDVWpQUDE4a0w1Tit2a3laRW1jN3Bl?=
 =?utf-8?B?VFA4b0pGYUh1T0NrL1RMMGgyV2owaEo1d0JmWmlDbnhJU2swYWNSNDRtS0hp?=
 =?utf-8?B?L3ZxMVVCYzAyT1dCUldQSGRVcjFYajlqOUE4NFh1R2ZyeW1GblFKZ2ZZZzg2?=
 =?utf-8?Q?1gBVJCvFiWsQbkG70YAkDzh3uR6hWNWC5kX+uJAjnQJ0v?=
X-MS-Exchange-AntiSpam-MessageData-1: 6JrgNkThmyEjXQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb412e6-a36a-4b9d-84b1-08de8aa56df3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:33:45.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXYA4Umk96N3NvHN7KKi/UUMXQ90Dl7oIPzBow6oaRoV5d9vFvtfTmwU9LL/5U+8cT6QTk2T4edBoN8AYfC9gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922



On 25/03/2026 19:25, Jon Hunter wrote:
> For Tegra264, some of the AOWAKE registers have different register
> offsets. Prepare for adding the Tegra264 AOWAKE register by moving the
> offsets for the AOWAKE registers that are different for Tegra264 into
> the 'tegra_pmc_regs' structure and populate these offsets for the SoCs
> that support these registers.

I should have mentioned here that ...

"Finally, update the applicable AOWAKE macros to use the 
'tegra_pmc_regs' structure where necessary."


> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 86 +++++++++++++++++++++++++++++------------
>   1 file changed, 61 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 55c1117b1741..42176abb96ea 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -180,16 +180,18 @@
>   #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
>   #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
>   #define WAKE_AOWAKE_CNTRL_SR_CAPTURE_EN (1 << 1)
> -#define WAKE_AOWAKE_MASK_W(x) (0x180 + ((x) << 2))
> -#define WAKE_AOWAKE_STATUS_W(x) (0x30c + ((x) << 2))
> -#define WAKE_AOWAKE_STATUS_R(x) (0x48c + ((x) << 2))
> -#define WAKE_AOWAKE_TIER2_ROUTING(x) (0x4cc + ((x) << 2))
> -#define WAKE_AOWAKE_SW_STATUS_W_0	0x49c
> -#define WAKE_AOWAKE_SW_STATUS(x)	(0x4a0 + ((x) << 2))
> -#define WAKE_LATCH_SW			0x498
> -
> -#define WAKE_AOWAKE_CTRL 0x4f4
> -#define  WAKE_AOWAKE_CTRL_INTR_POLARITY BIT(0)
> +#define WAKE_AOWAKE_MASK_W(_pmc, x) \
> +	((_pmc)->soc->regs->aowake_mask_w + ((x) << 2))
> +#define WAKE_AOWAKE_STATUS_W(_pmc, x) \
> +	((_pmc)->soc->regs->aowake_status_w + ((x) << 2))
> +#define WAKE_AOWAKE_STATUS_R(_pmc, x) \
> +	((_pmc)->soc->regs->aowake_status_r + ((x) << 2))
> +#define WAKE_AOWAKE_TIER2_ROUTING(_pmc, x) \
> +	((_pmc)->soc->regs->aowake_tier2_routing + ((x) << 2))
> +#define WAKE_AOWAKE_SW_STATUS(_pmc, x) \
> +	((_pmc)->soc->regs->aowake_sw_status + ((x) << 2))
> +
> +#define WAKE_AOWAKE_CTRL_INTR_POLARITY BIT(0)
>   
>   #define SW_WAKE_ID		83 /* wake83 */
>   
> @@ -302,6 +304,14 @@ struct tegra_pmc_regs {
>   	unsigned int rst_source_mask;
>   	unsigned int rst_level_shift;
>   	unsigned int rst_level_mask;
> +	unsigned int aowake_mask_w;
> +	unsigned int aowake_status_w;
> +	unsigned int aowake_status_r;
> +	unsigned int aowake_tier2_routing;
> +	unsigned int aowake_sw_status_w;
> +	unsigned int aowake_sw_status;
> +	unsigned int aowake_latch_sw;
> +	unsigned int aowake_ctrl;
>   };
>   
>   struct tegra_wake_event {
> @@ -2629,20 +2639,20 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>   	bit = data->hwirq % 32;
>   
>   	/* clear wake status */
> -	writel(0x1, pmc->wake + WAKE_AOWAKE_STATUS_W(data->hwirq));
> +	writel(0x1, pmc->wake + WAKE_AOWAKE_STATUS_W(pmc, data->hwirq));
>   
>   	/* route wake to tier 2 */
> -	value = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(offset));
> +	value = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, offset));
>   
>   	if (!on)
>   		value &= ~(1 << bit);
>   	else
>   		value |= 1 << bit;
>   
> -	writel(value, pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(offset));
> +	writel(value, pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, offset));
>   
>   	/* enable wakeup event */
> -	writel(!!on, pmc->wake + WAKE_AOWAKE_MASK_W(data->hwirq));
> +	writel(!!on, pmc->wake + WAKE_AOWAKE_MASK_W(pmc, data->hwirq));
>   
>   	return 0;
>   }
> @@ -3309,7 +3319,7 @@ static void wke_write_wake_levels(struct tegra_pmc *pmc)
>   
>   static void wke_clear_sw_wake_status(struct tegra_pmc *pmc)
>   {
> -	wke_32kwritel(pmc, 1, WAKE_AOWAKE_SW_STATUS_W_0);
> +	wke_32kwritel(pmc, 1, pmc->soc->regs->aowake_sw_status_w);
>   }
>   
>   static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
> @@ -3322,7 +3332,7 @@ static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
>   
>   	wke_clear_sw_wake_status(pmc);
>   
> -	wke_32kwritel(pmc, 1, WAKE_LATCH_SW);
> +	wke_32kwritel(pmc, 1, pmc->soc->regs->aowake_latch_sw);
>   
>   	/*
>   	 * WAKE_AOWAKE_SW_STATUS is edge triggered, so in order to
> @@ -3340,12 +3350,12 @@ static void wke_read_sw_wake_status(struct tegra_pmc *pmc)
>   	 */
>   	udelay(300);
>   
> -	wke_32kwritel(pmc, 0, WAKE_LATCH_SW);
> +	wke_32kwritel(pmc, 0, pmc->soc->regs->aowake_latch_sw);
>   
>   	bitmap_zero(pmc->wake_sw_status_map, pmc->soc->max_wake_events);
>   
>   	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
> -		status = readl(pmc->wake + WAKE_AOWAKE_SW_STATUS(i));
> +		status = readl(pmc->wake + WAKE_AOWAKE_SW_STATUS(pmc, i));
>   
>   		for_each_set_bit(wake, &status, 32)
>   			set_bit(wake + (i * 32), pmc->wake_sw_status_map);
> @@ -3359,11 +3369,12 @@ static void wke_clear_wake_status(struct tegra_pmc *pmc)
>   	u32 mask;
>   
>   	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
> -		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
> -		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
> +		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, i));
> +		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(pmc, i)) & mask;
>   
>   		for_each_set_bit(wake, &status, 32)
> -			wke_32kwritel(pmc, 0x1, WAKE_AOWAKE_STATUS_W((i * 32) + wake));
> +			wke_32kwritel(pmc, 0x1, WAKE_AOWAKE_STATUS_W(pmc,
> +							(i * 32) + wake));
>   	}
>   }
>   
> @@ -3374,8 +3385,9 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
>   	u32 mask;
>   
>   	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
> -		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
> -		pmc->wake_status[i] = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
> +		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(pmc, i));
> +		pmc->wake_status[i] = readl(pmc->wake +
> +					    WAKE_AOWAKE_STATUS_R(pmc, i)) & mask;
>   	}
>   
>   	/* Schedule IRQ work to process wake IRQs (if any) */
> @@ -4062,6 +4074,14 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
>   	.rst_source_mask = 0x3c,
>   	.rst_level_shift = 0x0,
>   	.rst_level_mask = 0x3,
> +	.aowake_mask_w = 0x180,
> +	.aowake_status_w = 0x30c,
> +	.aowake_status_r = 0x48c,
> +	.aowake_tier2_routing = 0x4cc,
> +	.aowake_sw_status_w = 0x49c,
> +	.aowake_sw_status = 0x4a0,
> +	.aowake_latch_sw = 0x498,
> +	.aowake_ctrl = 0x4f4,
>   };
>   
>   static void tegra186_pmc_init(struct tegra_pmc *pmc)
> @@ -4094,14 +4114,14 @@ static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
>   		return;
>   	}
>   
> -	value = readl(wake + WAKE_AOWAKE_CTRL);
> +	value = readl(wake + pmc->soc->regs->aowake_ctrl);
>   
>   	if (invert)
>   		value |= WAKE_AOWAKE_CTRL_INTR_POLARITY;
>   	else
>   		value &= ~WAKE_AOWAKE_CTRL_INTR_POLARITY;
>   
> -	writel(value, wake + WAKE_AOWAKE_CTRL);
> +	writel(value, wake + pmc->soc->regs->aowake_ctrl);
>   
>   	iounmap(wake);
>   }
> @@ -4281,6 +4301,14 @@ static const struct tegra_pmc_regs tegra194_pmc_regs = {
>   	.rst_source_mask = 0x7c,
>   	.rst_level_shift = 0x0,
>   	.rst_level_mask = 0x3,
> +	.aowake_mask_w = 0x180,
> +	.aowake_status_w = 0x30c,
> +	.aowake_status_r = 0x48c,
> +	.aowake_tier2_routing = 0x4cc,
> +	.aowake_sw_status_w = 0x49c,
> +	.aowake_sw_status = 0x4a0,
> +	.aowake_latch_sw = 0x498,
> +	.aowake_ctrl = 0x4f4,
>   };
>   
>   static const char * const tegra194_reset_sources[] = {
> @@ -4400,6 +4428,14 @@ static const struct tegra_pmc_regs tegra234_pmc_regs = {
>   	.rst_source_mask = 0xfc,
>   	.rst_level_shift = 0x0,
>   	.rst_level_mask = 0x3,
> +	.aowake_mask_w = 0x180,
> +	.aowake_status_w = 0x30c,
> +	.aowake_status_r = 0x48c,
> +	.aowake_tier2_routing = 0x4cc,
> +	.aowake_sw_status_w = 0x49c,
> +	.aowake_sw_status = 0x4a0,
> +	.aowake_latch_sw = 0x498,
> +	.aowake_ctrl = 0x4f4,
>   };
>   
>   static const char * const tegra234_reset_sources[] = {

-- 
nvpublic

