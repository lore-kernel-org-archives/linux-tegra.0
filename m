Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBF8C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3568610F8
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240515AbhHYOZu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:25:50 -0400
Received: from mail-mw2nam12on2083.outbound.protection.outlook.com ([40.107.244.83]:34465
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240327AbhHYOZl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:25:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMZ0CoR7o0kBkiDRrNJlcI0CzwW1xSxaxZwLRQSTPvdn5bOy835ICmX/B72Ms3IS+jwxeAwDZ4xeO/8i8hn1RDLWOBUNNPJJ8czJEmH+ASssR9sRq65JzznQhXQ9MPjR+rpVdyJmyaigb4EdEd5c3Z1RUvC6cp8jDuVaB9nna324/oMcMVYFZJwmQzFbafC7e16zY15ekIHig2sGfNPPo40tCIRinnHdGte6zEvP5SAC41Y3sUFSdoOoD3bJnBO1BY55Xi25EeM4rA7aBdJmspVm40eIT2r3P+5wWTyAC7v4H7qs8g21tYL9JCKL034E/rx7edpx6xg8n2+CUP0Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wTUxJV2Fmq++bxTppSDRF+GnvVqV+tx/ZbYbNv6S6I=;
 b=d1R9cXgmrVOTnvq8JIkoGsJp/bWuoVsbUrgIR1jzXRhmky0VsHzdkvXGEh7cTkcEsAKId//jEtTKejjDbaSpBnVAJBx02wFjJAPo0gv/2vPuMw3Bqxh4FJdwMDT3hJ8j5guiBP9hnS3F7dFwnhRHJOcQ/FZ+VbM1oXTsRCIvPnx645wrmGepS5AZQw+C/DbDtiHCa8dCaeZrars8TP95ZUOBBBL9E9b56bZsTJ4bz99AeE0yrj/ZTMqRd8Vig+XVufvfN9Fqq/hPjCLg/H4yPAKjcPsNfxBhwj1sPQDc8Or9c950pKPXenmhYPER4T1A7Cq3MSQ0NeY7vjOlM5uaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wTUxJV2Fmq++bxTppSDRF+GnvVqV+tx/ZbYbNv6S6I=;
 b=gIZQHRofAQ/tvaRczpzUDUVI9Vn9C4Sv1AjVKBWCnkkb6/fk5TIkpcySX83TEKwg0jlEKm7IXdPYvhYv7Q/pBhjqJaOcG6Mnkv2iGtad/gqC1wVZlS7ziH+AH3NShqIBLirFkXy0qbskLLUN1o64OhhHLaHvAG6iyMM0lIlvU1BMTiMknMsEbuEirFtdHgZGAwj9qn/sfV4r7+J9lOodTsAJ/9kdqsw4fmrofVL8xIw0vsOCV5ri5nn4Kz0Jk/J4508Lmk/VljmNEJnN+gBsl5InAHANss7fddXQKX1+RJ0/PDYLWSoghEVnL346UUuOxEy4BXNrsqbyFsH9WWh0CQ==
Received: from DM5PR20CA0041.namprd20.prod.outlook.com (2603:10b6:3:13d::27)
 by DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:186::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 14:24:53 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::b) by DM5PR20CA0041.outlook.office365.com
 (2603:10b6:3:13d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:24:53 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:24:52 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:52 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.9 00/43] 4.9.281-rc1 review
In-Reply-To: <20210824170614.710813-1-sashal@kernel.org>
References: <20210824170614.710813-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <e9555a564f12435b8d4f8737f7174557@HQMAIL111.nvidia.com>
Date:   Wed, 25 Aug 2021 14:24:52 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a42f3c9a-4ec6-484d-4452-08d967d41afe
X-MS-TrafficTypeDiagnostic: DM6PR12MB3212:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3212077AD275208B46603AF8D9C69@DM6PR12MB3212.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATTp5NJkqksBQcLE9qMiWqhYtIS46RdX1PqdNDGoTWjrEGgutyCmbkymFaDZ6Ep3yiHCyoY6/LRRs11wxViDSM8Jo4dSdWWJf91fIdlGl4lCDQgxz27p/YbZqGYIibs0VUyAcw6tsSD1/1WXdvczKPWlvCznn+p2FlWxHhHkBmy4gWbIuavyKI9YxApUBO9C2HUFvyCmaZsvnhni3/GrFs85smxEl4k/22CZnKmEPr8QUIS6FrUb3cvsfXuS7GgMiW+IghmkVuI3awM95TjVipbTzawtiamkxFdwcY3WwyrzQbA9sfORu2bYFG2mkVzncDYSepbgizocjON6d/XCkibZG3xoyKse9zyxjsqCypyrEvO3IVJJlWn6U6X//J8L+3ARgH8s799NSvpU2u+bCiZMe9l7QacxIFHhlpXYs0cZWBKZlly2p6pIIuaM7cl5WJQa2emRS7bbDmQdeNGE+0IpkmE4UwQ3rHBDTsWEG83Y47cgIw+Aslrxw/JCJxqq+1fjvKjTiU9Hj7MKoz5PdFkYxLrx4Jo5h4HdzkqQH/HnJ/bqGZpLuSXNQihnGYIzxNnu7vUfczq95B+eutrqTKd45pZJ6s0iifYjEMwIF7S0LfFGdRplffBrckZMqucJshRjShFaCFMg1id6+lPMAGcQyFbZaXGzXXshVHK8Jjy5lCMYrK/UhTwldu/u/ieIlUaz36TrHAgplrLsoytfmU66TsMf6HKS1kisoHil43EQ8rjXNvZmuuORskVt3HOWyR57NXWaTTsMj5cjYP/hWM+eHSRgjYvWS1RrZ1zOdD4=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(82310400003)(5660300002)(4326008)(36860700001)(26005)(966005)(8936002)(2906002)(70586007)(47076005)(8676002)(70206006)(186003)(86362001)(54906003)(7636003)(36906005)(316002)(24736004)(6916009)(82740400003)(108616005)(426003)(336012)(478600001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:24:53.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42f3c9a-4ec6-484d-4452-08d967d41afe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3212
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 13:05:31 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.9.281 release.
> There are 43 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 05:06:11 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.9.y&id2=v4.9.280
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

Linux version:	4.9.281-rc1-g3d204357a2ed
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
