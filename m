Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D0C54EED
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 16:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbjAXQXl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 11:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbjAXQXj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 11:23:39 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE958F746;
        Tue, 24 Jan 2023 08:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXfJRuElQIo+SHbX06NfFL9OrGQuqCrmQNihv5vl4zM+qsMQSU6QuWQzYGN+BxxQD3EbPjU8YP+ShRQxyKz6BymVSzzLOD7PKE/QefhTPeMWdWlsmIaKFTjiaXUrQD47rKIV7DEjpSGu6wB8yKliCSJwIesEATINGPT4I7MCEHL6j1TeZKl5P2EmHunjYkv2jmW9UO8/exWbaCRCG0DdLH4uX8MgryXkbAkhRxeFqjlEJ7EKUE1tYGC+Vh9Gi9zdPfnHcqA3iOeFVYJ0InNNVoD+nBNhE6u1/zflAEnEfQvNwfej/4kfpOP5nk8pa7I+AbAaC89CnAlcgSBp4auDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efPdI0/IW8wqWzueTFLXq7woZlZhdnMS4QPkBMz9u1M=;
 b=g87EvYxt0QkPS7cxvXr61lf4n6U3OSMiEwHHayRSMKXmQHL3qvUFuJmnisTb5lC5/QmhSZQMsynG/MONgzk0ACCjiY5vRyxHmdHJTBvgurbIZcZOlnCZwBOkFHFxozleHjUbwhx+2AHGX5zFff72Jp7bPEdkF5fp9JpXW/t5gmJ2gt5fghN5YrvNCsCjbE1fHE5rV24hJ2RfxwhmDAGtIdTxLnG7ysPh0LjqsHC3S+Zr7VeUekd5XBTCcCKK4oTRqyosqFtTEk+I400pyKiASAGd+gUZhyZRAXfQ1SyUB/FF7/Ndzi3dK/MtTRZXbrxDu7A4Bc0myQ4DLgS1Jp2D/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efPdI0/IW8wqWzueTFLXq7woZlZhdnMS4QPkBMz9u1M=;
 b=Y0mh8YnxzaoI/f4s6y4q7896rmHhizyfVbk3kw/OMu2Z/7QveB0ypEOz6ahq17OPvo0mD2BRjZvyCYUL5UJl4Dnah7fxAzB/x4dIYSRbk+WNBqOQB50LsIZqwxTa+uP0mQt6Z/RbIkAvfrMpRwVXo8t+jlN61R5cdL8rLoDSZ32zR4erewv4tK1inF+8tOpIchPhJsq2vM81cejT3x8UdFdWgcKNZX2Iska+jHWkFjttgcGenb2oYLH7Lv3gDY5jENBN/aRJ8fHx5KkdGul+I9Y7uo45R3Ada6Wur/I3ijJ984zRdOsLn6vwJktyHtsjgz1MW/jhTbrIN9xbmWbTOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.28; Tue, 24 Jan 2023 16:23:15 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%8]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:23:15 +0000
Message-ID: <4395a5f9-0f64-e582-c24a-1681d522b8a2@nvidia.com>
Date:   Tue, 24 Jan 2023 16:23:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V7 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org
References: <20230124114318.18345-1-jonathanh@nvidia.com>
 <20230124114318.18345-2-jonathanh@nvidia.com>
 <167456749036.611215.16155554024148748452.robh@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <167456749036.611215.16155554024148748452.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 079f7eab-fbc9-4a42-b853-08dafe274ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twQbiArVBf/9uHSUO07w9+o/Uop8fRue3kzoYwZ5iVP/YRcgYWAW6Yo+MJWRmNxfpBNXrzeOAg4iz/EOF70U3IBBr6suDdsAxZx1gKSi9ReLxF+85m9Kk6t87rroY9Bcv0Po97gkRvrxSh/D9vk/GyfJbIrLt4WMWygtqsGFyvy/6Wn+YQNeknngM/J8VA0v+pV4z+TKYomU/UmV+qRu9mhGiRxb8v14JVOQqWrr45rl7sCyT7e4le8rME2Hlc6Nl4aBsBuQVTdy9S4MBA9VJZjlc0ndDYzNxwoT625NaniPr75iIW9p7z5GoG/lTyD7q3I6DQGEYut8El3fZgDNvriCNeI9otE1epwvuatpekXQ+/5tgVLwuqB7YIhgr2p1pOhS+HQ+oOPKxF/ummh61YZwqDQ2h6tWccLLzwHNw4kw8LgvzcOoMdo8/ErIQaF5bgQ27uiVRIwKvHGH3EyAkDApoxbD7ijgy4h/LldWcmdb0Loy7JH7TeIbWo5ngBNv80J3dHHs3h1rX/6jXC90hJWqHT4WNxIy9ZgndZqO05/qkmiNxaQPGXopl8AY1usi6jTJ2V1gWNB4hQ3t+HPbzw3vlSYUA7BFZ+z4sjFJxDxmhjzZPZLEv6EFYNFb9rQVLkGheJoPkQO41Cl20LVoTTrT7GkDQlmTRhh5FbzItf7ERLt6BwZRMrECNkhBrunN0TnVJjyj2qrYHJUXllxVK+iU4QumP4d3Yc9SC7thMuq/ahU6uPHBBc0pwjktARRZwNTmYKOtrun3hP+Lp7JGyfiUW+AHeJGSVrC+LtfqloI2jl87Qs1q2tXXQl29EEbZrGS8k0kHJLgJGA2dNTv+GlsXLUQ4N+Xy+/V4XKuppws=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(86362001)(31696002)(2906002)(6916009)(478600001)(8676002)(41300700001)(6512007)(66556008)(66476007)(66946007)(4326008)(2616005)(186003)(6486002)(54906003)(966005)(6506007)(55236004)(53546011)(6666004)(5660300002)(38100700002)(8936002)(316002)(83380400001)(26005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRlcmxCbENuRVJVV1o5NVB6ZmdnQkJrRWlsdlhqZVdZS09waHNET2hlb0J2?=
 =?utf-8?B?VE9zSzZKRkdtZld4cFdUQWIwN1lOUS82ZkVNeGlRakJqelRVWkQveDBrQnFw?=
 =?utf-8?B?ZnMvUlZ0akpBUVlqaGZybWZEWjNRMFc2TnFrcWVBTFd4bzlsdVBISUlRcTFS?=
 =?utf-8?B?NCsrK3E4MEVxVk4wR2F3akxVQSs0Q3NjQWx1bFIrYnpmWjgzY2E0WW9UTVo2?=
 =?utf-8?B?YXhYTjBNeTJhNmpxaHIxRlhaNWl1T2hxR3M0YjA0Q05OeitZa1ljckd4a0NG?=
 =?utf-8?B?dE54dy9aMFE2cmd4d0o5MkFUZmhibFV1cVF3aDRDR0NjSjVvRlAzbGYzaGhs?=
 =?utf-8?B?UjVVMkFsZm9HVS9hNVBSYXp3SjhIQ2RIRkR0NlQwcTlZYmVrMUVqRDVpWGYy?=
 =?utf-8?B?ZEx4TVVGNkhsaHpOZ0ZTRTBwNmdNSHFWUDFIM1Aya01hVnJDUTNlNkVqaGN6?=
 =?utf-8?B?UUdOb0ZaYVQvV250eHlxTWF5SWFtbjh6OXhiUEZyNmUzOVVkaUlPY0ltVmc5?=
 =?utf-8?B?UkE4Q2FvdVZVN0lOU29QYkozOFlIYTkxdmFSVENQMGdmUFFiZXlNcjB3ejZ3?=
 =?utf-8?B?MC95ZGF6Z0R4Q2NobDQrSG5SekdEeFBvMkZrRDI2STNrNHUrWUgxS3NWa2Fa?=
 =?utf-8?B?ajZ0eW1VeUxydnZseGZhYUVMcnF1NXZQSWplbTlibXRFSFpNeUY0UittK0FL?=
 =?utf-8?B?bm9wSVFLL1l6L1JaUmdTUWZBR1pQRmppai9QdnBnb3RBWlFWVmFGZEV2aXhI?=
 =?utf-8?B?S0Zsa0NSdVJUTmc2K09BRWQ1MEFZYnhqcEVobFhqQUxwUHlNQWI5UElKdms3?=
 =?utf-8?B?VnBNdUlQY2xzdG9PWkp6WTFBTVRxMVhqQ2Y5TFpQVzNGUXpzWXp0TXpvL1g3?=
 =?utf-8?B?aXQ4QnFqMVFCMS9WN3pBVkZRNVJHTFRxMnpEdTdOVHFIWllGa0xaU3FWTVg1?=
 =?utf-8?B?R3NKRVRFMEFQTVR3Vzh0Ky94WGJXSnUrUU1lN1JOWkgrWXhxWUNGdktYUWtI?=
 =?utf-8?B?MDE5bWNEaUFDV3haOFBkd2hHYnl3RHduTzZZQk0rNlA5R3NtTWUvQlcwTU1z?=
 =?utf-8?B?VEN3MVVKektDTmtIWjNEcVRoMUpON1lNT0h5TE5FMm0vQ0psNjA4U2tnTVcw?=
 =?utf-8?B?MUkrUlNPbXVMc1NPTTJnZVZZVjMvc0JzQ2dWNmI0TXk4WU51UkMwRVpWQWlq?=
 =?utf-8?B?TExVZHQvdmprT3ovVGdMSjljT1VHZ1dsZ3dncGFObDdtTXhtWlR3amlYM2VV?=
 =?utf-8?B?U0JaVnB4RXFwWFhvU2wwM1Z3SUg0QnRCMndVUkJXYjZuNnFVWTJmaUoybXU2?=
 =?utf-8?B?Szc3bEFCTnVzdml6bFJUSDZNVktjSzJva0pza3RtZTJZRnZxU0s0L1BuV3Yr?=
 =?utf-8?B?Ty9lSVRxTmZkNkVXcW02ajVxQ09ob0ZuenhrVXM5Qmlza2JTby9ZeFBLckpV?=
 =?utf-8?B?NnVPS0hNMUo0TTdBY2Fia1ZLN0NRaTk4R2FwWWlKRkppNVpoR1p1SlJGekVi?=
 =?utf-8?B?dFRYRG13dU9DOGZXbTkrZVpyemE4SXhlcmtqR0w1YW9EejhsU0tnWnh0VnNM?=
 =?utf-8?B?c20wSU5VMmorT3RLSWhzaXRRUUE4R2kwT3l5Y20vWU1MK3BUUDcrTnVKRG85?=
 =?utf-8?B?bDZCbnNMV1JNQXpWNFlISHlGY0JzdFlpem5CdW0vSXlRaGNicnIyRDU2S2hH?=
 =?utf-8?B?S2ZxcUdjTXZUUnYzdmdDTFRVL2d2czdMQ3FhZWh4ZWc5amdRdGdudURyTkRT?=
 =?utf-8?B?cmJUVFp4blljcmxhMjBQUU1OR3RPd3lwYWJhUEtBajVWRXdqUGdHelVLY0h4?=
 =?utf-8?B?YzBjT2JYMDhnaGxTeDQzSVN6RXM2Rk1jQzZxMTU1NDJoUWdweFpUUS9lalUz?=
 =?utf-8?B?OGlzWVMvN2pWakNsa0JCdE1USytOZTJwTitmb3JLeEl2T1VWZ2VnM2RRMExj?=
 =?utf-8?B?YVVUblNMMjBzY2YxMWUxRFJBU0pSU2t6SzJJU1dOTisrd25qcnlhTXhLQ3Mx?=
 =?utf-8?B?WWQ5S3VXNS9NRkxCbXJiVXQyUVVIQmpBOFMxdEdIdkc3VzNpRTBHT0pYWDdU?=
 =?utf-8?B?UnozUm5kYmg2RFZhbHdQOWdiUk1TSDFuWG9SLytscDZhMDkwbCtGVWNibTRK?=
 =?utf-8?B?VWdTeENxWlRma0RhOHJ6WHd6ZHVpejFLeURJbG90RmljdU9NaDFmcS9NRUFZ?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079f7eab-fbc9-4a42-b853-08dafe274ba5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:23:15.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R08nMaEAV2A4KMD193SeuDNa1XvfmNTIC+2Ru72k667T3Ckrcq1+NqfRKPWfwAHqukpQ0o1D6JvIfJQuq3k8Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/01/2023 13:45, Rob Herring wrote:
> 
> On Tue, 24 Jan 2023 11:43:13 +0000, Jon Hunter wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> Add the device-tree binding documentation for Cypress cypd4226 dual
>> Type-C controller.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> V6 -> V7: updated example to use 'typec' for the node name
>> V5 -> V6: no changes
>> V4 -> V5: updated subject and updated binding to use 'firmware-name'.
>> V3 -> V4: no changes
>> V2 -> V3: fix additionalProperties warning on new schema
>> V1 -> V2: based on the review comments. Fix some addressed issues on
>>
>>   .../bindings/usb/cypress,cypd4226.yaml        | 88 +++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml: More than one condition true in oneOf schema:
> 	{'description': 'Either unevaluatedProperties or additionalProperties '
> 	                'must be present',
> 	 'oneOf': [{'required': ['unevaluatedProperties']},
> 	           {'required': ['additionalProperties']}]}
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230124114318.18345-2-jonathanh@nvidia.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade


Indeed. My schema was not up to date :-(

I see the error now and will fix this. Sorry for not catching.

Jon

-- 
nvpublic
