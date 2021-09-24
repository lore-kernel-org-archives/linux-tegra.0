Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD36C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 058E2610D1
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhIXWGt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 18:06:49 -0400
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com ([40.107.237.47]:23649
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344595AbhIXWGs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 18:06:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4SuW0ekt69OiwYzZWvrYBUu1U78JugIihtkz/Vty9Tb24CsLF5/d9fUq4ul0tRCbw8Acy2LbvLUnGH0mibhknUE+OIREC25T8pZmKSOG9UtvzWoqlVT/I82fL+pJ04JyUCr7lfLddZd/VLl4dVKK6WuArvweKnGbOeygGneIEz6B9DQ2R0CK8l/hERUfdXQgPKsBSiCsNywfn0KOa040qb1hnnkpLkgfKbfjHisd1W5IH2DrGg2zkHO5+gzlVi3TyWkqhUHJUNbvwgzrVZRonhuLtaAyAZthccQ5QFeQKZhHMAquRhvQbuiW4FbV4plHntdBb3z+nGskeLZxv+ULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cr2FkibpDATaSm6YKOpNxJlPYPaHj+Wu4Mstmn7RGjo=;
 b=X2pxYSnqmsGeWOZCrlOImkjMA9NnFjqVO7mCqyF0DygpkLe5+MKW+6oXCOmi6d77+2T2sZXrE7jW0qM3TOvy9Otpq7q5sEgUxevjLEurqbjzTQ7r2Tzgz3KNeErGkdrFUI8L/XFmwYj8X8T+OIkMFZ0GiZm7nULDzUiJJ1gj5R2M4DdGN9vTLsj3UoNp2jr1dLk9sU41htgd1PU63TebfhMpc11fvfq22WBua6GhLKyuUwwS005G0noKTw998FM7fvd0fE3HPT7m4TptVIXecdN5x+JGMVkiMiKrktv0JOgMZZr4xkr3stVqsnDjImOw3h5YhLDmbfAvE6ZBaOBoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr2FkibpDATaSm6YKOpNxJlPYPaHj+Wu4Mstmn7RGjo=;
 b=VqEDBtfR8O/dn3Qx5+Rq3dt5O5G7ZXKNknbG4fLPRXmvsQz924BnK6leAfZam0Nu2ZIFGFZ/ivso2efG1AqSgtu2jvcYH5Hh9HXu/vqviB5Z7IOAU3jKaBhj9X2CLbQtP2xbvrEbwV+fyi+h+uYtntG4vda+lDTxgCP6od9GNNU/P5cOk3ZvHqEUQH2OCqH/j7b/lLBfRUMqZEP3Kgw7DTTQ6LmGFT+SbqUVfhdlIxx3neatYEcviC422IzAbbzUIIYvMCH88rbZVjYtqzcggcyxaa2OGhLpffLXln+W9z2tUHZVCO1OVVwQQKgEP0G4eRN8gogbQGPQnTFJHh3lEw==
Received: from DM5PR13CA0031.namprd13.prod.outlook.com (2603:10b6:3:7b::17) by
 MWHPR12MB1454.namprd12.prod.outlook.com (2603:10b6:301:11::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Fri, 24 Sep 2021 22:05:13 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::a3) by DM5PR13CA0031.outlook.office365.com
 (2603:10b6:3:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Fri, 24 Sep 2021 22:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 22:05:13 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:05:12 +0000
Received: from [10.19.66.38] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:05:08 +0000
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
 <c2ec765c-f881-17ea-3f9c-cf83ea0313f5@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <9fe647c0-3be8-8bff-cbfb-46ef10fb0b1f@nvidia.com>
Date:   Fri, 24 Sep 2021 15:04:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c2ec765c-f881-17ea-3f9c-cf83ea0313f5@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7cc83c-4651-46fa-e8d9-08d97fa76221
X-MS-TrafficTypeDiagnostic: MWHPR12MB1454:
X-Microsoft-Antispam-PRVS: <MWHPR12MB14547F5BEB5A8A2F8E343035D7A49@MWHPR12MB1454.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4A7Z8WxcX1rMTKsht8iK2R0QUmB0iYYp6+NL9WienE7iGqwxAkksuNjbmUZIf+B7x1gyj6AEI1+WY+nV7ylBYlvjYpQE5qxkhtfY4WHbA109I+ioMhfAltUkZL4US3tYrB84BA0ZKXiT2WkutP0CIAKvo5lHGfONUprOkCI603JLBpulm7hgNLEPYGTP3Vnh6Q/TcctG3aVCKUWtqTgJsJA3SFDSsd9UnellQKNAv5qNaZDdTDtbzIwHpAlnEdMXcAhJPU8vCFkTZv7D6rkhGpuVNCKazQWt6FAOQ9CVcoYrZB0V3CdoAlA4ejilvQrffStE/uRfj4+/oA1Zgd58zoeJuDLjXCw+VAseLeYNzhyl07YJT2kYlZOarRMPOVZYVcnBJArNG30s3TOF4RF+5xqR2lp/00kiSYgpPx5F00yu6N4EBwe72wWQymIigX1CrbbOk2jC9N97uxqN5O3H+CBHgmMQijoMyeD5uWhkOiBTlGK+seKyCZogn0QRjNPfl9yLrl9c193lHL46XOqga2h+6aTE/P7Vre47iyEP4EhDav6h5hBp8mfjkIwEiyfn6205dpNuF+3s669WNGACsusQcVHB2PulO9/jzwozWpEAXyUYdBvfnSswc9XqrEkn0LJez031dSI8O7ZnzeMcVuFbTEgUSBhdFVAxXNVQZFgYSy8vOyOHD5sZ7c0Ndwc3B/ux/B2PXfTVOqmUCqrtwREGHZs2uVr/ZKqVfKiebcs=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(86362001)(508600001)(36860700001)(16526019)(2616005)(31696002)(7416002)(26005)(82310400003)(83380400001)(31686004)(7636003)(426003)(6666004)(336012)(186003)(54906003)(70586007)(70206006)(8676002)(47076005)(8936002)(53546011)(36906005)(356005)(316002)(16576012)(2906002)(110136005)(4326008)(5660300002)(4744005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 22:05:13.1301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7cc83c-4651-46fa-e8d9-08d97fa76221
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1454
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
> It seems you sent the same patchset twice. I already responded to all
> three patches.
> 

Apologize for causing the confusion. I shall update the patch next as 
suggested.

-regards,
  Bitan



