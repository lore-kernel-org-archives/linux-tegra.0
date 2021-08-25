Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA003C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A99A610CF
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240327AbhHYOZx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:25:53 -0400
Received: from mail-sn1anam02on2077.outbound.protection.outlook.com ([40.107.96.77]:63114
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241495AbhHYOZp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:25:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWbbuunVGlzUtZ2+55AvynpiL+0IgO+OKWfIe5taybZFuqP0oMRUITCH4uAAk2BDIDtwGZrWPrZSpaDGuX8GuFhQl3v5s4Jl2aspXAwnnsJxigXSWrLdI0PgTyFaw/Kiuh8wvTGSwVxmxpHDHhvGCi46/fD1WkAWCRDnfTkUAftgPqMgB5y6o91FXn75pYljDWmCgjJbs3Urkq/I5r90bhvJJdQEdqxgqbL1lKF+7S6pNhR6yYO1Cg7J8TSAjOSRxtnHeKMc3ysHp3R8eABXAmjFsGaZyhgF/IIo+86gjtuA6GfTTa0gPvd7qv4SANSKd2yXpg3i40I3uz/pyHPN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STobh48hwiogOPP+OMn3ZurT0nJRH5vtLNnAm/31iWM=;
 b=AtuuTLQbjAyWShIe16MtVdJQsmI9Ldxw1QvjqVs7j+9Osfk2TKtbegxRAf0Uqpg5wyd9S/mgrPyAzz5J67qu4WvoC3zYbsOLiY+NThXDwOGEz7MuU+bdedKbFEupR3H668Bx+Z1Y4uE+jp2glxkK6lRClh8TAa7BBHinhQAcODGMwoAHhojsqs03vFOa/aEjW41eyg4PQyDzEnGcmNltxwomf2ZNJEpdy8XNrfDwaGh/wClQETNs4NUTI5olithLhVgWwhdI7Q2cUqgh3fwjnyVDYhmq17naR9nOC8TkpaQW7SI1IyiRZ7TN0xNDfHMFk4sxcdStkJj+IFlUfVrHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STobh48hwiogOPP+OMn3ZurT0nJRH5vtLNnAm/31iWM=;
 b=eM4OIxJLcLsN/LcWKW9/Zn/xWo5sdrURVovIwVwgl2nVV9f34RmXxCGYXIMKEp6D0/0izUYatawHBhQwgZFigNyI3/erL2WFZfwAnnGAajTlNsvVkQmTfWtMBEoJGOcXzensrcK1Sp/dgN415mv5HUn9upEDeNU+fO6bAn81tWk4Bopj/V5jaCRqaJspKMnqimvRxjjT9D0VwMegK7INT5AqB6ZI+WQTZNwpWGNoxqI5cf6Bv8hEglWK2M8/UwvJw5frN1Ldy4BhED6TnziDDYLpCiB03BTN3bwv/7z3zpEVo6+tzbNQRJqLVBegOODthv/BCVQaIJmD0+pkk59I1A==
Received: from BN6PR1701CA0018.namprd17.prod.outlook.com
 (2603:10b6:405:15::28) by BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Wed, 25 Aug
 2021 14:24:58 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::ed) by BN6PR1701CA0018.outlook.office365.com
 (2603:10b6:405:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:24:57 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 07:24:57 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:24:57 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:56 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.14 00/64] 4.14.245-rc1 review
In-Reply-To: <20210824170457.710623-1-sashal@kernel.org>
References: <20210824170457.710623-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <317ce8d872f24cb78414eaaea7387da3@HQMAIL107.nvidia.com>
Date:   Wed, 25 Aug 2021 14:24:56 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a6a634-4a88-4f9c-d63a-08d967d41dc9
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB235324C19D0D35FCE31F994AD9C69@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkC/m41iC4HojimA2o2c5joKVSUUQx+CYRpI+M2HartCVd0b/QJWlUes7TvB+Wk8tPO54IILIyrJrjtEG3EwS91jVg3uq8mL8bB6Bsf0wJBX6vp1jLXWVZRb28tZzheEOge5txBVGufT0c+lCHJSU21o4/hHsRiHRVs6DuFZ/ebWDmh/XhA/0UwKQpwORBSl4YzqPA3xmgW31o0K7KQtmucTASmihFmAqRXDg1QF8mtqBMvIiQz29wWtoajlAUdO0uX1Wvc24JH6QaQc+53YjQB3QuMmJwxRTuR2bD+h/dTvagPJ9GkO95GeR+5li20cW1qDw9hsxPdT0yE4qX6cTRib3Jkp1pr0RckXxPp+bJsw6MMd1TdLQ1B7vJuI+nhEkM6jGdTOrdudiyInXKh1KrSJJ7rd4FrzxIfmkBoeoqgJio9M1qaFYba7lpQ6lqXM8EhtTCRGwXx0oy/6eND66oDEUFwJNEfuqJMQAA4nWDf1x/o1DbDN8qgW7bqOEDZTFNkJVV3KO7waI5YejmuKXymvZJWWryXQVp7c2tzTw7xAQrkaYXoepun8ucLBkAK4IReBe5rSTHlD6lNkksqB10HuPwr1yrPbK053E6tV1QtG9HJllT88vrLXE0jAOXDNTAMA2V+rQv/CP/M+1QicFtn6smdQEpLKVVKSO20dNKMLy2etfn8gAMRA9CwIV1uZBlL+KX8uL6tUv1Bg31jZKr6L1yggl1o0UGO5UB/v3GVYwwkbK0NbEVdUJxv5c16YRpeqWUk3M7wiZvjnjPGg9p592+BhHdIWY7bCCxy16ok=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(2906002)(356005)(5660300002)(26005)(7636003)(186003)(47076005)(36860700001)(54906003)(70586007)(24736004)(70206006)(6916009)(86362001)(8676002)(8936002)(426003)(4326008)(336012)(82310400003)(108616005)(316002)(82740400003)(966005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:24:57.8501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a6a634-4a88-4f9c-d63a-08d967d41dc9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 13:03:53 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.14.245 release.
> There are 64 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 05:04:55 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.14.y&id2=v4.14.244
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.14.245-rc1-g156fc46e6ef4
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
