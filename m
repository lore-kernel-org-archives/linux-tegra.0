Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3DCC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 673DD61076
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344112AbhIXVqF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 17:46:05 -0400
Received: from mail-dm3nam07on2044.outbound.protection.outlook.com ([40.107.95.44]:45024
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343895AbhIXVqE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 17:46:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfaQAWZh8euq30BvMCMlm/H+Tyw6YADWkwvgXWEI8ze+hZweRVXn+Iqx3b6e+/H5zg5RqSoeCRGFvCRCGoQur1blqvjWfjwzPlmzpTxn0Cgz2kAfXYHHxsNAl2g6jcKf/PWLKD6qohEl8I/4Zio98Xkb9Js12i7CJbco6xGaaOffmvkUCozxTRuBX+tCNlB7aRgnVaAOgfsb+VLjkl47GyZLAMchBKphKCA5pQP3p1E7Op81BX9TvywCPtB9SngIq91hcYFOAgICPSWDvl4C0/Knl//Ewq3BEAIMKU0EJkVAPhZvX6k7tv1shPv6RFL36pp4+rNfHwYmFx9KPxcgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8lx5Ee07THZfYVWNyqKXKJQPuEnJYJNp9MNFBasPd6E=;
 b=ILbYDSj30unFKZA0Ma1YxNk7T6ahlZbkXRwOD1x0VHU+8gSjHT75S4M8lY4Uf8Hj0ttz2QlZ/D/5Qs6K1Zj8Z96zWVgzLiTiQ7R3PjFbe3lMMAcS5ZXJXybgt5FCr/4Od4J0RuzmbZsoimWe2x++5MidQXTLR58X45p9D1cJBI99vIh0lp5UchnjTwhuwm5NYms+evc8XXA7oREKeS2e97qVrMqSgfYG7fJHntqrkAfemr4v40Xs7oVmH5hXJQ+6TizUdQCUPEw9vswH8cN8pnOr+Zk1FwuIJ+idCf7ALr/xoIm5rG5V34oBOCapegl/EtaCl+mww+oLk2ymCuPfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lx5Ee07THZfYVWNyqKXKJQPuEnJYJNp9MNFBasPd6E=;
 b=oRWYVYibRx0eEZsgQl15ztatQC48BOSaCNKOhzqa86elVNDdyXPCKGUN3QQqGAz71PgOUcQDsBfHURd3xZFWmL1tWG407QlG8fAVk2dvKTjY/8IQ9WVNSIsQad8JFRS8+3l+Ir7X5P1x2su48iyuMqJhcVHdBtDQfwyQQBytuB7sYNRSdCxJkpTth0jKLX4stxxM2VNlgYEdXpC9d3crvduoZWfQ+nLUsagpQffVwu4VVDCYqL5kWCH1ACk464wI3Rzv5y1c0Y4WvVq+7NuAVV/qHmOEywYxe5KN+eNUHKorgRwB6oDA0uH8cZQRJJpRqI/wTvcObe6NZtNI9gKi8g==
Received: from MWHPR22CA0026.namprd22.prod.outlook.com (2603:10b6:300:69::12)
 by DM5PR12MB1914.namprd12.prod.outlook.com (2603:10b6:3:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 21:44:29 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::3b) by MWHPR22CA0026.outlook.office365.com
 (2603:10b6:300:69::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 21:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 21:44:29 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 21:44:28 +0000
Received: from [10.19.66.38] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 21:44:23 +0000
Subject: Re: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add
 header Copyright
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <digetx@gmail.com>,
        <mturquette@linaro.org>, <abrestic@chromium.org>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
 <20210921094206.2632-4-bbiswas@nvidia.com>
 <de4ad32b-ab60-a4dd-793f-9bd520ed5a87@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <d9329dac-9eba-3657-9e51-8129d9cbbf61@nvidia.com>
Date:   Fri, 24 Sep 2021 14:43:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <de4ad32b-ab60-a4dd-793f-9bd520ed5a87@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64ace6b1-2943-46f8-d17d-08d97fa47cb6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1914:
X-Microsoft-Antispam-PRVS: <DM5PR12MB19144EC25925D5F141C4E670D7A49@DM5PR12MB1914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIdtGGSlSMw/mBafE9Rk7WkcxctJW//1SCk93pa9OnhIpOmCK+sIGNcStIKJ1NwkwCwejtIbQpYYXGdy0qaa6dlPBRGFSGjqPaMe/M8LoApT3zB+0HZ4e/Xemcve1pXHgiJujG4CxziC1Kkmlj8cCp0SNRYFKYIgmInNh9GSHCnJfe6QruvenzDih6BOl39jUNvHf4Z3A5Ns/7xz3jdHg1ei6deS0QJTJdfOr65BM9JTjw1nG7NC12vZWAsjEm723YC77kIR4uUlvW1vAHcTvQa52sohz6ZqC4uQ4w05LLjtOm9tZVAgWS+4OE9fVsQLv6/XFJe7UOIIB1vp2d4sIHz2oZmdyux1j6uUYfY4a/pHcmhYYmtWhd2izdnE0zn6bVTQDphREm1GaA6eNH0r2SJz3SB0T2nARZtfls3WggDBVQUPBQlCWc/4eZY015qinKKLccwPrLl3PJfdXgyWLVWF3AV5S4vWGj7NsHAZQXWD95+c82TUkc11CCOT/6yxSeuOfQc3zGUsbXRkeA1cjf9hNLEeZYzgp+LBDdsZlxwWbkmPfX3rER4lIAmtnEUL1s5QuczDOG91/2WSUmw/kmjYQ82PjracnUOtAOGNN1IhlPOag3p/qVicAQi3ECkAQSzO8CMyRrJ53wPevtClreyGIKx/Z9H6L/fBWwgevsFlPSBw7xzAbrDaW7nmPM+UOe95VxfqPse1dPfoUetcnnSqtnFGDeRv8/OxpjBOeqc=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(31696002)(36906005)(508600001)(316002)(54906003)(86362001)(36860700001)(82310400003)(16576012)(83380400001)(5660300002)(2906002)(336012)(7636003)(53546011)(426003)(8676002)(31686004)(4326008)(6666004)(110136005)(186003)(70206006)(2616005)(36756003)(7416002)(47076005)(70586007)(8936002)(356005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 21:44:29.2216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ace6b1-2943-46f8-d17d-08d97fa47cb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1914
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/21/21 2:47 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/09/2021 11:42, Bitan Biswas wrote:
>> Add Copyright for below Tegra dt-bindings headers:
>> 1. clock
>> 2. gpio
>> 3. mailbox
>> 4. memory
>> 5. thermal
>> 6. reset
>> 7. pinctrl
> 
> Why? Please explain.
> 
> These are trivial constants, so I doubt there is here any copyright value.
> 
You may see I was adding the missing Copyright of files created by 
Nvidia developers in past. I have not evaluated the copyright value of 
the contents added in the initial check-in. As suggested, I plan to drop 
this patch in any further revisions of patches from this list.

>>   include/dt-bindings/reset/tegra210-car.h            | 4 ++++
>>   include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
>>   include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 4 ++++
>>   include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 4 ++++
>>   22 files changed, 104 insertions(+)
>>
> 
> (...)
> 
>> diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
>> index 930f708aca17..4972cf7e3cf2 100644
>> --- a/include/dt-bindings/memory/tegra30-mc.h
>> +++ b/include/dt-bindings/memory/tegra30-mc.h
>> @@ -1,4 +1,10 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>> + *
>> + * Author: Thierry Reding <treding@nvidia.com>
>> + *
> 
> I am sorry, but that's not entirely how it works. You cannot add only
> selected (stripped) copyrights backwards. If adding, please include all
> copyright holders.
> 

I had emailed the authors(outside Nvidia) asking about additional 
Copyright to add, but did not get response from all. One author was fine 
with adding the Nvidia Copyright. I see now Copyright backwards needs us 
to follow above approach. As mentioned above in my reply to your 
comments I am planning to drop this patch if sending subsequent 
revisions in this patch list.

Thanks for the inputs.

-regards,
  Bitan

