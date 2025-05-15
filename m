Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2D191;
	Thu, 15 May 2025 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286656; cv=fail; b=FsRJv6sng+LvaCjG0dFAl3akRo8mGI8Aox+JTXMlgGom5bozrxZjkMWdERWVnH3pqBGYtDlrIVNTP9xakMKVjFUawM9GEidd1Cgpifu7Eu9V1PnR+QEow6pV6fkG+1yHSaDJ24wAnJCVGReUQV+y72Xr9ezibG5hqSk3HMEjpEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286656; c=relaxed/simple;
	bh=e5t1zIwoi2UmZ7AeznVhcG/yRsbF1CYxU1Vw/szOImg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LJJFYUzGUM0ReldmSMAgrRUeLwSu3H93v65PdptdYwLq0k3mUx8lOVpLizElYqABeSRa15HmdHiGVwpsHtDiPJqeavmzEkBs4MyAwou+S5upyNix/AFjnU7uEDSmCmo/0CfAP302zWfZwPqf0S38BT6VOpUSz/w0cj6cSRWfMv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SZCpFei2; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZCpFei2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUWa0+JwfIar3aharbYYC1IXlq/PIGRHXW25WWwEDD+yKtqK69kyZPQ7iYqzL1xRa1Zq0SuYqDzCGXAZg9TYlV7ctOzCROP/26/6HLMPTfUlewDQ3uTHRGInCTfsTgI/ySz2ApiWDfXCtBTkz9ULJJxWzVLEghy/jTq6/7V1dhWFTpcBuy6kpUxa+u0cfzGU41LOZx6mXFau75UQw+jkKerGDia5fnShLgllNxMKudngFGLbRWgizLeOx+2ASu88qOMVs78qXlquhpEz/a7I8ifRTDPkkJnAfF9GezMTXfKCtZuK7/a7aBszHNPqaBy7gmlFokxuvDKPNv5AZmMJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4BbtgAfHUgWUFl45cM5upADjc9AQtFxKCCG9ow4Sfk=;
 b=wHMsohfqg5cysj/8Ll5DlRT/ujAQHT9iB/q4Q7rVe3uf6RnEfaadnrBcvg7n62qJOgOkJcTSqOPoq4Qf2mPf3PG1g40rpZyaOMscO6AHLOaZAX7dMNKRMxcSJl3ihedM/oeFgGHvpZFbGeoeZbETKuyfWSesXYqh1aqqzLMRK1PeAMUURqiCmrlWuboP7F2CL4m0FyKWjQu7CQNQGJolH9nulhWK6PcV8xYMzsrpZpS5afrnxsPaoo94bKKd7hTh3dwrx65h0AMAaYYPLPNZLg80zgqZhU7jBUr05RVs0CcNOjE8fs/SBT06gwR2JetNmXSwAK2OR1mbrOGiJFbB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4BbtgAfHUgWUFl45cM5upADjc9AQtFxKCCG9ow4Sfk=;
 b=SZCpFei2L64jIZfWoiEGHXKykOr6dTvje+YNMzvlQwL9z6d9gjRwS4eTMxjCIxFsYFvarIwCM0eS7Kaidkk2SOxAR3Tz5hoz3C6Gnl2IVI4DX5nrcSv/+cM3iktOlbW6ICISxzEx2Mi6OTtEqxOyHDD7Rm9GZE5UlPC0ssEC0k7OcdxQ2/CKubUFMRnrYYWArIxW9Ya3P9iLko7nq4lFoI0Y6uFiiMI5qi8lALrzahtGs1GE+JViEEGjlvloYVl2ooxTYHmHlyp/pfTfVAcKw9B53E5+dXfUKwKic9hFF7qumm/Tdqdqo7/B3/xYUJZFRcId4gWx/bL5OC5i/Jv2Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 05:24:09 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 05:24:09 +0000
Message-ID: <9fa2aa1b-98f3-443a-8016-7037d9e60bfc@nvidia.com>
Date: Thu, 15 May 2025 10:54:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: Update Tegra194 and Tegra234 HDA
 bindings
To: Rob Herring <robh@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, perex@perex.cz, tiwai@suse.com
References: <20250512064258.1028331-1-sheetal@nvidia.com>
 <20250512064258.1028331-2-sheetal@nvidia.com>
 <20250514214951.GA3093539-robh@kernel.org>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <20250514214951.GA3093539-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b66f4a9-ee80-4b20-581a-08dd9370b82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW5QR0h0VVJaVVBKeE5TMFI1QThiUDhWZTJqc3owNzRGWXM2ZE5xQ2ZOZGln?=
 =?utf-8?B?SU9rNk9MSmpEaXdEM0FWM0FiejZsRHJvNnhPYXhETVpaMDM2MEJIYmdjMHVO?=
 =?utf-8?B?cnhjMmpUY0w4elY0d1NkZWkvT0pCNy9vMUVRZ3pud25TUDZ2NGIxWm80RUlo?=
 =?utf-8?B?OVZhN1JBYVFISmVXaE5nbTBKTElYbjRnc0tOK2s1cDh1U0ovTHB5cGZkK0o2?=
 =?utf-8?B?UW9zOWp0VitzMTBRbG91UU5lc1lOYWFxYmg1dEI1OFdGdHhGeTdoT0VlYThO?=
 =?utf-8?B?MWhMWjJ1QVNCeCtpRndSQWM1VE8zMVNySzlxY2haRjU3RXJHNUgvWmF6Y2dI?=
 =?utf-8?B?K2UxeWRjQitCRjJhM2w0Wkx6dHFJRjlyWDFDQ3FyOG5aTi92VVpuK1lsaGNI?=
 =?utf-8?B?WHNPYWZzQy96dmMwajZMZW1JZkdkV09iYUU4UDJIb0lkdGcvVnV6OFBiYVhI?=
 =?utf-8?B?dWFtVEN5SFlFcGQvZ0JGRGhjdW5jVHRzaFBaNE8vQ2kxb0srbmFpUHZ5QzVy?=
 =?utf-8?B?NXc0emV1Zk9ObnhxdVIrRjJ5eXNEY0ZOTWtsbC9CSzFGTUlVZ05YQnU2Ujh3?=
 =?utf-8?B?cnZDL3MydFExVGo4UmhYNm5ZbjVJMlRtVHF2aVlEVG1vMG5DMWRhVUo2UkNX?=
 =?utf-8?B?VGxVQ1JHQWluaTFmM1haRzJ3TkRwNCtGMWp6OGpnVFRqTVErN2oyRjdSSi9Q?=
 =?utf-8?B?WWdCNWJqaXlzdXJXcVhCSjRpeC9yLzN0cm5Cb0Fkam1YakpaeG5pRC9vaFZs?=
 =?utf-8?B?RHlVZzdMK1EvV2F0YmNEYVl4WG5xOXNMbU9HVWNvODBEeVd0QlluQzdQQ3V0?=
 =?utf-8?B?bzl5ZDdmWmhuak5GZk5vNzhzaExJNXdJaHF0a0p4Unl5R3EyUUdqeFQ3MmVC?=
 =?utf-8?B?OTNVTDgvRWY2Und1RjA2YkdqUjhEbFZrWTg5Njhib2VWWEV4U1k4VCtncFgx?=
 =?utf-8?B?N3puZExqd1VtZjRZNk9hVFJGVTBoSGd3bS9BK0lDVzk2WGNMQlRzT3Y3T0lw?=
 =?utf-8?B?K1Q2bHZsVDZtRm9vejhYUlZSU1FnOHJzWmJBVUpsKzR0TmttVEhjZ29vamJR?=
 =?utf-8?B?RS9MYzZMUEZObWF2Sis5VkRtQmFjNWxPTlVrMUd6eXNSRnh4RWNrbkptY3ZB?=
 =?utf-8?B?Y1VMSFdEbzE0TnRpeFZSdFp1dnJraWpJMG1kcCtKdnZXN2VIdzk0d1ZqQkN2?=
 =?utf-8?B?Ym9zb1dLYWhSRHBLUkQ3bHgzQ2gwZlpqOVlYMXZIU0g4MTBsZDV0dHZhdU1w?=
 =?utf-8?B?T21PMmp1UnVjdmZFS0FNaWI4U1N6R1NMYUxxYi8rYmNtdGFxWTRoWE00YytH?=
 =?utf-8?B?UC9NZjFMRmx0NmNzYWJOcDZSVFhQYTBTNGF6ZFZrdWhqZGRVQ1ZkL3pHanBo?=
 =?utf-8?B?ZVc2RHNiVElwOU9MOWVTZWdNVDFJQzM5VndoQUYzNnl1OWJ4STU1YnlTbHhy?=
 =?utf-8?B?U0Q0c1pYMVNQRTJYVys1NXduRWZSTGdNTE5JYjZETmlSUFJabzVkaWYwaG1C?=
 =?utf-8?B?TWNuRTlNZ3IxSk5tb0c2YVQwR21BZTAxR1UraDFVTlYwZlBwWm9GaDloeXU1?=
 =?utf-8?B?eXJoUHoySDlwR2xtVGUyQzFseWhEUDhBYmRNUWVtWTBCbG5YNkpHby9BdXZH?=
 =?utf-8?B?U2V4K3UvZmlvM1RqNDI1c0JNOXlYR2hxcXVvdVpKNHR0TUlMbVF0amZTS1Q4?=
 =?utf-8?B?ZmxQSlZlVC9QR2d6Qk41Z09jbHZRWXVNOFJQTlNDNkU3V3FtNHgvMFVGQzlQ?=
 =?utf-8?B?Rjl3WEZQTHg4TmFDU1ZkS2oxbjNlY1d2M1pqczQxNlJHU2Y3dmdtSkRmYlZ2?=
 =?utf-8?B?dkVqeERUWWNiZDU1Y0d5bEVuUnI3NXdKdXBldUxUUTdEMWtmdkJHNTUySjVG?=
 =?utf-8?B?NzAvKyt4OFY3amw1OFlRY0JBZ1duKzZqcHF4WFkzeUhwRHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUdYYnQ3Z3hOaTFVLy9jL2RSQzE1V2VhMjdZVGlRRkYzd0JrUjM5Mms0OG5H?=
 =?utf-8?B?NDd1c0J3RFUxNVpEc3BucS9NL3FyYXVCeGJlU3RUczFlWm80UFRDTlZjdzdC?=
 =?utf-8?B?OHhDRjh0Y2pwL0kwSlBZQW1jdzk5OHpvMUJZQkZIZktGOGN2SHEyeHhMVUto?=
 =?utf-8?B?VXU1WjRIQUFWKzVLcVYreE95VE1PNTVSNXp6Rk8rTWcyNDE3aHdwem9zd2Z4?=
 =?utf-8?B?UFk3V01kL0UwUTNkQ29XbFVoRGhzckgrVzNZemRyanM1TnJIKzlxVjFRTndk?=
 =?utf-8?B?MHprdjlWdktCQ09tK2tiamFMbzZsOVFheTN3YVlrNEJBVjc3WDNtYnRBUHpE?=
 =?utf-8?B?UHUvMzN6N2xjRlNTekZlN0FDN2Y3M2VhRXAyRWRsbEhsWnVPVGFqYXR6bmdU?=
 =?utf-8?B?QWZMSTVIS0VHMFQ1dGhzeCtxRGtBL1dHZFIxVmhYRDdaU3BhWkhDZlBEU1lt?=
 =?utf-8?B?dk83WTdaVThQelNUOCtoWWdIc1lIZUtYZTlZU1hCWEhuOXNUb05CbW9IaGNy?=
 =?utf-8?B?OEdyTGpiQXV3dUhFSG44c0h2QUpqSFBxcHJQb1p3cHcvdUVtZ1V6R29LZGhw?=
 =?utf-8?B?L3lZRlNXaGVJME1OTTRvZnd2ZmZIdVc3Zk9qSG5ySnJmWDhBdXNtWXpnNFlX?=
 =?utf-8?B?NlRlR0d0SFkydjcvUEtFSWFib2V6ZGpMY09lUGRmZEEwdXJRRC9CVkVRNnBQ?=
 =?utf-8?B?OXVtMDB3dUN4aXkrTmZuaGZZVk5uSXlaN2FGMXhEY1R6Vjl0UHVaSCtVRjRB?=
 =?utf-8?B?TnRCYXlIeE9QYWdoOG5RWWdPYWJpWEFTZ2dXb3NmZ2VlQ2REVWt1R25KN2JM?=
 =?utf-8?B?QklhWmlmOVAvMlZ4QWlHN21aSEVrM2lxQkdiVCtBN1ZHTGNKY0Z6dndkaHdC?=
 =?utf-8?B?cndrVEJBYWxxUWxmUEdTNjVvWVhUQ3FlTXp3eXd6Y2JNZGh2akJMOVhKSzZu?=
 =?utf-8?B?dXR3N04wMDBvVVBTSUVSMWZGRGN0OGM2TUsxdkdHTG9zcTJTM0l2ODFRS2tj?=
 =?utf-8?B?TXRlZGpGSkhvRitLaVJWd2dFVnVGRW5vSU82Vll6VDVtZTVxNWZRTWtMeVhz?=
 =?utf-8?B?a1BhRGpsMjhJTzZmYmwzQ050NGkwSWhiRlhvNndkWm1PckFlZXNTUWR3eGFj?=
 =?utf-8?B?SG1vSE5tQXFjM3QzRW1qS2dqWHRtSkhQZStqWDZmOTNXUWZSU29MMTVYcnk3?=
 =?utf-8?B?aHVuRFBhK3BMczJKWEZYVmliVEFINnY1SVIwaCtqSEZPRUI5bS94RUFQa2tO?=
 =?utf-8?B?Z0EwQ3lPOWIzcWNnak9BOHVaM2tSTzk3TDRuaEs4YklJN2J4Zk5Fa2trNnRV?=
 =?utf-8?B?SmpUNi96R2JSdExUdFFsaEFGaVE2VjRzaW8yd3hJOUpON29mcHdZbjlUenBI?=
 =?utf-8?B?aFc0TWRFcXQ3K25FajlMUldRbjcvV1B2MTNqSUJRdlFPeWEzMDdtQmpQOHJJ?=
 =?utf-8?B?K2lKVTUrcEZxTlFBTXp1OWJYSWRHSG1rUEFEcHZLcHZ0RXJ1RWQzN3FGY0RF?=
 =?utf-8?B?eGx3cDB5QmtHZGl4VTdPTEZ3VkgvWHR1aldaUlJvYkJFR0F2SmpCZkJJMWZK?=
 =?utf-8?B?azFlSFlWOTdBeEg3VGVRU3VKVnNEbVNFTzE3UzNXaGJiY096OC9PTFRWRVFJ?=
 =?utf-8?B?ODhuUkg1NlZUMmMxRi9iS0xqak5xQW5aZHF2YVQrUzVuV1pGeEtyNTFNUURT?=
 =?utf-8?B?ZUk0ZVU4R01RS2ZOb01kNHVNcTU1MHgwaUYyVzdGQkEwYTdWaWRubVMrL2k3?=
 =?utf-8?B?S0JVOTJBSG0xOWZnQnAxNWxQVHdOT1VBcTBOOTd5NG9Canp6Z21pRjFQSnFm?=
 =?utf-8?B?SXFDQmxWa0UvTXlOU2s2c1NIQUhnbnJuQ3ZWZmZJMU1SUFYxNHF2K1RtK21L?=
 =?utf-8?B?VURGQldZYkYwV1hRMk1oWGRKMGh3NkRGWDhsUFJqajFGTFZncWxWSzU2cCt6?=
 =?utf-8?B?bmJEQ0h2QVJ2WHlSQno5Lzl0YU91MEo3RlhPeDBPSU1PWjBWVWxiR29jUDB0?=
 =?utf-8?B?WDlDVjh2dW5OWVZuS1owa1NWRG1RK0c0YzZjWWltMjBoV3JaaTdDMnZKVkRL?=
 =?utf-8?B?REJvN3Uwb05xUnJaSDV3b3plSjlUR1NpYVQ1aVcyQU5DNjN1MmxBM2hXTTZW?=
 =?utf-8?Q?hB0r+4W/VOC8Kl/HUDcP/PvVT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b66f4a9-ee80-4b20-581a-08dd9370b82c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 05:24:09.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xS+/L70IBsomfnHnxPykiQB0YVY1C9wDQ4Zk5jygomE6q9VWLb7fzeKAPDJAvqzaRTmkzYhmwv2cUq7HA8qPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961



On 15-05-2025 03:19, Rob Herring wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, May 12, 2025 at 06:42:56AM +0000, Sheetal . wrote:
>> From: Sheetal <sheetal@nvidia.com>
> 
> Needs a 'ASoC' subject prefix on both patches.

ASoC prefix shouldn't be used here as HDA driver is not under sound/soc.

> 
>>
>> - Tegra194 and Tegra234 HDA is not compatible with Tegra30, hence update
>>    them as standalone compatibles. Also, add necessary logic to the binding
>>    doc as HDA clocks and resets for Tegra194 and Tegra234 are different from
>>    Tegra30. This fixes below dtbs_check errors:
>>     - compatible: 'oneOf' conditional failed, one must be fixed:
>>          ['nvidia,tegra194-hda'] is too short
>>          'nvidia,tegra30-hda' was expected
>>          'nvidia,tegra132-hda' was expected
>>     - compatible: 'oneOf' conditional failed, one must be fixed:
>>        ['nvidia,tegra234-hda'] is too short
>>        'nvidia,tegra30-hda' was expected
>>          'nvidia,tegra132-hda' was expected
>>     - hda@3510000: clock-names:1: 'hda2hdmi' was expected
>>     - hda@3510000: reset-names:1: 'hda2hdmi' was expected
>>
>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>> ---
>>   .../bindings/sound/nvidia,tegra30-hda.yaml    | 83 ++++++++++++++++---
>>   1 file changed, 72 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
>> index 3ca9affb79a2..703f009862a4 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
>> @@ -20,11 +20,12 @@ properties:
>>
>>     compatible:
>>       oneOf:
>> -      - const: nvidia,tegra30-hda
>> +      - enum:
>> +          - nvidia,tegra30-hda
>> +          - nvidia,tegra194-hda
>> +          - nvidia,tegra234-hda
>>         - items:
>>             - enum:
>> -              - nvidia,tegra234-hda
>> -              - nvidia,tegra194-hda
>>                 - nvidia,tegra186-hda
>>                 - nvidia,tegra210-hda
>>                 - nvidia,tegra124-hda
>> @@ -48,10 +49,7 @@ properties:
>>
>>     clock-names:
>>       minItems: 2
>> -    items:
>> -      - const: hda
>> -      - const: hda2hdmi
>> -      - const: hda2codec_2x
>> +    maxItems: 3
>>
>>     resets:
>>       minItems: 2
>> @@ -59,10 +57,7 @@ properties:
>>
>>     reset-names:
>>       minItems: 2
>> -    items:
>> -      - const: hda
>> -      - const: hda2hdmi
>> -      - const: hda2codec_2x
>> +    maxItems: 3
>>
>>     power-domains:
>>       maxItems: 1
>> @@ -93,6 +88,72 @@ required:
>>
>>   additionalProperties: false
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra30-hda
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2hdmi
>> +            - const: hda2codec_2x
>> +        resets:
>> +          minItems: 3
>> +        reset-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2hdmi
>> +            - const: hda2codec_2x
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra194-hda
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2hdmi
>> +            - const: hda2codec_2x
>> +        resets:
>> +          maxItems: 2
>> +        reset-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2hdmi
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - nvidia,tegra234-hda
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>> +        clock-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2codec_2x
>> +        resets:
>> +          maxItems: 2
>> +        reset-names:
>> +          items:
>> +            - const: hda
>> +            - const: hda2codec_2x
>> +
>>   examples:
>>     - |
>>       #include<dt-bindings/clock/tegra124-car-common.h>
>> --
>> 2.17.1
>>

