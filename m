Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9213612EE
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067418; cv=fail; b=dE12C2EiB75ATAltOUaFJR9pF3aUMbjRMJlilxPj7IukdbUg3ZSeDxD1HW8n5iFH2JpyAqOV0L8XJ4nez/uhuLEcKZIc2y6Yn5iJHalrlYHI32tznqkL2YvLD0UQLuCxAJppk+Rn5JI+fVlCmhv0Kwo7T3p+HZmnv5hrNEKAsnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067418; c=relaxed/simple;
	bh=qLoNYrkucHjtR2ODUSdwdtN30H5lruaCk3ZC30uzw/A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uIKFM3Hcg/TLXruveZ8B3kw6hCFWuDNg1C1RckGV7Lnn/KOePeqWDYH42QIq08ACi+HHyhbm23TdUf/4KGT+f4kSaLiO6g8J/+IXh+W9ODmoss/odCd7rF0AeeVRXIgN8PYLfcG30Dl/K1XtJR38RHBkqMld97KFKkO8KZk2w5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qjBq9jJb; arc=fail smtp.client-ip=52.101.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qjBq9jJb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4GKgQqIkaoWyNH7MyKh+cu1oN+dNl6ZeTcOeYIY3GfPWw5OAuDHRUjNqzltKvgDqYtxqr67nCCc7aN35zZ7km7XQNWVXr5YZnSSd0h6R26wqRmqX/doSf908PAorX2zbPrDIhiWyqTlSauSo7I5/QIkUJWX4QYtW3+7dVa+2hxB/2qqLnQH4pZO3VKc2F+Zrji5hr878xoXa7UEAf8MiIq3g6Y5k1pUq4uKYD/zedLBtdAzJLc2jl2dJG1mMn2HYJP9KlROVzAvytfMF3LS1kaQPRywmlC3lrT0fLmeraJ4pfm4gNYkIRRBUNbR8h5iPzuWpv8RnIb1NLt05XMfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quyIb2V78n7GF7oSpRuoHezbliy4YoL/l1CM0WqqpYg=;
 b=lT4ETqbx60XWf50qd/RGAeYV/QU0Jp/Hw25ZiNbfpf4CjP6dmjUOYMax8XTybo92sstuuT0bqTNawineeKXzhfnNBLkdrs9cZCRrugvTC/85x0IjCMs/kLjX5bj9mJ+05PjYMBtSM+Nolgf+ZS3TIo0DQPZohvV8UFR5hJAoeWMgmRNHpIoHYR96hNiEQAr3Lrp+MzBAqBB1keAJ4r8XE+hFSvSXB+F2uPzJEDxWqGLIY2CsGEyMBDmFJOqvjZqtQgBFBU9HH01feeLdsZ7fDLvfdy9Qrfb8tgwTskBOOERRV4dqb5pdTft11rf5vdpo5EK5P68xsu7zQIl44pfs/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quyIb2V78n7GF7oSpRuoHezbliy4YoL/l1CM0WqqpYg=;
 b=qjBq9jJbvYAOz7j8MD9mELDOpZMxdDlH+00VARKUZfrJ6BQjXVADhWX22jSunExhAJJ4jsiQNXJdpSpDxDKdZs8jrrZzFsXjuRU0SVBoqMjjLNzW2Ed6ZlcP7VTFeVU4ZngLOcrSQfPyzV/Q85XHa5B6Hhj/w6PgFsnN188x16bMvucKy6jFur9o1c4NFdUPT3HuuwraDVQUMSdDhQEnJfa+xq7zK9CtyPX8qbqLWAkTHlI3qsyRhKPzawSMJT+zZW9N6O8NY9bjAFygUPRukLaoaSHieJZ57x9qTID3xzVoQuBadBQQhOU0x97tFiwPKDFeHCwd0QkmvHEGIm6eZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:10:12 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:10:11 +0000
Message-ID: <7f2e7af4-a1d9-4496-8a89-960bfa75629b@nvidia.com>
Date: Fri, 29 May 2026 16:10:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: tegra: bpmp: Add support for multi-socket
 platforms
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
References: <20260522101614.24028-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260522101614.24028-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0135.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::32) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: fc590d58-5380-4cdd-425a-08debd94612d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	z5rJDwwE1nUUzR6y60B3zBrfO27XQiKAikib69/DoqL2yrZmAvPbQqxImHHH0HSqIU+7Cg8CJVqds943Eg5BDWBwCptBxaJ+lf6+7cbyQ29SGCLtroEmmz7JFfEBxV04dugOCrCL715ON2vUV7kYlgAKAFKVi0mZl2ROPku3YzZkxxq6oU4UTxxJs8+yKMqYNCnn7+0RjAFJGkmFqfFrnX0STO9ECcJCp77id9VjbY6a8evRiuZGa0CfzaujPhPLagITGaoipybH5MO8kR0IhxYB9mGBGodFDZVJGbEmxPiin+txGy/St2umy4V6VuTo1KhvJFk9OgpG1pGyyR6n+no69UxWdmvuFyxon51opVkk5MmpprVZtPKIepUU0VkkiYj8zYjGyJi8PNhfuawL0ET+sd0wOiYeQKI9VmZz+Hp1reX6mbBGM9lQzfTbBGrPxKL71Xxx8nnzvlaGUAE4PxtPvX3e+astiK8GTQKGpIyJeUu1LfdHUeKVy42L9b+XJLo54S160P5cgEdyljFxIUu+vJzgZ2w1wrlcM4hdvagzaiZ4qNvwcLWs015RHy5+kXrjcD4lSSyhe2WYAHeek3e+xrxEIgNEQTizqgY6t2qRgCvBMjyyysjJYYKDdmU04eKsBnlcfu55QGjH8WSr9QAsquwZHggcYMeYLrkiYLU7JkDhByOGL55Kj+iZ2W14
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anY5Ujloa2dzRlY1N2kxYTBkNUhlcG94dEtwVjRZaUI4RVBKeUgrRDV2Y3JM?=
 =?utf-8?B?OWdOei9ydXNwajR5Wjh3QTI3bGpiN1VsbXd3L2FuQ2JGaUgvOVZNQ0prMjZ4?=
 =?utf-8?B?dnptMWNtaGkrV2VKMWhaWVhVZTVjekFEUFJReThiVUZYc3JOZ2ZZSVRNTHo0?=
 =?utf-8?B?bVN5Nm9RZHQrSXQxeUc0cmxLUjFnOE9Zb2NHY1BZOVROWWdxNTNQTzFDTnQz?=
 =?utf-8?B?ZW14VDJnTFlXT1Z2ZVNLb25JODZhQXZReW4zR1lvWVlGTThPamMxWld5a0c4?=
 =?utf-8?B?dWpYU1ZVM1EwNlYrWFg3a0U0RVhHWlh6WGVUMGUvcFZyZDZhWFVaN0ZOek9k?=
 =?utf-8?B?ZndaUlNwTSs3K2dKclNad0k4NmRGenJ6TFRNVlk1bFBLK241UThHTUxHc1Zq?=
 =?utf-8?B?RnNSdDYxbmUyU09sUzVGMTNQZUJPeHg2bmNHMDRqWU1xY3YyeUZWNmQyMWhx?=
 =?utf-8?B?eWxiaUN6YlVMdDZMb0dZM1FFV3BWNzZ2YnQ5T1FiYWRNT2M3Vmd0SC9yWnRx?=
 =?utf-8?B?Ri8zSlFGRWFCNnRsamdEV2hPb1B3T0g4Q1N2UXpRaDVrUWZnUGx2SlNLYzdz?=
 =?utf-8?B?R1YyVkFGSm4zMHBnTURJenZGdldMaVlyNkp0RE5aUEtka3grMDJYcUgrNVph?=
 =?utf-8?B?OEM3aHRNNFk4ZjZiZWJvUUFZYmxwdG5lVGlJQXFYajdXT1NkMmp3eGRpS3Ri?=
 =?utf-8?B?dndXbm5JNHp5aE1OT0tGQlcxWUdlZnBJdlNsY1N2QUJxaWZ0UHQvT24rOWNT?=
 =?utf-8?B?UWI4eWRvK3U4QWpiZUVjYWxwRWgxNkpWNWpoNExST2tYelA5WXllWlQvK2Z2?=
 =?utf-8?B?MTlOZHdmdkQrVE1wd3BQZTltSmdlWXNydDc4VEUzNEJiVnV2Z2ZXTEg3VUxK?=
 =?utf-8?B?OHp6ZUFUUDNqcFBCc3pPWUxvMkd0V1AvUlB1ajl0dDlZZGZKcCtQMGhmOXVP?=
 =?utf-8?B?dnkxRU1haW5nWmdmVkF4VUNuUmZFdjVJekVtVTJ4QkZ5YkpEQVdMdjJwcDJX?=
 =?utf-8?B?ekI2RldiS0I5b3VLU1JhWnRaRVJxSE0wTHd3dkdjbnJKNnlqeUZqQ3R6WVJC?=
 =?utf-8?B?RGIraWhTNENacmNsVTBmVlJNcFFkTUllS3l5WnozWVlTSy9CajUvMjNqdEV0?=
 =?utf-8?B?QjdJU0RQWDUxcVJ3Mkt2VEpLNnBOK1hkb0tib2p0cDhnTXdiZUFXUDVyNW1Y?=
 =?utf-8?B?K3BrMjYzSjJ6bm1ORlZtZEpaWUFNT0ZWOXRqaEZoTnpoSnUwRGtPY3kvbEEw?=
 =?utf-8?B?ekUvK0RBU1JMdzJXcjNwSjRLVlRpeGxULytKM09xRlZVeW5HdURMby9ubk41?=
 =?utf-8?B?VjJLVkdhZUsrL2RvNWlhUmRwcThTakF6VmVKd3M3K0Q2Nloyem1kRHNHU2xi?=
 =?utf-8?B?OUdkNi8xZGlja1hneFVoRkdleGtGdVowcjllMmF5S3plQkRGU3BGaE9lNWpU?=
 =?utf-8?B?MUk3eDFxOWJxd3Z0ZWNVeU9yZVZhMWo5amJONHZzdkFlMmFXcWYwMmIzREQ3?=
 =?utf-8?B?VmY0SklTMDFWL2ZQN3U2OW1ZcGZFYWhmVzh5amJWc001WDYzRUtyUXo2cWhW?=
 =?utf-8?B?R2pJYjRYRnB4bnEwaGpBZnBEdDJjY1loc1E2RkI4azU2Yk5LZG1JeUltYnJX?=
 =?utf-8?B?b3VaQXhlTllsT2pLZkF3N1kwb3lSWTdKcWNnSnhKdzlhRnpoWFA5RzZZZytX?=
 =?utf-8?B?VU8yN0RUZUJWY3ovQ0piTlRyTFUwTm1HbEVyUitlNkxRc3dJWVlqNmpLa0RL?=
 =?utf-8?B?MmllZTMwWkVycFhWNzBGU1MzMWZ0UGRjOWNld1Q0T3V5aEFIZk9yQ0FHOENy?=
 =?utf-8?B?MEZFbzBIYjVHNk0zS1lTNnNvVzhYa092ZG41SXNEUTV3VS9PUDMvRXRiY2tZ?=
 =?utf-8?B?d01QSGRaQmJveURlakVrV2xLR0pzd2FYR3pIZmN1dGlSRUhyenJrVGd6MDkv?=
 =?utf-8?B?aENZTVcwNzZ5Sys4R3A2R3FmUTRWWmpkSEsyOWRJand5d25HSHlWNEJ2Q3dS?=
 =?utf-8?B?YzNRaHJnclVQUTFHUlRHM3gvV1JsTlR5QUNOa2ZIMmt0SUxmeVFwby95NHFN?=
 =?utf-8?B?cEN5UjNmbjRSVk5IQmN4Wm5PVWtuQVlhVkl2RWROSm9ma1FhLyttaUhKdTVk?=
 =?utf-8?B?WVFhalBIemplUE11RUtrNGFxem44dFVEZzBxcjc4dGR3SHEySGp6eXp1em5O?=
 =?utf-8?B?bkhrSUlDL0N2bzVaQ0FjUUdDbzAzaXFkTDZzZHBJci94R29TNlVLUXprdksx?=
 =?utf-8?B?MGkzME5xOFpNSjdEMUtLcU5odldIN1FKSk4rbCtFTHdWbTBBVmNYVlhaMkVy?=
 =?utf-8?B?WjY0OHJlbUY4dVMzanljOGExSEZwcXZWRFd0ZS9aNE1kZGtiaHpCTkNtSjZ3?=
 =?utf-8?Q?cleMoxzZO8bJuAZUNXUGr976AHlFkeMyDFTR6LoA1HFhA?=
X-MS-Exchange-AntiSpam-MessageData-1: zMjuhDBhPAK+FQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc590d58-5380-4cdd-425a-08debd94612d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:10:11.7327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vw2HPfooFmWpdGagiVMHSCMXm2ZEmdsQjZyBpqh2da+Xm7O5ef7E9HJGJDWXrtx+8E+tFX+VEKdE7TUXmSr22A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247


On 22/05/2026 11:16, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP that is
> registered with the kernel. For such platforms append the NUMA ID for
> each socket to the BPMP debugfs directory name to ensure there is a
> unique name for each BPMP. Note that a 32 byte array is more than large
> enough for storing the name.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/firmware/tegra/bpmp-debugfs.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
> index 4221fed70ad4..4f15aae5f124 100644
> --- a/drivers/firmware/tegra/bpmp-debugfs.c
> +++ b/drivers/firmware/tegra/bpmp-debugfs.c
> @@ -772,6 +772,7 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
>   int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
>   {
>   	struct dentry *root;
> +	char name[32] = "bpmp";
>   	bool inband;
>   	int err;
>   
> @@ -780,7 +781,10 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
>   	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
>   		return 0;
>   
> -	root = debugfs_create_dir("bpmp", NULL);
> +	if (dev_to_node(bpmp->dev) != NUMA_NO_NODE)
> +		snprintf(name, sizeof(name), "bpmp.%d", dev_to_node(bpmp->dev));
> +
> +	root = debugfs_create_dir(name, NULL);
>   	if (IS_ERR(root))
>   		return -ENOMEM;
>   


On further review, for multi-socket platforms, I think it would be best 
if we put the 'bpmp.X' under a top level 'bpmp' directory. I will send 
out an updated patch to do this.

Jon

-- 
nvpublic

