Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B30C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:19:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D59861260
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhIXWVN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 18:21:13 -0400
Received: from mail-bn7nam10on2065.outbound.protection.outlook.com ([40.107.92.65]:64960
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230139AbhIXWVM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 18:21:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI3VxjVJC8GfzTQAjKTdiDRAlAkPfc4f8ycHfZYF653Pq+KJlFt0nqaCgAcd87tWPvmAKzg/7V49FDHSFUxsFAW30pv2icUuWXfbQwP+Ma9A1IoK/urSsc9wSZ/ZT88FpoNxQwoj9x3RTcBO2mWcZi0EUlL7W5TZVXn62Lp/wEAn87yssy8UJbxBOlp7hiyblEqixftbvav1wTp3qMkAev2MmvjMZraUV6hR/VGXfe+xnrwvyYTXLEINXZeDSSsA+o90IHDUij2WcyHyGYFGj8StDd60bDSBcuII5zraD+QUlndoh4zV7O2gwz48YZ9IeFPc4mrUaKuuqPTVGWGQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=htRey7x7gQDChcq1ymgqS6ndOOBv9Oae3yoD2prFfNg=;
 b=OnH9qWOACkUkVNSdV/3r8z3+DJfLeYh1x5HrEvmgBPvrn2Ox07jz63S8Si/u3WI1KtAuFMT2SyOt7VjR97UNMMPcI84yGZsuM1bMXPk8trVwTjLSk4ot4BfAn0jutXXxX7aLLOcQDbJfZK26M7YLAm8gss4ULn4Q+53UmGN/i5nht+UuFOfOKlpGC1OreaDrIskxIxXn0zFSGoN2d23Yg2C0Bn6uJ/5z7aA6ahSD5oc2xM5MTATX8aX8ciisDRb7Kw+7udAfQbf+edFCG60/UC4kZspxjoAjSZJOY4CD8Jq3IRJLhhn24jrYbEnAmYppq0R6rYmlk8/xE4U9iX8c0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=codethink.co.uk smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htRey7x7gQDChcq1ymgqS6ndOOBv9Oae3yoD2prFfNg=;
 b=ec/9yYONIOzeYiLjWffz8a+Kj2e7g01QdMMZc7YnoyBxiqyL0lHOg0tO5d7mvgIOK/hl1tQu86XvkEBS46FcBi81hi9LdfmTKdwauThyw6lCuPSHrCnupVLBfffo+eUdQOIHPdQmya4lJjRkaZ0YR7OiVqJXumhoywOgARRlahNI3fMNBx/RJ7XZspqjhhSsgawBaSlv+Ml+P1JVih0K/SXgh1iP2qLQ6eJjaEdwuNHUe3F626WS7XKEJCvPF9jowR5IOPEPgaxOWL11KBbD6f+WepokZPaZNeulFlALx1ESvspAJvwHZjURoOV8hKTO6EqUdTS95s4Z4MBbmuwxDQ==
Received: from DS7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:3b8::26)
 by PH0PR12MB5450.namprd12.prod.outlook.com (2603:10b6:510:e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 22:19:33 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::23) by DS7PR03CA0021.outlook.office365.com
 (2603:10b6:5:3b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 22:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; codethink.co.uk; dkim=none (message not signed)
 header.d=none;codethink.co.uk; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 22:19:32 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:19:11 +0000
Received: from [10.19.66.38] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:19:07 +0000
Subject: Re: [PATCH V1 2/3] trace: events: tegra_apb_dma: add SPDX license
 identifier
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
        <linux-tegra@vger.kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
 <20210921094206.2632-3-bbiswas@nvidia.com>
 <17f1827a-5919-271d-ef00-d2e95d046226@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <54dcd3b7-0374-a98d-d6e8-887e85f2c49f@nvidia.com>
Date:   Fri, 24 Sep 2021 15:18:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <17f1827a-5919-271d-ef00-d2e95d046226@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b27594b1-ce09-47e1-ac23-08d97fa96297
X-MS-TrafficTypeDiagnostic: PH0PR12MB5450:
X-Microsoft-Antispam-PRVS: <PH0PR12MB545086C52089F85FBBD5F944D7A49@PH0PR12MB5450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzdF27OH1JJmcvjR2tdsH/iHwCCups1Zph7MReuUHtvhLE7ktr9Phh9Q2qWlnLnjDz/CLPTTjAEfYvXvPQg69RdiihaCuZvk+cW9cGkZJJpAVud5QmIxvumYisHbgsLf2Ws9S7GB78qa59cXiTCr75LmJv6D4c4HGJ/hMYdc32xN+Bs/dt7BVXXCLLTRmJUol2r/fMxNzOpH01hK3gJT0MC5KO6zLAlIhCEDq+mZbZ6byyKqB6yR6ljBUN2NUJSilAzSo1t7KJDeyxMbYnrnXjRIsEEgdsPZnofq52lzUsnOSat4KWtJI6QDWLstuKlC1n4sLfzVV+e/3zgwLbP/+7hvmK4EYrNSPRVup4xo7+TtcAer51fx91PNiozpgApGIInSChNqKCgzWRU8HOjvDwNRItkaIfcc8MiwVi+JM4I6EKNZzBKpoJhFbf0+c4B2bO4cold0zqHMl0eivG3dWp5EBdgnHU5ivFj7wOfgvIATo/vvtsCvcMcVcmEDc7WSaTghbTmNXmw/z9ux+uk0k8Qo8rg5TnkX1Yu5ZaTAXMIIKHv2vtZoZwjy0if6PJI8yLPLAH1iIk5UfmFlGElTNIwW/ReJ+T9MGVq39F+agtMAhUYU7afez5wsDSJHOrtrk8El/+WLze32UAEVQo5CnVHZYlQEFRC0vgf4yBmslRExhZW/H+SBg/q/ijxFkbFUXAauM7Y1c6Ew2HIJ6zLbrXmODqlC8tI5vCIMyxorQE0=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(31686004)(2906002)(53546011)(7636003)(508600001)(186003)(47076005)(26005)(8676002)(31696002)(4744005)(8936002)(6666004)(16526019)(70586007)(4326008)(82310400003)(54906003)(5660300002)(336012)(110136005)(356005)(316002)(16576012)(2616005)(36756003)(426003)(36906005)(86362001)(70206006)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 22:19:32.8854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b27594b1-ce09-47e1-ac23-08d97fa96297
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5450
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/21/21 2:51 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/09/2021 11:42, Bitan Biswas wrote:
>> Add GPL license in Tegra apb dma trace header file.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   include/trace/events/tegra_apb_dma.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/trace/events/tegra_apb_dma.h b/include/trace/events/tegra_apb_dma.h
>> index 971cd02d2daf..fe10897b00b8 100644
>> --- a/include/trace/events/tegra_apb_dma.h
>> +++ b/include/trace/events/tegra_apb_dma.h
>> @@ -1,3 +1,4 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Looks good, but you should Cc the copyrights holder (Ben) to be nice and
> friendly.
> 

Thanks for the comment and help adding Ben in CC. I shall follow your 
guidance in future.


-regards,
  Bitan
