Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBBEC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8AB3611C8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344464AbhIXWEa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 18:04:30 -0400
Received: from mail-mw2nam10on2080.outbound.protection.outlook.com ([40.107.94.80]:23041
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344195AbhIXWE3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 18:04:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSZhk42SwCl7AkoiRDEXatOHEGoh7a6CKTVfS+Rre4HUD0C66OM7t7ct0ZqDkU9qjsRVsNQW3VMWPoyemKLiswrHgQEfDRJV0H93moAmRVDn+ZvT9IHNGZ2bRff8AT1XfE827CWVL4EVZa1iSfMtvG1z5pLHpv0yCuWFE/n9uEeau0PD5RDorLHGeVOUb070uoFTZ7dT5P3LStLItOigpFTL8tMluvdt5OUdhSbjGTdUVxvMaFXDci8XZpHHqg0fsR/F0RqpE/DnK5L7Wj7XfV945CejpApsjj6WqLHGfNzM9DarTAomI5CNoyTKXPY04OYJ/GGe/z/WZ4AGEY9zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0QETxZjiVFBNLKvVjghEIH5HUlj8zZtcwWyU8b9bRl8=;
 b=C78S6JzY+USAQKylS8DFHMM/BA6Zvp600IpNC47mEu77aKKqSnyIVaa0nbgC52EFZZxtCzzC4RAh4psGKYMRS62y0Mv+Vrk80RcxniZqndjQJA/niPyBJaGEkMzUOJKoDIbIyuUR9R78L1ql45vd3IuyB3U16iZsOmZuU0+JH5itN/642EDJSBPTnhxq6EOjwk/KADIFsWiguJFS4+BOPB2x8VqOSCf5rlVvvRoXF/0kCtfFx12qu2UR9AKHLBYmY1GF27O9aT9IS+z1awOwo5Dj8AZzn3L6Jk6n7eIAeIK/qZOL4x4AhPJtnmyLSQ6XXryvdW07iz/MEUWhbLN3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QETxZjiVFBNLKvVjghEIH5HUlj8zZtcwWyU8b9bRl8=;
 b=QLSxV8fSMms1XAgCSFEHfLtkAXEBIQKnbowa7JWa5+edwTYJ2aFvhY+u8Pp5eUbz5L/jNF4EVm27teLmC/y+srUlnocilq22roGUGn4NOVdANqkz2fLoFDceJ8TibM6ThMJPB++Nt3aeONC19yVzbgA1rO0MCXzukhnaj/7sflgJ0bri49NdZUt6pTq8CmkPUZnDN80tKIOlC3RYXjAn8MZzH+z5XqwQU27dgOIZBp26XBNPizb+C655ctaBfxNwgUqOYuDMPokHGpY3IXIvi0tLeIlU0Np5psHHkV2a7Ob/GryoP+7RNkVYyx/FHNXxh2piHVOhGmpAB47Jkvk2VA==
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by MN2PR12MB2863.namprd12.prod.outlook.com (2603:10b6:208:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 24 Sep
 2021 22:02:53 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::3d) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 22:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 22:02:53 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:02:53 +0000
Received: from [10.19.66.38] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:02:49 +0000
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20210921112716.3007-1-bbiswas@nvidia.com>
 <20210921112716.3007-2-bbiswas@nvidia.com>
 <8c73dbc0-2678-9c9d-dc29-d4bece29fd08@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <5c04de54-e0a8-1377-8f02-506d4645fc26@nvidia.com>
Date:   Fri, 24 Sep 2021 15:02:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8c73dbc0-2678-9c9d-dc29-d4bece29fd08@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edc1517b-f93a-4bb9-8012-08d97fa70efc
X-MS-TrafficTypeDiagnostic: MN2PR12MB2863:
X-Microsoft-Antispam-PRVS: <MN2PR12MB286322C559C279A91F191B76D7A49@MN2PR12MB2863.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfqIIEba3KY8+nqSq+gTRzX/S8ri0MvS8GAgat+X2W1fX10TlZoykIAUlN/lBsnlC78dDv0++fKgzBU3TTUDcuoLMZYwQTy+qZ3OTwdA2M67l844w9j5h99dK5JxaeZgR+rsaFR8mbP6pgoplmiVW0D6jJfCp1lpBekvgSgAFMGenPcPDhXUoetWzi236fafCVjLNiV/Pi7t47xIlny9wE8bP6hz6iI24rbjSllV4CrIM1nvuwmAQTVqtjvG22O9TYvGLWgsG6gs4m1midygUvfgI9RANbl8ECtPnSToP/detJ7IoUyG6lpvFw0oV2g2junhHfYOahviV7ZVK//6Sqzw3JSAg4xM+VM4s2doBLg42IUY1XWekfOhTFvlZcD/aQRxP8yxLz2lsTXHhikVkcxzYJLFMklMDpLYHU2VCIylEOOIHcI4asLJW/34g87MKZDxLcJ9ZoW8R0zIcX2X/omP/KL51mDbtAqwFXZEM90rqLENhVNJ9f8vJZhFdjw3MZABTBu0Ky3ws07I8v/amvCIeDH8nquNg5D0y2WUpyqlpA73tpxsPsN2bBePKvKkmO9D8V2hd/y8IF+DkBPeF7FYVESaV7vhm/mVk8ApCgjqIGKz1zBEGF+78nGn84vmXcbJYB55FM0oxJV9kc4B9Mbo8hk1lM6JBjwfRnpjsaxBNegsfZyASfozNES+YPLyYssHonPxxeNUiVg135KeTXPtiwwFmzWok8/YScbdGzc=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7416002)(36756003)(336012)(508600001)(426003)(4744005)(110136005)(2906002)(7636003)(5660300002)(36860700001)(186003)(8676002)(16526019)(26005)(31686004)(2616005)(356005)(86362001)(8936002)(4326008)(6666004)(53546011)(36906005)(316002)(47076005)(54906003)(82310400003)(16576012)(31696002)(70206006)(70586007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 22:02:53.6181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc1517b-f93a-4bb9-8012-08d97fa70efc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/21/21 4:34 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/09/2021 13:27, Bitan Biswas wrote:
>> Add Dual licensing SPDX license identifier for tegra186,tegra194
>> memory and bpmp-thermal headers.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   include/dt-bindings/memory/tegra186-mc.h            | 1 +
>>   include/dt-bindings/memory/tegra194-mc.h            | 1 +
>>   include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 1 +
>>   include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 1 +
>>   4 files changed, 4 insertions(+)
>>
> 
> Hi,
> 
> It seems you sent the same patchset twice.
> 

Sorry. I misplaced the emails and sent the patch thrice. I shall be 
careful next.

-regards,
  Bitan




