Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63172610
	for <linux-tegra@vger.kernel.org>; Wed, 27 Aug 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293226; cv=fail; b=E7LyZUvgURUPMwI5omoqY/NKvR9iXKPaNCPiFtBzkLrOba2U3dfxgG7aq0NefnIyfP+nfzsSqYbMLCjxOyUMQanXF9mMT5bJBdyvjDpqPvLlV8DXrQ2JeBjLHbnm6NJ2I2DpxyrzjfXlckL5TP+3czToRylb8Hm5O8DiDidulms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293226; c=relaxed/simple;
	bh=28pbGl1hY5dhr5wfeUWvlZMiMM/3CdzY6Rru0H+M5Cs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hWyULkjh/4iMZXAtRVhF52fzPGf1kZ4kfSM6OB+v982tGUAkVo8KXd2Q8b7SwDH4VE+6WSZlm5aQX8dHKpuOn6XkC/+UNt+NFnwpNqltmGGklx5JJCchiGqfaZ+mXGt2ezELzYcQk0V541LZqq0lZnaBIicFOyhTWdp4rlD+z+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t5b+Lnd3; arc=fail smtp.client-ip=40.107.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5b+Lnd3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxchSd/VR63VNIr5WVdaxDfEN0y8iNAtUN5MUHVhQbj2lCBMpB/WDqOxfpLY1btCaSJNoVjLmDJRkinXt50HGg8HF6RURvFNnK77tGA1QzstH5MZU3dXI+Ae5kfDyG0iBrZlffUtdC9szbNatIcY4NJVeE0JPwOANVWzP+6YhYNLIlc+JZM1PjhpMOTW4rnNburLrGXynhiKRgwixGD6NHUvUVwjpValkAQ1horkQ5e143q8TLGDtehPnhW1G4knoqHij4Q0JUJhGWpQxfRofSi/Qt22+hZUdcCLXXgBSgAqp42cUmK5q850SCoFyae1I8A7K+es8znB+tGhrBRlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ/nCKgc/fE4ydH3Fw8+6CeZTN6lcJa960goXctx5ho=;
 b=M4SYfgQcIKFjafeFdrhxLM3EN5TG7Ph6isZrMPoyYJgOKynSz7HYfA0qoBj2U1sGGG4+zRoFHv6hF169Wx5OUrkCiFY8IDHEsGyCzupyHuhFGHTCFrzsiVhXEjPMKHizNtdFBsbfjzIPRan5XYailkxRqHplizb6FtrudPSBxoibfE/tY4rTbaOOYjKVZKTzsUJq7UtR/ZKEUXsITQn6W6NfOeTV47IeP1kwPtX6jdUig9h6n6FKI/fGEfHcAhoqz+0UD2KPH2qIeccZ4sT4HeRxus/zFRi99Ky1v+9vchH3VoiandbIQHnHsvAKkaWlndSXMD7hkHkEBH3wQsfiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ/nCKgc/fE4ydH3Fw8+6CeZTN6lcJa960goXctx5ho=;
 b=t5b+Lnd3ZrHW2eZjpKFt9yaXNF1R0F+v1OthsJw4ZHvV7j0Yg9rzMlwWnvdRYmm+n1YlWbN9nKOI281p+JnHd6tZjB08+1MdRPPZtfkPCJxMKEraljTj9Cp1lV7gJ28ZuZwnp9DGerzX5984SWGLRGzB7LMxKF0Of/kpWx3MglrTBnlHVldL6btrNccQEsxhVzwyDmprFnVvN1jVeuHNvBQNP2UUpcR/TK5M/USZb6zIYXlPYoeFa/639nsH1fk8j9LhzvGe+xm1HSiw92ZLKWoUFgBC/8teBDKEIwSF8oTusm4VZG4gSx+hu0svqkoeM2/xbSkE0ILPgmB+O7FaBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 11:13:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 11:13:41 +0000
Message-ID: <621952a6-7af8-422e-bd52-5a4a69fc0499@nvidia.com>
Date: Wed, 27 Aug 2025 12:13:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: Do not warn on missing memory-region
 property
To: Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
References: <20250729145911.2984981-1-thierry.reding@gmail.com>
 <CAL_JsqKQx4fNsPpoDdceKyG-maqHU=WUchROpiapo55M3q8MMg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKQx4fNsPpoDdceKyG-maqHU=WUchROpiapo55M3q8MMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0154.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 07679927-3b28-4e81-85ea-08dde55ac724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzRXNWhoZ3c4R0tCb1kvMU1SQjY0NUVHbHpROXkraHFLS3VtaDcrdWdGNCt4?=
 =?utf-8?B?WmZkc3N0Yml3aU85RnZzNkoxa2l1VkxwRXNaa2YrUlVvcUJNUDRTYTkyb2RT?=
 =?utf-8?B?VXlZNkc1T3grOVFCajZDeFl5R1Qra3I1RmdvVm1xaGNqbnN4cDhySDZGQlg3?=
 =?utf-8?B?ZGV5bkEyRlNCT0k0QUsxTFpxK2tIekV5dGVaeXdrVFNPVVhTS0JGd3dXNVo3?=
 =?utf-8?B?KzR0Y2ptdzdScFBnUmJzVkdjeHh5STdIVk9tMkU0YkZNb1hzSVRuUXNSclZP?=
 =?utf-8?B?Uk9kalFNMmJGNkJ1VXp0QmZTNGN3S1luVWdRU0UyYVZFWnBvRHNGbEp2clBr?=
 =?utf-8?B?QUJhWVZ4TXlqT1hvelJ1SFFvcWRPUmFGa09TZ0RqcmtwblpVdlRBTFRmWGFl?=
 =?utf-8?B?aEdNejQ5d1BSS3E1YjR6VlN0cjVyeURzWjZlSWFGejZPeVBkSWl1QVJMMHRy?=
 =?utf-8?B?M0t0MlZjMWJwclluYjJpeGFNM3JwVHJ4OUZVaWMwdHA2NWIySU90S3JmU2xG?=
 =?utf-8?B?Nkd0N3o5MmlUY2drNzE2Z3ovaXhTTlgzZ3NJQVlOYVF5VlJnci91TEF3STdJ?=
 =?utf-8?B?NjdTZDRGYUNLd1c2VjZBWVlFVDNnY1dCemVSRVZ5L3VoZjVEV0VnNXN2MEgv?=
 =?utf-8?B?TjJ3ekJ6QTdxc2l6RW0rdU5wVGpKUmVlNzZ2ZzRRU1VGMW01Z3hVT2hNbFdI?=
 =?utf-8?B?N1RIMkJ5R2tTa2MyZHBRNnlDN25BMTNWR3NYVjNDWlBIOHBSMGdxRW5lTFVK?=
 =?utf-8?B?cVNTckdtQTEvN3NNa0w2dXpkc2t4eVdjUkNEWFlvM1ZITm8vYnRnQnJaWVBX?=
 =?utf-8?B?dnZLeFRnaE5ranVzUHBDNmlwb0dEUmV5MjZsOVJzSjVZVHg3RGU3MlBCRDlE?=
 =?utf-8?B?SFExczhqRXJHTXBocEU4SGNiZlNjRitLWGZHdHNEeUVCZFpveGJORkM5UEE3?=
 =?utf-8?B?WW41dlluWEp1YWhHaFZJSHZiRU5sTDBnQkVLYkJubHRGSEFQdTkrOXpEUWlT?=
 =?utf-8?B?b2NwZ3RZQ2ZaSmwzOG9pOXc1VnFvbWl0cnpJNW5vRTFuSDlWVGRZSm1KbjVL?=
 =?utf-8?B?NXREbXd4LzRQN2M4U0lRT0VFVWRqVjVNNkZuSVZxZU9PeGRqcWI0QkdVTnRN?=
 =?utf-8?B?NlpQcC9WRkhpL0taS0tCeEZIdmkxTWZ5QktZdWd1eHhJNjRXRWI5NnlldUtn?=
 =?utf-8?B?dk9oMWttTEUrZzBmTzVnVWZJb2t0bUJFc3Z2dlVYR2pZRGtpYXRaYU9SVmI0?=
 =?utf-8?B?VnhRWHdDZGdMdkVpOHVVWXNINU1mQldONUxjNm8rOHV5RzBoOXE3c0NYYW4r?=
 =?utf-8?B?MXNSeG9kMTl6RTZtbGY3VkhqeXZLTDhwSGwyUEpQeGR1ZXJOOEp1WVJIdjg3?=
 =?utf-8?B?WXpGSXY4V1VTeEtlTWlkQVprd2h1dzQrSk1EbXBRSGRwcGVyVGJOUE5CN1hq?=
 =?utf-8?B?Zld6anBvK2NQYnlsZ3lWTEhQY0tHVU9QUDQ1UmlkaTNGYk9lcnJINmVJaWx3?=
 =?utf-8?B?cURaSXpyZUxVRjdhekhYbVJGZVNFOW5jemhSbmNWa3NkVEQ4V0d3OHd0TVJL?=
 =?utf-8?B?TlZlVzA2V1dVRzBERjlhZU1aemNOZTNwanBTWDltTUYydkNRRUNGNnl4ZndS?=
 =?utf-8?B?SXlraVdqRWhBaGEzMU4za1EvMVFxSzgrdnc1YVdZNXMzdHBhT2hXTU5TU0xO?=
 =?utf-8?B?M3hvb0ZKL1ZMaWE0b0VDWWR2NjNIdHNyUkM3cVlFTktxMDRNWmprbkR5dWNx?=
 =?utf-8?B?T09yZEVydHVjOUNBK1Z1M0liWXRML1FpLzdWbHVQcmlmbEdnSXI5NHpTQ3ZL?=
 =?utf-8?B?R21qQ2V6cElSR09FTlJwSFIzQWhoV3pOOTNSdUY2UENBT24xRDE4b003Vnp1?=
 =?utf-8?B?elVXa3h1bGZCZHlJYnRwcWhUTVFVa2JUSE9HWks1L2QreXdWeVdNSmpNWCs4?=
 =?utf-8?Q?MZXK/7ZFWcg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1RtTEY2NHpHZzVDczFtRE84dXVBUTZVT0IrZ2oxbTZqTjJqOTJLZHRXMVRw?=
 =?utf-8?B?TTJHZmVrUXYxamxSWWhKMkU2ZWZPQVNQNVR6dWdCaXhneHN1N3hscFZpOERo?=
 =?utf-8?B?S2xKTXZmVnR0ckRaZEVRa1pKRTBEQ0RuSmpMdTFsS0VYbDhsR1Q4N0ZWRFdl?=
 =?utf-8?B?bTNzYjE5U1FRYUsxRUs3WGJvUWdJMzRBRXRNb0RGbk5FVFVwMTl6Z0FuOHd3?=
 =?utf-8?B?SUxKdFRLd2xzcjdKQjlnd3NYaHNjNys0SU54cVlqOFFPWlBuTTFuaURJRlRS?=
 =?utf-8?B?MlhyQnVWc3dTRnZKK2Y3cm8ydXN5YVpFZjNVdWovVzlvc3B4NnJEL2FkOTFY?=
 =?utf-8?B?bE9GZU1aTmwwRjEzc0VJcHhqTmU0c0R1R28zNzhXeXRSWVdUMTArTEJVa3RP?=
 =?utf-8?B?Q3VnNG5KMU1JV1BkdHh5V2I4NVB0WEFCZEc1ayt3RkV5dXFGWFVLeVhjUGU0?=
 =?utf-8?B?MjdxZS80NlgxS1A5K01DMEFFODJ4MGtDdzcvaWYzV3k3cWZJc2hNYVU3M2Nx?=
 =?utf-8?B?VWdJeDBNUWxZNHJVcWtiRi9RTElxNllpMnJQSXR5WU5xNUNmUW9nUjdUNU54?=
 =?utf-8?B?WnBsYU9FUWFEdEJucm5XT05kVW5XdVpMM0VFTGsrMVJrM3oyMW5yZjFCMC9z?=
 =?utf-8?B?UEcvRmVQYVJ1Smh4UXRFeFFXZEhJQ255bjQ4a0tFSHBJWWh2cmpVZENOcitK?=
 =?utf-8?B?YVpZUFBBdDNnZms0UTh2dVRlVjlvT0hDUjBXZ0ErQUs0WFhWNVRuaHpWZXQ4?=
 =?utf-8?B?VTdNWTFRKzZvS3lkRGx3MWNmY1kzeGdIci9DMGV5ZEdBRnZleHVNZWNTcFFJ?=
 =?utf-8?B?TmxidlVUSUZvUGNyRkE1dkNzb1dlS2JSbmNpYmozK0xUTSs1alEwQlZ5VFVQ?=
 =?utf-8?B?eER6bS9JdVA5MW9MZjd1eXhia3hQNHh2MWlSY0YvRVplVXpzYzBnbjFhcFgw?=
 =?utf-8?B?b0pwQUhtcVJMQ0sxQkdSVXMxQmJWanEyWWtSL0R0Z09pSGpHMDVJZ1lQaUNS?=
 =?utf-8?B?SWgxcTY2NzI4SGljN2RtRndLVnczRlptblQ3MWVYZldDaUI1U05aaVozQmc5?=
 =?utf-8?B?ekJzYnlLTmxDRGdKUnFPMHRXa08zcXVub2hVM0NmOVhNWTJmTGlDbXR3QjZZ?=
 =?utf-8?B?Y015UFQwc3FReEswbzZqektnZ1JPQ3NvTFdtOWt2K2FwbG5JMnkvSGVmV3Yw?=
 =?utf-8?B?NHB5T3VlNzVLMTEvLzdDTWVzSmdLc0Jmb1ZNQWI0TTZIQUpWMWVyK3Jjd3M5?=
 =?utf-8?B?ckhuTnlSRys5T1l0MmRFQ1FyYjVCamd4ZTJoa0Y1T3Mrajc4TkxqVXJVTDRl?=
 =?utf-8?B?QS8wK0Fydm44bElQb2hsK2VZNUNVS2lGOE5wTi9Fd3lHcllDdVRMcjEwNGhY?=
 =?utf-8?B?OWRXK3U1T0pHQUpmNnQ3QXdzUTNNZGM2cjhXeW5RTDQ2c3pTTFhkVGlJRjNK?=
 =?utf-8?B?UTJMMTB0Z3BQaVErVGROamxaSm1UY2tqTmVKR3BhVGcyT3BzSTVjak1VRE5U?=
 =?utf-8?B?OVpVTml3YjkwRzVTZUlselFBMnN4UEsrSlNrSU4yTy9Td0llRmI4cnM0UWl1?=
 =?utf-8?B?Yjg3djRsQXM0MFJ6dDU4UE9hU3F1ZXZBYzVTaHNiRzRmaGhJQW1lN0dvUXMy?=
 =?utf-8?B?d3FDeVRPcjEwUkhueDVIYUdpaXFmSkJKL1o5RFBYY2hkZzkzMjhMdy9xY3oz?=
 =?utf-8?B?UlJZWCtKUExkbm4rZkdMVm1WZzBxekNDOHNKb0RocE9vb2M0TDE1Q3VZejQr?=
 =?utf-8?B?OWhwZWpETUFBNXFZS1ovQ1JPMHozTFVYc051Sk03REFYUnZQNDJUalBtbVFp?=
 =?utf-8?B?MnpHdU83eUxzc0xFZEJBd1JEdU15UjVMdzN1WnNyWEQ2dVpGNitNSXJFbGpR?=
 =?utf-8?B?L1NJcW81SG5QNDMwVUUzdXhYSHVtL0QxOTN4OVJNNVhnRnRTZWgrN1luYzFB?=
 =?utf-8?B?eUdvNDgrNGJYWFFBUTFvN3Q5WTVVU3VXaXphT28zcGg1MHVKTngzUDZ4N0tN?=
 =?utf-8?B?RDZDRldEb1ZsZ0N2M2lWSWcwbGhBNWVobGhuS0c1eU80Zzc5eDltckZQRU0r?=
 =?utf-8?B?Y0hGZDYrbVpxM003S0I1a2k4WFVTcVZMNGF4V09TaG5GdHh5UGYrV0NtaG9a?=
 =?utf-8?B?UFRNckpZTmY4QkFEQ0o4Y2c1ZU1NRHVmcmF0SzVLelMyVWNwRjNGMGppRkpp?=
 =?utf-8?Q?tKSuoWZdE5iFPJwf911eXWBu+ydXdVKT7NqHKWZ4fXqr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07679927-3b28-4e81-85ea-08dde55ac724
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 11:13:41.5695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6H8MBR52zYU/q0LJfcBibASaG3HeJjDYWn14yaYULrRdTmytxXPcLlu7elrJf5RaBootA/m/4oy+fCFnrHObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970


On 29/07/2025 16:50, Rob Herring wrote:
> On Tue, Jul 29, 2025 at 9:59 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The IPC shared memory can reside in system memory or SRAM. In the latter
>> case the memory-region property is expected not to be present, so do not
>> warn about it.
> 
> Then shouldn't the only warning be you couldn't find either one? The
> exact reason shouldn't be that important.

This code is checking if it exists in system memory. If this fails, then 
we try SRAM, but that is checked in a different function. So at this 
point we only know it is not present in system memory. So here we only 
want to warn if the 'memory-region' property exists but parsing it fails.

>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>> Fixes: dbe4efea38d0 ("firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"")
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
>> index 7cfc5fdfa49d..64863db7a715 100644
>> --- a/drivers/firmware/tegra/bpmp-tegra186.c
>> +++ b/drivers/firmware/tegra/bpmp-tegra186.c
>> @@ -198,7 +198,10 @@ static int tegra186_bpmp_dram_init(struct tegra_bpmp *bpmp)
>>
>>          err = of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0, &res);
>>          if (err < 0) {
>> -               dev_warn(bpmp->dev, "failed to parse memory region: %d\n", err);
>> +               if (err != -ENODEV)
>> +                       dev_warn(bpmp->dev,
>> +                                "failed to parse memory region: %d\n", err);
>> +
>>                  return err;
>>          }


Reviewed-by: Jon Hunter <jonthanh@nvidia.com>
Tested-by: Jon Hunter <jonthanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

