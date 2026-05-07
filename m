Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F733BADB3;
	Thu,  7 May 2026 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151273; cv=fail; b=f1VuN6OkbF/n6OiWMumcYtg8Yocb2+SbgpDExwolm+ALqynIconIuA7LztUNCtUvFpXbyn0aEd9zWiJl3jho5cjXOD8xJ5yahMeNlL4ajJCdKbzlzbg38L42L224r54KIt3qqLxC669hDdrpiP6W25JEryUK3UwMoryC3ydJueU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151273; c=relaxed/simple;
	bh=QBWtM35vOIJL62kg6qdcoghlSGsy1N+sJR6XI3uQ+X0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VHeHVJ8Qsgj/sQUCzqI8LH6cNt2fvZTQxn+DsM8RtP8DFu0y9Lzu3NdwLdGBC7GqPDsRyjcooVjxYJf3wj3Xy98hJdsb45IT6PRTYcaX7v6dX9Xxev76glMqYnxjH0g5r7TwJHKVkX9GLBtRDPkV3ogSyzeBDxrUIqTDwGXq8/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gdiu1tPS; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gdiu1tPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTWjfRX8uwjGzZYD/NP+Y1LYDbk1KjQOkKSsQ7/arsrnQxA+6EWNHisgUi9PFA+bXWBMBHJ/vfquaBN4E6CxNwyNoJN5ssMQQS7bAIqG+aG7tmHN0xmBgj6iFfMTP1dmCvHXZvVkwF5LHeXrFNVmKfeOteins+4J5/F0RT+XArtDDjnTP6qNIBsdPP6Gcy7o+PNLaufyoZG1bfakcd8q8qS6BHIsGyXNw+cdVbAr/zJjgW0DFcpQMvBNT9mYcXrsQW0lfVKe/tmPmVKi5fDonCFb58jtaYomUUXtD/5oMAxc9Ek0E16QWWpQviawkH2jPf5sZk10yTuuyWgu8esm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7YCVXkqMqcAI5NaZaHUD0IQSGDcgmMCEFtuT16OM/E=;
 b=byziijNeDcCqxjW4lIBdipYd6UM244s9cyulxPkk28dNYn+5ZTdOqSRk1UUeIi3Sw9tH53Qo9vRPbKA/xxR/OysP+rr+gHW71cv5UWyEiYZbx+dWBWfGvjA2eV+vAMwO7cB56gTNh4cruO0BCGy/tFygaW/AkKry0sHaF6W6s+HEsd8rbWPclksqlxChAmrJh5P+Y8lHNxa5I8bD0lXK+XrNbkFKVcPIjPVxPs8G2Jb//DD+pu8h6dFYdSBZBNFBjoBbEwLbARQi3PddQdrHf8ocF2ALY0VoXLbB9I5622R1iHMe+xYMeNFpTLnwouuxbRz/bRdkMYySffATsdE23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7YCVXkqMqcAI5NaZaHUD0IQSGDcgmMCEFtuT16OM/E=;
 b=Gdiu1tPSWhlpXtvWZBSlzfLdGhh/zCHr2h5djFQrTh9jxUfDDCFzM1rvvN6wQciwPlg1Kg0sBNYUxnHBtbYBuy+sVp0LdKKaa6lPfmhdAwq3+fMlQ3b/mVk/XnCIn5hkXsjgnKDkDktxdweK92ZJVuaYtcUOIF3+p0MlROVTFInBzI6tczSGoILSreKGDSg3StfWN0+r9ee4thnqLDVIsuKi/nCI6Lsp5VJxe+4THBtra9Jgtpee+kZkvcsZmg0pYxwdpiMsET42chYC1mLAC5C1G87/jE3JQJ6uvjsaFKKYx170B2p5SkCCi/i4QKnaWTBLHLx2tikpyDDcaeTYrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:54:13 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:54:13 +0000
Message-ID: <49a68039-3a59-4b4c-acbd-0fa917d0e456@nvidia.com>
Date: Thu, 7 May 2026 11:54:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 mark.rutland@arm.com, lpieralisi@kernel.org,
 bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
 <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
 <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::15) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 1718dc01-b756-45ec-78a6-08deac26f9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TUXTmZgmXWnpZZm6OSeOr0fHpYzA4FkEkzmPkXqIwsLRFKrtQrFbr82diLjIKwm2G0qt8VSFUDhbPVeWaBYjC5OCjxBGvucCLaLl/SApUXZv0lxaAWU49fwJe02aLjzf/n/pwT7g2iil74e/QtM2VSmyVPRKlwu6fTm/B0yBTfutcGWbhOleC/8lGlLkS7GtNB+H0yg8G4RHmlZCjb4+Pm/CzzCcjRb2mnsw99N5ErNyCAbOeYzGorNmLJ693epan0kJnkPDZs+j8I2R7PjMr9kkqtYD4nDtM2WzylpKjbbEhQ9Slvo1fELO+HNJPK0qKtZCjdjmvZob14hex01M38gUZZtQw2UrMMP2Gc3DM3Cc8WqmqqHyMRym2GtvNyMEolJ8LxK+huVlUSLmxNvda4gGs6b0HbW2fSxzjoSiCsVFBCC864Kxh3vzYYRZgI9Hogfgo3CwDpTB1nk/brxHmglD3Ac34XfWP1zNi16meaRQjyvwnnptQXE7Nf+aWsjOnoJklu+oPEUKY6KNfqIlCRrONy9n5iSyRaHU/Ey/bu9P+MTCbw8JLLc5FUBsdrElX67kZN30YrtXR/qAQikx0Z5i8OIXH8LCbCBjjz/hSCoh6P+zg/kKyR/xyup1Gz9tePKTLq+/G/6T73wCILseeU9c9r0Qy6CBSRFdyMJCGIJ4ShuwgfTJYa4mKuMwn9KMaN9I6rvsV1FKLrbZIkNkEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTRoM1BrT2VUZVJkbmFlSy8velVGVHRJR0tib3lFV2pqOUcraTVIMm16RWor?=
 =?utf-8?B?OVIraXNTT1ZScndGeHo5eTRIc3IyeFp3c00xUytXSFY2U2w2dGg2MnVKSURw?=
 =?utf-8?B?TkRVTWc0K015M2VobXV4M3VNbHdwQ3lpNGtqMG44YTkxRmdvTXZDSnIxNHd4?=
 =?utf-8?B?NllEY3Z3THpIZ29XeVpFTFFob1BkZ2xXM1FMMEV2WDRoVDVlUU92RUhqVmJF?=
 =?utf-8?B?ODNEQ3MwN20xK01RSVU4WUFmMEJIN1JoZ0pzN3FOWlBMeTZBRUkwK2lwclBi?=
 =?utf-8?B?a0F1Q3ZpOEd5MlF5VFVHdkpJZVMxbzlaL3dXMzRQRGM2dTlwS0lkUEdsSDlq?=
 =?utf-8?B?SGk5YW5KRWZhbUg4TlBiNUtDUlcxUXhGTlRFSUo0WmF3U2RUS01pQ3ZIL3Q1?=
 =?utf-8?B?Um5DUk9veUhmUU1wS1BYUHJ5M0tvekdwK2ZkSHBsbVY0TUhoQkloaXJkZk9H?=
 =?utf-8?B?aitNRjgxT3kreko3cHFzT2E5ckVsVlZCbjZWZXIyYS9HZ1FIaGJ1WkROY0hp?=
 =?utf-8?B?S3NXYXdiYk1rRTA0VmpZK0MwTkRQcUVTcmJPamd3K1RBWkRta2pOdHY2enlx?=
 =?utf-8?B?WlRrTUtLS3RiQUJqb0QvUDBFLzlqQTRqZDhia0JFY21CZWNrbTB3OG1yYXdz?=
 =?utf-8?B?cHBvMXRuZStUZzRvdFcvQmNxNlFTN0grbTZKU1JIUWUxbWtjRVJrSlN6elp5?=
 =?utf-8?B?Y2FDaWpFZWt1bDZCcThIV05CSytEa0ZBVDlscjhQTXZqYjZVSVl1cGlFcEFX?=
 =?utf-8?B?eEZtdHJmT2lyRnpZTllOTzcyUU9ETXYxMmFtbjFrWVNCSklTcDY5MVpUMjhF?=
 =?utf-8?B?YUhxdVdoais4MUNHRmVhWDlsQitmRno4eDVoVVpmYVRoVzhqNHpXOXE0NWRY?=
 =?utf-8?B?aTlZWXljK3pwYjFnQlJ3NWhHdTRIL0VZakJaaWgvQSsyVTZYdTAvWmdpZWVn?=
 =?utf-8?B?cVRpLzFvQ2lLL04xNWh5ZFVpSWlUbjc3VEo2akRqZklwTGg2Vk5rRTA1L1ZY?=
 =?utf-8?B?N2x6b3R2STQ5UEVUZlJrV3B4NlhVWUwxSy9pN2I1eXNWdXgrQXlXTTJ3MWl0?=
 =?utf-8?B?MmZ2Z0pVQy9rTVBFemhLaTA4NlQyOHMvaE9aRk9sNTRTS0owVWdLc3N6TVJD?=
 =?utf-8?B?Z0ozeHlwRnF1dnhhR0lRMGRJdW1WL3BrNEJNeVlPbW5TSUt1NjROUXpWM1Jx?=
 =?utf-8?B?bkhFS1pCdHpBSFVGTEkzYlRiMHcrb3BGaWVKRkFoa0hTVC9raStsYmVqci9E?=
 =?utf-8?B?TTdEU0pLa2pwSkZNeVY2R2d1RU9OK2liaVIyK1lNL2RncUZvN1psVURma2xt?=
 =?utf-8?B?TXhRaXVCSkNaSjFId0hBc1JnV256bW1Kb2N2TzR6eWcxb3VXS2NjMVdkc3JL?=
 =?utf-8?B?ei9YdmQ0M0Z6RmIzQ3lWWDllSncrWXRSZzhSZWVReTM0MTZrMjMvdnd6aVI2?=
 =?utf-8?B?cXhhbE5VNmxBRGg4dGorQmZ4Y3BuWldDajBEakpuOGtFeUQxSnMzYXZFQXZr?=
 =?utf-8?B?ODlNelFXUVU4YXdsck4vTmcyWCsrZWJCejhxekFyWjB0d005VjM3VXB2emh2?=
 =?utf-8?B?WWI5TE5tREN0cmVCZlRjRi9zQmlXdFVyZUNIWkxaL29kaVJEaFlVMHUvaTBU?=
 =?utf-8?B?S1V1amhYNHhranVla1VCMVNzbUk1M21sWUY5T2FhOEZNMlBZMXVLS2l2OE5X?=
 =?utf-8?B?VU1UT3Vwc3hzd0UvZVlzQUVEQjh1OXNmbEJiWktwcE43QW43OHFGeUVseXBl?=
 =?utf-8?B?YmlobTNhd3BibDBTaDVTR3ZNK0E4bE5FVVozZTdKL1dFL0hQVjRVdUFNRTBJ?=
 =?utf-8?B?YzZBbWR3eHdxRktxOHJySWFITGk1blZYSWw3UHJvR0lRb2RWVmk1U0lnbisw?=
 =?utf-8?B?SFdqRlp5dU5CanlxQmtZTXdoa0tZaGhQdVZ3M0YxdE5tcGRlTkNRQTRJRTdz?=
 =?utf-8?B?V0l1WEJXV0Y1NGlCL0F5bFVUeGtiUmNnRGEwL1UySitsb2Y2dWtGUmFnT1pm?=
 =?utf-8?B?emN3TlhZbndYWldjRDNKdTFzUWdJb1V1TW1LSVkwZnRSUjBmUHdPNGpsOEtF?=
 =?utf-8?B?WTN0cnBKZE0vMDhleWRSaXp5N3VPUWs0NndyS2kwSit2ZkdwSjl3cmdJQWh4?=
 =?utf-8?B?RDczNndCbUkySFh4ME14Q05kVUZkcmFSOGVDU0dKeUZWRzZWeEhMYnhCcGU0?=
 =?utf-8?B?VTlTeG80dnNJK01FbklpZnZ1My9HZzN1VXhxdk1GSURmMDVuR252VUdoR00v?=
 =?utf-8?B?Y3pyNHJ3L3BwMlBoWVN3ZTFuRlY2cDRUUDZtSVdxc2l5dzc2REl2SlV0blpn?=
 =?utf-8?B?enBRVVRPMGNlTGpEMGFBdlFqTEFsU3IybUJvWUEvSHBkOTg2UzNtQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1718dc01-b756-45ec-78a6-08deac26f9be
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:54:13.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofb4KfB4iWmsLiI0Ik50z2UNDMIO4cOIkweUSW4Rqz9+Q9d8HFOndAmohceuMv+Sm4/PqVMqIWcjyMvcaJov1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473


On 06/05/2026 18:18, Manivannan Sadhasivam wrote:
> On Tue, May 05, 2026 at 02:47:08PM +0100, Jon Hunter wrote:
>> Hi Mani,
>>
>> On 06/04/2026 15:29, Manivannan Sadhasivam wrote:
>>
>> ...
>>
>>> Sure. It makes logical sense to relate this API behavior with the state of CX.
>>> I'll send v2 with the updated commit message.
>>
>> Did you ever send a V2? I am not sure if I missed it and so wanted to check.
>>
> 
> No, I didn't. I had some offline discussions with Bjorn and concluded that it
> might not be appropriate to set pm_set_resume/suspend_via_firmware() for all
> firmware flavors that our Qcom SoCs support.
> 
> Then I found out a limitation with our Root Complex IPs in exiting L1ss if the
> platform is suspended. So sent out a series to fix that and that allowed me to
> get past the NVMe issue coincidentally.
> 
> But since this patch applies to other ARM64 SoCs, it logically makes sense to
> apply it IMO. So, I'll leave it to PSCI maintainers to decide.


I am not sure I follow the above. Sounds like you don't want to apply 
this because it may not work for all Qualcomm SoCs, but regardless of 
that you will leave to the PSCI maintainers to decide?

Anyway, I have resumed the discussion on the original thread [0] because 
this has been broken now for the last two kernel releases.

Jon

[0] 
https://lore.kernel.org/linux-tegra/8d8b2244-2bf0-48cf-8fb8-9e47e197a62d@nvidia.com/T/#t

-- 
nvpublic

