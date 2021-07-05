Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF96FC07E99
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B444261979
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhGESiJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Jul 2021 14:38:09 -0400
Received: from mail-dm6nam12on2083.outbound.protection.outlook.com ([40.107.243.83]:43264
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229757AbhGESiJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Jul 2021 14:38:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwi3DDOFcXJ9VLMXZTjy2ATddyvdZ/NXNpGQogJ5bGCiKiWEoOsiqNXBpbj/mEyJm95RGnQaD9IZKs67j0FuqrLez7Ox8kaZt0BGN3H9Idsv3Qf3toKuQ+YOm1hG+4+qbSfBrQ7gf+8SEkf7oUX0mjdKDDdjTOSxnX66NmY7Q5kRWJqlPTfQEonCR0mfdIApJriLmRVKpSbziI8i9kYYlXo/MMSZ6SUgjjVj/4zVf7vjr+tA+LuB3F6Qz3D+DkzKawOyC4iir+s0L+4CttDRbJs+b+8yUZreCU2XuVhaVjmkFyhTI8Inl7LNcPoOhEjAH9OQqR8aBXucI1ZVTtoSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3GIP01Jx65HI4xerUebOSLd2hyGGhUzuHFhVovh+zY=;
 b=OltArsHFcvX1TmDFAg2hCEuVxnmaGcMB5tLFSgK0qtugWKO9itn59l/sa3/K7CtmoWFI6vjqMlSa88YzZzqfkwG8UP9b3V7dLCuU3dgKRWxmh61Ix45lIAxG6mRzpVYoAG5gxePZlbiIsdmjfTJbwRJdA9yiLQsqEDrEbTN5gsbQbXy6nxjQE/o2pJRp/PsW8wJ21/hLuDPPuhkMefmW3Ei8f/gj5InRRq3/LmlsFi14UX9h1NZ2rKfIaHcNo/4qAW3Tly570RbUMBDfPyt8iwX63sfj1O55WQgFqrEEaqRBwcugf35w+mp5sdScxs5twu8+6nHFzT/1rt7YJMrPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3GIP01Jx65HI4xerUebOSLd2hyGGhUzuHFhVovh+zY=;
 b=LEYLrOg/iE1llmFOgMVrllDyIWqw72Evl1siqfgH78ymRbuu9rBDCHLUR610VdbDNLX5HIFb2GDNg7kj/ikgOfx+CxB20XcTrX4BYioPlRQwTR+lPv7/xgpc2tPAtKfy2FTEtigR1ylk8A3OcSrKEbjm8f8+v1XBspLwHTi6UQGGds/dd+YHNe04kNR+1i21NJCssODUR7d7j1TRewNLyF9jY0ZQcUesdrfBFkDd3GXvOU/moe77BKcrN9k+yWkzsdoF4ewNuxfeQUqq2EfFwgbO6ZXbZeaqACfF0RaNHtb5evdlX/52D3h2dni4nUISvYZzZmqSZ5fL2HCKoFqdNQ==
Received: from DS7PR03CA0138.namprd03.prod.outlook.com (2603:10b6:5:3b4::23)
 by MN2PR12MB3822.namprd12.prod.outlook.com (2603:10b6:208:166::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Mon, 5 Jul
 2021 18:35:28 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::43) by DS7PR03CA0138.outlook.office365.com
 (2603:10b6:5:3b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Mon, 5 Jul 2021 18:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 18:35:28 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Jul
 2021 18:35:26 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 18:35:26 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.12 0/7] 5.12.15-rc1 review
In-Reply-To: <20210705105934.1513188-1-sashal@kernel.org>
References: <20210705105934.1513188-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <22b44813073142f7a22f9f4703f89822@HQMAIL111.nvidia.com>
Date:   Mon, 5 Jul 2021 18:35:26 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 528cca06-b30c-486d-9344-08d93fe3a975
X-MS-TrafficTypeDiagnostic: MN2PR12MB3822:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3822FE9519A42B45F4BE756DD91C9@MN2PR12MB3822.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWGUIn8Jx6W364iX6vbcMZvZY6jnAAdMJbJJKzIlnJbHhfO+7oc8TeKpz20dAujfbwSxWdXZIyqrOQnhjiHDZlti9iemx9ITzDEAVTCVp+rLHJomufU+TgtdHTBohGdkWTB0IR/r0w/w3qvNO529jyiCk/V2pz5+T7MeYeyG9mTYvMho3RUSfJnJdPKUFjNEt5w8JW5ERCKfW5i44f0eqEROzMYO77eTKNACVP0f4nmqM8T8HPEXsf2LUGOoU19yLYEwwpuIuEvaTsjkXs4e/hn3Ds+x116s8aXNBix7rF6rARX6sTGzhgBjEUu8JqMqc0OOm64lzEaV+zFlYW9Gj/H9N4Lwc+tZvRrdQaYtNHNuyxABRGk3aZGST2e1kDrVjYA3k5CsJHXvYWEaZsEyEU1M8257RSV+YVw0gHFpVcm+qtFdk2z/XD+pHetVVCpRU0+SmDqfGA3shuJZ9Qq8EBVUVcSBewRJrcPwwkI9SzWZBIyvkx5agsfGOLy1eBV57KfP7L4G9Q8ZyznB1R7GjBVxC5nUKlLZEPXfUeTAGaPokKzdyXjJT9i1KsFdhElObuMsHxfB/IW+3aQYd2vvGNZoJPwVOsCTBWHNrbdjO+opaaOEokrA88hz6ZmL2OHc8HyNXlhxKTKW3VJrgFA+n8HX5PXwhiil3lJnZ+5IMNUbVqP4MOe0pZfbfnyXyqO6nhx4qlu1pGaFQiKaQuha8HgRCqexQ4JcUV5LCo0+75On+NU7vUopKuwc5GahcMAu8THvEtGVgKTc7p1SfyY9gHyuKISb3pPilDjeY18JLts=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966006)(36840700001)(336012)(478600001)(7636003)(86362001)(6916009)(47076005)(2906002)(316002)(8936002)(966005)(36906005)(426003)(8676002)(186003)(82740400003)(4326008)(5660300002)(54906003)(36860700001)(70586007)(70206006)(26005)(24736004)(82310400003)(108616005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:35:28.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528cca06-b30c-486d-9344-08d93fe3a975
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3822
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 05 Jul 2021 06:59:27 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.12.15 release.
> There are 7 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 07 Jul 2021 10:59:20 AM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.12.y&id2=v5.12.14
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.12.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.12:
    10 builds:	10 pass, 0 fail
    28 boots:	28 pass, 0 fail
    104 tests:	104 pass, 0 fail

Linux version:	5.12.15-rc1-gb9d039f0f2f2
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
