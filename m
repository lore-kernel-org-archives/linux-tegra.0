Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320AC3998A7;
	Tue, 12 May 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593847; cv=fail; b=Dst/eBcmiMTPHzFMHl6Z+otHfJ9StNRu0+HHp/4IIIHcQKYYO/2aJS8CDZb70YbeAACmysSUdXMW4SPBdlsKxuBqjotOZg5mzQ5DlzQQjtaqpLKLcucLLp6lbwC8LtlyzWhU8mqI4OUhSCHQ+iUIXdxylbWsPa2M195tl6ShWbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593847; c=relaxed/simple;
	bh=jWzi8dUlzsoIuHILBrNxo0v8tHDzIgG0z0lp1K2HoGQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J1kdxqiaIyQHXKTc6J9jaEH9j1yWUKk7nJkSUvDyr0bt2ENNwZeHyx2zPtrH6QaCc4glhwvl+Hp22wpra7+aRPipCoYg7f57gBify5zJUwevq6M+jmXnPfooVWpsRpLf09Rh2PBjUADywUScQeObSJYE2oCiJmrw4k/H9DZRQDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QQWqR45V; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QQWqR45V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yroNaTd9t0FxJ9IpxFUmiuqvXmRu+c6Wdu+Yjlzfjvt5yzS4NK08f25+eOzdpBSXsCzibTgM/ud7x4rQTlufCKU3ufQkxi7AIWSYYV73ApHfYBEMX5kLJBWD8fSQtTioo4F2hXq+aoqqV9yrmnsU8pDCqaaMCuvZccZtkfGIWv9jbgdEs051sC7I170GtYgor1DOBbWCfJjtAypYO4IqXNB+JFsO78skqV7F4NUMWwK9yHCvlXFrw/yKEeVm91+3T5HDeLA/TPJgugH/BAE9fckkZg+3ImNqET3lJBsMVz4mP4Di/+Lh+0kqRmEU2hXG2e/I9yrN80i+PezSH9PoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUa/N6Iu5swegvT6s+VSz0idkt55Yr3QnwzuHN3vD70=;
 b=aedLJBvBdNIhVEuszzn3mhGBejxoyrlPBXuMw+3/RD7xlW7tnbx5rNYPFCRexy09efAr1h9Q4XvuP1Oh6/S+pYJK12tKparxN9qy+1uplUxUBpLRfvrfYxXu9Ib16nQ1CnPPWZ6XSsdJeGTX5agErZhdFhjnU/Su/5p4SSLJg1PToFBZiZPGdKdYOyYlbgM1gYXNSwMOR/MniO8vyNdcgIXaCLKPd7RYpiXTgBx9sUzaF4cNq6afW0+ayxjvGlGQDp4Nyk9RoDGEvQJobD4fmbIiJv3a7Bl094T8rqkFGK6WCL2Za8rfp9lLYHNVVMpPtfYxVFinTk6Za5YwSnwtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUa/N6Iu5swegvT6s+VSz0idkt55Yr3QnwzuHN3vD70=;
 b=QQWqR45VBPMuVb+HIFWYTE5m3wsCo+7jech7tOTm2/5FO7d7lHtVylNSV8iFKq64dAOIdO3fk0/yYOvhxQpJrqKCARZFX0ygOjQWaQAyA1PP3Cog8kvu35Wdq+hOmfHme3O0X6pnwOgyqgBxs5R/54H5Sm6wwAqhozffzZYAM2mOxXlKp7cJZST6xxTLF7osXhh1j7/sbd/+BEBV1Z4V8E7zJCsl20kjx44YOSwLFLJ+GOFHpNDKrSo5zBylLGIbWc+UHqQiPLA1eo1A0sez+/W8eEVmTCC8RTdamYB89TSLG1AkOuLO58+6FlcsXT9kTRyHRMavlYLu7NEAGyx2uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB8829.namprd12.prod.outlook.com (2603:10b6:a03:4d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 12 May
 2026 13:50:41 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 13:50:40 +0000
Message-ID: <d19aadfa-6b41-40ac-b3c7-b121f3a8bc59@nvidia.com>
Date: Tue, 12 May 2026 14:50:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pstore/zone: Emit registration message as a single
 pr_info()
To: Kartik Rajput <kkartik@nvidia.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, Thierry Reding <thierry.reding@kernel.org>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260426090929.1528232-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260426090929.1528232-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::35) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: ab97e611-a6c6-44d7-de10-08deb02d7458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	88J8c3fT+pu3XS2Pa6rfOP5mLJkXcMpGb9o5RS+4BcWdor4WpN26calw9ouIu+wxMmocj6rSiLNLjLWb+YmOwdbX4ymLz4ONp5Zu1UIwwC7tbWMqrTLBqxRMzR5IM9qYpiZDIvGO0du1aFpS7IkUwNNF1UhmKlqGpSh5bSiBAjdqhm6ihaKiE4qCdmd6ZSNPUUU5xOtfo9Z9MBZv0825p59tFM6iCjH6SPX7jQ7/exnlvlIItlZtCrArvJ+yNgD96W0UYTe8KPfmrA6hvYpDo7Qr8KN58AGbWcv99pvi++FFkD8hPM6cf5nGmQ9My2QyOBWqaz2SDQXYpuRHpeb1siz+DRgbR0qyMJcQyUIUebg9cijIeYJYprbJxhjwK2UvWReTAtep/PwPHbGQd+z5YjJitv4UYE+MPjO30wz8udCJWaZZYzW9kxM7+w2vtj46kRZDwRuZhDBLI4FYCaX06Tg+JigB21NlpSrDj0h2NlfqMceOtKynPwa6I4SOKZKI72ejVEP08bZ0fFV3yvucTh6yZUJWt6mMN83F2Xkza3+3bw9I1mPtEprgTYAlRux4/7zl97dS0Fdh3tGcxSkKO7yHrbIhTQOiS0ZFhFji4lcWapr54v6Iv7/yvr+BpEZYBq/U5ucyrtz115bdUu6kMQyFPx8vchKmxowNNCDg58SmQk/LpykDEOFkRyevxQ1yRpMXUEzfmnazqeWKkOFDfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnNScGZlUE1pazBzdWJRL3o0ZDlPVG5NOGFsZXA2L0hWWVVyZzh2ZDNkWVZ5?=
 =?utf-8?B?aVgxR2NycFBKU3ZuSWw5aDFiVEN2Q3d2MjVRRDdKYmZqSmN0eStMQ0VzUWt3?=
 =?utf-8?B?RWRjMjhwNG9nSmJsR3hvTUNXczVrcXpMN0pmYVYvbU8rYkc4cTFGV0QvUjdQ?=
 =?utf-8?B?OWlGWE9sSG5DSzA5S3BDbGYwZ3k3WUlDaTFYb3c2TFBHTlo3dkU1NUxyMkRN?=
 =?utf-8?B?Q1NVSGlsY2VLSU1xZ1lvRjhyOWdMUzZua3ZZM1Zsd2tKV3AwUUtpSlpoemxX?=
 =?utf-8?B?em0rVTQydEhtSlRhNVN1dVVXclFUbFJVQmNKajJPNktHc1ozdzlzNTdkeTl4?=
 =?utf-8?B?amJHa3I4bWtTczV6ZUpzNUFtZUp4UTdjMUVLamY2bkIwV2dHVGdNcFpoQjZq?=
 =?utf-8?B?eVowQ2dZQWZuUFNnRkJZTWF3MjNNV0hJMkR4MXlFRnp0TTlWRUtORUl0ckpo?=
 =?utf-8?B?MWEyU2VQejBtZEdwSkZSbXJCQkZJc3pzclpjekpRSDFEMWpLQWNLNnFGYlM2?=
 =?utf-8?B?RThQcFRPMW1TSVRuUFJJakRrRXJ6SHhYTWNQWXo2dnRIT1BTNjZlRFgzUHlt?=
 =?utf-8?B?NzZyVndEZzVOd1VSY3dUWjk2OGVNYVFkS1ZkLysvTTg3dE5FbzRCVjZIR2h2?=
 =?utf-8?B?blVTQ3ZNT3lsVjJaZjBJdzdDU0ZDVHRBV1hhWEpFZm1XZXJLMGFOL3FoeUQz?=
 =?utf-8?B?RW5wSVczZkErc2VlZUhDMkxrQStyUXJXcUVWT3B1Yit5Zk4wZmxoWkdKaGRu?=
 =?utf-8?B?cGszcWlUdFpwUVJLVmhaT3MvRUI0Sm5HSENONjBoNmpkN3pXVUoxQ0Z6YU1C?=
 =?utf-8?B?K3FzT21MbTJxejM5dXBNbTg2YmZETDNta05TOEt0RlFNUjdxdWtYRDdoTW9Q?=
 =?utf-8?B?S2ZZZDYvRDdOY1BXVEpuSlUvQ1BwYzNrTlp0aEdUU1Q1aXR2bG14NFFaSVlE?=
 =?utf-8?B?bmd2cFpsaGlXSHErMnZmUnMrWllEcWdId1pnT0ZLZ0J3dlExRnRhU0VZZHJT?=
 =?utf-8?B?aW43L3RiUDE4YkZuMEdiS01DVU9qZG5CeEhkUW5mMkxXNExjbGhVVGJKWjln?=
 =?utf-8?B?ZnJzRk0zdm8vcDFPNmh3VGxIdFQvVEVHNTAzRDRsV1RQcGlseUxKWG9HYmto?=
 =?utf-8?B?OGV5dk9Bd2o4RGhFbVNJeTRHNEgzeHVUS2hjV3VlZTVHRExlNFI5SzFLSENG?=
 =?utf-8?B?eVJsaTF3bzFOZVg3bm55N3BCWm1YS1Q3SWRLYWVvR0tzdFNQUC9kVk8ybzNS?=
 =?utf-8?B?TU9NOTk5aGYwclpvT2x3Ni9nVDZZTEFOSDhCRzR4U1JSUGZsSzJSUVdCNFJE?=
 =?utf-8?B?bmMwazFEZjZVOEhGNEdPcHFIaEdEM0lvOWE3bkFXTjlId3laYTRFT1BsQkVv?=
 =?utf-8?B?RjBETCsxTitzTU9aYjhLODdPakFvaWJiaUIzVi9kY20xaDlFaWtqbmE4OFV3?=
 =?utf-8?B?NUpUSEZHSjduRktZOFhINExMbTU3YzN0UWZmUk9vajRBZHFKR2JVazlMNDNU?=
 =?utf-8?B?RFFDK3dBMXFkYTNaV0xBU3JNbC9CaktDVXorVFlWSXFIQzBsY0owc2xvYjV1?=
 =?utf-8?B?OFU2MlcxSERhZmVzdjF0NGZVNi9jemQycmZXTEwrWEQzcUtoeHBkMUovM2I2?=
 =?utf-8?B?dktDM2RxWkJYZGZVTkMwN1kvaHFRSFU0T1hXazVrQVVzUHlkbWt6eUdpcFlX?=
 =?utf-8?B?aVpnM0paQ09YdXUvS0pmRUZTNzV3alA3SnY1eDhOMG5jdnVybEhLTTVma29T?=
 =?utf-8?B?MGY5bk45STNSdWphc1lrV3BEaUtXRVZCckF2azVBQ1BCZ3FoZ2ptZWlPakx1?=
 =?utf-8?B?c2tTNGc1NUV1SE9xQlhhMUhXSUlNellqaEFhOWIvUnhHdzFzZ2JqUHR3NlJs?=
 =?utf-8?B?N3ZpQVVONlVVS28vN0Z4K3l0T2VuYnJWNHdvcUFLbk1WeEVEeXY5Y0FDT3I1?=
 =?utf-8?B?NmNaSzViSmJtRlByNDRBdDdTcUJaai93K0xSRW1RcTZQOFdieWdGa1BZWkl1?=
 =?utf-8?B?QUZzeEFlYjVrM2hlcFR5ZGNEa1AzNkl2OGJYK044Q0dQMjlJMWg1ZmFjT1M2?=
 =?utf-8?B?czlSS3NEMXZ1bnJWaTUvZjhUZ09SQWM2QXZLU1lWa2x4QnpnU1kxM3c3Q3ht?=
 =?utf-8?B?OTNwMGZjOFU0WXlqKzd4SEFVbEpPQkwwQVhpM1dQS05yNHlpWjF4Q2cxVVhQ?=
 =?utf-8?B?cVJSbmQ1K3dVbmdUbWlvWnpTVXlFWnljeEw0QnNtQzRUYThIQkZYVGQzdE85?=
 =?utf-8?B?QklQbTJtTnJCUUptVEpxemdCQ0UzZ1JDVWYzckE2WGZZaEY0OUFpTlNuV0NB?=
 =?utf-8?B?SVQvVmRDanRoMTRJWmRYWkRWbnNNWkhQMDdvM2haQ1lxUjFIRGlIQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab97e611-a6c6-44d7-de10-08deb02d7458
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:50:40.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHjOHIo5OU2WwbQeppmqyR8o4LYt/FtdSE1CVr+uVGbk7aZ0Fx/aQ11HD6g1P61brRE5PhPYSqwsqKDoXomT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8829


On 26/04/2026 10:09, Kartik Rajput wrote:
> register_pstore_zone() prints its "registered ... as backend for ..."
> summary as a pr_info() followed by several pr_cont() calls.
> 
> pr_cont() is not atomic and has no log level of its own. It appends
> to whichever line was most recently opened by a printk(). If a
> pr_err() or pr_warn() from another CPU or an interrupt handler
> preempts the pr_info() / pr_cont() sequence, it closes the
> continuation between the fragments. This can cause parts of the
> pstore registration message to appear at the wrong log level and be
> interleaved with other messages.
> 
> Furthermore, this causes the detection of new warning and error
> messages in the kernel log to be unreliable.
> 
> Format the registration line into a seq_buf and emit it with a
> single pr_info() call, making the line atomic with respect to
> concurrent printk() callers.  No functional change to registration.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v2:
> - Use a seq_buf to build the registration line instead of scnprintf()
>    calls.
> - Link to v1: https://lore.kernel.org/all/20260424095820.1433700-1-kkartik@nvidia.com/
> ---
>   fs/pstore/zone.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index a3b003f9a3a0..004a5d5f376b 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -12,6 +12,7 @@
>   #include <linux/slab.h>
>   #include <linux/mount.h>
>   #include <linux/printk.h>
> +#include <linux/seq_buf.h>
>   #include <linux/fs.h>
>   #include <linux/pstore_zone.h>
>   #include <linux/kdev_t.h>
> @@ -1301,6 +1302,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
>   {
>   	int err = -EINVAL;
>   	struct psz_context *cxt = &pstore_zone_cxt;
> +	char buf[256];
> +	struct seq_buf s;
> +
> +	seq_buf_init(&s, buf, sizeof(buf));
>   
>   	if (info->total_size < 4096) {
>   		pr_warn("total_size must be >= 4096\n");
> @@ -1383,30 +1388,28 @@ int register_pstore_zone(struct pstore_zone_info *info)
>   	}
>   	cxt->pstore.data = cxt;
>   
> -	pr_info("registered %s as backend for", info->name);
>   	cxt->pstore.max_reason = info->max_reason;
>   	cxt->pstore.name = info->name;
>   	if (info->kmsg_size) {
>   		cxt->pstore.flags |= PSTORE_FLAGS_DMESG;
> -		pr_cont(" kmsg(%s",
> -			kmsg_dump_reason_str(cxt->pstore.max_reason));
> -		if (cxt->pstore_zone_info->panic_write)
> -			pr_cont(",panic_write");
> -		pr_cont(")");
> +		seq_buf_printf(&s, " kmsg(%s%s)",
> +			       kmsg_dump_reason_str(cxt->pstore.max_reason),
> +			       cxt->pstore_zone_info->panic_write ? ",panic_write" : "");
>   	}
>   	if (info->pmsg_size) {
>   		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
> -		pr_cont(" pmsg");
> +		seq_buf_puts(&s, " pmsg");
>   	}
>   	if (info->console_size) {
>   		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
> -		pr_cont(" console");
> +		seq_buf_puts(&s, " console");
>   	}
>   	if (info->ftrace_size) {
>   		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
> -		pr_cont(" ftrace");
> +		seq_buf_puts(&s, " ftrace");
>   	}
> -	pr_cont("\n");
> +
> +	pr_info("registered %s as backend for%s\n", info->name, seq_buf_str(&s));
>   
>   	err = pstore_register(&cxt->pstore);
>   	if (err) {


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

