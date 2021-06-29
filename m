Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5F2C11F67
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E010B61CD5
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbhF2KMH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:07 -0400
Received: from mail-bn8nam11on2069.outbound.protection.outlook.com ([40.107.236.69]:40929
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KMH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0z5BH6LuQDFxGxKIY9huT6QlnT0otDVyNuRz8O5W3YdOEIrs91K2AwtlfDBecWLGrYBI2YYYjjPW+WxlvY55y2fgfD1cXLK/i7XQZr/LLsg2KAwprvDRd4Kou6mprDFQcN2jJQv5hzuPs37O3cqKL+ue08c3VuoRaK/9mXW/Z4W9LftazJ45L4hG9cj3lv8KKgAErP4rAAib9nffFUnI0OkV0thrZRHL0/rKS8uf9CpkUfyoh/ls+oyOWc3/WWRHFXaCXBMOFshk+UmEzP20IwBqiVT4LxT5dgahBxEE4xXhbPXmY24IyfYc5w275u/JELZPVG7JP6Wp/RNDxWYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxDgBoTheiaaqvc231K7VLik5qF45r0csiyUOTWq9so=;
 b=DbQ9kS4Fkan+VtUg+FWYSLjL2PFlyu3BhoyBxlLtkTVVXgcVyPzUMtA3txYe6Vqha7NBxMfkR8q5JmWdL7RI3QctoM1ijQSO8GlFRgeQU2VvPukTkqAPqYpGPHLg7nJ2V+21kJen0BEDfGyMQNed/1QWwEu6fGk3o7lOaMhSdWTJEeX8f/jwheG8yOXlmz8bwmwPpIjC+NH6Q6oN7R0Ajt0FLQXfFRbYscOsxpisj4h6N+8td8vt8WMDaC59W/mE4WGePP6OIoYQ4aYpSS7T6mXhxNMa1d9I3lI+H7WIqb0InwwM5xR+45+k7mms4ULs51V1PwInXCai6p6Gl0ATZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernelci.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxDgBoTheiaaqvc231K7VLik5qF45r0csiyUOTWq9so=;
 b=oC+5MUY3SbAz2Hwy4KhzwCGJGAznkQOoyw2Z5nYOGrwHuJIsYXccCZMO/vdkN7CrP7RrvaL0hbiqGYsmn2uXzINrh2BFHc+RLlR15Vc/99cF4dhKzr0XwYKAyJUud3sy2pwZOIZqfORovdqqsz6zm1Ew+gFakUVeud9aAfP7+PPeSGqQhmXYwOmI3DGVontmaEkxmR3U8aOdNrmLuW99oyvhQTVF5hNWMPsB0ca+ZcubsNz23zXqt6k+5H2xcRUjRM05AOB9qfBiDBfojFuqY31bX7H+l9BxdVGSVvuC70z2i0uj4yFbh4nMZRaCK7E3IyXbvLjq7Ouug5Wqd4pB7Q==
Received: from MWHPR17CA0049.namprd17.prod.outlook.com (2603:10b6:300:93::11)
 by DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 10:09:39 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::ff) by MWHPR17CA0049.outlook.office365.com
 (2603:10b6:300:93::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kernelci.org; dkim=none (message not signed)
 header.d=none;kernelci.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:38 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:09:37 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 03:09:36 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.9 00/71] 4.9.274-rc1 review
In-Reply-To: <20210628144003.34260-1-sashal@kernel.org>
References: <20210628144003.34260-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <0a7b75e45cfc4035b9d2e608817ee31e@HQMAIL109.nvidia.com>
Date:   Tue, 29 Jun 2021 03:09:36 -0700
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 798c3c86-b48a-46b5-bcdc-08d93ae60119
X-MS-TrafficTypeDiagnostic: DM6PR12MB4959:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4959F7001CF7399C615C88BAD9029@DM6PR12MB4959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYOAuWZIV0e4kg2wmPkQzxOANHQJIMTBgA9+m8LEwmSclZ8K7is4y5MHNl3XegDoN0MutKfvn+LptpajM/a7GkWrnO4CTBqFD+VRGv77kFymVY18r6fC1bljxDT83i3nL2f/JqauZ7Atsm/P4VJPpufXycPnCf2J9dEjcFdYFRZace/Iv65f6FbrSXaRuvQbCjllwX+AJRQQKxTJdixEwFBGPwG+tbEZs/kmTmxX41iupjQDEU+0U7tGNoCvRnqQSRRBcfkJFuRMOOTLrF3XvuIlrgeb5nOZlz0Od32uOzLXNXijwLHZ6PfWRVKtbsYcGiHRdD5FHamWTRb9zHTyQ7bWrS4Gtpgnb6ZTwzD9od/R4hXaQcqx2DHr4BNr//yJSxK54GMegRukihcYfN7ap+ZSPLbPUKZDlzWOhOKtNld02vCgfloFw2gXmoUvQX1PUcB2bI6gsi/KA4dXAe4ArnVbspyVPwK+EAxvGtuRbE/pKxXMvmsafiaoDl9m65Q1fuUQx/J33a0sohZx9a68v+ZBIace+roigztVYJbA8k0pL2qmHujEwOoqgg3CXijOOw6TfFUg24AuUpQjmBXxIvslwEmIoiY98FX5hip/qwqB2SXGlyggAE9A+awjtgq2U33EB2zhipDbnUVkUJb+DoVhBvSELXhjuCLpq9lc8VlTb6YtRUSHG/8EQiZs916zGMub/qhCzP+Av7yhs4/ibIWSr3vvndVeK8Lrcupaux3CsetD/xVw4tXTt/WnJYifML2HAoYtaFmG/OmAVepoodnurWfQqj/wpBDBDzojMxhMNG7rgnJjp1B+334k36ZfxRG3GSRMd1CVHLord3pBLQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(46966006)(966005)(108616005)(4326008)(86362001)(426003)(82740400003)(24736004)(54906003)(6916009)(356005)(2906002)(26005)(186003)(7636003)(336012)(36860700001)(70586007)(316002)(8936002)(82310400003)(70206006)(478600001)(8676002)(5660300002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:38.3859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798c3c86-b48a-46b5-bcdc-08d93ae60119
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:38:52 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.9.274 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:39:51 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.9.y&id2=v4.9.273
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.9.274-rc1-ga12e33370009
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
