Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83F38887D;
	Tue,  7 Jul 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405728; cv=fail; b=k8BZnJsuJEX7gzK/2h+7DWD269kkOtikNMzRLMozPfDPeTKk4siUsStN6ohw47CYISAO983pa7R80a2FBwh5P+i1MJRz4ZfGFcR9QAi3/Cnth01dfQnCstmnmGIvevZMVk1cMwdyD2tYb4RYAxaf0fwFT+Lwiqsov3vCecc2vWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405728; c=relaxed/simple;
	bh=KZ67zj8u0lbrHAGp1sK++97b9bnYYu8lbbD4Wl/0WgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Poz5lrKJ5QABWV7Ly0+gNTOIB/Rxp6fknmZKznMU1Xa/2A1aBnrzbMIwOGQvXdzCRDqxaq8pb+35RbaSG3hD8h5WVdjXa/a+EGuG/xlX6vNF0qiMCwVS/CmFSWiy5YN6NGhyZETSDDocG123ajBRrTQ3F3DTOXJMDepgegLPtkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=drCY2+h8; arc=fail smtp.client-ip=40.107.200.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="drCY2+h8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GC4QpmnOTwWUSr+LRRX9nT78y9MGBqbvAjq29h441422cAaM1p6GRzBpZhl48IxyZl+oGilbTyL4VJgI+A9pXedsj6l09otuZX0uTihtBtI4QPhQVXt2E19hH+ha6d//XpmPX0Q1C5uQnkaTccgyxxoCobPAw13g7Ilng/v7ulbXtMr2M7jGoZWLKxD4r3hag1WWEs0yaTm4ACMtkuoqRnrajvrgp+JWWOMfIdsKOKGyxR230/+nh8QQ5CaCVO4JdIQ3GdbCWxNIkuZOMwalvQzU5QFLaRyYtts1xqqI/cbTsdqEWkrw9veCDfEusotoOJdn1pChBFIOuATiDL/q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIjAmgJhTp3Y3lhGABs/75G3xT8Z/PMxku8K0yDBIZs=;
 b=GXYFAgng4L8CSiPYNBsBwJZCiD+ivsdVjRBdWDju30iM8d8jAm6rzdWQjvmTpkO7RYy/jbX65AsZ/MU6Xmg8aeY/P9rgskcQ7P6quAWRdGP/gpjyNP7IyKiSLwtXccQ7TYFcPsWbk6OAt634eMz+OvMpurvPeAysmdep8dUgIlvPlTLZa0RydoHLee3L9rSjt8fFhEzEmDtckZO3ctyiFBO2SBpXZuAnWqmSLnjueS1LWXUStVfkLGYetox0yLXMXLyP268BIEhTcoLQDvtv8xngBSuBXFSfeHWGV3sRJksmKsIc8M/joZcfOjWetS1JTnjxWEq2YXNGoNV+q1NxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIjAmgJhTp3Y3lhGABs/75G3xT8Z/PMxku8K0yDBIZs=;
 b=drCY2+h88dVh+VPvrXyKB4hAlBjEzEcCE/eMFSug4cnGDtoZpIEdiil+t/dkisWR8LDp26KvgMe+cp+viiIwB//IjopmO1FbBlNkBoeClwav5omuQQ1VKUI4bygTVvKG2ECObTjTKUWWdC574C8BQwC6OdtMw4m7KbQ/zx/vpHhkdNhspWZ9RDExMkwOSICKBcDGAgdtE9AFTVFgtNqi69dd051ykeA5XeIVTKl8tuXh/ZL7F6NG8Rmc9DITd+Spc1zu0FDNihovdc+z6D5nNcI/9s0ht7hlAWal1fO9E+lNn46YSQFrdyaDceyJE2T0v6TZK6cS6z1NoF+1nTNHuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 06:28:43 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 06:28:43 +0000
Message-ID: <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
Date: Tue, 7 Jul 2026 07:28:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, Timo Alho <talho@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, linux-clk@vger.kernel.org
References: <20260602084334.350895-1-jonathanh@nvidia.com>
 <ah7F_QDw5hT2KdWB@orome>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ah7F_QDw5hT2KdWB@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 29207ea6-b9b5-4320-9b7a-08dedbf0fdd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	uaj8U2wzHIEh9oM8z4KbPY6GwFXr8O5OeL6nq/ctwkryqeR+caXSQdoppdz3ypfEp9gJogrxWt8aGNT5sYHbMybdjk/niOmwViVZxzezSf6UQ4lLLZJURHkU6YaOKtPQdmXhqFzq2venDo/ykQ/kUyPfJtbC7L+74q6/D/O5rIlH2GH7O3trADP9CsCJyAoENqlAfM1UkABB1ApoQIf/GOoOWggPMCQDOQosADNYHAsrm0K+h35tTf/hcjZabdAvNR90faJmw4RvRmP3XUu4z8Q27LRgXDCzj9ORByJuXdLQTF0x3S0ON/4ELJ9/WzMdXpqDkbkbBxZ0GbJDIV02A/wW8TFKbj7Tviv9JVd2EFxfdOY+2LsdEQK4fhxqI+w8rnYwgUIMY2UBDeB9At30EimeYmPkcu6WaOfBbHQg4CURIi1Ut/1d4eWEYo9fLVQfPceqnad9lqE3vygxl0i4dH5+U6QWpPoIztIaIDq0qRyHDEy1HU3M2xUuQyxXHFM9dahLi21PErVREbv5eL4pg6ecLgKUDUZsXJWgXHmBhnQlJ+c0FNTDY9kNkQYlZGK/HmSneNXRftARlKAHS6e8oN/BcmvuWf0QqwahHWf8U3DyWIC4z43Q97s4tJY5ZtCLmeuG3/XfesG3ZXRQZnnkxRKQ7a1aZavbN/vwQUEe4rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjV4dnBRMnZEeCs1d1lqRnF0aWFLcW9vRk12SWNHTys2dnJXVllwUzVNeUhQ?=
 =?utf-8?B?dnVWeW9sdmY0WldldnRaRkw5Uko5YWMzSEpLeFFjVE9ORzh1TEdPb240YWZq?=
 =?utf-8?B?TVZ4WnNqZzFCU0hwbHhNZVA3ZUhjUzVVSVZlSWVRVFZ2VjhwbVBobmlwKzl5?=
 =?utf-8?B?ZERNSHFSRFZ6QnFqZWUwSjduZjJ1emVEb0JuOVlKQng4VUJYVGZuWWFlR0k4?=
 =?utf-8?B?bGdsNmFMK3BEeUMyTDZPWlBXRUVhNFpBc2pEMlozaGlmcmFDL01PTXMrODg0?=
 =?utf-8?B?MHZtR3RzYk9yNjZUbTNWY2tHaHRlN2pnWnVnSTZsYkg5YWd5UVorUUVVclF4?=
 =?utf-8?B?VzRTTWh1S2Z6TjdJTUZSL3QvaXVOVHdxdmZPRmc0bUJHdHJyc0VaWEw4SGpF?=
 =?utf-8?B?bXI1ZUorUlNkOVorQk5FYXVybUUyNmR5Yy8xaTd4TTJLTFZMZVMvaTZlUE5B?=
 =?utf-8?B?VWVodHhsSGQ1SGRDeDFzcUFCV2hoWG0xK2IxNW1xb3JNZUFXQ0E2VUJpQXhJ?=
 =?utf-8?B?YkFrVDhrV0hGZjRaOXNmRnZONUxucFZpbHJXMEcwZ0E4enNldjNNTGRvaGwx?=
 =?utf-8?B?dlY4UTIxNVhNeXRaV2RVVmxBSmx6QjljZVJHdGJ5OE9jVE85SnJxMmY2UzhN?=
 =?utf-8?B?Z3p1UHhFYS9YVjhlRmIzTXdjRDlydVZrMVRGanQrVXNhTk0yTGFhbFpNSUdC?=
 =?utf-8?B?UEhJWitIOWFXWFF4c2w4RlQzZzFWWThObTROMGQyK3Q3TWFLb2pjVlZ6THVl?=
 =?utf-8?B?UjBkemh0Ky84Q3JBeC9tbmNNTDlrcWhTbW1zcG5adEMrRmFaUjgrVGd2Q3F1?=
 =?utf-8?B?K0dJMjAwZkFOcngyd0VQVnNRMm51bTU3TElVQ3MrTElEU0lvUFk0cStLUVdp?=
 =?utf-8?B?bzB0aExjblAxTmMxYUZKN1IyS0VCTkw1L2JhRU91VDJhb1FIU2RkYXE4SThN?=
 =?utf-8?B?WGVLbEtiMGlzMjMzMGRLYjFYakZUdFpDdG1WMlMwYURZMENoUWlVU2NOTDY3?=
 =?utf-8?B?bWcwSXJ4RDRYakdHbWp6NDFrQ1grVGUvcEF5MzBzTXpjMWFHUEJGb2REaTQw?=
 =?utf-8?B?a0x6SzdQRnpmeHY5dW5VSGttYXRQOS80VlNPejVuRDE5bE12QUtBNExPRGNw?=
 =?utf-8?B?Q1p3Vmp3SWFjWUZTKzJCNXljVm9EQVdyNlZyOG53QmZPM013L3ByMHhQSkFF?=
 =?utf-8?B?eDN2R2crY0g4WlRlREowTklBUDZrQlQvMXJWaHkvSHFuMWwrY0F2S2RxOFMw?=
 =?utf-8?B?SUI4Y1M4TFREejlaWHpzUnlacUJxb2pvQnk5bThNTmltSW5qZ1NkUGF1ck1Q?=
 =?utf-8?B?VUNCQ2pUR01vRUFNUVN2QlhLUWFtaGFoSGMzVCt0bytnU0xlUzZ1cFJHNThI?=
 =?utf-8?B?dnJkL0s0SVB1UVdGUGNIcmdNQUROc1ZMenkwcnJtREJPamxsYk11L29wcEZm?=
 =?utf-8?B?VkdPeGdQSlVxQ1hyS0JCM3pUbE1ZQ0ZIY3N0Zm5RbEVmdW8ycjlIUTF1UnBj?=
 =?utf-8?B?Ly95RitSSlIwUkFzZWM4NGFvWUcwVW9udUxxdXVVeFozUTdmdUxyd3k0Uk9u?=
 =?utf-8?B?ekJSQjY4SkpJY3BjMXJzcnJNRk1ZdGNZUEd5OFBSMWJ6OUNiem1KUHkwaWFJ?=
 =?utf-8?B?SnFFSjBhU2ZjWDNjOGlVaURBV01XUThQb0tKc1MzdXVEQWRGY2JKS1A0ZXp0?=
 =?utf-8?B?ZHFmMUMwQUxvTGRwbVVTOS9mb2FFaEkxUThCNTFEWVdXa01nZ2JReUVpdzF4?=
 =?utf-8?B?d1JYRDVLSUNTWWVSSWR0TzFSMndKa1ZkRURkZi9Xczc3cHhIQmRNWENhYXhY?=
 =?utf-8?B?RGF4MlBrSVZpQy9JdGdpYUNTKyttWlRPQnFPc2Z2M0ZuMDY5eG10UjlVM0xp?=
 =?utf-8?B?VnFtbDNGb042czVOdEUwdmI0MWloS29tWHg2MFBTM0FjcWw4UjcxV1FiZEtV?=
 =?utf-8?B?UWROdUV2cmJ3ODFubXVVWEVaWVNHV2JmTFRaS1BSSjIvQXhqRVJpeVQzSmxj?=
 =?utf-8?B?N0ZzdlRLa1JtM3hoSkw1Ulp2SGlOK1p3NGJxaW40NHpsbSt3VnBtNGplRlMv?=
 =?utf-8?B?eXVuZkkwdGhWb3lOcnNvYnhRRFZKOTVlL2pkR1FaTDZHMi9qSmlQbUIwT0xD?=
 =?utf-8?B?cVIrYkJJYko3dThsd3pZWE1jOXp2TmVtcWxRZXY3U2t3ZTkrTUt2VDlHRzVI?=
 =?utf-8?B?aHQwU1M0QUVHNkFKNzZjT3pWOWc0MGFHTERqUnFWanhvcmZQaWFSMU0reVRC?=
 =?utf-8?B?LzRpb09OU29YNWZzd1pTWG10U2d5R3FIdDJ1Qzk0VzJYbE9EaWlEOE85VFpm?=
 =?utf-8?B?T0ZXdGJIQlpZd3hmZ254amJXUWNIV054RldnY25zYitLb1FEYXNtV3pDanc0?=
 =?utf-8?Q?e/0Eb985Bx9BA/54pLiwa043L35dkOFviU0oIx/bs9PGT?=
X-MS-Exchange-AntiSpam-MessageData-1: eb8GbCR6aw8VYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29207ea6-b9b5-4320-9b7a-08dedbf0fdd8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:28:43.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXPwrLBI7K3e0ehvGddYrbANRehUYDoBCK2Hk4RVltZ8UdY3OEJbaG5HdTCZeCfcZQV65RXg+pAvf5BajlpIBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088

Hi Mike, Stephen,

On 02/06/2026 13:01, Thierry Reding wrote:
> On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
>> On multi-socket platforms each socket has its own BPMP which exposes the
>> same clock names. Fix this by using the NUMA ID as a prefix for the
>> clock names on multi-socket platforms.
>>
>> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
>> future proof against anyone changing the size of the 'name' array.
>>
>> Co-developed-by: Timo Alho <talho@nvidia.com>
>> Signed-off-by: Timo Alho <talho@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Changes since V1:
>> - Use NUMA ID as a prefix and not a suffix for the clock name.
>>
>>   drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>


Please let me know if you have any comments on this or if this is OK to 
be picked up now?

Thanks
Jon

-- 
nvpublic

