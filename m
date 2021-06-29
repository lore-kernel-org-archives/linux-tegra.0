Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30013C11F66
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10AF361DC1
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbhF2KMM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:12 -0400
Received: from mail-dm6nam12on2040.outbound.protection.outlook.com ([40.107.243.40]:64992
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KML (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlChBfwku4qKPW5QVATJFYeFzHJauf6JFCFFg7BwZockGXnXx0trvsOmLfxdTJpBTjwlpF3ClEMAFISKUFfXJq1tzb0XO3izu4BI9Z6Twua+Cc3emyX/3pisNP+QFoOOAuR8/3L/0CH7QRpvbkfG6XR/ggefUVs7P+yEODXarPAsvP6kFrjErKIK8+xBpwMWvwu88IprV0G2GxW+O91Za+H1mWl366TZoFtMXHXVEghnrWZ6K/FphPVovhhvhW3PeFGKgMjePXlSv8XXtif/KWXnBcu/oBlsjojLlHNfVuSb3Bu0Jg9YjsrDW5xcLQPaO/HqSyYnDQArQClDj9Pq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZFwPY16I3JJbPY33mKKhOLYKBIVAIsHgL6TANOCEAE=;
 b=GRUR0GqUSFLdGe9fsjApAV5JeiENntzvYQh/K9rpbEWutEe+tRZUkVwmAYsAtkm5LrV7gKA3CWLMcBi5xKQMh0F3JmkH49gWxqVBxVeUlf3o8x9Vu+Iph6ZWuDGbQjZ0Q2LWM+uS/erHOboW+7NC05/21gDI2Pex2gkq+tFmi5aWybO0PxZ/yKLt7qFsjp3N6LnpE1kj0ocotrB34uKblGs34pq02iq0GluSg7YRgSfArz6n4QloJCOe91TJCSjJwONhFQ/XqSoBdqtt06TghttlJxpMTBxLRixqgwFcCtEMmjM7A7gZd/1X+PFnXP5JmQJlO8Ds8aM3XyYsXPTDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=codethink.co.uk smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZFwPY16I3JJbPY33mKKhOLYKBIVAIsHgL6TANOCEAE=;
 b=spldERuFXvFA30BKK2QYhlFDCnsfLeJ19N078hMnlFf4i1jqgNO+lwf6zOHyiF5iTM76iIsDyk9fBe6C5vd8LuRXWgZvmtwbNbF4M+FiqyMXAdo6ZceVinuGyCBt1R1yRYGkSba76TRBRomm6U+9OV3SgvYR85TdeSPUBOpdg7uht1lUeaDx3gZC6VAjoCAMc9t/ynZGOSxSo80uC5NQGQ5SqO401Y3Zd8CF+192OajzGxeVv0B4XPFEMdVVulsTPu0rmXSpGpKFwSUGJVEgJCo5mMf2HFMxLqGwOBsXWlg2m1Q+pikIxPJ9IBncENxa3mDBamwfgtEstyvYiYNkfA==
Received: from MWHPR01CA0044.prod.exchangelabs.com (2603:10b6:300:101::30) by
 DM6PR12MB3548.namprd12.prod.outlook.com (2603:10b6:5:180::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19; Tue, 29 Jun 2021 10:09:42 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::49) by MWHPR01CA0044.outlook.office365.com
 (2603:10b6:300:101::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; codethink.co.uk; dkim=none (message not signed)
 header.d=none;codethink.co.uk; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:41 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 03:09:40 -0700
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:40 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.12 000/110] 5.12.14-rc1 review
In-Reply-To: <20210628141828.31757-1-sashal@kernel.org>
References: <20210628141828.31757-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <f2a623d7c54c482fa5297166675b9693@HQMAIL111.nvidia.com>
Date:   Tue, 29 Jun 2021 10:09:40 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bca77b0-346f-4caf-3e55-08d93ae60317
X-MS-TrafficTypeDiagnostic: DM6PR12MB3548:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3548710FCD6996046D50BDFCD9029@DM6PR12MB3548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QuX3jn+lGma54ZBcGzKHEUEodNnPl4wXQh2qdNHQrj3KHnjg1CkWuuZwwsbm6zhEsfnoa3cZYitHLmiWnEVQL2pgYC3y6DSnZPIk3Mhw5PpEzqWXjvDuNUVodNAwq61+RxSrizUiwhDMBPOkZprMV2Ms5LJq2cXABSMaBo/9XDsBOye2eRtJ6HiAYYmethJHslDKfMvyy0nPzdnC41QjrCf06rrt+Q0jz/8hHbE1XEYds50AuOK0V+01FnJpTWpAZ8mDrZiCxanWkTTyI4L7vG+2PGrVFh1WnCU8a0st2e6jcFQSavddpeToj7uS6z1ym2pcg61Ww+rINkPiHP2kU3JBSaXGwlJDf9Qnvy3XB1M0fpJUH7moJ4pZzwe7TcpbYXcQloyPCEzwUf/LRHIwElugvKsyPJnXuXJemO5nw4II93kTBhvHWD5PXDuPJTwbZkqPVrJCJ/217A+E6okYnRfsyfsymnFqdv+5TlV2dbc68rpD3AsWIBTsiCg0gZd2ejO+5RU9IPxIJifhkaAbU4V+ks+f6pqt1TeNgvKJGqqeSdUecexdhQ4eIVz7b1QNITrpV9dCYMc/6LJmDPNAefKBPCH7FHsg81yRyWQVbNGrkVSSpUmJwij4qAQ8lmqqJlhcmqeJBjUSzDz43iV9cwmp5oFcL1Mrm8BLRafXFZFR9VLHRTOUTILEMJpCPOfId5lXuFnuc8XpA/xVxExBxoaCoNwR9rqcwkLiWon6vpWCn2CD6YpKMtP3cQKvCF15Qwd8EoFRFZTPRut2w/UinyK139HNBHDIFM9w17b6HVFom9T5YrsCOWRgnm2w6vuHg3k97Fcv7jSs+0xiM1VFHw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(966005)(316002)(6916009)(336012)(426003)(8936002)(54906003)(478600001)(82740400003)(70206006)(26005)(86362001)(4326008)(70586007)(2906002)(47076005)(8676002)(24736004)(108616005)(186003)(7636003)(356005)(82310400003)(5660300002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:41.7290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bca77b0-346f-4caf-3e55-08d93ae60317
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3548
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:16:38 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.12.14 release.
> There are 110 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:18:05 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.12.y&id2=v5.12.13
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.12.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.12:
    12 builds:	12 pass, 0 fail
    28 boots:	28 pass, 0 fail
    104 tests:	104 pass, 0 fail

Linux version:	5.12.14-rc1-g5f4499a4d0cb
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
