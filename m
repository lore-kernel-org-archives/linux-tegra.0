Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808635F8C5;
	Mon, 30 Mar 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774901714; cv=fail; b=Vd1esQppUdosX5ZJU0AmoQLpDlWZ5RFf8/BZj4BYjPOXQLbYFoh1JjcnLrSIF59YGhnmC5nfHDqeVu5jRuwLtURtTu7rSW9fPJOgyFa2LvyJr0I1cEPSOsl42eXiHlj+BbB60gnyshVBPx9TFpUkKvOS/l0dhqE26fOlJkb74x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774901714; c=relaxed/simple;
	bh=4rl7AY0sQWqO9xuAoX9Hqk5vSYhMzKvoq1rCgUXwZPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F3KjcEnzCE+MpTYHxxR90tCg79zmvOlUVG9yXyowzEFAz2Cd4WFBW6mY8N16q099heHZhHeyUN+HmIdVEgTgCV72NQvb8UdxUHBAWMsWcsgeilbhXftQwL/elxxcBdWeQHJGxKexpBUu1zsp3/6E1dOojniByI0154xW8XUpI64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NUBQAMNg; arc=fail smtp.client-ip=40.107.200.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NUBQAMNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4h94FjSUyQmK6JIWdxi6ZUw48qEjkTw19mg6A2kzcn08n4PhvpCOZ5DMZ+uU7b7LGzo71cgPeO43URTNUKnvnFaYtAuybLmK8oPX4YLqtbIHRpBAmHBT/qXQlY3VRVcp561hb7TjkanSikEPXCarmnqvL4Zig1mb9sC37mgI4ZWpaqUraanmMefJ2XNACZzdh35DqQ09GRUm+5Hz1BJKyZhOonpsMAvpy+yFL6Ti4GWTzKPVr4k8+w8dYqN11t8fC4nENFF3IXYvCsrRO1gGB41dC1g4ugba5BT9hLrhwHuShNjf6riJNiSvNIBEKr986+1jm+jf9fNYlcBrxJ7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0JWdpZGDxDrMHD63btXKNfAF0TzAHjsMi4BNuV4UGk=;
 b=M7B+3ttmDXatBGIp5rYZiAud775jR/YwF29zOMijCkvjFecHUqYliq6VzMWLliPZRu3y4Lg1sK+7g5GYaj/ao7Gg5iCRG0RnqimuypI1JjyvEZxOWYJMjNstbB1ral1uGQKLuHcXKITM7S6nxRYgKGsEzZ3zyW9mryI0laqTQ8v22hdUkK0/A8fCI9WdBL2unhivJvIj+Fcrs8aJB7QeR0dK+n3xEsvzhqt0qIHJt7czpowWuFUZ0d7/Q4aJUyeLgnicBysQeTcEynquC2QFRg3GUCrCtp9cxk2nvxlBwhUoirgwEzH3I5cqZWzosEPXUHsMLBnuiRPLd8ghYbWDfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0JWdpZGDxDrMHD63btXKNfAF0TzAHjsMi4BNuV4UGk=;
 b=NUBQAMNgfS1gwgU397uw29ccByTqhRId0BH8MmgMnPiYdkpoRLCfzEuOZBJClx5lkgt82PlEfOY2vMAk37f9ridoqVjARUzAxVlne0/nPfTx7O4pqd/6nMV0qK87L1HwC1FCM2/rlJ147ec1Pat88CrdtaKhOW0J30p6I6bWPaKS9mpsQP8XHCMoST1l/8M0MEtIm1Gajxns8XQAKDYTKqwovJORhroTdIC8QeZjAdBwfXmYY2X/Sqi+puxzdMSf+A/9/YmS7rA61nUSJMtjJnyZesROVMzycuFWpCRy3sYJqw55YMoId63lxa13bzoM3qZeDPzxESD/jjGbz/bMRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 20:15:08 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 20:15:07 +0000
Message-ID: <f1718313-39c0-4756-851a-a6f145d745d7@nvidia.com>
Date: Mon, 30 Mar 2026 21:15:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 mark.rutland@arm.com, bjorn.andersson@oss.qualcomm.com,
 konrad.dybcio@oss.qualcomm.com, mani@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <d7a8271e-f6a5-491c-be2a-7ebc7d37645d@nvidia.com>
 <b5860d64-6eed-453e-8261-2c8b0c5571c4@nvidia.com>
 <acJPHGIW1fb7whsu@lpieralisi>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <acJPHGIW1fb7whsu@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da161ba-a24b-419e-d38c-08de8e9909a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5O+ilzund90w+/kwRE/U2eUv46bAzN4OyZTDxRdttvuKRihPEh2aCTMa7KxYGb4oD5/GpHm72ziNJfiUq+4/NYq6U0VQmC3BT06DJ8sqkftCirhTViLQv2mdoSLnU5hzk2QgNJZSIiFu+qCVLR1EOqA3mUc4ltfFDetm93iHRjVD0XbPGY+L6G38u1BAU+PNgYiHmOHbue2zRBi6SGM//f3EOZ36tnx9O7bJabPZ/3cIa1/8YnjY2ESJ49tAmS4jUduv16a/S66ZshTTfUE4vLZJuOsQslwK3lo3voifynMrsIGjZ3fcRjlty9mr3BU+7OC3QGV7neR+3jUA57cyD5fHKR0HBmQEGPH9NVmRC8C+8yVEOJNpbB/68gYEvqN59u5/M2KnAbI4WFS7HC9B9nMrts7vPlxfLfXP7R9H30xgydWEudrFs5gl99V0lP8fyFvkhhTugHIgovLlDBnkS9LXipLC6dWCf1SxePz9p0mLIWe6pjH1d6V3QjhRALb3oqylHIIh+JokQdBdOKUwQZKdApDyWmwvsPnPfgnoCtHOj1QPdXlsOu0OYxqmIJhnGv8k40tjAT0RMv0us9ROx7sO7q4LdQKz+HxClroNuRDPUbj+6j9YfacQlE/juLBruvrBPFPB3FGRwwbuo+NJ9NJPEt9528KPjyP8Zot7MOW2KmkqYt0T1HnsUjyjF5UudV71BreZsvbwkJZqekn3nltJSw5n8UkOQcUGEPkMuLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGUxMzV3aE1ueDI1SHdIWGdsNkhOeitXMThoMG9JcjFoNHQzWHh0K0hwRUxB?=
 =?utf-8?B?MXc4TkNyRVVjalNIWlJFc0MzQndEOGNKWmh4bmg1OER4cmNQSjdGV21DOERh?=
 =?utf-8?B?a1FkVUQ3ZXc0WENBMjBWOU5aNk9QdGRwUElBRVZHbEM5blVuZS82NDdtYytI?=
 =?utf-8?B?WGpvMC9oc3FTU1BjZUFvQUVOZy9aenkyUmxyTkFySFVTcTExSFd0NklqaUhX?=
 =?utf-8?B?MHlNNEJyYmhOb2dNc1dCNlo0L0hTbE1EN3Y4NGtyL0hLYktoRThxSVp4YjZt?=
 =?utf-8?B?cEpQekptZ2Z5TFMvQXJHbGd1Qnpad0hUNFJtYUVMMmQrVmR5V1BzRG44alh0?=
 =?utf-8?B?aDZWSFAvVHlEVnNIdXlieWxMNFBQTGh5TkJKSG9WR1c0azFkbmhtMG5YMm5S?=
 =?utf-8?B?NzFtNUZoNjBpVDVmYTR5bjA2aVNxb0VmdFZwSlZTSjFUOFNJU1BkY25sd1ZM?=
 =?utf-8?B?VUZ2bXUrUXc1M1NtRVFsQ2JONmp2cDlWd2JSSFNydERJN3RGREdtRDBmOHg0?=
 =?utf-8?B?aDJTamk0b3R4YzNIa3ZjeGJNa0hpSVZyY2ZCbm1LY0NReGRwRUNSSGUxM2Va?=
 =?utf-8?B?Wmt0ZHZZVHNGdWI4SUVqSnNBWWh5bW5kdkpSVkRvcG1pNlVNcHRCR0FzNmk0?=
 =?utf-8?B?Yi9waG9yT0JpNnphSk4wdFBIeUxFSzY3T2U1T2J2cUhib1FURHBJYmVsN0sy?=
 =?utf-8?B?Y00yVktSaTNNY3p1QXduYWZFbGVLdjJ4bGNCREQ1UXlSSW91Z3duWUYzNHhi?=
 =?utf-8?B?ZVNGdUluVXo2K3NTOWJpZVRPSVVGRUlUZEIvaXBTc0dmWVpaUHorMGkrWSs4?=
 =?utf-8?B?cUt5VTQvOXVobG9DUkRGOWxDZ0tpaDR1TXdSdWZGNTRZSlhMQnJLT3ZadGtj?=
 =?utf-8?B?QmZhd005SkxaUW9BV2Y3OVpHcVNhN0NNVUl0TCt3RlpuenBJN1BkdXhoai9l?=
 =?utf-8?B?SU54Umt6bGN1N0VZVndDZk15b0MvZWd1OGgxQ1hWWHpUMGdqVEpzOXJFK292?=
 =?utf-8?B?UjBnNnIrMTVPdlpDT2JYSGFYSEdvTDJnN1lIanByT05ES3d4N1JXT1hRUjdu?=
 =?utf-8?B?d0RiU1Y3VUM2VUkrQ0hLKzNiMGNRczR5WVVGWkJsbGN0ZmJpQjlXeDRGaXd2?=
 =?utf-8?B?NXowbmpLZ1R5OForUUgzcll3WEJrVGxqNDUrS1RTelJLU2FiNVM1djRTOFNo?=
 =?utf-8?B?WnllUjNjSG1mVUg3WHUrc21vVzQvY0FWVm9uSEhZRHA2Qlo2NS9tVjhSL3lF?=
 =?utf-8?B?VzJWV1BHT3BMRWpYY3NGWkdGVzN6OWZRY2Z2byswR205SWNxcWtJNDdGS0du?=
 =?utf-8?B?T0Jxdlk4aSs4ZkE1TEovSytOanczdWtlVVFrVk5uL091ZDZWRk9JZnNMcEV2?=
 =?utf-8?B?ZU9rUkhSNjZiVXJZVmVBcWFZWTB4VzI0eUNYRVRzVGhSYitVOXZOTUUyQ0Fq?=
 =?utf-8?B?eXU3RVBZZmZWTzBwWFkxMUthMnZOc0s0c3BVWW1wV3Y5UDV5dWZhVW5OaWhn?=
 =?utf-8?B?RnFzdFdPTW1XdGRCVGlsS2R2REpabHZNenVzczRUblMwSldtUUJUR09aUXJ4?=
 =?utf-8?B?KzRwT1R6d3JPbjFEaTcxTGZTM3BoYmFnaVdtMVpJZzRWbXo2MHArYmd1WUxW?=
 =?utf-8?B?SXFJSkQzRmxRZGRSNXcyOWlVdTRnKzVyd1Y5alozMXFScVVUdlNCYUYydVZK?=
 =?utf-8?B?RHlGdEdwLytSMjBKUHgrclc2b1U5QjdLTG55U0k2ajRGT3hPNHBlalU3aHVs?=
 =?utf-8?B?OElYWFYzYjRua0w3VkR2bFNpRFh2dlcwelo1bUw0TlNxbHZBTmxOUDhVQTZR?=
 =?utf-8?B?YUFJU1NjYXhrM21jemVDbkEvS2lIUndaYWJNeDBRdUhXZ0sxWTkrT1UzbUlR?=
 =?utf-8?B?eDJyQ1NaL29LOVJ0R1l1Zy85L3Q0ODNUY1pVTkhNbXlmTmx0RGViSU5nZjdG?=
 =?utf-8?B?cFpDeFl0RmFSeWJHL0NIekhBRVY4U1hFN3ZIYytRb3FoUHZETEV0TFQrSWM1?=
 =?utf-8?B?Qk1JbFVMQ2w2d0NkZ2lSaVFUYlAreDI5aHVXN1VqMFZ1WGt4aG9qbXQ3Zlcv?=
 =?utf-8?B?WmVjTUdqKzhjOVkrTE1PR1FjTVJTSU1vSGFYdWNrS1BFNjh4Z055WXpJYTlW?=
 =?utf-8?B?dzJKSDZTL0dtQUVjc3lLbGUxbVZpUytXYmU2ZlE5RGN0bUFybURmdVRsZzQx?=
 =?utf-8?B?by9lNGxKTFZ2d1RscGVvaFYya2xrZndwME1iTnp3WVc3RGo3dEROM0N4cnc2?=
 =?utf-8?B?aEJiUGdCeDFjZWxGdUVmbGcvc2Yvc0taekVGaVpDZHNFZENjQ0ZYVndBZXFK?=
 =?utf-8?B?bXA3bmhBV1lWL28wV3ZzajVobjZzWkN2MFlBWDM0VzZtV21leGFZcGh5ODcy?=
 =?utf-8?Q?MUonYjvNT2SMLPJ4dlqjDeqEMGdISK9WAqm4dGPvnBEgy?=
X-MS-Exchange-AntiSpam-MessageData-1: 4/ULqeDUpvgRXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da161ba-a24b-419e-d38c-08de8e9909a6
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 20:15:07.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5TMjR/M1616WjHiCENjd/zhPB1sKJa9CpjjlLCDBmxmXrGRq3uoHUXmXTcm1h4uPlJkP2YGKfoV794UASQs8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0

Hi Lorenzo,

On 24/03/2026 08:45, Lorenzo Pieralisi wrote:

...

>>> I wanted to ask what the status of this patch is?
>>>
>>> It turns out that since commit f3ac2ff14834 ("PCI/ASPM: Enable all
>>> ClockPM and ASPM states for devicetree platforms"), this fix is also
>>> need for Tegra platforms that have NVMe devices to ensure that they are
>>> suspended as needed. There is some more background in this thread [0].
>>
>>
>> Any feedback on this? I am not sure if this patch is purposely being
>> ignored, but if so, I would like to understand why.
> 
> It fell through the cracks, apologies.

No worries. Do you plan to pick this up?

Thanks
Jon

-- 
nvpublic

