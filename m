Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2E2341057;
	Wed, 27 May 2026 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891687; cv=fail; b=lWLiYS+Mwuyr6CsHP7CqDUhtYHBeF7YFITgQTGUVp+iBPRrCNfFILlSGJa8ICz84TsQgWW0UMptegkA6Y1Dn2JoU8N1OTTC+bzV2BR9ng4g4uP1Cf8Gr2tyQiDVs5tM3Mxh60U1EwpqVqolftRAWmbmWjXrPlxzijRxIip5z9V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891687; c=relaxed/simple;
	bh=F7Qz4mLKjXPAZol9UKvAzuitwEOqMQ9+A/mwHmRuxQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cZHD1eEmD46+pUJEE2Dn5B23+6iMJW61GOlioZT1wDIWqYjHbjyIaGMsOszwsHUOuw/KVBlXaY+a6on7j15MyyQpW0so+PfIWvLD6fCziXARQYjJMzl1GtAWrCvQJ0Y9UC4u951xcekA8u0zfMUP6ack1Hsd6U7pApaynjaS6Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eyjaqTKe; arc=fail smtp.client-ip=52.101.53.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eyjaqTKe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ98vNlLV0hOFRLg8tmWPeJ7Al9PpBGVFaotdLVc3y8ettlDUM1eE84lOcgBgQhnQeoYM4gRrTBhi4mY5XjbSbxDbjfiJsp5ryghQ8Js2TSLA2AnHWsSSBzwGkYSk16hzJxevY84f22WHkX41vpxxRcN6jxjRt+n9WYxCtd1TuboHnalYJocgOVUmAH3LXsMxuvgyEM8zSs8IFCjLpeYEI26oIXk2L4DS+0wdO2axvdGgvCBNWExM8O/vf4jLc7n/1M0hqjVmZFrleJKXHkuGcmjZkG/f2e20/xjtjzA1TDjZ6YxyWlzVfIjfxd4z8U8k2xzwmfsdNxAdDunlg4Hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi2ioOoEQ/R6XijY7Q6U43xrWH/zi6D6lupdllGYnz4=;
 b=M/Jps2IOkBZzEPT4aGOdJanckx7WV8vsa8nSoerd9x/Nq1/bqClZD2NAt7T+7drjP89j4nDjGdbuaZPgffZ+jzNIeLpnDYfI0mb9dqcH1SoLh5Hj7CsBTDM/Cwrd0guz9Xq57qGnpY81m/OnJuAx+E1QMSP72jHFGtl92VJbDtnHLDWhBhtbeXNYhvKOStfz9s68KiM4QHSnt/zk5tyty4QAUPyxycy2FSXJpN3pg5653ERS1YpLnUtAlpcigfO3rQdm9nne+cAVD6gLQp6fkvDaETKAU67MRW8EsCdWza5yzK61NUbbEBmVHyy9FgBT3P6XWjfyZCQqr6AiwlTZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi2ioOoEQ/R6XijY7Q6U43xrWH/zi6D6lupdllGYnz4=;
 b=eyjaqTKea4RLKxBfobC70H20NwdLDRZ61G/jTACMSuKgIx0tMK1/xRIC3j6VQcTNDqy9iqdxCmHLqx8jq6cdTHEmMX5EJe/ok9cefJYa5zllcqv2owdMo1/+CMP2epYkCpQBkps19ursek7U+Yxpp1YOzBKKf9sN9MGIyMxwmoUPI67q5gxnVHJT4fDU+WEzY1/VeOX53jOWxprnoIXs/oZXwNCC6Vb2Fq2iTxh/9FD9lG9wy6gMbuOfwfvbyUVJBi1vN4aCv3iFgYNUgAJzqSwhVCAuozYY5NVPSeLJnHDnO7PfXxqNv7hoh2Fr5wqAoLFDdwAtUiZTXYg7SgenAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 14:21:22 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::f927:9cb7:cf3a:e741]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::f927:9cb7:cf3a:e741%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:21:21 +0000
Message-ID: <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
Date: Wed, 27 May 2026 19:51:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
To: Krzysztof Kozlowski <krzk@kernel.org>, treding@nvidia.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com, sumitg@nvidia.com
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a4f86c-79dd-4645-e321-08debbfb3993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vFbqqwYeNLbxWexurmI3nWi4Pm0jmB7PeJg9/MvDu8t5uRKgTIb0WZfNflnU7eiCgMmAPog6nOQR59BgbfaU+zLYwm2THGShUuDl/TpKdl6OD9LLBdfi+UQy1LIvRCCTsM2UUqg6EJa95HTlid+oNQEP2SwOIpoYFZNXbjeJfgmclxh6ruWcAoI6aw99TdtUDP89fbZpmwiEO1JHokyCsg1spkZvtPNGLAwRSElsOaHD72WxfX/VmH4DMzic//yoP4lCTSXsfZazqeYQntB+MNNcgVeCdah4tmSAecX6AnjhlxijmU9O8BqmKDQZ8HkjmFe7vn8Ck3PN+uZdKkAsmPu52l033nQRdNWvHuiweHDkxjOCg49dW9LRVfWMSvrS9qG45qiOKCVlriVX4vhXtKYFGmvEqq1iwrqMYL884/ZqscAu2CkcOp+UBauqjGZiSlljHmaYkYXDDQPysh8s3p7Dk7gvXXb6s4u3Z6timRosxx8PPqOMmTCZLgjtcqWAfqnsd13LSrllFlFTYg3Zi6+nzj5F3qHSh/n6nU9lIjeYlUO9ELY8h/4xANmuC3yPJTzx+gvLVN61RDW0fIWR5lv+dRqveFtCD+jqpm9izVd5I0AFFg7lcfXGhESBqWgyYVQuXGZY1lD09tiCiimkLTjsB+kpkBWOiAMZ4szY2KRPYComg2OBWuPSVA8gilNU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJ0Y0xlbnNkZGZ5dlBvOUlYR3o5TVR6YlR5bUoyQnBjTHNtaHQ2VGgrM2JD?=
 =?utf-8?B?bGFyUW1reTIreHNaNnJ4VHYrVlVJWDlxWHlmZmYzYno5OHJ1M2NMTkc3dFlo?=
 =?utf-8?B?Zm13djQrSlo5bHVrL0VWNjNpQmJxa1g4MXdJUFZEVWtKZytMMkJFNmRHYVpI?=
 =?utf-8?B?Vm80S3RsMXN5NkpObndKTnE5MTRsRzlBbG1SSXRsUURXZWFxQkNIejF2elJp?=
 =?utf-8?B?OHVjK3VEMDJYTnhRcGxyL3NCWE1hMVUvNG9JZ0o3U3lkU3k1bFF4ajJqQTFy?=
 =?utf-8?B?N2xiRHFxdnFJckYyS2ZLcHl4TS8wQnd5YnBCS0V0Uk1xMFNvbHRZcjNnS3Bl?=
 =?utf-8?B?TXlTWkgzalI2NG5SaUh4THplM3phZTd5Z1d4ZTdMTE8wQVF3VmlhcFdzUEto?=
 =?utf-8?B?RFRLK0VuUnF1RnhtOGNCak9SbUpIRHVlQlN5a2VFcXFHc2l4WDMwMm1MS0ZK?=
 =?utf-8?B?eWxreWxkb3ppcGx0WFBVMjMyZzFXV0dCOGJCMnhRcU9SMEg5ZTJBOEpqdEZi?=
 =?utf-8?B?VHhiL3EzZSsyZVBkVXFGUGYzYk93d1RET3VJSU1RNlVncWVDSXpJWDE4clhS?=
 =?utf-8?B?MnIzNkNWaDNFR245NkoyMHdBdCtqYnF6RXR2S3dpRnpiOVpkaSs2Y0I0Qy9D?=
 =?utf-8?B?Sk85MVlxVmN6OElFZUJGcU5USENwalA0K09NQzZuNmdINy9rVmdpZEdaWWpO?=
 =?utf-8?B?bmtJNjM4T3RKMlpienlrSE1jVm5oUUZhazJzU0tGblRUZnNoQkEwMDFhRk13?=
 =?utf-8?B?YWs4QnBCdnlBSjlDczhyMVhYMUVOZHI1bEphR05oQloySGdOQ1dNVTlXbGpX?=
 =?utf-8?B?YWxjT0RIVnVMcVNFRzBNZ2xjU0dNb0hnS1Z0NE5aaVByNDlnd3o1c3BTWTFK?=
 =?utf-8?B?L1NLN2RKZ2ZhSjlWUmk2VCs0K3pQM2orZ2pocDlCaG1BbFBQdy82ZUpla082?=
 =?utf-8?B?VThSSGZPdHRkWUdzYW5hK3VZTXNhMnh3SXg4b0F3dktZTTZ5U1F2ckZ0N3BZ?=
 =?utf-8?B?SllXSnlJTWtBcnRQdjRJRWlTMWkxUTZMc0JET3pYbjNuVGh0NVp2UlRFdUN4?=
 =?utf-8?B?bjJvRFBsVmRtQmxXRndjNkJIdElxampoTkF5bFUrTjU1MW10a1ZERjhIdE9O?=
 =?utf-8?B?ZmZTUUh5dy9QakQ0UEpCRVVKaXdIWWVneHdEV3dmMDU0a3FuT0c4ZmFhYTRP?=
 =?utf-8?B?bW51S3NFNmJJUWE5Mms3L2hxSkJlR3oraE5FY2F6Mm95d2ZqOGl4SEhOV0NK?=
 =?utf-8?B?ZUhRbFV4NXgyeXJLK00zcExlSndwSmkvRFFyd04wN1Z5TDZBbnQrN3BRV004?=
 =?utf-8?B?SEtSNHg4WGJyaVFEd2pBaVN2cnVudWRZYkF6Y1hTQ0VSa2FjeUQ3L1ZBWTls?=
 =?utf-8?B?S3YyWVJNS2VOdUloc3c0ZkltNFNYeHBpd3FuNWdXZERzck80VHhzYWc1dHJD?=
 =?utf-8?B?cUJIaTBTRkxKQjVIUHJNTEo3c0FOSXNyQWRWbzkvQ1BoM2kzMlhxRlRpSytu?=
 =?utf-8?B?UWZYd3Q5dnZ6UjAvS2VRYWxid0lOQ20vcEpxLzlNc3Y2RW5zRnVxOUd5Zmxh?=
 =?utf-8?B?MTdnZTMyRDVMU3FIWnp2aGlxbzVqalJMR2t3OFY2Q296SFJJZ09WdFN2eDJ0?=
 =?utf-8?B?NkZtNi9QeEk0MkRYcTY2dUp6MmhIZUZhQ2RUeWlZUHhBQnhaSTRPSmx5Uyt4?=
 =?utf-8?B?MENLS2kvSG1vY1hHdDE4L0RvRGpjeDdoZUJkQ2s1RVhWa2YyZzUyZ2JpRG9S?=
 =?utf-8?B?bS92aEN1VDhWMGJGZEkzM3Zza1dRdlRSVXlmUzNGN002SUxKRUZ1R0x2WElB?=
 =?utf-8?B?bzBoOU5yVGxnMnlaUDUwMGtLSzJBQ2ZUVi9oM0t3ZWIwVnJsWEFlVExaMlVR?=
 =?utf-8?B?cUZTb09PcG5BODYvb3NibFhvcXg1V3o3VjhlWFNIbDdwd2l6NDFhZlpTczJV?=
 =?utf-8?B?UkFHdmsxTllONUEveW9odi9LcVVwM3ZzLzRpUnFJSDRiditFa04xbTlzeUtH?=
 =?utf-8?B?R2plcW1KQlg2Z3o0dFJjV05weGVCL0w3MWc4OVpVajBhbGF1UjNsbHdWM3hq?=
 =?utf-8?B?OWQ5SUViRElqYzhkTmd1NUtxVXhlYTdyKytobDhTcFJWK0J2WnIwOGtJZk1p?=
 =?utf-8?B?cVZEVVhqeVU2a0VHYjFMMUhDbUdxNUU5Ni96a3RoSVV3MVRzUGVpY0pESm96?=
 =?utf-8?B?dmk2bzdpNFA1cmtwTTBkOE9rQVFCK3lIdll0ZDZwemt6K2xOQ3FIM3hzTHNL?=
 =?utf-8?B?T0dhNDJtY251TzBCd2Q3RDZUdGtEczFQQ25mS3BjTnNyenhRUW5nZWsweWtM?=
 =?utf-8?Q?ImCJ0DQeMwSNaPtJu/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a4f86c-79dd-4645-e321-08debbfb3993
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:21:21.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1faoLuXUldJhxa3WJiNI1v3xQ++kWxYCWCSSW7Yc8cI5MqVuoVkjqEIUKCTNE8m9k4NRGCSe6IBt6+ADjzWlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825


On 27/05/26 18:25, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
>
>
> On 21/05/2026 16:05, Sumit Gupta wrote:
>> -             err = icc_link_create(node, TEGRA_ICC_MC);
>> +             err = tegra_mc_icc_link_create(node, node_id, TEGRA_ICC_MC);
>>                if (err)
>>                        goto remove_nodes;
>>
>> @@ -957,7 +969,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
>>        if (IS_ERR(mc->regs))
>>                return PTR_ERR(mc->regs);
>>
>> -     mc->debugfs.root = debugfs_create_dir("mc", NULL);
>> +     if (!mc_debugfs_root)
> That's a probe path and you created a singletone. Looks like preventing
> async probing for no real reason.
>
> I am very against singletons and debugfs does not look like justified
> exception.

The singleton was added so multi-socket MC/EMC instances could
share a "mc"/"emc" parent. I'll drop it in v2.

On single-socket SoCs, the "mc"/"emc" names will be unchanged.
On multi-socket SoCs, each instance will create a top-level debugfs
dir named with dev_name(). Same pattern in tegra186-emc.c.

   if (dev_to_node(mc->dev) == NUMA_NO_NODE)
       mc->debugfs.root = debugfs_create_dir("mc", NULL);
   else
       mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), NULL);

Thank you,
Sumit Gupta


>
>> +             mc_debugfs_root = debugfs_create_dir("mc", NULL);
>> +
>> +     if (dev_to_node(mc->dev) == NUMA_NO_NODE)
>> +             mc->debugfs.root = mc_debugfs_root;
>> +     else
>> +             mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), mc_debugfs_root);
>>
>
> Best regards,
> Krzysztof
