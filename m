Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B6AC00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjASKvG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjASKuH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:50:07 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049876F8B5;
        Thu, 19 Jan 2023 02:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBRzgfPB3H44yKS2HgDt+q6YldkmniVbQJFtYOFMKDcmL/XFRf3b4KbhvKw0gkX4OE2zy9lcd3IB8U5JA20HJ+k9qeEnZmpAY4JkEOIvqKkcG5VeZlmZuEJu7310S0e4A/dHdiXnKFQgWxFQuA5aKj+hxi20kI1j6qEMBcyvuoud5etz+Cf/HLK4guVo0DvqRv5W7iqdumn+pDxGSe2fGVEYheB2M0A5EzQOrPfcTQi24htJlsnioAuYTiNqCwrnXa8YcgTCper9Vj54Uqs+1rXstoTUQsBojwt023zNt6p3nIItPsHZ9BpA/1s23eoNdmidoBV62et0z6T69aPD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZxTmtZ2QbI5gRerP9rAC8ec0SEhWV6niMqi1Z9q+7U=;
 b=BrBMSqQ6swf1HCRfXMgJwkyJicTGaIh/n5vnIUj+VxlU6q6bfwip6JMk8NYGjQDIm+bdFUEdC8zemc72svdiMBaA1y2eZ/wFA4ASkfy9OLkO4VZXLRnkx+oeCg4taqREvIqD4nFdBaCsG1tF2by4+C9MeF8oWdYaIPJ0jfjmIpJyPJdQR1FvOYPUrcATyJE7MIJm048gBf8tssRzKRZYXEvuqOauknYA0pl6k1H7RROIew51hvEmwMaywa56OBY4sWWRMeHXY1jjz00aQWLplgxKCN1OmEZ+fpNr/hjbrBXL0z6mttAfNfHWhz7h4uvXBO7N+RRkPsNpB9rlTTnc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZxTmtZ2QbI5gRerP9rAC8ec0SEhWV6niMqi1Z9q+7U=;
 b=py2fZcrD5thLUw+IEQK+sm6UKuH7NpaXS/fRU4CadNF0ecc71FdtszkXc30IHUP3lMfmwFt6h3ZZzTxSb7Y5IrjMNq3p5voJ8eclr25mMzzxPtK7yopHvO1UOoLIvp5dQfhZ65DnOxb70a+HJCSKA/bLGgKSyV6n/cpZn7ZgZorZ40eSv0EIpTjETxzFadj01s9Kr08o8isv6zFxVoyM2h77dchHt73VlDnJP9l0hYA5feCJyQ7CEbeTTPXJPw6g/fG4svhCqU53PckWF3rnFZjJ0NDQ3pOKBIV/MjSIJKUqKDBTEaLn9jR4y6K5xF8/EHjBSWxsP0k2PoQQSm8UUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 10:49:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 10:49:45 +0000
Message-ID: <8bbcaf13-c83b-5804-64f7-23635013a11d@nvidia.com>
Date:   Thu, 19 Jan 2023 10:45:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
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
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y8e4KXMh+bi6Gj7r@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4308:EE_
X-MS-Office365-Filtering-Correlation-Id: f0eb08fb-e893-446d-84aa-08dafa0ae0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2Tezhzdih2K9SfQkbn3Z6miJ+MQkQ/kpTaywbWSsCmEEQnfA8KBZ8JfFPjoUyLf+jHbkYty/CmkxU3bBpON75fWvFtsd2YeDnZOnJrbc3MgyCiegEeY/hdHaXy8khOiLQsAVbDUcjzowkdPImz6tAcbOy0xdXUDlwGfVolq2kvpHSnptasOry1L96KOi9V0VOFFZ/u5t2ZyiLtxfbioN3d+sOYwl1tkxmOotNCW8Hm8NhU75U81hmNp8mhfDvRRsClQOPsWwByH/FZYxL+dvLFZPfQukIMFZQ0+hyIn5k19YD/saHh/A32kxBEZnqU8d/wSzj+bpj1Mo7ZBFniBkNV6n+d54iZc4CwtjAWT0e9oRmu9v7zFsx67wBBZ/chSIhlPhbNaAnrGjf/piE65AIFdoAWak+MkT398QB7jXry9nTFo5yS7u9Up9WWL05lcP7y9S5UIaDiSFsRVNhfeqeUxQdNiFkaaBYKz0ZoP8VHmMYiPmp16MFQwbUnfZr7TCbaG8gq3DT4mR0EE0O9k8hoIZFTYIG+pfBmGlQiIRZP6UOJywTNfbXNbGbTzkcGA2ZVDpuyAEOuXJV4Yqny9wn08LhpmDcqePgofnuFRf6oOT6nr7SZqcDPls6qXT0TKvGkWx2TyttiwqIrGkf+5ZV7RpaWCu1NwMAcRqeKEM1E84eT/Tght97iqunzpG78boIyHQdQhPbxaWAJa+O9GA/8JeW9vzjZqYs2/+Io7GYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199015)(31686004)(86362001)(66476007)(8936002)(2906002)(31696002)(66556008)(5660300002)(38100700002)(66946007)(6666004)(478600001)(316002)(55236004)(54906003)(110136005)(53546011)(6506007)(4326008)(6486002)(36756003)(8676002)(41300700001)(26005)(186003)(6512007)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC9sYytpVFU3UDlXREl6bEIyWHdlYnVEU2dNMGN0a3NFQXlROFRIY3V4VUNX?=
 =?utf-8?B?QmxZaHNNdk1OR0tOODcwL0pyWXZmSmVRRnpQaDd0WmFhVHgzNTV0cjdwdVRK?=
 =?utf-8?B?Vks5eTJXMk15ZkhncGVXS2xJcnVrQ2hhZmVscFIyZFFiYTNJWHFudDV4aU52?=
 =?utf-8?B?Wi9xM3pEaHRFMVNRbDhHRVN4UkduVkZNR3RPYmNmdUJhQ2lodEZES3YvaDhN?=
 =?utf-8?B?dEUrU1g4VHNWMG9Fb3VlRUdEelVDYkh0bGlSK2VDRjUvRlM5dUZoQ1FYZE9Q?=
 =?utf-8?B?UE5SOVhxWHVvWWFFSS9VUEh2MWI0a2JNL1JMcEx1RzZRUVd3ekJSdm1kNXRa?=
 =?utf-8?B?bExkS2VUK2l1bUczQ2xTWmVReDhiZmFHdk1kWjVrUCtZaGZwMUl2SnlCR2Fx?=
 =?utf-8?B?WnVXTzZBczFaRVRLbVNma0hqb2I4R2RiYVdUUFRGSG8xNUpGZmNzeGc1TE95?=
 =?utf-8?B?dHpkKzJ5S0NOejZ3aEhwYlhCQTFabVlvMGtPNGZDWnRpNnFNWEVKNGxNbHl0?=
 =?utf-8?B?dzZ4ZGlGUEVQd1hNL3ZtQ2VCazBud0JqaitWd3hhbUlOYlR0VDZoRmQ1TDBO?=
 =?utf-8?B?Q09OWU56UlVscDRaamh3LzJNRnlkUmJkK3lvSWUzVGJnUWo5NFJqK2JjNjdB?=
 =?utf-8?B?TE53RGo5blFrMVkva25NNjhxS3YrTWFrOHR3andXeW10enBleE1nd01PVGt3?=
 =?utf-8?B?QWpTK29YQ0ZlYm4wcHFxdDBsWWJnZXd1S2UyV1RrdnVGcXhPU3dRdGtLRG85?=
 =?utf-8?B?QlJmSXYvcGZjRzl4MTZBMkVpM3NPdklQM256bXZ2ZUdUc3Vic0FEamRFSzJL?=
 =?utf-8?B?OStKUDI2eFI1RGVUU1ZQYzJWL3kxeFRhN25UakJoQVlyVEgxemF3L0tVaEVO?=
 =?utf-8?B?SFJCUzl6cEgrMzlVVTNBV2VhK1pFUG1SR24vRm4rNGNLN1Jmd2JZZUk5OC90?=
 =?utf-8?B?QnV2OElxcW43YUsrS0lTOU5VamtBMnl3WE1tTGFjSXlIdlVYL210VjVzVXo3?=
 =?utf-8?B?aHZWSFk3a3BIUDMwRVV1bXlxNldlNk5LN1ZWWTgwWXFBaEl4T21OZzBtbGNY?=
 =?utf-8?B?QXBIUU5BL0Vzekx1NExMM25tWGh0VHN4eWl0bzQvRDBQOHR4UGtHbzdxWTRR?=
 =?utf-8?B?WWtJbWhyZlZ2QkNjaWxSSVNpTFV0QllBZWd0Sk1ZMGNjS1VYVWZRS0JlTnVs?=
 =?utf-8?B?T3p0WExUTTRSb01oQWloc2psNlVoeWpUNno4NjlUYnNHZnNWdTNlNHVUOUEx?=
 =?utf-8?B?b0ozMWJZVytEVTV3MU5XUTBaU3hQOUE3WjB1UFVac2Q1TFhwVWtNUWhsbzFq?=
 =?utf-8?B?WHY3UnNLa1JFdVdrL0lJS2NPNTlCZisvSEVMY1hoNmRqSXp3UEZjbmxvVSt6?=
 =?utf-8?B?ZzBuQmtiM3YxeDk4SHk3WmV2eEhxa1AzT1hsTit6K0xBdTZvOXhaWmZPRTZY?=
 =?utf-8?B?K0NUbW16OFBQTDV6UlZRVlo1WnRuTVlxOGV5ZXF1eHZjQjRBTnpmSjMwT1M5?=
 =?utf-8?B?U0Zveno1OTJoRzRZbzhrVGYwUXVNTDlCNUFkL2crcUY3ZjhObGtWMm1RdlhB?=
 =?utf-8?B?L3RRWlJZWmsyZDNwM3paVUxESVBHVDJLNFN1Yjd6TVVuK0JnTS9OWEkrUDFx?=
 =?utf-8?B?NkcwU3hlZnZCYU91dlhtZVZkbGdkK3pMWkVxckx1SmRDL3ZsdGgvaWhOaXNM?=
 =?utf-8?B?M1JYSDVFM1RNMXArWEJRY0I2WXRaNXdNYi8rZDczdE5YQXlWNzlXeW5kQWZi?=
 =?utf-8?B?Mno3N1BIWFpHZ0RNQlRlSWtwbTF0YVBaVG5naUgwb0N0Z0N1ekxSVXBHZWow?=
 =?utf-8?B?N2hYRStPY1kxaWF6MUthTXI5MG5uTldNc2VHbkQ0bWt1WWlGeVdweGhiVjAz?=
 =?utf-8?B?L1VMaExCRndGM1VTM3l3Vm1WS2tFSVlJa0VEbjd5QlQwMlR2U3l5aDRsNTN2?=
 =?utf-8?B?TmxqRXBQdnl5RlpxajZuMmxXQUZ6aVhQMERMbDNrSm11bjlCTnVIcVJjbUp1?=
 =?utf-8?B?OHY5MHBqNEh0Z2U1VGJ1bURyTFdZT2hrN3NGSGExcFVTdCt0U2dpVVNPeUo0?=
 =?utf-8?B?S3JReGR0Q2lwc2lCbnJpRXgwVUpNRWxXSFE0aUNHS0ltZWR1QnZ6WFZmNVFP?=
 =?utf-8?B?Mi9QZ2RFdVZ6TkV0dHllWlhVWUwwK1hkYmh5dVMvbTUyV29wUlRTY1J5S3ZG?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0eb08fb-e893-446d-84aa-08dafa0ae0c1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:49:45.6554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcZezMPEDM+WILIYpCjGXREBEKCA1uAVh2Qn4PBCJe1m+pm/T5yQ+bbDdN4mOvOTmiT6SvAhmGu03baAWNGksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/01/2023 09:13, Heikki Krogerus wrote:
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
>>>>    drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> index 4bc31ed8e5bc..d6114fb8d5a9 100644
>>>> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
>>>> @@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>>>>    	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
>>>>    	/* Only fail FW flashing when FW build information is not provided */
>>>> -	status = device_property_read_u16(dev, "ccgx,firmware-build",
>>>> +	status = device_property_read_u16(dev, "cypress,firmware-build",
>>>>    					  &uc->fw_build);
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


I will resend the series now, but we can wait on Sanket's response on 
whether we pick this one up or drop it. If the rest are OK, I would like 
to get them in queued for v6.3.

Thanks
Jon

-- 
nvpublic
