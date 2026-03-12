Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917C375F7C;
	Thu, 12 Mar 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342056; cv=fail; b=hwPZmkXCThCcateG6dHrFGccy4+ALLlTxw6KqQa2gTfUB+W0rOt9+h/rVaz2D/ktjdld3rz7+eA0mLBPyuYfeFtpW7tTA0W7XlrQvivk56LBxDhE9xUlBFjlk6kwn/Qxdym8sz36RiEd8muZjxeHRK6mXaMxPirYngXLaTaMFQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342056; c=relaxed/simple;
	bh=2F6vQ/TMDKr90nlmlF5M98tQy5WcwqpLm5eLIHqbM7Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UL8W2/iBkcGiXVQO9IAtvhLdoxWnn3gNQhBwhBwCL0mKF4a8E/88dhCND+pEL4ux5OGtSNpBCYjSBKMlyZzh++vEkhKdSah5RUdiKBWS7AL2LtilWqG28JTmVvcOxKuXdKRsseSEuMeOCZhXuuSbSV6foRinE2XjFeM8rJgtWiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P5lwGXPn; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P5lwGXPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifawU5zUF1vuWgETXkf+S2zl19lGkf3W9VXdhVMMGoGeYqeR++SsiGuSVJw5BMYx6N4GYpPiMmDDIRBpZM5cJvxFFEHJkWuf62vygrdu42p9vEx7xsGG07jQ5Vx2JSxsfALJDwsBRgQdhNR0Y/CJ1vk33hYarmzpjwx7WHioJumnuHgA3ozZ3Ay0bPIrIqxZpQ5pdw9jXiy8FN5lPfUD1tWq4PDMKgu3bClMKeX185S281l0Pr1DFN1ew/MLQ5VYeuLLZvQvtfBJv3akpj6ANY4IO9MWfRPOPShtLG00fsE8oWwzp38me3xVYD0K/+H8LAhK5Dj+FSknxJjftz4f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+N1zwAxafAS4WSArAVeIZmEEUdGZLqyw3q4U3b8jZc=;
 b=Ff1pTzsGiwIShh7stO2+9Kpqbq8dE1ccAvGKVSRlsKPb1eM4+f34F5acpdrf5zgr/oXnFFpaDg5zuI0KfFNJCJyGNVrEuN5VT/VnuCGQs53fDJFe23jjkl6K4029jikJmlY2FzpdOB8aE4xgXglREKodZO/obr5AC5tJqGDxAakIaLGR3/vzowrClW7rgBmR08Ds6MzgN5suXa7b6mkf8tSJnIfY8YUePu4bW3n6G6XbOjGA4Nz0CMaFX8t6KtW7ng1INo5qrR05W6aDIeTNWW8ZFB5eh74c3VKxTO7WLWc9XyYhaN2Ap1cESySMrezY/PoE1AKGXXzmzjbNu5oDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+N1zwAxafAS4WSArAVeIZmEEUdGZLqyw3q4U3b8jZc=;
 b=P5lwGXPnrvYMP5VaYi5+mAttF2c6GLTfnByKgFJGAmCaSor4QV+xwtSn81JN320twn+O4K3jUQ75qAwHqES9ZeF4w74mYS9j7Ex7VeJujspaiR7sDw74EH/rhxLpn+YqsHrHdXrJQdRwCTHyTsSP1rvkWWhlb9Bys2RmEsALWe2roHP3oTCAQVl8gowJa6AFxThlQ+IfhSlVqFWX7Ous/qnTP9kdFLvNug5LWZz5zFMBJYUSGkSdE/wN/vYBGBF8PoDxfHyHUiNF5CCduDFxFAUaN82XcR4C8RwGy+TWDhQts9UTk8zcZpQN5MnrJ/upYHHRm4MLZvm/JKP+qmi+sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:00:26 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 19:00:25 +0000
Message-ID: <d7a8271e-f6a5-491c-be2a-7ebc7d37645d@nvidia.com>
Date: Thu, 12 Mar 2026 19:00:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 mark.rutland@arm.com, lpieralisi@kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 mani@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 4906ce26-3972-49cc-8a37-08de80699ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vkrKTJQY0vk8NP8t+92k+H/PHWqcafBVdvPxTlaxbuDbcjIc8jZgDz2bntKu0Lyl0XJ9b9xLzHxwpoG0JYpInlMfrHzNcKzOo1TFX3mvLD6JL2vNbzOPReeoJH73Kwfq3A0MhhJ/AZEa5h8BB9RE7ONvw0F+Pno/KaJtu0WWUlwluzj8WLKSOPbV66UfIWmefKFzgmHAuFTG4/v4TI1xb0k9EhzqA8ke1wcjkSBkmWNgWvo8JCIauNrLGjL1DM9CHgBYIK15oVPnpl5x6/bQWVAbZkcF2q6rrHbzGkmcC7ECOS1zq0iFX8KAdA2u4uSvNXi1VYKhp2+rUc3SMNbdtr3szUzrpd08F0lYbQW/AIOpC2oCHou49eX71nMJdzEA3Ry+9iTts4Aiz+gGEKvt3SuUzEmD5aU5/VnR9gMXcTzmOvd15QAlekJKLANswmTR5M9AnOmp98fv31sdk3ei6PuPOGAB86o1uMIe0siVWc9w91AgVhWeMqpG8IMUSQ6xas7cmQG10oy2q1czm4LF3MFMPfuR7fUBmxtJxhD0tclazyXcGMuNQVSSV/fAmGZZ3a5byr5adQ7Je+4WCmnStuvv815S4XV3EmQCJP8O0rfLyoTTwV0bpLnSia2O/VlH1f0R6fl96/9LdqSCJKUbB0UCW50Elli8msKHOiLr60GmiSajS/lVBwq8WyclFCZ4VrD2bIvf6TdRdISoBKZTTeQmsoLT8Cw/RVFWnlbQI8vaAllwoJtlGbVwLx8uW8vB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lVdVVTVkFPdWJDemZ4RkpOSTNSWHN2Wi9sWUlpaEtVTHlQRVJrM28zWEp6?=
 =?utf-8?B?T2xUcHdYMFVoLzJIZExGNlVXVisvTjNld0kyT1IyR04xbEp5NXRYM2FjdkNw?=
 =?utf-8?B?Z1JBc0lIVm1FNVBwMHJCejNsanBsMjVRc2dwb2QxTkpVZHhjKzJ0NkhYRDVw?=
 =?utf-8?B?MUZJc3lGS05Ud0xWTmlhNnl3bFlVemdMR3dNWVZwaGhYNVdKMmY4bVlobk51?=
 =?utf-8?B?d2k4UmIybHl4VU8vRkRuVkZWbm0zU3NDZ1Nsd1JXWGhxVnd6MEZzcmNvVldl?=
 =?utf-8?B?T2t0U0pWWE0zeG10akxVdW84Q3RQMThHb2d2NjBMcFJldTFUa0wwa2xuZ2RR?=
 =?utf-8?B?ZWxjNDRHVFNaRU43TzB3U2tLNE1TK0xsazhnQjlPNS9nTUFvTE5iSHpGYVpp?=
 =?utf-8?B?U2htcHpZdU0vWjByYUtkd0xhMDRlMzBoTUdPM2lsaFFlOHkyZ1ZiQXN0V1lp?=
 =?utf-8?B?NVlTN1EybGNvQ2I5bW1xUXBObTE3eVNoM3lNVHluVmRZdisxWUVramU3bkM1?=
 =?utf-8?B?ZzZpZUlwejg3SzF3TllGM0NKbGhRSmFHRTlRc0paWXI3aDVuUHVGLzBEWkx5?=
 =?utf-8?B?ZzVDdGxUK005emI0cTVvOVFoZmpUeDBhWi9wVzMrUFk0bEF1dis4UXdDb3Z3?=
 =?utf-8?B?c0ZSOVIwTTh3dWdnMmpxbkU1UjVEVmlDMkpJSHB0Y1dkaEI5UzlNRnNIaU1q?=
 =?utf-8?B?LzNpZEk1YUdVaEswNEsxYnh2M0tZeGt0cVpvcTF3bndOZTlIMzYwUWtMWWh4?=
 =?utf-8?B?WUc2azI2UnlYM05rejZuWHVkY3NEejZDeXd4Q25VS254Z2xSdjBZZnlyZVBV?=
 =?utf-8?B?R3ZEdkJsci9pRmZSUTFDL01zRUlYVWYxeVVLeVZ4RXJ3bm5KWUZ2dTlJLyt5?=
 =?utf-8?B?c21hYlhiR1hlTE4xbTFtZklLTFZxZjFWWHhuTHQ3M1lPRkZvSkIrMjV0Ylkv?=
 =?utf-8?B?VktWemZERGVDV3pCcjhxME92cTdDY0ZiWDhaNFhmc2h4NjdURjkxaS9UdVRG?=
 =?utf-8?B?cXdERzN6Snp5dEpDUlV6M0UyZGtGSHVndVNoZFF0Tm81ZDF1ZEFPOElVOWhy?=
 =?utf-8?B?OUNVRTFoMGJxeldWWmp5L0pOY3YzcnBtbGVUSGxCb0FRc0lKRnR1OUM3S3pS?=
 =?utf-8?B?THhkUDJHV05OdEUvTGFBdkV4eHZOdEd3Uld2dEpabzlsZmc3Yi9sNnNCMFUw?=
 =?utf-8?B?UlVZdnR1ajVSWFJnRnJqTElTbTN0ZWpGNkZsK1A0amNqbTJ2eVVndXlVNzBL?=
 =?utf-8?B?dlRFTENGUGNucktZc2o3dlpYL2IvT1hvMVJvclFvYThleFFHU3lHSHdjODNP?=
 =?utf-8?B?OTBqeDJ0TjFEemZOZHZxWDZhY29nZUZKSXRCUUxYS25BVUk2cFh6QU5RQ3ZT?=
 =?utf-8?B?OGVhdnpLNjJhSHcwWm5Ua2d5NlFhcHVEWFFMNmxlWUpwb0NiN0NsYUdSL0JL?=
 =?utf-8?B?UXFIZXoxWjcrQVdwZEJlVUR1YStpZW40RDBlMys5cGxqby9xTzVqZWYwRXgy?=
 =?utf-8?B?WHZpQ3J1REUzYkVEYWxBTkdGN2t3eFNyZmdZcitkWHdMaVpZRXZ2STVxVjJQ?=
 =?utf-8?B?RUk2Uys0QnNiYVpJTmpJeXBuS0RsaDN6ZVB1MmFic3NuQU9ncy9DNDN5dFk2?=
 =?utf-8?B?dVRWYVlzeVh1RDZFT0YrOVBuTFgrQ1dzbkR0THRBaTkzZFJ3aXdONVdoM1l0?=
 =?utf-8?B?UmQ1VXk1SmVYZWh1WnVUOXBrZlRIQWlSYk1jWE5Pb3lTc01BczIzSFV6ZUUz?=
 =?utf-8?B?YitZenVxTFIvb3lMZXR0eDh4NUg5QmFhcEpabmxNK0hnWEhTdGtORTBJM3Fs?=
 =?utf-8?B?UWh5S0FGZGJhcjRiUTVWdHBDZEprcGhuSVFqU0JWUk9WTFZJRWExR0kycnYw?=
 =?utf-8?B?OUFJNENBUUtCNVp5MFpqWURXeXRINzRQdjJpN0hCRlVvR3hha3JGT3FkRkUy?=
 =?utf-8?B?NlBhaVBHc2pkb0hSQkhlY253ajJ5N1lJYXhYZFFSRk51SFl6SnovZDdWczBK?=
 =?utf-8?B?Y2IwbThFYzRNK2F5VVpYZUNIZnR6T2xyZHNuQXZTcFZkOFI4VFk2Q2RMczFn?=
 =?utf-8?B?RFc0aFNWeDBqR3NsSFlCanRHRjgxNTNqRDJOb044VktXTytDeFBWOU1id1pV?=
 =?utf-8?B?RzQ5K2kwVk5IMVQvaWh6RlRIZ3E5SzRralVzTDE3OTZFS25EN2ljd2hGVVBV?=
 =?utf-8?B?eGZYMXNQMHpFTGVQb0JIN1I3SUhYVDRhREpsSGhZZExGeklHQjcrNVZtOUpJ?=
 =?utf-8?B?ajEvNWxnbGQ3NlNhSlRIczNuaUpYWXRzV0dwS1FUc29obTdmdGpIdDVkQnRm?=
 =?utf-8?B?Nks5aDUweUxaSDc3WEo3V0NJaVo3K1JRQTZ5ODlYbTRWWmJ0OGdZdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4906ce26-3972-49cc-8a37-08de80699ecc
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:00:25.9301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBV0q656AODtW6TIWMMDXAFvpLCwas/R88DdERG3ZN8TJHdk3FDvu7axvYmALQwbfBVIbMGYBgG/Z+WqXvlnDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111

Hi all,

On 31/12/2025 16:21, Manivannan Sadhasivam wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> firmware to implement the suspend to RAM (S2RAM) functionality by
> transitioning the system to a deeper low power state. When the system
> enters such state, the power to the peripheral devices might be removed. So
> the respective device drivers must prepare for the possible removal of the
> power by performing actions such as shutting down or resetting the device
> in their system suspend callbacks.
> 
> The Linux PM framework allows the platform drivers to convey this info to
> device drivers by calling the pm_set_suspend_via_firmware() and
> pm_set_resume_via_firmware() APIs.
> 
> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> mentioned APIs in the psci_system_suspend_begin() and
> psci_system_suspend_enter() callbacks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> [mani: reworded the description to be more elaborative]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> 
> This patch was part of an old series that didn't make it to mainline due to
> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
> 
> But this patch on its own is useful for platforms implementing the S2RAM
> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
> resending it.
> 
>   drivers/firmware/psci/psci.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22..e73bae6cb23a 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
>   
>   static int psci_system_suspend_enter(suspend_state_t state)
>   {
> +	pm_set_resume_via_firmware();
> +
>   	return cpu_suspend(0, psci_system_suspend);
>   }
>   
> +static int psci_system_suspend_begin(suspend_state_t state)
> +{
> +	pm_set_suspend_via_firmware();
> +
> +	return 0;
> +}
> +
>   static const struct platform_suspend_ops psci_suspend_ops = {
>   	.valid          = suspend_valid_only_mem,
>   	.enter          = psci_system_suspend_enter,
> +	.begin          = psci_system_suspend_begin,
>   };
>   
>   static void __init psci_init_system_reset2(void)


I wanted to ask what the status of this patch is?

It turns out that since commit f3ac2ff14834 ("PCI/ASPM: Enable all 
ClockPM and ASPM states for devicetree platforms"), this fix is also 
need for Tegra platforms that have NVMe devices to ensure that they are 
suspended as needed. There is some more background in this thread [0].

So for Tegra ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

[0] 
https://lore.kernel.org/lkml/kkly3z4durpagtenadvmzdpojlctachgfgi2fdapt6zthdl2gx@n2qhmlud2zb7/

-- 
nvpublic

