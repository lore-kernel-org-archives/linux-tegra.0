Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527F7C25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 13:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjATNZG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjATNZF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 08:25:05 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47543C131F;
        Fri, 20 Jan 2023 05:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U31HZb2QL/imf5jH2IbT9k92L0qn6x/knMi+YzZDkLYvjTMwOlWG9C/MIxyREJ7yNm964Ewyuucs2ylFXTvQ17O+HaAc1baW6Q0aZUSoEEJIzvtgu0ZS9d29hoY9YoPMBdKOXXe/JsvsyMYckunZnWOB8rG4aPSJKD3hUi2Mdih2MsR/f5M8U/TID7U8SnYpU5iPOCpkk9NTzKlrNKbDouQYwcEBrDIs/6tLwe7BdeLgP3shYqBLhp1Q0nsPqULfHlkVcZUfMcMRnOGfUjwAam2Bbeq1NIMyv3+4kVJ6NuMRCmDVfGOSpzIblNwUKUF+JbK/696ihC2gk6kfZ8wrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djLFCvkGqWpqR2frdZlrrjqlTCxh5EK9J7sBzdz0sWQ=;
 b=NkqJoJNpDesP58qzKX/T7UUXoEUSQdDxhtC+oUmn1h8mifEiPNwqQ1bsMYAX4qwoAC6RELKZ1iR8hgLwX2l0aIewn38oYhDJFE2xLX6gAdvTPALy9ZakIskWivE9hVLdiWz3VK7+Q/Yw94zY1QGafmBHXoe0ikbHp1sSZuU3wYpO/V4stWjHVCu88yJ873k8BPss4ehzQcWDN/d1cIcnMqUt106PY1ivAj8rsXYvQzR7Rja8N2rTDlzW3dWFku4UqcdFdhPKW7DPQnSAEgBpKMjRAwpyI3HrytH73QepZct+ASUYImEA2zQhg7Zx9ObH8kpmb9GD/MIsUsvojSDPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djLFCvkGqWpqR2frdZlrrjqlTCxh5EK9J7sBzdz0sWQ=;
 b=UhiK+RI0Y+d+5Jo/jB/SnCBRprWGB+hsP2j84YsvQP+3dAj2KfzoWPv1UqOqIYweqtmm7PYzG+u1VjXSO29pbgPA7A19GI+1bobbX1R982RI6IV61a1wcBINoOig7+m03qqqbY0X6pMNlwDGD1TOiHLAxqo+8dD6LPGyMcNS92snymRf7eUEZpPoaLvkugDnTK4a6Tu9pn0mQO2WPhVnxnkpotSsGLyPJxc2c+lSQopyn85p9hKLvdjnW4iV1uSAunony7ZSnQWeipTMnXi7LosXD2tX8X103+AHaIjFiVsrRty48HVr3XXgtyVfAzFQ7Qb4lZlPKwMPUrFmYqwdoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 13:25:00 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 13:25:00 +0000
Message-ID: <794c2cb5-e5da-5c49-5465-9b9c8049ceb7@nvidia.com>
Date:   Fri, 20 Jan 2023 13:18:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V6 3/6] usb: typec: ucsi_ccg: Add OF support
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-4-jonathanh@nvidia.com>
 <Y8pf0Vo+HzTZ7+H7@kuha.fi.intel.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y8pf0Vo+HzTZ7+H7@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: ec698a1b-7fd9-46f8-d56d-08dafae9bad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emLbeshqvWW0ZOMrb7xo4c0TPyEPfeDSf9WZ/7Izjkj3AT2QrvU9JlXMfkMlXjxFufjxObdzvH6NupmIH+M1h9Ds6zS7aIgEoiaVD0H7eyqLsr0vxoZs9tyWBae2txTZahfW0Gzm1Cwrx5t8rB1kHWB1MpNOkJugEj1lg4Xx3kQ2Sf8/wcRmHoHU6N3frVUBH6h/rE5C8Q6EyONar5qFDFdLHe6ZEEnVHHXRdsMsRv3D0SjVW8WKQJeqFl0gAouMm24tg/hrZGfC67VHFwTojggu/ZyadWUCwZ7coavf/DVPKKcj2ovKPwvKF6wH1u9/H3zb1R45DDIlqxQQO9PGoBJ+U21K1HEUkXbtUKa1sNtD1rB67z+V4zd/j5hG2ZsqgqeUy83Wgvo5ZF11YKArhuf+KfqFi6pC6jlNXtu/15W9F2EiTww05tD4AInZ8HFUiMxCerM1c8U5icQttrOXADWpdo+Td0WQT1OlYEN6a+GdKTAIA5K6fPQAy+dN2yI/n0Qoshg+3r/ZmJmC033vBhRY5oqzzo4j7HE7JJ2SLH9Ky789ohPUZUL4feNRsdnIUsjyR3Pd90uPpjScnsv+2VhA2mgiC77/zuDLGA5iOHjqB1UHabf0gQZN73xxHhPbVeWUc/wIq7UztdVTIq6XyiTdiDziSgZU7PsRchGsDajrj8PYR7wYXTuY6Uif+KNe5AmPKv8d5Z06ibSi4NGTR1v2Nlpd4UZMvq6A06E+Jtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(31696002)(36756003)(6486002)(478600001)(6512007)(186003)(26005)(107886003)(6666004)(53546011)(55236004)(2906002)(6506007)(41300700001)(8936002)(5660300002)(54906003)(2616005)(6916009)(4326008)(316002)(8676002)(66946007)(66556008)(66476007)(38100700002)(86362001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnkwUzN0OUVwaHB2TmJCOWdCRHdZTVUyWnVxWGxvZ3gvdWNnT2FGQ21kQm5p?=
 =?utf-8?B?YTBYa0RmY2dDalYwRUd4dTlrOFhjci83TE9ZWXAyME9XMWxWM3NoWlUweFB1?=
 =?utf-8?B?d3pBTURxRFJ0eUgwOHZzVDBFU1JHbjQrY3k5Yk1qYU9Fci9CYXpkU3Avdmc0?=
 =?utf-8?B?cWlhTkFTb3Nqek8wZ25tRVpaQ2laWlpxVDlvVkZMUW1yUkFQQzhacm9zMnVC?=
 =?utf-8?B?Q0VzbU1Ud3JaS0lvRXNUMXp4TncyOWFidkpaeityd2U4Vjd6TVhUeEZ3dmlY?=
 =?utf-8?B?Q1Z5am5OVFg5L1VHQ0pock41UGRleUJhVDVPUTJoMWNPSlpneEtPUUJRMTFh?=
 =?utf-8?B?WUtYYWFFSjA1VGlwcld6bDFUbmtkTHY2S1lLZDRIV1U1NWtpZi83MkxVN2ZT?=
 =?utf-8?B?dzJ6Zjloc3VRNHA1SEFKN08xY254YmtrZi82djA4cWFmcmJya2h0ZFU5Q0U1?=
 =?utf-8?B?ZlBPRHpMektLR2ZxQVlPckRJOEg2VHJaZ21XbVlLek1xTHBWV1dxZFloQU5k?=
 =?utf-8?B?S1BtOS80cmxyenNFelk4cW9VMSs0MnF4QUZ2L09pUlQ3VXBXWUVVbTJpWU1W?=
 =?utf-8?B?MmxPckl4OXVWdXFmaUFUSzQ2c1hxN3RmbnRMdjQ3aEJkR1hxU0Q3QWV1dlBx?=
 =?utf-8?B?bEVzbktzVnRIdVM4M1hFOWlQTVcvRUZKRWNLU1ZWWVUyTnREVW85ZmN2SmlS?=
 =?utf-8?B?YjdDekF3dkJDeE9WZmJvb05LVWZjUlVtOTRQbnRGL0dNSUZRRFkzYU5YMXdt?=
 =?utf-8?B?MWMvT0lGdytYbkFoUWs3RVZLYjJYQU9MY3VUMjc2NkIyUXB6UG95ZGd1NmIz?=
 =?utf-8?B?MS8rQW9MRUNsQUJpMEZEUkJQR3hHbzFQTzBRRXZtZmUrRStGK2JpMGN0ZzU1?=
 =?utf-8?B?R1FVYWw4U2dwVGxER3JuSlYxSnphVTVhaGdjKzFTUFJUUS9ZQWthaWo3ZWxv?=
 =?utf-8?B?ajgvSTZVckp2cVN2M1U4UlNmMVRZRThkejJXK1ZUQzFOeFNjek9KeUhqTUVV?=
 =?utf-8?B?M0w5Z2pKK05xd3JtQ2NzZnU1a212UkpMeCtPOWtYQWhxRFVIdmZUTGFwTFBu?=
 =?utf-8?B?ZFpsdzYxdDY0Y05GQmtRVDRqSFpJRXJtSFVmMWlJVFMyRDlqb3hZTlREOXN5?=
 =?utf-8?B?dUFPMFhOU2kwSnlmWjRzQ2hyaVZvRHFOU1BxVE9wUXdNbzdTV2MwdEh0dTZU?=
 =?utf-8?B?ZE0rM0FTbElRcFl3dTgwc3FNcFZPcjJiaFNXcThKc2ZaT2h0MzdoR1QvelpL?=
 =?utf-8?B?VXlWUExhZjhBeVp5MlVqMDd3NkJxVWN3N1A4a1ovV0o4OXN1N1krNUdKL3g5?=
 =?utf-8?B?a1NzY2swS0xoaTFsczN2dHIxd0RveE8wQzdRaHpSSFVtaHJaT1hSdm5HUXRU?=
 =?utf-8?B?b3FUVjNBQTgyL05DT2V0bnhjeWF1MkdLYjlFdm5ZS2xXYndOR2g4Q1hwRE8r?=
 =?utf-8?B?SmxRRERMelk4M0lxS1Fhd2JaTDB6QUZlV3BjamNieUFhNlNRNVd1dURqNWlU?=
 =?utf-8?B?bEQ4R043WURkbjkyZzQzM0lRaGZWSVFSYWwxUlFSYitmck1MdExrRVJ4Z24w?=
 =?utf-8?B?Z2ZVT3M1OFdLd3lmV2JBaGlDK0g5VHJpZWFwcm1RYkhaa044a2pGZXlWbDVj?=
 =?utf-8?B?V2RrcTY2b2ZDMlROUXdySHNqaGIvTnZIdnVyOVdUVVhxcUQ0T1NLZUZUTkp1?=
 =?utf-8?B?VmR6eTJXTGlHSHFwWkg1d0Qzc2dqZVFCeGdUSXIvUXZWVDF2Uzd1N3loQVFj?=
 =?utf-8?B?b2dCSFF0QVI5Rk1tckhpcm5Mb3plOHI3c294a0dNcllwWWtOUDRnUkNwTHhz?=
 =?utf-8?B?K1NUYlRYdVhlR2xTM3BjS21YRW51eHlvdDNHSTZBc0NreTZwdHhZazdGdndj?=
 =?utf-8?B?SFJOU3lEZ0gvdVhtQ3lrWkNnSVRuSTZISFFQVncxcnUvK2ZUQkVFOGZEbFhk?=
 =?utf-8?B?T0dpZkpCWEgzQ1pXMytFVnRBN2tORHUyTzMwanMrUGY1SnhnUkk3Z0N4ZGhL?=
 =?utf-8?B?U3JRUjhJT29oZmM5VmZ5ODRLRURxRmQ2cDA1QW8ycGhRZUJTOFgzVGltaGdU?=
 =?utf-8?B?QWNSd2JiRmpDM1YwS3l3cHlhM1ZmUE1TcVc3c2ZmMmFFbEZsNFdBL0hiU2ky?=
 =?utf-8?B?UzlRcVVNM1BTWHNjMUw3c2M1SDViYkEvYXhObnpLVHM3ZUs4TEw3dUdtUzQy?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec698a1b-7fd9-46f8-d56d-08dafae9bad4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:24:59.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iURTZyqsbs90HD0BLmLdaYWOrzunuwkuQosPUWxWimD5T+RWIjXfjJsiVGn7kdlCNv1v/3uqwSOilrWml3zgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 20/01/2023 09:33, Heikki Krogerus wrote:
> On Thu, Jan 19, 2023 at 12:16:36PM +0000, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Add device-tree support for the Cypress CCG UCSI driver. The device-tree
>> binding for the Cypress CCG device uses the standard device-tree
>> 'firmware-name' string property to indicate the firmware build that is
>> used. For ACPI a 16-bit property named 'ccgx,firmware-build' is used and
>> if this is not found fall back to the 'firmware-name' property.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V5 -> V6: fixed compilation
>> V4 -> V5: add support for 'firmware-name'
>> V1 -> V4: nothing has changed
>>
>>   drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> index 46441f1477f2..661a3988b39d 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> @@ -643,7 +643,7 @@ static int ccg_request_irq(struct ucsi_ccg *uc)
>>   {
>>   	unsigned long flags = IRQF_ONESHOT;
>>   
>> -	if (!has_acpi_companion(uc->dev))
>> +	if (!dev_fwnode(uc->dev))
>>   		flags |= IRQF_TRIGGER_HIGH;
>>   
>>   	return request_threaded_irq(uc->irq, NULL, ccg_irq_handler, flags, dev_name(uc->dev), uc);
>> @@ -1342,6 +1342,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>   {
>>   	struct device *dev = &client->dev;
>>   	struct ucsi_ccg *uc;
>> +	const char *fw_name;
>>   	int status;
>>   
>>   	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
>> @@ -1359,7 +1360,18 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>   	/* Only fail FW flashing when FW build information is not provided */
>>   	status = device_property_read_u16(dev, "ccgx,firmware-build",
>>   					  &uc->fw_build);
> 
> You don't need this anymore. You already added the new property
> "firmware-name" to drivers/i2c/busses/i2c-nvidia-gpu.c.


I was planning to get rid of this here, but I was not sure if AMD need 
this. I see now that Sanket has confirmed they don't use this and so 
will drop it from here.

Jon

-- 
nvpublic
