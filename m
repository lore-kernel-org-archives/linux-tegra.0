Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6C4BFE9C;
	Tue, 13 Oct 2026 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888690; cv=fail; b=OEDtZIzJNXAgSzU8UMOC/AeHVYDSibNZ7h3RMQu9Sei8dvCEzVZHYwW9RbvPq43P3vQpeO6rrXKKUvihTxLTOhy3X78DE4VLfPtNjxevF06yB7OTxeEEbEn32HInHAX3VKNPNb8DbdBoIZ37jl2ysDvMbXWzfLm0QF1k/vKRsgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888690; c=relaxed/simple;
	bh=d9AKBzA0W0XGX2+fAkHbP+XIK62X19QTpRyjc5fDDOs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aSCkcaCk9P2mkOmzh736U1Zebyhw1CagrTBQmvQYHoEwGEf3fhNA83ZrKk17D3+9Q5rPPZCahJLoIsKmV2zzKEDj63qd5CUEm2U3df+lMY7CxzR/rbPFnfQlFrfo0kYxDXwlOiTSDJC813WdfH5a9hYWulz7pxS+QXdnQJqh51M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z2uMLuBD; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z2uMLuBD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kd31/Cu3w94PnyuHY58UBzvRUrHr+ZGPp1gitiTMEw7Y268OfGiukSewTmXSnv0f/luscWoNEpAKVwSuN7q/9QfwgAhT+84U4k24ghKW4jUzrfdx3Uxbbbf5zOeg9R1u08afkEKWYmrmvJPKNgi1O1vRcmXdeicsyavFAW9/TJfF84H4rCAnVzYjxkoDIgaERj7kbXFHBlT8JHWxEZ2Pv4fB8ULgWR8uYYCANxPNUBwrrzW33nvkJJ1ADIKWPK2oYEgYHnCJFOTXcjc4RzL0NuAWKirttoq4Uj2BFhFZgELyx7XxwvpSyPYcwTseAdkTHTC74PvEpoJlVXFddMbHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1i8GbZOCVUUEg93QBHyZP4p+14N9bAtHqaxZ6rcVms=;
 b=kQLbM5MbGo9x7/qjRkST0JvkaQXFwwOK/k4vtVMaWEkCJsduAygh2X5QIjqvnORSj4fUKG1OzMwZa8y630H7Le53rWYsnT6xI4cMhl9oQeIo22W/JzJSYSwcxOZCRx8+O3CDybwi0bmAPSDSQR5BEQgpFK9lrqcWvwsT9opw5Fkg/FNs4LVbpCsCgOzyk0hDoI1/3A1bT3C+sUB3uWaNJyM9htYTXrknl1NE6RuXRGdL/N15y6tuXDj6KJe+WhF6xw0JwEWrkM9t4XXGMfdBHlM4fsPE8Y/KondIZOYV0TyG3GbOiuUqoCanZ50OmWLMJown/Bp5zpPopAvDXHqX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1i8GbZOCVUUEg93QBHyZP4p+14N9bAtHqaxZ6rcVms=;
 b=Z2uMLuBD7mr4RYy89gCkTyg1WVoBKd3AkdsViVQOqfXG1+eJPoDrJx0S0xfKh9GeqYXm5WThxpPM6GPvbQikdNbyxTnjTDCaIrqAwcs7EF1AdqSHB7IvBGp8acB178lJP/zLeG0ZhA+ilhuGa1qDTS4kkZP0w8V8P8UFnoaEgrvTjUZctuqdrJZUgTaOZMQsAeSh4R5MqmUeBsen/I6E8X+DrXMmtQEZ5VG8r/ubpHUax7YBejVFroKQuraFtVWJ1B6HBpY+GMWaKou/MtXT41mDm1b8c4RQaV8m6/OgxyrT8H9w9ER5e4GToqpik9uJ8E8y5LN8aC89RI4ucYw6yA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by PH7PR12MB6953.namprd12.prod.outlook.com (2603:10b6:510:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 13 Oct
 2026 10:51:26 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:51:26 +0000
Message-ID: <ac599c26-563a-45df-af23-a864ec2e541b@nvidia.com>
Date: Tue, 13 Oct 2026 11:51:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] pstore/zone: Emit registration message as a
 single pr_info()
To: Kartik Rajput <kkartik@nvidia.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, Thierry Reding <thierry.reding@kernel.org>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260710094404.995355-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260710094404.995355-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::16) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|PH7PR12MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 89398299-b008-4e3f-f738-08df2917edc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ga2qSJghij0FR2Kcfjitb77hTqEUOYtfHFfth/g/zZFB/Z+3AFj1P8yKyKCzAIql6SjHcVIwlmKYrlRftoTdoaKK/2o0RmwehhfLCs5Zct80zVp7SQ42IYSa7ekYfRd70s83F0u1U0rr3JvdQYr+mRqEyEyXSfFbpN7PpMWueqOvflg3VkMBo43Hch+o/fleD4mDO8dR6v9bNNanbF2Dikbg8gpE6nNKwK8P030QBu+uWbZhH7p6aNbTp9oadBsMAi7B1Lx9xsB4nKu9qpOaoEAKbRDERD5v6+FiH9E3CPa8kA2btLPDzRy3wiWeqNidBgxXFei0CE4PkLIJWZgSfbljXvHfNvmdgkrBAlCMFnWZle1wJ2bo1jDGanGz+ZS2vQZhDWyf8+wKCO26fYBFbmmZFiZs5Avt433LUAU1vZZTkHxqq+f/6HssBGqw6rulAk6lRUa3/lgQMgAk+G9HEMjMfK4wCp7zlTOwqwXFsJv1ilYiZ4gmvugamGRZGCxXUnTr8sT2dQehLKJsjaGtyLUKbSi05hCOBnniIQde88A1w3W3+Q01LvXj/4sprRNx24qm/D86+LLJOMaUoDNpS4tMcYD2rqltUodOXZdVsjnN6/BfxLgmQIUyF17E13St5w/7MKgjJCwGmwUAvRij1P5LGkiEj1WiOzjoX0CFwYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aThiNTJyQ2duZ3pNb1BCNUoweXVJWUgxVGZvSjFMVU1WYTJFOElsdnNxSkFX?=
 =?utf-8?B?eW5rUWtQdVdRTGUzU3Fqak0xWjVHWXptSTFKRmJlYTlSaU5nZExqL0JNL01X?=
 =?utf-8?B?QSs3eWEwZlhCOG9KZDZuL1lQdkVab0grR2E5RFJNZG13VjZQbUhnM3lQVjh1?=
 =?utf-8?B?U2Q4QUJ4TDhabUFTL0VYMC84Q0tYWE92TTdpK1FsOS9xNWNLc29xMCsrbVQ5?=
 =?utf-8?B?QjlJYjRsUVIyQlgxS0tCeHVaU0FxVklmRVZJamh6U21QZldiVUcvVW0vUmEw?=
 =?utf-8?B?elVqNi9ZMHAyM0cwWGp2WkFHcis4RHdUZnM5TkRYOWRBM1lRaDVUQTNucW1J?=
 =?utf-8?B?blJkZGYxbHprcFl0dVZBUXBTRGU0dDN4bWpjUWNlTVN2SnpzV2hxNjByQmxi?=
 =?utf-8?B?cTZzR0ovUm9ISHBiLzdhTDdjeHVBL3Z4MER4YkYwMWtscm84OG1ITzZIZzdi?=
 =?utf-8?B?eEI1SVhYTUY0bm5JTXBqMzc4cDBFZ2xqVkNzOXVKdHpQeGhTaW9RY2M3NTlv?=
 =?utf-8?B?bmd3S21VV1BURGlMVUkwTEdUalF1MEg2ejdDK01XazBkQnVLV3ZISVIxMVIw?=
 =?utf-8?B?eHVvb0xKVkZQWGZzZjNxVERrd3BZSlV1L3JDUkQxdnVqM2s3am9UNk9palVs?=
 =?utf-8?B?cEtaRy91UUVRMUJXdnhVVlJJNDNhVmxYYWwyVjczc2tMQ2lqRktYaUtlSTF3?=
 =?utf-8?B?WFNQMmRVd0Q4Yk9NWm4vbCtrVk9wcTZWVjJBT3lJdE04UFMwc3dqbXJ4N2NH?=
 =?utf-8?B?c3NvYXc3QWw5YmtId1ZQa1NPb2JJRk1HNjRBUFp2ekRvcG8vQWFOOXBZRXpI?=
 =?utf-8?B?SkdKUnc1dys2dXlZb3Z6TTBCTVVRRmlWQXVySlZtZWE4YU5Dd3E2TktOVkQ4?=
 =?utf-8?B?OGFhQ2RlNlhnQWRHVEpFblpWMzN6S1RDS1ZWRll0MmM4M1l5WS9hY2k4eXZv?=
 =?utf-8?B?NWdFKzJsaFpmcWV4am5PQ2JJMHdFVGpxUTlsdEIwcHBIOUx4VDd0VnU2QXlW?=
 =?utf-8?B?V2cxYW1iM1pTUUdkMUZ3SEkvVmQ1MnA3cVFNcUg2TkFvYTMzOWVJL3pSaTBF?=
 =?utf-8?B?dGtRY1dJNkVlTVFPWW1IS250ZGx6TXZ0Z1lINjEyMm9XckR5VldCMW5YMjlE?=
 =?utf-8?B?UDBSVnpkNTJhcmhtTUZwSmM5ZG5lSTYzTGljVHM0cGhRT21aSFV1WDdiUXor?=
 =?utf-8?B?NU5PYW8yYXNmOGpFb0NUVi9EQmRjMnR0SDIwejVBRkM1UnRuY2tmWTY1WmJQ?=
 =?utf-8?B?ZE1ma0lLN21ub1pCOFBLWFFwcUlZOXVyUGVIa1lFQ0Y5K0d6emlHa1hnUnho?=
 =?utf-8?B?T09RU1Z6NkxmTW9kSTNlYjNReTdVa1ViOVhTRmdKQWs2LzlCRG5Gc2RQS1VH?=
 =?utf-8?B?c2N4ZUNvaHVWR09qU05PZXhodjg3SXk0MloyeE95aGp5R3pyQXVCRGJQaXdM?=
 =?utf-8?B?cXl4b1NNQllvWUNzVjJPbHBKdXNYaGlGVnZ3ampnSk1tN3F0aCtFaXVtZHNP?=
 =?utf-8?B?RXNjWlN2U0ZFZ2VPTGlFS1hNTGVLRGdrNkF0QWVFMXFZQng4a3FGS2RVQ3Js?=
 =?utf-8?B?ek85c0FjOUFYQjF2RnpXVjBZTjBGSDhvNXlnYVhrZm9FeVJpM21EajZCa0c1?=
 =?utf-8?B?bnZYMHhEcnFvalJzb1BVc2VPTmx5R0VvQkFQaFlXQWdodnJNWXBGUFFQZ05K?=
 =?utf-8?B?clRuNm5nNzN6NStoRzArVnpVUXJwejcxRDdSMXlwRFJnZXlxRmJOc0VuSHNr?=
 =?utf-8?B?SlM1RHpxWHNWNElSWVBaQklRaFE1TzhQM2NUd3Y2MU5uRmlEY05xdURQT1FR?=
 =?utf-8?B?ejd6OTI2NnVqeU0rZTBYTGtHWjQrdTM4U3ExbldFaVpoQTMyb1FyL3VYMHBa?=
 =?utf-8?B?ajBsKzFFeDRWdXQ3djRZY3U1VzdlNTYwbWpCbGtSWTZaMjV1UnN1bmN2QlVs?=
 =?utf-8?B?bGpPMDJ1QkNLQW9tMklzWTNLRU8wMzJsOTNaL3dkNXo5RnJzVlFva0lHSEwv?=
 =?utf-8?B?VktiQUg2UXgxL0E4VGhuaGN0NU9MSm9LMWt0UURoSmo2SXpIUzJsbjU4M3Ro?=
 =?utf-8?B?Sm11OHRWalRaZVRoYW50RmdMek8xRGhBNDNTbWVvWHoyeWlNUjhDMmhTQnI4?=
 =?utf-8?B?djcxOVpNTjVibkVtcnE4NWtzVU1vaS9ETTh3MXpYMmhuTDJrWitET0YrTnpa?=
 =?utf-8?B?Yk1hWlBzMlpUOHBkcEJXb3d1NFovWVExeWE4VXRuaGF0Z0dOM3VBaU8zSXhJ?=
 =?utf-8?B?QURUWHZOQTI2ZjhyaTg5NzE0Y3pVb3V6bWU2aFJ1QWZoaWs5dEVzeU5BSmc1?=
 =?utf-8?B?aGJiWW4xUHB4SXMvSzY3Rm9qa2NidmFHYVMvTXY4aHVpcDZKVGUvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89398299-b008-4e3f-f738-08df2917edc7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:51:26.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RLQzYw6yLM35C6vcuEQrRsagfT5gqIm/4OFslxDCMgdcmcbgxCNyDQ9+tnQRcwqXTN6d/ECnR52KQJK6Ws5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6953

Hi Kees,

On 10/07/2026 10:44, Kartik Rajput wrote:
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
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  fs/pstore/zone.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index a3b003f9a3a0..004a5d5f376b 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/mount.h>
>  #include <linux/printk.h>
> +#include <linux/seq_buf.h>
>  #include <linux/fs.h>
>  #include <linux/pstore_zone.h>
>  #include <linux/kdev_t.h>
> @@ -1301,6 +1302,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
>  {
>  	int err = -EINVAL;
>  	struct psz_context *cxt = &pstore_zone_cxt;
> +	char buf[256];
> +	struct seq_buf s;
> +
> +	seq_buf_init(&s, buf, sizeof(buf));
>  
>  	if (info->total_size < 4096) {
>  		pr_warn("total_size must be >= 4096\n");
> @@ -1383,30 +1388,28 @@ int register_pstore_zone(struct pstore_zone_info *info)
>  	}
>  	cxt->pstore.data = cxt;
>  
> -	pr_info("registered %s as backend for", info->name);
>  	cxt->pstore.max_reason = info->max_reason;
>  	cxt->pstore.name = info->name;
>  	if (info->kmsg_size) {
>  		cxt->pstore.flags |= PSTORE_FLAGS_DMESG;
> -		pr_cont(" kmsg(%s",
> -			kmsg_dump_reason_str(cxt->pstore.max_reason));
> -		if (cxt->pstore_zone_info->panic_write)
> -			pr_cont(",panic_write");
> -		pr_cont(")");
> +		seq_buf_printf(&s, " kmsg(%s%s)",
> +			       kmsg_dump_reason_str(cxt->pstore.max_reason),
> +			       cxt->pstore_zone_info->panic_write ? ",panic_write" : "");
>  	}
>  	if (info->pmsg_size) {
>  		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
> -		pr_cont(" pmsg");
> +		seq_buf_puts(&s, " pmsg");
>  	}
>  	if (info->console_size) {
>  		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
> -		pr_cont(" console");
> +		seq_buf_puts(&s, " console");
>  	}
>  	if (info->ftrace_size) {
>  		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
> -		pr_cont(" ftrace");
> +		seq_buf_puts(&s, " ftrace");
>  	}
> -	pr_cont("\n");
> +
> +	pr_info("registered %s as backend for%s\n", info->name, seq_buf_str(&s));
>  
>  	err = pstore_register(&cxt->pstore);
>  	if (err) {


Any more feedback on this? Or can we queue this one up?

Thanks!
Jon

-- 
nvpublic

