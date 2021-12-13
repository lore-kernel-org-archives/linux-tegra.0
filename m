Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30418C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 12:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhLMMVL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 07:21:11 -0500
Received: from mail-dm6nam12on2040.outbound.protection.outlook.com ([40.107.243.40]:28385
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229766AbhLMMVK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 07:21:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMCZfvJSDO8RMKrLO5UGbbyNtLr5pzqx8WVBgNoYo3bk/1PMeBRWsbbvrDEao8rCe1tcSMcr2lKnNGO+0ZikffZazIwfBHZwD0Ve/qOi9oV30yhJaAHXZ9BbpA3LPmse9WKWwW92j7Juu7l1ReOGS/XWoCF9acVIwAA95VB/VNJNHY8pQwfbsy6N3/nepZZMNlFVuNmn06hbV0lEYV3nu55M4/aqdzpputL96V71TeGUGJ1PvUE+jYjQk7+dKkvhpTCHXn/daujsiy7ehtkryL4XexPtUJqEDLybHJkG493AGAOHxugzIoQ7kGyg/hVZKCvg5wSn/KqFcRfbfnJVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OaKdTKMtXH6VXv+vMHJXYxt9UitjFJoqFVZngMz+aE=;
 b=AiOkM5nfFfHTcYP6jsg9mXb4QWZT1v+5UhYQ7YwJshSp2JBMRBeE2ImrBajN7KHp0JeO4u2/Uq1ImRQHzBkt4yc+xLMszFGYwYjb5Nvn6kvdZ0kKnVpF2T6SEQ0NBQAsA7bQ8Ds8msJjFo1whKzl/CFUftABjzFdP7y8L0Qv8wvw27aIjFatHGW0GkFfn7kfce2gkR/Mag8v2E6S33XSkAfgfjMUmgk0zc+VpLQLsA77O0iopi0OqbWfiZLzy3Phs1V04bIAxFDQv9d2e9c06ns7il5UdXT3+HkRL66Kp5yy5WwpPev7UfeeaUhl9lS1yDlSfHvNYFag7Uu7yWeEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OaKdTKMtXH6VXv+vMHJXYxt9UitjFJoqFVZngMz+aE=;
 b=IzcZcvJVtnP6dGbFd9/XiVuV5pFZpjA58cVMj5a67W4KTfJC0o/5FK0FfYkWprBUrXaJ6n/rhQG/20NL/RgoGhngGl6JHnYuKF4zL69J+kWQZkY0cg2mMg1536WNcTfIUPn6Dc5ptWF/UmMJIkJG0x8aGNaFoQyP2zEx2WbVWmwhVJwNqeZ9ionLqLyjgzQJudZY1ookUmrTN+sHiNc78MiqFbLQQsUdM6TcmFmACPsY7Ct68ycPHfqhCsdrtnifLSXOLTt1+knD8U6sOFV6rx+78uKAOtOsnofIcnXb809kcbyi6OAbMHKruqVCaAMnad2hrO5rNBhOIaOWQt5pyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12; Mon, 13 Dec 2021 12:21:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4755.022; Mon, 13 Dec 2021
 12:21:09 +0000
Subject: Re: [GIT PULL] Reset controller fixes for v5.16
To:     Philipp Zabel <p.zabel@pengutronix.de>, arm@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <5383deda141721643419e98c485fb510be56fb61.camel@pengutronix.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <22bbd3d0-2622-3f23-2fa9-9826631084b0@nvidia.com>
Date:   Mon, 13 Dec 2021 12:21:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5383deda141721643419e98c485fb510be56fb61.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [10.26.49.14] (195.110.77.193) by AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Mon, 13 Dec 2021 12:21:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45f5da15-1979-4920-e0fc-08d9be330a91
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5458A92750FA52CB23944566D9749@CO6PR12MB5458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQy8kkkdLXb589L3clNGf/bKqIJtAEeuOy48UksLUNUTpPD68uu6INsx6sZ1ksXhk+UrVzyhMvZc54xWE4CWggTmWL3Rmv8Q2hC8gt0ZS2BtBSw/VKtO6M9rD0I1PG3IL+xDFmBOE6/Gj1xmempFvJ8pqPBJA9nTbcsrA96AyrQZIG7fZJkq+oHxhZq80jdjie3ysNeRiQMH34RtxkW8jwiQbt39AOdY/98rkAUvbXSq/qzhbsa/c3WTDuRR8ms9blkvhpgn4UGRxFC79VNQSOAplv2jFRZYe0U5+0cdePlEl7deue/i8gYdMebWBiarAiLUkrdJgglJSs26TYO8gS+6iulPbWqStSDGSnWLoLmGatOS6YDpAttd4XHXN7R8E1iH/hKCPffyiTLL33M5tRgJlRPOs8FR6WMAglWBa4+pr6D6NawucTD5Z5GpVLpzHZNFYhr5gxZ1Qh8MLOuCzgdCXIgriChwmqKK0LMREwhN9ZL4FrLx2vWO68vsuXUkl20Rz3PZqKHTFj7QvwlM983Zic+255S4S+wF+vbe7eelJZJ2xbbq2MpD2C11ujpkB0Hk6XUv8rlfrGC/zLspOVPcDf0JgUe4VIQ5SuHWlejRM84Ei4/m1ApxchLX8b5HW2S0ylpPu4p2wPUzM0IhAsiXKngQsdr4jGUj9/bksO/aeT68AkMyR62V6Zyz7EjITodj+NA93vgmpdVqLNu+LnjcM2adWXDeFaAYywPvgf+tO5PzrTmP5WcTlyFWsxqP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(110136005)(6486002)(83380400001)(16576012)(38100700002)(4001150100001)(31696002)(6666004)(53546011)(316002)(8936002)(86362001)(55236004)(186003)(956004)(66476007)(4326008)(8676002)(508600001)(36756003)(26005)(66556008)(2906002)(66946007)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmV6aHA4YVp5cmRlUnd3MC91Qnk4emhlbkFlV0pWQklCMjJmMW5Odm9BR2c5?=
 =?utf-8?B?bFhmaE9FVTFNZ3V0SkFWd2IzeE1tNEN5QkpLZzJMTXppUGl1a2NIcFEwYXVX?=
 =?utf-8?B?Tmo3SGY2dHBZWWVlRDlvYUxOaEZCZTVydHJtclpTOXhYRzJ3UFJHSHpQMUhu?=
 =?utf-8?B?QnNXYXloaVJVNm4vNWZ1dXJYN2hoOXJ0OXlnTlpHbW1Md21wd01Oa0UwRFRM?=
 =?utf-8?B?NUI1T2FHUHVZMGU0SlpjZVhvclJTQ0VWTFpvR3MrMEZGbXcyQ0JrdDlvZngz?=
 =?utf-8?B?SmpzQWw2UDhMMlBZdzdxL01oeFVnZk50SDRJMkJmb1BGRmpUVTJ5Y1E4WVE0?=
 =?utf-8?B?ZkwydWtaaWY4QjVRSG1GZDFqM1lMc01UdVRZcjEySDFBQ3Y3Y1RWYlJZRE5q?=
 =?utf-8?B?ZnJWend3cm1pMDJKR0YvZmw4a2U5NTZBUlVsQUp1SkJHOU1sZng1b0lXYnRs?=
 =?utf-8?B?Lzc3YnNZNlJUdTk4YzEwOXpqbVBSTkNJRkNZMVZxSGhSNFZJTm9DeXRXVGxK?=
 =?utf-8?B?QkhiMkhVamthdyt3bzdWSlRQSnFNVVdFaTI5cTByMmFHTEpGWUlIYW5WMCs0?=
 =?utf-8?B?d1hRbTBRaUo4bEdaWGJ1dlNYNkFYNFRqaFR6OW5vQy9DSHZrUmIrUnp3aC9a?=
 =?utf-8?B?VHdtSzJDTkU1dDZwalg0SkJ0Szc0TG1YcW5rUEV1MUg0S0t3SXAzV3lrTVJE?=
 =?utf-8?B?NFozcjJDSHhvajBYMHN2eEo1aUZlZThydTA5ZkN2aE94TjQ1RmZOTnYyNFcv?=
 =?utf-8?B?a3VQOXVseVZsaGxneDhidXhpdU9keVp1N0cvRW1IY2RxaFlWdVVVNk42UDdV?=
 =?utf-8?B?bVFra2xQVC80QnB4dmxxdEVnVG1rb3VtamxkWjlBbUVaVnNuTWVWNWlLeFV2?=
 =?utf-8?B?UC9od0JmRjJJMmZkZldxbTR5dTcxZ2RFRlBWZXdoYUJySHZyNndDY0xrb0dw?=
 =?utf-8?B?bVNDbnozanpFVDJRa0h5enJtVWRHUEsxZ3crcUdMTXg2TmJRL0dFbGQ4UVp6?=
 =?utf-8?B?WU1tbUdYZkEvUHdhVC9CbExFZkNmZFcrdnIrYUprbmdRcC9qZm5wcHErMi9G?=
 =?utf-8?B?SWE4WEVncStrK3BlVlJ3T25vRVFSZlJvekhHWG1CMm1MZTV5aExXZ1NNWDVY?=
 =?utf-8?B?ZndiQk5lTmRTSlphaHVHM3puRzZZSW1zeG5qdVlwSjZUak90TW9obEgwTUs1?=
 =?utf-8?B?OE1PQXRxczF1YkRXMGZIc0xlMmFsMVlqenZaN0hPWGNIQjNhVlJMam02TVJs?=
 =?utf-8?B?aDFaclRDU3BJVFRVczFiVmhsWGZ1cnI0ZnRTUmwyUnFuaDdBTFFadEZWblRM?=
 =?utf-8?B?YjMwYk9FWGI1ZEU5WG1KcFJJcHB1T3o1Z1VMazdWU2dBb0ZPK1pOaGd1alVo?=
 =?utf-8?B?bDkzcm1FeC9EeTZYa2R5eFVaSUNUMEF3QUJDYVB0Z1RPaDBRekRITEdrV0RT?=
 =?utf-8?B?Q0kyZU9zS2JrMTFlc0pOTlpKeTdSK2hHRC9xNlE0OWlmbTZUTkcxdUtHZ1JF?=
 =?utf-8?B?NFdmZTBHTnRJc2xzd3V3Vlc2bENuWXlHaXNWUFJZZEt0T1VqOXk2cERvbnRa?=
 =?utf-8?B?ZDVKZzVhS2NlSXZ0aFNpLytJRW1YSlR0bDlvY3pCV1RIVWdxYTZoZ1VtQTNM?=
 =?utf-8?B?bzdXVW56bXVXK2R0VERWcnhvK3JaeE1VbjBDOEpUOVBGcGp1aGRLSUJ4bXJx?=
 =?utf-8?B?NTRVM2lyRzVKY2dMSnhWYm9KMTlUaHRFZlNML05ubEoyakhBVG43VVAzb1pL?=
 =?utf-8?B?QnErZHhrVDhQQ1ZKTUpqQWt4a2didmFDRElBQjJhS0c4Q1pVR3BrbC9XOGI5?=
 =?utf-8?B?ZFVhTzZadm1jWmpLNTFlRWppYnB3RkViZGFRZjRlT0tIaUtnQTZaU0JDS1A2?=
 =?utf-8?B?bk1Ta3ZVZ3h5UFlLdG82ZnJCL0RZeWRNS0liY1ZHc1lXYmNIVFBMM1B5eC9j?=
 =?utf-8?B?a1FkcFEvZ3JqSGxZOStPMTRqSTl4NmJvbTBQWW9mMGNhenA2NjNna3BLekV6?=
 =?utf-8?B?a0hNY3hHUytUUlNVMXRzcjBCU29zR09kNUFKSDhLcS9IeDBiNnBvSFBWVXRz?=
 =?utf-8?B?eHhXOWZIczdwNWxibE8vQnhudGREeHptVXNyakF2ZkFIRGg4Zm9ZT2ZHck95?=
 =?utf-8?B?bjhRRkNHOHJUWWhpcG9vVVMyR3BZRWVaY0M3NDlMTlhBT1B3UFpURVdhV1Bl?=
 =?utf-8?Q?wUFzGvfU0yDQmbaJxwWYfC0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f5da15-1979-4920-e0fc-08d9be330a91
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:21:08.9175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xI+oG3Ueu2JcKkTzcmyoj4DGUdcLRe+bVLjbsFBP6gj88YzgowBiIv614Zs06Q9kxn0BxR778IhBvzxPtkUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Arnd, Olof,

On 19/11/2021 17:07, Philipp Zabel wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>    Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>    git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.16
> 
> for you to fetch changes up to 69125b4b9440be015783312e1b8753ec96febde0:
> 
>    reset: tegra-bpmp: Revert Handle errors in BPMP response (2021-11-17 17:22:27 +0100)
> 
> ----------------------------------------------------------------
> Reset controller fixes for v5.16
> 
> Well, just one: revert commit c045ceb5a145 ("reset: tegra-bpmp: Handle
> errors in BPMP response"), which exposed an issue with the Tegra194 HDA
> controller reset. BPMP response error handling will be reinstated once
> there's a fix for the HDA issue.
> 
> ----------------------------------------------------------------
> Jon Hunter (1):
>        reset: tegra-bpmp: Revert Handle errors in BPMP response
> 
>   drivers/reset/tegra/reset-bpmp.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)


I have not seen this get picked up yet and we need this fix for v5.16. 
Please can you pick this up?

Thanks!
Jon

-- 
nvpublic
