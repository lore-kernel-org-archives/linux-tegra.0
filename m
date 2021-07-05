Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE4FC07E99
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4099961979
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Jul 2021 18:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhGEShv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Jul 2021 14:37:51 -0400
Received: from mail-bn8nam11on2045.outbound.protection.outlook.com ([40.107.236.45]:15201
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229757AbhGEShu (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Jul 2021 14:37:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=di39BmIvMP4g4wX0mPz3dPUq1ws7ixD3UDLwt2Bjof7tGU9CPyxFRYpu8PbgsiL5y+j1H06IHSdPQFIcDQWqnK+9gBpcrf2D2GLy3IGVSB9b6qmftMPjMBvIlPuAPaZirnC50ZoJ5H1UKcrzjhxmAbcsQufQksptm7mkAusuAYyKhzowaEugAQtSwzFWekvksf7ZIr+4HCs/3qhNuTF+Vvhuf10BpsUwXjqJg/k9fzKcD4kAdHafKXdUt8nSgKdPD2u8LZBOBWuGFoJa842XP0HtvyIdxOP/zLju9lnP4WYecGbveV5s7J1EMlZHPhDYp1s1ewc0x94wGUv49UGuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kVgd0oCGCktn7MA0+IddSoJoV3O5/pvg1pgMjjGhhY=;
 b=UZ5emvRQ277RYOTPhPTKPwiUlBrea1JzYetkTKR3hchAnz8QJachLDZRAPPZww+MSlqgaNemGMDd8qzCfSZY7EY3GBRbzibddHmAP3+UidLqNROdYmwRSaZb/b++hl6bXDjO5QOlDhQkRp+GxZycKknRqT8if14wV7y1tJu+lV+y5bYiLpsO1Er7hi5F1MV7tKwd4eL/zyUyNWVxDfJ3sd0bFWfC35Fb5wMMFSMTZmS1w2qXFJIBxdLqCXQw2u03HuNsjfKFVadRLXqYlCq6eaUxcaPyBMn6C2GpAs4SDwn6uFBs4qxm7+HdIKcjIDd7RixAnSwmgM3ZHtYx8h36sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kVgd0oCGCktn7MA0+IddSoJoV3O5/pvg1pgMjjGhhY=;
 b=Q36LwnJNluBOEscab8kj929PVzCam15fx17YECw8FuY4z7akg3mJs8Aes2ILqIdwrMqd3zffjN4vgipsXB51v+MijJFCK8a8OIRwhLrzo0B94y4MOyL08R7tAPXm23ITPTvqtN0TYH+K3ESfGWZWx1i61upFGhV617mXRJxlf+sRUJf9mrUsP8SjceOeLIQnNuiXjVB/Hz6lalK356vISchvo5wSamOylk5SEJSL1YZuZhJCzz3d8uKHbzkGbqy6wLLXc2uI9AnDJq5timha1KIhC9p9XmCIkQr1VJYHDwBeToKpzgDPBLJWwhQqy6iD1WYrXB5M9Rd996JUGxw7AA==
Received: from BN6PR13CA0007.namprd13.prod.outlook.com (2603:10b6:404:10a::17)
 by CY4PR1201MB2484.namprd12.prod.outlook.com (2603:10b6:903:d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 18:35:11 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::89) by BN6PR13CA0007.outlook.office365.com
 (2603:10b6:404:10a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Mon, 5 Jul 2021 18:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 18:35:11 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Jul
 2021 18:35:09 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Jul 2021 18:35:09 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.10 0/7] 5.10.48-rc1 review
In-Reply-To: <20210705105957.1513284-1-sashal@kernel.org>
References: <20210705105957.1513284-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <15343cac702b4df5b5ff6d8346f10b3c@HQMAIL107.nvidia.com>
Date:   Mon, 5 Jul 2021 18:35:09 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74289db3-9702-48d3-fbcd-08d93fe39f6e
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2484:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB24841408FC35ECEB505B83ECD91C9@CY4PR1201MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eYPkuaWtd1W8EP8FX8zsYqa4OooLUjLvkrF7rbu5GiOOiPQGbwn4uhUSCW6UcNkeypiifIMEneAMjJCGO+FS4cnZ/VI3OcViUrenyIcjS1BNK27bRWC4nWCzgksVPNUj/CqgRoiKX7EHmLM+X2CjXHSAEmy294EXUczsJUrM5aHUmNkC3UJblY6jLLKLJchM80yTv0BQLcRzH4J5oFCxOtcTMqWyaiUAwDMhPJEz6lKPqMbFR8Gv2vihedtH8qsODJyI80dEIAdlj7jD5npFNdGE7RIPgKMrXW0wZ/RUIxxeuXHEvvTnhDdYDW/DTsFrRDwoRtcMAgJYbGLUrGRX9PGKQCNzWb9VWZbfVc8sRwc8RVnTVlyU37XICEEvtX4kJu0sDZ25iD7vLS1VeKQVpNNTlr1xJPqoNZS6jAJeiZJSO6Cu23uehsU6bssOe4lpweQunBYd5ipXWcapaB6by/4OhVJAtja7VRDc5FlUHciKA0O9v3o4w5g4m+JJon+3uUj4LTTWsPviMzTe9NiryoSKKUE5bTsSL11RvJkdFfLFJ5dxSHI8F0nx7V6h8CBmxil/mTV4+It4Agdl2KZJovf+qbbuHvhpaYrv8E/LR77IJayVw9Q2X5SKVKp06T8+Yp3Ua5jYzEjVVAUK/1sM3cumITOsvjn3Zv3DFkwP4Ef6Ofs1VHRUIZkrPx/CK4UlrATItWRyYi9Yh5aFDNd959M7JIS8a/MZp9yi/L6JxOS8UDCVomwYj3quz8beElt9rmcupxgIBUeWFfzMJkIniFZAiQRCKo5ZmrmuBRirtY=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(24736004)(108616005)(7636003)(356005)(186003)(2906002)(8676002)(36860700001)(70586007)(26005)(86362001)(5660300002)(70206006)(8936002)(6916009)(336012)(47076005)(54906003)(966005)(36906005)(426003)(316002)(478600001)(4326008)(82740400003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:35:11.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74289db3-9702-48d3-fbcd-08d93fe39f6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2484
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 05 Jul 2021 06:59:50 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.10.48 release.
> There are 7 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 07 Jul 2021 10:59:49 AM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.10.y&id2=v5.10.47
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.10:
    10 builds:	10 pass, 0 fail
    28 boots:	28 pass, 0 fail
    70 tests:	70 pass, 0 fail

Linux version:	5.10.48-rc1-gdd50b7327ff6
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
