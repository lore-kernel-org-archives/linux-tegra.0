Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF012DB7B4;
	Sun, 26 Apr 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193993; cv=fail; b=mFnv3zW/wQ1QF4N2pTzCPM55xUAU7U1FmFgp95riAvI88FP8L87M3g11ZQz7rHcaWZtlJF/AUS9MFwUc0Plzd8BOW+ReYu3i4Vv5KDE6rCmHBfwMhMA5GqusjCGn59qcXD+7KpaKHGWA1hRxeIfOLBXmvDvywyQh4viZm27VzDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193993; c=relaxed/simple;
	bh=mtQ4ra2XjlzWjpx8fv4KRjUXmzdILkr4ndo/uv02iy8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JKC404KUl8mxldpAQHg4Q9jR1wyEU0kz/mmVpwVBENFNEwdODgXfeBMTt0l2FyCGLGPmTH8w8m6fkluprs0QOYa8wt0zGr/YBdsC2EVkBy7k2jF9M+8ynEba1aF9DFJK3i0ImANSmSd9WAM3NVpg1wrMpd+taEKZh/+OaW8mVyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UwFXvvQw; arc=fail smtp.client-ip=52.101.48.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UwFXvvQw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RICeeaNJtoiA203yn/cdxsB1wMgWbDIMqTcFBSRa9ak5kbyzoPfWMnT+6aRkmrP0kvOBDAMBbxQIEMW1scAFaxCw4Vmku3Fde6ur4eNvL9YtUUpug4hm/cQAyXOtD2ONMD+w69tLYZgvhzBQt0UZk1hX973rqV2GnOefB+A7XKtA4dbA3uuN4oNrhm7zDG0atW+Dfcv34OcWGoSUGGLndJ82J2dh15dfPWgVoqLtYA44Ydb/jDGlUrA3pNiDvQWzUcy+qjZ3lKRdT7b+c+gM5sHcNcKY7kgCM+Lq6t2CtgYdBsbqglffWJ5pPucLWQUsdzjuhzSJ2AbI/TonSOi11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAT9Wnb1cVJyEQFcIarVVWtG2a5gm1rai/VAu4vRgO8=;
 b=rfYwPkJC5TSjMsL0RvxAseLa8roEbjTHf0QnpC6UsjW0+ISTzJ3LjCWznn89iZgRJKpX8Bze37s6B8ADtZjS/7YiyZ2cuhLinojglql9pmxs1Cdbv+wPveVbfJhq605QtgGiqHsIBmD6Jw6Nx2iCyaG4BsuQGIUoYqdQnSLmOLEuGoinIHmn9+gfaW+5NVsBDHEWi00jzFij3/gRUiuZBcH+mZhdlB0xUYDtwEFLjIhm6o0wseI27YHSvgaM0X6I1g5mlPh14Upb3utfjzD/lA0pHNCUgIUycg5M8Q0at6nEC6IEmkePSosubflnNe5WZoGde2y1tDlg1jD/MK1lgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAT9Wnb1cVJyEQFcIarVVWtG2a5gm1rai/VAu4vRgO8=;
 b=UwFXvvQwz3QJ3FqqJ4k7nfbNrGunOrQBEwtHkjdygW4GtDvo2VFeYmMgqVwqrSSFjXRMIOwt0s1sKDiRsxWOMRNnhX7HfDahKPKMHGXMXyJyLphGoRFphWJg+0C83JEcwswuOauICiZxMR2ioLxlGYCklkGHJZZHhT1RVZL2ao5c7EOjwJzyzygtk9vQIPM26kT56xI1cdh2AqQr0Q/mNpx6UpJ9lS2vX4YjtYr4hK0C/H6h96lIwI7HUQ+YtQbSHGgeDtuZQIsEtgoZ2SBZlbFAFYwdd2olWMdKEs5EB6lkyGzyofRe3WlKN4hZ51+1LmHzYvuEnroZYDeauzOnEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sun, 26 Apr
 2026 08:59:48 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%3]) with mapi id 15.20.9870.013; Sun, 26 Apr 2026
 08:59:48 +0000
Message-ID: <6a4c6736-5f2b-446b-be8e-0d3b18f2cea4@nvidia.com>
Date: Sun, 26 Apr 2026 14:29:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pstore/zone: Emit registration message as a single
 pr_info()
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260424095820.1433700-1-kkartik@nvidia.com>
 <273C4CEB-8FC5-4420-BC74-691A58E254F2@kernel.org>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <273C4CEB-8FC5-4420-BC74-691A58E254F2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::33) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 760e3f97-664a-4e4e-3026-08dea3722b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PKzX9S78ct+6OyAQh3KR/MzhoXbNz3xnHBEShe34EWTjVyHLe05EL87dAx6ZqR8R2ex0H05ouk4yj0TS57P8sIIa3PQqQGmA5HHNrrMMws87cc4gVVpVeAINdpbu6cn06BDE1oL5b0pdt5Bd/g8m8olOxLYFAXu//YET516JwI+2pEwkhcp2ZWBQ9u5vzQxqbZSrMu5Vkn3Gu3cXyJdsfEYAo3oJahaTOHC1aDC+6dhx2DjnmNtnBEMUsKepKZ803e3/y+H48OF0cOpVgFnDmLetdLW6SGt6CXehzPDbiJu+OMNURzr7PyzSq2447cKAYV03IVjCaHIY5pptYnxxtQbEEy1cMIzREE9UgtDSzVZxJ9OrD1PC+ReVHL7+cVv+qhhuWXLdOI0dpTgjajLykNnWMk6M+TuazmqVefbyYF4T4Q4KhU03JPKaUdO5gsNl4fKepy5JMXxmpnyemCZSNvXhyAcaJ91hizWd0C3khzz70tEu4wQPlfo0YD/7qWomtYBMlQTow/odTF4kGc7VJ44JCDrsvau0med3OCpjaSLirfa8OT+8H5Ujt3PNgOo5euI0pkGnWsdOVRDxD4hapNLKDo+M2zJ/u1RMVkc03Q4EintiO9Mrg2CJMLRMng+6hRQOTG0lqLUAEoP3idtJZun0u1jcUy43KPdf+lIan8L75mSnbeWICA/A8sS0Zy8YfLHU3ysB1N+9RM+zX2k62eN4OUclzkpHgDcDXA1zlTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emNmVVF2b2k5enNIMFVlSXg1SmJKNDJZc1J4Q1dUY3p1dGtNQmdHMTkzWDRa?=
 =?utf-8?B?ZEw2WmJhb1UwRGh1ZGRJZ0c2NldFendrdDJETTl5TzRFZGRRbHVaWnlQVm1v?=
 =?utf-8?B?WURIVGZvYWUzYlk1clNCRDR0Ni95MjBCMlhDMzA5VGxUeUg0eDBoS01hWmoy?=
 =?utf-8?B?Vnc5aGlmWTh1Nmkrc3duRWk5T0NSd1BId0RTeWljRkdzZUU5eGdkeVh2T2t6?=
 =?utf-8?B?b1AzRDVQNlBRTFBxZ1JTTGlkdzJLUDJ0UnQzUm8zeE42RVFublRSaENzZCt5?=
 =?utf-8?B?QVZ2ekhJYnYraEdYbGIxcEhuMVJoRFJWT1gvcTI1RUZMZ2Vkb2gxTXdDL3lV?=
 =?utf-8?B?OHJncjFQS3Y2bWducW40RlRkUkVvUVdWVDNyQ2UzaE9TblFFeFFyUS8zekxa?=
 =?utf-8?B?QmFwUWtqNmVvL1paVXBMYzJSamVRZEhRSzZLSnNjN01pM3owbTNZMURwV0V3?=
 =?utf-8?B?YldBa0RUUWlOT21wb1h2YzNHOTZuSnFDWUhuMnNCZjIrbExyNGprc05qM3Jw?=
 =?utf-8?B?T2ErNndyNWtxRzZTSTFIRVcrK21FNXdQd08vRmFQeTFUZFJlMjN4YUdTWFhF?=
 =?utf-8?B?QTdJNUxNZU1id3BGVEhYdGJwZk9uV1VCdW1CUGNmbmZTZEE2TUIyR1VUNTZH?=
 =?utf-8?B?SkN1ekZkOU1EbjZCaXMyVlpPbmMva3owSmVtWkl3RzMvWWQrM3VSS1E1ajI4?=
 =?utf-8?B?U0RncnFwOUgySCs3ODhjUFI3TWU2cW5OdGxZR1k3dXZrL1pYSzd2TDZTUUZN?=
 =?utf-8?B?UU9EUUxmM2NHOEhXcDY4dUIyNlU5OC9DQ0dpQUpiTTlsNC9QYitQRlFmaGY1?=
 =?utf-8?B?VzVxR1ZkUHBzeEtjSTZFWjRmeTFuay83eHRpN0YxYnlCM3BNRHFKOWFiU29I?=
 =?utf-8?B?KzRXNi93STdkVWhwMXk5R0lFSHQvUHdqQlFyZmUvcWZNTWM3THlnSml6dUl6?=
 =?utf-8?B?NXpOdS9ieG1xRmNqREZ5QVpRSDBrZmNRY0doWEplVmxPQUo4V3NIOTdicVpL?=
 =?utf-8?B?dHpwem50TWp1NXRWMlJUckJRK1M4TmdDbVU3dnU4aWl0YWdHbW4xL2oxN0tH?=
 =?utf-8?B?MzJPUlgzOTdHblFqcUJiUkpjQ1hqdlFUK3BuUXUvbkRleWZOUWt5cnFTU1BE?=
 =?utf-8?B?ajA3dHV5Y0duN2hSci9vK0wvSlY4OVhkRnA5K25NQkg0WGQzblM0bFNyRFp5?=
 =?utf-8?B?RkdZRFFnTG1BVnJrMkRLMCszVGlUOW81NXRxaUJDbUg5OGg3NVFxck5LK2JM?=
 =?utf-8?B?ZFRUT1ZxOTJqUlJycXdKZ0RqYktHNGpTblRJMldPY3g4VkxORERUc2dEby9Y?=
 =?utf-8?B?UW05L1VqaEhzTVRkaE9SUnROMnZEbm03VlN4em5Vb05wTzdvT2p3UHZrK0lw?=
 =?utf-8?B?U29pOG03elhOY0NrTmI4ZlVhdHo2K2J3N1JtSC9wLy9MVFd4Z2Nyb2Z5aTRW?=
 =?utf-8?B?MWV5ODRCVUxRNkdUb1Y5R2NQYmRpbzZKK09wNXdmOGlnTmUwMFFueGhCUFdx?=
 =?utf-8?B?b1h6eEI4VUNaUE1KbklyMndQRWNnMkVwWWJZd0gwRW1ZemlsTHZBTktQZ2VL?=
 =?utf-8?B?c0N6dXE1d2ZvSlZRSGNCeTlJaUc0clJDNFlDalQ1N2pxcE1MKzRTOWFnNFRK?=
 =?utf-8?B?Qk9JUHEyd0JhM2I3ZEhwTEZOdVJucHJVYTNiYTVKdkFoVXFHT3ppWEIxajJJ?=
 =?utf-8?B?WU1zZVNYbVhCcmlNOHpnUWNOZjByRDAxZ0hGa0pMQld5Uk14VTE0MlgxWnFq?=
 =?utf-8?B?T2hDRFRadHJZNk0rSXJCbVlwWDh0MUJzdDllb1FCOWM4cXJvTGVmSVJ1M3gw?=
 =?utf-8?B?am1OVlRYWmRoSElBVjJ5aHRBZ29UUTZSTUdWQmpNcTBKU1F4TUZXTzFTa01G?=
 =?utf-8?B?Q0xtdk5VbGhPQmJCSEoxMHhXSG5zczB5cjZlZmtTRHcrd3ZrU1RGeVJOM25v?=
 =?utf-8?B?L2tyVDhFS1NZR1dtam5KS3JaT0tiMkNxS2ZWZHlkSUdjTTJoWkUxVVVEVGVu?=
 =?utf-8?B?Z1NBNTVHbjhhK2dNV1RYRElVdjV5M1JUM2MwZWRXWndBUU5YdldtU0NMbzln?=
 =?utf-8?B?eElEK0gwUDRLYUZCRnI1UzFveFFETTl0a0QxZ244QlhXRDM5RjhidXNObThK?=
 =?utf-8?B?Q3JFL3U3NlE4Y2RZUUNnaENvSEVVVXlLRG5XSEFHenFNVW11SGdvenRhOWpw?=
 =?utf-8?B?Q2I3M24vMHpSallhd0d1Ti9qSVpnOVpLYWxhSDNPNEd4cUNQczFkcjJJdVlD?=
 =?utf-8?B?TFFWTVRyM3pYK0ZKdkd4NVVTdnp1SXZmZXgzcWJEMHhNb0pTV1RmTGZac2Nk?=
 =?utf-8?B?SStkOUlBTEFXUFNLR1dCdmkxQ1VWTDJ1RjlOTFRoc3FBZW8xTUEyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760e3f97-664a-4e4e-3026-08dea3722b8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 08:59:48.7002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXV2zToeRq6AHmgS8LRAAkpMqTagkoYGbTtlfrqdRlqdMNsqMLwQL+rVMQmiocvYz9ANziUM7IkshS33TpMNRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

Hi Kees,

Thanks for reviewing the patch!

On 24/04/26 21:03, Kees Cook wrote:
> External email: Use caution opening links or attachments
> 
> 
> On April 24, 2026 2:58:20 AM PDT, Kartik Rajput <kkartik@nvidia.com> wrote:
>> register_pstore_zone() prints its "registered ... as backend for ..."
>> summary as a pr_info() followed by several pr_cont() calls.
>>
>> pr_cont() is not atomic and has no log level of its own. It appends
>> to whichever line was most recently opened by a printk(). If a
>> pr_err() or pr_warn() from another CPU or an interrupt handler
>> preempts the pr_info() / pr_cont() sequence, it closes the
>> continuation between the fragments. This can cause parts of the
>> pstore registration message to appear at the wrong log level and be
>> interleaved with other messages.
>>
>> Furthermore, this causes the detection of new warning and error
>> messages in the kernel log to be unreliable.
>>
>> Format the registration line in a small local buffer using
>> scnprintf() and emit it with a single pr_info() call, making the
>> line atomic with respect to concurrent printk() callers.  No
>> functional change to registration.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> fs/pstore/zone.c | 20 ++++++++++----------
>> 1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
>> index a3b003f9a3a0..fbe0a252dd2a 100644
>> --- a/fs/pstore/zone.c
>> +++ b/fs/pstore/zone.c
>> @@ -1301,6 +1301,8 @@ int register_pstore_zone(struct pstore_zone_info *info)
>> {
>>        int err = -EINVAL;
>>        struct psz_context *cxt = &pstore_zone_cxt;
>> +      char buf[256] = "";
>> +      size_t len = 0;
> 
> Please use a seq_buf backed by a stack array instead of the scnprintf calls.
> 
> Otherwise, yes, seems good to keep this all on one line.
> 
> Thanks!
> 
> -Kees
> 

ACK. I will push v2 to use seq_buf instead of scnprintf calls.

Thanks,
Kartik
