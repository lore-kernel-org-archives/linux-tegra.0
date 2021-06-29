Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550D9C11F66
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A80661DC1
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhF2KX6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:23:58 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:16097
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232694AbhF2KX6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:23:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+3IwXs8XfS+MfikHBGrJw5q2mFpWhfd4UEb71bYDr4Y/qhCjBTnMGZRyVwD52tQ9Qhrc1shh5h2EU7rEvy9zNmj29uLvGWF6tzbFRxTDyKCljMqJ3HA2e+jcRCXqWNn8M1/U23k80NeXaZ1/ndN5Ss4my7IM1bQ19hmFrvoUKkQbfXjgM05DkQZvZBGoJ8HzmZd/cTWDFpG4a0uqOdwleTY5LQNpLp1bacn1DiupqhpcY50zMIM4c/96lfsKp+2Cn7LK62Xxpdn3bqy6JL2MCUY68UqiNFlk0M2qaH69bcc5SymCVMBSgPbpmmXwr/aYWI6ErimAXTwD+T6/EWShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgGlxNGThm9Bact/upuqPfK3vNQmw7aHbEYUnQmYZ6s=;
 b=MN5b3CE0RKpJmNdHynEj/DsM7rztCLfvxWPVqM07DX9DpfI3zxIayWUBJUaQ1fS5l06Je3V0rH9g90XAjpW7ci7+dr1C1W2O4uSV5iUtbSSzwsQXPdVzRJL79K9pMOZpafTv5LQOHscPZ8vig4pMZ/q5LOMKYVYWJTErLF2MnUEjVP8o6C6kcT8RbEOxjUUhsdlsmdH886ocLge69JMqDEwaS/yuHA5opSrx2RaJZgnFu552Auk8M7D+k+arXrRanKyDLVD6b/QeFkTbJvnNbTSWDzTcKF43fnr3ChkXSm3KtRxOu4HtQRYQIye5radYsoOos+iZ2SrGm8IBoiRlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernelci.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgGlxNGThm9Bact/upuqPfK3vNQmw7aHbEYUnQmYZ6s=;
 b=cCD+dMfEj9vlcKHfFgEos6F2jFsHemSzZJr84lfaBFFqM2p03yoGqne9KLS+Gmu8FJfUKi9FTUBCwVDGfsUZcdQBYJKHB0zrI94PdsI0t5nZ/1infm1cWSN3jEnYW/aW3ILacF6nPt0EN9q/evKBDwz9V53rtx2Gm7qtbqTSUtWrdjpgtsqpBkhOYmW1eRZ2jHEpLSu3BjJw97HJoVoccP/+0AcFMiucmElZY8dxuCFuM6VcN61DSeuQLGisoUL5bnduDrAD7XMMdl1GOoqcF1k9YeaGZkA/ObUMpaWUaXzSylx42ANgQ+aqsdnf9VDhqP4alwrXMI8yk+hsMpF8kA==
Received: from CO1PR15CA0089.namprd15.prod.outlook.com (2603:10b6:101:20::33)
 by MWHPR12MB1677.namprd12.prod.outlook.com (2603:10b6:301:11::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 10:21:28 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::bf) by CO1PR15CA0089.outlook.office365.com
 (2603:10b6:101:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 10:21:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kernelci.org; dkim=none (message not signed)
 header.d=none;kernelci.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:21:27 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:21:26 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:21:26 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 00/71] 5.4.129-rc1 review
In-Reply-To: <20210628143004.32596-1-sashal@kernel.org>
References: <20210628143004.32596-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <36c14b6105a4442ca72d811e140dc625@HQMAIL105.nvidia.com>
Date:   Tue, 29 Jun 2021 10:21:26 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 532f81b6-43b7-47bf-2f55-08d93ae7a7f5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1677:
X-Microsoft-Antispam-PRVS: <MWHPR12MB16779CF906E5C215B1E6A194D9029@MWHPR12MB1677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JDtn/k3jVKd4nMant3TgYW1Zvpto6ILXAM6Lcf2ztMClkClv8T0WwfTQCiT5nvlIivDBPIz0SxUe5XUxDbTquw4hxRssICKAL+u63QuVJ5lALLKZQS5RlJRE7u60UOBTEE/1+pnvzKIy7NLmh6o303Auz6nZbcdLmKUvlAl3xB+9Bq5Zt1IM//erMI72E4LbZ/FqbYKEdmHe0+TsFoT5xuP7tcL99KJwJL8n1R7OwGgHynqsc9RUoH6DYaULqyZ321MzPB79Z7OSuRX464nvHBfd/SZWT9pY2WqJo6SsZRIiVA+/3VveBO9r4DKZCdI/OeOQFRVy04XtEoFTZHYJY+M/Y729tPZqQsUZhpWAUUcYmnUB+5cyN6CfBMeTF6sZbYzsL5dN5g5YrksdEvf772/yadM43mvfJa6i4n+P2yL6wfaRCk5743n56PzJSK/ydTv40omTtd6jp4xGr0PkPOWB2EpklEQ1N648bE2k8++0ZPajo9GWGReq62P0piXa9A/YFtVKYdUBXhhPc42cRftRw66xx+WomXh4pawSiJ9NG9QCpv0x6txqNSxgY+KysbFtOB3mDacgXo0cuRFinBuykXXrybHZ+XtgNKOOTzjRjrYlbrmWDX4y5096XX01JDQ1ioX84vMW79xsyuYgEumZRsRlXoGw3RWWyFLbztlK0+Hq9ocGZxKppvI/acHJTAW8ZnPzr4vni4AZMJeV643rQiM6EotluvY7SIiHlT896AbElBeyZ79AiwE3NmknjS95io0jtLjsCFhWsqGf64iHpaungp6YwvmvxhgjcrY7DVgRRmABRKCmt81a7jie1GQtzX6fjDMKcOwlTlYhwg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(478600001)(70586007)(70206006)(316002)(5660300002)(4326008)(426003)(6916009)(54906003)(336012)(2906002)(82310400003)(86362001)(8936002)(8676002)(356005)(7636003)(82740400003)(36860700001)(47076005)(108616005)(186003)(26005)(966005)(24736004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:21:27.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532f81b6-43b7-47bf-2f55-08d93ae7a7f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1677
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:28:53 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.4.129 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:29:43 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.4.y&id2=v5.4.128
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v5.4:
    12 builds:	12 pass, 0 fail
    26 boots:	26 pass, 0 fail
    59 tests:	59 pass, 0 fail

Linux version:	5.4.129-rc1-gaeef06043807
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
