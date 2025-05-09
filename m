Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FECB21CC5F
	for <linux-tegra@vger.kernel.org>; Fri,  9 May 2025 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825975; cv=fail; b=S0N2xNpRE8pYe26tGMlgwNY2gCrj5n1aCs1EqOLkK0UMmi/hNObmXuZdmFcl62u3HdvKbuYxBFBfqOs3Jl16gBfISVa3OOGb9WSeUivzD2/spezSYjJH+G8OjWSB8FF4LIZVWwe1G7dXwGY8QcaFuoRjlx7/ce7qVcRxZNchazM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825975; c=relaxed/simple;
	bh=Rpo27w2uLwbc5FLqikleDptSxUqpd0FTRb0GnxIdwDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtRW6j8V80zzaaUi5bQyS6UN5/mcqkYXL/ATmQylz9DrGMdSVkbx2Zf/0X6nnWsNVMomdye6yN+lRAFTiaMBAjnOgq6ZWkpskjdhEoBO1PdoeP4naMJIr7DnU50Qo9lDmUkJKE+PlGRjqOsDFdTQaykNA2JBFrBaHRlGa0zY/f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TJMKs+n6; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TJMKs+n6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liUUYe62OI77twINawBhbrHgrdgJuyJU6uTAdy8HyVwUr3Y/lDcZplAO/LdOIWTy+22qKhLGmgVA8jXgSfpHCT/pYcJZg86wG1cKH2X9FLsuyLaLbZhbFDw2yUSseNVMmy1aoe1WkgWhmuYu/wluTe36rRK7Bp4uS0Xqi2OtzNd0/zXmmEdYA7EpzHA+badbxFYq9hXQUI9ZoZJc6CdSP3HFuGq4HQMUnvGXOjwJnYqSazBUk2Oyhvas0vDmk799b/7qJgl1sMbByjmN+4vqF5GgzgQxpcSOyinLlgVJGPbnwo6luQOnifsDnoTJAnrVE9B+3Vxil+siJC4YERYF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6muSKDpbMStICdpIXRNanqO1BwLlMX4TbuhLxjT/1Xk=;
 b=pQeOSCwgQA0zru29HZz/NgdXD7TDaeqPYg4nbD+U67tAYdzaZd7fhSC1reprnJMd+lFsU+VVL2vOEaKxRwzgUwOU6fPWLnhsnL1FNGHsXp0Re90CMBud/rxSUbds0B8p+qlwC7Mtg4ZGbMri+mI3rtgEZPgqIM3pYsszO3scLdqfXtBnYk9mdauQ6QGRDXvXQb3CMAVeuhNRKQlSgrImTuVzlEYsw7E1DwA4CDbtuL7ctpPOeg19fZqlbxNuq0S/+TC/Zz29/jSag2w6lB9MeCEa0gH/Vtwyw/f6s9xBQSfC/NgT9YHcimOrrEg4xqNZdwUhQRWgUGFLU4xI7eP8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6muSKDpbMStICdpIXRNanqO1BwLlMX4TbuhLxjT/1Xk=;
 b=TJMKs+n6nA/X4GGW2KkHv8SCGFSgMeg5FHk0SJ44zjIykjXB4VioleZmzFb/0EvqlrbzdR6P0aAHZuZczbywmijxQ9OZ7+zbqxMaXQkBchJbCtxaG7TU20BMmSD6I/ArDLcq+AlANb+AaAa4D9hStjsaS1ezT0YhQBtbbVKzkKTMiu86uykUaz3NWenMk4zbPK/ZIM9+MX9H5KI4kM7eCcaoQk2MiCuraZjqzZgSLuVgyBsHx34d6ow/VAdEiTC53VCdzpPHxLMIdpBCE/+nYWxwRU+oHp5CcN8vNq6POCHBgGPCwvVnzgDtYfGxD0Riz4UOV0LNPDfq4zANhezVzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 21:26:11 +0000
Received: from DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c]) by DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c%4]) with mapi id 15.20.8722.018; Fri, 9 May 2025
 21:26:11 +0000
From: Thierry Reding <treding@nvidia.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree changes for v6.16-rc1
Date: Fri,  9 May 2025 23:26:01 +0200
Message-ID: <20250509212604.2849901-2-treding@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509212604.2849901-1-treding@nvidia.com>
References: <20250509212604.2849901-1-treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To DS0PR12MB8317.namprd12.prod.outlook.com
 (2603:10b6:8:f4::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8317:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: a4144608-24b9-4042-08ae-08dd8f401e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTVhR2F1RDBNdW1HSkNKOW5Zb1A5SjJnL2ozQ0ErSjZFT1FGV2dyWU9zeklv?=
 =?utf-8?B?UGFmZXd2ZGE0UU90OENFTVJPWWVvbDZlRktReTB4STR0NGZiSTNlbjRja1M1?=
 =?utf-8?B?RDVPWjJLVSthUTB6a1M0eXQ3emRLVTZzYjl1K3NCY3BGbXBONkg5cFBOeC9D?=
 =?utf-8?B?Y3RVVlArUmxreDh0enFaRTEza0xydmNkNUVFSmhXK1J1cnAvdStJTzY5eHl2?=
 =?utf-8?B?ZjBZeTJOYWJ2RittZlVpRHRFYUdCeWNZakg3Um51VkE0ZWhSVEpZdTBVNmhE?=
 =?utf-8?B?N1lNbksrZzBKWkVhNHJSeS91WVJ6TmZnT0JtRFpMaVFnWTk2Ukh1ekZUNjVS?=
 =?utf-8?B?MkdYa1BBZ0tYaTdGRCtvWkRxdGR2elZtdDQ4dHY3T05vTUI0ek9YbGxMR2JU?=
 =?utf-8?B?ZU1ZZG9Hc1kvcS9SbUQ5OGJOWE95Wmx6dVEyNEFnUHAwSWxJNGlDM2EydFNT?=
 =?utf-8?B?RlByRkpuejdUQTBJekROVWY3dXBVYUV1R2lxZENoRkU5ekZGVXAzTXFlMU5X?=
 =?utf-8?B?bW9rS1FodmtWNEJuVXBMRTJlZ2J2RDZhc2ovYm12K0RHZzhEYURIOThMeDN3?=
 =?utf-8?B?NmJmb1ZuVmJ0SkNrSTYzVUl3Y0pTbnNhVkFidlV1QVE1K1gydWhOZ2Z4MmV1?=
 =?utf-8?B?U0RhOXpaWWk2YUJUL29rU2NlQml4eG9uNmxUT3V0Q01UTW1YTmc4akExaEE4?=
 =?utf-8?B?MGptZHAzZDgvdHlidmZUMzRuajNPbUFzb3Blenh5eVZJZmU3OEdpWEU1a3Zz?=
 =?utf-8?B?MFJLbitockxKcldLcU10UmM0a3BNbmlQMnI3WjFMWHZVeXQ3amoyeTdlMkN4?=
 =?utf-8?B?NDFWSXVmOThoMmRycUljRVgxMWdqQ3l6eHVYN3MwY1ZXZ0tPUFBFVXMvbUVr?=
 =?utf-8?B?a2xtNzlaOGVTNEJHY1IvMWwrMXloeUFpc3lSM2VoRFVTQ0JIT3ZEcEF1Zzd5?=
 =?utf-8?B?NnVGZTV3SWkxV0M5aHVZWEN1SzJVUnFRQmxrY2greXIweFF5Snp2OTNOdWNP?=
 =?utf-8?B?azhicnFoK1hyeWJGelU0dXg4MnFVZWJQT1htY21tdCtiS2MrT0R5c2ZhNkp3?=
 =?utf-8?B?dHUvaHU0V2JIZ0xRb1RTbE5tbnB2cjAxMjdSMU5RblE0bXBSdFoyT3hzNTA2?=
 =?utf-8?B?UUdVdUlWZVpGRXJNNzRlQ0E2SzRGRXgzOWJGYVBoRVNRZVdQMklUTm1nYS95?=
 =?utf-8?B?Mnp4YXlJeGJoQU0rMFRzUDY3dDdtNThGZHJ5Wmo3RW16eVIvM3dzNW1aQUZp?=
 =?utf-8?B?NEtCMWNoMGp2dURxNkxxRU9GTUZNU2xlZ2h1b3dTSm9ZaUE5TTlTZU9sYVZT?=
 =?utf-8?B?TW9XUGJTN0lyUmpWZG10WDcxUWMwTGdPcWkrU2VPUFlvZ3RGd0FTWVRGcFhF?=
 =?utf-8?B?dVBwN2xhRFNub284cmRIbnNvdHJkaW1SUHFyeS8wMExQZGxGOVZRbzRJaVB6?=
 =?utf-8?B?MS9mQjdxQjB5SmxIN2FJbXFDSFZUQmtPaHFSMDFCTjBNMUdPaWVIa1gxZzdW?=
 =?utf-8?B?dC9KdENZUU1JdzY2RDNuTjVFYjJ2T3l5K205SEc4Vi9sMEphcTk1dWQzZyto?=
 =?utf-8?B?MDd3SHFDNjJKcm96a1cralM4TmloMWhBaE0rUjF4bGt1azU0VDlkaHA2bVUv?=
 =?utf-8?B?Nk80emFib2V4aWF6bmJiRnhTRG1mNnlaZU9ucWxJQ21Db2xHVVF0MnVxdk5n?=
 =?utf-8?B?TWxCYVRxVHBhRit2SE9wWnFzWlZNTmppNlpFQS8rekU2M04vdWJIM1FvdzRo?=
 =?utf-8?B?SXI1V3ZzTm9KZzg0dkpSYjNaZGI2Y3BOeVRjNUIzRnRJS1dVbkM2L1ZndnJ3?=
 =?utf-8?B?YVY5U1RiQWRkckRnU1NFc3FOT01qaGY0eDFRZUhOVzBPZ1BMc1ByLzA1RjBi?=
 =?utf-8?B?NE92ZU1UcEdvVjc0dWtmUHcxNkJKdXE1ODVjZWNwaVVCM3N3RWJYSkZudlc5?=
 =?utf-8?Q?mkiwFLYhTpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akhoL0gydWZtRDFBSURtc0xrdlVMUUlPa3gyb0ZEN1RFR1JsT0s2UTRhOUhM?=
 =?utf-8?B?d2FNUWZqRlIxOVA4NzdiNEU4WExjVmNwUXN5TE9sd3lHcVNoblN5MnhMb0tO?=
 =?utf-8?B?STF2bW94QlkyMXRrZ2ZEVU5ZRzhTZHE2MHgxcVQrdEFtRUVDcG9xYWMyYWZm?=
 =?utf-8?B?cmgyR1RGVHNRNm9oaUJmT2tKd0lwNDdQL3dad0ozek1zRHd1RnBld1c4cEtJ?=
 =?utf-8?B?UXVESUxDeFVPZ0Y1SEtMV1pnNEp2Y2xKZWwxTkRyTHhhMldVemdTUHNsVTdx?=
 =?utf-8?B?TkpLM0w1ajcycXMzY2cyZDBNeGhoMitIRWZRS04rNEFUNTdRUGcreWdwUlV4?=
 =?utf-8?B?Y2dlSEdRVnd2MUxoakdaVlR4cDFzelVoN0xzdHZtQ3VrdzdFR2JPMnNMb0xN?=
 =?utf-8?B?QjMwd012K25sM2ZOV2Npb0dIR3pOby9PL2pURUNNcXVjWXZWdGMwSTJlRHIx?=
 =?utf-8?B?YkZORWRaQVRiT09nRXllcy9xUGhXdENhcExheGhldjllNExuWjNYaWRLLzda?=
 =?utf-8?B?alR4V1ZlbUJRaDRDdjJMSytCcWJNcFVtWityd3ZycGtJMGpZS0UrcnVjSnVP?=
 =?utf-8?B?Y0ZRSWJQZDlzR0NaUkgzZUl5cTc5bDJtSGVoM0dBZEpSOUJzUC96cGhEclRi?=
 =?utf-8?B?cjNBSkhFcTVVNlErU1F3QVRHTEp3bU1pa2UyVlVrS0EzaGZrKzdmOWQ2RUUw?=
 =?utf-8?B?djRxcWQ4WThIOWRWekRqMm5kQ0t0Sm1sc2ZuSC83S3F0VTI1aS94c3V2aXNW?=
 =?utf-8?B?UmNIUHNCc2xaeWUxNXJjMXlXdmJoY1V3ZnFDRWdMNGFaU0w4cFQ5RFBmT3Fa?=
 =?utf-8?B?NXpmSlFySlFpVGpvZktTOEVMMHBOOUNFUENlTjJuRHQ4Z0VIaldTRVB6RFV5?=
 =?utf-8?B?Mis0QjR5TkoxWCtGMGIwbnVuOWovNkNUTGkvbVk2c0tBaThRRlB1dk1qazZm?=
 =?utf-8?B?YWRZUlU4RXJWWlRDcjFZQkUwci9TeHlxd0lIUjVCNTZlNzgwb1RhZkcvR1hC?=
 =?utf-8?B?b3QwakVvT2lrMjhkZWUwUUduQ0dwVW1SMFBiSm1XS2h3WUlISEVTOTI1dVBJ?=
 =?utf-8?B?Vk1XelRNZklCN3k5bFdrZzBkSW85OHdFYm5uSXQvb0l2MVdTU25WWmVYVGhz?=
 =?utf-8?B?eEJkZWpEK2t0R1lta3JJNXhUR3J6cHpJUmplSVExNlc3dFBtUDU4Y0hkUWJH?=
 =?utf-8?B?cWUwaEQzZExFN0MvSmdGLzY2bkY1WWpBL1BVZEZwcENkQnJBVytOVXhncWpL?=
 =?utf-8?B?Z0lOSjlhckJ3dXlSM05KTjVMdHRlM1pOaFlHeTRIb2J4alNpa05YUUFWM3Nr?=
 =?utf-8?B?Ym1JOEQ1dHI0WUdZZUxnZTkrUVN6UCtpZjZIREFyaExHeFVNcFN0QmFuVWgw?=
 =?utf-8?B?UWY4QnR1aytmSUlvdmd6Qm13aERpeXNGSlV1SldGaHg5UUhueUxaOUQ2UVJy?=
 =?utf-8?B?OUxoWGRrV1paZkY4NGNnODdnZDRyNWp4dEpjdStoS2dNcnU1QUpkSitTZGI2?=
 =?utf-8?B?SjdWZlpFZEpWT1VGbmgxVERDdXd3c2Z2NEk5eTR0WUNkV2RlYy84OHladTdR?=
 =?utf-8?B?dFVvR0VVdzJnakZvMWJ5S0hLSjFFZ2pWM3NwbFhrNHYwSENEbWdTU0RBd1lQ?=
 =?utf-8?B?YUFCSVZXSDFvR0lzaU1KRlBGbEEreC84RUxiNU1OSVJyejllY21HWGNreDVi?=
 =?utf-8?B?dEU0RFJQQ3FWNVdzMlJSaWpxcHpseGVPTjZiVXNBZ04wdVhtWlI2Q2Z5eWxt?=
 =?utf-8?B?Mnp1V3lpSW1YeDNJajJxN1lQTFlHeTRzdXA2YWpLMzR2SVc3V0R4T2FEV21M?=
 =?utf-8?B?by80WDhZNUk4WVFpUnRwVDd5MEhPcnp3eFhkckhDS1Myc0JRa1lNVTdTUENE?=
 =?utf-8?B?SlBxL3BNQUFxL3JuN3Z3M3NBRjlhQUdCM2Q4UEk2Yjh6OXBXZ25ldTd1OWlO?=
 =?utf-8?B?NFErSFU2SGlQOWZzOWZiUDlkSDE0K3YxN3hJWWovYW9Ec2RlZXJlQUtrRlR2?=
 =?utf-8?B?NHZubEhaT1VPcWtLRll5MXV6ajFDMjRLaEFwWjVnN05oblZqR0tna01BNkNx?=
 =?utf-8?B?cHJLTDNoOUhpdC9oN0kyWTU3UElldUIvQVZHM01XaUJBa3RldTdxL0FNZm1D?=
 =?utf-8?B?eEo0N3dBdng2SkNWbWlLa1VvcnVNTlV4OTc3Y05xTFI1SktYU2dFd0F4K0xx?=
 =?utf-8?Q?G7ZfPOJyNP6knhVmaHqap6ljIHMFq8/Xb9cKzBiJej9H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4144608-24b9-4042-08ae-08dd8f401e96
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 21:26:11.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeyidXwBb23v/FeWG8+vQ9OXF8DjeEboiGvYIkCjIeAymCiBNUz80eSrCVYCg50NDabl/LQUd8AvLZKbeWGsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.16-arm-dt

for you to fetch changes up to 7cfd76f086c640119f4c5201115cf73488cabdcb:

  ARM: tegra: apalis-eval: Remove pcie-switch node (2025-05-08 23:17:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.16-rc1

Use standard names for the APBDMA controller device tree nodes, add
support for the ASUS Transformer Pad LTE TF300TL and clean up the Apalis
evaluation board by removing the unused pcie-switch node.

----------------------------------------------------------------
Charan Pedumuru (1):
      ARM: tegra: Rename the apbdma nodename to match with common dma-controller binding

Francesco Dolcini (1):
      ARM: tegra: apalis-eval: Remove pcie-switch node

Svyatoslav Ryhel (1):
      ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL

 arch/arm/boot/dts/nvidia/Makefile                  |   1 +
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts  |   5 -
 .../boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts  |   5 -
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |   2 +-
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts   |   5 -
 .../boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts   |   5 -
 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts  | 857 +++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |   2 +-
 8 files changed, 860 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
