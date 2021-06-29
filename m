Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A64C11F68
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498B961CA3
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhF2KML (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:11 -0400
Received: from mail-bn1nam07on2064.outbound.protection.outlook.com ([40.107.212.64]:26701
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KMK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxmCkenIJfq8c79wlbiUrFDeBfoJymBYiDVufKWYYiXNdqd1yIQGwk31xgFhl+tQvKexcM/nVl0/X/YtgzEaCCOxnUKwdNP/D6K6zCeZ2T4CkC4QShQFSxt8u2N2Jbc67LuIx5/xm1KY65AYPkllXTmGvqpP9PtEghtHNzuO+pEv+IcDMwPOKXU6Wa1NHsqO2uBwUd0Hc43i6cILIAuBFyC8NMXCXVlK3VD4OtGY1mrYkR8Rl+OU3+2t6NnyYjgRCUurxQjKk3j2sRsoj0ozOYzvrjgsoWiqveDx+IuP0AErxo0q0xG2WAPuBm7V8B4XMU+18ej4ixaSTWelITGM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ekBPMXcj7F7wEhgNWtenjothyH8tB8dv5XqwXniApc=;
 b=J+jpAn0/BXT+ECsj/AkhcktxHEDbgNsy8lKkVqhIZY/n1z/gAtruHVNClX2a8MeV8plUHCaIb8qvCUoUXH0ydq7/W5kTxBbZGrzBVviUPkYhVHATFTnOMC1Lq9/zV0pEepZmF37uOfXdxvOwQixrUHZ/VXhzP+PZd+bpB+0iv80zl6E4ki3MZ+VDsNK2XX/NL4+PX6f3io/2MfEfcG414JJm/TtnLOEs1ZYzquWiZbWDeIYE0aXRQU2efCyZyF/zE5aFsnjY4pCIl2RNmo1/2pPX0neyoZpo6Hx9EcdljOPEtw8z1OwwysafUwZmAFmU5C+O7JmsLO5OxrFsJwsO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ekBPMXcj7F7wEhgNWtenjothyH8tB8dv5XqwXniApc=;
 b=SDhciIBf1VYRsHRKjGbyy/ZC3rnY8NHU5nXeCaDYsvF9kSbwAIvzUMc/ynzX6G8PJoNT1WbOdnVe3UDDkLj5+3L1UfCqlFWriSeLvsz0HRMmFK327Q1DTqB6OM2Dp6FwbFQXkwjCL8cGxgDOBsxuHceSWUdlcgR+HUdilw40gaj/uCkTwbE7sidlXarzKPrMiO6rtS5BgA0Jkl0eWbYqeH315pzlMYo6WHaRsg1LhEux2c59T6QLQJuK25EJ83eLYpMyaSD2WFESPssjwK84d5/WgavpOcdGjrB18T5kOp3slWIPvDybGBB2TSqQouLTuAZJYjLBP5p6e7aU91isRA==
Received: from MWHPR01CA0040.prod.exchangelabs.com (2603:10b6:300:101::26) by
 DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.23; Tue, 29 Jun 2021 10:09:41 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::9d) by MWHPR01CA0040.outlook.office365.com
 (2603:10b6:300:101::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:40 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 03:09:39 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:09:39 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:39 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 000/109] 4.19.196-rc1 review
In-Reply-To: <20210628143305.32978-1-sashal@kernel.org>
References: <20210628143305.32978-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <dd22adce474c4176aa1ffafd54e2db48@HQMAIL111.nvidia.com>
Date:   Tue, 29 Jun 2021 10:09:39 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc2f6a84-db92-43d6-07a6-08d93ae60281
X-MS-TrafficTypeDiagnostic: DM6PR12MB3930:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39309BB716089D6FA01EDDF8D9029@DM6PR12MB3930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkJAtOzZ6ahFEbQy0Nic/HGxzWmkmIdyDX5M6Ez44cMOXMgDsyA6l/2e/P9mUcGCBhrbTfSG64/TY28eTrQ+8zbx/cPO3XIDrwEsonlLE6c65TdQ3EPIujwrwjrsvPpvuildkqicj58Ge44DUg2tObU2FxFYb3G2gXxzP0FtQEe8EWAgdm8UxpYbOj+WAK5Ux3qlxrrlejJ6hJioEqEMeLUfnR5fgpV27OToSGkK0IlzPEsw5KaPj6WuM6PVAv6u8wd/5wf34VtNImgg880y8UfMHJjB+3NbroEy1RYTh/HJ+6GFCi35edYPWqdOlT24gr4pgzwBZW0h6PDA8FyyNMLemZxpK129CpBu5xZHI2r4+ssYK4dPopHRWmoBjE1iQD1FEVjOMi2dTiXgkIQtYamOW8OPIvL4r+E9txeZNP5+KKCx5ulkZfaCNtjckAoPiyVRadzAa7KNYEhmcxvF3Sqauh0kJh0+cgHErtSap1gtp+zZBAhwtrrr9tbsQOFyunba8pKcE6IOHyys/Fxfd2XbsDITi31ccOEpbTkmL3KCUM11zRFnoOUNTbdF19t9z3BEkF9ZKaDLOCsx3GgQC9ZVxPbEKVh9SmYOrpWAeyVXGog/v0yBPgQb9bgQ4ynlSMYRAmZLToodScOmprRj9+VwwYpFTs3nZQNoYpnAwCZEiYPyzUaTKmC6e6uU4mTweAyS7WYVTd7aPqkXqlTi3fnJBVKNcI6P0uHq3nBbKIZLXMY6ledrJlNnUvwSaoaChfuB/BtUucEeWQumJhHk6cXnIS/s50KKWdG+gm7kkhoVOxSZHJLxwQnknbevmUlc70eGaHNwcYUvHpsJxHFX6g==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(478600001)(70586007)(336012)(47076005)(70206006)(356005)(2906002)(426003)(82740400003)(36860700001)(86362001)(54906003)(24736004)(108616005)(316002)(7636003)(8936002)(6916009)(5660300002)(4326008)(26005)(966005)(8676002)(82310400003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:40.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2f6a84-db92-43d6-07a6-08d93ae60281
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3930
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:31:16 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.19.196 release.
> There are 109 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:32:48 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.19.y&id2=v4.19.195
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v4.19:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	4.19.196-rc1-g7064c5047691
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
