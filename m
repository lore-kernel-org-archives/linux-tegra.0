Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47960C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 18:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 377BE63311
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 18:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237612AbhKOSQy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 13:16:54 -0500
Received: from mail-dm3nam07on2062.outbound.protection.outlook.com ([40.107.95.62]:65503
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240724AbhKOSNC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 13:13:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EocNSXw0WZCToSZHB0SlHCOOjH4UzxVVIVoc3ErGp/AsaBM9ulVd0tt1n69FSF+ZEIWzVY6rWy1b/WnNLoxy1MDV9DBDEDJIKnB/dupnZwCoXUKMnbBoXS/Al5ZtXaOcqepaPpQxi+yDriZubFDtj9tOiutMs34jZ5JiQ1yBJisGd77ANpdCCwTH1FmpLAT8r3sWN8c0iJ0I9Z94NRs5hOzKjWBd9t5cHNUCiSGycebBy8DhlwPtMSn8iO6gn8z5841f3VgMMDbrloNUst8p04mpzS3YxUxvnIf1uAcgi7sDe5WLx//YOv5SntCuSnkpXsuwvFVboaxt/O1zNMZjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE5+M9pJ2j8R44rxPR6GuW/8KwhAuNPVuBIQEGQg1Uc=;
 b=QfAb4DmCJlKglY4KlGIwzwtbT7qJPehar4bD+mnE3WpcKnmttdMETnwTmieQGrHO2oBGqEmb7RNYLMkOqlHEV2gGRVWLAVVW/yWW9JgF3nXHhjnlSJClMEqGrYI+l0p/m/U5KfP1k7Y5vTz+vpAICypWY5MvEWlcFWKe51DtNoJUKzkVFE6fVjn2bzyQt37M9YQtfixJh0s/1s5+EA9Gj0I4SCJN0tuvBONqqOGs5CQBXlBb67UHiDZ9dJULqdekMuQAEsTsuWl8Q9ODnmv1QpP/11+bAzgplaA6D0AKe0SC8WplsL+KSs7N2BhKjTBStzKGdb6oobnRxiui0ldBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE5+M9pJ2j8R44rxPR6GuW/8KwhAuNPVuBIQEGQg1Uc=;
 b=Kfs9xjtPNF/wu/67Y3AcmocYjHOdzQ9dNBIecwznIP/BDRAKHDWWmgmBFOTrN4TAaDjp62ynok0+oGzYlPkrKw0fetbdBYi7f2erNnPH2ZaZXrlHpEZpTQ8Q3NIDH+RGlTvvPICfjdJ/VTqHsIiVZgRRz7aUXVLwaBPNRrWkiiktIN/YoSp9e7MA97xSvRqMlsCSNTH5yYAIrisr4+jb/MXoBWjOHC3yPCHOW/EY+KGDTVp2KYCOrD7JWYnrfnyI2GHQ/ZsR7+WE6eMZbdoMoMT3pTn7pf7lngveewr7x4DK4qce5l8Ypgo+ojx+9ZCitWv47lk96uBtLyGUesxNcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 15 Nov 2021 18:09:52 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::c884:b4ad:6c93:3f86]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::c884:b4ad:6c93:3f86%9]) with mapi id 15.20.4669.016; Mon, 15 Nov 2021
 18:09:52 +0000
Subject: Re: [PATCH] reset: tegra-bpmp: Revert Handle errors in BPMP response
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211112112712.21587-1-jonathanh@nvidia.com>
 <417a93fd-7581-1d33-1522-31f05ca253b9@kapsi.fi>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <984f6fd2-8d06-11b2-4e8f-b9db924a6519@nvidia.com>
Date:   Mon, 15 Nov 2021 18:09:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <417a93fd-7581-1d33-1522-31f05ca253b9@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
Received: from [IPv6:2a00:23c7:b086:2f00:a374:5e26:cce4:6a91] (2a00:23c7:b086:2f00:a374:5e26:cce4:6a91) by LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 18:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ede1eb2d-319f-465a-25d4-08d9a8631f12
X-MS-TrafficTypeDiagnostic: DM4PR12MB5200:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5200B2328DB179FF85F29318D9989@DM4PR12MB5200.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASkA8KRHiox7QjzhUlI2CHcIw0VpE79UU4W3yES3h7cQQKoq8MXvo8mMNScf66/e7KIWxtk5gQhZcrpb5VWCoh4Kh80PWu1lkjWvcJM9fFFe51VHicqa2L0tltosIkFuvZIudqt9qtTj2jnGy9GGoXpj+nEe0z7UKNMBb9aJbGnq+dpwHjLHo05uCPXtappIJaN/irnm3QyHSAGsh3bz9J4uA6j3qXaruSmKwT3RJtAQ/0Dc5LhBlKV7PJDBjkc1g25+STYIbt79rGt/TWybqwk/zPr5P38CzktPim04xAd/2DBSGSmbVxjBOD/gbF4WXkmj6EbgF4fcb58ILVKUHdeIjT3K9qv1xD0POnNm9JnfnkFNbb0afDsAnxf4ZItwieA03ycJUepN2icZvi81RrLnxYAxs2ccKc0B5mZ6OhkrwqwzDLd5+4bq+H/m6/yUe+yjKfMMOXGGvhjnj8XpYD036KR2bKuCVXNOs62u9sHybqpOzCKZFmHkVOrv4/VI4ZRtHsktD49b2tyB81f2k66sxp6fTb6WG82dSxobZHYspgc/WnoDR+HgnOf7HoHlGHhxonJKMyFaSUeH8FZnaqCqMsRTLYld03jkZAiXaOnqe8kfvpQGsWCZIzdCOgzZUld9taES61W2wiAbl+BMcOCF0KjJzQfUs5NaWtBDNTOLv3b4iLlYJA8Epw7aVGJxcqIYh1gBh4dxvm8tmxkeFMB0Xt7MoZsqtW+DIaZlhE/VLZOSUs4P1cx4PVeziapg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5445.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(186003)(8676002)(38100700002)(66556008)(508600001)(5660300002)(8936002)(66476007)(31696002)(83380400001)(316002)(66946007)(2906002)(110136005)(6666004)(31686004)(36756003)(53546011)(4326008)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlMMmh6Y2JYTDlCTUFNSWw3TXo4bDNmVk5sNHdBMUwwNFhLcjVKN3hyVk9a?=
 =?utf-8?B?OVBOZFJwYWcvc3J2MlVHb2NUQ3FPM3FBLzB0WTk5L3ozeTI0WUlXeVRUd2ZI?=
 =?utf-8?B?aHZYTzB1WGJhTUVaaW9PWFNkUU5uUmY2Z2NHcGVJTDN0R1pyK3d0TWs5dStF?=
 =?utf-8?B?UmlZalAvMXhkZksyUERMaEt5bndqaDQ5OStIbnRVMlRyR0pKTHlUbWd5VWxq?=
 =?utf-8?B?VVM4SnFkOGJEQ2V3NUM0VVVHUWRINldpTStjQVBTUm51bnVRSW9SRWVGRHox?=
 =?utf-8?B?TzlaNEFBcGVNREp3M0k3WUFiOFdFYUdwaU1JclNleW1tNlU2dG5zOFFmeUp1?=
 =?utf-8?B?R0FmaWx4SVJNNlJGbnR1TnpLZE8zQzh0ZGxONDdiVW9NTnBGVE9ETUIyMytk?=
 =?utf-8?B?TzVzaHRrZTkvK3hhbWkrUHQ4SnpHOFI2NXdvalZxbDNyS3BMd0VjV2hCeE5W?=
 =?utf-8?B?ckxoVzd6TkJQaDlDbkEwcHc1VmRJU1B3RXc0WmJpc2U2OGs4UVp2bVphbzVE?=
 =?utf-8?B?R2lNNmtVelVtaDVvb1NPRnRUdGJRRDNoY3Z4elZkR3o4VnFGaURFZCs5U1ZE?=
 =?utf-8?B?dUhYTTNpUXhqU1lWSmRJeGZFL0hPck93TERHSjYvaytrYzREUEN2dTJSNXZW?=
 =?utf-8?B?Sk1sUnVhNmFaQ1JVRWl3cUVZaVByUGhwU3JlZjJRcW1DZUE5SFhLZzFheW01?=
 =?utf-8?B?WGpiR2pDY3lVL2tMM1FhY2VrQUI0U2d0ck5mblNYTmY1VWVBeHU5Q0UvWkox?=
 =?utf-8?B?dFoxYXRFL1NYUkwwZnNRTFpMb0FsS1RqV21mVjEzdkN5M0R0QWp3clJUa0Ur?=
 =?utf-8?B?RnVFZ3RGSDZ1SXJPcTcyYjRDcDlDWVdMbDFaeWtwMUtkWlByNkRGdWhJeTA0?=
 =?utf-8?B?Vm15Q3VMdDBReHdNbVQ4b3RxRVNCZHp0eTVkUFczYkRKRVFrdWppQmhhR0kv?=
 =?utf-8?B?RnQ4K2puVmhmbFBrSjZTaHI3VCs2dWNTeGlaWjNacytXWkZ1MmRUTTQ0dEtJ?=
 =?utf-8?B?YkN4OGVIRWNlOVBvS2lwWHF5aVl2Q0o5emhtN3dTMU02clBRVUR2YjhQWU15?=
 =?utf-8?B?UDM2cDArWGZJRk03Y2EzS1l2S3gxM3h6QWpRM2pvNklDRW9JdWF6TzlaNXJt?=
 =?utf-8?B?SUN1TTlvODVSY0ZCKzNqWWxDekdOZ0x4S0x3dnZUVjFLUSsvdFJjY09rK3JX?=
 =?utf-8?B?cWloRTJyWnBrRndKM0ptL2lDeXZiRmxya3piNk8yWXdCWEV2N3dyZ1hhSisz?=
 =?utf-8?B?d1Zvb2gzZ01uajlOK2ttb2FRaTFHMU9PQ1FoSmUwNDNsT0hrSzYwUTc5cjJ0?=
 =?utf-8?B?eXlFaDhURERVTW1NeXpLTml2c3RJM1BmYkNJRkF3ZnY2VXRPQ1poODZXdWRP?=
 =?utf-8?B?SXdVdWJDY2VBTi9zTFNPZjMwN09UU2h0Z09ob1ZUbzdoRjRQaXkwSUxWYnA4?=
 =?utf-8?B?a2YyOE5oL3BvWE9RbS9VNVpQV2IwREVqMlZkOVU5YjBieU52MCsvRmQ4NC8v?=
 =?utf-8?B?ZTdSMmZQQTVlTko1SXVaV2Y0bVNWZmwzdmduNjBrMDhWL3hGYTNzZjdwaVFW?=
 =?utf-8?B?MjRXRXhKelR3NjdoZkVmZ2ViQ1FMVXRKZmlYTE80WmQ0cGFIMUh1RUpYMzZu?=
 =?utf-8?B?UVF6UzBpNzkzQ2F2RVhXWjlmRThJZTV6dUNPd296dDFCQzVHeUpvajBhbTZ1?=
 =?utf-8?B?ckJxalBHSjgyaENJNmIxM0JyWDdNZTM0NjJ5a1NENDR4Q2NaMFVmWit3RjBr?=
 =?utf-8?B?Y2hKK3ZmbUd2VTd5QlVLR2hmbDlybnFNS0pYbVgrWElrNitjaGVBMDMrNFVs?=
 =?utf-8?B?UmsxempYQ0M0ZVlqRTJHY0x0cUdUVmtQSnRpNG1pZ0FYenpBN08vazhpQ0Y3?=
 =?utf-8?B?SnRMYi95amZVL2VHc1hsclZENUNPTThvYjJqWUhDM3liVmN4dXZLZ2g5Wm9L?=
 =?utf-8?B?NVpXaUNhZFNzMnlMRGs5blN4TEdYWFBlckhRQ093RHFWcjhJK29walcvRlli?=
 =?utf-8?B?NENDMnlYZ3orQVprU0hFU2Vwc1IyZjJMWjRWYTdXZk5SeFV1UUFrMURmMG9Q?=
 =?utf-8?B?dFJwWldMOE4wc2JDSnRMNnpiL0VRTHdnUUNjbEFkWUx0OEZDMUswRXp5aGh5?=
 =?utf-8?B?NEJlTityc3pWM3I0UHgwR2V3bjVFNW8xcHBaTXJlNGlQV2o3SDVuMWpzblQ3?=
 =?utf-8?B?UXpla1Q0c3BXbHpISHlkODBnWDd5bnJyaDNERkxQMU1iQ2ZIeWVSck03bFR4?=
 =?utf-8?Q?Yy93xvEjT/kFP0QNbdiEKSZdtpncQYjG8MxWgYL8yc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede1eb2d-319f-465a-25d4-08d9a8631f12
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 18:09:52.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncli17RrqB+buxtLAf/rkkxylGUSisIhQjeXYntS6m8Xcj2WlGFnNhSS4lew1Jd4qA5Ei0f4Ro+d6w5HgWeZ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 15/11/2021 17:21, Mikko Perttunen wrote:
> On 11/12/21 1:27 PM, Jon Hunter wrote:
>> Commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>> response") fixed an issue in the Tegra BPMP error handling but has
>> exposed an issue in the Tegra194 HDA driver and now resetting the
>> Tegra194 HDA controller is failing. For now revert the commit
>> c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
>> while a fix for the Tegra HDA driver is created.
>>
>> Fixes: c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/reset/tegra/reset-bpmp.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/reset/tegra/reset-bpmp.c 
>> b/drivers/reset/tegra/reset-bpmp.c
>> index 4c5bba52b105..24d3395964cc 100644
>> --- a/drivers/reset/tegra/reset-bpmp.c
>> +++ b/drivers/reset/tegra/reset-bpmp.c
>> @@ -20,7 +20,6 @@ static int tegra_bpmp_reset_common(struct 
>> reset_controller_dev *rstc,
>>       struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
>>       struct mrq_reset_request request;
>>       struct tegra_bpmp_message msg;
>> -    int err;
>>       memset(&request, 0, sizeof(request));
>>       request.cmd = command;
>> @@ -31,13 +30,7 @@ static int tegra_bpmp_reset_common(struct 
>> reset_controller_dev *rstc,
>>       msg.tx.data = &request;
>>       msg.tx.size = sizeof(request);
>> -    err = tegra_bpmp_transfer(bpmp, &msg);
>> -    if (err)
>> -        return err;
>> -    if (msg.rx.ret)
>> -        return -EINVAL;
>> -
>> -    return 0;
>> +    return tegra_bpmp_transfer(bpmp, &msg);
>>   }
>>   static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
>>
> 
> Is there some reason the subject and commit message does not follow 
> normal revert convention (as done by 'git revert')?


Some maintainers prefer that the patch is not titled "Revert ..." and 
want the patch subject to follow the normal sub-system prefix. If you 
search through the patches for 'revert' in the subject you will see a 
mixture. I prefer this approach.

Jon

-- 
nvpublic
