Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEC5C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE99061075
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239608AbhKHQLt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Nov 2021 11:11:49 -0500
Received: from mail-mw2nam08on2080.outbound.protection.outlook.com ([40.107.101.80]:19169
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237481AbhKHQLs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Nov 2021 11:11:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOg8sRPohY/YZLU4rUD+QavZ9pI4s9S3onO2srdVw9NuoY8pC7wyT0MB4vTr6iXBO4GnaM9SAnebQyuWRRzj1viYW2qHPzAdAhrabIeu65CfJuS/n+Upe807bJnerC1rGFN8jBXVe2yTe036TeynX9P4RGK2kZsATgbuG/XWpFvSnojwLCqEDaiMsUrbEU7LLtSETwMhcW0x5Xe7DkSJflpWs3hkD09DkrEH8DliST9+bQ899fMZXWQAAZrK5WgjC/yk053gfbScr+7U0/UZ1tY5yR+zkTrvwoE4TOsAWiH3Wr0KgllmTIxlucj/ZEnXiFAtZWgrMIhsPT28qqzjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF7xbfyXxPBpHSzFS3qJTys2HIi8OT+tC5zkpDze+WI=;
 b=LQ0/Pu6xK/vdW7wwyd9tE2HvNrp+YNnR9lOyyXIpb6OSB9cDZolFfe3BSINLQleCfPakOe2nOupkjZHvZV55LVNwOOT5swjpV34qfap2phXofkMrPtcg8wfmvstVRshdJovC7L92DNOGcCXbbnhjoCHQdpJpGheNLwy6TClU3aHv8gVBKY7h8JkrDJfmN9lhRGj4oAJEucbLmQrwsi1bDIDSbP+RNrT2BqBbpp4z0S0X7ZjMn26kGwLlEhRh8tzetaNwK5uB5R5JseeJAiMeY0bs+9WbWGKShaW2cVi4bi6ep3l0/t7+MFA8KCbyGNVh8OyBm29PzZHO5fJOkGUuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF7xbfyXxPBpHSzFS3qJTys2HIi8OT+tC5zkpDze+WI=;
 b=qnGYIYPKvN5/FjLvsHcdzcQLo8PLLYYq2AGHzSXjP1goCVZxkCQaztz/lTQK3FA+slcIzcFecomWHSTySgZ+s5tt5rAQMYrsdDZBfXp6wY9KbU4mKJaXQgln//t7mbRgZiNLVAIeCpEiQkYaq6j/QeZjBsz+lM3XbAXtaETxpUtQsb/n+LyJsrHlWCBPLckiBRF0lzBSfEun15Luy116ac5/Jz0MlFiM36gFJ4AoseZDYldygFvdEUb/byqBo20ZTznyxsj4z6J8qAt2YVsZFVt6GKg84st8rVy1WAGBgyiqra3uoUF9ujsLoOREaItTagICI5K4bLYCLMcziR3jOA==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 by BL1PR12MB5045.namprd12.prod.outlook.com (2603:10b6:208:310::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 16:09:02 +0000
Received: from BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878]) by BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878%3]) with mapi id 15.20.4669.013; Mon, 8 Nov 2021
 16:09:02 +0000
Subject: Re: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
To:     Takashi Iwai <tiwai@suse.de>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
 <1635947547-24391-2-git-send-email-spujar@nvidia.com>
 <s5ha6ilmiiv.wl-tiwai@suse.de>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <418e4db8-4572-3e29-fb5d-e4c23280a5cc@nvidia.com>
Date:   Mon, 8 Nov 2021 21:38:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <s5ha6ilmiiv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To BL1PR12MB5317.namprd12.prod.outlook.com
 (2603:10b6:208:31f::17)
MIME-Version: 1.0
Received: from [10.25.97.218] (202.164.25.5) by MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:80::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 16:08:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae6fce57-634f-4503-ad9a-08d9a2d2147b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5045:
X-Microsoft-Antispam-PRVS: <BL1PR12MB50450F3396C786E69C133926A7919@BL1PR12MB5045.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMJI/KfP6JoJ+Qs1A8u9j2fa1KF9ZEL7zscKDHPZX5OYl6mb9PnRrgWd22oWKbK8UXm//pI1Vuiyh2x7GENTRQFkd00UcMW0Ii0wDmL6FcRzYcCg7mGhK2Hy7eucZ7E8QgECThg5NxWK80PSQiy7fx6Nq4FUPUunaHS6HNUvL6ZOYFv3StNsnVDeat4uUljizfrLxYrkgC+D9XBfvcVYdsb3m7OeiUCylad4HT7G3OtttKQtcl6kPBdhK4wVNS212WgK0KuhKq9VbPgQerASim8cQD1LsPyiyWdH7akuhwvcOYEc0PhqPxuCp0M7ZNZA0n/hPdANLg2ygFV9QkDm/wFfdtBlCSeK5oikNDIeHTBrCOABIGhAQUlx1IP4E2FJwTxyKNWE9VGs4mgvEiU/pUji2uqJrev5BbcNgldlWXb6FaxzMGmLI6lKQYBWd1zayRtwlNO54cBkzvqWGeRa715miVCCT9ctegyzmDbIKOK7uJDf6vVmlD/c2GKjiDuOne5wqu8DaLuRPGDTAbsYlz9m923cm2zolq+WJfLtVPcNCA+Y9CeW9oXCoHJ5BDk0OSiNMq8YrQe780KfwWEn+qn1L2kE8rMJN+R2cBuYhcdewVIerxIjj/9uu+n9ICmopOl8J1+Kq8IEOnsbsAIEtZB4R4REGmyJnjLjOYDXWzITfr2oIkxl3yeA4u+Ff2eZIGWsl9mpT9X5NYUzY21knq8R2segcMrxttYhsUbFYo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(16576012)(38100700002)(53546011)(26005)(186003)(31686004)(956004)(31696002)(6666004)(36756003)(2616005)(6486002)(4326008)(5660300002)(6916009)(316002)(66556008)(66476007)(66946007)(86362001)(4744005)(8936002)(83380400001)(8676002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhxQjNoYllDQ1daaGdjZVJUWURONVhoSUo2SmhIL3UzRW0wWjZWc080Vks2?=
 =?utf-8?B?R3hydkp0Yyt2RE5VQnNscnlHR2hNVHp5M21PV041LzNUdmdKUnhNK0ZnZDZW?=
 =?utf-8?B?amdmVExNby9MbzQrR0IxRUk3Qk1vWEt6ay9hRmEyN2lyNjN0Vk54Nm1SdkMz?=
 =?utf-8?B?cUlnWURKM2IvMGZpbzQyRnpDRU01cUdyYmYzTlE4d3hTOFR1THpuc09DbEZB?=
 =?utf-8?B?MjU3SVdtZFo4aVFMNVAvMFlmOTl4SVhmNHlubWo1Qm5sb3RVUEZlL3l3aDJw?=
 =?utf-8?B?ZEVSektZYUZvSnBlNnZDNEtQSUVSN3dodzZMdDViTUgvdUFSSE1EVXZsWGhQ?=
 =?utf-8?B?RENBd3JWb3V5b2tTa2R6dGtXTmNGdGRDdzVuSFQrOGd5Mlp2dSt0WjVRaEJo?=
 =?utf-8?B?K1VDcmMySFgzSzRmaWZOTVZIUm9RaHphWC96aTJsNUUwZ2xheDdYaFByMnVo?=
 =?utf-8?B?b0l6RE1UWVdWU2FVQW9XR05wd3M5Z0JhVElEcW5vRUE2Y2s5U2pkRml4SzdC?=
 =?utf-8?B?b0FDbGtLRHBpczlyK2pwNUU5dHhtZFZmZTlGMFZ2c0hwRW9NTkZ5MkpXUWtD?=
 =?utf-8?B?cWxTWTljbkdxTGxsbUdUaGcxaHNjdFUvLzNlT0IxY3V5SjcxZVdlckhJaklQ?=
 =?utf-8?B?TytFSnhQOUtQeXNWVXNYUXBEUGRwN2JhN3R4dDA3dUpVZndTQVVRQnUxc1Iv?=
 =?utf-8?B?UVd4N3pwL3FuK1FPY2xnUWw3WE9oVEJPQ1pIUDBKVU5lRDA4bkpvVnFCSnkz?=
 =?utf-8?B?S2JJUXhzQUJFZnIwTGFzeWlpVEUrVDZNblpsVFB1d2M0Yll1RzlHak5MYVFz?=
 =?utf-8?B?UC9IOGx0enUvYlhscStvTUthQm1lYWsrS0FuTmdtNTV1Q3poT21uY3ZqN1Z0?=
 =?utf-8?B?WE82MnNzazd2d0g2WFUzcENxQTdvVktDR2VIaEZGWFdUS1hpcFBxRzlLblpD?=
 =?utf-8?B?SHB6ZElJMkladXRhZkY1azJNbkVaM1BvdmNnRVV5bFBWOHBvMHc5VmRoM1J2?=
 =?utf-8?B?S1Eybk1UTjRla3pUeDk1cmh6cE1TdTNxMXBXczcvOGRDLzIyLzdZbHl5bXJr?=
 =?utf-8?B?OVZrUnlkSDhlT1VmQkNFb28veHQwTEJ3bUE2eFlXUnViOUVmMWdWaitwK2Zu?=
 =?utf-8?B?dXNjMHBLVlFQNU5laFR4R2VJa1dSOGIyMGgvRjVIZjQzWG1rM2htUVVTUEFZ?=
 =?utf-8?B?VFJXcnp6VUp3S3c3OE0zU2JGTFh4bXMrNlpueDJnOU9mQ1lnZlRsK08wdUEx?=
 =?utf-8?B?N1ZFNXQveU9zMThMVWpINkF4YzRxRWhnb3JlTjFLYlRRUHh1N0ZKWTdOR1BZ?=
 =?utf-8?B?WnlON1NSWDFWcGhJekFvTTRGNzMwSnE4WWs4amFqL2pYc1o1NWV3amFXUGlJ?=
 =?utf-8?B?alpmSVZiWUVRVG5scDRZeDFyd3E2djUzUDdPSFBIemVHbkxoRTV4UXVaS2cv?=
 =?utf-8?B?YVZIVy9mTHNPNmxoWXdjSytBSUNzTXQvam1FYXBTU25mNEtOQ3JwVHp6NFlF?=
 =?utf-8?B?V1Q3aGFqM1NEZ0VKMC96dnJXMWorVHZtcTVsdXgrN1Vmd0pMUFFNL1lWcS9n?=
 =?utf-8?B?cGVpN0hudW13RWpaMTFFcjdQY2p1T0FOVkl5N05FdCs0dHRaOG5sNFhrTnBW?=
 =?utf-8?B?NTZ0V3VoZXRqRlpYSld4ZFBEcVp6REdWNVFxMVAyOUZoSlVWcUxWcFVSSkd0?=
 =?utf-8?B?a1ZTLzVvZnBKT25PUzJvQlUrckw2V3JQK1BUOWk1Y29WQXRMazlRS2RKSG8x?=
 =?utf-8?B?R2tMNHBFeVg4V2JDLzFtUm1WUStUZnd2Vmx2emVjQW9JeEJYbXZBTGxMVlhD?=
 =?utf-8?B?Wit4UXE2SkdmOE5oWmlPYnVJVHlneHNXem9IdUR0THRKQUJsazZOdXZaU2Yr?=
 =?utf-8?B?MVRXRXp6NURqUnlkUmg3Zy9nQTMvdmRSZUlVVUhqb3RKTmFTUkQvZFd1SWVp?=
 =?utf-8?B?c3J3cXR3TjNheDg1WFFkd1BQZnZqMXNRclhkWkFOUTlZVjYya3F3RzBNbXVV?=
 =?utf-8?B?cGNFTXZGVmJrTXAyNFpRaTE2RDF3cmhqZHdTSlhaNkV5U2R5V0lDcXlmWVli?=
 =?utf-8?B?MUV5aS9BOENRMmpSTC9jbVVYSFczWDZDclhFUDN6QUt0YnNLeXZ4UDJjakxV?=
 =?utf-8?B?TERvQ0doT2Vxc0FoOWRycjlKb2tVV2MvS3pIaUpCYmFpZXFMbnF0VUlBR29W?=
 =?utf-8?Q?qzsuqxIH3s+0aWRjD8HJUts=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6fce57-634f-4503-ad9a-08d9a2d2147b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 16:09:02.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMkSWoUpMBH/6lhEwQMLM5UMa0dQ2pCRa2R8tnFfS67kfwMEgtG0hV+1CAjV1EXsLNzl3zbVVdElB3PoTPP5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5045
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 11/3/2021 7:46 PM, Takashi Iwai wrote:
> BTW, independent from this patch set, I noticed that those get/put
> callbacks handle the wrong type.  For enum ctls, you have to use
> ucontrol->value.enumerated.value instead of
> ucontrol->value.integer.value.  The former is long while the latter is
> int, hence they may have different sizes.
>
> Such a bug could be caught if you test once with
> CONFIG_SND_CTL_VALIDATION=y.  It's recommended to test with that
> config once for a new driver code.
>
> So, please submit the fix patch(es) for correcting the ctl value
> types, too.

Thanks for suggesting. I will include fixes for this as well in current 
series.
