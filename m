Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F1AC77B73
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Apr 2023 22:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjDTWUh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Apr 2023 18:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbjDTWUd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Apr 2023 18:20:33 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADE82D4B;
        Thu, 20 Apr 2023 15:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbq/6ky5pC12C12nJZErMpwfSIK7a4OxPbJZVWT8iVRVi1f1gPiZpjnKHQ2KSrkYj11SzBI4G8wG38koP4EUF7v2QrRXP5Q6QRccUpsSjyZT2mJiFj/NodEPzEdhBH5CVFoLOEOy/MslWO2CYjzgh5pfI8NYLB+ncv9/AIWqX+5VBUuRjEOz9SBPDKBSuZaV/aMrscT5eBZJcTrpMjCNwLeKWqH24hzG5pLuZO9trcVobIrmQacAfRbZA8qdEQsSEJAwhuusrO4tW7pbu/+ZkEFxyB9+apLzHdXZWxRXHw4u3ZlEhh4y0vFyL6jmselmnzq8SMAxZQQWoFRa1cUI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LFYjv56IAclCnOaPKmTsr1zXjsv+8bWmPVM9pDc4oE=;
 b=bIEzOWeIarXRMQcNrOJipPNAPj+uftMXiYA52JjTs2xuvux9RdyjE8/D3/mpVM+TqRvRBxz9AkIquQb834KhOhzivqTk3D41WKEZQOsPzEA5ijadmvt4gUwxZfSsxFVCB8UII5ge5BSVb9KAKE+IeJ5XkXpzJF7GUQj+Km0nZlKLE4CVYYh3kJpFf5CwUSt6+Wz44Y2AnLk4xh3Y+grYQZ3ofA6dEXDAsMXDHATJADF9TTgp4tjKLBE48P4Rfh19GmsvRoXYHx1QpKUNtdB/1pkQ/JNb3wO3m1NFuSlyXMzFn1jKSg4g8ZMOy76Hj6I5v2f2xz5TNzk2AJivYaXfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LFYjv56IAclCnOaPKmTsr1zXjsv+8bWmPVM9pDc4oE=;
 b=d0Zp8VUe2Kp+ZWsAPUfXZjtUufWjuWo4+l2XGz1bAUp3TUXoXF+Vv+pxL5XxRS3XgAwbgAl6Ls5iQGQcZktm1tfXcpN3NZzi4NoaQ4nuuVXcgmDKSTIDtEp7yQVIuakQAiUOuVH2cGOF+JuRIv4ZIpYyaAfpyYjNiMSc3X2gLySKW9EMVUtVbpeRfiTGwysFy826JSFC9QluhV/qI6PcXiB/FJiQQHGVEoj8vnXd2wFDvlncFZwzI2gwc7N2glJSTrGtEojU9W4SABAthpL1vYh3FRIbpuYUW5kZykIdjokcgtQmcHF/erqEFgQEstDsz+eCTqXZUiwtwYMhrdNUag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 22:20:30 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 22:20:30 +0000
Message-ID: <0ea050cb-3c08-021f-ef84-ef9402640ebe@nvidia.com>
Date:   Thu, 20 Apr 2023 15:20:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hte: tegra-194: Fix off by one in
 tegra_hte_map_to_line_id()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <92a6a5cb-3a89-4c06-a91e-438cfda76fae@kili.mountain>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <92a6a5cb-3a89-4c06-a91e-438cfda76fae@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a98dd1-eb39-4417-a3eb-08db41ed7331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLYfyi3/bIWTZwlrBCLjSqdApEaVpRN9Lwrqki/9SPpFPknaYZgPKnF9AOu9LXLIf+B/EK4k2Nj6UJhMbB3hKqNMsavdDWOCQIXz/Gat3hJOUcol4ryBPaDPZsE6TgDg+UCxjeLkehzAsVQw2qMLu3efgwJrjPAwGb6XY4qUHlPTVmLb54cCbd+ltD6l+KGU3Pyp3wa8WuhlmzOHz5rFwxH/SBW2mz4dvsGc/Bz4wx/FUHJR46oW3dQY3o4L6WRTHJM0/09NUzYI4SfqXaM7Bn3dMexeYatXDqHUQsFLC868x0V11kt47qawMgt/iUc2mDR2aJwUvhmOXTepHZUJdoC9iJtGYO1KfIpzPOV7EVoqvW0hMLXYTnUy3XTk+D2qQEjCBtJtMzcwXjoL6hu8GtABGH3AOJ3dqI/lSMc6vVSnx5WzT/WYP4C6fuR1CHn8MmOwcgcWyAEXVnJhZ9BnBBlq7+i4nHFo9FWsezJyoxnsv+PfypfqMUtDYzBvhLtpWwgqiB+4sQaTEDyjt8HqTNI/RgNu5TZlw0+CTGevPAGea0MPqGYXHGiKnYxF/HUT+4+sebRI8Zl3CusHOqvROjn6YAHYu3/6T8x4aLeWcHGQNeTrk+neK2VQB3lA7joBKl8fnaiFtTuz7MKzhZ+iqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(2616005)(316002)(66946007)(6916009)(4326008)(66556008)(6486002)(478600001)(54906003)(8676002)(41300700001)(8936002)(38100700002)(6666004)(66476007)(2906002)(4744005)(31696002)(5660300002)(53546011)(26005)(6506007)(6512007)(186003)(31686004)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1h2bnVSVFJYelNjbTZob1o5RjlRVE40d2ZVcHBmdys3QjF3dEV5UWI5elI5?=
 =?utf-8?B?YjZRR2FhRHludHFWZjc2S1oxek9oQ1p4Skp5VkF2QWFuZ25WUVQ4ak5LNUdD?=
 =?utf-8?B?eWhUdWdGUUhaNmJkRmptNExKd1ZJMCt5UVpnMEg5L0psK3lkZU1RbXJPWURI?=
 =?utf-8?B?ZFBHMlRjVStTMzBSbzErZEZqaDJiNU9WbUdxWTJ0Z2ZqTEY5STZjNGJscVpU?=
 =?utf-8?B?OGdhdzZuNlFQNVA1cDFTdmtKd3Q3eDR2T3JCeXFvOVF3aHpuN00xY2I0YnI3?=
 =?utf-8?B?c3NNWWtzZDBhdmRWdnA3UllyaDNIYlhwamZlcitGek9LOUhXcHdSMFkzWk1x?=
 =?utf-8?B?YWZGWVF2ZkNNbUk2QWY5Q0xHQk8yWC9nY2gzZnpzMjREM0tneVVFNGdWNC9x?=
 =?utf-8?B?aEtuNVdCdGROUDF5czFTcWZQaWlleXRpQVdIVVZHZ09Bdm1JWVBGNG5ZRWhy?=
 =?utf-8?B?cyt3SmR0Ty8wZldadjV4Ykp1WWVBRklucGczMEFaMGxSV1hWUWF0WmZSRVhE?=
 =?utf-8?B?S2NhL3RGalVjM2JjK0RDL2xyT0lmTHNaN2JXM0trWE02a3B1RGZvODlaei9W?=
 =?utf-8?B?QUVscTVBRk5FUjlvSm9RM3orQm9HTzh1UXAvcmZDeTU1YXY4U2xBWWk1Y3Fm?=
 =?utf-8?B?SGc4OSs1Y2dHVmpBdnJlVWJBci84QjdrZ0pGVnFCWEQvVWUydlNBb0hLZTJ0?=
 =?utf-8?B?b2Z4U3hFSUhFZkFUN08xb0tJRzdjMlBseHFVVHZYc1ZHdW5pK1g1NWI2Y2JT?=
 =?utf-8?B?blpJMS9yRk5nYW50dVN2b25hd1AxMjd6enFrQWZTMVRYaExxWVVZLytUUE9U?=
 =?utf-8?B?VDhrYm1tY2FoQ3FhSVlaNnJ2UTRlRW9sSGhTRGpYZm1iU09OV090M1Q0dUZ2?=
 =?utf-8?B?Z0EreEhiVFhkSnpPT3RYM0M3V2d1OFcrK2plNmtwZFpFV2xuVXhyUHNVeXJO?=
 =?utf-8?B?WUQ3MVBRUFFHSVBnanl4VjUrNTFaOHZ5N1g5VE55Z1pZaUJDa1gwRDJhTUtY?=
 =?utf-8?B?VmFOK1JJVzNwWWFrZnlXdEdPSDMwOXd3S2hNUjZRcWxQVzQ2SkpUN2JVSGJl?=
 =?utf-8?B?VkZzVENrZ245alNrcDNCNjYzS3ZlblhIR3BiTllIU0J3ZkxVdHNjL0JtQjdN?=
 =?utf-8?B?VUwrc1hSOEtXNEdqQWxNekZGdHMwTmhrbXJUdXNwVitQM3g3ODhScFQvRHhM?=
 =?utf-8?B?a2RqY3R0cTd1N0JJSld3anR4Z3AyaUtQQzR6MUZPYTRCMEV2SHkvc2IyOWJB?=
 =?utf-8?B?MFdEMDBsem0zUVpTc1Bxd0ZEMXB0TCtWRmh1YzZwaENUNHJMZHpxZkJydnM2?=
 =?utf-8?B?b3lSQ2MxdUhMeXNkUmovWjBnVzNmM0dpZ0hGalAyR1FYcVZDS2xhRWZndENY?=
 =?utf-8?B?dVlVMkRqbmtrMWpiWFJvbVIwTU1nSVluT21HVUswbUwvT2xLR21FaGptWHl5?=
 =?utf-8?B?V3FwdGwzM0EvN3RwYXcxWGpqcDVvQkk4a2xzNVJpM3R3S2MxK2pPN20wOUk2?=
 =?utf-8?B?d0krYmlrQTJsbFliUys2cjJwMFJWTFlwM09TK0tnc2FoT1FLc1BVNGVqaERH?=
 =?utf-8?B?eVNlSDNBMHlIRlpPT1hTanE2c25sRTUxMUl1aXBIZzBWSW44a01yWVV4M2Nl?=
 =?utf-8?B?dk1hWTNlVjJ0YmhoelRZcUNVbTNqQW4yM2hZd2ZyektsWVc4Uk5HZFJIU3Bm?=
 =?utf-8?B?enZmd2IrZ0dyd3VaNEVVT1B4K1ZKSEs5U0UzTTF1Q1N4ZDVUM3lCaDMyWnk0?=
 =?utf-8?B?SnN0bm4zODc0V3lOQnVKYS9ZZEFqU0xEaDdQZkk0MFVRRHJoY0ZMMld1M2o0?=
 =?utf-8?B?Vzh2dm56NGNWZ3hsRkRxRERkbjdYZFBBVkJVc25BTnFxbTk1T0IybThDVHly?=
 =?utf-8?B?T0RBb1EzN0t4UERlMG5xeGxHZVNiMEpQNXpFdHRXRlNmSzBDZzFmQnRuUWhh?=
 =?utf-8?B?dkRCaktYZmxYV243UU41dkpPOHBrZ0dzTlRZVHBrM3o2eTZQeXo5bklyd0VO?=
 =?utf-8?B?RCttR040ZDBOUVlEdHpjRm1OYzd3c0xFKy9UVFFxMUFWZS9aUzdtZWpMd3VZ?=
 =?utf-8?B?bmtzSzBCVW5ZY1RFVS9uSkhva3BPNHRQQlh4YzM1UWh1dmFNTDVmUDZTOVBz?=
 =?utf-8?Q?RYQ2O/0A+lc+YxYSNPRVevlOq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a98dd1-eb39-4417-a3eb-08db41ed7331
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 22:20:30.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wohrvKfgZU1yxURdwsrkjvJCGw4vlBLEOU8z2HWyGAXs/VDVkuspKRq8gxaSCbvOhOOmLnn/wwVr3jOZXmO92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/19/23 7:30 AM, Dan Carpenter wrote:
> The "map_sz" is the number of elements in the "m" array so the >
> comparison needs to be changed to >= to prevent an out of bounds
> read.
> 
> Fixes: 09574cca6ad6 ("hte: Add Tegra194 HTE kernel provider")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
Acked-by: Dipen Patel <dipenp@nvidia.com>

