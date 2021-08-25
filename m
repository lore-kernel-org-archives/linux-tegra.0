Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B70C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD89C610C8
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbhHYO1Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:27:16 -0400
Received: from mail-dm6nam11on2048.outbound.protection.outlook.com ([40.107.223.48]:56588
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241737AbhHYO1A (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:27:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF/16sUVcx9SSl44KrXCuy2SkqsandGIRpogc513xppw59JULMhUzdIyo/DlsuPcXONZCljUlcEsbVlKgR4Ct5JjYd3BwX1iSNRUQG9FjGHclFGGxqpZT4HKsuymkpI4D1gFrr079NDK/eAs7iZP6b1q+d0h8g5W4Lry5zdflqROFAovTHCb+RpwDFRuTVu47suU8kOGapQOKY5+6jQ5V7hcEr1u6My99XFYlh/2Z/0Qj5fSt5sXvEyO8woVrokqXCiC0yBa2R5K9NqKiug2hX3Pk/qWiaFdelpweCqp4lCBFjfswsuVJRVQ4qZWq3TmCAwJy7LFNoS4o7J8SLfWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N+nROv35OTmCddOh87O7O/fE+zSuldu6utvs2To41w=;
 b=fA9nnv4NI/Cef21E/6aiRx7wiuUcfxKCFxRUx5TImjvf7O9EJebZkBXmQWp9FVmsp7QlhTiP/0uoUrb99j7pWe748VJsuWqLcNU24w7a2Pz1ui9AFLRw3A6N0LZszgcX1QNaykqRY4ppFYLFP9aifUl1TUFL5UAO8GxFgmUx/BeX+3olvfhHLZAoQ4SPFr1NSFgN0U9ZLf8+vopJxbZ0i5YjKrFtwtLmkrtRt6Tm/3Ilza1uc/OuxWNbISGg4UsC3t9h4LQk1Ef3wLxybYMFjsK45lpFIg7RpArAJXVsY17KiLGf7HB7Y4WQsljoOTW9OwNpmw+HzWHJ8Fylpy4/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N+nROv35OTmCddOh87O7O/fE+zSuldu6utvs2To41w=;
 b=APECWzqRMUG/VoI5z6cjmNH6ptVve/go8OzZs1ZWZoMf/Ycme3ATVitZ0VeFWpeMfcY4818C7zJPCI+A/jFEq3sKDKKzw59UTQTjF5Qmxt1GJqx0c/6utkhYDSblBb8hWcVoTzf+wO3J/g5pCsx4PeEdGr374BEYciIL5heWQEbc7J0v4S9dDCX53c6xB9VmLNIynZHbGGlJvZ5iQZ+0Vx6WBdTo/ZN6MhUJm6GYnkfQ2smvqbPGpd/AQVdtyp/+PEKeBkQWVi/HHPvN5v8Xv3/jYMc6bvrd9r8SCv8Ob2amF/u1CvlPKpS277TVoQd5UQqsiRXdtnQit+Kpu1bhkg==
Received: from BN9PR03CA0107.namprd03.prod.outlook.com (2603:10b6:408:fd::22)
 by DM6PR12MB3531.namprd12.prod.outlook.com (2603:10b6:5:18b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 14:26:13 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::ea) by BN9PR03CA0107.outlook.office365.com
 (2603:10b6:408:fd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 14:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:26:12 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:26:11 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:26:11 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.13 000/127] 5.13.13-rc1 review
In-Reply-To: <20210824165607.709387-1-sashal@kernel.org>
References: <20210824165607.709387-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <c101c11ddc9a41df93cf84f454a3fca3@HQMAIL107.nvidia.com>
Date:   Wed, 25 Aug 2021 14:26:11 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c12993a2-509d-43a4-598c-08d967d44a78
X-MS-TrafficTypeDiagnostic: DM6PR12MB3531:
X-Microsoft-Antispam-PRVS: <DM6PR12MB35311D165CBCA0D43277C55DD9C69@DM6PR12MB3531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4N6rUWGedKJ2k2fzMZGDeM7FlV3evGh1AgMno6LlcE3r8fydOcmBb3CXmte4i4v1LbIq+cTMEJBaYzOzPattpyqdAk5ABy8RnUm8Wl88c+J/sgIVyTT2/fK5LRLVmzJ5svaAxtxpsFs/l91VkX0AjCgH4xozfdb9NlaXjFP7/IuQw9Vy7QfCIiE4YNxTFYFAwYlBbM998EkJDgM56D3UhKbxrBRleGiY+37bjOmkhpU8txMPEPrB6uSAzjHxBrNMm+um5OqdSN4tKy5SMX/5oCCcjgSp8uABk2L6za6FXFyNKlHeGFm2/ktC/BVRD8VAuK30xW63akRvDo+Km+nEGQc9jDHWk6iKk7miHoUQS8LR/tOGRo+amhbxMwhMTnQ2vbh1jGne6nxJgHF1Z9jQOgTKlAVRGuyK4qseOpxtx9B6yqyfs6Fy6ANdYwDEjxVEwvtJMWGZJDmN3d/get+pbkNJGmuGcrfcziJaILH7kRG8rRAIeRRryWZGXnNkfpxSnvoIAYsVze6QzrqLv1k0kZykHXyNOJJhblyHWNjVsIh//WbAF0VpzUEuN9gT8reNiXrFjLUDo5pNrRcmQ4QGMFzMX5BsS1fo7di1mrgYFHfPUFFbsVBmvr373Esv9G7wDHxcq0eUvAE5A5KQ6tOrl2Cq05hPtQUCPF1T5OZhwyFtLyW02jMz64sJ/yYIebKmrZLFgE74iJfcq1kKPRQjLRDHC98SJvv7QnfyaPnQ5cTJUQE9Hx6YHgL17a23K2hb4DyZKlMNKsmkxKouaKqEqr5+RXPdpBp/G4Ptu9yxms=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(82740400003)(966005)(7636003)(8936002)(70586007)(70206006)(26005)(426003)(86362001)(2906002)(356005)(36860700001)(6916009)(47076005)(336012)(186003)(316002)(108616005)(5660300002)(24736004)(54906003)(36906005)(8676002)(4326008)(478600001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:26:12.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12993a2-509d-43a4-598c-08d967d44a78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3531
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 12:54:00 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.13.13 release.
> There are 127 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 04:55:18 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.13.y&id2=v5.13.12
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.13.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.13:
    10 builds:	10 pass, 0 fail
    28 boots:	28 pass, 0 fail
    110 tests:	110 pass, 0 fail

Linux version:	5.13.13-rc1-gb85f43f33b05
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
