Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B068EC677F1
	for <linux-tegra@archiver.kernel.org>; Mon,  9 Jan 2023 17:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237187AbjAIRDU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 Jan 2023 12:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbjAIRCd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Jan 2023 12:02:33 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0490E40C27;
        Mon,  9 Jan 2023 09:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFE4o9rZ2uHCLfz2bBfonoTt5bvqobqYYWbbPPUhANkcY0pguL82rVhD2bqXK6OaGiW/YOtbwRjeG2pqQhbTso3UN87O4Rw+FaBChw4KnPAPrGkmEthI1/YWj0wzMHaZ4QF9WSSbH6HwNclQrvt3JcQ1qUP5x9C3TsapVFtdis6OmZKozVcUicN2C6USA06ZxsbyTFnWkIBgv/fIwBHefILXV7SHF4QTRke/6EXeBsKDFS1Gwne7kJ21NZFsS1g0D+2ikcS+xNyECtPbxZFwycM+nvSpnELilUOZGyaQuPV6nLpa23yMBaR+Rss8Uygx73fjPxcp38Cc95wP9SCqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlW8r/IUYmAbC2piSBlBxlvN7SX3+Tqcjlw0PULjrJY=;
 b=kJHIf6tf++EGoVojw52C+LzfqWnKTP1pvR4jYVtMUEs6II0LLSjTa/iG+wnjY5JeuzXbEJrNNRHnpaCPayE5k0+U05/kvviWgrK2uUwBLV02POsNWFMDEwVJ+m7pzc5DfTCbY7XMcjBiXbe1Kzq34IXTFx+lwX0kv41i/CVGVIg2iwUIqZmDvv5DQRhS69SJBl8Rrqg8QCnsIY/VgTt6gCLlQBIbLyOgw54Qv2fgW7sRem9orJYp3jLZzYA3aeALdppQ/6/LF5C13VgQWnjS1zBi7gvJMR2AvqgaAPY9FJ4IxRU5HMW/tnjs9xiG35B73k1JkEntNOsczhOXkvdE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlW8r/IUYmAbC2piSBlBxlvN7SX3+Tqcjlw0PULjrJY=;
 b=TMYEoW9r9lpx52GFcmpr8dRkTlWac6ch1+tp8Y2ePu1BGRcjXC7Tz/TJg4zy0pLXQonN/KpwThCOz5szZ2Rw6j+m+2QK2Oj7JTNvemOiU58luYPxW6/+ZEzvvdhgxh8jx+MziBa9jrh6rHMjTB2WZay5Uem6CVfE8q8Pl3C137cvwNRmCYMb3dQHnzpyAmELnSnBsfege69DPug1uR5p5ZXmsdjx3yFsdzt2H5MMETIgpXMtP4mYmTdSA5vBhzH1X7OS3/fRyCoF1mse5i7ccR3aQVQCSMwb/V/vGDmyQPqdCSdWjWMSE6cOo9qhAfo/OvUWV2XisZpst49hersPEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 17:02:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:02:21 +0000
Message-ID: <73bfb6ca-663e-b73c-b9a1-4727ae7217d1@nvidia.com>
Date:   Mon, 9 Jan 2023 17:00:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V5 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com, Thierry Reding <treding@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-2-jonathanh@nvidia.com>
 <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <b1485d8a-71ea-7b75-74ab-77eef595ae10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 4252db13-11ea-49e1-eb1f-08daf263459f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AmWmv9SiZ1No6RpsxiV9Vf97Cb3VY6e8gbxwZE/vKHEtouDsukiMeC+j8bQk7RKfkhcs9CQVPo4aGXf72r1jrItKWKYncE/XiRWrwnurKS6TV/0r5weHcl36ErFtA5NRrZD1eB/vCoQ2+Bx8h1XU4ArkpbgP/HRT0UyrlAeGAi2cshoNjPVrF4WMcPFub+W+J1HbzHEw31WqPpMY8uuXNOa7FIgNLQWGpIYBOhSdnbvICXRQahOoS/0i6W6bFr+fQ9XaCFQrv8N9sCjz1vtXM6YRnYvebEcDWNbeQ2MwI6/JrLQ5jglVtfKf0n//t7eRz1vpEfGGbJAFmK4Xnkgziir7GsnsFK2ILokoO/r426avx50thnpAODtWgLBmWz6rYC0AVSft+0dfttpNa4gOzcx7VanRQUq4OktdShge44s8E5J1MrX4GVXdJzM6XRoKPqGNfNyTyVESMfJeJr4t7ZYUYM95KpUhnxRemrMl60ev4PgH5fRQcBnDy155yzwjYWWmlNAqmAf0CHXr1otRpe2j3XVJCw5sLgSaddNVxU9WwOSiJPZdeDFoZAjzhTpu6kCGkRQQ7TkCO30MZ1jru+c1Xn/SV8HFnKAVhRaC206SdcfWv1y321TKU/OB9kNL7+rolaRe0VKXX0KagVCu4EN7yvdXgjl/FO5EUe/iP9h663ZH/eRGzXptwlnMyobelLGXBk4GOmT/I6w2zA+Mk8QmwwJVHZRp3txP2Kd8O4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(55236004)(31686004)(53546011)(107886003)(6666004)(2906002)(478600001)(6486002)(2616005)(26005)(6512007)(186003)(5660300002)(316002)(7416002)(83380400001)(8936002)(36756003)(86362001)(41300700001)(31696002)(8676002)(110136005)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZ6TWN4WmtoZkhUU1ljWjNVRVRGUlpIY1Z1bmJpU3p1MGZOdTJjd29ESSty?=
 =?utf-8?B?VnI5OTY1dkF5NFlJeGljckRsaVBYU3NyeCtDOHNpQVF6TEtDa3ExMWFKQ3d0?=
 =?utf-8?B?MWZLZGZIYVVuMmVmWTBJTHNDUXZscXFOSGF4VTJnVDZ2UEcvL3g0WXdVQmdY?=
 =?utf-8?B?VVhvU2NBVlhjSDRlMEJ3NmR6WlR2dGVZN0VodEZVdzFhY2RGWWQ4NGdiWExx?=
 =?utf-8?B?emUveGJmZldoVVAyaldqdDVaSnlGV3ZJSkpnQ0I5SzkyY2RDNDg0THVmaWpo?=
 =?utf-8?B?d3NZSU9QRWZRemREWXZkMFo4cnBhZEVhalU3a0pUSHAvbU0rOFFUS3EvZU56?=
 =?utf-8?B?UElzeS9JMnlONjJUaTdWK3BlbHNWdFNWaDJENytIQ1VLN0M1QmFFNDlScWR2?=
 =?utf-8?B?Y2VwTnllMlFIdFdveGQvVVZzMjJkUlVWOHRWYy9NZm4yY0dKSlQyZm8wUFNo?=
 =?utf-8?B?cExKNDlIdzRHUTlBWW0zVXZZOWNLVS9KV3RpbDdtaFVIZ2ovSzEzLzZVdnJ5?=
 =?utf-8?B?U0dxTnVVbDdpU0NXam5qOXhHMlg2a2twK2pOdG5pYTdsY1QzbmtscUFrVzdk?=
 =?utf-8?B?MGE4SE14NHBGdTVVMXFEM05GVm8vZnAzR1U5Wnk2dFFudjQzOVhLTS9VVnox?=
 =?utf-8?B?YVJHWkkrYWlKSHRGNHpzTzRGN1hEMXdFcTNnckorVjZwa1Q1TVZCbmxxQkIw?=
 =?utf-8?B?WC9FSy9PNHQ4T3hrWDEvSkUzUVBzblR2T1hxSHMwYnBUWWljdkxCQkdRVExT?=
 =?utf-8?B?ZkxyaGIwZ1lHQkQ2UHF5YW9XWmJSQXdtMm9vdlZ4MlZwdjRpeGQzeTIvb0NS?=
 =?utf-8?B?Sks5L1UzeXUxTVhCTmJWMzlmcXdsM0dxNnNuNzZycEQ2SnlOQnlGcm1SM0Y1?=
 =?utf-8?B?c1ZCN0hZa2ZQdU8zWVIvR1hxVVZ4eCtKaW9sSnFQOERINmIzNDdyd2VzRXRp?=
 =?utf-8?B?U3J5UWg4WTZuR0hzeGZzNGNpUTY4a1l1RldyVVVEYXFDN2hKYUZyWFhWcDRK?=
 =?utf-8?B?M3NENzZYdHRWOFpQSjJnV21kK25naEkrZCtjT0JPZnZsM1g0ZUN4ZjdtaW9n?=
 =?utf-8?B?OXdCbWVTWitaaWlhZHFaMUVyUThoK0lUZmg0aVd5YVprMGR6RmplSFdiQXQr?=
 =?utf-8?B?end1Vm9Kc2VzRXBCeDNzNDR5MnV5bW5tNjFRQkFrR3lQZzRxRFY5SDhoTlBR?=
 =?utf-8?B?a1VwTWFoUzBwZ0l2RHJldUNYWWdZUGNvVWt6NWxFeENoWDNhRWFNM3U1RjNa?=
 =?utf-8?B?TXR1aGFOejMrZmU4R3NlVGhna2ZEbW5PWHJIWlFYZjJnZUhVR0JjK2JkdXBp?=
 =?utf-8?B?WFc0c0xZSDBqMlBHaWp6VXBwVjVHYnVudkFOYzF0K1dURmNGL3FzUzJDc3Na?=
 =?utf-8?B?M3RyRCtRWERqRVBvM3ZjdXFhTHNqbmZEMnVDNGhiWnBOQzdzcUoxYnJBTnZi?=
 =?utf-8?B?a0dwTEVuYjlIOXdCNE9WaEdTckFkMzVtUVpnN2ZreEVFeG5TYk9WYkJrTWxx?=
 =?utf-8?B?T0IySzF1TUNqOTlZbis5MVgwSFVLSFdpT1ZQTDdoRnZhUjFsVE5GaHFkMXZP?=
 =?utf-8?B?dWJjU1FBdmpuTTNGeHdLVW4vYUw2Z2NFTVNZcTR0R2pxNmI1Wjl6cjFvZ2M2?=
 =?utf-8?B?V3Frd05idGx2OU4xRzJKQ2xGamFQVGI4RDA0dnNseEwxdDIzSDJhWFkzV083?=
 =?utf-8?B?VW9RczlNVkRsTjRyNEF0cHF5WUE2Wkxsd3FJY2p6bjNYS1BLSG5CaGd5aU96?=
 =?utf-8?B?bXFjZEtrWmtiMVhDTC9zRUJYS05qWk5QaFVPdGx0VWhPY2FSbmo2YlNHQ1hh?=
 =?utf-8?B?dGRNZDhMbnZwVFp4Qk1ORjdIeE51d3AwZXp6UzBzZ29vKzQwN0p6VU5oakVh?=
 =?utf-8?B?T1lVc29DdjNxSXUrUnJqSUNmNTYxNEVLQ2FMZEhqb0RJN3JxQ1VjSmZTVW5F?=
 =?utf-8?B?KzNzbzhlRHMrTHFCZXNMa3MvR1pwanR3dlpLekpnVHVBc01VL0VpOGN5Z3l4?=
 =?utf-8?B?aUhrNloyQXpJMHZxNVg2TEJMbXBJWFg3amhxblV4bUVTQXV4dWZVS21oWHB4?=
 =?utf-8?B?b2xveFM4dmNiM0NDTGpxdWdLRlgxUTFUaWJxSlhFRVRtOXVpUkt0c29hNXh0?=
 =?utf-8?B?TitOTTdLVFhPZE84Z0xjZkRCdHNzb3grRXZ6NzJUa1plNDkrZGs3RjliWWlW?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4252db13-11ea-49e1-eb1f-08daf263459f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 17:02:21.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dY5Cao/RkS8eZa0zFDTcr4WB18zB5nvekFXDvkVvNFwxWnNX5YcOtWSntpYHcT3+tehy0l4MhAaAohEa76msnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 08/01/2023 15:21, Krzysztof Kozlowski wrote:

...

> On 06/01/2023 16:28, Jon Hunter wrote:
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 8
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 8
>> +    items:
>> +      enum:
>> +        - usb2-0
>> +        - usb2-1
>> +        - usb2-2
>> +        - usb2-3
>> +        - usb3-0
>> +        - usb3-1
>> +        - usb3-2
>> +        - usb3-3
> 
> Why do you have so many optional phys? In what case you would put there
> usb2-0 and usb3-3 together? Or even 8 phys at the same time? IOW, what
> are the differences between them and why one controller would be
> connected once to usb3-2 and once to usb3-3 phy? And once to both?


Here is the description from the device documentation ...

"The NVIDIA Orin series System-on-Chip (SoC) has one xHCI host 
controller and one USB 3.2 Gen1 x1 device controller. The two 
controllers control a total of up to eight exposed ports. There are up 
to four USB 2.0 ports and up to four USB 3.2 Gen1 x1 ports."

So there are eight phys and we could have 4 USB2 and 4 USB3. Depending 
on which pins you want to use, you could have various combinations. I 
can add these details to the binding doc if that helps.	

Thanks
Jon

-- 
nvpublic
