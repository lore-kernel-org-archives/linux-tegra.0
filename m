Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5731DC48BE5
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Jun 2021 08:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39A1661246
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Jun 2021 08:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFPIZI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Jun 2021 04:25:08 -0400
Received: from mail-dm6nam10on2077.outbound.protection.outlook.com ([40.107.93.77]:46816
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231344AbhFPIZI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Jun 2021 04:25:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jENV0d9/UEb7I5bk8HeSN/jnuCygk9e2QxYTwqt/2KHq+13/wy1liwwVW4TxReO4a/JlhpAVXVdUCXtjZsJ9s4TO5wwOi4/8fZn0KTflkFbZw4upK/mSlrcMm3cYk6811d5f3hG/PBOm6PnJbBGxFW79tUWRVRygpzNLD2dBVERUFiHj3lKl6uCkzSmE5uAQl7qwIFsLTw+zKiJpbF5X/iX5o5kqHLrUNW5VvZUcO8htoHxVyQOh6nS7BxJus+edchXFUgnd5aWWDIZoLvidkaIonSA/H9xHHiAYN4Srs5+/6FL1MnY/AGN0cd9gA39lIC4YwPgXngyu1e1JbYG4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akI1zLQoznswz9hkFz+LJVLnBVK9V4K3XZr+7fISQAQ=;
 b=h/LuiQ4gPFgM5AyK/ab159WRglXO7pGsGwBHYnp7ikgt/3fTEpsB8YBa/cCJEVZEEOzLsfBpjSXKMjMJz5Ht35MF8fryGW3WIU0RI0WNv1UVW4bWy4UF6Ni8L45dsrtK10FrsX0iOVlUt1o/cG2Imi8zLN83XdZ/jZrXWlog4QkHP/9Ri/UJ0jLdrBRZuRGMwI2txAaIZ+sWjVgBGFZ/O2Cex+xz3UfGE0elietSA/1Xcr5pwPMZfNqmUZypA8Vz3Na3hNkeqEpUSWr/AP3dk5XydqeZJTmyxmSksEmgXhwp6rRjSmwhcOpfby5pvfsjlalCM0CKe/etLHYl3xYRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akI1zLQoznswz9hkFz+LJVLnBVK9V4K3XZr+7fISQAQ=;
 b=GJAO+8oJStKLi9HgN+lCobY7gQbNSWI7fMy/TZpz4Hl0DvxIM9r5S7vEfsRjygWuPPMBJIMKzFdTnfK5zv6DoUQEvXSCyC0U9yndjvoV4n3Fv41W93ePWteGqI25XrG/MPlovhVqlndQ7VT3ydt2PE6l2h37qRSHzOthKGDeNfnitYtWbS2KzcQqNvEB39rVcu+midIqYbr+Uw9Wncx2CNorIkuwnzXbCcnCP4Db/Qb1PnZ4Vek/8ixqyrFW5wrlnAGLHewcUENLnublA6JxlHVaOcH2Cv6UaNxgJJ8kh9ooOo8JNVGGXfJ3fY6tWJt2/JeRMD6e+5swqDwtHHvhgA==
Received: from DM6PR01CA0006.prod.exchangelabs.com (2603:10b6:5:296::11) by
 BL0PR12MB4674.namprd12.prod.outlook.com (2603:10b6:207:38::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21; Wed, 16 Jun 2021 08:23:01 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::a3) by DM6PR01CA0006.outlook.office365.com
 (2603:10b6:5:296::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.25 via Frontend
 Transport; Wed, 16 Jun 2021 08:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 08:23:00 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 08:22:59 +0000
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.13-rc6
To:     Olof Johansson <olof@lixom.net>,
        Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
CC:     <arm@kernel.org>, <soc@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210608121457.3202430-1-thierry.reding@gmail.com>
 <20210615152405.GC11724@lx2k>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a7eacf1c-a3d5-34e3-beb9-c5f61e8c3f1f@nvidia.com>
Date:   Wed, 16 Jun 2021 09:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615152405.GC11724@lx2k>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0841dd92-1931-41ec-73a9-08d9309ff487
X-MS-TrafficTypeDiagnostic: BL0PR12MB4674:
X-Microsoft-Antispam-PRVS: <BL0PR12MB467426FFF912E6103CBC1873D90F9@BL0PR12MB4674.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcm/nuBtV/uhh5OhXNsuArTShTtCgLZBjxDollTEozyQMgSmYIFFXFr5eECOa5rha7E5+EDfYy/2JXPm2Jp+akXb/5L0koHuJUYebu6tTcOskwPcRJDXqXpwIEt786VbUw73SoKcO8OQUWH3LqC0GetP9UERUUyJXWejTzVFrRrYLssiHldzxd57FOOpADjm8EU3X1dx3etXjdDKy1HljOkZYlLiZqCt9aJeQU3z+S7dLsBaxRzBNXcTQpV5nuqd0erXTC4VVlfZY0LVrQwxvsI8vmfk3uP2v2i0GtoeJxbFhR9rnXWZuufjgQiN5GqJPPW0GCOHCDIqg+h1F++qSsfywKXvPtN2qwBQNb3AWfbOTEpnchs07hcTMquYh1Z2MhHEchu+hG8LTLcvVwJNNC3xFc5tNnP0q6eSI3sjpJwhkYjnIBXSluJrZnJkcl536oWpLBRVMploLZXa+wSyp2/CrXrfDP4hobOjK3OC8wveRWQA5t8TDWjtuFD2pxpoFBpk44wMX/mxTLAiEkDqT5lLxE3jCJpy4RPn8Ss0CoqY2XD7qXaSSNJ/wC/XY2QsPfST7a1e5c5c4wxZfQE43piu2/gru39flzsGDWYoLFHJBczKKg0oJNwOZtbPaOTPnz9pJHkX+QZRBE1BzVPW+YmJCXAe/Ob17B/Vo9Jn6fx9j3OChcy8UFV36aFbb7gm
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(86362001)(8936002)(31696002)(36756003)(336012)(5660300002)(53546011)(70206006)(83380400001)(16526019)(7636003)(478600001)(70586007)(47076005)(36860700001)(110136005)(36906005)(316002)(82310400003)(16576012)(26005)(8676002)(31686004)(4326008)(54906003)(2616005)(426003)(2906002)(6666004)(186003)(356005)(82740400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 08:23:00.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0841dd92-1931-41ec-73a9-08d9309ff487
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4674
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 15/06/2021 16:24, Olof Johansson wrote:
> Hi,
> 
> 
> On Tue, Jun 08, 2021 at 02:14:57PM +0200, Thierry Reding wrote:
>> Hi ARM SoC maintainers,
>>
>>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt-fixes
>>
>> for you to fetch changes up to 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1:
>>
>>   arm64: tegra: Add PMU node for Tegra194 (2021-05-28 17:45:38 +0200)
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
>> arm64: tegra: Fixes for v5.13-rc6
>>
>> This contains a single fix to eliminate an error message during boot
>> caused by the lack of a PMU device tree node on Tegra194.
> 
> This doesn't seem to be a regression, so I'll queue it up for next release.

So although populating the PMU node does not appear to be fixing a
regression, the reason why Thierry sent this as a fix for v5.13, is
because we noticed a new kernel error message with v5.13 because the PMU
node is missing and this is causing a test that checks for errors on
boot to fail. So it indirectly fixes an error message we are seeing.

Cheers
Jon

-- 
nvpublic
