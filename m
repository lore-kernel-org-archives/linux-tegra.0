Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7301C25B50
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 07:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjATHTu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjATHTt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 02:19:49 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884A674E85;
        Thu, 19 Jan 2023 23:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGJH+q1P6NmqDnDXTyaPXenrhweU9q4NpLKIkaK4o/YFEnJseNkrEeisV3dcerI6HeL3MlIlM3Hw9fjow6hfgvkIZ0AfpwyLFnlJQ+9GnK4KU/HHb8kpDydwl5a1TPW//a+Pn/r285Sq/DV0I6EXPWRbLN7w8/pOj6O3sltvXWWegR0w7PG4MPxnZpiKJklBAOpIWoUrkPf2nGv0si4xoaE8rjbwSZgBMBrQGucg7Fyq1t8TNrGBnh1LieVA7MQHeVu2Lzho7Ah3Na8x/Iv1O6LEUIrx1npj5DgPryxTWU2TZkqX+J7m0VDrmiwed079F9Oug0gq8rxh1yaTVCoJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg0T4vAAF/LQvo0Ijyc0h2FcyoYLGci8WZQGO1va0uA=;
 b=EOZogk86vta0dVphe9P6Yveyp1KszFPZM/eWyIEIj0HFrmvHPj5D4vsA5xyX7CiVDyNjf1l/oeIsf9mY610L3fSknzy+om6Wqa4ItbY59TSoMK1TngcGgJEN1yg+tufRQVDPhIJdUGTb0VQ1v8w4z/U+OJ0L0A1xJ8/s5oGY3MdMZT+5+TepcYjpqBWDdvDwKpuhKQRcLWg4jlg0LYSdd5DoJlpA96I6qeYaC7L8amJX0Nl0e5edfk/RjNXhk7ctsYvvK629toXkhdRwxc4ls9JxC24uTi45SjlLHDAC19QTJekF0aIJhEFrtIJirh11+24MIQPEuKtfCHc5gWaw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg0T4vAAF/LQvo0Ijyc0h2FcyoYLGci8WZQGO1va0uA=;
 b=yj1aBf+ElgMcpkRiX/w2bpbPqfJMeRLvYy32ioPatbXIVyiSCyd8paX17B3caQ4Nc7Hj4d4RKMGWUAeTnKUI1YQpDeHzWzKZOQlJ2yKXVvv7q1OmUCAfHm5Oy6DP4rZEXed6SJ808y1DNBzZMv98U06PymzjJ40Tb0jXM+9f6uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 07:19:45 +0000
Received: from MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::98f7:72d8:1f2:5604]) by MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::98f7:72d8:1f2:5604%7]) with mapi id 15.20.6002.025; Fri, 20 Jan 2023
 07:19:45 +0000
Message-ID: <76b4f5c3-182e-815a-d5de-0ded2fa7c0e9@amd.com>
Date:   Fri, 20 Jan 2023 12:49:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-4-jonathanh@nvidia.com>
 <Y8aOaH+ALBvjm/rH@kuha.fi.intel.com>
 <11349701-f82f-3a7f-61ef-11f1585958c3@nvidia.com>
 <Y8e4KXMh+bi6Gj7r@kuha.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
In-Reply-To: <Y8e4KXMh+bi6Gj7r@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To MN0PR12MB6102.namprd12.prod.outlook.com
 (2603:10b6:208:3ca::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6102:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 5782519c-6f48-4290-efec-08dafab6b492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwzovSxyJ5Z0USZuzpikKO4/7SZAIHmB6HCu7j7cIb1efUFgjJqjDXbJQZoK/iMDfkvlgHe4lrYrTgv4F5KLv4y5hr2TX6IPaDJ+CTTCZheKbWMt8L5D3EI0aEUGzMF/qmkfbaXeAe8fXv2PMnIluH4APW4F4vQZJKCBxRkWp+xaFXourjlvVCXMeVYltgHyK9+yFyZmK7IOgqdR0rWGijsr2OgmGZfxey1UZxPNeeu+vCtzGLQbqC1umE7fmrGDSuYc+4uiMeTf+7ltrQjx2D8E+Fe1B4GnLXjhlMQi08WmqhzksBP0G59KUDDOhG3aRYT2rwUG0POxcPZzlhs5EdiFDxxNMf/aMMgPHiqCRoM6RcAcA8/67iF6jsEobWND1nMby54pbIgJMwtkMBHDZSNyRnXVMSp2z9vUAei9l5IBQD1C/f2myWsieIiaO+o9yxMHKI3xwoe+sDBiY+ibm5wok3bOxYobqC2rdedad5m3UjHoBB7xC6Ji8DR29HRZJR1LuS1PINbug1RjR7w0aX8roiJXU/3uUurLyrRwZ6N2adh72x6s2nLayoKW9Nuj5YKF6KBk4md/AYNBw8pzvElIi2L8OKyOvOX38cBSD6r/rCwdR6Jly3jbcRoXYfeQZDeCpOnY/8DRzf8XO8JJw+gMR9ytqAgfF/YbMnpB9lkn/5Km6A6DaOt8pZHhikvJcGUSEwJ6IsQL/RPf9Ic3Dc1U8kKaV3fzzj8XTCkWz3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6102.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(6486002)(83380400001)(4326008)(86362001)(66556008)(38100700002)(2906002)(8676002)(7416002)(5660300002)(31696002)(8936002)(66476007)(66946007)(41300700001)(26005)(186003)(6512007)(53546011)(2616005)(6506007)(110136005)(54906003)(6666004)(316002)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9UNDVNcEVFdEo2YU1wVDk1NDlmSVNLVUdCMzN0cEcrQ1liYXQ5NFdwVTBT?=
 =?utf-8?B?R1N3SWkxdU5CdVllV2s4TVVyKys2TFg0d25ZZjI2R0hSWEJ2bUZ6SWkxY05G?=
 =?utf-8?B?dkF2dTFnaDhQQ0RqaG4zV1FIRTlhenoydVpUeExVbjgxUnhxWG9FeVhwM2Jl?=
 =?utf-8?B?Mkd3WnhsUmQ4enFIbERVTVhOMHB4NmNycm54Ny9hbWU0M0V4dEFpQ2FRTUJr?=
 =?utf-8?B?SkFhWGkxUU1BV3Z1OUdDUk5XcmdkbndqdVMxbFQvWXF0bGxjWTUxVzIzTlJK?=
 =?utf-8?B?RFhMQUgwMUorYm5nYnJlVkJhOW1MOTR3bk9BTmZxMVhVNjJWUldBaTdzVHFj?=
 =?utf-8?B?WFBqZFNsVm1ERFQ0UVBOWnJaZndTY3g1NDVMUGdqM3Y3YUVidCtJU3hrNk1U?=
 =?utf-8?B?dkxMTVRNUDZVbUcxeTBpVWk5NUMvTUtXWS9vSmVHblVFZ0U2TklvVmFPS1Y4?=
 =?utf-8?B?QnVYd3p0aWEwL09RNmhDN1I4WWl1bm9qajAzVEpUaEtEWmNkbzB4MjJLVUNS?=
 =?utf-8?B?UEVvd2R0dXN2R3JncGVYenZCN2k5T0EwcnZkaTl4YWwyT3hDMFRaNmcvbGdo?=
 =?utf-8?B?VGNKK0hndCtHcWFNdDh1NjVYSUxvZTV6RE9sdld6RW1HUDJBbmJxQmJ3b2tk?=
 =?utf-8?B?cTVTZlNBZnZrTk1oM052N3VPazlaL1lKL0NFdnhhWUtRSk16QWgwR0dMa1FD?=
 =?utf-8?B?MDNGSWM3R3BIeUFRa3Bqc1haaWNsdFVVZ3owSmt1cFRFSkloTE0wKzFBNlRC?=
 =?utf-8?B?Nmhxb1hQUmE0K2JTakJ0a0FFQXA5NGE3ZEE2QzY5Z3R5eHFoK3hMdHoydGIw?=
 =?utf-8?B?TjRZMWkwWGZCeXFSYkFNTHZZZ2ZwRVk4bURpRnF5OGpKbGpYUjZkSEpRYUpm?=
 =?utf-8?B?QlFYSEdwT3VyYjMvWmM4M0VHczZpOHcycmdpTjBDL2Z0alU5UGJRbER0blMv?=
 =?utf-8?B?V3hzUDZsbmdnMWdkdk9ZcXQyOWRkZEhwb2VIbDRTMjlUeTBWdWZteE0vcHRk?=
 =?utf-8?B?TythMC9oa2R2QWk1Z1hpYkx4MGpyUUNJNEcxM01UT0JqNW9ZSVFxK1RDOTR4?=
 =?utf-8?B?V05QbXFKbHpKL05oMmJrS0VHNGxUSXhpTXgxVFI0amtRMTA3QXNaL0VJNVJE?=
 =?utf-8?B?VHJ0Z1U1RTZpVnNSMGJYQWM1SFN2RDJzQ29oN1YvYm9nbDg0RWQ2a2tyeEJw?=
 =?utf-8?B?dlhMQ2thckdRZW5VaXkyS0lJVGZhQjZxOFZNVFM0UHZ6VzllQ21GN2VBajRX?=
 =?utf-8?B?bFhNVGNiRHdqbzVNTEE2S09tWm9HQmRDTGtBUUxCZmlQSHBnWWRJajhUak14?=
 =?utf-8?B?YnA2Z1RaMHhmMmtvME5XbUo0TG90MmpYTVpIM0FJRUs3QXlRZi81cXU1Wjk1?=
 =?utf-8?B?OW9udlVHWVp1UkRIbHhNNDVzWk5oeGlpZWJLTzRsblBvWkMxeHlNNkF4cUxJ?=
 =?utf-8?B?akRPeW4zd0k2MVBvTFJ6OVNrdXVZTFFCcUc0Umc4MEgwa05kZ3NNKzczM3NB?=
 =?utf-8?B?QmxPenRwVVFReXpmUU9maTFQTi9UMzUyczFhUzg2UEMvVDdXY1oxUWF4UTFr?=
 =?utf-8?B?cDM2YldQVk1PRzBvTTJ4N2NJZXRFOEM1ZGRtd0l2dlIrRFJRaUtZK09FS1Mr?=
 =?utf-8?B?emxYbHJRVWF6ZUV2MU45bkpFZzFGYWhjMjd2WU5vZEdiTW5pc2ljODJaajJC?=
 =?utf-8?B?ZzFFTHdFV3FKMmJWY29RRGViUWFOK2R6RzRQTlVFWVBlMjJRU1BickxmNjA3?=
 =?utf-8?B?aVBFQjJPcmRkcFJwblFGS28wSlRSUldydW4waTJ3SGlxNjdRNGFRQUhVR3Br?=
 =?utf-8?B?MDZ0bDR3QkQ5d0VOZDM1d0dEUm8rbndTRzlBNkZNdS9zdFFxSDgwVVhmMDVE?=
 =?utf-8?B?bGoxayt6Nzl1SHJHMUcrQkx4bEJMS0xsWHE3emxTdDF5a1dJSnZCLzI2VXV0?=
 =?utf-8?B?VGREM3VhdmdUQmVOQTU1YmlpWG5Vdit1MFF4M01ITWhCTXVpMjExQ1d0Vi9Q?=
 =?utf-8?B?Y0RmWi9GZlNHSTlEQk9FUnNHUHlhZGI0WmhiY2ZlY1JnTzVKUXpuTVEybDV5?=
 =?utf-8?B?T3FrSDJ6YTNxb1RQaHZZaDlLQ0l2WEJkQWpnTmN5TDRjVFdwcE02NU41MTNU?=
 =?utf-8?Q?+I4/fsrafBrbMtrYLcLYFg2Ho?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5782519c-6f48-4290-efec-08dafab6b492
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6102.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:19:45.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A6PHAr5nAyqVpvkXOxVCDVgUG/NR3zbWNMcji0VzAlrraOnMw/78VIex4xJ+Rdv/sFBy65cMqE6UmdybF/C1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Heikki,

On 18-Jan-23 14:43, Heikki Krogerus wrote:
> On Tue, Jan 17, 2023 at 11:29:25PM +0000, Jon Hunter wrote:
>>
>> On 17/01/2023 12:02, Heikki Krogerus wrote:
>>> On Mon, Jan 16, 2023 at 03:50:43PM +0000, Jon Hunter wrote:
>>>> From: Wayne Chang <waynec@nvidia.com>
>>>>
>>>> ccgx is refer to the cypress cypd4226 typec controller.
>>>> Replace ccgx to well-known regex "cypress".
>>>>
>>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>> V2 -> V4: nothing has changed
>>>> V1 -> V2: new change added for adding cypress,firmware-build
>>>>
>>>>   drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> index 4bc31ed8e5bc..d6114fb8d5a9 100644
>>>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> @@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>>>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>>>>   	/* Only fail FW flashing when FW build information is not provided */
>>>> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
>>>> +	status = device_property_read_u16(dev, "cypress,firmware-build",
>>>>   					  &uc->fw_build);
>>>
>>> You need to first add that property to
>>> drivers/i2c/busses/i2c-nvidia-gpu.c.
>>
>>
>> Looking at this some more, I wonder if we need to keep 'ccgx,firmware-build'
>> as a fallback for AMD? It is not clear to me if they implement this property
>> or not. Let me know what you think. I will still update the i2c-nvidia-gpu
>> driver. 	
> 
> AMD needs to answer to that one. Sanket, do you have that device
> property ("ccgx,firmware-build") in your ACPI tables (as _DSD device
> property) for this device?

We have not included this property in the ACPI tables, so there will be no impact on us.

Thanks,
Sanket
