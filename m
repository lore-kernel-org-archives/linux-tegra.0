Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BFAC25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 13:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjATN0z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjATN0y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 08:26:54 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9691188;
        Fri, 20 Jan 2023 05:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph+EPyjQbiAtHYEGzrjHPMyg8ocqs0RC5jzgxsM4C4DJXkwoi0G+9tlBtRzLQcSVNc2B9hYbrtxdsZMe/ufLwHqtw8lO/w+3wby/WtRabaPiUQUpuvi1hzN+LEB31VEux3GGHJKjT5UdaGyLAVSPI7MOjq3gui7zSAqeGatsdREvlkl3YB4bjPaxl1qMgNhYc2CZDLAyiYxcKCgqaFo/5yp1RgzXe7HeQy8/91Yam/hcVqn7Zq2s5OMIjPx3Q/CzpXfFzUfapDiU+K718Uy+XuhnUh9PMWChA32+5UPbHywuPuMKjJMQK/yRivPyN7F4Klb/Xvb/YvqOLWWLSA722Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tqRKmPNHG+n+m/eZhwNAbDmnxgrhL9dAuM2Moc9x+k=;
 b=KH9N/ZFHxonXzr6dt46z3r2YKFyPH0CllJ+2zf2yvlG5WmpQXo4zR0FofUwCcgXADyqtXNSAyZXDEX+4B+hX4f8GtcgNArMTTFnfMUFB+j8I7AbVnsGL3139xJzenXRS+ZRVYNEJ9WRc5iT7N/2UIHmsDZSn9AN+kogmcat9V6+MdHnRCsGlKLPDjbT7n6sAjl5QV5rFNBmA53oAbN6oXsLAsWF+ShKeUWscBnLXmJQ5y/JsEKOxQtkljeCOZcv1RCMwBn6iPkPnXL/KXwmgcC2cKNkVWCf2Fn6dJKsy6e0tq/L3NY4NQEGmGyQbh5etNoa1KAocHPLi15jObaQhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tqRKmPNHG+n+m/eZhwNAbDmnxgrhL9dAuM2Moc9x+k=;
 b=Alf4mtEZtecru2gFr8IKyx1NVqp9sopF5haCCUuLADMbrMRQB0YiyFAk7z+N9CcKbX4InYZZkhNcLBduDwdknz1r36oUR2Qvymlp3tTsXoCwRe8jdfO0GldctpafLcwxbhcTZr2JXnV5ahRKMNPscsbtaeU8mv4WX8lGs20TCD+hDnjyxmcuETNQnCxHKuuHK1FeW+ELUYwUwE+T+pzSvHX1F6MFXdWdnXIg2xgtw3CvcZDYoMsWIqhQjPDkwYTo1MqYoGwrj5bOMHE2i8BowgNb9c2UHMGNPq9CSXH0vVVeU/e/GUXyUXUUAGnNsxkeP7wPqGtyYwCb75988O3bjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 13:26:52 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 13:26:52 +0000
Message-ID: <114679dd-f42b-5a91-e5d4-0efc786fd8f4@nvidia.com>
Date:   Fri, 20 Jan 2023 13:20:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 5/6] usb: typec: ucsi_ccg: Remove ccgx,firmware-build
 property
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-6-jonathanh@nvidia.com>
 <Y8pgGTNwSRZ8VaGW@kuha.fi.intel.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y8pgGTNwSRZ8VaGW@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbd9648-48e4-4aef-dfb4-08dafae9fdcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChDgSg+atmEAxZI+lLGg+7n8iopJhKMSoDEFpnl1KG+W7xhlpqgk+LebfYZQeleaQ8X052cjfyD2jLWKNDTlMihOB0Ch69g0keDmOaJfJFBAz9rcV3zzNzAIy2SxhISpie9ONNRO5WXoxIu02m4vZtGwCQZdnp2YGBrFHRTlqq1qEySFIuLgRSRK6eEoaoa3mHz63EuEPBsllfoe7Zsjfz8/TG+OL/NIZFX2wOVYIDjKxUQqC0gBCwKZxuDs34CUNkyrcd33d6Xqn6qtsbqTVOn8esjF21X2ef0Jc/fEo5wrIjQPIKKgfhai8k8rnUeOWRdc95dC0EbPgWM0PnXrJPt/aCzoxz07YmOg1023KNhbY8lRqDFojhtXDUglK5FFpQjtuyI78MY6Q3o1XbcUay61+DnSWpiJbI48XeALh7NigkKBWLfaePQ/CXF8OqthM1O0/h+w7alqruJpeVnfDwwxnQ8NMGff/sksVaba8Q6eBbk+hvD8IFJxG/bJlP1fCxXgsCpYwTi8qwzdiIN+m59KsHneyYwNiA/Hva+DkJRSplg03uYRRJ20zpzyLlufThSOXm3NAqiRz0Bnq6AiY2qzfMrOXD+EvhKuirfMXfX5u+kAFKYzGsydriYThNYKCHn93FO3yRMDlp7rciLjDLqqjUsd0Ur2j0Whw1hA9rROqz5/BWBXNtsjcB2R3+mIpUMBLQ+LcGeaj/xA8H8V9ozY20/cJlJe4LVDYwVqD94=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(4744005)(5660300002)(8936002)(31686004)(4326008)(66556008)(66476007)(8676002)(66946007)(6916009)(31696002)(38100700002)(6666004)(107886003)(53546011)(55236004)(6506007)(6512007)(26005)(186003)(2906002)(54906003)(6486002)(36756003)(478600001)(316002)(2616005)(83380400001)(41300700001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFo5b1Q3OUxyZ1RySytTUmZYMnpwc0lRMngvQ2d6WllVUUcwb0UrNVEwOFYv?=
 =?utf-8?B?QzZTdGxsUWw0N1c1ZHdLRFkzeXNGa0x3L0VHeXlIblBjZ0craW9makw3UnNN?=
 =?utf-8?B?K25OOGVCNlRBckhKUDZjaU1hOGFuZkJRSDNGVFZvWWdkWUJNdTVtTUxyK1VB?=
 =?utf-8?B?eENQZVlpamtjUDBmKzhxcGd1NXEyWi83c0J0MEZqSlNOeEtwUTBVRldhTXFv?=
 =?utf-8?B?SDRCTk1SRzhaWmdYeWcwMU1UV0RCRFA1WlgxOTVCL3FCVVBTSmE4N04rSWlB?=
 =?utf-8?B?MllJd1JuNVRSYTJJU3ozZzlNazFzMzFYRkdxc1RzNE5uZ1I3TEZzQnFxVG1w?=
 =?utf-8?B?dEZmVXhWbGV1by9XRUU3Y3h6N2hVdnZuUVRaQzlvS1IvV1dUYXJzWW5pSHFH?=
 =?utf-8?B?ZGR1SitVSnN1YWVnK2E2OWpSSkNZRWczVHMyQ3pJQUpOZGxNVTRmS2VQdlJC?=
 =?utf-8?B?cVBvN3RaQ1NLcTk5MWt1TWpVSkhHRU4wL3d2L1pDV0V4K00wUEtlKzloaktI?=
 =?utf-8?B?ckF5Y0pJUzRnZUg1MU13cXUzZXNUMzFEZ2VMNXIrWU1sajJib0JHa3haNkhi?=
 =?utf-8?B?cndybFV1OUJRTm0xOXpUMzZaTkFtNzZrQlNFV2RxaVE5QVMxZ1pIcHppbGVQ?=
 =?utf-8?B?bU5lNmNVUHpxQmhiMHhXVzQvaGVMZ0VZYlRpL2Z3cXQweVJhZXZ2c2tnOHhG?=
 =?utf-8?B?KzgyTkxITzZpM01Vb2VJK01xcWhkUExZVWErUjE2R2laTURtVHZVc3F4aW1S?=
 =?utf-8?B?QzkzYkc3cVJrRENma1k0YTEveklXaHJJaVU2ajE5OG9UbUdIMG5pTkgyNGgv?=
 =?utf-8?B?SWdZYkJHckdjdmh5ZEt6VWFsMzV5ZyswUFd2cy9yTm5Od3RkSGFrR0VIZUND?=
 =?utf-8?B?WWdkS2wxV3lXRXU1NkFFbGhVcHR2STdUK0RSNWZGeFVUUXJSVEZKaWZ1QUFo?=
 =?utf-8?B?TGVqbE56bEliNWo0UmpYRERqSGtFZU81WUJHTmh0Q2V4d3dpVUdBRWZ4UWlT?=
 =?utf-8?B?TlVjbVJuMi9SSkt6L0ErOGhMYTZtZDdBRDFrRVlSaEdxMWhPY1JIRjVGUTFC?=
 =?utf-8?B?ak5ZNG1iWkZ2L1NYc3poVnErODdEd1dtSm9KbzBSeElRVndEb3NJN091Mmlj?=
 =?utf-8?B?SW81TTN5Z2xDcUgwSEtPUENpR1RRbHFkdmVCTEhIbXdDTkNGaUVNdGN2bXJX?=
 =?utf-8?B?ZW9iZ2VYLzhVdnFBajB1RytzY3ZzYS9FTThuQitQUE9CZzBXRk1SV0dlOVU2?=
 =?utf-8?B?ZG9tMzBNUVdwWVprcVcyOWVxYStldTVRaURlYXZUUXJabDIwd2dkcVlCSlph?=
 =?utf-8?B?WUxGUThwYkNXYWJzRTV0RVUyeXRmTjlmY0lDbmNKNXlJMWp5K3M0MFF5WlJS?=
 =?utf-8?B?cWFycCtyNjFVUWhraGZLTVliY1Z3YXpWU003RlZOSTBRYXk2eXF6VHdLajZr?=
 =?utf-8?B?YUdiWG54bXJnSHZSdFFqRS92STExQnF0Nkl5Y3Y5Yml5bmZqUTd2ZStWazRt?=
 =?utf-8?B?b3RmNzRHOG1yZkhKYW4wOHpQWnhwOVZSVkd2Z1ZucE5ZNCs0aDYxc1ZzZi9j?=
 =?utf-8?B?T0w1ZXNIbEpLREVBKy9NeVpaNlFreFNud0p6UXhmd3lCN1BwS09mZVYrRGF0?=
 =?utf-8?B?MEtvbjZxcGVsWFIzQ2N5cW01eUhmK21tMW5nV1R3NjJHK2duLy9PdGpmdmFj?=
 =?utf-8?B?T280cTFhbU5CbEtmZzRZZ3REK0JYeHJMeFIvT0Z0ajNHNVVwdWVNVzBPaWUw?=
 =?utf-8?B?SjFvUG1leityQVhCeC9EUmRZZHhqN3pvNDN1RS9jUXA3SldsVE1IbysrdDdk?=
 =?utf-8?B?TkxDNi95cENua0hDWmhVdzdmNS9XUmRiUDhlNFdHRGZ4TkZuYnBJVHM1NFFM?=
 =?utf-8?B?MWQrOUlMQzh1Yk52Um5sVC92bkJ2UHJoa1VUU2R1SlY0Y2QyWU5oUTU3MnhQ?=
 =?utf-8?B?WkNZUyszbU1lVzJDYjhEcUI1bzNKWkgzNGY4OXlVOENiRTJBc1c4bFd3L2NL?=
 =?utf-8?B?cnhlYkxLaWpMOEpWamFCU2Z1RVczNDN6d3N6VmFWU2hlTHNxNWtJNzFubnpI?=
 =?utf-8?B?TVJ3c2lKdGVrV1pkWm9kZkNqZjNTRHRpTDVpU2dRSUJCKy9pRENjL3BLSjdX?=
 =?utf-8?B?Y2I3bTBwQWkvK2JzMlZ1Z2FnQWhGbVNBWnF2d001RXI3RjlOM3c0S1ZZSUQ0?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbd9648-48e4-4aef-dfb4-08dafae9fdcc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:26:52.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uz8miqBDyMDZAMcf/fQSba8jupfGyqKbbRyB8FeRZXxvjp5F2Ze6aKQVqPzpJoGLBKA4+x2Mg0RtZbsIEqDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 20/01/2023 09:34, Heikki Krogerus wrote:
> On Thu, Jan 19, 2023 at 12:16:38PM +0000, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Remove the property 'ccgx,firmware-build' now we have migrated devices
>> to using the 'firmware-name' property.
> 
> Ah, so just do this in the patch 3/6.

ACK. This was deliberate because I was unclear if AMD needed this and so 
if it turned out they needed this, we could just drop this patch. I see 
Sanket has confirmed now and so I will squash this as suggested.

Jon

-- 
nvpublic
