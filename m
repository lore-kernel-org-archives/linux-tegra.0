Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC6DC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 921E6611C8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344187AbhIXWAy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 18:00:54 -0400
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com ([40.107.243.42]:50272
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344020AbhIXWAw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 18:00:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqFQjfe4dU9rq+Ukeqk1I0aDx/rA4vEJV3mYpx2f99VdxwVjYWZA/p62CovEEprhA4Yl34x7B/6cQRqQKg7/RxA6PkRYKYnCVrnI7OFTVF3ttDciYqg3hC4usFE/G+pKCXn+XxkwQOV/6BtzjbWc1J+8qBYR0cGa2Y/tgJcWfy+RJchkb2vefqZwz3xrR0bYNN3PpXzC6/sBSU0HfCv2Masf3X5D61dT+e7WvHXtOuYBr5J0oVOMpp+js27jVIcVnx7DsLa2rbXDRajSglAIiHWwHg3hbEl7KyBKZWAK+y9qlUJisVvGdtBW179Hg1u49NUGs3JpXKeCz+aJ3PbjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lilIE5mx20BHnLSUNeKeeVqRsDnVxBCn5XDg0kYm/CY=;
 b=I1VFle0xpWoJiUwvPdKenfjwSg/Tdovhn+TQGMSHy0Tyapc3CzLQFubNSqo3j+av/dXhwN48dKfP8YPlhot0Lz2EjrZ8fnSaAPGZgnPK5/EHRAeFeuLyKPgGv7NSwxdlFSqsWtQ38QiaJOVYBw28vxoFcx6oLMOlYO5BH/W0bhFrUr1AP03eLj2sHaVJ8U4kVyi6ShKgQLbStHv4kWoIitBgiVd1uzO9tXBfIJVLCrfQtTUhTt3YV4wYL3wLNeEPXzcWHvP4PFATvpTi1h2hgWo7AyUqnRO0aB2nEob+9BUoYT96kHkXDSnRtDn+koKbNox7bmPVGA5Ii5FkR8qnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lilIE5mx20BHnLSUNeKeeVqRsDnVxBCn5XDg0kYm/CY=;
 b=tpGKbCUL2+n5NUWSoohrwN8mZzORiW9vylN/ZkEONAz4Ramd723dmB1+7p3DKpb98jQfWNEFeg6y5ttHjqRsLHs8UlDJUr2ZK4llS63MCUvzyPSJe4FX5Kugb5MIV3eesQUG1RNl8zplVFXDrQHMMy9qq52n8GW/6CzcTXjCxtD1eTE9hsLEmP4XqvPivfQB435lnrLXUppaptGUf6udbpQchiXnZGEhS14BK2qkrn3ri/wYowjmy4uQyrk7NPDevWlUqSStdAAWMxUdKr2NCp82qaTjmpAh3cUm0JmUFu3N0/dSmUH3rvFVUKDQlJszxsD2n6TlLUtFjOY84hhmzw==
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 24 Sep
 2021 21:59:18 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::46) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.17 via Frontend
 Transport; Fri, 24 Sep 2021 21:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 21:59:17 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 21:59:15 +0000
Received: from [10.19.66.38] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 21:59:10 +0000
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
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
        <linux-tegra@vger.kernel.org>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
 <20210921094206.2632-2-bbiswas@nvidia.com>
 <176ba3a3-5179-56b6-081a-6c93493b207b@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <ff162145-f587-dfa5-0dfc-9a598da2558e@nvidia.com>
Date:   Fri, 24 Sep 2021 14:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <176ba3a3-5179-56b6-081a-6c93493b207b@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a9c08d-22f9-4d04-ea44-08d97fa68e7c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5031:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5031947094E2C531C13EA8BDD7A49@BL1PR12MB5031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vgkuNPca5Z5HmXQJxagGrqzieEWoddw6CX6zysA/NaBFUeBkzzEGqEX51U848JeAzcRWQXr79V7YJGLR50gfFRGzkDOGfoWcHYDQST4dTg2jx4WwKOqHg4GPK4cXIy/rEvkS6NQzhnLzCmEPLBLG6+vjG1Trw2nkhsOWQmT4E7hkkJmGqr1kqQW90mjyU8TR/GQeMJp/O/IKSqq3RfQ4F4564IHBGtisQP3kZibXAjxRygQOISa/bhbZdZ+KRQ7Sp1QVgdjyzGqDxAhvPM8+Q9iUWiDQkq0ROrAH1Md3N5de6D+jO3+IkAgX/ir7U7J3ThLDg5QJZSsRkflZ/NSsmYRmAli6ALOvLNg9X4QIUThdJk8vpCYxVt9Efen009Nhjr9P1dCOVJoN16bEHkWsketKBhsmYNljC0SSa4lJRUQ5X3hSslKNk4daP6emVo11QtvHuS0cvAIKKVCIPwl9IG3g5K+vxIQsr7qkr8Gab7cDBxEu0qJRKAgNiIjHyyo5hYFRAIp3mnO2qEhoZge8MzUFZH9ovHv16Opo2dGnThwMXlry1QYZy6X3RK9qjttdIa7qCGk5+yTzkih9CYvLKdm4Z8gX54ZdsPE7NAkkkAFZhrSwDsGeRdzJypIfjG4g7gUQ+62LqEjOar4R7tsGeP5/qpOVR+2LGJk5isdJOb+9wqKegrsBP5h0M8vCdqOepeEP4878rPK1Un0EAKR/yqbAvhSMi+PnrIdXUQrPdHA=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36906005)(2616005)(16576012)(316002)(82310400003)(356005)(426003)(6666004)(36860700001)(508600001)(336012)(8676002)(47076005)(70586007)(31686004)(83380400001)(54906003)(110136005)(8936002)(7416002)(26005)(5660300002)(86362001)(31696002)(4326008)(2906002)(53546011)(186003)(36756003)(7636003)(16526019)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 21:59:17.9536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a9c08d-22f9-4d04-ea44-08d97fa68e7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/21/21 2:49 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/09/2021 11:42, Bitan Biswas wrote:
>> Add Dual licensing SPDX license identifier for tegra186,tegra194
>> memory and bpmp-thermal headers.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   include/dt-bindings/memory/tegra186-mc.h            | 1 +
>>
>> diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
>> index 82a1e27f7357..be313d3790ae 100644
>> --- a/include/dt-bindings/memory/tegra186-mc.h
>> +++ b/include/dt-bindings/memory/tegra186-mc.h
>> @@ -1,3 +1,4 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>   #ifndef DT_BINDINGS_MEMORY_TEGRA186_MC_H
>>   #define DT_BINDINGS_MEMORY_TEGRA186_MC_H
>>
> 
> The files were licensed as GPL-2.0 only, so you are effectively
> re-licensing them. I guess this is ok, as you act on behalf of copyright
> holders, but please state it in the commit message.
> 

I shall update the commit message next stating that files are being 
re-licensed acting on behalf of Copyright holders.

Thanks for the review.

-regards,
  Bitan

