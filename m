Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DB5C4320E
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D00DE61058
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241577AbhHYO0w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:26:52 -0400
Received: from mail-mw2nam08on2089.outbound.protection.outlook.com ([40.107.101.89]:15712
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241684AbhHYO0p (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:26:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMImLS2gXzeaJLVNS895LOi1WwiyBMDrNSGXhkyw11EbNMc8xTdwBpw6aJcMjFjz6Rea4+TOfNC+IsNsfvq6RHpW05wLm6L183SPjQVnyHcERdAnyUFLNue6Utf6tT0RHyq8GtdDocY4UaD+Nu6uo0xXGzU1odiBHPSxbXgJSOLTqIVPnJtz0pvmAJFDWX4qhvOJmmRVZmGfkBRffKQD33A3BvQ9FfqDHyF4dhrqeSJwQlHuCmJ/YllAP8QkOH102IzqswKkMjVPRSUyJgz3AlwUu+7lv8XBpN+KtvZ04x0BI5qD0R7m3DtI9KqDieu9ZR9o4SzpX2fupoycH18nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Q6zSFVvce/ppLWNMmf1XoCVqWM5SX793cwFIsIJaY=;
 b=Iq9UsIQKLsNud/EdMKsZyaYckKAxWvOZLiK/zl1klvgpVSB2kG3GByooouG3NnTFCiMhx0AEn8yvmwYH1QcHBT0XSj5k1jcGQy8+nfoS4jb7e6rSYqHqBx7QFhvohjIJLS2j5onswZtwpjdEwr1vNK8Brr3AjWGBGv8fLaXu+WXg3Ede8CT3pq6KJ17iFFocP/fcg8t+ptTrTCNFopBPNrQNlWbSzBSclx36jdoAOiNsPEfxZTkBB1cmSKhUSxUvYiS6gloKt7CYhBLK+h6KrZW0d2yDAm4vNgHOJ/EYuxI6QP1xHLl4yfVf351/zleHYsxWZSD/lQZML7ZoR8SRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Q6zSFVvce/ppLWNMmf1XoCVqWM5SX793cwFIsIJaY=;
 b=eZDAIMh0kaS2LNp68YKm30eN+zFzcCFQ8i4YxIoWdiIg8AMmpa3nehVBtgglUS2/Zemq2q5DOFJRTy9kPsVfMjPNpG38WX9t4NLzO8ChDtYX9PcLfnOKziUdCBFJrH74vucK368H6fKXwVrGD8nL0ws5yXYIOYp7Vgx+3FXiYGhF99fIz3GYJbWQ7sh4HzlzFTq/v28AqufgWKrlhYrXmIt3DkS9Z7gNLHbtIfinARPUrmz0H+x0wBuKXAz/pKLn76YfFA17ixGYryq+1uMB3r5OjWAUw7zWqzWTaRxB9MMNDI+IcjpdkMx7x4WF9Fh3uPX7bUaExRPLmprPSHIfVA==
Received: from DM6PR06CA0036.namprd06.prod.outlook.com (2603:10b6:5:120::49)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 14:25:55 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::bf) by DM6PR06CA0036.outlook.office365.com
 (2603:10b6:5:120::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:25:55 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:25:54 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:25:54 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:54 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.10 00/98] 5.10.61-rc1 review
In-Reply-To: <20210824165908.709932-1-sashal@kernel.org>
References: <20210824165908.709932-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <36c240bb74324768967af176b1ca72f2@HQMAIL111.nvidia.com>
Date:   Wed, 25 Aug 2021 14:25:54 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcd5a13c-6cdd-48ff-60c4-08d967d43fdf
X-MS-TrafficTypeDiagnostic: DM6PR12MB4107:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4107613904A340EE5AF7EB3AD9C69@DM6PR12MB4107.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8D23qam5c7n9cwwzvkvfpCBoZGECdthD0S51LsJZJhvd2EIfQaPgLjUXN+rdsjJarAx4Sy1DW0MrOVg6su4mEsyKUiyR4wd1qyGe8JEf2ZDRpt//5guwmV1WO2jccVjzWG0XlMUd02HCB12uCXVQKy8q9J4vxgiOBZFEQRssrOCcueYLv/PQ/xiuPRdQ2SZRQA61XI9ZlxKbaqU/fapjQVbfNKMWXfAXM6KesqKZE4TmHVUuHxM1/jYlD2oJ6wrUGdxPFvi6kCAucw8H0rdbDeG4dZCbehOBAK3GhMmr55iutROtJU6UO9oOi8qPJqwfN3nn01okg63xRSqH7S/aFdfT01/zte2IKsI+B+iYBnIbJslu5tOkhIb7PT1Nqn/XqO+xkmnt0ILUpgsjzfUzrsbldGQizBgfnKbsa6Y+/hASEwSCfXze9JOpT9VBDIDDgyRyxFp3DtuHNG3ujS8kHy/YMssHrzSwm24N2GG/ZZRJ9Wh+Suu7V0gu7ITeW+MavffXeoCrpCOeB8lkG3kWOt1fc26xc0CYpSWyfRCB1al2r+7LyoVTTH7j7faPFY4jZ0AoY53FCD5/RsixB50CFXftP+uc/P9W0DCp7DpeWGEKkV68ZD3MtxoHRYtQyd+yj9tcJkJCXQmFPbQ8FTC4ldkMdRoDZ00uraxPH+hSL/DDFOrIGezo6UELrgQ90658kcZ+FPsTVpU8hzSjKYi1O6Y2YmMsdoTkZo8bMyoL79Dqk+Ldhc/WDJEci8W+aymxB4AjmNX2/O4AZ5j8/caVmF4Nb8qHAX5JZqrG1xS7YQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(36860700001)(5660300002)(2906002)(6916009)(82740400003)(86362001)(356005)(7636003)(186003)(26005)(426003)(336012)(24736004)(108616005)(966005)(4326008)(478600001)(70586007)(70206006)(82310400003)(54906003)(316002)(47076005)(36906005)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:25:55.0878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd5a13c-6cdd-48ff-60c4-08d967d43fdf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 12:57:30 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.10.61 release.
> There are 98 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 04:58:25 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.10.y&id2=v5.10.60
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
    75 tests:	75 pass, 0 fail

Linux version:	5.10.61-rc1-gbd3eb40a9de7
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
