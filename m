Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54386C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Dec 2022 09:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiLBJ61 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Dec 2022 04:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbiLBJ6X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Dec 2022 04:58:23 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E929801D;
        Fri,  2 Dec 2022 01:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTOdPQiDx8a09otmEJs0B7dL3Yaqp04EagrCJYuWPsv7FiatfRS3Ih7f1D9ryw0Fvo+2pRascX/X8KO8DcSCGjquz/ivH0tuYphtk7Kx+1gibbV+ncJk5HTMxzmcIAbSNAZXDyhMVESX9b2vGQzw5iYxH+5mlp16A74VfNQld5aFFcdl93/KxPBxnSCOJs/YYLgeH1Vze1cKluCWlzB9VZ/+MC1Qxi3iEJaxhtSx7c8xdZRLi+CxUPvzR4esFyjhgndnVWHvBeuGRXEkhv0nb2ei0Mq4VKJMMMOpbsFyqN8LYOM9BmZ6540hdV/11Bvk+/nEYKWeEtf/ohj3ms/K7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui9lFJ/Nx1pIxE0VougvREH9Ux4MnZ6V7gC5bHBF0Tw=;
 b=SK8FIbMQ1BoFNPmx4uhfvPZRiiNXHOBzgqMh/dFUdWWY07CxtrJKZcb5kWD94D5OySySIS4zfFWUSxWrpFBwjQhPM46Gl3Sj7c2F9CSbfhQpL2JERO809hWroYF659JcehyMOjsLBGVHDz733vguA8N/rxofvbIUdOk8vv2zf8hTUC+DAGBmEn9pmI5YjYmEiS3YUyubU5IpsuXNKRDyrLEoo7OkCO/lFYBZqQNJ6rQ9pPY2biSP205fHjw2bur9fXKOdDgQd4Q5oljpfxY97mWJjy4HZX1PtGcwpq7jjoVZpw0/sSCMvZO35E1Bm6ZRjmnXCksg10ltFk4Y7zyzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui9lFJ/Nx1pIxE0VougvREH9Ux4MnZ6V7gC5bHBF0Tw=;
 b=XIvTGZD3XSej/1Telg6RwfolswSGps+1BRWN7NYmkKOsSRe1DTmUGvZM56H1SllXFJckA4jnqM8v+JwQnlXaUIz5Uy4v2+I1ZCvKLGo97NB9R2cYmx35luSzorZk29mKaXxl7h9R8Ad8HksrfwAZ2urUgsSamJ/EVnXiUSMboet9WK1AV8aHekQROnhP1sgMjknQdRp3ovJOAnxrSSsHFJpykUcIkYDbfzyvr/aSOZoyz81mqw09qxHRokuMnZgA2W4EiskjLmgQrwkYUko9GNGhl2TBqKXL7ImG1pLtC5HMRXsPO4DrAHCx4qeTip+RW9KP77OB5+bJfdTTGvbCEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Fri, 2 Dec 2022 09:58:16 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f1be:5d:f297:e2f%6]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 09:58:16 +0000
Message-ID: <6c664b5c-aea8-883f-c278-e010b95e5b84@nvidia.com>
Date:   Fri, 2 Dec 2022 09:53:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 6/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
To:     Rob Herring <robh@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, treding@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org, waynec@nvidia.com
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-7-jonathanh@nvidia.com>
 <20221130170709.GA2454510-robh@kernel.org>
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221130170709.GA2454510-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab15a6a-c6ae-44a4-5b7f-08dad44bbba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 83B3SyMbRomLVMI8kFm687Ptli49gZuqguGPfE6tbLe3ElVL/hRBKZckGbqu7pLWvPA+w/lfWAM7iSwKaHiXNAOxFrd0JWuWlyV+ZCpxhondzLe+MhWZ8ZQ3VJZnGbyT/qqnbIfsukgJ3FjkWs44IBp3GgDd+zJmccl4Usn7e8rlikATfSQI0S3ztyop6+ehlE5hYbGro5l3/FiW8QIO1ORhyYYmmSaAiv2MYu5cgjUKrTFe7VmPGwECHbpyjN8LbBBTX9s69Yb9IMaI7QcPxpfPtwzor8FsUATTkiaE6P1WevAGkqUKJKj44cHN0rRIqojS0ZwYn6sUOiNIsQMwAtDHkJWKmg3T5+Vf+D+dosHplb31y3DNI3tyNPiRMGDkNgJx6uhxb/ECh3vOyw8Ll6rKm0MMu8bGQdmboTfN5Kw5upedsAd4goPQsJONtGvtEpimfxmQv0G3UkiciP6+fGmcX+L6T32fF9iYJQPtZAlUAj9cvkl88yfOhm9fGL2n9P/4fx6jPYgOEpcyl38SamtAOQ7WvuDWRRTCtKl3g6sQNRJQfvfqCZl2UKwZZUI5gq9hBrRPIczT+pqHgxZnMnl6rEYNk4zA/GdBlTnBSPwNIqNLlPT9lnLHcyEbVMt97ZEVD2cAjjqorzh3tm47OutrBEV5SJGbg7KKtWSsFllaV2FGmiAwyEWWKzHfRPLbqpsUE26RMyu66JGRKfqJ7C/NtZduvL89pRgySp7n0uckFSqiAX8nCyCFROZAjW2SeXAPSVUxGV1oLxIwC7GEsUAD+ylC6yVeOSGq/zkpjB2BXu3uULunQXGnFSvZ3YQa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(31686004)(36756003)(8676002)(66946007)(66476007)(186003)(5660300002)(4326008)(41300700001)(38100700002)(2616005)(66556008)(8936002)(6916009)(316002)(2906002)(6512007)(26005)(6666004)(6506007)(107886003)(53546011)(55236004)(83380400001)(31696002)(86362001)(6486002)(966005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZBZTljckZ2MHpQMUZ5VzEyRzdOcHpoZXQ0Z0xOWjd1anlZTGp2RVlKenFk?=
 =?utf-8?B?K3VvSXBYMGhFQjVIWEJWQ3J2NjREU0pqbS95ODhsb3RWTDlCcEtiM0MzVHN2?=
 =?utf-8?B?ajgzbmFMQ1BXZmhSZk14QS9jd2NaeEdxekk5d3d0bDJ1UEFGRXBNMEpuL1ox?=
 =?utf-8?B?Q0pDYk14TkxYcnQ0VFdwOFNFSDMrbnljT0VhYWUzOGdzdW5JL1MxaG8rRUlJ?=
 =?utf-8?B?V3NtNFNSNVdHMDlFdEl6bWZQVFhhQXpkTERSSVN2OXc2cCttV1czdVBVa09I?=
 =?utf-8?B?TWFtYlBITmJVQ1FKUVVITUxhd09JK01iWm9uSFBrWkZ3RkhsbnRZRjE3VkhR?=
 =?utf-8?B?WWFrQnY4ZTRBMW1MdkQ1T3BaRDZsN2duUkxlZjhTWG0yS25TY2hqUnJHTzRo?=
 =?utf-8?B?bnNleWkvOEw2bmJjZ0xEcktyU25JS295anFGMXpWZVVxejgxMnBQSVNVdXJj?=
 =?utf-8?B?K1ZZbW84TVRrUEJDWWNXbG9YVk1MWnYzTGY1TkgxNWtwSnFac1phS05ScnJT?=
 =?utf-8?B?Q2dod2ZPRHVsTGcybzMrTFl6MUQ3NGpRQmFETUNrSWJ4ODhrTEt1ay9BQmRU?=
 =?utf-8?B?VzFmZU4zeU9BVXRtaXlSc2E4VHVqbFFvNDZaYnFJb2EvZ0lQby9DS3VSK2Uw?=
 =?utf-8?B?aTM0MTVhNy8zdUk1UUQzb29raXNsMnB3L29sdDErMjhadk52YUc0bVFVd0Jw?=
 =?utf-8?B?RDFab0QweUJIcWRNWkdFT1Q0MGg3WEZRTTJvRDNSN25ZOXVkQ2ptbzFrdXBs?=
 =?utf-8?B?Q3Z3cDRHRGVNa1IyekJyeUY3eWg0aC9VUkdGSDh0cnZQVTNXWGlNOXNVMW1q?=
 =?utf-8?B?MFlIMEE0eWNnUkFGNmZqNlgveUJvYzc2UWdZRkh4N0pISFR1c1A0WWs0Zjkr?=
 =?utf-8?B?azJEVlpQdXRMWGw0UUYvYm9xM3l0VFpQZXNYdkxKc0FETkJ5b1BXZWJpTXph?=
 =?utf-8?B?TjlqWG5Bd3hCblFuTlZmdnR6NlRjSUpSMjZLZ0hzcWVndlhJN1dHWkVDUGxY?=
 =?utf-8?B?Umt3bndUdFJaVDhneUFObm1sTjB0SUNCOVV5VTdYRDZHYTJJRUxiQnVjbzV2?=
 =?utf-8?B?ZTVWdmZUcVNEcVkwZHZhOWtYUDNMQ1k0eEVOMnp2clpaWm16WW9WbW5nNkk4?=
 =?utf-8?B?ZlU3bUxPSWtMZXRUSVc5djNaTWpwT2JyMzkyQlgrb1BFU1JsTVNKTlhjRzdK?=
 =?utf-8?B?Mk85SDBFQjA1ejV3dXU3UzhSb3RqbGRhNjBablRFUUp4c2NXeEZzQi9kT2th?=
 =?utf-8?B?aWsrajNOMnE2MEEvS1JMVUlJTGxYbVJUS2U2YjlIcnhmS3FDUUxCYnZqNU5x?=
 =?utf-8?B?QVZwaFg3MkprMVR0Rzc0RGErQkQ1WkJaeVJTVEhCN3JEUGdKbHpwbTR6b3Z6?=
 =?utf-8?B?QlZBd1lRWEM3cnEySXpURnlpeHFiMzR0RENEaWFkM29DTXJRN0k3UFF5bFBi?=
 =?utf-8?B?UUJ1VFFNeGc5WjhidGkyUHRQcllaNldKYTgxWlkzS0twMnBkL2RNOWo2Mlpk?=
 =?utf-8?B?R0wxcjdubW1sM0p5bnFkZ2VrZGxBYnpDTExyZ21WZWJHRGE0Y1RZbnlNNE5Y?=
 =?utf-8?B?NU9aZnlJckhWZmsrUElGenRMYStReU5TYWFpR0lWZnR1U0RabDl0YmJ2cURQ?=
 =?utf-8?B?TCtVQVlSZjhBRDBaK3JRTWdRcUxISkF5YXdYUGZWeEJEckw2emkrV1NUcE1S?=
 =?utf-8?B?cjBmcVV0SkR0MlZNdVNndnp6aEVjRHBidnpIUStReEs1cnRQZ20xRGFycHAx?=
 =?utf-8?B?bWZyZkdvUDlIcmNTYUdLTTM3WXdOSkxlSUtDZDArSjNTZlN5OUwwRzBzZmFs?=
 =?utf-8?B?cnNvWUE3dzFOYm9LQThEVDJNQjgyTEVnL0c0YUgvL2NIUjBoNWR2bnNvSktO?=
 =?utf-8?B?UFhMUHpFbnBWeFNvQTUrdEcxeUlRYVZoaXNyOXIzWFUzcXlXS0J5aEg5Wk9Z?=
 =?utf-8?B?WVJnSTNtUjdDOEpMbW9OOXRvS040eWRocmV1MHhSelJ2MER0L04zQmZmL3JF?=
 =?utf-8?B?TGdMUVNhWldTNUNwQWdHTHRwV2VmaERTT3QxMS9yZ2QrQWRQSC9pMEZtUG43?=
 =?utf-8?B?NS9rTlBsWW82bzEzK3hwOW54cWRYamdhNmFEUWtyOE4vNjRYc3FNUHgwVi9U?=
 =?utf-8?Q?VKk9Q0UXoKz6AJCfRAAHR3/ol?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab15a6a-c6ae-44a4-5b7f-08dad44bbba8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:58:16.5514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OFIsNqViXJZ23qnNn1+QRU+zTijLgJ7qib6rBEMZHqyQfm1773biQhkhU1Rnz+VbMXcrsj284MRJ56xrm5YMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/11/2022 17:07, Rob Herring wrote:
> On Fri, Nov 18, 2022 at 03:40:06PM +0000, Jon Hunter wrote:
>> Add the compatible string for the Tegra234 XUSB PHY.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> This is a new patch in this version of the series. This patch is
>> dependent upon the following patch.
>>
>> https://lore.kernel.org/linux-tegra/20221118144015.3650774-1-thierry.reding@gmail.com/
>>
>>   .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>> index 1c570ff65eb4..5302fdb0949c 100644
>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>> @@ -42,7 +42,9 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: nvidia,tegra194-xusb-padctl
>> +    enum:
>> +      - nvidia,tegra194-xusb-padctl
>> +      - nvidia,tegra194-xusb-padctl
> 
> Did you test this because I'm pretty sure you would get an error. The
> bot didn't test because of the dependency.


Indeed. My fault for trying to juggle too many things at once. OK will 
correct this.

Jon

-- 
nvpublic
