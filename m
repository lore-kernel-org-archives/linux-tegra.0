Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5DEC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F69611C8
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 22:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345028AbhIXWMP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 18:12:15 -0400
Received: from mail-bn1nam07on2050.outbound.protection.outlook.com ([40.107.212.50]:2631
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344932AbhIXWMO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 18:12:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laFfCi9YhqMG9BeapNX1EaL/1/HWCDldd8RJLt1PY9zWOXIDa7c3UUG9XMWRbxrdxpTCgHESJA95PFTPtf4eUmKkUDi2tkm3JeBE96MbwwYy+RbVSfthgiWVVQ6arsG9O0aWJiZ6+x/7INqQpz1+3Nvev5Nuvh4MCSCknPLmaS1y+1JfCGEene0EdNjAjUg19BaXQkiJEP6BR6ob7t1nQbzWBBA8Kr80ORPKyX3xqe5bt+CLRMGeYY8YsMaaxMNa3DUfmlnLdejC1Krf6erJRcjZ45g/0vYF0JWVVKPTY52ADYu3c2qmMBMxmgOVr2mL/bPbjjIU4JTyx5WoJr5/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NICH0hm8La+WhyDrjC7LFMW4ROO8IPTXE94mcJD1BW4=;
 b=LFiK4mQn6Xxb6UvQ/qZkwaHzhb9JGAE6ktXDw8bIkznPlMC/NaExExBEyaoHvjZfFGPfrZPgKjztyqyYvy1V9Jjp1FSH6mPj4WQYx+cWSx6glW9NXcqlazTcDbgS938eh9MacvPZWpmw26wFsqv2cFu1nZAv16LtApSTeX6jgv4sOfQzj4XIBOfXln5V+CiolKSId1jqDO/DNy3Gf/XyvNU/gh8NPkEmUSXU+oRDDYdD3eq4JGfFYTzWMNtuw4iulmkOHsBr5/v4ADgeqdMAKza0VAv0HZ8G13SLoq0abtSz4i7PJuM1Opo8uyO21gote2QmwuSKNTULLG91W07iQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NICH0hm8La+WhyDrjC7LFMW4ROO8IPTXE94mcJD1BW4=;
 b=iE//0MWM9peVDnEkSu/v+M+pZVKi9E8used6ruJIavooXfbMXWx/6LLTC4rPJnMG6EESgsi7XdLxm727W8cqaDp16VaA2WZQQmLsvQ8TAJQOTttdIrnQnAIxaKkpu2He7Sxfx9z1U2SxDIP1P8cUVou4npYlpsd6kBxHouw72i3AKr7qNBR8KXubQx8h5jU6/tExjdDy3gAbdhaEuqfsOQDVms6uN/BVbIKbj2TM076C/9tdijJ0FXVkM1fAsubfV+uX669oeAn2iQzTrbnxwF2uzdDt/+ZjsFZMb9T94yS4fg2i0HaiYLVNrBkLxN25ux94yDHFz86tUYqJt5JNfw==
Received: from DM5PR1101CA0006.namprd11.prod.outlook.com (2603:10b6:4:4c::16)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 22:10:39 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4c:cafe::e1) by DM5PR1101CA0006.outlook.office365.com
 (2603:10b6:4:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 22:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 22:10:39 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 15:10:39 -0700
Received: from [10.19.66.38] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 24 Sep
 2021 22:10:35 +0000
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
 <20210921174434.4839-2-bbiswas@nvidia.com>
 <195c460c-9fb9-f435-4fa8-6d5632f62a5a@canonical.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <73bb6df4-2059-a8c5-a83d-a4b35538871e@nvidia.com>
Date:   Fri, 24 Sep 2021 15:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <195c460c-9fb9-f435-4fa8-6d5632f62a5a@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0846ee15-6cc0-4ab6-6448-08d97fa824cb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4288:
X-Microsoft-Antispam-PRVS: <MN2PR12MB428877803B1DA27F0E682398D7A49@MN2PR12MB4288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRYguHbq7krkUMPIqYR9ABlcFTPhhJpRAFZEjhRhJgDjv7WSyvWY6mreCSs/nmNbIFd/gr49tuYOISsEruAh2ZwsdvO1vqw56A/EaJUDN7vu02HwQp6Xxt/DC1Ux8Zr1dnr/kW7vSft/pnLkf2OWW2hTFOmJdcP4Ge1HO/YYBGMbUR9D7BJr6fBB9TXhklXG3g8Wkj+4Qr7eeEb9If1VwGpEqxFTI+GMeqY/176oeEoFuEMqkQ3SWA2WchDqtAfvinAeUrAKCBKMVsN6Xx4EIR1IASsNLEIm2RAYNzP8fi592NMb8r7FyEnj/ahHgWTwBfuBlM0vxYfuXIbAYIyuK9v9KVknYfGVsh4t6tdbr4w0Cucq3n9rACrHZD+KCZUqybvxIU54N2bBNYpEHPcaY7DrKOIMFZMTyeT7dkwZj8Ev3Qcc6jwyUWfLBQ5TQI2rDkVr6i1RihrMqGC3gT8Iy+yQR9Vf5au/LcNqoyCs3LEcv+DVjnUmJH/bu2Lzk72NSXty4SskblsSpUEtWOAJ1gIDlDr5lUCx9QYJEWQUBdAnAqB6kpjAKrVV1JLZvePg2wDqLFkysizCzfU+ageNKoH456EOhagFRUylUneh2S6NGnIUVSG7bdJGU0ES3Y9qpoFnsQPx6Di3cIysQS3r1WEkl6g6+rpOSFDNgmCqn4ywyu8AGA+ntNCUCwNwhLCrR7IlIT0l+VfZ3GnPj7tE8U8mWfXWnD9V3BqQU7YRpKWjv7v7WDxw//4yCZBBsXVG4dPqd6Hc8uepy1LuAL8/Dah5vmSDmRL9Dtxnd3iQN7UrXnIIooPmH+qi3BCnAvlC
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4744005)(356005)(508600001)(86362001)(7636003)(966005)(36860700001)(53546011)(6666004)(7416002)(426003)(4326008)(5660300002)(316002)(16576012)(336012)(47076005)(82310400003)(31686004)(54906003)(31696002)(70206006)(70586007)(110136005)(8676002)(8936002)(16526019)(2906002)(2616005)(26005)(186003)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 22:10:39.6959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0846ee15-6cc0-4ab6-6448-08d97fa824cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 9/21/21 10:59 AM, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 21/09/2021 19:44, Bitan Biswas wrote:
>> Add Dual licensing SPDX license identifier for tegra186,tegra194
>> memory and bpmp-thermal headers.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   4 files changed, 4 insertions(+)
>>
> 
> Now we got the same v1 patchset for the third time. I think you need to
> check your mail agent...
> 
> https://lore.kernel.org/lkml/?q=bbiswas%40nvidia.com
> 
> 

I realize the oversight and apologize. Plan to take care of comments in 
v1 patchset.

-regards,
  Bitan

