Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3675AC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Nov 2022 14:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbiKWOUR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbiKWOUQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Nov 2022 09:20:16 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AB861B95;
        Wed, 23 Nov 2022 06:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1cNKT0pnfcw7e49UQhRImya0Ywa0w2R0VrGkeOPYynCvZkRTuoAzi2tGAYxesQkZ8YEN8liz5ARNl+14O62YHD8O73k72AVaK+yvX7L5T6F6DiwlM7VWkqwAg7z3Yxj/Rpr1fEYuQX28spbRRiWHdefQYIGzgq5BePKBWRIhIdJ9xOmhSns2meDg2zKaC/5i5awrRti8o3R35kVKx1qvvCk2v4tOmch4gZVpepdCcrPdgizV36q5uiLUYG/hNjtjNtqPUBlWWsZdkWcD+KkqZOm6k34am7tC2plXo2JO8bKmGCncJBGXcNhnLWvdqft1lmRCDqUv9AY2qEHxrJ93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1wSod+aBOJVKo3ut/o5cL5hhO9BKxggG+qIRQfzNQw=;
 b=gbhob7EznkwsJE+um5oqjU1flWBl/5OxTeN0t54u5HeaKz+hkV0L2P3lRRijZ/Dq+RV24dNkZtZ3gDmiUYOK3dvWt6m/vJ5MI6SMUQltDLF4dtPV5LQc0/KAq/C+giZHTSO8MnI0X3yFkuWJpbuJPn0DOuhhwp13KUgou8f6K6o2a/EgxRMvHyTaq2AVgsocEMaAxUW5WriVIHRwZm/xzLyZuRthW2Azq9f7qLVal1LrE5xM5sQAtCO5bKsdrIUbd4JX0yrQkW73Fq/aJKHKFXYIhOchFA1YiS06kK4EI9D0gfolV16CAxkSLNBfFT4f3H/u29wlJf7jCuCN91qLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1wSod+aBOJVKo3ut/o5cL5hhO9BKxggG+qIRQfzNQw=;
 b=rsL8XMtL5x0GUYpeHqiTCkjjKSrSxnDKzhK/957xw7WqvGZxOOnYHAjjZYR1aSwVtZU/acxd+b69W96XpgwVSJRSczupt2r9nWAOYtPaLCI2OYJLq41OiduU7pwpy5Vh6mBSzuJ2z5GszGIc3kVm1VMXKWASQBe2AEVgfQAId9zI5zcSDilzfMYz910xMnQjkVK5lTz5LDhQwxVMfqHIcsC3Lb8zAMSoL+zb3rpGmbtf3DSRT+nlVY5xidoIpcMa0iDhOvlDRoZmesyYue8axdGLyeeaaZ4YDGrP54PqiVqlltJhb7xfJITcw0rNA2uAbgxCJYSNBUXJUQ2MQWOUsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18; Wed, 23 Nov
 2022 14:20:13 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 14:20:13 +0000
Message-ID: <4e621d81-929d-3fe5-ee8d-00751f157e5c@nvidia.com>
Date:   Wed, 23 Nov 2022 14:20:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 5/6] usb: host: xhci-tegra: Add Tegra234 XHCI support
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>, waynec@nvidia.com
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        vkoul@kernel.org, treding@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org, Sing-Han Chen <singhanc@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-6-jonathanh@nvidia.com> <Y3zz1YHu1643ppuS@kroah.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y3zz1YHu1643ppuS@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0589.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aced916-5ff7-4022-3afe-08dacd5dd500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75nYnB3XQDa/i5SZuPbC/QrbfMPoyESMQ/Mi5UBwXvsRScprkbaIK5FY9VkbIC4U6R8MykdofM+rWha5NBOMVX8dxN16lGRYnmm9rDlmgeSbbctp8no67l/+agKapObysWMkl8hS+y8juUxqnLvywvh41W54dkwxeGEF8BaoTcZaPQnZWOiRzKRnOj4SrDU3b3Beiq7tjC3IP0OSpZxTduqppHUtICAHUlfYX6vUNvVBuzwyrAgi+yc3/8wKZW35qP4ZwH2SD4AnSPkRdVAPqIGsw4OsfvtKBRD/HAWd0IhcD7268KBjA1LSnIho5I3ca9EVLRe3UeJgKMY9U+PsRcbySN8EZS6DrL4ACqoHftTPVM3Spjrjs/CwMVwVARux/tEBgBca4i4JL0KV6x6Ad0QR53rU53T+96mXKRmfm6ofL6RUeczTp0eGykG6a4Z4a5xUjrzPHHUpSWi0AgFu+1iM9DRlO6GNwOLgzDQxdo6CbQzIQbvo8SU7XkhKd44k09QBjPKazqFtKEbCblE/KKZiaVNAhuiShGh25FRBnhNGIOCsof0UKGa3DFAjWzBq+yI2KJuQ6L0lhld7FI8V6AFyyTkfnGh8PrbArf+CI0BrAuJ0aGTlBYLbifLIaAvSb302V+KrouthpmYLx41lEYEtTeGolKlyWPYj3bl5SQcPn/PYMujwXueu0cHniS2yZejYF09d4lpptC6RM8DEahwQtLd6IH00hvfWBKhrLKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(31696002)(8676002)(31686004)(478600001)(86362001)(38100700002)(6486002)(41300700001)(2906002)(8936002)(26005)(6506007)(53546011)(36756003)(55236004)(4326008)(5660300002)(66476007)(66556008)(66946007)(2616005)(6666004)(107886003)(316002)(6636002)(186003)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9ESDhDSlBEK2dhdjFxWm5RQlBPZkp4OU5DcnltL3lUTitySWFGN3NQeEJV?=
 =?utf-8?B?N3VTbU0wb2xkMFdMREV3RDdQZEIyUVQ4MWs1bXdrdExKelhFWXVaeE11cklq?=
 =?utf-8?B?ZUl6M24zQk1vVThtczBjUlpUR2pLV2lYcWZaTTFCeU5IVFRwc2drSlczWno0?=
 =?utf-8?B?dmJ6SUlCazBzd3l5Q1pVM1Q0emxXUVhxVUoreS92RUpqYnBWK1hENktVczRR?=
 =?utf-8?B?Wkt2bmZtRVdLLzlzMGdnTlNrQTlwdWJMcW5hc05tbW5rZWxBbmN0b0FVYjBY?=
 =?utf-8?B?b0JNVkNyTU54NDBSMWZxL3lHVG4vNGhtRHBTWThOWFZ2eERxeXZjY3gyUkFF?=
 =?utf-8?B?NGFsTnZ6aGorZ0xBaU5JYTg2bnhsMWZFT1VKRzdRMHNVUWpjZW5tcVVCQTVn?=
 =?utf-8?B?OHNLU2h5TGpuaEZtLzhxL3IzMmlpc21sK3lUc05pbmNTcWZRc05GekxaNEhX?=
 =?utf-8?B?dHlFOFNwTUJKNG1HL1pQNHZqK3NKZFdZeE5TdE5VdUdTeEJmOEZPTG1xR2NC?=
 =?utf-8?B?WnBOMGtqQXhOM0ZKS1JxM2U2NWhib3FQQ29adENkQmJCcW5zT010VG5zSTBU?=
 =?utf-8?B?THhMV0d0aG01RjZqbmVrcUlTdm5GNHRNSmMwMTVyUG5nczhwOGRZa2E5Mm1X?=
 =?utf-8?B?cDhxdW9PeFQ1NC9SY2NlK1NiT1ZuYW1RNUp0S3dDUUVLUGw5L1BjZXh4Ymdk?=
 =?utf-8?B?VXhhLzVqVnluNS9rcDE1c2tFdVh1dXEzQTZhVXZmUktSRkw1b0lBNVQ0dXhs?=
 =?utf-8?B?WVp1RHMzQ3NqdlkxT3RVVDEyMkVlWHdrWkxIMGUrK3VmQ3NIY1cxNnpVMFVI?=
 =?utf-8?B?TjlDMFhJamF1cW9uclpkdk1vb0ZsTTAzTEpFaXZENzdLbXhpeVRXdk1VU3Mr?=
 =?utf-8?B?ZGxtTnBEeVlaM0lIT3RidjFLVk52OEFwT0VTTWx0cUNtb0JEWjU5UUs2YUE5?=
 =?utf-8?B?MCtySEpYYjhQWVRySkRVMFE3ZmFTeHdRWFM3TzBFZ052ZXJlY3hTOTFVeDE2?=
 =?utf-8?B?QTd5eEZtNGk4MDFFM0w5ZjlRclN0N0JIaUZuNWNwc3N4ZkNtK1ZkUElnK1pq?=
 =?utf-8?B?MDBIU0ZXeG5NdTNhMlNWUFpPTFFLWlJGSTdibGxEb3BXRVRDa3ErckZJc2k3?=
 =?utf-8?B?dEFIbkxiaVEvTHorVUVQU21WWk1ZSHkrVkhjbFZnQ3FnbmRwSnBwVUVKMWht?=
 =?utf-8?B?V2loYkNadG1XUklsbmsvbFBsMEJIbDhacjU2K3M3LzIwZ0JWR1VIbm9VTWNW?=
 =?utf-8?B?OW85V1hQL2pxczRiU3JCcE1zNGJBQ0N6L2VBK0orT0o5d0hJRWxGcGFYL3VF?=
 =?utf-8?B?eVlFajQ2QUliUitaa3dXSzBXa09MdmxVWWVZRXZ6TzA3cHc4YVhvWCtxeUgz?=
 =?utf-8?B?TkhheFVwTlBBVDhWYlpGQk5CUHBycVVHOXVYeFo3QUc0eXhSL25OcFJjOFJU?=
 =?utf-8?B?L2NPNlRFRnM4K2dIMm9nVEZIRTNETGZVNS9vc2xiV0ZoUlVpRFRkbUhxaUhp?=
 =?utf-8?B?K1VNRm5hS0NFRDUweEFaZ0pDR0FtSkFIYlp6aHFDRk1wVkdZNkRpTkpKTFc1?=
 =?utf-8?B?dWtSNHpLTzdiR3JZSE1ObUh4V003RjdqN083UUZmVnU1WTVZYVJGWElKTEl4?=
 =?utf-8?B?d2V6Tjc3S0xsbmxtTStGNmhONzB1cFhnZTlEeGRYOCtrMHdIb2RLdWdLQ1hS?=
 =?utf-8?B?Rld4SnR3MWJjcnRYTFc3R0UzbGd5WGk4Z0FGUHFBSE1XY0hCTW9aUTM3ZVAy?=
 =?utf-8?B?WTdyZFhyVGdrcTJmYlg3QytnaHc5dHpwTnh1c0F4bi9sK2dwaGdNMUs1a2g1?=
 =?utf-8?B?ZWxSaW9YZWQ5aUNwZFdwdXlpM3hyMFp2QjAvcmJCTHI2UWZ3b0hxb1NteDd4?=
 =?utf-8?B?N3NlcTNQVUlIM0xwWjNKbnN6MnlodURHQmErUXF2aWZnM3djOGZta0Rka3BS?=
 =?utf-8?B?ZHlOV0JQSTRvQS9UYWFHdDBSK01xYnBRbzNzVXVpNDhWSitQQnNBc0I3KzVt?=
 =?utf-8?B?anVCeENWa1drOUk3SG1rQk5YMUg4WmNSMlBSeVRLUGJrVEJtcW1JTXJjQyt6?=
 =?utf-8?B?UzVGczlCTXlFa1ptYi84VHFjRTI1WmpYOFR2ZXQyN01leVp1Ty9lNnhla1lJ?=
 =?utf-8?Q?4FX+kGPI3Rrqz7NfdssipWmjw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aced916-5ff7-4022-3afe-08dacd5dd500
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:20:13.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBA7OyERVNcOHb3/jZOn+njrrSNTuY5iW9anf9AU4moWQRW9q1E9uql9+VZXBdEvotuPuSK5WO+0X5eKm6oxlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 22/11/2022 16:07, Greg KH wrote:
> On Fri, Nov 18, 2022 at 03:40:05PM +0000, Jon Hunter wrote:
>> From: Sing-Han Chen <singhanc@nvidia.com>
>>
>> This change adds Tegra234 XUSB host mode controller support.
>>
>> In Tegra234, some of the registers have moved to bar2 space.
>> The new soc variable has_bar2 indicates the chip with bar2
>> area. This patch adds new reg helper to let the driver reuse
>> the same code for those chips with bar2 support.
>>
>> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
>> Co-developed-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> This is should be much slower with the additional redirection.  Is it
> noticable on this hardware platform with, and without this change?  Or
> is the hardware slow enough that it doesn't even show up as a speed
> decrease?
Wayne, do we have any inputs on this?

I know that we have been using this implementation now for some time on 
the kernels we ship and that would be tested on Tegra210, Tegar186, 
Tegra194 and Tegra234. So I assume that the performance there is good, 
but not sure about Tegra124.

Jon

-- 
nvpublic
