Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF95C07E99
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E09BA61968
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhGEShr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Jul 2021 14:37:47 -0400
Received: from mail-bn8nam12on2069.outbound.protection.outlook.com ([40.107.237.69]:11712
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229757AbhGEShr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Jul 2021 14:37:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dh/EFIOploWSEezIuGMaoiToL20qdCIQnrLJBxBNpGurssyyHqQdoTDUCmjVJHhoA4aS5Z+jLoNvxTCVgNkqrxSYXbNvmLVauSi+gzDlU62jGih6HMXiqAim0jhfhrGTyJ30ZDzb7WQCSVeP5Q7eWPf6yIJOEFz3MTKnctpA8svZCCZbSxMzZhIJ/5chNTDjD/s02ldORyO68cWzQakN3AwqSiKkUHe5AkV8QtJYSImSiakBYVrUS5qasOzF7uKkUvMWyWUXlpkbRyKvkiqwW36vuxnDhwEoCat/9gW9cmRDm82qStA+TB4HMyxBlZIVMlGmQ0/Q+fRVPtHaeavs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waiPMrcPJPew5jAfWAUrp8f1WCTnjfQ38uOJLa2z+og=;
 b=RbaJ4tFW63HXiuFVKbB2/8foWG2pB6Qgqzfwmji7asBquNSdsyDGHGsZU0Ws3oe41rKapma/cKRBkfYPToGeVOUpS+f/ygf1brj1rlDVhS/9uLevqgKcm1qYMh/OadIXeaeNWKHUGYhr5ggC/trAEPS70FBK4klnFvqZ4Npq2iy/P4O2epQQg3mi18sPOo6kga7Z/G9VwjH+I5SzZc4KhthJbbQzuw6OQ8Ijg0gl7JXq6sHG7xOAnBeXnpR6FpFSfAlmbGstZ/7isz36ry9/pIB5jMEdyZjYyjjoscealld8uJ91jUFaRuciTgL62U0Jbr/gzwCifNum8SBY+PsUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waiPMrcPJPew5jAfWAUrp8f1WCTnjfQ38uOJLa2z+og=;
 b=uXwCCywmX5N8wbll9FhZiLshyHk9efRoYNXbLN8mw9W5P77Mcf/pILyRz79j2wi9BDjnvjBbOb3FIOMSjAYhqBiPAjG8aCeO3285Q+5gTZbnRsRHWGzs7NaAsnqpJJdnsDGpb4HoEe8dFK7AwwuifKU/asfol5uWEGsJgEDagCHUNy6gQ1I9udgIo40puustBBS3Mamp+mMxytXC7eAOj+t8bHiWHpaOVe2I6IwhkCnjoL1yWe43xz4LA5vPXT8fiCgl2DlxwsaoCQbfplD+tbxcaf1Tt2X/SaqQYgpotR2HWuZTD8dEYyXSzamEWR3pxQRoCeq3nXxNjGB7snRIrg==
Received: from DS7PR03CA0140.namprd03.prod.outlook.com (2603:10b6:5:3b4::25)
 by CH0PR12MB5172.namprd12.prod.outlook.com (2603:10b6:610:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 18:35:08 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::42) by DS7PR03CA0140.outlook.office365.com
 (2603:10b6:5:3b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Mon, 5 Jul 2021 18:35:08 +0000
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
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 18:35:08 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Jul
 2021 18:35:08 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 11:35:08 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 0/6] 5.4.130-rc1 review
In-Reply-To: <20210705110029.1513384-1-sashal@kernel.org>
References: <20210705110029.1513384-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <46997c87e98c4537b7e0af0c20ffb49c@HQMAIL109.nvidia.com>
Date:   Mon, 5 Jul 2021 11:35:08 -0700
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7d6b036-80cb-4316-a125-08d93fe39dc0
X-MS-TrafficTypeDiagnostic: CH0PR12MB5172:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5172C4AC93259AFF7BC4DA7DD91C9@CH0PR12MB5172.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5Zc3VgCNJaTDeaMDwWNsx3GRSeqmBzt8fTke2S61iFVNnbE9ogT7L1DEgSY2euFZwC4QrJDL/QJUqys6lPdbkwjVkz8lhoyoJ8np4T1i28INE4ON7FaRsqoKGJNimWmFx8TDCX/CcQqmTfx94BGgpfz8h0vy/Lid1gCGkff98Nqk1sYqvAzhYDvJS/pYgEZlqgr5v5HmPSu6QNIa4kzfyj/j6tTqpPepBUkBq6nuVWku6/R9jE99QkOlXcojMtEyCcS2RTw8zMLAyelbOmJBuVUZ3QQHoIJCbUZUNWfjio6SA68X0HtOWSIXXOXvn460Z5yDYaQ/AinAUdZG80bm/cV3D6cpCdK2s/+gtXnZM/NAlfrz485YSfznZnDluOJLiEIs14ek8Nt9vaI3SoPE5DfHnF/UmY0XrvC5CoL25R58ePmIRZRImD/BIeIAnqo2c0koBkidSsfl+Nik//uBB0KzYsYesg6uijkBjmrYCswRmDIT6eWBW4uXbX/nHblkKEvAJo4PU5pAxgaTtG5nLn/T8/oFpai5Ekv4kEEHth6xNVwygXZP1vwJ6AeYcaUDQ5DWe3oqErfqzkCZyDjC1hu9yiGoATK1C39+eLbAVcoUrzbU17G3gNUJR7UvJ4yybw+soBtFu3xyWDIuPnsbAIVcNJN5v+oMF3QYeBIRW8Bk64KTLoq7WzmJSu5EqHEN4BarHNntkO65QLMWR6kwWQ6xSQZOxbfwsfAIxCzyT1RyYM434HiPgdPFV2EpeXNA1Gh/bqCiZTRm5SEEYnn1smBfPofhk43+2ChTE8L3x4=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(7636003)(8936002)(478600001)(2906002)(6916009)(336012)(4326008)(36860700001)(54906003)(426003)(82310400003)(966005)(356005)(108616005)(36906005)(8676002)(26005)(70586007)(316002)(70206006)(86362001)(82740400003)(24736004)(5660300002)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:35:08.5329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d6b036-80cb-4316-a125-08d93fe39dc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5172
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 05 Jul 2021 07:00:23 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.4.130 release.
> There are 6 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 07 Jul 2021 11:00:14 AM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.4.y&id2=v5.4.129
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.4:
    10 builds:	10 pass, 0 fail
    26 boots:	26 pass, 0 fail
    59 tests:	59 pass, 0 fail

Linux version:	5.4.130-rc1-g730ab99d05cb
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
