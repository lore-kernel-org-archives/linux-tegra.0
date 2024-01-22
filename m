Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6917C68
	for <linux-tegra@vger.kernel.org>; Mon, 22 Jan 2024 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705910406; cv=fail; b=GMjoO9+7h1qOvx4n2hAhBsXLOE/vl1S8aa6/CW+ISWuclbxBU+sAElKOIEV4s+bIskV5lwPsQ4M7SsPjgdxOyWraPRScNCZ+J+R/oGcUb8joeMV5Y5vA0mvw0aus0kxOrkRRDeJ95bs2NFjtZOjYi9j7OH5oEPRvdJvjqa15Wjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705910406; c=relaxed/simple;
	bh=qJUwKiQWjCvraKEQCSWwHejNXmRo6k9tfgJF0oTIdDs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PG5hJmGTGdhqj7XRZb98eF2RzYILLWiLA1OILYQ030p21glOQ3d7aBItNJ9YGv307MBVY29vHIYywGMEVDHgyPTw8XU1Tyl/NfdwUUdlG0++/bxtrJok8NCSTeAVX8h6m5hvEzDUJS29cjkG0js+UBlHlUqTGcsV9L5ZSXMFIwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zi8710DF; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zi8710DF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0y2U1iO88f3Hwxft5sYEgfIvH3wnFTqe5IGqcanhjDGsUcLRi16QnxZ7AmFU6IZT2z68WSrkLoCnlnzdE+FqACcK9tRfO4u7kFMRXdryEgWI/dG+bi1I+LvVnqhZnD4E9vdZ0hXn37Au/Uw1xX2nBHQ2Hzk8pAG28xHwJEqtBRjJ6cwlusdrhNX4K9hMofZe0P2kI7ejSif4xikjt7FX7t86w+rEST20KeJIKR6g3YwDVRDElgW29ksFxJbKqnoYRdQNPV6eb0RMvm7NGsVhQpVXMg8CcN3J6xk0o7HmShveb3Y0DXlGimjBobytiozhvEqlVNUcWSNewCr10Dnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2xWKsAOr3ir270Kd2JLpcdvQF28+SgpTWEto3V7XaA=;
 b=JCLSnhNODNMOw59RbOSIWj2wwIt1rHYPenUlW9r+QAV4natI5nxoIIpJbxvzsqFuEI/KFlMtCF8k777oWeeGqt+BL4XZwoq2emaM3JKoB9f7gpdFpsrO1YSEf+zTAoHfccBOwaQ8ZlhBn3DDa0jbGenVxnN64St50K97LiHu459ZhOpqr8jbnPrfYZ0PeY6U6l3EKMJWyceSpq8iB9FgLWVBe79JxBJRdS+fdOvXaqm2XybG1ni73QWHWKf/eDXdGm1uBrVdHRcNNhC9vh1CbwtVo2agXCkpS8tBFF02z3U7qLhMNoOFi2SI4jplGuaVdNodYBqRK4/ZKJUVbUBVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2xWKsAOr3ir270Kd2JLpcdvQF28+SgpTWEto3V7XaA=;
 b=Zi8710DFvod/cgxTFBm/qvGJKF/HvTn8RtxbQeI6nKzFCSwtzlNr1R9qXryfSKFiEB4T4KK0RNyDB/8nEHhVd7zvwXscwipflAt3PlqwJlUaIf/ONXtqziKUFMLYhoEgEYocdNqgZb5zxoPK/aqmYwoA0Ukm3d0ni9OIsPvGhewKgocadPm/YmDLc1Krf8tCinHUfg+Xx0b1R2+BMKSG+szpY4urMztMJTtLluTdrAMgxd8ccvknfGwU/Mfvgx9dQXK7hxsn/nWw/K7ScIWdJ0aQhEl44TzgI1Gbshz71WiwSOjCtM4gUK+cu2dUz0OScO4D+225f+EY3gbryf3CEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 08:00:01 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 08:00:00 +0000
Message-ID: <d96bbbeb-ad75-48a4-88ed-3f68cd56aa7e@nvidia.com>
Date: Mon, 22 Jan 2024 13:29:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bus: tegra-aconnect: Update dependency to
 ARCH_TEGRA
To: Thierry Reding <thierry.reding@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>, linux-tegra@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
References: <20240112093310.329642-1-pbrobinson@gmail.com>
 <CYISLWR02ZWF.18RE3DFIINWF5@gmail.com>
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <CYISLWR02ZWF.18RE3DFIINWF5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: b991cf83-43ed-498e-ecdd-08dc1b202201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BmAIwpcVp+zsiiIFC7KCaPKiyKklrOe/WAcu4AHSg/D8m+TgzL9/LVTFPLjiZNYc5EDeO9P4Q5ArrpNGyWOpqeuK4fV+jDfCsG8bPvdAwhvd5FRXBhV10sLwUtd4K8P229o/1amjaUYrZWxBQzG8Nkc/5FjBkjsNcNvm5f+85ivpwxkSyIpWaFrT+DlSlz4naIjjotEjHJuHBtCXROHUO9r/1GRKk6LqLuDF6nC2v+rlk2XEonmT5DdB7sJlFqVMUQJIUjolucgKodk/dRRBKxr6LZ1FF0zBksgLGgpANo0UeAetrTVRGBu72bZE+68G6RiSDDhb7daQGFTrRpT09J23Wyf/0N3z52Ci+/sSU8MFMSXX+nPfm4QA7VwU1hSYotTO0Sz+VwEJGNzp/eljvDNidNJBx5xY9H6mq84uS4GeHWs9LHYvdMBEtpaScLmHWhb1i376md83Cn6RS7aNqMSkgIKU9W2WPdXwbiHOb0hUUsOpfaen70s/2+Qg+Dykjxv8BkEk5ZPzt+GptogORrAvBKvoEfGLnmEaxeL3Q5nB4hrgCTrYur8I8+dGlHhi91f/v0BgA//+FbJz1OyqxGaTDQoPH7HIDW7OuKyMrr2k5AHbBVFZvUcISkAJjTp0gmPMK1u3P8CRPXDqrNs/kn+G7goL/6CyghdTUbHosA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(8936002)(8676002)(4326008)(31696002)(54906003)(19627235002)(316002)(86362001)(478600001)(66476007)(66556008)(6486002)(110136005)(66946007)(107886003)(2616005)(36756003)(26005)(6506007)(6666004)(5660300002)(2906002)(6512007)(15650500001)(53546011)(41300700001)(31686004)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V01KNE9yMU1Lbzl1R09CN0lUQU5qcm56MGJCMTU4aDZ0QTExaDQrNnpMejhQ?=
 =?utf-8?B?aThQTDRxeGdLSXRYMGlvYVRJa2Zld2lBUTRtY1B3Qy9QcVM1T2NBMGZPOVJ2?=
 =?utf-8?B?ZUU1K1VYL2V1K3FiMndFYWVreER6QVVuUDgydHVyLzU2K0l0azVTVHgrbkVk?=
 =?utf-8?B?YU9vTlFiVXRZc01CN2RjanRxenhuVk9xalBmdmVTRnJaZjFpQ09OLzBRQUxk?=
 =?utf-8?B?UFBBUGNKekJONWRBNlJ3b3FLN1Q0c1pFRjQ3anVyNTNDV3QvRWZ1ZnpLQW5Q?=
 =?utf-8?B?VXdJc1BLekFGSk9HeGxkSnRwMm1yb3g2cXo2QTNxT3RSZ1lPemROcHRoclpF?=
 =?utf-8?B?RkoxL21DZFFIUW1yV0ZUQlpFS3M0QjNGN3M3S3NYMWc4UjRyTTBJbDFiT09Z?=
 =?utf-8?B?YTFsUUcwL2g0TmcwYW15eWhVbGRSR1M3UTZtSTNaRkpkZWtTNVYyL2x0Z3k1?=
 =?utf-8?B?emZTVW8rT3VCcFN5Z1lTYk9BS3lOY1NXN0h6TVFVcTRWMmRCekVlWW85K1Fs?=
 =?utf-8?B?c0VIeXQrekd6UXNZOTQ1d20yaVkyazF0Rm5odnU2dk5JaFBDT1pveDZjeEMw?=
 =?utf-8?B?ZHo2N1FkUE5KdjB1QnNobXBaaGNVQldvMEFjYm1MbUo3OXJqOHQxOUJYRFVE?=
 =?utf-8?B?VkdNR01zTmJMbW1rWDAyMmdkSFdhcUMrc2pQczNXZGtURFNLZHJpNzNpcnpT?=
 =?utf-8?B?eGV5b2ZnL1VrV3kyWEFUTHBWK3YzTExraVpuWFNyeXd6aWRwTElUWjdEZDZh?=
 =?utf-8?B?NDhnZFdiWmxGVHNCNzZxR0N5VC9kTURGQ0dxYVBjd0dnYkt5R3ZFMXNkbkg2?=
 =?utf-8?B?NjEyK29UZ0t4MHN0SDhoMlZPY1Brb3duazF3cm9pYzZyZE90czFFN1dmV0Fs?=
 =?utf-8?B?bWJMMTRTRGthU0VMMkxzb1lzR0xBUnB2aXdaWDJQaHJhSytteGZCZ3VCTE5C?=
 =?utf-8?B?RlptL05jckxaTlh5WmdwRFRRdDdBbUVHdTJveVAzbnpEVmxVL3BWSVZiaDVI?=
 =?utf-8?B?dm1GZzQrcFBZUHd1SXNjWHJOaEQwY1p1REpmSHArVW4wREFQcVk3OWRtekxu?=
 =?utf-8?B?d3JsRUhPN2l5UHQvL3kzYjJxNk9VR3hIc0pPMGdudWFBRzBQMWs1S0s5R2Ju?=
 =?utf-8?B?Ulo4NGMwZTdHa1o2UXpMeGtHcEV2Sm1WSkJvTmZMK3lSNDBvRTM5TTVJVmF2?=
 =?utf-8?B?WkNNSFZ6K0dGNHI1M0ZQSWdNZExsLzB4NDNHVlp0OVNERGFSdmo5TmlyQjFZ?=
 =?utf-8?B?U2U3S1VYdGh2L0xSL2JkeGg0eDl6ZzVPV2FnMXRXR0RZM29iamZuY3d3YkpY?=
 =?utf-8?B?dTdtdlpZdkx2UDRsNFhJNlV1Uyt6Q0lxUys5L0FleEVORFc5RHYzSHhSeG5E?=
 =?utf-8?B?d0tVT0RneTdHQ2c2aU15aUFMVWhtd0VxNDlUUG4rZ3hhQWFZYkJhY2VPN0lJ?=
 =?utf-8?B?MzBLSmVEazR4RmlXSnpLODI2TXhPU0hGWEFyZDRtNXhmc0tmWEQvazZ0QjVH?=
 =?utf-8?B?RzJjalM5R1lLVzk2Y1hZQ3ZhOTk4YWpsS2xoTG5DSEQ2OWpqSVVlenBLQXJW?=
 =?utf-8?B?QUJqUTdyMCtYdkNPRzJpeXB3YzNyMG5YVEpTUE5JVzNja29heXBPUTVjaXBq?=
 =?utf-8?B?cExTZ1R2K01tL2srU012Z0txTGJQNXc3ekl2aGo1STg0bHluRlNHc3NZNXdw?=
 =?utf-8?B?L3Bva1p2S1BZcU1KaDhxemE3MlZJdVpvdEg0bGo5RUJkdUFqZ2UzSDM4dzZz?=
 =?utf-8?B?eFk1aDcycjE4RU00dENSYWVUUWZUb2hubUIzK1d2RExwUXNRc2FuWWd5alM5?=
 =?utf-8?B?Tm5zbkVNZGxPNlVyVmM4dnI0TEtPaXAxeDVhdUFpTHp2azV5RWtrOFU4Q3d3?=
 =?utf-8?B?aHVkWlg5Vk1yRC90MGZrZXQ1NmhKR3M3bncyOUo4R24yZ1EvRTI3elY2eUdu?=
 =?utf-8?B?ejJ4b21YWjBSZFNtSU42UUw0QXB1Y0RhSE9MNGpjbjZLa2tna3k0RGFTUHRy?=
 =?utf-8?B?aUI0VXZNSlU1UVBIS1BYajluamxrV3lTWlc1RzZSN0hLZjBZVXl5d2ZjM3h4?=
 =?utf-8?B?TGpvQndOaTJ0N29SQTVvQVZzQ0RmQmJvZ0tJZ1Rua3FMeXFCVUVnTW5BK0Jq?=
 =?utf-8?Q?z9v/qxcWeZUpuU0AHv7X+U4Yo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b991cf83-43ed-498e-ecdd-08dc1b202201
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 08:00:00.6630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXv8nMMgyu4VVDagOuYk10t49hvdfrR3R3o2LrztFe70e6wRx7oD17BOlMlhRlEMQooj06Z0gopBAOZY8JkTfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169



On 19-01-2024 21:07, Thierry Reding wrote:
> On Fri Jan 12, 2024 at 10:32 AM CET, Peter Robinson wrote:
>> Update the architecture dependency to be the generic Tegra
>> because the driver works on the four latest Tegra generations
>> not just T210, if you build a kernel with a specific
> I prefer spelling these out as Tegra210 for better greppability.
>
>> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
>> this driver.
>>
>> Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> Cc: Jon Hunter <jonathanh@nvidia.com>
>> Cc: Thierry Reding <treding@nvidia.com>
>> ---
>>
>> v2: fix spelling of option
>>
>>   drivers/bus/Kconfig | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index e6742998f372c..b003dad62d596 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -186,11 +186,12 @@ config SUNXI_RSB
>>   
>>   config TEGRA_ACONNECT
>>   	tristate "Tegra ACONNECT Bus Driver"
>> -	depends on ARCH_TEGRA_210_SOC
>> +	depends on ARCH_TEGRA
>>   	depends on OF && PM
>>   	help
>>   	  Driver for the Tegra ACONNECT bus which is used to interface with
>> -	  the devices inside the Audio Processing Engine (APE) for Tegra210.
>> +	  the devices inside the Audio Processing Engine (APE) for
>> +	  Tegra210/Tegra186/Tegra194/Tegra234.
> Perhaps we want to say something like "Tegra210 and later"? I know it's
> going to be in at least one more, but I would think it's likely that it
> will stay around even longer.
>
> Sameer, have you seen any indication that ACONNECT will go away in some
> future chip?

Yes, no signs of this going away. "Tegra210 and later" looks good.
