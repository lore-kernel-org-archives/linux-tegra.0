Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E4DC76196
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 09:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236125AbjDFJf2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 05:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbjDFJf0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 05:35:26 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003CD40CE;
        Thu,  6 Apr 2023 02:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwxltKgVzoz8gpJ5XUZVyqQMHuEvep73/Cmh7uXhFm9+Y0IcHfkRnC0Ex8IXSwPo4sicWDkIhm3AWs99d1ukeE5dIt85cWUcgyxk5U4mLR3x1OzrblUXSIrl81UuBKCjXHUNMsxnHrLR8f/Za9fijNrZ9NKNNFCRyFtiArDji1anIpHXMP3VhOt8dtxtPaLmoMLBqEDCj1ezPkOeHg7UWCnll3M20wtd5Oi8IjVW9+rFo4tKNpzkvFSnzgDPO2bFAAl0XP8IDT8A/G016QYf8t5/r1Z0s9ucKv3owbj3jH5JmuISqC2IMpDgQK0j+7svLgWnDJcRT+whv0tf3jNINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i3Ra1NKJYAB6uvEQ8pqpRnGM8GLZu62lOUy5d5uVEY=;
 b=mA4/wD3Z0rgDBGDCrxkr1SSYtdkAHHoZJMDLjyXy1SJ83vvBxB2nTHkfQpt8EL8B+wi//XcSUJT0bxjGEiRc8MpBcJoHsLoLjxLjHV4qHktKzUbLr1UL3SLGwOCI6MMOmwMYwjLRbAp4yc6bP1NSLIC39v+UobsApKafVraPy8hkHkgD+AnNa2SvjWMU7Wshtjwr1ZRCcT2hHxSgzpHeQrnPX5RNvpMEAOp6NtVuT1x+x+RPx152hte+bP/LXbxLjBldrFPmiIaEz4y2pyYrJz6KIj/pK8vizLXZ89NfVaJtt95xO/kt9vQYbSFcCM8j0pgOp3rS6KieFJjf33PX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i3Ra1NKJYAB6uvEQ8pqpRnGM8GLZu62lOUy5d5uVEY=;
 b=ZzjWyPCuHbd/tlD6PnBo1tdNNgpo/NovkVIKPnOVGpbbn3AW2kyfN4NRTWremm3kl+0farEKhypzq6wupprtEL65LxbTqyGiNgyLxPVZz6vyl64ztMWGVQr/G9wcX+CYXmPVjLGnagT13zSABBm0dKRCbPMJeAv1s9HTDzfSDBgp++Pl4ktL8aWsnG7WbTa0B7IWjr44n1GupsQRQvKsYn+z57Cu5eFgsejc5buwj1ZfkMek0ujB08Exra/cLsyEJGIgRC526kE7gBvE7nPYj4L5BWlowJ6XKqf0xPgZ5XcKhBKewlUORB6+QTe5eKs+TIoxA4nXf9/GdJK+mUBYEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 09:35:22 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5dbf:5052:da60:647c]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::5dbf:5052:da60:647c%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:35:22 +0000
Message-ID: <de55706b-f632-b921-a6f8-dc107601977a@nvidia.com>
Date:   Thu, 6 Apr 2023 10:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230405181854.42355-1-jonathanh@nvidia.com>
 <ZC59VDIEYzbR1YKF@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ZC59VDIEYzbR1YKF@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 120de3bc-3186-4176-0090-08db36823e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P218ZDRBLD9asLUFbiT7UF1o4YPtNyaBeL2+7bd/3PLOO4POxfLo7L6MaEMTTnyizfavip1m+5jFkXuWjuI+6IXcpyQYddy9klRjp2Kzi8UxmyyKf+BnLns/OCGuQQBUYmrDrAL96z7KKJ8oWxzA9aHOolAJK8nmsbrP9TxZvHpDGmSXUh1Wg1zb+Y4TANIVMRUS472cLZuF3Pmp7kvr3FO6jxJad+EsE9puRjH7BAVUjGsO+d4M2okzEvvS+bcO/C6TN5hfp2wkAiEwL7ZTTRKvGXFK5YoRhpN4SmarThQ/Smdq60mxpuT5yBpeToiIeD3IMKzInAJ2+UDROlr1TVOaaW34EljF2nFFxLhJwkz2HSYEUOXQHgRSWhwLx6W3mdY1wqcMJBIbgSd36y4/o/Oo9LuyI4xH3RrnugWySJXrlgjxvkFl9p2vgRgnJuQ+vdvTqci6KHauuow0FtfUkwlu/iGv+r4zBWD4cowokhxtVlZSwGMsKeLl6BWZwrGX4fVuA0EzWpfdjTsEJ/rVwdunc9p1ikzEdBQRMVo3TPFz6UdzRWgED2Rcrwjb15lfcE/fwjqDLeLUCFey+X0cHdEZ5crvohxPlT8Su7rcu5KNr7/4/6huuPaS5g18BC3C1cD0NsDu7XgE3GuB8RWFdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(2906002)(478600001)(186003)(55236004)(6512007)(2616005)(53546011)(6506007)(36756003)(26005)(6666004)(6486002)(83380400001)(38100700002)(6916009)(86362001)(5660300002)(316002)(31696002)(41300700001)(4326008)(8936002)(31686004)(66476007)(66556008)(66946007)(8676002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJja05pRThPa2pnNm1LZmNkenFsdDBEYUZJVFE1aGNnR2doTGFSbEU3NmdP?=
 =?utf-8?B?NEhuRGNsN3dlNzU2bVVwTEJyMzFxNDczQkJ4Vng1Q2svODNiaDN5VU80NFRs?=
 =?utf-8?B?enFmOWpKUWs1UStjTDZFYnBTMHN6YUNLdTljNFl5dFpXbW5uUjhmbTA2cnpm?=
 =?utf-8?B?Z3ZXYkF2OWxna3IwaFZ3ajVCZUt5Yk45SVozTXJlOVB1UFdzSlp6OXJNVWli?=
 =?utf-8?B?cE9DakVhNDlBUUp6MkxiOU5zVUthSHZ1c0tBVitpYUF3VlFZR0pKcVBDVW4v?=
 =?utf-8?B?bFNVOHl2b0JZMldITDhScjI0dWNFdjR2azRWeDNYRjYrc1FKWkJWL0tFa1Bj?=
 =?utf-8?B?U0FQa2JpclltYzUvMkNNRHV1dGsxajZLakZEeWtDTVpMMGU0YzFnMklMSFo5?=
 =?utf-8?B?dTN6MjBlSnRKUDlmM2hxU3R1cGFxdE1KS0prZDRXTlRqd2dPY3ExRXZjSEdV?=
 =?utf-8?B?TzdvVk1qclkvay9OTmVJVVFXNitVTG5JdzJ0SXdsTjZsc2hvYmtmZ3REUldT?=
 =?utf-8?B?MjRWUEpCbnlpOWhKeHczYnhlRDV1dldWSkhHOElBUE96dUxMWVo4Rzg5RHNo?=
 =?utf-8?B?WU5DTGZiRW5NRFovcGNWZ2FTSUE2bXNjV1BwcU9rNTBneStnTjBIVHlURCts?=
 =?utf-8?B?V0Y1Nit6dVNkQ3VMYzhjZkdKWExHM2txOGs0N0lPKzloRjdpNU1kTW5WVGpC?=
 =?utf-8?B?cDFEaVZvZ2VlR2F2QTN3MzNDcjRhZkRKMlBLYkFTOFp0M3REd1FsdmdMeG0x?=
 =?utf-8?B?K0tVMmR6K2NYUlVSZUVLcndhQ2V3Yk9KK3ZIR05oMWdrZEdlSkpYUUpBYkJn?=
 =?utf-8?B?MmJXZ3ZRdnNCMVE0VWhaZmtuTms0RHhYZStDOC9FeFBET2hIdXNXRG9aR0xs?=
 =?utf-8?B?QllaZ3BUYlBiY1RsbmtXMmJJcHdCYVU5WXUxTXZvZGcybnlVa1FmdEhFS1VC?=
 =?utf-8?B?Slp1NjFTMlpmb2lVbzIxWStiWUp6T2pxT1VDdEhuaC9rSkNCdTBobXhacE1t?=
 =?utf-8?B?MlFJVUhJZ2VzOG43bWpOd3NmMFA1UW45M2pBUkFxK2tGZTVHWjdBSVFDT0JG?=
 =?utf-8?B?SlVBL1lvWGVWeXE3ZS9oVXdqN2lWbEZUVWY0QTFrNHVPeGVUbmFkbmFyVUZO?=
 =?utf-8?B?TXNvckltUmEvVnVoaHl2cGkvNkpuOTFpajFSR0U2THNQQ1kwQi85VFc1RlNz?=
 =?utf-8?B?bGEwSDRXcWZ4c0xyc29jUGJCbVI1UnY5MkpiT1ljeDcxeWR3cmxyamtqeEdW?=
 =?utf-8?B?OGt2Z0JBRjlqcjlTQXY4cTlMbEVidm5TNTUxZ3hzekdTaTBCM1NVU2J4YSt3?=
 =?utf-8?B?NmF6eFBBTEtzb2hGa0ZnODdCcGJxYmlVWHljbGJZck50UlVtaVBzbWU3Nmlx?=
 =?utf-8?B?WHVlS3ovelJ1UkpEcGdrbjhzNWJDanNsNGQvV3dSSHVCVHJZWHZCQ3JCZUtz?=
 =?utf-8?B?dU9PY2ZyNmlmeU1vM2ViUlFlZHhGU1NVNXFSTTZGMnArajZWMlkxekVCU1Bz?=
 =?utf-8?B?M1BLcVl2cEc0V2xWQU9HRkQ3V0g5S0pUV0UwOHpYbXBEMVBSSlpIblkwZzNQ?=
 =?utf-8?B?VFdGeDloZEp0NENUbnN5Zk04NThTN1VpUUEvb3ozaFdZQ1hYclpyTGVZWmh5?=
 =?utf-8?B?VTkwUlBkZVpPZ2Z6bEkyS3F6OUlwRXdvZEYvd2ZseWNONWMvU2NEZVNSVDdZ?=
 =?utf-8?B?Q1ZoRlZWTzBKUFhhdHFORDB6akl4alViMHc5M2pyWGJKYWFOYVQzUWlXUytP?=
 =?utf-8?B?dG45RUM3VG5WQnA3a01JeGp4d3BVSXlkN3BOYzZzbDcwandybFpVY3M4YS80?=
 =?utf-8?B?ell6SEg1ZUtpcDZKUFlSQXo2VE1NRUdEQXljRFUvUDEzenBheGpUVkREMjFK?=
 =?utf-8?B?WWV4cDV4eVpiRjVnak1GNlk3cnJQdkd2R1JnRG5hWG40QVMydmFJRE1PMjBL?=
 =?utf-8?B?Qm1lSzV6Nzc4U3I5N0dyM29JeFFETE5TMFQyS1JXRHN2UlFTeXN0MU5YQlEz?=
 =?utf-8?B?dVVGZzVXdEY4RzhZK1djMFVFS0kxMktaeE9TTUFIckpneHJqRlNCZUNXNFFy?=
 =?utf-8?B?dkVNRHFmcmducG1NejRuRDZpcE1uNk8zWmVad2FkRkJUS3U3YVJaZEw1cFhO?=
 =?utf-8?Q?bH/Ad/VToshBWlkmcmCtRMuyD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120de3bc-3186-4176-0090-08db36823e1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:35:22.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPtygRTKog4kE/zdsfa2Kn6OrHUmeXb4t4ieXa4Do4Y5yRlh31rY9Qrdryzer0UBrRQlarIgkV7AKW3ZRUWyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 06/04/2023 09:05, Thierry Reding wrote:
> On Wed, Apr 05, 2023 at 07:18:53PM +0100, Jon Hunter wrote:
>> Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
>> populated the vbus_draw callback for the Tegra XUDC driver. The function
>> tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
>> that the pointer 'curr_usbphy' has been initialised, which is not always
>> the case because this is only initialised when the USB role is updated.
>> Fix this crash, by checking that the 'curr_usbphy' is valid before
>> dereferencing.
>>
>> Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>   drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
>> index 2b71b33725f1..5bccd64847ff 100644
>> --- a/drivers/usb/gadget/udc/tegra-xudc.c
>> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
>> @@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
>>   
>>   	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
>>   
>> -	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
>> +	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type == SDP_TYPE)
>>   		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
>>   
>>   	return ret;
> 
> Looking at tegra_xudc_probe(), that calls tegra_xudc_update_data_role()
> for all PHYs, so shouldn't that be enough to get curr_usbphy set? Or is
> there perhaps a race between ->vbus_draw() and the data role update? Is
> ->vbus_draw() perhaps called as part of usb_add_gadget_udc()? Should we
> reorder those to make sure the role is properly updated before the
> gadget is registered?

Yes it does call it, but it still does not set the curr_usbphy. If you 
look at the function it may not set it.

In the backtrace I saw, which was happening on reboot, it was in the 
unregister of the gadget ...

[ 1102.047896] Call trace:
[ 1102.050402]  0xffffde9fd18c0878
[ 1102.053602]  usb_gadget_vbus_draw+0x28/0x50
[ 1102.057879]  composite_disconnect+0x1c/0x40 [libcomposite]
[ 1102.063509]  usb_get_function_instance+0x1808/0x27b0 [libcomposite]
[ 1102.069935]  usb_gadget_disconnect+0x64/0xa0
[ 1102.074304]  usb_gadget_remove_driver+0x2c/0xc0
[ 1102.078942]  usb_gadget_unregister_driver+0x70/0xf0
[ 1102.083927]  usb_get_function_instance+0x2774/0x27b0 [libcomposite]
[ 1102.090339]  unregister_gadget_item+0x280/0x470 [libcomposite]
[ 1102.096314]  configfs_write_iter+0xc4/0x120
[ 1102.100609]  new_sync_write+0xe8/0x190
[ 1102.104461]  vfs_write+0x234/0x380
[ 1102.107938]  ksys_write+0x6c/0x100
[ 1102.111417]  __arm64_sys_write+0x1c/0x30
[ 1102.115427]  invoke_syscall.constprop.0+0x4c/0xe0
[ 1102.120245]  do_el0_svc+0x50/0x150
[ 1102.123723]  el0_svc+0x28/0xc0
[ 1102.126854]  el0t_64_sync_handler+0xb0/0xc0
[ 1102.131138]  el0t_64_sync+0x1a0/0x1a4
[ 1102.134889] Code: 910003fd a90153f3 f94ce413 f100027f (b9409a60)
[ 1102.141139] ---[ end trace cdf6612bd43fcbf2 ]---

Jon
