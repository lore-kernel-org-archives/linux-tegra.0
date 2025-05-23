Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5175183CC3;
	Fri, 23 May 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747998096; cv=fail; b=pcavqk47v7exoqmSPlIBZaFVo9Tmoa+TiNySTkcVKP7rBJE1mXuhvNzpzYz41nxA+o6hj6oFQZ3fdJ4LCyrxKmm7+U8w3Tig7UnR7sLl7bKW0BsIqnN2W/qHG2O0SFZ4RFH7luMfMWk8QBVkBvf+LM8VmBmvPCDrM1qC6yQ3eCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747998096; c=relaxed/simple;
	bh=Clm2jBkQPY17wcACQp0Asg7PyMGli39KSURmAo/c3zU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XG7nJf5/zGpQaJEcjioX4bOXaAyCq5ps8lTI0jiEtoDkvPx8P3JW+K7djoz494V2OCHUhrszzhyydCRQpwvE+Hj6AsAopBJhfa5KdfTe+BDNQZK7nwrlngK10bpEntR1rh+IGV/bpeeoy34bNuCvJ3Ynvtcd7bcyxYQhM9VNwZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bHKdSWhi; arc=fail smtp.client-ip=40.107.220.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bHKdSWhi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDE6Nr8CTmfarhhss343+m/QMGHk4NJuloLgOEGgyRyMjK71H7DPTkJXvr8+m7biNhTUH8a7p4tmNqCB9TlNOGdhbG7o2OYLL/bwjzb/kB0kf1UTVlTAFKE95kB7lUQnW2gYWyb+AYWjy/p3bytHq4W97hiWYjKhB35Z1s/OPm2XG3zQdnDgw93+JI/DYaHrYczo4x8B/jgsEBUKORAeOj31X2O5iKV3CiKkbk9EoRmD/1uRkdEjqrrrDJ4c9/c4cI6Rvf7/hnaITST0PvEsrwAQ5mnfoxnd80pY6bkfJus/MjOtKDJlNYber2RZkKSuUs3E1aeQHAvncE4JvtOy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMqNhItLXwIBpZ+Onh+riPLHwSRBc/uCz04osVml1Ik=;
 b=rqBTujy2NqRSq6k7RVIRZ78RM1Hc3HA+LOdWqxJ4zDGawE4CmmAneX+aNGEc0diX16cDU2NQ31DInjhgfKxVdhZ3o7DpLbe1yHxaDv2dPo6lnm3zBk5XRvpTRlJz5ppL2a1Bd2oAnlf6blDdpIT3TsN5zc1CoeFDauLfol7zdE7wmeitSf7pfOYEOWghBmFxpp5UUtX3mfTKc7s1cBec+QdmwwMgm3up+uExwO6b1P3LsUuH48N/UJOd1K5T725QAV2NpCYMocS26xqQphfe8sJ3rf4Xyn8bLlt/KQmqduSwg3AX/79fmKJLcKxfJW1qBAuQaWIPE/QyRIXDuPo4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMqNhItLXwIBpZ+Onh+riPLHwSRBc/uCz04osVml1Ik=;
 b=bHKdSWhiDneY3q2YVxtXr6FzMubLlFxzKYUHotB5CBxwy/Cr2uxtmkqkClSldmd7pijbKD+J9mXlnz/7VrgZ+sYeMyKCYS3VipbpwUrWlkKKKmOhWXNX6/np+6NqW6+n2/UoztKULyX5wpL4c8vDul+Y1JFoEghBPu99k/Edf3LMo3bRxbOh4D8Oxg74rmCBVBNku7DEiHFFOYEyZEVJulDdaAeH5BYBmO9xaseABIMPWN24UosRfYL1C3LVbVqmIyrVbnYmP9ZjQ2AmBPPHNa5DvP3CJ7EVR36rmZsO+MX8dsnDcX6jfhmkNHEdIqNtzxdzhHYKstoJO/lFLdnupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by DM4PR12MB5746.namprd12.prod.outlook.com (2603:10b6:8:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 11:01:29 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 11:01:28 +0000
Message-ID: <897155bb-da81-485a-869c-da587e063bc2@nvidia.com>
Date: Fri, 23 May 2025 16:31:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
 <52681983-2fe2-45da-b0ee-1e9452ed469e@linux.intel.com>
 <1328ff08-1de7-4c62-b8f7-b09e15f50737@linux.dev>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <1328ff08-1de7-4c62-b8f7-b09e15f50737@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|DM4PR12MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: cc037117-8138-4b2c-c551-08dd99e92b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXFINVVlVTVlaTlrRkdQc1dMRWQzeVUwMzk1ek41dW5rRHhpRXNKRHF1RUNF?=
 =?utf-8?B?cGMxbGtSVGRPdmhSaHArTkpjbVJDcTZETUwxcGxMeGE1NFhIYmdRYW9oWitj?=
 =?utf-8?B?cUVxTDVhSTcvd21qcnIwTnFiVnYrTGNrQ1Q0cExmWGdOK0xIdGhNV2NZcVFC?=
 =?utf-8?B?Q08zTTJsQ09Pa09GZTNlWTU4Wmh3WndLNzFiZkZGRW90Uzk3cjJCbGdXN0E4?=
 =?utf-8?B?eG5YY1JsemxnK3A4Z3ljTC81THVJUmNCOWd3WHJETkJMTUdsdVNRclRWUVNj?=
 =?utf-8?B?cUljMzRoaXVQcW9GbE0zOXRPWkRPZEpHNE1JM1hDSnNOMXFJd050MUJXVEFp?=
 =?utf-8?B?SkdzUGpiTm02eVJjV29ta2tjUERwbGIvVWUrR3RXUzZrUEJwN25aTkhQOEJW?=
 =?utf-8?B?WTROcEdGZmlwT1o5SEVjclpPUWwzRlFteStOdm1ub1FIR3pmQWpVRTh6RnNj?=
 =?utf-8?B?a2p2cDJFQWEwaFU3V2ZRNVpBR3hrU3AraE5SVjNIY1pMQXdqenQ3S1VsMDhO?=
 =?utf-8?B?eGxEK0VjUTQyVllRN3JVUjFheUVwMFA3bjd1bTEzNzFJdkRYdERIejNCSHRm?=
 =?utf-8?B?emowbm8vYit3T1JDeTdvY1RuTVlEVUhmV1FlbThBcVNFdjk2MHUyQ3dNNkov?=
 =?utf-8?B?YkFLNUZDdzJDZ3FheTBGUFhyeHVKS1ZWMHBIWkNwWForS2Q2cmVTWGVqT3Zn?=
 =?utf-8?B?MUxGdG9qdkpQV2NGT2VPOVdwY3QyY1E5UHNNa2NoTVE0aUJNd1F5OWFpYnVU?=
 =?utf-8?B?SzJqaERLdE0yNkkrNkdyaDYySzlkUkNqWnlUU3JYR3c1LzVWeUZKZnJkWm13?=
 =?utf-8?B?dUZMRWFWS2hwbDlodTV2d1Nva0FEaWZsVW1iUit4cmM1MnJvS0o5WmpRYnpE?=
 =?utf-8?B?MGFhakNPNXlvSmxMNVF0R2VmY2dKUERjdWRLWEJ4UndJNzM5YnRUVWdMSDhO?=
 =?utf-8?B?OW11cnkvVCtJUlhqekJ6QWxSTnIzMEg1eG0xeUxNNy9BaituR1ZmY2hld0Qz?=
 =?utf-8?B?MUZ5SlYxYndXU0dyWGdlcU55aTRwaXFKWlJTUElxVStCQ1c1RndBVU5BelN0?=
 =?utf-8?B?YXY4SXRqTXdkMVZxdm5IbWRBQnFpdXVRUHI3bVhKZHRXeVlBZnMycXV2eVht?=
 =?utf-8?B?QThpTFlERmdBT1E0azB4ZG1YWnVOSzJPUVpRRVk5TzV2QXdDOXBCbEIrejRL?=
 =?utf-8?B?T2h0ejFmNndiTWhYek9oSGxLT0k1dzlxaTdqK2cyYUpDeWFZVlQyS245a1F1?=
 =?utf-8?B?ODdLdGJQY0dDSGhDWkRGcVYwcHFMVGlKV3JiL0NKdS9nRENaOW1pVHZlT3l6?=
 =?utf-8?B?NjlFeUpoUHpGOW5PelBvK05TMHpoZ2swOThGZ2I2cTBKNk9xZksydFpoa25s?=
 =?utf-8?B?QzRsQ0pzRDhrVjhLWFdkQXFZYWF5cVpicWQwRzRRRHdpdXR3ZENPd3AzdXk4?=
 =?utf-8?B?VnRCeGg2ZUIzRERmNURPcThHTUI5ZDBZWmZWUWVhS2JJNU5EUEVybHVLWi9G?=
 =?utf-8?B?L2hFKzBBYlZUVXhYODZDS0NJbHNrbjdxS3NJSWtvSXY3MjVnK3NiejdERUk1?=
 =?utf-8?B?Skd1K3RLVWFnUkZOVURGRDFhUXcxWld5NmxFZnE1eStvQ3h6L0NlNTRwK01D?=
 =?utf-8?B?NzZqcFhLYlZVb2c3VnhKNFhNUjh1bjh2bjBLWFdHSGpsYmtDOTFDRjdFa24z?=
 =?utf-8?B?SFNSaWZmaG9nTjh4WlhqblgyaTBpYjJtcml0MXZTTENpb0d5cnRsWVhtNkNT?=
 =?utf-8?B?U0FwSWxxcW5ZbnF2alN2d283aHErRktDOStTYUVDcmtIVVVydFYzVWZPOXlR?=
 =?utf-8?B?dFl2UUNITWpsWXNBWk9OZjF4blNPTjNWZzVqYndLRkFxeEJRbjdvVVZJcmQy?=
 =?utf-8?B?d2RldVVValpkckpyNE9OWWJ4K1lQeGZ5eG9YTk9USFlkaFBTK1MybFcvV0xI?=
 =?utf-8?Q?gPBhPYP6vZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym52czVnalFxMWtPT2EzZlYxamVsREltNkppVzFmZlB6Qk1DZ3poOS9RL0Er?=
 =?utf-8?B?TVEwWEMvRXdzZ0N1QUg0aWlPdDNzbTUrbSsrSjN0WHk1Wk45cFZpUHlRZ3Z1?=
 =?utf-8?B?RW0wZnZTU25RY2hQSFAzMXU1Q1dzYkgzVVVDV1lNUEZoK1F5OFRyb3ArNWVT?=
 =?utf-8?B?emdvc1V0ZkE5VHlxVk1hNGR3aDRRSmNpKzV4L2RMamsrNk5hbGVLd2M1dFhi?=
 =?utf-8?B?VWgzWnN1VS8vMkEwRjNlSWw1WHZBUlNndTFRdkhVN3BoSTJHRWdlditFYXRJ?=
 =?utf-8?B?dzI5ZHNwRkp2RlFKRVVwQjlNcEV6Z055VWE5UklZM05TOHBIODMwQkVDQ29u?=
 =?utf-8?B?VkhhMFRNYTE0NTZuL0IzaElsWERPSkRMWUNZTnhtbWhjb1hLMVhMc0l4QTBi?=
 =?utf-8?B?dXlTTjBpN2hLbEJ1V0FmdFRrRkgyMHFJUHJIaW9tRUlmSFhETkY2d1JzcmU2?=
 =?utf-8?B?TlA2MGw0b0JCUlBjMW5SWFBYb2lHVnR3VEdoRGhtQzFSb2VtUXE3by9DWEhI?=
 =?utf-8?B?Q2FocE1uditPb1R6UjZwSTJDaTRtcWF2MWx4WGpieEtaVlpUajlNcEtuM0dq?=
 =?utf-8?B?SVhZc21OZUNXbHVnSzhpOXBtS1ZSY1F3UWhlZ0l1REQ3V1orOVJGaVUzem11?=
 =?utf-8?B?elpYQXRkeXBwUTJ2TmEzdmNuZjN4RkZYZm1zelBiZWZBeFpLNDlOL2crUWlG?=
 =?utf-8?B?eWxCNnZvN29SV1RMZUR2TGEyWUtBSnRudVBVbnlZTFlGclJTNWJOMWlRNU9M?=
 =?utf-8?B?U0hnODJPbkNCZit5TlpNQVA4aktmYUZXOFlHYm9PZld2YUNhZTVkSW5tdTA0?=
 =?utf-8?B?QlZuckN6Ni9ySngvYUhXa3BjS0RURWRIRWJLUWxZa3N3cE9zVU9yVWhsMjVF?=
 =?utf-8?B?akRQQlVyNWo4WnJOZy8xVm1yOWNrVC9GMXA5Z0MrZHpMYklCSEZzc0ZERFBz?=
 =?utf-8?B?ajVxeGE1K0IzcEhoeUtvK1h4OVZzWW9CSFlOQy9MMVYwZXNGNDB3cXZteitl?=
 =?utf-8?B?cngwZlIrcXFnVE1NWFJwUlRqbzBHUjgwYkxBdnRIbGlFTHczU1RrVWZ2NkxO?=
 =?utf-8?B?a3EzOHZkdjZXcWdVY2JoSHBNU2lNV0pIa0xOOFQxR1VCSDNWUUZZbFN5UHVL?=
 =?utf-8?B?SURaTlpldDl6UDZ6R25qcW5VYVRmZzgrMC94OEE3b3RIdHJFcVBvbVd6aGVG?=
 =?utf-8?B?MDQrYVM4U0hqMjdYNFZ2dXNKbVRQTjFQY0NhdlF4cHU5a3ZiZ1pMSW5ZY0NF?=
 =?utf-8?B?VkQvSjJaZnA3YlUrRUxXcXdWajlHOXdITGZYSkpsbzBkVi9mOUdmVnM3M0J5?=
 =?utf-8?B?eG1yMTZOWVpRamxoREhWRHIxUjdMR1pRMTdwREJyOFYyU2JCQ282em5FZTMz?=
 =?utf-8?B?L3BQWkJCWXNFdFBPYWlxcTg0dVhsQ1dQMldQM0xvUmZHUUQ4dHZmT0tKbklB?=
 =?utf-8?B?UzR0L1B1SFo2NHVKd3ZGcGlzQkt2WG5OSVFmV0V1eWhVSVJ6dnYwdjZoRjgr?=
 =?utf-8?B?U3hQTFRlamM1cTkzTVdNWkRqNDNVcjdnNXRlc3lCZmdQdlN5VzllN1NBV2Qx?=
 =?utf-8?B?ME5WUnU1RDBReFR5TmFaeER6UUhVamd2QkhFSHkxb1F2QXhYcEtWZHdZMnNa?=
 =?utf-8?B?UWZTK3ZPT2Rxb1k2UGhVSzdRZWRWZjFXQ3pxajc3UHRkYVl0Um4vc2tEaU1S?=
 =?utf-8?B?M2hKL2VBcm9YQXBzb1BWeUtuVTgrelNHdndUZEd2aUhkTGNZLzdMcHNHWGh1?=
 =?utf-8?B?QTNHcWhnN0lmZE9IeUFpbUxyeEM4Z0ZmUlVSZDhNNWJGNDdlSFFOWEZBcGtR?=
 =?utf-8?B?c3k2UlVUTjRTNW9TRzlHQWFINU15K0hUWGpWVEhjYjV0RFJLNmh0STF4WHpa?=
 =?utf-8?B?VUMzeVJHSlN4RDVmU2RSZWxuL3Z3QTZHdE0xN2tCWVU1NjVvOTRiZmpvanZJ?=
 =?utf-8?B?ejRFRythZjU0SUhjcjdKaFlyYzJMOUR4Ums4b1UrN1JScVlnVTQxNjNCbE1w?=
 =?utf-8?B?WVZIRmxPcHgrZ1NLci9oVkEvOVIwdnFNWjNhZUNsakNXUVZ3dTBmc3FpSTJT?=
 =?utf-8?B?NzcxOVpoN05TY21QRURYcEpSQUhqOXlLWmdaYUtWanlrQkJjd2V2ZVYvby93?=
 =?utf-8?Q?x8IhlfrUbmrKmZORWDx8oKuEg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc037117-8138-4b2c-c551-08dd99e92b07
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 11:01:28.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOvX1f7E8JvMH1CrYZNYE3gQ5Dwp5hqoQf8OU59T0obJcbqnEYIcfSdhEtCqIVkswb4RZzEYBgvoSr3Zb/PkmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5746



On 23-05-2025 15:25, Pierre-Louis Bossart wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 5/13/25 13:10, Péter Ujfalusi wrote:
>>
>>
>> On 08/04/2025 11:30, Sheetal . wrote:
>>> From: Sheetal <sheetal@nvidia.com>
>>>
>>> The hw_params() function for BE DAI was being called multiple times due
>>> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>>>
>>> Remove the redundant state check to ensure hw_params() is called only once
>>> per BE DAI configuration.
>>
>> The first sentence tells that the hw_params() of the BE is called
>> multiple times.
>>
>> The second sentence states that the check is redundant then tells that
>> it is removed to not call the hw_params() of the BE, so the check was
>> not redundant, it got exercised.
>>
>> Which one is true?
>>
>> Under what circumstance the __soc_pcm_hw_params() got called multiple
>> times? Was it normal or was it error? What causes it?
> 
> I share Peter's question. The code has been around since 2016, in what case would the existing logic need to be updated?

As such it is not causing any issue. But I think if the BE DAI state is 
already SND_SOC_DPCM_STATE_HW_PARAMS, there is no need to call it again. 
Similar to how dpcm_be_dai_prepare() and dpcm_be_dai_startup() won't 
call BE DAI prepare() / open() callbacks if the state is already 
SND_SOC_DPCM_STATE_PREPARE or SND_SOC_DPCM_STATE_OPEN respectively.

For example:

When two or more streams sharing a common BE DAI are started 
consecutively, the following sequence can cause multiple unnecessary 
hw_params() calls for the BE DAI:
(1) Stream1 hw_params() called for BE DAI and updates state to
    SND_SOC_DPCM_STATE_HW_PARAMS
(2) Before Stream1 BE DAI prepare() call triggered,
    Stream2 dpcm_be_dai_hw_params() call happened and now BE DAI 
hw_params() callback happen again unnecessarily as the state of BE DAI 
is still SND_SOC_DPCM_STATE_HW_PARAMS.


> 
> One key point is that hw_params() may be called multiple times with different parameters, it's a feature and not a bug. If a call to hw_params() changes an internal state, a follow-up call to hw_params() shall undo the initial state change and rerun the appropriate configuration.

As per my understanding, after hw_params() callback, prepare() will be 
called and the BE DAI state will be updated to PREPARE now, then 
hw_params() callback for same BE DAI will not occur as condition will be 
unmet. Not sure how the different parameters will be configured in this 
case? Please clarify.

> 
>>> Signed-off-by: Sheetal <sheetal@nvidia.com>
>>> ---
>>> Changes in v2:
>>> - Update commit message as its not a fix.
>>> - Marked as RFC patch as it requires feedback from other users
>>>    perspective as well.
>>> - The patch is being sent separately as other patch is not RFC.
>>>
>>>   sound/soc/soc-pcm.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index d7f6d3a6d312..c73be27c4ecb 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
>>>                       continue;
>>>
>>>               if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
>>> -                (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>>>                       continue;
>>>
>>
> 

