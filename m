Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3695DC11F66
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1620B61DC9
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhF2KMU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:20 -0400
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com ([40.107.94.60]:46071
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KMU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB4JVWpd5AM0bhVIAAaNC95V0Q9M2yUVkjXkXOchATgwlYCT0d93WP0G9O339HXSFtAoU+4BUlxE1vO8ZUFmFH05TWCS4BSkh6E8DZlOhsNZikvoPQCIgoxgFgVtC1m/yvxhsu/+7Lc/Pl0ozgd3V3hswavWb/evbEBHNe9GB5Lza28hEEOvKde3iQeR7UesKFRV8Y57z6kFvuB23/ATjUDeemTV1omDMRF/lxbvnsOlv7qXjIIpWfSsJqKuMXclCLSMdBeGZhtoQwLrUlnWY5wKQ+cmv5LrvICf5xnTs/CwrSlvPNmZULTWAwb1Ltis0jVaIm4+bNs4np+PxIr0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LahNC1zVwhTZlMy+xXQn+M4x0XsYc2IaTu6PAr+5CNo=;
 b=YmZDD4MArf8/Nit9VOWdtkrqUqAMm2lzzt78BaNooDXiAmnGX3i3pqAyIj/rnc1CUzQ7jhg4zHx7qWicX2yv+bwyv0K7u3YcCMWYWTXkVMTsMEQ02liHORAiPJhqluVqcjGEkceaxcJ7OyAG4ElFqojMMn4vt3G3qbS/54bOd+bsrmLIrVKmJ3+5sV5zT5RElpQ95uE6O0+SAQ9tiScnr/aC3F/6+fjF+H6TlIrlVNPlR4ind5GJcXWLkC2H3kNjfYuA3dnJdRxMex6O16H1VGm3YoxYsId+oi84UO22vIrQxlzhSNnHuLFD3a7N1aKHJvARpijGKgvpCsBZE+18ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernelci.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LahNC1zVwhTZlMy+xXQn+M4x0XsYc2IaTu6PAr+5CNo=;
 b=kq+GykDe0kdAuvZOTf78tFQrSqcOZX6YXkISOqhOZjF4gej0C0VU3vlyNF1Cm6IcD9rJ2le2VC8RjyjnZq5mEp/bTF+L0VVl81fVLGA6WZAwFgmII018XI48NQAbKTprhtjpFenlSTO5pM4/phUEeUCSj/SVxM2pECDr5jK8GaSsTf3S8udFmHEzLnCp/ED/kFjUptlxtxj3hixT0qJUNlC+XFl5y8wxlAtuWL/2B5hSuejmkiBYccmjto24MqyHcA4qJf3Q1Rl0qtY9alJKr82B8lhQwKBkgLtqovql92yNyemX+RHG3y9wjes0z70bhNZwxNjz7Dz1hH/hgUxLBQ==
Received: from MWHPR1401CA0016.namprd14.prod.outlook.com
 (2603:10b6:301:4b::26) by BY5PR12MB4257.namprd12.prod.outlook.com
 (2603:10b6:a03:20f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Tue, 29 Jun
 2021 10:09:51 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::4d) by MWHPR1401CA0016.outlook.office365.com
 (2603:10b6:301:4b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernelci.org; dkim=none (message not signed)
 header.d=none;kernelci.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:50 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 03:09:49 -0700
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:49 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.10 000/101] 5.10.47-rc1 review
In-Reply-To: <20210628142607.32218-1-sashal@kernel.org>
References: <20210628142607.32218-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <76d92d93b938465a9dedd471a9180d16@HQMAIL111.nvidia.com>
Date:   Tue, 29 Jun 2021 10:09:49 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd6f9954-7400-4996-df0b-08d93ae60850
X-MS-TrafficTypeDiagnostic: BY5PR12MB4257:
X-Microsoft-Antispam-PRVS: <BY5PR12MB42578D490D92F66DD6857C24D9029@BY5PR12MB4257.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AJ3U7GtH4SijDHMBiezr2H7PU/DY9glB6UP8of+EhWhqdWQsN48ssovlAlIe63bemytso1Bf8uktm5JRd3X0prLKdFT1gPMizMbuasXGVg9FAOT8+91K2wYDEitlwNXGH5qqTLPivXwMM0wRAfkbhI02ezRSslcsRqJDROs/UheaTLrZPq+cz2OGVb9T5fQlL+Ud4g9spvU9Eu9KeaD0jynahPK4ez7BaLAVS+rBGTu4cZSqKPHseYp/jLexPvhIzBqsQ0tYJWJ54dHDpfQuzo5l4GNXED7PpiGOtU2f2ASn9wUDaecD9jAfjQDCphRz4jY3JjXDZJBuakSN05ZhiNmOdG3UbFLvCeyt/ujtl8BRMgn4FIwy3Z+wnbFm5clGuY1dhNC87oXCkBMLth5kkSm/iX2G2Yp6ScJomwL3HXVWoqZAuti+D+3wB80saLr1xDiuql/SG39mK4t0IlOXGHNRMBAHSbm2pNW5hJkDJiamjiPujywDW2/eAhqQT7NMSMiLmYhlQkcPuS38JPvZtvqqtDApzlDgoBr5phQqQzhmHLo4AUu3bUiXhia/hJ7o/B+xISzr1//hnKXykUwnd41un8zJighemGFEQxO1nOyevUVj1wOAIhCEX5PPOJRZhbukD0CqB285EagIRmilt+MsNgr+2aH/lZW4tZ6ixLw1Pm3G4EFoa2v8r+OcyyIWO+xTEJK8fHvIMoBPs3pWhkxtDSFN9YScarTAE0MAGneLKQk3zM3+z9WMoOcuIy3CDEo/voeyiQMGLcSTUyrpDDzkxHL8erQTQjbvTWMuUWALL/3u5k7MZlLnTGCduoGzikIVm5UwExYAZE+l21kTg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(36840700001)(82310400003)(8676002)(36860700001)(356005)(7636003)(70206006)(70586007)(5660300002)(8936002)(186003)(966005)(4326008)(316002)(426003)(26005)(478600001)(54906003)(47076005)(82740400003)(336012)(86362001)(6916009)(108616005)(24736004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:50.5103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6f9954-7400-4996-df0b-08d93ae60850
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:24:26 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.10.47 release.
> There are 101 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:25:36 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.10.y&id2=v5.10.46
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.10:
    12 builds:	12 pass, 0 fail
    28 boots:	28 pass, 0 fail
    70 tests:	70 pass, 0 fail

Linux version:	5.10.47-rc1-ga41d5119dc1e
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
