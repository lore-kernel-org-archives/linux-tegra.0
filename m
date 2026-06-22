Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AFE40D56B;
	Mon, 22 Jun 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135443; cv=fail; b=BynKu07G6IJ8WCND3MPSpWBZERFZg62WJccY+JJpFJGsHDFapeeiHTmoMwmNVec4Y7dO55Hg8inqOMk+1dPDyOj0i6Aii1oTw9MRDk8zO6wGUeCv6hBrS4JZlFWVDVCXfwQ0/hr3Co9+D0dP5Zj0Rlz+CfqzrpoNok+BTdgLNXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135443; c=relaxed/simple;
	bh=xf+wlNZWs70Bc3OByGiK2xO6lCRHfyrOgqTq/MWWwcI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t5/RLmL2xRvH9/qarJO2QnGLwcoFFPUtAA3vp7gvNfVQD5wu8HT6hXKUN8X1bZEWcW+EU7TveUbdzO3VRilSLizG5AWHOjNAIF2r0+yRu5bNt9e2+HcULD6QSrvjHVjYDd9TxIZscvJounCpNs+p0R8ZnBy1VZfacef0k3RmWGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uSA9nWmB; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uSA9nWmB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMiXcuCYEzATsIUiCVGyFQtAn9zwkwGmdKCbx5FnVbfDUezZR4KaCq4MAbgAKz5m2k2YRJQaZURDdKQlTBru1hkV0EZZKhf0RpEI8DLs95eXtwD9qG64ZbtIqFeM4SeP5PagLSZT1Fcz00ukLQuZHeK0mmOsBRWR+eFKl4yWJ4YSHLmfJbVh0z3fz0++Qg/IO+SY8UNMiz1Q/3rD+l2ozmbiToghm1whvZAdI8RKVvxJKNWki5Zqe24pWt+GLtREMD116WaeJsLUE6dQxNNqnQ9c2coId1kvF5X6E94pmFiayrL0vBvTs3TIYuDWNVSi9ocMTW+/xiSAdFoI0pwyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voez7qarMW5dQ8HRE5N5eSe9fl52f9L2INlTiSiWbTY=;
 b=NVrpX9Xg2DwqOp5ha/yfQR5A6PfhE5h6I1ugVuwGoRnz8UWoT0ZUrVOOWXwCX9+R3jqkZtXgB9nw7C8Pucz948u90N+mEsjkALHf3bx91V/IAlQudNavT2cd0dw6n+JIr4YRks92XfTGD0sofGxEhDBGRvwoDNYCAUzE1H5m9RYYUAT6Ezt5u7W8dv8yA9z1GAmEwW4u2URPEB6zcjgpcbPT2MA2ZFB3nPwSiHXjlYhGlmLokC+q+EjL/yDoQpot6lKXBUnCoXC+GeVcIDolZWYd2mhSGtXOo8Y0UBzgX0PuThfh21c+2IYNFP6qEOELDJO5k0b/gWzBvz6WK/HV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voez7qarMW5dQ8HRE5N5eSe9fl52f9L2INlTiSiWbTY=;
 b=uSA9nWmBADVvDIK3yboCQSpm2DQrr36b6WgIhVDE3fW35251ikwOINp8jjbuYMDJ18368mr3qMdDCvHOTVF4Nrmz/ICEZwyqmpbVivmf0ulcJEOlXvYltui1vWxlxB64wUgn3bCPIQveQSpnfbxidd1kGSY73AZIylakUJ60PRI8cr9Por/iMjQo5HManxdnElafT2loiWU6DYwX3sbK3ftYaIDcNwSSvbTi9Nlu1wE1h7SpH6P6CuMu+iOeToloEB93/JrH2arlNgDh9HvjM6laR2Htsvl+iH1G7Kkujc1U1Cj7mR9HcIA+GLUwdz1TdPxz1tKPIZTH4bLjH7TCZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 13:37:16 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 13:37:16 +0000
Message-ID: <42328f78-0f68-4651-8184-cab11ea97afd@nvidia.com>
Date: Mon, 22 Jun 2026 14:37:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
To: Thierry Reding <thierry.reding@kernel.org>,
 Breno Leitao <leitao@debian.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
References: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
 <ajAa4JAXyssMpr1R@gmail.com> <ajjfgOLpDXuVHpI0@orome>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ajjfgOLpDXuVHpI0@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e07b22-2a7b-440e-dcb5-08ded0636026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10070799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	fSmrJR/fW/NLxuefU0KuVUbV2NdydcBHdZUSzdQxZh6EEZtzNOdqAryvp3izsOqVpvTsuS1vz+rYvDrcqC3laaPvoVeLqs0eD50x0L6u5BHfVMvJnkYfgrxLyU4LOZ8ByzxQb2DKcAcbs6wOwH0rVIIN8N2llcN5/3dKb7Yfoil3JhCC48hKhXwKCiDJ0Zj4H0oWAcAiNq6pDwlWSRSh0OQzqIOxx1ERcpMUqlPxPhTW6WPd5tfh76WmerbvmmSrZbU5WbavmrMM6BF/CKN1XGaskS51nJnggyX5EC+KkURKzF5PQju6xoG4CbXEUCsTXAD5H4Y2bN2zrundLhA306PDXaX4LS7iQHQDbvtCNO/pnDxQhqT8C1yC7sqvg7x+YlPdrpOw6RVWJ+qRm1w0v331mN/L29eEHLhOHVM0fm9C8ol5+Y9k0CgUHEoWAG8p8AraNRwNB3X9kI59aPig2V0nZ8mtSGz6/o6r+tCWTbAmHwfeaiOI6KrmAlYikzb6IP7AFpUzbl9yXai/jfnmzJuk+cFajL6omAZYKjwL56VksrUDntZpD2fkyOtfAA3/mYI40q8zrjUtXvn150+NuBgfhCIhiFVbRlTZdgQGK9vKsr9Jgsw0plX00VeWr6Q7Iov2dlZYXEVYuWa4uJaqO61ksxCEyg2GYx2IrMDoBmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10070799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdRRkVmY0c1aWhDcGJtRGx4VUkrTENYUCtzd01YYklCdi8zclVQenVIakdp?=
 =?utf-8?B?b3RqU05NMUdpbjZUM0NsSTJpUWVlQ05KbWJRLzhtR0lQMFgvUzhmRTd5MXN3?=
 =?utf-8?B?NDBaZFdzb1FObk41Rk15SGlwYW1CN3ZpWmRTSWZ6RDZ3T01SYWR1SGFNU08v?=
 =?utf-8?B?YjE3YzhHY1ViRVJCVVpvQUZnd1o0WFlERklTY05najEyZDNEaEFreGg0eHFM?=
 =?utf-8?B?YW9sZTlNOTN6dHB3UVB6NWJsZG5TVFlTSjRMZ2kzZStUOTZGdGZ2OWEwNW8w?=
 =?utf-8?B?SDhhUHNoRTlhY0E2SlhMYzlCUUtYbFV5M2IwQkxnRStkU0IrOUtIVnhCMzFk?=
 =?utf-8?B?MTdXTG1QQTdVTVpUR3ovYTdIb3loQlk1ZEFIU1RMUWhQRHN5SFRVOTFhYVVu?=
 =?utf-8?B?Z2JnYktDTXhkTHNxSWJlYTg1RGw2V1R6aWhjZnNWS25UdFFYeElIdnZhbzB1?=
 =?utf-8?B?WWs2YlBLV2JvdjlOM1NJcGNGMUN2ZWxsK2lsRE56YXpCZ2NiUEVya2IyUWN5?=
 =?utf-8?B?VFMvV2dHd2lVL2czOEpKbUE0VjdpOVVvY2xUaHpGVjY1VEd6RjhmeHNUbXlt?=
 =?utf-8?B?dzg1TDhPNFRiaHJqYjVPZ0tCWkRDWGlkK3E1RERUSkgwTGY1OFI2alVQbnBI?=
 =?utf-8?B?S21tVUxnVUJaZ3kvU3JveEtBajdMcnN5RVJnbXlmUTNiaG1EN2dSNWE4Q3dD?=
 =?utf-8?B?eVVhVVNrN1EyNm1iVWdaWWNLN0dUN3NCOGQxZGRad0ZmZEhWTnllYlFDL2V5?=
 =?utf-8?B?OGIvVThzNWxjNW50WnpoaVpDQS96dEdhbXBqbmtUSzBTTnFtbjl4UXd2bjh3?=
 =?utf-8?B?dmtmTHpGOGsyYTZhcUZsNGt6bHh3cW9QcTI0d0YyNWtQWklBRFpxMW8zdTJB?=
 =?utf-8?B?ckpBbzJWa3lUT01Yb1RoVUd6SkltZ1ZLcUMrd0FLMG9TL3pwSWlQa3k3M3NY?=
 =?utf-8?B?L0JaNi85NVpDdit5ckZUUHUvWE9OenRLNG9heUdzSXROK3VaT1ROVEFEcHZm?=
 =?utf-8?B?SVp1WUpEYlc3cHB3d1pwN2IvUmxiVGM0Q1Y1NjVYeWQ4d0NxM2ZlKzhSS2VG?=
 =?utf-8?B?Q001cDArNzlzd21xb244OE40TVc2cGYxQjRocEl2amFYU0R4ZWdqNFJsQmky?=
 =?utf-8?B?V0hNUWZmbDJ1NU9xRWxQUk5PSHo3UFhlQXRlUWdjLy9kQTA5QUlWL3RxTzJs?=
 =?utf-8?B?UlNnZWdQYWNhbmszcjZkVG1tT1MxYXBxM0Rrbm1jZ2tkK01tb1I4S1RWZlFu?=
 =?utf-8?B?bHVrVDY4dlJrT29iUVRiTER5L1pNN2szeWYrcG9zRndja1BsT3BYZUQ5bldH?=
 =?utf-8?B?aVRDVVRGODV1bktzOVU1akdscTcvZWJ5djNYNW9ZaFVOMHBMQi9mbEdMVDY1?=
 =?utf-8?B?SDhmNGI1eHgzOEw2MGk0WnExdWtJOVNUV01wbC9xNkk3Y2J3eTc2UVVzNWRG?=
 =?utf-8?B?a2NjTW5pLzZTc2J5dTgra3Uzb0NEZVlkWFRKejJlWWk3WE9OdHVKcUdxWHVK?=
 =?utf-8?B?Rzc2ZS9BazlXVExmVlZTU1JPcUFWVVpVNk9ZVzhEQjRyNTQ1MTlmbTRlWXkv?=
 =?utf-8?B?NnU3UWwvWDVmWForbnFYR3VJcU1hSWVVWDRNbURMaDdUS1A5VjF5blcxUEZQ?=
 =?utf-8?B?RUp1KzB1bkZyT1BvY08vWmxOWk9VMmV1SkJKRHJNY0QyejhOOUlpelA5UlNL?=
 =?utf-8?B?c2IzWlUwa0xOTm9TTmdzditHc1Y5MnRZMXVXbm5pNXZaNDAwVFJYMkJuTmV6?=
 =?utf-8?B?WjhoOFRZTnFtVU1vNk1VcklUQUNJMkRlb3VjVEg4aGFQdmtpcllVVkQ3K1U4?=
 =?utf-8?B?WTJ2Sk5tbURlNEdjVFg4V0cvZFFaV202Y3dMODQ1WUh6K3lSUGVvNUtRZUl3?=
 =?utf-8?B?YTJBZWcyZVZGLzhSVEdWNkd3NEVhMnRPL2FONkhzQVFKVDlkdkZwWEd1eUZR?=
 =?utf-8?B?eW53MllCZlRWNUs2R0JSTWJjVUYySDNIYllzTi81OVhtcEJVR2ZnQUpZOS8w?=
 =?utf-8?B?STVuaXhIcnZ0RGZ0MlVwY0VmdVRScC80TndPNjhkZHM5UUVJWUxDMGN3NHFF?=
 =?utf-8?B?Wk9EejI3Z1FEUFQrVTEvc01DL3BtNGt5b21oME4rQ251NkIyMHduWjFzUTdO?=
 =?utf-8?B?QTNlZmxNS1AwK1VTMEM3b3BUMUkrUkVuK29FelIxbUN4UEk3WU1kbW13d3Av?=
 =?utf-8?B?d2txUlJzbGk3MG9VWGs4eTlSTmJXRHQ1bUQrbUVJZU01R0lQeWk3cTVEVlYw?=
 =?utf-8?B?UDRRZi8vRG52Tm5FVGtEcGx0S3RxbGxHMk03T2RycWFyMmZNNE12YVprOThx?=
 =?utf-8?B?cTVyU29ybVRIVHVDVEl6VEZHbG4vaCtwd1grc2NpT08vdFZsTmtLTmkxcVFk?=
 =?utf-8?Q?wkBE4MTr+epaG32wScrig5osf8kzvDlRxB2bH9R/Gm8Ij?=
X-MS-Exchange-AntiSpam-MessageData-1: kwwXrAMsVV50zQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e07b22-2a7b-440e-dcb5-08ded0636026
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:37:16.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23Xhz8E511zBzzin9u/iu1ScCp3bUDoZLhQxm9E5xuAqari/KbfhK6cwskm6pNPbtzhtx855jjL+sK0D0ARgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781


On 22/06/2026 08:24, Thierry Reding wrote:
> On Mon, Jun 15, 2026 at 08:32:25AM -0700, Breno Leitao wrote:
>>
>> On Thu, Jun 04, 2026 at 03:36:17AM -0700, Breno Leitao wrote:
>>> My Grace host started to show this warning:
>>>    WARNING: drivers/soc/tegra/fuse/tegra-apbmisc.c:120 at tegra_read_straps
>>>     tegra30_fuse_add_randomness
>>>     tegra30_fuse_init
>>>     tegra_fuse_probe
>>>
>>> tegra_read_straps() warns when the static "chipid" cache is still zero,
>>> using it as a proxy for "APBMISC has been initialised". However chipid
>>> is only ever populated lazily by tegra_read_chipid() when it reads the
>>> APBMISC register.
>>>
>>> Guard on apbmisc_base instead, which is set unconditionally in
>>> tegra_init_apbmisc_resources() for all platforms and is already the
>>> sentinel used by tegra_read_chipid().
>>>
>>> Fixes: c71f213fa5af ("soc/tegra: fuse: Warn if straps are not ready")
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>>   drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
>>> index 87ae63a7e52d..7aba7c58bad0 100644
>>> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
>>> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
>>> @@ -117,7 +117,7 @@ bool tegra_is_silicon(void)
>>>   
>>>   u32 tegra_read_straps(void)
>>>   {
>>> -	WARN(!chipid, "Tegra ABP MISC not yet available\n");
>>> +	WARN(!apbmisc_base, "Tegra ABP MISC not yet available\n");
>>
>> Hello Thierry,
>>
>> Have you had a chance to look at this one? This is showing up in my
>> Grace all the time.
> 
> Yeah, sorry for the delay. You're right in that we now get the warning
> until we end up calling tegra_read_chipid(). However, I don't think the
> Fixes: reference is right. I think this started showing up after:
> 
>    8b8ee2e56f95 ("soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info")
> 
> I don't think we accounted for tegra_read_straps() in that case and I
> suspect that we're not seeing this elsewhere because we do end up
> calling tegra_read_chipid() earlier in DT systems whereas for ACPI it
> might only get called at a later point, if at all.
> 
> There's also this patch:
> 
>    https://lore.kernel.org/linux-tegra/20260514051252.2401568-1-kkartik@nvidia.com/
> 
> IIUC, that's the only place where tegra_read_straps() gets called on
> ACPI systems. Would you mind testing that patch (without the one that
> we're currently discussing) to confirm that that's the only callsite?
> It doesn't really matter either way, because applying your fix here is
> the right thing to do, but it'd still be useful as a data point.
> 
> If you don't have any objections, I'm going to replace the Fixes: line,
> but otherwise this patch looks good.
> 
> Also, I'm going to check if we can get some better coverage in our daily
> testing for the ACPI platforms. Do you happen to run any daily tests on
> your systems for linux-next?

FWIW I also see this on Tegra194 and Tegra234 (I have not checked others) ...

  WARNING KERN ------------[ cut here ]------------
  WARNING KERN Tegra ABP MISC not yet available
  WARNING KERN WARNING: drivers/soc/tegra/fuse/tegra-apbmisc.c:120 at tegra_read_straps+0x40/0x58, CPU#0: swapper/0/1
  WARNING KERN Modules linked in:
  WARNING KERN CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-g8cd8cf7a07e5 #1 PREEMPT
  WARNING KERN Hardware name: NVIDIA Jetson AGX Orin Developer Kit (DT)
  WARNING KERN pstate: 60000009 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  WARNING KERN pc : tegra_read_straps+0x40/0x58
  WARNING KERN lr : tegra_read_straps+0x40/0x58
  WARNING KERN sp : ffff80008327bcb0
  WARNING KERN x29: ffff80008327bcb0 x28: 0000000000000000 x27: 0000000000000000
  WARNING KERN x26: 0000000000000000 x25: ffff800083146000 x24: 0000000000000000
  WARNING KERN x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000000
  WARNING KERN x20: ffff8000831ae000 x19: ffff8000831ae850 x18: fffffffffffe1fe8
  WARNING KERN x17: ffff800083042c38 x16: ffff800083042ca8 x15: ffff800082c444d8
  WARNING KERN x14: 0000000000000030 x13: 0a656c62616c6961 x12: 7661207465792074
  WARNING KERN x11: ffff800082c44558 x10: 0000000000000018 x9 : ffff800082c44558
  WARNING KERN x8 : 000000000000006b x7 : ffff800082c9c558 x6 : ffff800082c9c558
  WARNING KERN x5 : 0000000000017fe8 x4 : 0000000000000000 x3 : 0000000000000000
  WARNING KERN x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000801c3000
  WARNING KERN Call trace:
  WARNING KERN  tegra_read_straps+0x40/0x58 (P)
  WARNING KERN  tegra30_fuse_init+0x70/0x13c
  WARNING KERN  tegra_init_fuse+0x154/0x1ec
  WARNING KERN  do_one_initcall+0x7c/0x1c0
  WARNING KERN  kernel_init_freeable+0x108/0x2ec
  WARNING KERN  kernel_init+0x24/0x1e0
  WARNING KERN  ret_from_fork+0x10/0x20
  WARNING KERN ---[ end trace 0000000000000000 ]---

Jon

-- 
nvpublic

