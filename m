Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313B5C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10FE860187
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 21:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbhIXVxX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 17:53:23 -0400
Received: from mail-dm6nam12on2059.outbound.protection.outlook.com ([40.107.243.59]:4064
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235433AbhIXVxX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 17:53:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gf/HWAYllEgLksVKeR6/YrPThoNL7tYC1rJ9w+X1b3bz6t3WwNpo2yZ/03waFLgzkjWPUApg2iwLcoNG7HNMe0jexdSq2dPmjPwdwrK7vPa7J3kaPIW9AV4hTrFMNPeMwUSbNJddp7WD2PB6iXKqZcbYpC2QTy+LU70jjex8Q4e+PreSI3+fJBXBxv4LpCKMZoBfRToakcGEWlfBg5WPgXGW4iP8gCnbeY7HOTDk9ul0ob8bcX5zdj+A3QwepcWI+84MUM0BGi/IlSE3kwuuv8QaHh7dqy2FmBId7xLzGNiLopazsg2vADUgRvQW1vdjUdAzISIk7Rf2NYvQ9VhoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VN6nh7+XHwVNhByK/JC5c9tGSWYXSz1ieeLXoqhizyE=;
 b=iMauQ29MYLQw688/vhjW69xzc6n8txrAw10AyMUuL+oD/+UiHyjZzB4SCifDW9C+ylJ5gBAcGerfXtHVxvwqxQB0YileER+A9T2L7YSSy1nTkY5SEV2T3CZwIaYuraUmLzkx28vAh+icOXVdW2CN/TmUFWvl2J5Fxi9SFWYL8JINvI07DsErNf4BrFITD7INnLHcfRzZe0IjyVoi2cEUNAXzbwjcdxtTZkmGrUktQjq5Xc4S8JCHJ+2uVhpypTVjxoipSQ3dQkmU54cAIqmB1FW9Hva07Mphv3HN3R8PmcNvFgpiRw1KSUt+OhRlo8OcM/hiPwGiRdPsE7+XPx2DWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6nh7+XHwVNhByK/JC5c9tGSWYXSz1ieeLXoqhizyE=;
 b=cSNGbSG+FtZxbh2TAYgw5nX8YlBW9/5ehxcAvegZ1eF+arx/LG4i4ejtVBem2uK4uP5qCQnpoz06ebw0+o0LXK4kxW4HTkNFt8YrrSxkFGeVWWoZevMhlictaCNaAFctqjC9mdT8XW/fLryr5wiqnAcCP5Nq/ioelVimLNq5X1eZkLRLD5D/PSWmzW/3BPr+hYE0LscYeVeOoRQm97aJp+7a542lki367bh38UGqyqaPrHD2wi6Aba6/3EZJut5s33OBmpySU94S3EoHcjJOIH78zrgNoqL0u8v3tQpNFOxu6JB89jjqVgfQptvjnxqzIUvGgwKjBgCnv2ywMbWjvg==
Received: from BN0PR08CA0023.namprd08.prod.outlook.com (2603:10b6:408:142::17)
 by MN2PR12MB3374.namprd12.prod.outlook.com (2603:10b6:208:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 21:51:46 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::54) by BN0PR08CA0023.outlook.office365.com
 (2603:10b6:408:142::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 21:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 21:51:46 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 14:51:46 -0700
Received: from [10.19.66.38] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 21:51:41 +0000
Subject: Re: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add
 header Copyright
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>,
        <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
 <20210921174434.4839-4-bbiswas@nvidia.com>
 <CAJKOXPeKP6RiGh+VaD=QzcXrjPWU+8JL7=PjFqCM7HtwA2XSog@mail.gmail.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <cf8a0181-580c-3336-735c-61dbc4d7ac25@nvidia.com>
Date:   Fri, 24 Sep 2021 14:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeKP6RiGh+VaD=QzcXrjPWU+8JL7=PjFqCM7HtwA2XSog@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62022ec-8fe7-4547-66d8-08d97fa5817f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3374E77C561C970808AF5934D7A49@MN2PR12MB3374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8DfklZvmlNQsRptAC+/Yzieh5TuPFhR7ZGzmXOMLOQAjro3D9C/sZpvW80ugTGvgMV+iYH/k24exoxIznwH9pqFMueCx3PiJKL6oVU7XBdX8Thae1To+1Fgsv/CDF46d75WhB6K40nWK6dRFLn2JzbvyWwD6FSLIoBZacLgXQ9+Z7W3XbIY1BD79aFRrKcN4fBWYuQnlrUKueGIwrdjy/4Q9fu2QMQdSU8U6LjV9FvU8PqCYLdag2AUjGsI0HPPrlreG2xoK/NR1VvNOaP4oUhyqPlwBEC+EVA6jfnP3ViVF9pyDYb7kS4ZPu6NhZjzkSwt7EPlu9tNvN7Sh31H5CNYgHCHS9FhjYTjhMqOagDRqPv4XOyuh8Gg0LJQB+UWlI2rH3N+Y5ffoD4uD3BJ1zzbZJw54qFOUxmllG/nyANrCzkaEInmbPCOUW2d1h2V8+dC6c5xNEsdliEdrk57Yq+Was8WRtcChjk3Emh7aFbL4E0eCavmqXymuqxmrBemlpWypJc5MZE1Uduug13OM8yUeeX37BZ5tdFY0pZOZe3veRG+jTATARt7rHmSSWHWIOm95U/vVmTHPxSMP6xM3tFp5AwlPT3nFEveVuSiv1RKPRAZ06tuZ1GfPOQHd8sHMIDLlxOHzPhrUCYCVy3Gv/qJ/PzXxILmRwIcbOQhu0rT7u7IdGsoz+9QS+FWI2C9Wz5ah+ftfDF5B33c/IVkdqP+7KHq63ErZeb/obgMGqI=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(508600001)(6666004)(54906003)(83380400001)(2616005)(316002)(82310400003)(16576012)(8676002)(26005)(47076005)(31696002)(426003)(70206006)(336012)(2906002)(6916009)(31686004)(7416002)(16526019)(4326008)(7636003)(36860700001)(356005)(86362001)(53546011)(36756003)(8936002)(5660300002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 21:51:46.6748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d62022ec-8fe7-4547-66d8-08d97fa5817f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3374
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/24/21 12:42 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 21 Sept 2021 at 19:46, Bitan Biswas <bbiswas@nvidia.com> wrote:
>>
>> Add Copyright for below Tegra dt-bindings headers:
>> 1. clock
>> 2. gpio
>> 3. mailbox
>> 4. memory
>> 5. thermal
>> 6. reset
>> 7. pinctrl
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   include/dt-bindings/clock/tegra114-car.h            | 4 ++++
>>   include/dt-bindings/clock/tegra124-car-common.h     | 4 ++++
>>   include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
>>   include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 4 ++++
>>   include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 4 ++++
>>   22 files changed, 104 insertions(+)
> 
> This is the third email (same), so to avoid the confusion and applying
> before answering my comments from the first submission: NAK for this
> series. Please respond to the comments before sending it again.
> 

The subsequent emails were sent as I had misplaced the emails that went 
out first. I apologize for causing the confusion. I plan to reply to all 
the comments before updating the patch list.

-regards,
  Bitan

