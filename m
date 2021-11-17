Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF53C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F16A63245
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235621AbhKQJzV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:55:21 -0500
Received: from mail-dm6nam11on2076.outbound.protection.outlook.com ([40.107.223.76]:2302
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235570AbhKQJzV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 04:55:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoITZLhCdCn8AFQDXktxTtBJDY6TgeiKEPcoOGpOzEz/XaWNcUjxM4/W2N4Tg9zUvBArMqz2X9w3cCS0UWXyANyeV82mg1e5rKiiGEoDNrEpeb0XCtJu1Vygsw4XVnkJfncK1W59TvYoFdgU3/rsv5lTIA9EqHyCx9mkaxGYABuWt/XQehatOhnL3acN9rEomQd5xh2GRolZChfPyIHUWtYuU9L41srTS5jtHrmILqYzXnT8bGJOgsyP8yV6Rc6NGzqLLw4F544O1OweWFCKn7wpYP+WebS8p4ctuJ1MrFGxM22UEY7JCplxXTsa6qSVbN3SpBGY6P2Rzdfpj/ez8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Eq0724ClsJ1cRUSo9QhloScrK6EDxzY1cu6iZOeV90=;
 b=aY3+Sa8sfagnnzMIIRvzakCdtrwletnOdvh7Y5X6OwpXTHUAGixDYffNoyGhXmEJ29ToSrYBtNVHJCf4ZqXAyc0nfseWLr6STSPdpOqDbyAk8vdcki2HcwLXLy6VwOdiHqzIB97d6iN9A3wwDryOxAbf27QMNuZ4wm/NH3Q5fCsVjuel8wXgHvh7GqpXI6JmR6MqoyQ+/28M0YdTaMu2E/4RIm16ZJiRi/VKag5q+k4Nbe8L9aeRK/4DDOWM0w+e8lECcQvA7mRAe4dolERa5JH5CC4J2tpnrVHFy6HL9vmlTx5/vk5yzqbTBH/aRp36aVoDLGYqDusbR6MKRbllsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Eq0724ClsJ1cRUSo9QhloScrK6EDxzY1cu6iZOeV90=;
 b=nV/S0U8Ki9w46QqeObS7z2Tb+WaGeZkyNH/Xp6EiBR030Y17Eg2EMFRzfxbUVXVN9rqVkfBz1k2tgTXgL/x7AP1WnPUV0dq9pkhmsoBi05czlIQhT3gyVVYfHYgB674JmTcfhbif1cC8wBxJqrDy99arNHq7b2jWpgfM+TdOI+JzXvhkUJ6spR/YcF9Lo1y4Lh3Q5EGaAgZzNj8ZqattqnO8Gp7C366T4W1YDptNG9pgyhdISBZgeW1o95RpUqq7YPrJCDE2JkBePkLu8N0mqvD2o3w5k3My53NZmwJBZKKZF+6xQtQgN9hSaSTY9XMW4Zsq5FHVQRartJh1iUlNFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Wed, 17 Nov 2021 09:52:21 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::c884:b4ad:6c93:3f86]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::c884:b4ad:6c93:3f86%9]) with mapi id 15.20.4669.016; Wed, 17 Nov 2021
 09:52:21 +0000
Subject: Re: [PATCH V2 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-kernel@vger.kernel.org
References: <20211116155413.164242-1-jonathanh@nvidia.com>
 <1637116030.331789.1207279.nullmailer@robh.at.kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fd2c67ca-de95-6999-8a2e-a3f155add13e@nvidia.com>
Date:   Wed, 17 Nov 2021 09:52:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1637116030.331789.1207279.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To DM8PR12MB5445.namprd12.prod.outlook.com
 (2603:10b6:8:24::7)
MIME-Version: 1.0
Received: from [IPv6:2a00:23c7:b086:2f00:fd12:4d15:935b:56c5] (2a00:23c7:b086:2f00:fd12:4d15:935b:56c5) by LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:195::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend Transport; Wed, 17 Nov 2021 09:52:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2986911b-9cd6-4f9d-2558-08d9a9aff335
X-MS-TrafficTypeDiagnostic: DM4PR12MB5295:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5295F931CFCD879D594F3793D99A9@DM4PR12MB5295.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAaR3KqIv3Wnk3/qPE453OH+t9RSIY9ADyLlfxQi0klHAXqGTIpG4t55Hsfe0sbu/mvkc4geRrYJ/skvAdokpYu99azMz9/QivmX35dS6jCEWW2UuB6nPHl+gtNkqWwHQ+t1HOWpWsh0CwGFbjuafKqDMrPREIkXTjD+BTwbv0wdAQTZ+rcZU2XKf+1aENkhgi8eFg5rMeUjPTeNdf+RoX24GaEXR6NHUUs6syPRmkpKhspjoJae0umV7+k7y7r11r5BzqtgdWUk24nkNk2SybzNBvjUYQIfoXoYiDIefV58S5Cc/y/WH2mattzTC+zxhucQgEr+17ClyuMWn2LkRoYIc4sdtjFEQLs2AxytXq5qoMqkWDtdgwajSxFrI7dmzfpL15tDcpfV9f3ZNonD+W9zRIsyqT4yCoLqWPWWXE7rQOF8Lv4sUbMvN9X0V6hhfp2zdBE2f4Sy/Ptktvv+rYgH+BS5Ad8tO/YCO5n6oFrKVbMcd2xm6gEkXZDrUN/1mLWd8T58W3urty0zLlVfOEqVRU9pruNK17xtkwzRA/N+bCMk24lmT+oM1k9S8J2KYQ3O2g1ikNt+Yjb2QgyibLEgj1YZtJfpRiJ+McThzJCg9jX2UiX9pr0dMYWxCXa2s4iMX2L+QMxmUDvhqoG5Dmk6p5kIxYaWZVclLrugXgDE/XwzmNwhL1zj4KpYCQip9RBK1NZ6NeC5locB1YVW29wBob40qneKlFFrtXI0mzQZuDqstKWR0y6M/zDIIxGf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5445.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2616005)(53546011)(186003)(31686004)(2906002)(6916009)(86362001)(83380400001)(66476007)(508600001)(8676002)(66946007)(54906003)(5660300002)(6666004)(66556008)(36756003)(4326008)(316002)(31696002)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWEva1ZiV2RnWWNEeWJEUCtvRTFKaWZOWXczVk1OVjdNMHBiTVQvNEZMOG1y?=
 =?utf-8?B?cHAzaER6THd1VFVHQ1UzTHpaUWtCUHpXd2VqNktyeCtnWU8zSW5pUmFvVUU3?=
 =?utf-8?B?NkoxU21tWmJtOUJvWWxvZkc4UDBjVFNTWnVPRkYybTJyei9TUGFjcXNCVTVa?=
 =?utf-8?B?UXFVb1FXODFhR3N0NzNOeGRybmZUUm5IOGZWb2lHV0xBZlMrVVc2TEN4ZnlB?=
 =?utf-8?B?WEEyRGs0K2g4VWp6QTNOd2hhaVE0QWYwUzViV1N4RnJLbHN2MjF6cEljcGNi?=
 =?utf-8?B?SEVMN1QvYkc1VFVRVHVJN0oreEFmb1RXd0pmTXVNZU95Q0Y0OGw2L3JsK1Bh?=
 =?utf-8?B?VjRTWVBBQmorMk9YWlhEbXZEVnhhOHcycnkrdktOR3EvWFZYR0p3YTdnUmhI?=
 =?utf-8?B?cTRCclUzc3NIY0ZSREVoM0hGQVg2VUY1Qk0wVU1ETEdDSkxSaE1QTFQ0YnRP?=
 =?utf-8?B?VVp0SXYxMWZGeDNDandqWm84TDZQaUo5bUdnc2N3bHhNZFJRTHNvcW1ha2d5?=
 =?utf-8?B?VjZnOFNjUG92dXBtdWI2bDJLcTZsSkVLTXQ1T2FkQ1VGbHBrbkVxMGZnUDQ1?=
 =?utf-8?B?MGFlN1gxalg1SzZmS3dLRzAvMzRxZ2graGc1ejUrRDdaVVQzdlJyVjBDdXFr?=
 =?utf-8?B?S1lyL2Q0Q2dnSkk4bWkvemlsc0hUYk50MUlETGVVKy90YlRGTHZCcHJIZVo4?=
 =?utf-8?B?empxNDR3Z1I0UXBnYjRIbklmeEtkTDYrV3FqUHFOKzBYblRLbmExaHdQRytK?=
 =?utf-8?B?cmkvN0duQllyQmNZTFhvSURteDB6QU5vaWo0Z3hTM3JuODkrSUc2cUw0MDFu?=
 =?utf-8?B?VXk0SzFKcXI4bk1NV3F0alJPaUYzTDlBeXN2MU1Fb3lxWFp0bUhZRjFnNkha?=
 =?utf-8?B?UGh3V28zbFNyTjBRbnhtbjBhZytoaFM4SlJUMGppNVBOaWJWUXB1MWdkMmtX?=
 =?utf-8?B?QXB6blRzZ1NHLzQybG1ianhWcG1Xb09SMGo1dzFNQmtXNTIrVnJUVUtDM3hm?=
 =?utf-8?B?SVFDc2hwZkJOblpTOGhxWE1ZU2hFVmw2dDV1cGowNTJsb09INEZJMmpRalYx?=
 =?utf-8?B?cENkU3l0OTNKK2lPcEFHN016YWx2ZjQ1OGtIQ1d3MTE5Q0pIQ29MOFBwamxy?=
 =?utf-8?B?ODdjUDJCOXZaMjZ6SHpXVzZqSFgvUmlzQWhRNmlCNlorbUhGUTR3ZFZjVDlG?=
 =?utf-8?B?VERCVmxGdGhzSTF1dVgzaStaS1ZycWxENkhIalljd01BNGUyWEhqVktUVmZK?=
 =?utf-8?B?bjV4cm5EdE9oN0hTWjlRaTNlMDJyQU01NzB0VWIrRHRZTGJqTzVzdXBrM1hi?=
 =?utf-8?B?cVRUQ2ErektuQVkxQlhMREY4bXdXU21FdEN2RUs4eDFoa1hyeWpGcGRxTmVW?=
 =?utf-8?B?NklXVEgzV2Jaek1HQXRUYW1tUHRpWHk0c0g3ZWxtT24vY29SU2xlbjBpcnRT?=
 =?utf-8?B?ZGQyUVp3dFRvdG5wS3BkYmd3c3BGeDBIV0Y5YnhrV3JoUTkxTHRFV0JuNDBP?=
 =?utf-8?B?SUhaSmhyN0taU1hKUDF2a1FNUjk4OERVOFdmZmlEdDlUSkQxYk9vTno5OVRi?=
 =?utf-8?B?TkpXT0tGWTk0ZFJMc1lFRWZsZE92TldJV2JycHBOKzdPa3RnUXROa09jZm9y?=
 =?utf-8?B?WFAzeWxpTzlKWTY2Zk5BNG9WM3ViNnhHV2R6MUtlZmg1Ymg1V1U1Q0NpQVhU?=
 =?utf-8?B?RGRhYkxhQVZITlN6VExwWkJENGo1TFZVL2NUV3Y5bXJ4V2wvZUx3T0VqMHli?=
 =?utf-8?B?RHRBK2o1RWthYnp6bHN1Y2daaDc5WHVNZUVSTStmcVRSV0xySHZ5QzlrNDNu?=
 =?utf-8?B?TmluTkJTZWx5RUR2YWJlakx4T3krekRBL1d0bVY2Vm13dEZNdnEyRzU5ejVr?=
 =?utf-8?B?NCtnOE4rZ1VuSzB1MjQvbSt2K3ZZeTU4aTJvL2JRQm1OWXJ2bTRyV3hUS0tM?=
 =?utf-8?B?cTB1OS9WbVpXR3pVNXhjK0syaTZETkNwUU9CTjVCZ1VTUVhkdUJRaEJNRDhx?=
 =?utf-8?B?QUFvVnpFNEx2OGNaR201eHl3WlRVMm9KZzc3a29FZ2JaaUV5clRTY3d6SkJu?=
 =?utf-8?B?d1haSStIeUFaakJ2UzVyL1hqYnkzU0xOK2QrVDYxSHNlQVZ4N29NeHFzMVM2?=
 =?utf-8?B?SmhlNlpLWGp6eERvWVRwUTk1amlSdm9qeTlMNGlMMG9heWc5K1dWMUVpc3pW?=
 =?utf-8?B?YlF6U21UUFdaZU9RemtIWHFZdmdXajVjb28zQ1loeU93b3o1eTMzNFRYM3FR?=
 =?utf-8?Q?wuAY6CxOqfyG8HNjHfzmszT/hRXpNMmSHeM6ORxypA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2986911b-9cd6-4f9d-2558-08d9a9aff335
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5445.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:52:21.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3ON7LGZcF4CLq8sAeh4jsJrzz9JoLT43OKz9SrQbiC6QATxt1H/blYeN59ruwknKl7lgswBhdVZ12LydNmJiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/11/2021 02:27, Rob Herring wrote:
> On Tue, 16 Nov 2021 15:54:12 +0000, Jon Hunter wrote:
>> Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
>> engines.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> Changes since V1:
>> - Fixed errors reported by Rob's bot
>>
>>   .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 135 ++++++++++++++++++
>>   .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++
>>   2 files changed, 229 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml:103:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
> ./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml:104:13: [warning] wrong indentation: expected 11 but found 12 (indentation)


Darn, I did run the check and although saw the previous ones did not 
catch these.

> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade


Yes now I have upgraded and installed yamllint, I now see the above! I 
will resubmit. It is great having these tools now to catch this.

Thanks!
Jon

-- 
nvpublic
