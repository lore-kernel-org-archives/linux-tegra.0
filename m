Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B9FC83F2C
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 16:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353848AbjIEQd6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354531AbjIEMVs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 08:21:48 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738561A8;
        Tue,  5 Sep 2023 05:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F33mDBmxG76z2J37NN77eh+0Y7ZHWF5EcTPhsLJle9Ub32Gw55IdnBzC+nyAY7RbGqBhup9zlvYDJPfDZkdJXBBXlX1/Evg3mYJL6AGJynZPrQ446cPHpnufOOkef6Fzy80LfynEVYGjL2mrwD81CqVQjLurcw+JBRQ0sblzjm1Rl6worgf/cgQnV9/av36YIuHsVkvLuIBTlB7YeYXj+xhtLXs7pNqNmLxr07+zxyyeujIeLdqoq3AL+wQDf2NZVDneIie1LuVmg/okO+QlPYrl1PfTolGf3o4MHRVilLXOdbptMEri9v/GdOz3DrVmf0zDnbLL0lo4W4tylicu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsENG1o+fhOjfq+5Qo8+9Zn64RSORuO0XroinhaIGDI=;
 b=Yrd+o+rjKL8OSeh2UIvZRsdy5+I1lE2kOQGsvRTj7S3BIPZ4sQq8UYmhGX6Gy7bldiuUWUOmuhmTE+oMHUE168MsnebCcLKDPR/ogiBSorI1WFjHPFRcXLBeNIDsc0oUAyNLGEG5QoJPWdgwDN0A/nMPS56YyXnSywFMAZR2jqAEYbyABx0j9QjlXOyX3S4sjkhnKuVmXXzZFQRx0XgM2JqeK4b5e660C2VcZGU7umURb5MyiGavgOMQR6EOwnTekFnLi6epDMTDNn6n0Uhd6kOFcSMP2z8+EN2pqe6RtevBMQpTd9fqxwiLneMBtuFvH/aRDY5O1qS59A0ehVK+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsENG1o+fhOjfq+5Qo8+9Zn64RSORuO0XroinhaIGDI=;
 b=HuHhSxUjQ5PA0LDcFv/dmEk/bkmLjz92f1St6C71ui7epdNcBoFmB30E5abJ7K4me+CvGGMrgXHCqSr0cs2A5INiF+1dBKi8qRI7ab7sIQ+pMntZtBGdlUDslMIIDICcUXx9Vd8e9poE/a3kIEaunJpmTQqawWz7CdnyMh6d36lkEZEezzV9TNCBAd9qRLMYo6KzIcE88hEwhGX19oyADQRik/5teZDgxpqPDKI3+Nzj9fqJakKzANnxmFlDyazKZZL7s5cnVCB+0bQrye2qSyoOA/ILxZAfp4ERPnGYzaMzyi4BpwnqvjsUshGTWmbDzxLRCa6hP626UTHptyurew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Tue, 5 Sep 2023 12:21:39 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 12:21:39 +0000
Message-ID: <056cbb5d-c7f5-a163-8903-3da81a573e1b@nvidia.com>
Date:   Tue, 5 Sep 2023 13:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
 <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
 <00faf6d0-e84b-20f6-1c8b-8e0e8d610f16@nvidia.com>
 <20f55b16-f4df-4bdf-ba60-0c6c64efadee@roeck-us.net>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20f55b16-f4df-4bdf-ba60-0c6c64efadee@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4076:EE_
X-MS-Office365-Filtering-Correlation-Id: 56bf0382-277c-4eb0-0410-08dbae0aa804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKQvEu9vWejphcenw4uOItRaKJy5bIZTRmYYj/aejJNqAXXBAy2wPTM57pbeHaB9ou8cribCTyW9XI8cW8k61OjhvKEJ88GM0+JtDkH7BhT0XDJ1pmFzmd7IDQGPSo/i23hwwJaFqtheExZqJ1ZBmrZxtL5ozlTcXAPihCz7yMrquyTA6LIXBnmHmANygqFePQSuICTFSUgYSZvBY4Cpbbc7A/1xdWGraCCcRiN6TP1miNuaN+CD4MnlQftCtIarX2QMyOA7cvHgwoXV0Cdu7l66hz9DK3BH3ETorEk1PMhUWq/sd6cFNqO8cRVhLQo+42ktO4msuCTbGGTnuya7LoB2/aUXtb8cchKWOaLy4xwJJXSkD5n41Wx0eu0J0gH93vg4h93t4dOwtiAAN+1D/x1CUnSoebty8E8OKPe6sZ0QlbCX18hIvHYR7qCpxQpVYpiGQLbu25hhXbEJ9rcna6KGG8ps0A3MHA+koL8XKxsrM4Lrem4NllbV9LtDudndG2KsfsWHPFMKrjyqggBCdxAKaATlLRcpMkoxrsl5gKTRSnq6WHv+IKdGNyWLlfeyyEpxMTn1dTAZddhUg+Z6FTFd+4vDeQAYZQ/+DB7uWOQrHIG7j75csV2Iaw032EH8tZtDevzSb+4Rpb8JaTGFCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(366004)(39860400002)(1800799009)(186009)(451199024)(26005)(5660300002)(2616005)(107886003)(8676002)(4326008)(8936002)(7416002)(2906002)(31696002)(83380400001)(86362001)(38100700002)(36756003)(6506007)(6486002)(55236004)(53546011)(6666004)(6916009)(66946007)(66556008)(54906003)(66476007)(478600001)(31686004)(6512007)(41300700001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGs5U0ZSNXdrK2JORUVIdXNSbnhWMHhscnZ3b3puQ0RDamFOVzFtU1dSRmNX?=
 =?utf-8?B?U0xwWlhXUVBQc1RHTHc0cWZHTDhXQXFUV0FQdDYycmlrWEt0Q2xNay9aQ3ov?=
 =?utf-8?B?c3VKU1ZreFpUUFkvRGtGbERjTDI0WHZVUUozUllOSThSZVZCRE53VnVRZCts?=
 =?utf-8?B?SlZzcHdSK0ZJWTFiOGp6RXpYaWdTT3RoK0JORkhqNjExL2hUOU1YUkJEUWhP?=
 =?utf-8?B?U2JXdE50S09PRk51K0c5Mzc3WmtQSUljSDJxVmJmUXJMMDhuTW1PQXlyU3U2?=
 =?utf-8?B?NzlGY3ZnVnl4ZW5lREZkdVZLaEtMamNndzBWQy9xRjV4UXdWeVBXbFNCd05F?=
 =?utf-8?B?dnlXU1hWejhpUWlBWkk4NFlRdStZNnRrNjJjRXplR0J2d2R3VmtqNGFUbWNr?=
 =?utf-8?B?M2FrWDhDeFh6NG9CUE0wa3BGOEtqOWlSMzdGSkcrS0lMNkMyUWU4aFVDT3RP?=
 =?utf-8?B?Nk94UGdvaXZFM3NUOStZTUVhYjRsV3M3TFNSOU54cTJEZUdPOVVwSmVpWUR6?=
 =?utf-8?B?N1UzYmdSR2MzZEV1aVFCTzU5WjhETHV4QzZRb2s1V0FzL2g5cTRwU2ZDYk42?=
 =?utf-8?B?eHdHQml2TTMrUGdpRkdWMm9YZkQwR1JrZW5vc3lDemU2TFhLTDRLM3IzbGZR?=
 =?utf-8?B?RTg1VGVyMnpQdTZmc240a0pYZ1FYeFBqRUJRS0xWUDlwcXhaYkR1TkV4TTZX?=
 =?utf-8?B?VDZvZEN5N2VSZTZhRVF0Z1MzQXd3T3NhQTNVQUNvcUJnR2I5aFVyRE9sM3F6?=
 =?utf-8?B?MnBPbEU0VXZqcytEYXdOMTJFYlptWHdpNmxwS2lvdVlNa0dob0NNYzBHQ3VX?=
 =?utf-8?B?Tjc2UXhYSzhNN0NuTHRTWWp4MW4vWi8rSEI2bktDV0pXalNUR1Vwd2Q0SDBH?=
 =?utf-8?B?SzRSWlkxZi9Pb3pDVVJuKzFzeFQ0alhjUVFvbVRhcTlYcXBqS3R3bmRPSmwx?=
 =?utf-8?B?VDFZMlNnWlBmNlUwaklHclA0VXJaR3VrTS9pQlpPZ1dkRFNibTJWWk5uSEkv?=
 =?utf-8?B?TDU1LzZlL252L1VvNFRUbGdZbHZZUTZuRGRtQ0YrenVUS1p4M3JMSS9jcmZL?=
 =?utf-8?B?RVFtc1NIUncxQjhYTWd1NVFwUkVsZ0EyUXY1QUR2WGtpZzUrVFRJYk5UNFhn?=
 =?utf-8?B?bVgveVljKytnNEJaYVNBVDd4UUNEM2t3TWg0Qlh0Y3RFNU5xemFyVldHaVVw?=
 =?utf-8?B?VGxPT1NLSWd5ZzYxa2xhQkhvTG5RUkNpN1h6K1RLeGw1cXp6b1pnWUFGeWhj?=
 =?utf-8?B?K09FUUpzWWFZVERVT2ptRWtHTVFyVm5vWEVnL205QVNucUxWNEszSCt2aUdI?=
 =?utf-8?B?eTZGVWdmL2NUb2EzVWFSSnI0WExBVkV6VGE2V1puY1pCeGc0QmNVYVpqNEVP?=
 =?utf-8?B?cG1XU1VucmhiVWlCSnU3NGhWN0l2ZnZQSHJtVVV0WkhiZEtPQUtYbHROTmth?=
 =?utf-8?B?MHIzZEtzWWhSaDA0U2dhYlkwVnN0MTl2RHFZYnJhR0lyRHZSQTFDVXVyNXpz?=
 =?utf-8?B?WXVXTWhCVE16SGdFRzY2Y01qRmJvZ3krRlJIWXVQVG4rU2dQQ1JXbWVJT1Vq?=
 =?utf-8?B?R3dhTmg5ZUNjdGJwN2Rkdm9EL1lpanRFbGpKOWErMWtlVGlkaUtyY3hDbG5w?=
 =?utf-8?B?dmhZcHFWbjVPUERSRkkvUzMzMkF6bjdaUjMwQkZhM0VIR0h1MjBZRzlJTTdm?=
 =?utf-8?B?ZVQ5SUYxSFZIVndaWG54T1Y2cnlZUnBRbzAzTW1IdU8zUVF2NUtWRlNReDdo?=
 =?utf-8?B?eGxKOFFpbTltZUs5SVE1cWRCSUtsQk9HLzZzVWk3RTVtZmZ2RzVLai90c2dz?=
 =?utf-8?B?YWlFL25IblYxbWQzSTZTT2dqUVorMGdwWUowYjg3U2JCUzJoWFA0eFdQNjBy?=
 =?utf-8?B?cDdVU2ViNDlST2U4Rm8vSlJqTlNtalB5SHBFSGRocmY2eUI3R0NTNHpHc0F2?=
 =?utf-8?B?YkF6QVFhek4vWXpaL1d3L0doQVdIOUoxazRsbTBuQXdiYTBiblNvcXEvTjFv?=
 =?utf-8?B?N3ZxNVJzRWpXR0FZcU1XM3pFZ2ZERVAyM0VUYWdkWm1xV0NmU2hrckN5ZHR2?=
 =?utf-8?B?NkJzZ21IaDVjS1VOMTV1M3ZsMG9OTFJuTGt3am5WY1htQUt6ZjVENTJTQ2pt?=
 =?utf-8?Q?Kd47he/wJZIcg2VvYOEO8huJm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bf0382-277c-4eb0-0410-08dbae0aa804
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 12:21:39.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZvoSHVx8/5ePWZkwhJSk0NmwpUbukUbBvwKPoGguR2E26EVfzBE8+m2GeIqP20QDdoUAwrlergJcP2IvyVD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/09/2023 17:44, Guenter Roeck wrote:
> On Fri, Sep 01, 2023 at 05:34:00PM +0100, Jon Hunter wrote:
>>
>> On 26/08/2023 09:53, Krzysztof Kozlowski wrote:
>>> On 25/08/2023 18:42, Ninad Malwade wrote:
>>>> Convert the TI INA3221 bindings from the free-form text format to
>>>> json-schema.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
>>
>> ...
>>
>>>> +            compatible = "ti,ina3221";
>>>> +            reg = <0x40>;
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            input@0 {
>>>> +                reg = <0x0>;
>>>> +                status = "disabled";
>>>
>>> Why is this node present? Binding said nodes are optional, so I assume
>>> it can be just skipped. If all children must be there, then you should
>>> actually require them in the binding (and mention it briefly in commit msg).
>>
>>
>> I have taken a look at this and if the 'input@0' is omitted above the driver
>> still enables it. It only disables it or marks as disconnected if the node
>> is present but no enabled. So we can mark these as required.
>>
>> Is there a better way to mark them as required apart from listing all input
>> channels under required?
>>
> 
> Channels should by default be enabled because they are enabled by default
> in the chip. Requiring that all nodes be listed in devicetree just to
> select the default behavior would be overkill.
> 
> Jusat because the chip has the ability to disable channels, that should
> really not be made the default.


Yes and that is fine. What we are trying to sort out here is what should 
the example contain in the dt-binding doc? The original example from the 
text binding doc was replicated to the yaml version and based upon the 
above that seems like a valid example.

What I could do is add an extra comment under the 'input' property that 
"Input channels default to enabled in the chip. Unless channels are 
explicitly disabled in device-tree, input channels will be enabled".

Jon

-- 
nvpublic
