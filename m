Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62517CA0FE4
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 16:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbjIAQeQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 12:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbjIAQeP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 12:34:15 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799A510EC;
        Fri,  1 Sep 2023 09:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYh8fo6twCvtFxd70FKhVRRR5bCCHY4lkNQdogXLqKLZ9jKC12W2w7GHYa7xExv1EW5cwAyk2ImQVm/MUnDkz5Md099vF/hkLVy47ZUJjoz1LZcJFdARtlSn23DwG67FcldM2Gf5g6KcM7hS+hK48l2HTu7022fLtmYzSdiVUlVLxkxEQaw41frz25DrM0T9b1oh9ZEViRD+Lg9i2YQ4lvgpRMo0nlXetacLrZDAK9TG0RUU5O0UzmFq7WtS7xEsQlliPJnyJckDG6jTaCsz7IjnpgeBE31B0mR0ndn56T3a582oCtT7BK5mvVdDjgwH/K+OnmHpkWlZgcC+FkWKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvK/3t5oCQAkVAByOTpI+mwVj0gsoaNAtES+gYCMx7c=;
 b=OIi6hJz6YAfWzsVr1joBfDDg5sIrSCyFqF3q+/hMWdNTyYA1d2C2oPBZ36AtV80Kp8TPRr14+DZhwEA3aLmWpvvW87iPIG/DE9elINJHoYTAOqrPqf9FKEugaiZmD7XEoJ1X+i4vjE4Z07X9zfRmh3jxu0PkpC3AmSITYuzUUebueEvWOQkXTau/e725KnfPTbslvC/n3L+jT5k/UBUV7ZvtFbuwC3U43T3FAXV8sJIzZEh7gxSYdJUetPYci/15oKcoCv42V3TKtqbGGgUfBmT4SNon6wfdzrdHdpvJgXhctzjpCgx2EW48pK3Sfw/iZSHP40SpEZ1xVNYgKb4lOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvK/3t5oCQAkVAByOTpI+mwVj0gsoaNAtES+gYCMx7c=;
 b=kh0i3WwWy8ByzeoE5PI6oXUGJ97a+NjgP4rLyD+TWAwq4GuXnp4Lp9hxyWiT1UhzIDyra4HIYbAOAcnhE961ZzyUHDhd5t+9xk677MXoxGTHV4wr1xF8hmfHuz1NzFAWdWRI5WOe8e8ypqbP/L4IMo8X5knzsdUeYLnziepeP02RderUqvLJzsegW6hB/SCVp+uK+uSH3n09RVIddkkDlNQUhHXA1eS2Dt/PKHY5DpvP/olRZStd9l8RAiHFU90LHl6HHaTUzQIoAMKoyqel1h43etMwvOxAK6aboKggq/U7KQw+V4o1egJOn/h7K2Ah0SlcJPTRaWH0Mwh8nw482g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 16:34:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::1d1b:2ca4:1600:a865%4]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 16:34:08 +0000
Message-ID: <00faf6d0-e84b-20f6-1c8b-8e0e8d610f16@nvidia.com>
Date:   Fri, 1 Sep 2023 17:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
 <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0d1ad3-5db3-40bc-0abb-08dbab094393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUIPRKQDwbkd9WAnfIlnoSdlUpNK2al51FLDOmiJ6DF5p2Q4hbvuG2PhcPWYOtH8bvsApZjozvBmTO8Hzfb6wxzxA4OEWWR7DYyCGqgrjvjQg20sIuFIqBGtiN5fK8F0YOpZGTMbUpVwAM04Y6qBWc/8xVvxC5FULIbAzgtTxO0ZCu1U+NU/3gyvbvRpTuftHuUhV3QH4p9VSmfwwl3xaJ/hRhqJXfInPV5FjCZJfwfyIhSURU6eUY2AV4R7GvjbMJK82PXFGP30jj4k3BtG4Nh5mIPecpKmBU/u/zJ3TA3sSXyhqfhJFXqWHawr7hK2JQJ4tTZe/1a9M1uTWSUhy0hXDP4OLwSQP/ZqEp+RufDoqKttY82lqahCo0dfXUFXcU2GbuQg7hSu66M9oHPHQ15xKUqUUxvfchAYoHXGiXQi2qQtd1z0ZzDmAXgj2M5fXpuMuyLban9g4OW+T4GRyxYVE6SH35X2pbg0rDCczkSRBdd4Rq+46DKb0NVbhGPiWlkjs8qeY5ZHeGkk44Wew4aD9KpTLeD7bJ3XJjrwCFMGT1thRI3JFR/HE8bb5MtbQtwgUogVrioQMDgvdI+4171j3CRYybTD6Ow+Pjn1qCbwJjxXVNiQN2YVOVDnagmsWTDtBeD99ekq+XiXdg1pZmzf4+AFQDl0J3eIO2rzg8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(1800799009)(451199024)(186009)(31686004)(2906002)(7416002)(316002)(4326008)(66556008)(36756003)(66946007)(5660300002)(8676002)(8936002)(66476007)(41300700001)(6666004)(110136005)(38100700002)(31696002)(53546011)(6486002)(6512007)(107886003)(2616005)(55236004)(86362001)(921005)(83380400001)(26005)(478600001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWY2MVB6U0R3aktXT0tieS9iTWVwZ1B3NU9Ub1AzQ0ljSmljY0JLbncyc1Vi?=
 =?utf-8?B?a0V3R2FtY3NhUTRBK0F3cHpnclhVckFGWEE0MW44ck5ZcTFtejdRUnNncGNB?=
 =?utf-8?B?WUhUb3JjVFJ4NEtUVTJvelluM1Mvc05ZVGFmV1NJOEx4b0hpc0p2WUZ3b1lI?=
 =?utf-8?B?d1V0NjdKc01XMFV2ekdQK2RraWw3QVdMTlVERzhjZXZHci9kVE5ja0JFaW9z?=
 =?utf-8?B?YittODl4bkJPVHJLZEtZWkNQMXlUMTlUMjNTQVcwVzMzQm5DTHE5endhaVJU?=
 =?utf-8?B?MTg0elVrVTA4aEMyeE9KeFdaMGN4cGNOMzRDSS9ma0F5L2o5cmo3bEV3S0w5?=
 =?utf-8?B?OXVUQUcwNHMwelR4cmw2Qno4Y2d1Ti9Nem9xdEtYS1Rjbi9qZU1ndllyS0s0?=
 =?utf-8?B?eXgxc3N0dHNWcU5YSGZWU0pzd0ZoNzAxL0tyYkF0Z3JTYTk2SkhmTHl5S29R?=
 =?utf-8?B?M0VNTTlwUjBDM0srQVRvWEYwNzhyS2pYS09reEEvWlN6cWxaemYyallyZnVr?=
 =?utf-8?B?czY3NHJNWXNRZHhUSk00ajRFOFRScFBVUHNtTzd2d0lsWGpLY0pXclZiaU9K?=
 =?utf-8?B?bkJGTnpTYnNYYXVyT29LWTZENjdtK0xKUXV3RGlYZm13U0RqSUVjbTRBV3g0?=
 =?utf-8?B?SVYyY2lraFROMUZHb3REVklXUUJhYmNqYVRSL2luUHkvOXFsS1ZZSGx2TXp0?=
 =?utf-8?B?bEd6Mm5QOS90ZEpucTRxRFhSWnBweVNLTnhJRXlwZ3BJWGJoTVBmRkpWcGI4?=
 =?utf-8?B?elBCZ0IraWhBUHM4Q05VVW5qcUJNYjUrRDI3NDZqUUMyZXoycEVhMktjM1d4?=
 =?utf-8?B?R0JiVEVNZUVJV1NzZjNncW1IUFNqQUtKK0p0bzVwNFBJWjFHQTMvRG5BN0VK?=
 =?utf-8?B?Wlh6T2MrRm1MYU9rUVdnMFZJeU9VcjB6cEUrOFhtaE9yclhObDVaSTlNcVlM?=
 =?utf-8?B?UFY5SVVZT0VtS0xIallyVVhTdWY4UGc0QThQbGtEbkdFUHVYQm80NkVwblhE?=
 =?utf-8?B?WERKS3VIOS80ZHRBTTVQb09BM2swcTB1N0k5cGFhakVYZFNpV1ljY0tHYU1L?=
 =?utf-8?B?QlRYWkZXTWkyZk5jclNKTWt1L1BNOTB1VU5RdDJESHJ1TmpVQlZ0RG5jNFo3?=
 =?utf-8?B?a2RZeXo0T2J1VHpINWg0cmFNak9CMXRDTkpoTHFQT3B4VngxbGhuWjNFRGRX?=
 =?utf-8?B?MjFQVjVLVWtWcFd4TDZYRW1HaEE0ZVEyalhOTWZXVGw0Y2hNeWtGaVpCa3Fl?=
 =?utf-8?B?VHJmV2ZwUkMvYlhxaUkxN1AraDZGaXVMR1pEN25xNXlFczhiS3RrNlBrYk9j?=
 =?utf-8?B?T3BVOGZPdTJ5SGJxcGczMTF2QkN6L001UXpDWGZ4N0J2dldxM2V0OW1pUTg3?=
 =?utf-8?B?R3B5NlQ4UTcxZnpXT0s1NkZwMTFPWUpxZGM5WEpMMG5RMUltdnFoTzhuWGp5?=
 =?utf-8?B?KzEzTUs1L2FlUVI3dzJvRUhjQTV6cS92OTJ5MXVxZkgzdVVKSktSODNXUDRY?=
 =?utf-8?B?dVdHSHdpcmhyZlpzem9Bc1FIRENTeUdJR1FneXc4Ykg0M0UyalhXK1Q0VzNv?=
 =?utf-8?B?M09DZEl2Wmp1ZHNvRnVONlQ0V2NsOUtEdTVVVUJ6V2FvdGxZU2VtYi9ndG1n?=
 =?utf-8?B?bzZEM0RhWTZSVHVzenpzak9rZWxZekRrRDMvRytRaEpVaktvNC9tYXNHcm9Y?=
 =?utf-8?B?ME95aWMyZEZBS24yQklUOEZoMXh1dzM4WU5qU1gxZUJwUCtsTW5wbHlhL2Y0?=
 =?utf-8?B?VWMwMWhEb2JIbFJVKzZhMDMrN3YvUEhnRE9KbWl1T2liWTlFNWxJQnFHSFU4?=
 =?utf-8?B?eFpjb3o3R3VNWE51dEZKb2lHcnkrakF1Z3lOYW9zOEd3WllYaThmOWZJbk1T?=
 =?utf-8?B?Y0xZaWlIQ0RmTEo0M0xrc1JKYUYyWkMvZWpwbUtCVTYxcDN5R0xqN0xZeHRj?=
 =?utf-8?B?ZnlFR0ZwVkp3ZmY3Q2djaHZubkltWC9kNXpKOEU5TUNtQytWblczaHVrTlVo?=
 =?utf-8?B?TDJMUHJzM01meUtaUy9UWlpPNXRyak1qSFRVSmcvZVR2VkZMYzdpM01Yaisv?=
 =?utf-8?B?SE5iM3NGbGRKT1B4REczZ05NaTZ1YVlBNDNLTy9ISEpKRW9rVFFOajFGV0s2?=
 =?utf-8?Q?8j1MVifhatBOP/68rgTIG7+dz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0d1ad3-5db3-40bc-0abb-08dbab094393
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 16:34:08.1954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4Rqn726GbzUqoYQKUtBc6IeYrqf0edeYpOU1GJy6UkaGa8an8yCHhqSR+HUCpJTpU3yqzl2n7aeZeC7tjeifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/08/2023 09:53, Krzysztof Kozlowski wrote:
> On 25/08/2023 18:42, Ninad Malwade wrote:
>> Convert the TI INA3221 bindings from the free-form text format to
>> json-schema.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>

...

>> +            compatible = "ti,ina3221";
>> +            reg = <0x40>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            input@0 {
>> +                reg = <0x0>;
>> +                status = "disabled";
> 
> Why is this node present? Binding said nodes are optional, so I assume
> it can be just skipped. If all children must be there, then you should
> actually require them in the binding (and mention it briefly in commit msg).


I have taken a look at this and if the 'input@0' is omitted above the 
driver still enables it. It only disables it or marks as disconnected if 
the node is present but no enabled. So we can mark these as required.

Is there a better way to mark them as required apart from listing all 
input channels under required?

Jon

-- 
nvpublic
