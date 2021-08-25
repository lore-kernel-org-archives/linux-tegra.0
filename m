Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E612CC4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B8E610C8
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241534AbhHYO0a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:26:30 -0400
Received: from mail-bn7nam10on2088.outbound.protection.outlook.com ([40.107.92.88]:42784
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240850AbhHYO00 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:26:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjsomgWxZduT9KBO/+tfv+zFUKqjdKI9yOgepWYq8ypedco5gV2BPpLwHvnbTlyIOCwMyfawvMXkxekzgdS36Odl/MA6CVbhMA5G0UyP1UeA9GvfA6nTr3GXEpWAZj03hNFv6qXa/HIalmAZRZ6/9k0oWziAHr0Y7kKW38rgAvHUX3qAB+uo8aQGJ7NWLqHYGvJpNvgzlSd2DC/YReSXHdJQZM0HYDxFlYI9RT9WR5gJyoX7wM+m9llKC8G7pYhFTDBYfIAcXEszbtrR+gPYTo28ceRlNBCLvYkVTPGpfSrno6QXoTs6RSoG/uQgYFgKSOYvF4bDepmFDN7UtEmCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P93vYD50LW3BkAvDS6gr5XpHKtUV264K0rdQrA9C6Xs=;
 b=kXKepEweGPX5FJcvgmpcuxXZkp/gPjqTVBNhwNPAxbJXeHz4uB8F2G/qvrtSC4pxVyGQXoAG5IqEyG9tQZem5ArcEX7VKEkvBdARikrpLPLdYiYRlWScCL9IkxkeCE2/Hchvov/wUtBJfVT35XzisZQjjP6+8AgCI82Blo+S1GtSwx13Ois8NW9bFtZK+Rq84FS3K/Wk3J+l16UkacCNAv5bK5loNF8wKDL94O4w2FGgnKatN6MJhKTEXAVfabfYgoK6JW4wJtgv267XsJfTeRnS6uCg+EdqvD4eGU1FRDAXaCbuaHI+ZvRnjFPYXzb0bt2wD+HA7XVAVOI7xfPyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P93vYD50LW3BkAvDS6gr5XpHKtUV264K0rdQrA9C6Xs=;
 b=gUAAzUt87l33veCRoXd4d7A+FkO4vMXkeCLDgCgEYRLf0YpnhPIhtDYNP4FdZ6qOLPnbNG7hUm7rzAq8UcFWkYOADHVhPXiTsgBR+ybwhnLG/0GW4emGTqLBXajMZA/Lx6lkd06aC9UzjzC2WgonkwJBtd4JTDUt/wEpuM6ufAui8qqUEIuinQ/CprEP7nBt2VrTVdDHtfY/iElBdch3faE3Yi/f4KCeS1bb72oqnIHNLRJWbJPGGJMhWuuQt+n1uNqxTHac6gfvtP2B6ZeDJMYR1Nqct4hC6Ow0v1NJesYWU81yAui8DSkKn0jZavJ0mqKJL1ceZ7JxxeuO2L9APg==
Received: from DM6PR06CA0027.namprd06.prod.outlook.com (2603:10b6:5:120::40)
 by SA0PR12MB4544.namprd12.prod.outlook.com (2603:10b6:806:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 14:25:39 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::e4) by DM6PR06CA0027.outlook.office365.com
 (2603:10b6:5:120::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:25:38 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:25:38 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:25:38 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:25:38 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 00/61] 5.4.143-rc1 review
In-Reply-To: <20210824170106.710221-1-sashal@kernel.org>
References: <20210824170106.710221-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <7a0148793e8d4325b9321bec2c82dbd9@HQMAIL105.nvidia.com>
Date:   Wed, 25 Aug 2021 14:25:38 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3f5e219-bbff-4108-3417-08d967d43647
X-MS-TrafficTypeDiagnostic: SA0PR12MB4544:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45445D28E27A27E398A4D9C7D9C69@SA0PR12MB4544.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /KQgKwZvvoc9uJLzXaD6rh4KNIrvJc49WkjDvObZ3tKGW/LNF3E5D5xJm9duArxrhfKrcjFz27PfuZLiAaNOWxcCP1jRoW1Qmszcynj92cVeId9r8l2SFu1xsqvJRHKCTIFAAwrFxLMDgQKsv6l2PNEydY9kfbBeppCiZOi8eRRPomYYayfgtXjsJ7cwzEsqJNKAXifhi8nkOpmO50FzVeu0iJV+NUVLrrPwTfwXBolpiX9m+U7UMKEvCXUby6j1K9hcoO8RUFXWq3n0UyIUevwBnVAB1npkOXWuJmP2sTHiZLdcWXUEjyGVLKFRYCbZnb0Svtpl1l0xGePehC7nAfhnMZXF+kAobp9M6vh10WsXqnNbl30AL/LhemCBo2de2cYwxQCoeuB30W03ETLVcwJYYgPgG/OTEnRTVxPEthl01L3c3G1m+LaxBfkn9fcegBATHIWiMAnFYx98E/IdK3KAZCDds2R+Ddrmx2z46j9tu/ZGYCxYM7n8JQFyPAZJG76Hi67ZnOxamUNMWNRwMR+H6LM6zfwQQNO19dTuwitR2VYQ/8pAmJwHMmaiDTOjoR7VY0qkwP2AUpBI8dX8sD27uB97ctE5I5BdsIqHH6cVicDGbcTVPKWa09/UW5p20nvvFwtLCKTOKbOUDrSL8rWQJMrsmbSn+DUykSQTfOE5cXKrX7uGURVXi8Y+IAg3tMkUdvZfmfqZgG7ffOygX7cEPJ4yijSWivGk3lekGy7LW7K8MkKMnxvyqYoRv+xyEbb6qe53Qbfh6oa2xDlF2cOwRau6N2Ii9cW4R9KrTmU=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(2906002)(316002)(82310400003)(108616005)(8936002)(54906003)(24736004)(47076005)(36906005)(6916009)(8676002)(82740400003)(426003)(478600001)(5660300002)(966005)(336012)(4326008)(26005)(36860700001)(86362001)(7636003)(186003)(70206006)(356005)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:25:38.9950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f5e219-bbff-4108-3417-08d967d43647
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4544
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 13:00:05 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 5.4.143 release.
> There are 61 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 05:01:01 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-5.4.y&id2=v5.4.142
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

Linux version:	5.4.143-rc1-g3b97ed8d226f
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
