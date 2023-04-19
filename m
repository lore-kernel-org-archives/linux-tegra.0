Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD505C6FD18
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Apr 2023 21:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjDSVxz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Apr 2023 17:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjDSVxy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Apr 2023 17:53:54 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427A646A9;
        Wed, 19 Apr 2023 14:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmoKMEAgxsxcXBbd9yq8eh2AXz0VM9yiTHFoTDM9LYQ9XYj0VYA1FGFER26eyi3hafu+ixlLBCcSkKJgWh4+Zx+PksOEj29pMXKatr+lbFGkPZdGYUF3+CsmmgMSouuLLAHVZqY5GMaVSkaG4kRMgX16v/Ua1xjo9Qy/JYujCX8ntqcF00kcd+talURhbD8W9RLMDsJs/im/vFfqPP0UsT22hrjNv8/uZWELcqYlsuJnxZkFPrSr42pFb8xOa9zzrBAKcdaYbiFWcLmbSFc4ko0EAdzHEoimsVXMZSvlyZhhHuLCPm1zFECkJb90jOaw1vhgAz2CjDynE17rJnxMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1LextwPztWJZIeoc4flmvHnhatJgzFVg8WJgml1lZ8=;
 b=e93BXlv1FHP+3/nbpZmWV6W92IgWTfaakDpcQ8P/HPs6o77hgwONiEVvpoWrYkG9GRFWHiR1lJjzt7P5bZCw1O7RU2iZ169P1wxthdDOPGMKyoEhNmHQyVTgG2ONAYp+PBtjGtzSSbvPk50wMRjbERkEyA7iPJBDsmEYDEusLciHA1a41Zv/xofGLXKHSLPkOVTwB7ATTHfk3O6w89pQ4COOo9fJ/lNHS12FIifRWhRwKpKzLqMC8hnzyYRbM/dcE0eSSZDCYK5XxtuspYqVuSijzBkxCWpj3z58/vktKRZRH/RErzcNEgqpiy8ACxMDeqbNil746kolv0topRpqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1LextwPztWJZIeoc4flmvHnhatJgzFVg8WJgml1lZ8=;
 b=NrrhvK8dJtVLNCzJ47fPHh5Acd77ux92rEdNWmRN1+1awGDeI51lvdCIOJbL0xxHWABZQT7agiwJI+/MXlfF+4bcIl669v6RwYiGaIGnVvYGwJvxU8yYlIPrd/hFe3gkloSOOFnyraBuVyVVGe6FqN5auN7neXaDBJUrNNgUv2cjDHNSyX3LExhaycxVr7NCoSKIop8zXgKBb/29NuyOJ/IW3JNqWteFJQ1BUv6as4CZxmEo3tOQWwe2hqLCmsho5eyPmxvzI0BCFo9tTMJl/3WSlA28FSPoXUNAhxs420tR0lDO9Y26afi/322DZBC3eNzV8kMRMf9NviRhxE4p2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Wed, 19 Apr 2023 21:53:49 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3c6e:eaf0:e09:8fa3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::3c6e:eaf0:e09:8fa3%4]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 21:53:48 +0000
Message-ID: <e49aa102-5737-fd13-29d6-4515d733fb7c@nvidia.com>
Date:   Wed, 19 Apr 2023 22:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
 <ZC59VDIEYzbR1YKF@orome> <de55706b-f632-b921-a6f8-dc107601977a@nvidia.com>
 <ZC60SvlnC7GXnjoW@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ZC60SvlnC7GXnjoW@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0166.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f232650-68d6-4017-0293-08db41208e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hz31RgaBTjC80G+w1OuY9L6ZUYQPa7lTHmnaQe5nKP5ENdeaFnZSK+Giwnt0J3vA5ktVhcuVlX2b7tSm8rHQbej18w05M1s0cuDQKhGQwsEtJYxvTiCKQ3j4GMn48ZbiDuWtBQvWJQ31ruHEpoRkPFkTWYa5JC55a7P84I565ZwdGwQEJPx58PLQx2O/8dWu6f3FjZNcC7at4ZCoV71kog2BmK2h4ZYJbkeiAAfe+0GqnvOdRkwt5rwVTvb4jhaZxjbGZUu/TZh3yXJw0DJ2UvxErLq4c6KzL7c8p52dQnuv0FLO+JwPJPsVyOutZEuIh/AunbqP7zNITYqlub1jcOpogO0mG22luI5ELUtlLxk5XX/PSQ/+HLEHv/Y/qIg2qWq5VVpaXVmdFaV7dQSgE6GNBf89KJKUISdgDpbRdhDQPt8ngP7hWPOFIvB6kDnFAEneQa51GQracJ8W+1WpJwdNdTdxLq1r5mk5RpL4vlQlQEvVo5T84b6C8XmdzhxSE+1DG7hfRPrlS0vMlGUR4D4qNHCpW3V5uNLI1giG4ABpDhyuq6oEp8GuBX/2+2+6R+7SaZwy8fR78qxXRD5FZ1aH+JOdyoE7aAt+SoqhmLod049zutov4RyP7Hsa+eHeXaTfOsB/0aoh6Z6vH8CAbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(31696002)(38100700002)(8676002)(41300700001)(5660300002)(2616005)(8936002)(36756003)(316002)(31686004)(186003)(4326008)(6506007)(6916009)(86362001)(66476007)(53546011)(66556008)(6512007)(66946007)(83380400001)(6486002)(6666004)(54906003)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anREN3ZHTUJPbXp3VDBEa1o5QjNJU2ZFc0M4WHhCMkJ5UW5MTFU5aGVzR0dF?=
 =?utf-8?B?NmVzSzNPWTBNc1VxVGlTcTUzZjQ3eCtET2t6clJWbllDSXNPUEVISTB5NnM0?=
 =?utf-8?B?QVBOdlQzQXBpbktSRk9tUG52N1hYSXVPay80NEhyY2VLN2lMTE1mQ0J4NlhH?=
 =?utf-8?B?Q3RGK2FwUC85QVVsL1hETWZyMk5yczlLS0QxWFBsK1h6YTBURUx0NFVWbTgr?=
 =?utf-8?B?UVlxZE01Mll4NlFMSlA1Q0hCNzFsc3ZqYUk4TVE0SDFUSld6ZEw1cmltT1ll?=
 =?utf-8?B?R29rM3hMaUh5SEhaZWl1U3N1QmxHQUlocjJyTUVRTjRnaEtyRTE5Um1YTWdB?=
 =?utf-8?B?TUpFemJJSlZ1QUczL3l0aDRFbFhhaU0yK0xRclc3TnVySkU1VUtZdkNWNjlZ?=
 =?utf-8?B?VFpGSkJtNElFT092bGlZZU1rVEM4VnV5cDF3KzZEdTIwelFmbGplTHdVbEdQ?=
 =?utf-8?B?cWY1d0Nrb3BiYTlNREFaMVZrY1F0eWhHdFo1NmUrL3poemdLK1RmMVF5UlBu?=
 =?utf-8?B?R1BSaVNQeEdpZWhyeU8weERlNDZ3RTJQajlXNFY2eXRKM0ZSVjRtZmV3TWY0?=
 =?utf-8?B?UTRXOHhlWXA2ZTRDL3gwUzFkUHB3NkNiVU13ajl3SXpJczN4cHd6dXJ3dkhh?=
 =?utf-8?B?S1BYMGFmaGY1RTFneXBoWlh1KytsTUJGSkU2bStLQ3dUMUxVem9kUTY4VDk1?=
 =?utf-8?B?Y25YY3MxSmtEd2Y0Vnc4NkRyWE0wWGphamdkZWRFSVlaSzBzTEJkemZMcEdp?=
 =?utf-8?B?MFN3MUpUcThaZkl4M1o2ZGdCdGtGdlhtMFM5U21FaXZ0LzNwTTEvSzEzS0R5?=
 =?utf-8?B?Sk9Sd1Ywc1NTbUVQMnhjSXhsQW90ZzBwZTIxTDRqc2c2VzgvUVRJZVNjUktE?=
 =?utf-8?B?SkxHMS9zZ2NHRnpaUE5KVEpzQndYYnl1K1lWU1VCTC9lbDBLOFd0dWltMVZT?=
 =?utf-8?B?MmFKWlRRdkZxNzVIbVBpUjBNR3VMZG4zczFyYVlIMG5xcWhqWWJGeTIwanhm?=
 =?utf-8?B?NURzdkdDL2lBdHFSeWhvQmx3cjAzTSt2UWhPWklHcVFKRFFnaUdIS1JqSjRE?=
 =?utf-8?B?YThiK1NCSWRtamNsNmlWVjVtb1hNdFF5OEZFeFN1dSszcUFGT2VrSXBzNGlk?=
 =?utf-8?B?UFhpTkhPTnRTQVUxSXc2bnNvL0FLd2Jlcm44K2F3Vmt1VDNLWnJoMzJ0R3JV?=
 =?utf-8?B?K1RqaDBxUWpjczdtbEdFTXdaVVJaQkpCNEZWSW5TZURra3AyK2ZSVnB6aUhU?=
 =?utf-8?B?T3owQ2VHa0YyTnpwbnkyeG5PZVF2Z1VwUWlDTzJ1cFJuSzZNSHBtSTRlSjVF?=
 =?utf-8?B?WVU3eVZQQ1RaL3lQRnVXYWd2disycEx1RzJsYzZ4alczWHZPdUtWY2l2b2NU?=
 =?utf-8?B?dGJvaTFCN1VwVWozYUFlenZ2SS9Yajg2TGRub2t6WFhZOFpkTGVNbGxVNHBk?=
 =?utf-8?B?VEJZUS9iRGw2cVduQUtJSUR3OE5EeXBJTVcrNlFYenpmbkV5bHM2ejVSK3U4?=
 =?utf-8?B?c0xiQkpSdUxuNUFBTjc4MWUwU2MxOXl1dVZMZXUzRjBlTmk5OVdBNWVqa1NT?=
 =?utf-8?B?NzBhTkFrUDJMRjdqSm8xZ3VpcE41NW5kVDV3blhjQkRBcUJTdnU2R0NKNkph?=
 =?utf-8?B?QktXZFBlSGtMUmNvV2M2V0ZkTnZrMDRPeGNhbWhVckxrU2Q5N0FGZTlVVXYr?=
 =?utf-8?B?YktVUVBMM0dUSjNNMHB1SElRUHhMSGgyNnlnWjYxK2pSb2V5cXo5aVVnY3pW?=
 =?utf-8?B?WkdRTUp5YjJHeXFVcDVqdWE5Tm4xVFhXQ2Y5aUZaYjFjeVZvclhhRHRZN3Zi?=
 =?utf-8?B?VCs3azRlZE5nb1cydU5PN2VxUllMVnNQSHR6dUEwQVA1NUJlNWhJRldTcHBU?=
 =?utf-8?B?T1VsMmRyWTNCMys1VGV2aU9pNU04TFB1Qmt6M0c5MTJMeCtpSU50VlRTb3ZK?=
 =?utf-8?B?emtRZkRsbVgvM0pUWTFYb21IcTloNXpOUElqdWQ1d3ExbHpieUp6SVpQVDFQ?=
 =?utf-8?B?dUZyOFRPaWFaa2dhQ1d3ZWFLdnZSL3gzVGg2TGF1Q0hibDIvV3N0akNtQ0dV?=
 =?utf-8?B?Tyt3dXV3c1ZaVGFoYU5kMHhwR2pUcDUzUko1alA4QTBxSjJlbGxMWmdtWU00?=
 =?utf-8?B?dHQwZXlDdzFuSkkwb1lvOUFTd2lpdFlYRmk3OUVoazFNS29HVTVqQk4xU0FI?=
 =?utf-8?Q?lJDo3LYkFdhPu90Wxnhgk+GG6xzGUeDoX5WODiWYkUoN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f232650-68d6-4017-0293-08db41208e68
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:53:48.8633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oac6ze+VK2ZyoTceKcS12v0/sMV2cbFfhivU8RsI3YPuzaD1x4tXlI/C9HdpRh59O5iSSoSelIO1hsHCNNfOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Greg,

On 06/04/2023 13:00, Thierry Reding wrote:
> On Thu, Apr 06, 2023 at 10:35:15AM +0100, Jon Hunter wrote:
>>
>> On 06/04/2023 09:05, Thierry Reding wrote:
>>> On Wed, Apr 05, 2023 at 07:18:53PM +0100, Jon Hunter wrote:
>>>> Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
>>>> populated the vbus_draw callback for the Tegra XUDC driver. The function
>>>> tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
>>>> that the pointer 'curr_usbphy' has been initialised, which is not always
>>>> the case because this is only initialised when the USB role is updated.
>>>> Fix this crash, by checking that the 'curr_usbphy' is valid before
>>>> dereferencing.
>>>>
>>>> Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>>    drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
>>>> index 2b71b33725f1..5bccd64847ff 100644
>>>> --- a/drivers/usb/gadget/udc/tegra-xudc.c
>>>> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
>>>> @@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
>>>>    	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
>>>> -	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
>>>> +	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type == SDP_TYPE)
>>>>    		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
>>>>    	return ret;
>>>
>>> Looking at tegra_xudc_probe(), that calls tegra_xudc_update_data_role()
>>> for all PHYs, so shouldn't that be enough to get curr_usbphy set? Or is
>>> there perhaps a race between ->vbus_draw() and the data role update? Is
>>> ->vbus_draw() perhaps called as part of usb_add_gadget_udc()? Should we
>>> reorder those to make sure the role is properly updated before the
>>> gadget is registered?
>>
>> Yes it does call it, but it still does not set the curr_usbphy. If you look
>> at the function it may not set it.
>>
>> In the backtrace I saw, which was happening on reboot, it was in the
>> unregister of the gadget ...
>>
>> [ 1102.047896] Call trace:
>> [ 1102.050402]  0xffffde9fd18c0878
>> [ 1102.053602]  usb_gadget_vbus_draw+0x28/0x50
>> [ 1102.057879]  composite_disconnect+0x1c/0x40 [libcomposite]
>> [ 1102.063509]  usb_get_function_instance+0x1808/0x27b0 [libcomposite]
>> [ 1102.069935]  usb_gadget_disconnect+0x64/0xa0
>> [ 1102.074304]  usb_gadget_remove_driver+0x2c/0xc0
>> [ 1102.078942]  usb_gadget_unregister_driver+0x70/0xf0
>> [ 1102.083927]  usb_get_function_instance+0x2774/0x27b0 [libcomposite]
>> [ 1102.090339]  unregister_gadget_item+0x280/0x470 [libcomposite]
>> [ 1102.096314]  configfs_write_iter+0xc4/0x120
>> [ 1102.100609]  new_sync_write+0xe8/0x190
>> [ 1102.104461]  vfs_write+0x234/0x380
>> [ 1102.107938]  ksys_write+0x6c/0x100
>> [ 1102.111417]  __arm64_sys_write+0x1c/0x30
>> [ 1102.115427]  invoke_syscall.constprop.0+0x4c/0xe0
>> [ 1102.120245]  do_el0_svc+0x50/0x150
>> [ 1102.123723]  el0_svc+0x28/0xc0
>> [ 1102.126854]  el0t_64_sync_handler+0xb0/0xc0
>> [ 1102.131138]  el0t_64_sync+0x1a0/0x1a4
>> [ 1102.134889] Code: 910003fd a90153f3 f94ce413 f100027f (b9409a60)
>> [ 1102.141139] ---[ end trace cdf6612bd43fcbf2 ]---
> 
> Alright. There are a lot of cases where we can run into this and it all
> looks a little complicated, so I think it would be good to unwind this
> at some point. But I can't think of an easy way to do that, so for a fix
> this looks good:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

OK for pick this up v6.4?

Thanks
Jon

-- 
nvpublic
