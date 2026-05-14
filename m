Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051C3B19A0;
	Thu, 14 May 2026 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745816; cv=fail; b=p+Xt0FDI/l/ct/O2ctzya4oAkCjlRRWtOqmLkYLGrJ0yokuKRpW5xzk52HitwrkPf8GAUBUtk+bw3R77qfUC9EKVBAs6TGDqOiESl5y0qiFglKCDhuyDb6uI8WRhfwE6FSrPUR9L6PAs76ane30kRJZ0OVLUzQ7VUE7ME+5CxCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745816; c=relaxed/simple;
	bh=KrX91zWvv/u1xQdFYNDkLstreSVNnmJFojkIdgvNcqA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=exRog92x6D9pwh+fUWVjhlvjNw594KZmyV2hcmqegXMgmhJY7HfvfcyoWvncBnctsoOP5RXpyaQAWJqWcX6mV5ulOf1qCjrg3Oj8geB2nJVY8hHKXXRXWFR4jW4XBN3OSeMGqRo3AzuHu5OJABNHiTvC/puATgasoc65mkKZpYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NCx5Z5mQ; arc=fail smtp.client-ip=40.107.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NCx5Z5mQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/395c01Qn6yutgXaVjIPSwsIRlUOZL97r6jvEDHSrAqwXsq4QmNACTmoZUMR8fpCesF67Tgd+bTdUhA4zVavbDMHTVOS+MuxFrBpi2tdyDHtjHJ8p+FlQ7w84EJO0P0j9az8gTbjmoPGDq17fmyp/DbAOOD1UIM9aEEQdfNYG8h59Y+msyO4jBkeDhyvVXp41yM+afTpuJV5IWujFE1xqm1JkQVaOKW0ovzEEiP8PMO+VJL5FcZ9HqqpqEjgIQXhovuPH6x0kef2GbqKOiwBGGwvec0cx7nRV2L8ny5WF8kamNpMzHDLl7miEtPYOUIc6bN9LfIHAW3598rf8AH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/xMHwkLrujIFt3Osc7IyY8b9pvxuZ/4aNh9oWIVHJE=;
 b=jf+vrsqFmC9ji5NP02LmAS/X4TXBp4ajA3skgj//5SdocH3Tk+B2MiI3yYeXA+cJKXQabUX13B+D6sW4nrTel1xqzaysMuahTWg04/eN5C+Pwegfmx985bcLSTfG+3xHZAwfzjek44QIeXnR7gnCXgYGD5AJRvY0fB2VN8tAPdStV9yCa4YHwbjXbZ0RlqIZUA178L4Pc1uvF1ywZmNO2qZnCsASnb9qQmiBCIHe2pKm3uT9m4mjEgLSmH605rC1cqN6nFS12ifmTMptGFyWpHw5UFbLJSxiIbuZO4AWY2Ca1J4+kdliDc4HtChPLAstRuhS0wafehaD0fLXftlAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/xMHwkLrujIFt3Osc7IyY8b9pvxuZ/4aNh9oWIVHJE=;
 b=NCx5Z5mQgQYDxDYjej/ev8kJ0hjSRBcdjmY88pUKaMD7PzjVnJVE6NnUGCd6XR8VDkP3o4qESRknpjH1+vsDSA7y62gE2NjhRQEwEa3Jrh/qUAa2LttfGpQQhmBIcAEGWhiQL7XbDH46vMNmksykfdn2vee365ZfG46UxDkmMbNVkRTPSN9zHU0WePPlOHa192gg0vV/4f4JqpQ+AdGEFhotgualVg8l5p78fKppyyq3fY+m92y2f6HQWBZstXma+FvanZoEG0NNIyxQkxm2/l4LfAD8kEO1i3dIn4Y80h8NRmU8DW29VKxgGngcum3hnthAEC1Jrg9kroVCsS06AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ5PPF6D27E3EA3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 08:03:31 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 08:03:31 +0000
Message-ID: <2a75a688-2bd8-4f74-83cd-7da80538795e@nvidia.com>
Date: Thu, 14 May 2026 09:03:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soc/tegra: fuse: Use device-specific instance in
 suspend/resume
To: Kartik Rajput <kkartik@nvidia.com>, thierry.reding@kernel.org,
 kees@kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514053518.2402597-1-kkartik@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260514053518.2402597-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::18) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ5PPF6D27E3EA3:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b1e34a-4bc9-4474-3090-08deb18f49e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	G0Tza4KmSovhA+JyYn29+Nu8l9pg8I95L1kl2Vc5TCLh7/EtSCrcGb42zaGMUOVAIn5gML1n8Ecgb8c+9aYI0o73AbEwhXAMD4JPOMH65TpYceupeGmsDGCn+MPb3M/miqe82/2KZ3Wu6vj+W+gai2e8O+pXUQ9IBgMwpGGQVqv+ESHCbdND6l3KwrIToqB3KFbEA9J7YEYceinAyQVwjBXxcJtrZlI9JGyI6Dof4+/SByiwIZegQ4Xlopsi1/3gQ68ACvlL/z9GDbJvUQZoRKlSyrkbU8ZSpSyfnw7PmdZhSKR0viMpJ33cLsBCq9S3sgLgB0/4JtvHoM3tcAYYi5c618IppQg19eAr0aJM/+sZPGJSGsRxd2ywSIodlh5YHNu+cd7ywhKvjDptebrqI1g3B07FdTScuxNo3wzukYDrSHCI1wPbz/r+zg29fkLvs9wpHpcLxwEYjM6KVO8CwumnW5hc8gI6gC1Q39aPp384hD9PHc7E0BLFj5DSHIfXkbQJnDTvM8XTiPbYpeytgcbwLGnjRirz7tveyOmmM0CDOOTM4yKCeOBqfH+HhDMVpw2CAG8IzF5A6ef6c3q56jLu0FoF47d7ZbKcfLb3ppguD4u0Mb+X04ypJVYZP64dovWoXabU35NxYItAyrVRHNT9itMvi/yaf6iUzJVV8MWqg+7Bnl+6d26AmpsAouNP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDBRVHZlZDJNa3VnbnVMZDlDOXJxL2Z3dk9Sblo1ZElpZ1p6ZXR6ZUxpWE91?=
 =?utf-8?B?OXRFWmVJV0l1MVhONlpmYzl0dUlseW43anNwNjYyZElOdituZ0p6ZnZLQ1lt?=
 =?utf-8?B?NHFrS0NBbVA3Zk5jZzlFcEF1dU1zb3VxNkFCdVYyZGhOYlU1OG5NN0g2WkdG?=
 =?utf-8?B?eVc5ZFFXMHZ5c0Jibmd2YW9WTVRTOWg0YVRPRlExbFNUaWpZYkhUVWRvOGVa?=
 =?utf-8?B?Zmg3M1N4OUk2ZlJ4Zk9DV2ppcXRqcUUzbGxrSy9kbGdDWkpJMjZ1dEFXQmQz?=
 =?utf-8?B?bXgwd1Y4cVIvdkpRV2l6SlRDL0dVelQyVVNxQ0lOWlA3Vmg0WDlocTRIK1hW?=
 =?utf-8?B?ZEFvUXllZUMrWWV5VmlnaXJOMy9QVkJYdFlTMkFyY0M2WU9hZ0laSjhyMGZt?=
 =?utf-8?B?aEhDbzdkWjFkOE9JSFZjbVVmMG9PQndMZTV4cnNuQjFiR01mQmU0RldaWTUz?=
 =?utf-8?B?d1I2ZTFQQW1BSEhKN3duWWY3cThBN25ySDdvUFNoSytOS0FtRkxXNVJpMXkw?=
 =?utf-8?B?ZjM1SGJBNFMwM25xbXlxemRuTi9rQmgzdmJoVjM0UlM4cVBJUFdmTExRRm5F?=
 =?utf-8?B?THpYRW9nL3hEblhJWDk3aks5K0FJenY3b1JEK1NqdUhDZ3VXd05VdnhmZ1hl?=
 =?utf-8?B?ekxhbWlhYkd1RG5EZ0VjMjFJTUVnaGNhQkFQOHNQK0FaaHdtZnpIL1ZIWnJq?=
 =?utf-8?B?dUVETXFWOGVoZFpwVjRFK2I5a29VNlcwLytReVJ6YkNKdGhJSlMzaFErc2xt?=
 =?utf-8?B?TktUNEtZcWc5QWZsOER5ZlFqajZydldpdmxvaW4vc29hL0NwV1hVdlhxZ002?=
 =?utf-8?B?QTB0a3lkU3NpTVJUWWFhZFdJdXBXZ3l2WDI1Z2JYVVd1S0xRMDNtMTlWRUlM?=
 =?utf-8?B?bG1IYmlrc0JFZWFBU2hVT0gzak1hK3c4VVFnMEVsQzZCZ1NwYWZoOGdmSnJh?=
 =?utf-8?B?aHhIY2cxTm4zc3Jib29SMkhqc2ZIRmx0RGJqMUZoK3FmWEN0RnpxeStJMmNj?=
 =?utf-8?B?UG83ODgvS2ZpbkJ5SWsrYzMyeUQ2aHMzLzRzdDByaExRbjRlNUVOSWVTODJJ?=
 =?utf-8?B?MzlTVEU4dldHV0RzaktBU3hyLzQ1ZGVyeHdDVnc3RmYwelBpK1cySHhpME5B?=
 =?utf-8?B?UmoySmtoSXhicmZ4a3QrREs4dFpqNnBKT0RKUmtWV1V1aUJ0UmFyK3lqSVRP?=
 =?utf-8?B?UjUyeVZ4V1owelh0SFNuWkZWaUJaMFJaM09QNWdpSndIV3lVa3VEeDdUa1Zv?=
 =?utf-8?B?YWZwV1cveHlFcU50YjhqWTRNYnZQY1JibUxmTTJkdU5tY0duZ1ZndUNaUUQy?=
 =?utf-8?B?SVZxUWFISVZhZlpKS1ZvQmhjM2JGNHNURXZZb0VhT2I5RG1tZXdQNGdWN3Nr?=
 =?utf-8?B?eENaczFETlBkUU95S1JWb3ZneE95MGtTeG1yRFZ1VnllQVNaaTM1R1ZzWVpQ?=
 =?utf-8?B?M3VjcFNORVhTRXhlRHZ4Q01nOHR6RmhXdExsdWh0K1lyZ3pucjR3NzBxWjI4?=
 =?utf-8?B?MG1CaUY5LzlvcmFWb210d0sxaTYyKy9VTFQ2SDc2MzRyQnFRZy9xbjdVWWg2?=
 =?utf-8?B?bUJ2UHRMb0I5K09GOTh0ajU3aVpmTnlZRmlra05VbUloRWQyOU9KbmIwb3B3?=
 =?utf-8?B?ZEFsazY3S3dyM2JvUWowUWZHN3doQVZtZlczekNrNHFZdmEvVFhISEgxN091?=
 =?utf-8?B?NFBlVEhocitXbWQ5RUlDN0M0clBQSERwOWV6UWpJcjViMlUySUJqek9Uc0R3?=
 =?utf-8?B?MlVaYU1uTEYycDJNRytRTit5bk9qcFp3bTlxSzUzcCsxNnBXWkU2UEk2dElp?=
 =?utf-8?B?dU9SL1p2OXN1WXNVWC9ETTI3bGJINVVXWXR3Q25VMFN6ekdENXhEL2tvVVk5?=
 =?utf-8?B?TFlHSzJxZS9UUzZIclphNWhSSXlUYXJJem4rUWtBd1JBVjRBQ0FQY3N1TVM1?=
 =?utf-8?B?SEZ5RU1RRlFWWkFVcmNQNmh4VmxGZUF2a252aDVxVW53VDJaQVNPSHRLVmRa?=
 =?utf-8?B?R1pxQmVqQ0xKN1cwWDhOWHRlS0tJM1cxaWpjeVNvQUJ0OXFPZGZ5aHVJcXJD?=
 =?utf-8?B?MHNsY3FOZHdMUEtRMUtHMGZQV3p1cElJY3JFTW5Wb1oyTUxJbHZsdHNXS0Zm?=
 =?utf-8?B?TmxaWFB3dHBqU0ZPbXJENlIxdzlrRlVtdkMrQktudFhXS25tSk9kditmUm1y?=
 =?utf-8?B?R29yVmtqaThMYmh0andBWGlPV0Ztb3MvMFIrWXFIVVJkWXRaWFEzR1EvR0ls?=
 =?utf-8?B?T3EzQS9mVXdqVm5hQm52bDNpTkF3QkNiSE1Ta1VMNG9sQ1d6aFh1MUxGQjlz?=
 =?utf-8?B?amU5dEYxalpjYVJZNytZZFI3UUhtU2ovZytQcEd1SytVVGtwdDFxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b1e34a-4bc9-4474-3090-08deb18f49e4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:03:31.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VY96LBUehk0whyWfqWjAnbLZHcerza1f93mq/RPxoxtFGK0XdmAL0q3OstZ7aAoJM7CqKXn6tOWvHIg6ja6NsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6D27E3EA3



On 14/05/2026 06:35, Kartik Rajput wrote:
> Avoid using the default fuse instance in suspend/resume callbacks, as it
> always runs the suspend/resume callbacks for the default instance rather
> than the device’s own.
> 
> Get the correct fuse instance by using `dev_get_drvdata()`.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/soc/tegra/fuse/fuse-tegra.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 291484595dcf..f38107d04ed6 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -259,6 +259,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
>   
>   static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
>   {
> +	struct tegra_fuse *fuse = dev_get_drvdata(dev);
>   	int err;
>   
>   	err = clk_prepare_enable(fuse->clk);
> @@ -272,6 +273,8 @@ static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
>   
>   static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
>   {
> +	struct tegra_fuse *fuse = dev_get_drvdata(dev);
> +
>   	clk_disable_unprepare(fuse->clk);
>   
>   	return 0;
> @@ -279,6 +282,7 @@ static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
>   
>   static int __maybe_unused tegra_fuse_suspend(struct device *dev)
>   {
> +	struct tegra_fuse *fuse = dev_get_drvdata(dev);
>   	int ret;
>   
>   	/*
> @@ -295,6 +299,7 @@ static int __maybe_unused tegra_fuse_suspend(struct device *dev)
>   
>   static int __maybe_unused tegra_fuse_resume(struct device *dev)
>   {
> +	struct tegra_fuse *fuse = dev_get_drvdata(dev);
>   	int ret = 0;
>   
>   	if (fuse->soc->clk_suspend_on)

So now we have both local and global variables called 'fuse'. It would 
be better to have a different name to distinguish between these.

Jon

-- 
nvpublic

