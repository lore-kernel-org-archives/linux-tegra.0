Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A85C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B877610CF
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240652AbhHYO0K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:26:10 -0400
Received: from mail-bn8nam11on2067.outbound.protection.outlook.com ([40.107.236.67]:50624
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239404AbhHYO0J (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:26:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJN8p6hZFFyyytXU5nwSCC4/WGEk0jmcPD9jHvIiH19cPMPkB65ruDwePudVlEDcF+2hAcaoi+O1Pc394UY6xqkD2zuxVjqMKRVIzk43Wzkq5Y+3DEI1YOsLo1lTGOLR62Ukavr6wy5BaMy+UbAAJfCMWYh8TD62omJ6hTujbSRWw/VvZz9HdYsKkYpWZpeuJ0dyWu2lZ0W+kURSIzZQNsdB+D7jWQXpnvoTGs8V/recnAJkssF7HAbPFVNLGrwyXeqOMhLK7fKI3D2B+bxwRuAFevbIfWu3m5BTLuuXDnswmag8RCT8nWfwzcehkmZu6co7mAs3IQNDhPJnxk1IAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWHEnk07Z8P0Ulck7pSy/NtZJqMURI5VSBMSQvnmk90=;
 b=DTEJKcE1ZwY12SsS6dovxNPDJHXJTieSHWoodCRy00Sa6p8/Mg6KLo2hrcFGQlUQwnWJ9GH7QcTrijO28LSlQSB9boDrvEpOxNn3IBsUo/a+qaK4CLBeMXsd8pBZ8791nxg4BNuy9bIGVpxzXcEiiWBxNzfTL2tToltM+FOviAq6NXrbHpf1CWxNIVAxMUUOOu6e/yZZsltRNQ5euF15zByp2UwSZID73bMxtZ01f/2dS7bnkZoP4G5H//neWgBtyAZK2uj2I9artqvEoLrh3T+sddEm8BjChSdhUG+JC9iSB5h/LHVIgZpL6lqikB5Hr0MU2L1zI6fp5crDM8FN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWHEnk07Z8P0Ulck7pSy/NtZJqMURI5VSBMSQvnmk90=;
 b=gcyX3y/kpGlARXiKYkIGuAaeMNvUxPjBrA/b+HwOMIfI0fww7sH6DjhF+M+jYob02e+h1kT7eIe/Ogcf7sgYI5U+vXvUHyiMEjHZVsU9sekDL+G3kquP58MuKbbymnoT63+bmKkgo6XbvL2W/K6JDpfAsAAwJuqld4YUF0DplJuQ9wIJD9O0yuFnMj0Ft4EE8fI8x2DRggpiscYv/D13kfuQZ0H77QNvUj4tjgC6PwJ3NMySLrzOsfVQgR5ZbjU6p2bQz40muaaQqg7epPuhXuTGORWXugVVAvYAx5e+3y/TQCEfeu85ufkgMtEDJHQSO0CxpOK9WcslLEdlDU+y7A==
Received: from BN9PR03CA0857.namprd03.prod.outlook.com (2603:10b6:408:13d::22)
 by DM6PR12MB2843.namprd12.prod.outlook.com (2603:10b6:5:48::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 14:25:22 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::b3) by BN9PR03CA0857.outlook.office365.com
 (2603:10b6:408:13d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:25:20 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 07:25:20 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:25:20 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:20 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 00/84] 4.19.205-rc1 review
In-Reply-To: <20210824170250.710392-1-sashal@kernel.org>
References: <20210824170250.710392-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <a9704af8e99644d88f2e600ced8949e9@HQMAIL101.nvidia.com>
Date:   Wed, 25 Aug 2021 14:25:20 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fae4edcc-2f79-46b4-e295-08d967d42b7c
X-MS-TrafficTypeDiagnostic: DM6PR12MB2843:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2843A03E5CA23FD9A96520E4D9C69@DM6PR12MB2843.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1x958kN4l79MXJNNHkVUVMkwztjvRtEE7VTDfa1Z7rO/Xz9le2PcjAPMN7IPIT38KWwiwfdXf6r5i4TGm8A6lHYuQNc6gr3dsLEJycGlhgFomT+9ZRitzJqIZo5qFPuyKignCAPVmH5ennj3TIUasMqgJe1kXv3L/OL8s+8Obsa7Q74oExx2g0v8FFZirDwwmG+ueJ58GuPDvuKpK5xU22dsWLYfNun/6/9s7xefndqAmycbqWwkIavGd66iFDprlDJrWzJEZ2iCdTDb8y9Sq9MTwQ3/nxoSg5TeD7ta0pX0FhMRkTNOAolKevqJfhTu4S/FDuHbfsNW6PTENCear102ZOqf9cNwIYqTPDiy4NBBRywiMApWSu/v6virKiv/SNpoPZpKA2pOmgj37HD29SIqQoDcpv2VKO/trczFVqDE/ndeU4NqaDC6ohvwjtHmiSei8bw5nLJ9bUNcO5IlsfUxr9SnlfI8xCil11pAg7gVvE8zuhalz7GWWlgAtG01Dyobs7P+OjaxRk5uUqyo0h8S+noaS4SvEYBVZTTs6KGXe5/gfYPQi8jRP3tJ1wsPcGd7KkJYFcRmItW3nmh4hEaWddq+W4sc3WQAU2LmR3TkJFochzUdSg2fSA/G+XJ63nbePwrhGr3KJEoL2KcNagpBB8VwtYWZnnVUme2d6vofzJ17MHvEyGoJ33u7VZ0vqvrg/lDRqKrKAkxWv+SywhUh3ddH9QJQeGR1Fzn5NFBN7dLcPcNU4Z04pKiych0zxG1knd21hIJrHChM5h0BtWQ4AZEfxOhuOqbbtnXuJZ8=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(316002)(54906003)(70586007)(24736004)(108616005)(82310400003)(86362001)(966005)(8936002)(5660300002)(356005)(7636003)(36860700001)(8676002)(2906002)(336012)(47076005)(26005)(508600001)(186003)(6916009)(426003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:25:20.8389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae4edcc-2f79-46b4-e295-08d967d42b7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2843
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 13:01:26 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.19.205 release.
> There are 84 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 05:02:47 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.19.y&id2=v4.19.204
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v4.19:
    10 builds:	10 pass, 0 fail
    22 boots:	22 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	4.19.205-rc1-gc1eea862e3bb
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
