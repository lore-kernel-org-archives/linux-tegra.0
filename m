Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04FBC25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbjAXLzu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjAXLzt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:55:49 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D94ED8;
        Tue, 24 Jan 2023 03:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jodaq8C2sHpJ0LJ/emjtfiFNlJcACXElneZDHRrEsUeuqUIKZgVgC9ycOMyt0VSNMFvf8zHADCSlPcMmhwI6jzJi9LnaRoC9uj+aSrr7GnazAKKktdkOQeJf3Wrm/R+KYM/vkJcEOOzHMRbRxWXoC98Nh4Y6rpZSuWGQ8rpFCigJMG7r8BTjt/dGLk1GB9qfdPnVUzIGzzN3EjBahbFSsuzEFncUMWaYcpVvvbZn7fwhK1+ZB5zE5DGXMHlQYUycRpyj9c9atdDyROiwr0o3AAIKb86ZgLYkgWHMXuE7R8cPEG2PWQ/Y1ereQTUgxs5CRaPOTViza1Qyi1imI54AEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1ZoBj5Y2qQC/z8A6g/bUM3n/c0jzXOMr5FQB6hsnc4=;
 b=CCBDT8s1veWKwrm/AmJcUhd4nC6p4H9KEhtWOrnc5J5hv8OWxFy0GUCMxcT1lBbZzGWZOQvzUjlFlmvhF3CtfPC8dgMZ9cjKry8/NEZOt7uHfdXy9ux/v9gf07C43ayiMgHWM/OJKu1VaJE8rmHxVLzEiNhVK9JHtsDp053q8Vw6qmYhVeRgDVIOgM+T72nhjDbYrWxqkcuOmWC/oGPiz8yyiAN1NFlpLMeLHa60sdWwGNX2MGzn61SQE9QjGhUlWYl1O4QG0wA8uS0C5SSqG1Mlt5soQdtqhHf2XoDgqEoXzFiBzRsjQQQP1GZumyo0q2twks8yWNFN0dVST+TBOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ZoBj5Y2qQC/z8A6g/bUM3n/c0jzXOMr5FQB6hsnc4=;
 b=ZFN7ibwZClZ7DHPkAbCEkuz354MGhLBZBU56RPlhpNZwzru/Jw2VkdfyprmVd3XuVzstpTaCtwOIOZXpvVhUzB07HEA38ieYSC4tLiy0LX0AQyuUR817uIH2sCr3XcjAiC7+L5ZCmi4NAziFDVQ3EqfLxCndP90qbYXJj2YNeiGcG0bHrA4k04RTIRWJFyIuW8NKsECoMu7+mJZKVgJK8sNoqHVk3tIQHS0F6+dVYkHc2zkJn+FPqQzdV7Lo0Coa+vn5aQyV4g3Xjat0ZKVwtVzkhkAo0wg3mU/CzsG6yy8FQCAv/7ZGSYtVBIHnNhLMqywkf5y6bOrpt/lUkgOgEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 11:55:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 11:55:45 +0000
Message-ID: <934ab2ae-730c-33ff-4b03-0f7caea147e9@nvidia.com>
Date:   Tue, 24 Jan 2023 11:55:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V7 3/6] usb: typec: ucsi_ccg: Add OF support
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
 <20230124114318.18345-4-jonathanh@nvidia.com>
 <Y8/GBHsaEYKfMLdg@kuha.fi.intel.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y8/GBHsaEYKfMLdg@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: e97f1cf8-b3bf-4984-a86d-08dafe01ece8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtVZEzi8iiOW3tVfWCZiADiWM75oEtoPgAK82OWdARV6dnWXTya0EknjB2xPD199D/dO1PcOKkq2cioKaDau1YqGsjJTpl+j0bwZgZ/JRrjQogdrXoSY9IZp/yUmDqvWEK9YTBP2raUv8EGO/jLx6bCGbXpIr9txZmdgi4Wvua4yViQCiJ5A858k7dNHvn+qzDoePT01VidmTmFDcQhZuVw9AChybAoki0twBf/DX4GsMi5qFcWCfgAuDg6gEaWvOFFZOeuYOiK1U+uvJ4BY/QhXoL+x0+UB0StbeBY0QFdUS4GwACwUy2xSt/wld2rlVJfSpa9qzALjBBh2xS8pwrLJOODpEvswTVCofDU9lEUC+0mjd4DxbTcTV2GYSG6++Z7fCZbQALk/h4uSZbCmPoru+UhpbYt1qxcmQdWA2q6ZTn+Os/MAaMx9UUzjFPfj5avuTkhKr3UP+LeK3pUtlzf2aG45ROxNJ2AAPFeLH11Xn4OIKCG6Orob6Vuudz3G8iFDNtgu+ju4zydT23S3YcsMZyqLEefW8DaoXTrZ1GmwV2VkCkuSvQI6w+9x3jiFwtQJuD4t7xCwLoRIeOHe1l2yDN9b7WvsUQpJRLO9MDGkb7Y899QDwKXNz7KEKjw0uK1dCWFaJoaSldMoGrWBj/OvjOatYy8jtAQyDMUWBlcSTbyMrzo1wxxUZRkbU8LNhG+kc+cHdO5pkuUKUxeESwHfto7B8ju7DvwCIRPOU5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(83380400001)(38100700002)(31696002)(2906002)(86362001)(5660300002)(8936002)(41300700001)(4326008)(186003)(55236004)(6916009)(8676002)(6512007)(6506007)(26005)(316002)(6666004)(107886003)(66556008)(53546011)(2616005)(66476007)(54906003)(66946007)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBvL1Fmc0JrZDR6MHZnS1d3SnZWdUQwRXd4RUhUVUw4THJVOVB2bXFVQnBY?=
 =?utf-8?B?OVBkVWZETXdVNXlxVEJVUGlhOFQxOFovZVhDakY1Y2F4UHBaN2RjRkQxZ0dZ?=
 =?utf-8?B?RExSQ2w5emVhTHpKazVaeTlFaC8xZXhtNFMyT2VLZFdQa3Z4OXUraGtyaDBi?=
 =?utf-8?B?YnovckoySVRoZnNXYnU5K2crcmM1RUJGSG5FRStYL0pYZ1lKcWJSSEc4NHo5?=
 =?utf-8?B?NUtFT01nVzJuNnUyUUtUcXhrY3VYWlhDQ0xsdjVYR0pHZ0JBVldwWG9LeG1Y?=
 =?utf-8?B?RzlWajU3S2FBbU5tdklGOUpPa3ErbFd1NzFFbnBBQ3lySXVWdEhDN1luYkl3?=
 =?utf-8?B?bExGMzNDY3VBbkJ0SnRzS04yOWhFZm4zMzlHVEVGQW1LcmIzdWsraVVkM1ha?=
 =?utf-8?B?UnJQOXk5Y2hXMWp1TXVRdHp1OHkrUlpKTGVLN0l1S2VUb2FSUFlyUWpicTFm?=
 =?utf-8?B?NWlRM3ltZ2g2Q1daVUV5N3kyV0J1eXJrUWtuT2lkekczcWxBNDZSN0RVTXor?=
 =?utf-8?B?YVkxREw1N3gxWUV3ZHBwZDAvWjRRM2JDcUNwM2VjemhDL0ZzRVVGb2FFejEy?=
 =?utf-8?B?NnowM3phai8yVWk5SDI0SEhaSS9lWXVvcjYyWmVYYzdXS2NXWVJNSTh5L2kz?=
 =?utf-8?B?Umd3Z04vMDhUU1laQjNkR05PNVdtMmd4ZktTd1F3SW5iMDlnUGt1QkU0SWdI?=
 =?utf-8?B?K0IxQzgrTERrQlN4TERJYzFjMExHenZXVEl4ZVZOS1poSWwweWwybnBabHJ5?=
 =?utf-8?B?c01iRkFiT3lrbkloSDNxaTBoYjJ1dDlxUmdQemJBZEN3dThpYjQ2Z2w4VFVW?=
 =?utf-8?B?bkZOc1RhQWY2U280cHRvQTk4b0h1V2l6UmpZeENsOGx2QmhQdDlkbmk3bU5u?=
 =?utf-8?B?cjZwVkx4VGRwTDNvQTU1SWxacURPd0pqTWZlYkJvMXM5VThzOXJUUzZsMkg0?=
 =?utf-8?B?Q3MzSXRSVzhHL1pyUTdsRDRlVE9RajdZbmE2NnNpY1RWbkFrcFBhNHNKSUly?=
 =?utf-8?B?TVRSS3NWbGNvdUs4ZGorSEFMMTJZYjN2Rk84L2d6ZHdsWnVUa2FIY2pQR2ZF?=
 =?utf-8?B?Nm1paUxkZjA5VGJWaDBoSUFqTGszWDNkbXhwK01XQWErdEZMRG5JeldtUmFS?=
 =?utf-8?B?a1U4bkJuZDE1anp1eEpsaDBZNTRwRWdvWGVVNFAxejBTNVcyV0N1OWd4aWsx?=
 =?utf-8?B?QXZCaE9lckJIS1lMYTFDaVVCLzFsWnlET2g5Mm11aTBoSDlueXNCZUQwNUpJ?=
 =?utf-8?B?RVlGNGh6ZThYRWk4Wlhub2Zkdk5QRmlGb1VjVDZzK0xDdGI3alpjZ1VkVFdJ?=
 =?utf-8?B?VEtKMHBJSDVLQ2FLSGZnbU9INUxRY0R0NXkxaEFZZzhSQ0djL1gxK0FDT0tW?=
 =?utf-8?B?MEY3TmZWYWxtbFAwbnZiYTNBUXN3a0hSc1k1Y3Y2OVNDQmI0a3ZUVnhtaW96?=
 =?utf-8?B?VVo1Y0M3RkFGM28xN09NK1g3VWo4UGpGS1N4QUowMGt5d25BeTRLaUFUR0Vk?=
 =?utf-8?B?eld4V1NaUkg0YkxOVGwwNWNsYUtJNWgwRHhlRGRsWVVIN0NjL1QxeVpqb0ty?=
 =?utf-8?B?Qjg4RWZ1cVlIYXZEeXR6R3c1WnN1akxxRm8yajdqSy9mcnFJSFRCNllyWTN2?=
 =?utf-8?B?NVJ0MnFIaGdTL0lvdEpKdFZSZEF4WVY3UE5WS2ZOWlN3WXVyeFVBL0tjVEpr?=
 =?utf-8?B?N0c3d0gxVmRHTUkzNUk3VmJ4UW5VVTZNVC9kM25qQnQ5NE5KU2JQQW5mLzNP?=
 =?utf-8?B?Sy9iYStGQng4MlliSnlsNTF0TWhBcWp2MkNBQW5ac01DMHFBU3E4cUNXN2NV?=
 =?utf-8?B?UXZZeTMwejNUbzV1cDFLOUpWN0d6c2VEMWVSTCtPbWdabHBnbS9xY1QvMXdr?=
 =?utf-8?B?M0FsRFNScjFLaHFZYzdNWUZwMzZvdFQraDd0cFhKY3Ewam1iZVNIQmduQTBL?=
 =?utf-8?B?azd5djNtbk1TS2VlRGNHWUIyRnh0L2ZERnpobnk5Z2V4WHIzL3crc3hZOUYr?=
 =?utf-8?B?N3RJd2c4em1QRlF0Y25wNUZCNFhzQUZsZ2ZrUUhTMUNPLzUreXNjQ2pMSFIy?=
 =?utf-8?B?K3U5K1BWK1pRajhYekZ0TmtPL1ZmVEZaZ240L08weUNHeUJ0ZFFocDVtTk1F?=
 =?utf-8?B?MWFFeCtXc2ltN3FoREFtT2VTU29UV2NsQ3lsditkLytFRkF6L3dtRiswb01Q?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97f1cf8-b3bf-4984-a86d-08dafe01ece8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:55:45.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmv1NikNCNJvptqAhLHxK7FspkuppMnxe3z7CfBrxfi5Wujhw3zcOtd+T/5esocKoCZumGejCY+mcYQehxXUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/01/2023 11:50, Heikki Krogerus wrote:

...

> Hi,
> 
> On Tue, Jan 24, 2023 at 11:43:15AM +0000, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Add device-tree support for the Cypress CCG UCSI driver. The device-tree
>> binding for the Cypress CCG device uses the standard device-tree
>> 'firmware-name' string property to indicate the firmware build that is
>> used.
>>
>> The NVIDIA GPU I2C driver has been updated to use an ACPI string
>> property that is also named 'firmware-build' and given that this was the
>> only users of the 'ccgx,firmware-build' property, we can now remove
>> support for this legacy property.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> You missed one nitpick in v6 - check below. But that's minor, so if
> there's nothing else:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
>> ---
>> V6 -> V7: removed 'ccgx,firmware-build' property
>> V5 -> V6: fixed compilation
>> V4 -> V5: add support for 'firmware-name'
>> V1 -> V4: nothing has changed
>>
>>   drivers/usb/typec/ucsi/ucsi_ccg.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>> index 46441f1477f2..8f5ad2094f26 100644
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
>> @@ -1357,9 +1358,16 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>   	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>>   
>>   	/* Only fail FW flashing when FW build information is not provided */
>> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
>> -					  &uc->fw_build);
>> -	if (status)
>> +	status = device_property_read_string(dev, "firmware-name",
>> +					     &fw_name);
> 
> One line is enough:
> 
> 	status = device_property_read_string(dev, "firmware-name", &fw_name);

Ah sorry yes I forgot this!

Jon

-- 
nvpublic
