Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228DB2AD14;
	Fri, 13 Dec 2024 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083133; cv=fail; b=sx0+irJm7+THOzwFru1ekbaL5NrgOgD/vPxVIvkZruHuOMe2u9tG7159dWRcmpk/F8i/qmay8FnTGSJBgHamUF5ifG9z+qMCzyOS1y/CX+oyDgzt1CZEQiKLLQuQCGBRqP3PIUNRkFLRXpxt2BY5OH56ab84yAAFWW8wm1E7Y34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083133; c=relaxed/simple;
	bh=4o4THCUY0A748AY9GMkVXcB+RENkQlkHxQjjr+zlvYU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WJlpaP5k0HqESmuxdfpX+B1ZSa7aF88egfZJ1ExWuxTJQOQgYtCArStQVL4XDDYOXm9/gH9G81XPiWRInfzLu2Hm7t/wN4c4FRhlYvZnuYB6AGUd/rOdVD1/CoDz1XrusWNk5he9UgxJaZih0NyF//IcZqMnnRm4KkGzudWFNxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kaWOQCUA; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kaWOQCUA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCQ1Xlm4JZhNefBL24nnsofmXXpGBaYyLIGWvzAcBrY0blrpSefA1+EWUHZB6sdpwVyD1VMEpD/jkXHl52tSzoq2mZlUc83qhdEEIiMldBhc1drUT66Fbs6qDVVd6KAMqytNYcHrhKMTrc1f2xYOuR88loElU3eBm9tl2Xuv+8saGdO+nx9y012e9upeYqBJrUxEeMOQwoPKnN2OU1BZgNJFlulnv0iGjfVsJ5816jSVSkHoc0kGfaoAo03Q+j2EoE5Q+XG8D252gPoS3pyCS+EhjdwMse4JaOrIhbHO8U/g2XYl4j0/Ds0BW/neBsWj0tisfQ2xJoO/LWQUUBklsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUFzScoTTr4fpwlmaIbNfcSb1fbBV1LjF8ndlr6zHwA=;
 b=fq8iq9/NYGpBzKlUkU2LTk9KeeafjGtN4kC89L9rno0IUjfEiEmsKrHZJ2YgfliIlb43V8OF4tLk0fqQ55euKnX27qPmT+CbnFJu4JUb1z6gEbg1AMGW8cGy/JrbpkhhdZsHIUfJEIk2KFvPYjXsPKOnqr4ec0lAa8N2kRjPmEI/LaOm95Fpr7WrsqxdfdpPd4znhwEvyV8PUEA2vGuxlzywWQZThEavITL6aQnhyTz7z9lKJLpS/Px7VaOharRr1ifW3NAprjWqt2nIBH6dzb1ijpQiyZJY04/vhE2S6BkaqOrkf0Y10ouGhXnIETmBQ7fFewWjSGHFvO+7a6HUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUFzScoTTr4fpwlmaIbNfcSb1fbBV1LjF8ndlr6zHwA=;
 b=kaWOQCUA2kybtj9ejNnUSewBoPewbj2sf5P3leqNB0YQCF4zSVIo5QAtFsUAZ/oOZMVtSIbRwjVJyrxZsGD9AqQaLeuplLlWRBS/XDy8C+gIdYzpa19Mm9sFUXDlL3fPrUT0h3H7vallsvO49DDoiJgT0ifxelObI7R0xrahjQn9efwxnLkrONt3wUsC3ucRJZTKrjeTjrdga2dCqoxvj1c8txFFcr+W2tiVYyEiTxD27ZrRqt9oFGOIw1JvNAo1zd1lpE9NmHPYTSUX4xe4/S0Ksf7Ty189nK0eBlNmVeZ5ACuaSXsSPZvJ3IItlff2cGQYLNKcRotca8O6CZYF6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 09:45:29 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Fri, 13 Dec 2024
 09:45:29 +0000
Message-ID: <12d1b1df-7269-4ea5-9693-78e75f59845f@nvidia.com>
Date: Fri, 13 Dec 2024 09:45:24 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
To: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>
Cc: Sumit Gupta <sumitg@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-3-yijuh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20241213000305.3533971-3-yijuh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e986198-e741-4909-2e19-08dd1b5ae0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWJFSElXZHFQblNUYkVITXlQS20xcFllMHpxTTJvVWpZVFpNNFltK0FhY3dR?=
 =?utf-8?B?NnJVMm81OStzUnZwbTEzZ0g4djlvTEVUdXBac0NjbzJtL09OL0Y5MUtGSEdh?=
 =?utf-8?B?Vk1qQlBiU0w5TkhPSk5OUHdvRmtZa0xDVk55U004QXBVU0pRRDFMdE9aSVUw?=
 =?utf-8?B?dnZxeVNxQWkrRHFCczZZVDVkdFNuSWtWeFAvb0RubURQSytKYTVmWm5wU2JW?=
 =?utf-8?B?ZUs2YjhYL0habHFibG9iK25XU2Q4T2hUTnpVNXNPaEFRWWV3MXJrRVMyY3Vp?=
 =?utf-8?B?TXBqdS9rdUUvZThZZ1dBbTR4Mmh4NnJ3UGZVckcxUi9kQ2E5d2IrUnRnRUUr?=
 =?utf-8?B?aGloWjlTOFljMU1rNkg3dzNJb2paaHhwblZIVE1hZitkcTB2bmRvRTViOVJS?=
 =?utf-8?B?ZDVJa0IrT0pHRHVCS1VjR1ZSdElPckVjR3lKU2U1VWhOQmdiRGpnc3ZERHV6?=
 =?utf-8?B?dEs1WVVNbnpKK3JWWEVYL1VDNnkwenlGRVJlUldlV2JLMnI0NnlkWXZwSFMx?=
 =?utf-8?B?OGx0NVRTU1VRZjIyeE81aWdhUjFVSWhicGpNVTdWcW9aN1duSThZOE9obm8x?=
 =?utf-8?B?ZnB3TkQxQWhtZTg0YU5Nc2Y1L2RLdzJHcXFVditiMk50RTRWOFhxSVlwdVpt?=
 =?utf-8?B?RUxPZHNwQkdMTFh6em1mcVhhbmZLUlFaRFBvM1k1K1hGQkNCRVprNEZ3cGNV?=
 =?utf-8?B?c1o3dlV4UitFenVaT3ZzcDY2cVBUdVVDUWN0OHBFRllhTllHd2cvb2JaZTl4?=
 =?utf-8?B?QUpneEg5dGpwK01tOFVvMGVjTlkzQ1UxZ1lrVXNMSktoOXFFSE1Qd3RwWEZG?=
 =?utf-8?B?SXV4c3dpM0ZGL0ZLVk56VHo5YnhlejREQXBML2hIQ3Zqd1NXNlRYSzgvdnl6?=
 =?utf-8?B?Mm9QUldYV01TMkVHY1JOYUYzTm51T0EzckdObCtCMnNaM29uUUNBZGlwK0JU?=
 =?utf-8?B?WVFRUFQwWklEOElXbFZNOFNaTDNVdmc0dXh0UkM2K0paTEpiaXp3aDhYVnkz?=
 =?utf-8?B?eXZiTnZHYVZGek1VRWh4cEdlS2ZBMEpaU25jeEQ3LytMS3NpeTFNWC95MThj?=
 =?utf-8?B?KzBFcWg5TzVBS3ZNWlBzd1Y1ZkRRZmNEWmZHbXVFd0dDL0xOWm5qeEJQVjZx?=
 =?utf-8?B?aWRKZklJOXNKS3UrSzlnVTk3ajFjcENpVjVEMk5FWkt0MERsREN3OTNDZWRK?=
 =?utf-8?B?UnFGQURPbGFyd0FONk94L1N4RnBFQ1dPcEZKeUZpMDRKUndxYnVJc2dwMmJT?=
 =?utf-8?B?Qy9kT3VhYytUTFRpcExIcHZPTmtsUFNRUlI3bndtalRIdTFsSHZpUEcrUWw1?=
 =?utf-8?B?VXliWkNuWUlvWFRDTVFuT1FPMWlHemJTR3JqUjExZkxjTDZmSXpmR2hwSVk4?=
 =?utf-8?B?Y2VicjdSdFdUMk4raVhBMW1ZSURSc2dDNk13N0tOeHFyVDNBNW9QLyt6bk9N?=
 =?utf-8?B?am1mRXMwRnVWMzByeW1hQ2lYWndiRlV0QmdyQlBXeHZnaEo5OGdtemJ1V0dv?=
 =?utf-8?B?ZGI0QWZXQXlUUlJsdXZ2cTIyTTJuUFpybkk3RXhIMVBORVBKWmdQZzlpZmdT?=
 =?utf-8?B?Vy80MjZZVjQ2eGpFVjZrazhlREVKbkVCQ1daSFZPTFplYnBaNEhoeFdjUDdj?=
 =?utf-8?B?Nk0zQmlUdm80MC83RmtQZE5TTnZRSFR1c0NaK3hJV3VMKzRNNnRXQncrb29T?=
 =?utf-8?B?LzJGOEx4eDZhdU0zYzdYRi96MmxXbjltZVZ5N3FNNzI5a0Iyc2IvTkdXTmJ0?=
 =?utf-8?B?U0JHcmlxMmNoUHQ3aXNSSyt1OHpxaXBZTDh4VXpxdnZzd081QVRDaFFkVzAz?=
 =?utf-8?B?UHIrUGZFVnFHREFONHNLYVpTbmxQWlZFeEtqMEVOM3p5cnNUYzZOSDkwbXgz?=
 =?utf-8?Q?WkciN/PjX/bQa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzNaQmQ3MmNPRzVZYXFtWkFOQUlUYXE2QkRJMTBjK1VvWmFSVEptMWFWc3h0?=
 =?utf-8?B?MmROQWNDV0Q3aVQza3ViWFFCaGNmbFhOdzBYenk1c2tkZXRibm5yQ051dy8v?=
 =?utf-8?B?N2w3bnJFcE9iV0VKQTVJWHJqdVV1R2FuU21PQzB4UmNya1BTVXJDY3MzUEM1?=
 =?utf-8?B?QmVTdkM0M0xwK1dlY0JBc0NYWi9lOXhYTWhuODVKcGVIQ09JNVdlaTlIYmFk?=
 =?utf-8?B?QkZBZ1dmU0F5cElER1ROT1c0M3lFTE9BelVXT0NORjNsaEtHMThUSlNJeUhz?=
 =?utf-8?B?WnYwYjFWMWcyQ3dMR1doRDhPc3N1N0V4ZThURWx3Nzl3Z3UxNURTeVZxWGRw?=
 =?utf-8?B?ejBhTnI5c2dnbzIwN3gvTGVpYVZnTzhQT2MyOG5YODlOeGMvdHVOYWE3MC83?=
 =?utf-8?B?WWNmYWd1bDlwaTduZ0UvbGp4dGZIc2p6eVJtZlh5Nm5HU05PZHhlMndaK2Rt?=
 =?utf-8?B?SDBHK21rbXhPZXFxQ1BlNjdTZ21PZkFTOVJqSWluZkYrUlhqRXpzbmNaVWli?=
 =?utf-8?B?dzdtTUNYdlhQNzhSM0RTQXpNelNoWWMxb0NNNE43K1B6SElZWEFETVRMelZV?=
 =?utf-8?B?UHpKdExPVUVJZzhBVEJhcUltK1FMajRMejc2RHFuMDE0VXlSNnN0aGNvVUk0?=
 =?utf-8?B?dmhOZlNUMkl2SjBLc1E0OHBURXNodS9jREVBQndJRzgwY0J5dU83ZnFjTTJm?=
 =?utf-8?B?Q01XQzNHeng4YVMzYTFMbHBXVjRybTFMMzFweHFWUDFScmR0dXo2aGI4YXRm?=
 =?utf-8?B?S3dVVlg2Tml3ZUc0WWtGbGJSRlJoWU54L0RsY3hFZEtQN1BvM2VuVG9TbElV?=
 =?utf-8?B?d2NPaHhxandPQkFPVFVvbnVueGY3Mmhsd0M5VkIwQWcxbzZyeC84ZHd3aGNR?=
 =?utf-8?B?ZGpMeFB2RUpEeVZLdmVhUUw0U0krWTJCZ3B1aFMzOC9ieStEeWZrRWdsVWph?=
 =?utf-8?B?NkFwOG5pakhVN1JUSHQ1WDNwYjVVUDRSOG9oT0c1amxhTmZJbXp0MXNYamhV?=
 =?utf-8?B?OTI3MU44NzJFeU9pd3plYVA2bVozcHRMVG9ERlh4QnJzY1NpSW9wUGpUT1ph?=
 =?utf-8?B?TDdZVkdFRFJSZXpMZ2NPRnA1ajdOU1FNcE5scy94cmtVR0JTTUFGUGFSQVBo?=
 =?utf-8?B?NlRMMldwb01rN29JbTFHL3MxOUluRmtCUklpYy9QY3VKRG1WN1JlNFYvWW40?=
 =?utf-8?B?WllSdWMvUDl4UXI0SGt0ZDllcWUvYVVjSWVmT3BqcXVaZUJ1bXN1TkFMdGwx?=
 =?utf-8?B?Y1lnZ0Z2Tlo0OThtaGZXMm55c1hMcU9KcjVaRWdVc3FTYUVFNnJ5SnJRWm5U?=
 =?utf-8?B?cGt5YTFMTEZ5QlFwSi9ERkFGT0lkSm1tNWxiRUJzWFBsTTJ5OEl6NU4xdmVK?=
 =?utf-8?B?VFpoamUzQWJhaHhiZnhpZVBHQUtxTnZ2bG1INFI2d3M0cmZjTWdQK25vckpC?=
 =?utf-8?B?THQ3U0JmYnVJekNvdkJGd0ZWZHAzWHJWblFvT3J5ZzB2dnhmTFZuR1pIL2pM?=
 =?utf-8?B?UHRSTk85Z0lVMHVJN2xueUJNRW56blovcGFqUTNXcXVqWk5La2VyZ29sWXh0?=
 =?utf-8?B?UnVvTWlhQkNUSUJNaFNGMVhSNVBPOVhMcVVkZWY0NU54dS9URDh3OEpZMWJw?=
 =?utf-8?B?SVRjM2h2TzBhamVMUXVOeHBDRGVBTW03UkhQZkk0UVRzK0J4VTdidUNYY2hs?=
 =?utf-8?B?cXBabEZwUFpZdWpJU0V3M2RBSDdHaUhPK2dzQ3Vlb1hsZlhSeEliT0Z1aXp4?=
 =?utf-8?B?cGQvdHhvekkzVndvVjZPWERwZFExTlVsQ0doNWV0MVNaTndqVEJMNWtyRTRw?=
 =?utf-8?B?MWMyOEgzNG1BUzNTZTYyUHB6L3M4aFVQbWhZekJpQmdIWlA4azVjdUhPdUY3?=
 =?utf-8?B?UjlwaFZKYW9hQjlIMDk1VVBIb3IwWS9jVWsrRXFPRDZzbmFGUXBpMnc2M2Y0?=
 =?utf-8?B?Z1hZN2ljd0J2VThScjJ4U2ZlQ21vODAvSTVuVGxJNk9Jb2RPbEpJblFENXVs?=
 =?utf-8?B?bjZ0dE5EVjRRRWdyQi9IbC9uKytjQWtybFdmbFlkN3gvb1R2Z2d2bS9oZlU5?=
 =?utf-8?B?eko1YU1VNUhUVE8zTC9VZWhJMnQ1eVdVbzZxYmFoeGsrSTQxUGNPNkNINXQx?=
 =?utf-8?B?Zm1teHIxRnJpcHRZcE5RVzl1YVVWdWV2a3JUV0tyTytIWjM3WFZjRWdxWGV6?=
 =?utf-8?Q?Cu9R7D3kFR24crgvivFukoldFzU4zMQqggyVaUPT2P5L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e986198-e741-4909-2e19-08dd1b5ae0f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:45:29.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+qBGY7F56KeHvBK0svAbuAJPVrEkK4sUxS7ZSA0SXoFEKNJ0FePfjcUZIO5rG39OsgqjHO/PZSATTKvRELR/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686


On 13/12/2024 00:03, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
> 
> Access to safety cluster engine (SCE) fabric registers was blocked
> by firewall after the introduction of Functional Safety Island in
> Tegra234. After that, any access by software to SCE registers is
> correctly resulting in the internal bus error. However, when CPUs
> try accessing the SCE-fabric registers to print error info,
> another firewall error occurs as the fabric registers are also
> firewall protected. This results in a second error to be printed.
> Disable the SCE fabric node to avoid printing the misleading error.
> The first error info will be printed by the interrupt from the
> fabric causing the actual access.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index d08faf6bb505..05a771ab1ed5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -3815,7 +3815,7 @@
>   			compatible = "nvidia,tegra234-sce-fabric";
>   			reg = <0x0 0xb600000 0x0 0x40000>;
>   			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> -			status = "okay";
> +			status = "disabled";
>   		};
>   
>   		rce-fabric@be00000 {


We need the same fixes tag on this one as well ...

Fixes: 302e154000ec ("arm64: tegra: Add node for CBB 2.0 on Tegra234")

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

