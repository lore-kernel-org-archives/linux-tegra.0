Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2763563FA;
	Mon, 23 Mar 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260611; cv=fail; b=lWRgmn4kwMqKjJsitp8e24mP/Z6yITxrswKqXgVKiGyic1Vy195il/IORCbclxMF/0g8/NYHD8Lnkskh6lTBdIjZo6jsSkK1wKijjEVxDhaO/WiczOFSx1egw9ir8e4VeT5HQtiXz0etLltEp9u6wUWExSXWGZ5XObAqMIa+YZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260611; c=relaxed/simple;
	bh=wX/TwlK0oayoPdNHTKMLytep3wjv7z+IWW8AkSY82+g=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rfo1R0cfkVS9fmb5jsfd+3qJbYUjPZ9o3rCDoAeRFNiYw7zOYwXMpJS2tB7chFjT+uFyfNywrRVKZvgdJ8UmiL7aBLCizyJy+6dBbL+GuxSOLOZHANEW6kMK/OSODAIqkh1mKux+gdKjDRI/GutszdVnt8OUk3IAGuZInTh8z1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O/YpKucA; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O/YpKucA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhH9Ne/3bMAIhGETB8A+XuhWctLGuwc5xpI5WXifcQuQ0KEBqb4xjohMvKZWHYXIq72pWdMB75jr2oPG6+xs2C3RdCkvuDo+S5h4t1FhuuCs100JNjRbJrIqrzIvqsYZERhkHrPlld66HaiiMB7y8I8RUOlcbAgwDrknZ1vb0VhSkYkP4PrK1GhJxWB1EKlExqIfrcjENKH5+8CAk1CbUYZ/qIktuKwxHzou5yQg4L1cFE/gYvllvGCBmyL4u+07gmyldFh3bt6zAYxnEk9FZgaxbpdXJkjyhPiYXMXHPk3EIHhZP1HF1Skk7AS7rdcAWbXPyqsx1Y6yu6VM7LhIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1Z2YMjYRumWz7KLQss276yLV/pnJhg7HvkzBrtLVJU=;
 b=LG8GeEe5UUSxbWu+ZtSLQt9UzTM1G+liH3snKqoD68VW+oI60GLqoUJo7Akc34s3+U+HfBAXhzIzcMm/X7sE+sUyaYqgAfRDKF09dZE4OBC/IYvUYfEn45qIL5Ty2Ded6PrAZnvx+PhXBPUAfD0NFbf6rKpcGkmm/ohrEztvbejtCsHnExDl0jZMGXO6lJHyEuTm9MV9HcEOSNTnbj+IkwZV0iY98cbk9AS4clUWG0nZ3kNwW7MdUupP6VSh+9XWkhgeyHcznbvU4so7VUmxtgKmF+K3asF+k2cDJfW8u0AFOqORvHWO54zeHONBgOZfLBphrqoQ1bC5evp1bPan6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1Z2YMjYRumWz7KLQss276yLV/pnJhg7HvkzBrtLVJU=;
 b=O/YpKucAtMbwFV3ingqTaTV1ZO7Cf5Mmv+KWoiUz0kxMgtFW4syKkwYBDVwsOExGkfWEmn5SVqImnieT/rD1MgD2CMin0j/DOVrgVbElQtqkdp7uV1TfACJHvh6XjgWvk/MOMcP1jKTZkUUZQL5o+zfM91QodLHkLRbLFEUodJan8b8OR1LOdt5GzLiHBpEDX7+iPrM7vub+OqJgOKZyNsRQrcNnoA9fjZngWv2rJ9QToE6VmtGXRNU5tmtMdPclKOm1cbcLKQD9T0OyymHXEi/iyM0SSyr0isHQZfgdshRdxl69gFdsFONDeMjreMWbNGw2gNzZCmr3rqnk+pNeKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 10:10:05 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 10:10:05 +0000
Message-ID: <b5860d64-6eed-453e-8261-2c8b0c5571c4@nvidia.com>
Date: Mon, 23 Mar 2026 10:10:00 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
From: Jon Hunter <jonathanh@nvidia.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 mark.rutland@arm.com, lpieralisi@kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 mani@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <d7a8271e-f6a5-491c-be2a-7ebc7d37645d@nvidia.com>
Content-Language: en-US
In-Reply-To: <d7a8271e-f6a5-491c-be2a-7ebc7d37645d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CWLP123CA0232.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19f::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|LV8PR12MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 55bc2f83-80f9-4a95-d906-08de88c45a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	rhJP/jjGC3VFkr8F0n9UoHaZ4EOfbLEJUN73WTC7F/VTNW0fS/d72kPVYfPfiWiAZMZ4tWchvGnBSolxlIPE9nLwrJJntmVpk1pe/Ll+3e4EojnreuYeoikfbXa5YALZew7DynW9gAg6JOxHsjKabB4CMHryelrpIreqmsqbdsAZpPWe6m9L4esZOkTGmKZ1ymkcTdr2Qp+sk8q8k8MIzE9tspYq7DSOxl54Y8F5xk7vXCJJKJ3qy95Tqnl3OpDAbReW1YwBFgcRUzIDPsNUZlKG47ht9j8LlmggOx61wGOnwGV6mlOzJ5WCprUy+5GiqzbbNhVU4guF0tOtzLVVPICtOcXiQTJfoIZNIu6pQZIsldrqKZhAADCu+4Cjji6LfL29/mRz6KtnbCA0LIYCI7SvoSi6FQQ69+97rZNodXjy0o/0srYPHYkO6aA+roy2bH2Kf2grgbV7jehwzE1XKPQUJJ0ts8DpeHREbEnmO7f0k2ROsFfSg2qx2PEGv7lTlPuqV1A0pAHBj2EDWO65pnXLyeEI01gp0mAesOU8vHYvE5zohuJKDfLkHLiUwEvcQ9bsgyySBn5pttPTMDcgYDLsXpFX3PEPZnfINju4UYaQMJjMg6w5th1tWPN4GGrzlg0i4Igt6PdHayNIBCtL2vNSjMLUHz4cAvtXs/7420ykEj0iXtQbN+4ENPkDnqFv8MhiD10rgzj8gLX3VNueJNIrGZppnZPA6b7x+BTylWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akxndTlZUXNiR1hmS2RnaGxDa0RGMnR2OEQ4eWRTMDROTU9HZVhDWUNTMGV1?=
 =?utf-8?B?SS81VkNHSVh1dkh1UXhyS2xreUdCSzM1dkRCUWliQnhRYXJtazR3bXQwbVpP?=
 =?utf-8?B?MzFManJVM1BUUmg5MDhUNUZ5TW45ejBMTDlNbllnd2xXS0tkTnhnUlVDcGtC?=
 =?utf-8?B?di9ZY0xtL3V2bkRuMmNIVG5Cb3RydVpMNkw3dTNnaEV1NTFrRkhjR2EvbDhS?=
 =?utf-8?B?OXUrYUViVXAyTGhaakVzcVJ4dDFIRXk1OTZ6b1hBNFhpTTd6M1BoNU5CNnFn?=
 =?utf-8?B?aXBzclFBMjFWWG9SVit2WFMyelJLSGwyVEdab0U5RXBLYkVvOUh3b0RSYlVi?=
 =?utf-8?B?dVVYaXdRMklIQW9ZWW1JNlNHbGIxOEFEY2E2b2s1NFVRRGU4L2c5SWlFak16?=
 =?utf-8?B?Zk05dTdLQkdZNXgwZkZEN0xVWHA0THQ3R0hhWkt4bGRrZ2JSTWsxQ1FHSWx4?=
 =?utf-8?B?c01kMUF5b2cyWVNrN21ERTZSTVh6YUdBY1dTcitKQ2FicTViMnZ3am5FUkhW?=
 =?utf-8?B?cCtOYXQ4cWlRdWhKTDNiRTMrNVhkRFBMdkJWQlB6Q2orN2I5RnNJclpIbG9s?=
 =?utf-8?B?Y05xdE1RSU9jK1N1MXdlU2lESlhMc1gvdkZmb3JpcjZUd0ErOXhOV0d2OXJ0?=
 =?utf-8?B?bUwvSlJDK2dzQW9TalZOcU05cnN4Qml3c3k4eng3NHhTZzQvZjZBazdQb3hk?=
 =?utf-8?B?ZkF5OWdGQ05mRTdQYTdxN1lXUlJlY2VCbXZ0YisrUzNQV0JDbTdxR1BTQml2?=
 =?utf-8?B?NmdPaGlDRm5HNkFnODlXa1lKbXVCSGx4SGZiZHd0NDd6N1BjSnpiT285MWgv?=
 =?utf-8?B?WmtodlZTYTNjMmYxYXIwSStBaUZGTnl6Zy9MUVdNUHFKTWRtMmdIcWw4WlNn?=
 =?utf-8?B?ZjlLczdiVzFDSzhFckJIemxaTlRQSTdUQkEzTHR0dE9yUlR0UFJCeW1QcHBL?=
 =?utf-8?B?Nm5OWjU1MlNkUUMrbDFoSlZJeG9DZVA0ZFhjVGVHQ0VtbkhIRFlSQ0N1dkVz?=
 =?utf-8?B?SjhpUzh6NUE0a3R2V3BUdkV6RGVsdVN2SzFhSUFFaUFTS1RUODdqZ1ZUV2ln?=
 =?utf-8?B?Z09scmZiY3E2citsSjRiZDN3N3c1VURVRzZ5UFRpTXNqU21yMGlNQ2JwdGw4?=
 =?utf-8?B?ZS9CUnNGdC9LZE0rV1p4K0ZJbFRDR2ZFRVlQZkp2ckhRWUlscldpczdNMlkx?=
 =?utf-8?B?VGVzWWJ6SEV0Z21QUGJqenR0cmFBbjRBVERQVHlvT3V3dWVRL0ZCbE9KVHd0?=
 =?utf-8?B?d3UvV3BqUHowYXZFdXZtT25VQU9WRENvcVVJcWhmZG51c1BWR3R4KytZVU5q?=
 =?utf-8?B?RmQ1Yy9Sa1B0RW1aNUhGbzhqSEtwTnlMNlVlRkpsOUpCakwzTklvYVYxSENv?=
 =?utf-8?B?SWg0MDFOaElObHJ6T3BOOFJONGt2a1RtQ0NxT0NTODZVNlBKeC9CSGJ0bTA4?=
 =?utf-8?B?WFVJeHFpQmRDM2VHcDRKMmFBa0FUV3V1cHI1OWZrbW1NdklibmIvMkJQVE1i?=
 =?utf-8?B?TVZuRnhWVE1BNCtJOGdXaFI0c2o4SzgyWE9CQ1VXVW0yS1BxSVVjSFdZRElL?=
 =?utf-8?B?RERtZ2RPcHQvYU5EdlJkbVBvc2psNTZDQ0NZalJPZVVWRFJNR2hma2VGNHZu?=
 =?utf-8?B?TWxHSnJiVzQrNnpmdCtUcWhEZ09wN01idFZ2QnR2a3hoNSs3TEVaU05jYXFB?=
 =?utf-8?B?S2FiYUsvUmYvejVQT09sWUhHZng1ZTNLOU1INkRnbm53UU5OeHI5bkEvYnBq?=
 =?utf-8?B?VWxndWRSYjhieUJSTEQzV0JzaUlGSHNOYVh3Q29aZnZxSHdwUHZ0Y0N3RVlU?=
 =?utf-8?B?WVdFcHZVNVVpYXJXQm5FNFVEUktySUpIdmRucTR5L0IyU3EyS25TMXBmZXIr?=
 =?utf-8?B?STlmWkgrOXphdUh6OU8rbXA0YlYwM01sRzJqekE1T2Q5L0xrR3kvL1pCbGt4?=
 =?utf-8?B?b0ZaZ0gyN1hDeVExTnlLaWFpWkNLaHBtaStia3dJTTQ2UDBGQ3M4QVlxZkR6?=
 =?utf-8?B?UVBTaHQwWGJFckZ0QjNpVXo3amR0bzl1MUlmcVdNSkpSWDBQRFd3dGJmeHVq?=
 =?utf-8?B?N3JDOFQ2NUZ3RjBCU2dJUVdYU1lPbm1hWFptTXdpT3duNkkvVzVGNlZ6UUFQ?=
 =?utf-8?B?aTlEUkxKdFFlc3ZXaVVMcHJEUE5nYjdEWkxtRklsUjBmUGJiRTNINE9JdVRp?=
 =?utf-8?B?akNtc2U3YUU2TXZqN3I4NVlNWERUdlc3MDBOemVoc0VBd1pnQk5zU00wcUl6?=
 =?utf-8?B?WGpjMEVlSHBmS0VuM0EwYWx3L1JXQ0VQL3hGdllQdUxYZ2pXbG15czUrelIw?=
 =?utf-8?B?djR2N3NENmlBdDNNK3d1aWRGQ3YzQkJsVXh2LzJ4Z2R0MGl3UXRrNnB6c2Mv?=
 =?utf-8?Q?MMmzh5qlPSi/0wTBDNLnhGqRtsjvuQus6ZoBohiK1uwoV?=
X-MS-Exchange-AntiSpam-MessageData-1: W+aK2pEzLiGJMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bc2f83-80f9-4a95-d906-08de88c45a9d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:10:05.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKGmHvhCstZbJu6s7DwdAE0vIHot8skv2wUVNPOvTAceY5EwxXbjRXGos/7ptcD3yjuiFiWwgA8wX3oQ1BBdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620

Hi Mark, Lorenzo,

On 12/03/2026 19:00, Jon Hunter wrote:
> Hi all,
> 
> On 31/12/2025 16:21, Manivannan Sadhasivam wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
>> firmware to implement the suspend to RAM (S2RAM) functionality by
>> transitioning the system to a deeper low power state. When the system
>> enters such state, the power to the peripheral devices might be 
>> removed. So
>> the respective device drivers must prepare for the possible removal of 
>> the
>> power by performing actions such as shutting down or resetting the device
>> in their system suspend callbacks.
>>
>> The Linux PM framework allows the platform drivers to convey this info to
>> device drivers by calling the pm_set_suspend_via_firmware() and
>> pm_set_resume_via_firmware() APIs.
>>
>> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the 
>> above
>> mentioned APIs in the psci_system_suspend_begin() and
>> psci_system_suspend_enter() callbacks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> [mani: reworded the description to be more elaborative]
>> Signed-off-by: Manivannan Sadhasivam 
>> <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
>>
>> This patch was part of an old series that didn't make it to mainline 
>> due to
>> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
>> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram- 
>> v1-0-9fdd9a04b75c@oss.qualcomm.com/
>>
>> But this patch on its own is useful for platforms implementing the S2RAM
>> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
>> resending it.
>>
>>   drivers/firmware/psci/psci.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22..e73bae6cb23a 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long 
>> unused)
>>   static int psci_system_suspend_enter(suspend_state_t state)
>>   {
>> +    pm_set_resume_via_firmware();
>> +
>>       return cpu_suspend(0, psci_system_suspend);
>>   }
>> +static int psci_system_suspend_begin(suspend_state_t state)
>> +{
>> +    pm_set_suspend_via_firmware();
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct platform_suspend_ops psci_suspend_ops = {
>>       .valid          = suspend_valid_only_mem,
>>       .enter          = psci_system_suspend_enter,
>> +    .begin          = psci_system_suspend_begin,
>>   };
>>   static void __init psci_init_system_reset2(void)
> 
> 
> I wanted to ask what the status of this patch is?
> 
> It turns out that since commit f3ac2ff14834 ("PCI/ASPM: Enable all 
> ClockPM and ASPM states for devicetree platforms"), this fix is also 
> need for Tegra platforms that have NVMe devices to ensure that they are 
> suspended as needed. There is some more background in this thread [0].


Any feedback on this? I am not sure if this patch is purposely being 
ignored, but if so, I would like to understand why.

Thanks
Jon

-- 
nvpublic

