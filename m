Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C8346FBC;
	Fri, 28 Aug 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931398; cv=fail; b=I2WvIDyFrMInPgV5WpcxhZMyBk9Mr8hIizx5ZMPdH3aWgwreJJu7cfTRCnopJHhFv3Tu+bfG7cwzgSq9HkJYX1Q6EWVLf5LYsWLQimFiUce77ju0SemKV8yM5XCpn5+Ot5WxVDQOmyQb8L3X6KLw2qLKwPil6VvicStc2jUsQNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931398; c=relaxed/simple;
	bh=9tLYOM6Hbnrf8pSi8sZEgEiapP+maRK7wqUnNNCK8Oc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XIspFqqfLjsBSoNgjywRiJQBzfiq3oQEcTP+M18bj7rBVbDCMAH9AiXOsgME9OGsjsXbawKS/1HgnKirpg+0WQKDn2fhNe1VYNlkFrC8KhzZKhEkkVEiuxRknm81vihO6q+sfpoLmP0byUIHz3p+H8bRKkThFqPJd+Klk1vxCrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ctCajIMO; arc=fail smtp.client-ip=52.101.48.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ctCajIMO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os/2x9nBZviMOZHGhp5A2rDey1gxz3mn3ztbe7A8RsyMCV7A74aWV+KIrTST+Btwg3NDYokbOmdxor1HqTvDXIQWQRaFMJNAJMBNx9rzsS/QunOo5YsZjj1/6W8UgD5Ee30SYavvAhNAAh5qV8PPMU+rzxGV478jh5oW/95YWTbPFHH74hGiXF1WqH5GByPDfY9WS9dXwfzVnCGB+6AAyIxfsiKk3sJst4PJBce38MyLp1azXOSc9M+g/rEugUHGBjkMzZj8I5FjkVH/Vor9TpoDYptysZw8Pjd15ItuYV6/oIF0LwLI+MUTjX/UR5Id47wjF3crdzFAWuUGK2dWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2hJoi5X+YK87AS1FQkA8rQS6of5zk/7YkCWmQOlckU=;
 b=fEDhF073YirAT5yW6jYfPEj1fke0PSsFkolPijKyP3qrfRRomtzjcpZ9uEHnFiFJAIl64TIy9pRjCW9a7EYnTb/lnTN2kfJjyRsqKoBKnry+JZHw32PF+mCZb/gHmNxcAajVSQgSfrWIXZ5RdAM3E9iptBYol32pLdQ9xuERa20BUFGHuSHuNF9sjpFERA/Es5qkVTwLIk+fHcWMud9Q4vl2OnOur2liker31O7lBnhI9qV9tWLyw3halYDtk0Bn7slUMu7BLw55m5vHLh8coWyGr9svu2AiqoD/8hpBDOv5weY8kWI1mO834BlrZ28WS5CaQ+GavzQBIUmjQOSB4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2hJoi5X+YK87AS1FQkA8rQS6of5zk/7YkCWmQOlckU=;
 b=ctCajIMO5EIXCIgKUQ1mhGva8oyv4SOfKNRArfaYCzx0Vm2kpDwnBvt7wtSqlaDJgMivMPaxCO44HRWZ4NNfxkBjQmpNgKWNllQZJryG89jGAI4LIFlgIWixLrM0g3mS0dg9uLrc79sPlMSQQDSl3Kcf+rveP1GK9OuPhqKV6oOKLsdhD1fgmE+N3x39C/PBzGRNDSfLx92ON8pc1At/62E/He8iXknqRUMgwT3qj4Pq1Jw3ILEX+B5KV7XjOZ1e9Q2wr1sr9s9HM7HxGkz+vW9OlRISE3az6YECdx1FBJb2x0KipZTTRmKEqriygMG/Hr1uZE38pAVtQaFAGPEmMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by PH0PR12MB7789.namprd12.prod.outlook.com (2603:10b6:510:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:36:32 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:36:32 +0000
Message-ID: <2c5b2965-15ed-45a1-bdb9-2ceb7dbabb34@nvidia.com>
Date: Fri, 28 Aug 2026 16:36:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thierry Reding <thierry.reding@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260828140218.232439-1-john.ogness@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|PH0PR12MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: d43d045a-6aa3-4414-e2e6-08df051a22b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|22082099003|11063799006|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	QihwekuMJy/9OgLtQd8o86Q0vayU889XD5ASCvf5SrNHn1Gxn7T1iO7Giv6Q3D27pBt90qg2e5J7WJhoOsBpCOFOxC9DvwS7VECrD9l34Xmux0Cm7RBLXyiWKqXcrD3tIqTRKd81FMDcoZ2WmlYV/FLqSxxIm3N6xnUtekjZkMw5IBmPNIOLOIO4fF4bKKX5mXn/KUteyuj3PP1j7FH7X3YDkjp42iKAjcgnDyK1bmw8NLHt8gH3ZSjhsQNov88yEgcrYulRnHzEB49127FSpFXpKsIFIMvSJJ2SetqXyUOdmtqv9sjoK8YoPsedmnByZtWae8LbzO/vNicp5loF4KL/KNyPElD1j//Fn9EbxuqqVLyYDLYaXC3oegSodgf+N5qlFg/6BXy49U94PrtAAPmxHRmBMYruZUl+W/Zm/I9SLf5zo9tA11Wh7Kd2NUJePnfc9V4NvgNI6/92zdgGSnWWuHXCLSNc8fQABM5uqGFw2XLSQi+Pmb7HGj0NwGjqb5M75P3435gdivg1PmG92y1i3TmAfGK3l4tqj8/9VvRme6klWSh9tOVZSVUmmF3NvvSsLvohzF+op7A0DlEbCVyWbBeFT8OSi8sPyTe7R4BG5hvER8oNlVpX2TLGb6k25zl67TiiKZMxctNf2vrcRZ6cX3mjiokm0ncyv0MmPlI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(22082099003)(11063799006)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmdLQ2dxdnMyajdkRnRocWk2TTBWZkNzY1M5YjZlOWh0RVZjNUwvTjluZ09v?=
 =?utf-8?B?L25xVG1WVklNYnNPUWdDb0dtcVFkakVVbDhFaDRMeXpQRy9pNmV5N1Q5STNH?=
 =?utf-8?B?VFBZN0pBdUFFR203YjZlMVRhVzZudWN0TzBCby9CdERteXVFRVFWRW9uN2RF?=
 =?utf-8?B?c0ZwSUgxZ3RTaXlWQkZxSFdXeU92dXdIclNOYnEzLzB3TXh5Vzg3T2d3cmFR?=
 =?utf-8?B?VytSL2hsTjFmQ3dZS2JLNDFJbE4vTS84MHRyZ1NrNnNPOUl5SStLRDVwbDdv?=
 =?utf-8?B?ZVFQMkFTdXg4Z1BPYlJUU2FLU3hWbExOSDZ1V0JhMmZHQjBqMFpHTEpZbHZF?=
 =?utf-8?B?ZkFqdk4waVU1bkl6WThmVDNnTDBwWXQvd1l4MDNzcDVNRktERGRaT0o3Y3FT?=
 =?utf-8?B?RGo4ZDBJWitjZEt2UzR3a2YvNnFxeDFZdlZSTDNqWHJlOUU4cDh1NEpqRmNF?=
 =?utf-8?B?aTZJS2N2d21BQVlBTVNJWHRXN1BHbnFWL0RJNndYbVZ5ZUZoalVxaHIramR3?=
 =?utf-8?B?U2txWWlET3VNV2ZFWDRna3p6U2dlYkN3Nm1MR2Q2cnd5OUh4MnZvS2t6QkZO?=
 =?utf-8?B?SXJJaXRCY3BwUFR5NXBEcktGUUNZY1lldnhGUWJWZEsvYU01RnFjRGVRVmFq?=
 =?utf-8?B?SkYwYU1XamJqcUVLN1AzRUtHMTBSd1czS2RwRGxYaDhMdDg4RzlzM1dDU1l4?=
 =?utf-8?B?V2dpbkkrRE85Y2NHb0g5MEJJTDhxMzd2TU9oekFsSzBHYmJTeS9qa3NidGtK?=
 =?utf-8?B?K21taEsvY0x5MVo4MWNlNTBoZWx2QWZWYXBwcjJpYkRtSmtsdDltYkJKMERO?=
 =?utf-8?B?RDR0WmZZbGY3bnNienhoZzRRRTgwdURNM0lxYnlSVllVWm9pVGNaMTJyMFA5?=
 =?utf-8?B?eTZHblJhUmJvZ2M4Q0Z2UnFhRHowSFl0SWJvNEtCY1d5MDFBRzRnY2E4Yld3?=
 =?utf-8?B?ZFA2Zzh0Zmx6dXM1N2k2REdhU0ZOQllFeW5XaS9reWlpeDlCNk44cjhrc040?=
 =?utf-8?B?WGtvbkQ2MTkrdzVoY3JKeldhNmg1dkxFWGhiNVBJQ3lPbVArb1BrcDZPeUJx?=
 =?utf-8?B?b2ZxSHhBc2Ryc0NSZGI2Qnh2YlhHelYvOExZaXowNllRYXJvV21RbGhsUFpI?=
 =?utf-8?B?WVlzMTJhVzhuQnJwNndSUVB3bytIdXloYXRReU1RV0ZIVFBPMmR6T0Y3UkdY?=
 =?utf-8?B?MkM2bG1XaDU5QmpvTCtaV2REU2xGRWU4RHpPSURtY1B3N3ZhSVFoUHd2NGdB?=
 =?utf-8?B?YWMyL2NSeEsvWFpOWHZTd1krTWEzY1QrSG1UcnhBcGJpT3RZRXlCTmcxcHFu?=
 =?utf-8?B?ZHJES25QVE9iRGplc3RxTURVaFNBUktNd0VQMzJ4SFNyWGN3RzFBVzg5dmxL?=
 =?utf-8?B?aCtBc1dFdzlUcC9HalVDSVY5MmRsYVFzeFRyM3BjVkxqTk80ejhKdWJ4cS80?=
 =?utf-8?B?WWE2YUg3SUdTOWc5L1NMZTVPVDBHKy8vckNpOTRnZVltVlQzWWpKQUEyM2xQ?=
 =?utf-8?B?NlZjY01jVXdlRlBsWGp0SWFMbkwzdmlBdzFXVndzK3oxQnJKTXJ6SjVpM1JU?=
 =?utf-8?B?M0krU0tPTnU0WWJzSGRLQ3duVWJTNEMva2EwM0p4b2JKSXJCSk4yN1RRc2dV?=
 =?utf-8?B?ZmtmY09aOHRHV01PWnhDZE52Y2hWMEVvam91SVd0ZE5DNjJpeFJRVEdYMm9t?=
 =?utf-8?B?SFpsbHpCdCszbWlEaWxzcE8rSFNCQUFZM3pQdENiaUVRMlc2OWRqeU5UTzg0?=
 =?utf-8?B?cmtlZzF2R3lxTWxEQXY2SnhPZzJ0V2cra1Zxc3RLL3FRTkhMRUJtUVZoVk1W?=
 =?utf-8?B?R2wyY0VXemYyU2hGQWs0T3NCajVER0MyWHdwRlJZdmFUSkRkT0dkM2FEd0lv?=
 =?utf-8?B?RGtDZGk5dDVUbSttcWd5R1pxaVZpRHppWStlb3kyRHVuUXFZUjRYKzJycjNq?=
 =?utf-8?B?ZDF0ajJhYzhxL3pJRjlZR01OcUNwQ0U1aDNXU0NoM3VlYTFNWTZXY1JFNzBU?=
 =?utf-8?B?eFd3bHhPTjVRZm5Yb0h2cFhvVFhFcUFlczBNOTFhSVB3ZktRdmlodjBTZ29U?=
 =?utf-8?B?Nk1sR0pCRkFmb0c5Y0ozclpaZDlUcmY3MEdYS2Z6UjAxelkycUI5Z0d0czkw?=
 =?utf-8?B?TDlaMnpwemdraTRZUVhMUW1MelFNZWh0UFJoNHFlbEd3SFlKdkJFcllDbkg5?=
 =?utf-8?B?bDNPdkFKMmtJK2l6OGhjcXQ0Q1kvL0pRZlJwa1JxSUw4NzdRNUQ4c3dxUnMr?=
 =?utf-8?B?VVFxSUN1dzRiZVRSQmFXd05YeHhNRExCUWFDMzV0K3dsRXZSa2M3aTJZRHRX?=
 =?utf-8?B?a2k2Z1E2QXZKQ0s3Mm50d3RDNmRZbEw0YUIvZEEvM3RjRUpRMlVNdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43d045a-6aa3-4414-e2e6-08df051a22b4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:36:32.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfg2TB+v1I6O8azlG0zRfpKWvOH0HUpZawfKLsigCvKK3ygDU2Qp2UU7ib5DzMxfSYRX1by3MqpuFmAqOIVazg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7789

Hi John,

On 28/08/2026 15:02, John Ogness wrote:
> Hi,
> 
> This is v2 of a series to address some irq_work issues with nbcon.
> Initially motivated as a workaround for hardware-related regressions
> reported [0], it turns out that the workaround is actually a nice
> improvement for nbcon deferred printing in general.
> 
> v1 is here [1].
> 
> John Ogness
> 
> The changes since v1:
> 
> - Add a preceding patch to flush the irq_work on nbcon_free(). This
>    pre-existing issue was reported [2] by Sashiko while it was
>    reviewing v1.
> 
> [0] https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
> [1] https://lore.kernel.org/lkml/20260827184750.203521-1-john.ogness@linutronix.de
> [2] https://sashiko.dev/#/patchset/20260827184750.203521-1-john.ogness%40linutronix.de
> 
> John Ogness (2):
>    printk/nbcon: Flush nbcon_irq_work in nbcon_free()
>    printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
> 
>   kernel/printk/nbcon.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

I have tested these on Tegra and all is working well, so for
the series ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for fixing this!

Cheers
Jon

-- 
nvpublic

