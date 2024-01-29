Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951755C8FD
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jan 2024 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706529926; cv=fail; b=WKDyyekuKs14C7gXdKJqZ6cW6ncwGO0Z7egggZW15K+tcFtBFOLA+rmmAY28I08tNytFnTpqN8YD2bqoShM3Vqs+2AHkCus9vWp5Oh0m1FvD0I+F3uM5tduIdUCcwJEhWNkS5IqpHWrERZQyO5bShTchczmQ8lRMIfnUlqn+x00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706529926; c=relaxed/simple;
	bh=GZ2GHX9HDolGhGE0MOsR31gkFp0fPVj5tdjN88QxxR0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dl8bLZJOmjuIAoWqqgPktqdKgf7s8fT7xMweaqocfM89j5JlRQTRv1p6DOC375ndD7UGqwsS2gzQNA93ukKzbeZbCsChfdkxxAwLGMZL38M+PhGx1lpTjLtS1oXCg/UDo+kOwcKPW8WCD8upboZTBYUgbmS9sKV6ag41Ubk/SPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fBR0e/cx; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fBR0e/cx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgX/OWii27IT6gjpzY6gP/mVvOK33JYIUk9x7RHKzzhZgeANCGHMRbypZ34OSeQGs8rL3lLOwRATU69O6Qt+dpcHvsTfg2RTFM98HXIDXlo33AcpUEVrlFyLiNKxABaMkYKPMV+1/aIWRH5XbM18CpO50v9n+UxN6E9r1MU/JvJ56oI88020SIY69VLAwapGkuw8D4irb8rySsGhvF0672lnXR0TfsHNCcxCWSj3g5h7RhCCnSuflPJUPkNFf+AMDsVqMkTPTbAGSTlMjGZGWsMxmABNGWq/mWnwaYKaAg8aWzZN542unN/RCsFLJ8u+zQuQlVj9edXp5RX0bxBFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKupSjDdIB2x/T1CI30bHC3oQH7hDdAUjQNAhxuW2L0=;
 b=Ga0hTdg9iNekwrrk03zZJOrL5dxrhXoDLaSz8OaRxYqCOkbtzpbNn8EfEoIs++rLzP5TMNVrPM6fjHFUiDhFYtB18r0br+JF5AMmM7ypMZFe1giKpmuucAcfBsT71Dlwki+F7ch6FAhD6KZmVNiUl73DcAZ0Xl/+vjj5BD6cQV7O3iX0n/wVPwW6cauwEjMZSqp2dmsDQhVvDb2KnoIRDRuZi1pGdbPUgVRsjJXdE0Oz4TdEMbgbaC50cho7W/8ea0WrwF/v3Qn+PJByOyDPO8tv5YiW+adn7krwZ2EbwonApbfVa5laGXpcuGF6QT3K35kwbRoJypEH8WhE3H6lVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKupSjDdIB2x/T1CI30bHC3oQH7hDdAUjQNAhxuW2L0=;
 b=fBR0e/cx91rY6pMPzjTHnpBwFILRBGEl0IHylr+BHPdGi92Z86dmu7wtu/xqugU3A8YDTBB2cffK62IzvZtz03LRWEAhWlD4tUiSq5BZS7gY9bdfQFG9OE8zHuZ4bv7GqdBbHdy+5DX6n+suKPSs2Ls8206cAV/C8nVCvZCpcLtop4VQUcongYJhH3XxBodZLrVxu3fRnXGEOAjBqsQahxp/yK2Rn0fTUal/b2f78nSs2KF562M4sH2MoFVcJGqskG1EZvJzOjzBKxJLK9gs3zAT0LWXu9FLNJB5AyCF8YVTiPbGHeg6yaMjWALReQKHuj9wsvHrFpbe2L/yGisLJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 12:05:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::acb6:8bd8:e40b:2bfe%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 12:05:21 +0000
Message-ID: <90bfc573-d82f-40ac-8214-a8387dadf545@nvidia.com>
Date: Mon, 29 Jan 2024 12:05:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc/tegra: fuse: Fix crash in tegra_fuse_readl()
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Kartik <kkartik@nvidia.com>
References: <20240129120151.16198-1-jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240129120151.16198-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::24) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH0PR12MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: d226e3c4-c80d-48f2-dc48-08dc20c2908b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wAyOxEnjOwYnHoj7ND+7nM+nH6SZvz1ZU0GdZIY2TqXxDSk0mGJdyx+IIQcbhJbZfyzqBGeq6OymhzWQOVCnyMuv8Zbyp4itCRs3uEo32uQsuCLVHRdb3ikuey5sXjtf5nx6RwlgB9DSZl+AikVbAwRoQtBhx/LfDDup3zZb2ArVG/swu0roA/xZBx/V9jEJBwwSGRRE4xBZYjMdR23GYjBjdPAQ9h39GBvxxvELqNkuEWHVD8A0kZcqo+NpmYP7TYmaxaud4Z/wl5ezVtVFXTkAnm9OFmcwY1NumOzxG6Odci2IpbfYNMatxJrBuaf8U7VKl975MAq28+GZOyAoRci/8ZNmXKcX4BEcyRKi5uv8KRBBuuNgGFkZZaruS3/7ear2fEuA7+vMVT2Fo+49Q9v03SQdBkJQupsuaPBTJQyqrd11WVlXpXTgQHlj/vVjKUHUFy3q8Y2MUI7hf/RKnDQl7fjn3yq/qlxd6eZJXZ3oTK3hEEapPPtbNYLMLc5UqSNn81gUKpbwlpN4sJ9P3jfRvGlQBO9qYp4uN9+GuQqfy9Q61dQsO8NoROQk6ZedUHbQM6kvUqtTJ+SePJvdhzkiNXDD6C1uWLTy1HfkEu+jW5EAnPWuNC1fKNmFY9CS0ov2V33dl0wBcY1mTvjTLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(31686004)(38100700002)(66556008)(86362001)(6506007)(6916009)(53546011)(66946007)(316002)(6486002)(66476007)(8676002)(8936002)(2616005)(5660300002)(6512007)(55236004)(45080400002)(478600001)(107886003)(2906002)(4326008)(6666004)(26005)(31696002)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFMzMVc3SGd4ZVhxNkozN3lQeHdjLys2bjlDaXoweXJSRk9mNkZTZHNEby9S?=
 =?utf-8?B?VGs0RDZOcnF3MVJaQmtuVDRkci9lN2lVeG0wM0FnT2tYSkdQSjRKZGtMQUVV?=
 =?utf-8?B?bHNERHA0Q1VnWlJGZ0Uwa2poOXhscEhlWllIWWNKSGRSMEptM2c5cktSNGRD?=
 =?utf-8?B?WmlVVmxiS21vYkVmdGFSMkxJbk5IU1MvdkFMdEZBd2VacVlTODZLVFNvcXBl?=
 =?utf-8?B?U1JWak1teHE3cENZR1QrNllqWGJDVnR4ZmVUMHdsN1dsK3BuYno0b01yTElH?=
 =?utf-8?B?NlF6WlhlWFhHQTBPTlhya2NTMExPVVFKS0xLWFVGQVA5d1R5Qm1KQ29VV1B4?=
 =?utf-8?B?ZXdSbVZhNXpWNGJWVllUWk5FcU5ZSm5UNmVkY0V3ckw3N3ByNSt3aDV0NDl0?=
 =?utf-8?B?MmpTZTVsUkNUazdHVU85OTVOcGhXeFl5TjFIT2R0azdTdndhSjlGeVJvenF4?=
 =?utf-8?B?VDZ6blJtS3ZoNXk1STVrN1Zjc1AyMGNjUC84bUNQYzE5UWxXL2dWUTE3VVhi?=
 =?utf-8?B?VUJoNW1wallYWmowbnIxWUtxeHMwMlRybnBSbjdUV2duQmdxOU5qcFdrOWM0?=
 =?utf-8?B?MU04OUNpYWJVNklKRUlYcU55dkZ2a1AxL0pSZFlmMzRNeDA0dG5FU2FxeGNY?=
 =?utf-8?B?Yi82MWo0WEo2ME9UY1ZiVGZZeUplbmZNNTZNNzEyTmN5M2d3eXhMRDBRQkkr?=
 =?utf-8?B?blNpY3g1ZHhKZHgrTWQveGVndTVlRmk0VU95MlRaeFFsT05tdWwwMHFBY2J6?=
 =?utf-8?B?blFPWlhua1I5Sy93OHV5azdEbE5NS2tSTEpFWFpKdUlIendBK013V1p3Vk5k?=
 =?utf-8?B?UXNCM25xb1ZNcmttRlBYeXNpMGQ4L1VyYVRZN1VSdkRCa01FQ2J4NFBDQ1M5?=
 =?utf-8?B?cjFSUk5MU2xCOWhWM2g2SjJDb3Y2TjdSWkpMb2dFb2dadm5RTWNQaUhES1Vj?=
 =?utf-8?B?K3A1enVPTUNjcFp2Q0ZVWnBPdHFoZlc5Z2x0SjJRWHhGSndjMHorcUZ1ZFdW?=
 =?utf-8?B?bDJTaTdaQlRoQjBKMllrTUtKQlBUdWF0bXdoQzhCN2FhMUJlTlhHS1dVZUVQ?=
 =?utf-8?B?MFBRQllFMEwyZDE5aGwwQkx5cGx0MmhuRVZrc04rVzJURy8waGlrbDZ6eUsw?=
 =?utf-8?B?RWMwaG54MGR1QVltNERhMDEvUDBwaTQyZml3di9pN3NlQi9yeUsycDdMdUNu?=
 =?utf-8?B?dWR4Z25IUllMUklsWFBhUEdpZTdTdEVlbXl0a0Jpam03cEVmRDl0T2lpWVZ6?=
 =?utf-8?B?RmdyM1FvUXpHa3V0VGtSM1ljT3hhTU41WXY5SGg0Y0NERmd5RXdhUkVEWHI0?=
 =?utf-8?B?S0NUZUFuSEhGdHdqMnlyYlptZTZLZVdnYUtLOEd5cDVTbFFobWh6SzhEVzBo?=
 =?utf-8?B?Nm4zc2FiSDFvY3dJTW5NZ3lDVWlRWnFJT0tTRzN2ODhUb0Rwc2l5c1JneDhH?=
 =?utf-8?B?cDZjQVRwZXRtUTNRc29UMHpDN2V6ZUZuOGRPdnBIL2kyMlhkei9rYzVRRzE2?=
 =?utf-8?B?a3d2VHZLMFQ5TCtkTEQxSlppNldCNVhZeFZUUWZrVU5nVXEzdllUNlQ5V1VC?=
 =?utf-8?B?OWRnUW8vdlA0eHVrYTVwSU1rbWZoNW1IdTlqemhXdkl5Z2NSYUxLN2l6dHJm?=
 =?utf-8?B?R1JCdnF1bEt1UE1PbGtyekpKWXluVkNidmZRV1ErdGRUZ29GVjFrMjBQNHln?=
 =?utf-8?B?bFV2OTB5RDBTTVhuRmRJcDBxbm5wOVZzVjFqTk1jYXl4ZHNJSmIyNjFBd3dQ?=
 =?utf-8?B?aFBnK25UZUMxZlRka2FUZzBiQlkyOTJVQzVyU3V4akk0eE9tUjhxSkZLWStZ?=
 =?utf-8?B?eFpwNExNSDF2RkJTMW9qUlIvUU8wRXVmZHBWRHhISTJvaDBzVGFVblN3b3ZR?=
 =?utf-8?B?TVZqZFltdVNjZm9HQWhFS3h0TzRKUThieEdGN0ZDOVRXaHFveUtCSmNDNld3?=
 =?utf-8?B?blFBZTRZc29SUWVtY3FGMVFXdUhCdWlXS1N5RWJmek5FYklsUlpGZ2FYU2F0?=
 =?utf-8?B?OUVxelBBdFFCZmswNVNwa3BISXBqRWRyeGZYczBLOUowb3VuS3VZZzZ1L2pa?=
 =?utf-8?B?NW9DRzJSbW9TNWRGWnNGY1ZPdWZCNHJuY0U0b01WUGZNSDMxM2JxbFg0VWo0?=
 =?utf-8?Q?N11q1q5rG8eW07wbXaIuNwqN8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d226e3c4-c80d-48f2-dc48-08dc20c2908b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 12:05:21.3210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0qTvzmX2nw+/zKRg4kDinIfuoXAiNbB1CEKBeVRP1x5nBo7mTJiZ1diXZF5bypVfsnUV9DaSgh7UAEbOw7JtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073



On 29/01/2024 12:01, Jon Hunter wrote:
> Commit c5b2d43e67bb ("soc/tegra: fuse: Add ACPI support for Tegra194 and
> Tegra234") updated the Tegra fuse driver to add ACPI support and added a
> test to the tegra_fuse_readl() function to check if the device is
> booting with device-tree. This test passes 'fuse->dev' variable to
> dev_fwnode() but does not check first is 'fuse->dev' is valid. This is
> causing a crash to occur in Tegra XUSB PHY driver that calls the
> tegra_fuse_readl() function before 'fuse->dev' variable has been
> initialised ...
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000290
>   Mem abort info:
>     ESR = 0x0000000096000004
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x04: level 0 translation fault
>   Data abort info:
>     ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   [0000000000000290] user address but active_mm is swapper
>   Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>   Modules linked in:
>   CPU: 7 PID: 70 Comm: kworker/u16:4 Not tainted 6.8.0-rc1-next-20240129-02825-g596764183be8 #1
>   Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : __dev_fwnode+0x0/0x18
>   lr : tegra_fuse_readl+0x24/0x98
>   sp : ffff80008393ba10
>   x29: ffff80008393ba10 x28: 0000000000000000 x27: ffff800081233c10
>   x26: 00000000000001c8 x25: ffff000080b7bc10 x24: ffff000082df3b00
>   x23: fffffffffffffff4 x22: 0000000000000004 x21: ffff80008393ba84
>   x20: 00000000000000f0 x19: ffff800082f1e000 x18: ffff800081d72000
>   x17: 0000000000000001 x16: 0000000000000001 x15: ffff800082fcdfff
>   x14: 0000000000000000 x13: 0000000003541000 x12: 0000000000000020
>   x11: 0140000000000000 x10: ffff800080000000 x9 : 0000000000000000
>   x8 : ffff000082df3b40 x7 : 0000000000000000 x6 : 000000000000003f
>   x5 : 00000000ffffffff x4 : 0000000000000dc0 x3 : 00000000000000c0
>   x2 : 0000000000000001 x1 : ffff80008393ba84 x0 : 0000000000000000
>   Call trace:
>    __dev_fwnode+0x0/0x18
>    tegra186_xusb_padctl_probe+0xb0/0x1a8
>    tegra_xusb_padctl_probe+0x7c/0xebc
>    platform_probe+0x90/0xd8
>    really_probe+0x13c/0x29c
>    __driver_probe_device+0x7c/0x124
>    driver_probe_device+0x38/0x11c
>    __device_attach_driver+0x90/0xdc
>    bus_for_each_drv+0x78/0xdc
>    __device_attach+0xfc/0x188
>    device_initial_probe+0x10/0x18
>    bus_probe_device+0xa4/0xa8
>    deferred_probe_work_func+0x80/0xb4
>    process_scheduled_works+0x178/0x3e0
>    worker_thread+0x164/0x2e8
>    kthread+0xfc/0x11c
>    ret_from_fork+0x10/0x20
>   Code: a8c27bfd d65f03c0 128002a0 d65f03c0 (f9414801)
>   ---[ end trace 0000000000000000 ]---
> 
> Fix this by verifying that 'fuse->dev' is valid before passing to
> dev_fwnode(). Given that 'fuse->clk' and 'fuse->clk' are initialised in
> the same function, test these variables in the same if-statement.
> 
> Fixes: c5b2d43e67bb ("soc/tegra: fuse: Add ACPI support for Tegra194 and Tegra234")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/soc/tegra/fuse/fuse-tegra.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index c34efa5bf44c..efe9853d4a8a 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -348,7 +348,10 @@ int tegra_fuse_readl(unsigned long offset, u32 *value)
>   	/*
>   	 * Wait for fuse->clk to be initialized if device-tree boot is used.
>   	 */
> -	if (is_of_node(dev_fwnode(fuse->dev)) && !fuse->clk)
> +	if (!fuse->clk || !fuse->dev)
> +		return -EPROBE_DEFER;
> +
> +	if (is_of_node(dev_fwnode(fuse->dev)))
>   		return -EPROBE_DEFER;

Actually, this is still not correct, because this will now break ACPI 
support. I will update and resend.

Jon

-- 
nvpublic
