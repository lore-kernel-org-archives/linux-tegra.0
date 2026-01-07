Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA165199931;
	Wed,  7 Jan 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790666; cv=fail; b=HB2sEm8QhO5jPHvd00jC2VeoCE+E7czIqSfPG0HANY6FxL6KSYnVxGI9cCFV+3utFXNa1Hg+Z9ER1+AIDmSweNdcNbdo6ckFb9xMN6yZxczHILhcJEoJYoFnEwkO5rnsuFuNGz66AWJJCraQRbAG853zGF6HdwTdb4KwAjOOxes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790666; c=relaxed/simple;
	bh=R1FV5IyPyLwuRnT/vfuFchFbRJF/fUDk0PYiiiQauWs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ig2+ouGpZUOITPwIANR6w7vPSIP4UPivIqg8BrXVyGvmupBMRhI3e107QK6E/a+SLpwlDViVE/Peu9G1nc6WwPZWsjiDmT0JPgeUisgVJitWpA0NmA2q9Hx43pGP7GUzyx/cywPL5wgdnOooDWwSOikTqXLbSWeyN+8wk1vhGOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mP9R6DIp; arc=fail smtp.client-ip=40.107.208.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mP9R6DIp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYFiat7EdqGvHcPEVFfGVXDvampd6BZngYeqfOV/jUciQ44JX4GjVSPrMnjr780xjRNQyDkF89Ru+ewCCV0uH/KgpFXBwQuUQ2+Mh4Er6TTdI5fUFOoF1LjYV4sDRlQGQ7Bzwu1O3lIS1L6GWvx9RKw+2yz2svAQKN1tfHCfVJlO91HTHz6faKAPL7Dcrb8TMj/aJt73OkP/aaWiUTdTxx/GSvcYiGImTWFJ34WXSsIjuIss37SPL6cZ2cq2cTCQp/WY1ucdzS9yyddBsyQI8A7tH8Q+jo7EFPzA6aXPTTo5nF6tSpXGQ66hb+hEpcFZAP/uKJkDYph8Jarn24oU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNELXbRI1SA4bNVgfD9eSuX18TjIhULaDYaJjil8QpY=;
 b=gZ6TvNS6Y0rWk9TlTxl6PCNyOAeLNHVWqhvown/5VR9VRSGfQGhHPwxBK9JLuHCgWkVvf6lIXml09N/vgRsG0GTe0AeHb31BhFj9hZDc1HMCpkJV826kSiwZIPYiJNMwaRmEjKeNphI6OMaMq4I1R4m4yYPC7E6RVPp0bfE+Gi+ALr9RSb3HRmfl0gb+AtOM0HN+6JUkB/pVC66XMrNQniqgj31iW41N7Jgaj/ocppfUkkcboVWHhvmuVZbKZreAfJSFFgY2NSZibCwFCLcfA45gbWaM5odyne7od7qpumAbki0hpVA0sCcWp5tKTH4LldErRDMd6xKbk759414B+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNELXbRI1SA4bNVgfD9eSuX18TjIhULaDYaJjil8QpY=;
 b=mP9R6DIpZDx9ncxeyfaZXCENqRPTvEp16icdBGsxm0W7zUqOlNnPoGrg/Q767MMOaRehSS4bn7VBy9n0fQDUKLS/YlL1Oa6oWjIq2Ut5qWrsGTcIRQVf1i7J98qgD2oVF4u3hpHpFWwN6Dzh/xZV+bt2IX25Fb+1eiO5nMxYMEhj60oPuAfCECFvdm7MzCUj0TR8qc7f6McTdXqsiyPajK5WosI1kBtNQnu8GOw/S9U/9cHnCNfVRC7QC2hOWUQoEbJiAxe91D4wojTYc21SSUPSglJ2xltF4eg0HiQ5/asKBXy4NzEHDib4rWv+X7EBHB9TaHRb7DCqa8rxKyYXsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 12:57:40 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:57:40 +0000
Message-ID: <f1857497-6b4d-4387-a593-dfa5750c59e8@nvidia.com>
Date: Wed, 7 Jan 2026 12:57:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] memory: tegra: Add MC error logging support for
 Tegra264
From: Jon Hunter <jonathanh@nvidia.com>
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-5-ketanp@nvidia.com>
 <d6333e4d-4525-4b3e-ad7c-95750435b0db@nvidia.com>
Content-Language: en-US
In-Reply-To: <d6333e4d-4525-4b3e-ad7c-95750435b0db@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4613be-fa12-4d00-33d1-08de4dec571a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWEvUUtWdStSYnlsS1MrQ2VlRHZqQW8za3ZGTjZWbkxiVnNTZzk2TE9lRHFo?=
 =?utf-8?B?elEyTDRTczNVdHFWMHE4RUsrV2N0SzdJOXVSY3pGMG1JUElvMHFoYkU0YlUw?=
 =?utf-8?B?VkJPT2VNbUdwNnN3VVY4eXdFVkVUdWFHTkU5L0UvYlIxcm5ibHRoMmpRWFRD?=
 =?utf-8?B?eXhQZUYvemFGNXY3cjVpc3FreDRoblNDdlFDOWFHeCtpZWIrMlFab2pNck9K?=
 =?utf-8?B?VXR4L0xHSEJEeWhyV0l1ZkhqblI1R1IyWW1ZZ045MUxFYXBFOVdQT3NMcWpS?=
 =?utf-8?B?OU1HM0RnS3NYT2dlKzFJbEpTYjdMbDUxL05pZFlHc0ZjSUxSYlM1cmtRY3lJ?=
 =?utf-8?B?OUxwcGowak9hRjVEL0U0eXNvcjZ0M2lUVkF3ZGZPdjNBZ2ZLTWNnTElMaDdJ?=
 =?utf-8?B?SWV3TUJvTE1MdWh2UERKc2hDTWIvWWlPYTI2N1l6cTIrZGEweGI3d0NkYXlZ?=
 =?utf-8?B?a0c5bUJsM2Y3NWFpV1JNeDJCRGFWdE5KMExRSzc4K1IrYkZUZTNDR1VNTmxn?=
 =?utf-8?B?WTRlc1Z5ZHFpcFdGNDBTVm9PSnk4SzlTZXVONjlhQUljQ1BpdzVHODQyb1Ev?=
 =?utf-8?B?UHE4UTdFL0NYV0tWQTVYOWsxNVFDT1c5RlpCeEU2WXJFK2VXYUVaY01pWjdW?=
 =?utf-8?B?d1hOalAxQnRORzd2b1o1ZTFnN0ZXTzlaTmJoQm1FNGpXcnR2RTA5WXlnbkd4?=
 =?utf-8?B?dWpjRTFjZm5NcmRRTFc2SU5kbjFteVZDUEJ5MTJKRER2MURqRUhReXJmU3l3?=
 =?utf-8?B?N0hmMjBmQU4vaGhGTjhQaExwdlpEM3hiYVdVbmsvbStCQ25pVzdQZWZwTS9h?=
 =?utf-8?B?WWV4aEQvWSttSWVpcnZBeG53elo4b3NiamJrdHZpTTZkMTA5ZVBjZERVTk1l?=
 =?utf-8?B?UGNwMWNJanArbEE1M2MyYSs0M0FUZ3NhSmNZMjJPa1gzSVZ1MHpMbG5YVjJK?=
 =?utf-8?B?aTBtQ3JRNlNweStLQ0ZMOVh3bU10VWFvWFdoSmRhNSs0MVlhUmV4Sk1Rc21K?=
 =?utf-8?B?aFdPTnZnVUJ5STFjSW9GQjYyS0FEcXVueE1aUGhjNjhMWHpldUNHVzdNRXR2?=
 =?utf-8?B?Tm0zUmRZcytMQ2JSWml3RU90MDZQTTJJczBCbFZGYUw2RFpXYjM5djBPUEVy?=
 =?utf-8?B?UHZnbGpiY29TV3V3Zm1rcTBxNjk3WTZJenpWN29wRlBITGxaVExqcTNxekQy?=
 =?utf-8?B?a3V2bjJ6YTFUTXN6clhMRUozY0treTlvYWZBRDI3Zm83VXNYNVFYTXprNkEz?=
 =?utf-8?B?dCtZdUw0NDdSam84Q0N4ZXhIcUZQRlZIYmZnYzFUQXZjOXJoQzFVNnB4NThY?=
 =?utf-8?B?c3VWbWxtYUMxVnArYlpIanZvaHRyckFJRXpMa2tTc0hrMFd1aktYME0wNXo5?=
 =?utf-8?B?d2hxc2UyazZlNm1DRjhaRjIrR2lLYW1jTWllbC9GWkRFanYzWlN5WjNLa3lE?=
 =?utf-8?B?clZrUHN0RWpGczAvZ1VVbU1Zbkg2YTBmREU1NnQrSFE0a25RNEJscEhqWE1C?=
 =?utf-8?B?UmFwQmYvRWU1TG9oNGhUcVc3QzdQZ1NydFRFRlBONVkvTW9PRWZUU1NVdVRl?=
 =?utf-8?B?ZmNRR0VFdktXVWMydEtsQkF4ZzNaaWJSSmF3dERRcjFwODRmMGFKWmVMRW1J?=
 =?utf-8?B?Q2VjejRMS1VKcmhuemRac1NsNUZNM2tHRy84eWFGU1hVUDR1R3h3NHF2c2w4?=
 =?utf-8?B?TkZnL2VvV3hlWWwxTXQxT0FDOTRiVlhLYTJRKzR3QUhSRW03MFhxRFl2U0ht?=
 =?utf-8?B?RmR2SC9DMjA2UE5rdUVBS2VDN2ZzTkpubExIUHNtb2g5T1crcUVHUU1vLzlB?=
 =?utf-8?B?d3BxeTByYXV5Y1ZrbUZzbW1ZWkJjL0ZwViszMnlDM2p1TFVuUE1jTi91UWQ1?=
 =?utf-8?B?WVhHOE5xWm1uTnRPU2k3aVZ2LzR4MzcwR1pHYWZJb2Q5YVF5MFFad3FDend1?=
 =?utf-8?Q?dtCmS4HPddypY2/MeoEcen+ZZSpJqDYU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZRRXFDdHJqS3RjTnNvKzhEM3BDT21HYlZkZUE5bFNueFp3OTRINkhCcVFF?=
 =?utf-8?B?dnpneERDQ3FIWURDcEhLUEQrQTE1WDNpOFhHUG1sY05jNTdFSDA5QjhXRnps?=
 =?utf-8?B?RVpQMlIxeWVsSGVETUduWktQZGNaamtaUHhTSmd6UDdlYnF6YnVTMEhSZTdy?=
 =?utf-8?B?Qi9Rb0Nack5kSjhhTWFUVWM3d1VxdlVUZ3g0RW1nVG9lS0RUaklVWFdFRGVs?=
 =?utf-8?B?U2dUbXVxMW5JTmsxSEdCU1duWHFTbHlZeGNHSElvVWZjWThueUM1RWFkZnU3?=
 =?utf-8?B?ejRTYUd6U2xQUHdXazJtWXJYZzRhNjkzUDFiVW0xZlBuMnFtYjJGNkYzMnlI?=
 =?utf-8?B?MlBDMWNCSW9uM2FDK3RMYk9NTk1xYWFST0NqclJTVHRsUWcxa05mR2dOZldk?=
 =?utf-8?B?TVpNaFljR1BQaUZCeWNaYkdHSTYxYkFteCsxb0NpYkwrSzRRMFIyQXQ2N1lw?=
 =?utf-8?B?WHBJQVl2d2doK2EzSG5ra1lhYjgwVkp1dmRUQ2ZwVFpveGkvUUpuclBZQ0lr?=
 =?utf-8?B?TXB5Z2VMaTZJLytpSG8vUVVUbVVrN0NIMXdSckhLNzNKbTM2WHlITmdRU242?=
 =?utf-8?B?cjZWWWd5MlNaT3FOUzRzVXlSNkQ1eXUwV245WWJHQ1Q4OFA2eXk3K3hpRDly?=
 =?utf-8?B?RUZNSzZ6MURzeGZkUXlUelRRYXBIOXBCWHpGWkRqUFN0dk9YOXA2alM3NGZ1?=
 =?utf-8?B?dFlXSmZxbHh6UVJnMC8wVGMvdXY2Mjcvci80MExIdkpzT2VUZldDci9YYVpo?=
 =?utf-8?B?V212TWdvanlMWnZoYjRVaUhsZktvYVNOY0tMUDR2am9neDRhTEpLalJxYnhu?=
 =?utf-8?B?UDVwQWpwVDl1ZEEwN1hRSmU5S3kwaFpKanRtdTF0LzBneXg0bHJZTk9PKzF2?=
 =?utf-8?B?QjhJRWgwM1lCbGd1MUhKRVZTcXU2Kyt3enFpSWJ0YzVGY0Z4eExuejVDSDYx?=
 =?utf-8?B?TjlsL0dSRGFqY3FuUWEyandScGxBTXhGd0x2c1AzbGdXM1hpTFloeEJLMUhN?=
 =?utf-8?B?N011S3E3U2IrMjU3YzZSSmRKaWxhMXBiSG4yUWswZUpUajQ4Y0RjVHFYWWhv?=
 =?utf-8?B?VG5ES1dOYkdqNzRwdHJKdm5lZjZEVFVXRjZZakZQNVQ1aVBGRmthVFBJbjRZ?=
 =?utf-8?B?MzBObTlsUndIVGVkSXV1Q0RIQndoTUlDcy9BNWhkVEZjQk5mUUtBdGtpS3Rv?=
 =?utf-8?B?L3Qxbno2VkZqdDVGcDRCcS9TdUk1V1VmMS9UZFJQR1RlRHBuZnJFR0xZbCtX?=
 =?utf-8?B?c1pJVDFzRUZraEpsUDNsbDhxTUJWbVQ3L1NxZEU3UmVpM21YcG1pSDR2cTUx?=
 =?utf-8?B?RUJKc09iWTVpTGVIdjZIcTlwTGhDNEpTb3VMdmdSN25ZRDlXMWcvbFpSa25h?=
 =?utf-8?B?dmcxQzd0dnlhUHgzdSt4MGtFYTFTWGVJS3VtQkRHcVVueFR4OEpFZS9ReW5M?=
 =?utf-8?B?SjFsNlNlMlgrdEFTSmhQOWphL3k0d0N3eEJGci84OVpXbnNMeTRNZWJyV1pq?=
 =?utf-8?B?MU5YVm9LR3hxYlFYSFpzVzk2aEpYL3RTM0trMTVydkdnNXVnc29Sekdvd2dj?=
 =?utf-8?B?REFtOCt1eEZWVEJFMmszZ3NPKzQxS05keERGWUhMRGFHTEh5eTRkcVFjOGd0?=
 =?utf-8?B?T044NWd1VkFDV1JqcTJkVnBtLzI2WFNIdlhVdFFNcFN5L08wbzRFbWtMZE9w?=
 =?utf-8?B?TWdCUjA1RDVMOSt4Z0pleGV3emttRTl0R2h5UUJVSGpWdDhsVXJVOVZ0cnRo?=
 =?utf-8?B?OGxFcEdLdGZkV21CNTkxeVc0N05nd2dYUzE0NHVVME1ZdDJhQTBISGJoYWNT?=
 =?utf-8?B?ZEdXdy82UzV4ZjAzS0xLbHdxZXQ2MnhlNG4yWGdPdnZqS2pVYklVMjQyWTM3?=
 =?utf-8?B?U3NkSEcrQTZESk9oRnJZMHQrblB4Y2w2L3l4VGQ3amsxaXVnbENXM0dIajFj?=
 =?utf-8?B?RFdWMUlzYS85aDJWWUFWZVdqalVkbitWRkZEdU0zVlFFd0VFYnVGTTdqR2VE?=
 =?utf-8?B?MEtyWkhMS1UzWVlYQWpXUDFiVHJqZXRRTEpxS2JnL1RtTFZhSHhnL3ZGRXFZ?=
 =?utf-8?B?S1lsVHFNYnlDeFRRWGFqRUl0czc0U1BsU2o1by9PMW5kenVQUVVvbXNUemt6?=
 =?utf-8?B?SEs4bTh6VUJYbjI3Q1M4SWFaTUdvVzBRL3Z1b29jQkdCZFpOcVZISlBsRzg3?=
 =?utf-8?B?NWtjUGdWaTJiWko5bmxaa3AwUVZiYmNaOGV3K1AwRjVBc0NpZG9CeCtFckIz?=
 =?utf-8?B?MUc0V0dHWHJscmpkdGVjSEdhdVc0dGF6eUs2enNiUXN3dDdNSDhxa0kxVE5G?=
 =?utf-8?B?czVVSjhXOXFoM0I4blpwcFJ2M05yYlhmUk9qckZqRlRpT1pDeTVRYjlWUDkz?=
 =?utf-8?Q?YTFs0MY0NGGC93YXSvaFbKonL9L5Gs4W57FgE8wA2505m?=
X-MS-Exchange-AntiSpam-MessageData-1: dzaLL/+AsguGjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4613be-fa12-4d00-33d1-08de4dec571a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:57:40.2988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEXqJN4C/uC1VO4Csws9HdLv6HiWxEoS6BEu6xyx1PD/Nwl65tELmgbf7uxN0FwnnR3dRK3rcgX9vwD3K+d5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323


On 07/01/2026 12:47, Jon Hunter wrote:

...

>> @@ -283,6 +329,359 @@ static int tegra264_mc_icc_get_init_bw(struct 
>> icc_node *node, u32 *avg, u32 *pea
>>       return 0;
>>   }
>> +static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned 
>> long mcf_ch_intstatus)
>> +{
>> +    unsigned int bit;
>> +
>> +    for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
>> +        const char *error = tegra264_mc_status_names[bit] ?: "unknown";
>> +        u32 intmask = BIT(bit);
>> +        u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
>> +        u32 addr_val, value, client_id, i, addr_hi_shift = 0, 
>> addr_hi_mask = 0, status1;
>> +        const char *direction, *secure;
>> +        const char *client = "unknown", *desc = "NA";
>> +        phys_addr_t addr = 0;
>> +        bool is_gsc = false, err_type_valid = false, 
>> err_rt_type_valid = false;
>> +        u8 type;
>> +        u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = 
>> MC_ERR_STATUS_SECURITY;
> 
> There are a lot of variables here. Do we really need all these? Surely 
> we can get rid of mc_rw_bit and mc_sec_bit and use the definitions 
> directly? And ...

I see that mc_rw_bit and mc_sec_bit may be updated and so we need these. 
However, we should try to reduce the number of variables to only what is 
really needed.

Jon

-- 
nvpublic

