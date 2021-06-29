Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A711C11F66
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3635F61CA3
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhF2KMG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:06 -0400
Received: from mail-mw2nam12on2048.outbound.protection.outlook.com ([40.107.244.48]:22945
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KMF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S27QQL8lrpjL2rRraL4HAbdP+SCm4owY1wI3K+V/qO+2YWhigd1TXjRv3bBk4kXdGgdLlM9Ha2n7tmlliVr6rEmNA6M1Zf7eBMKpuurN4QPdVbLhX+s5dbEhZGRpWOAFKX/XDf3GicDErWMed0aybhaPfMOBcPXCWScE/alyk8eKVkt0pfHDVTLmJJVOC+JlffCtVeGHhGUR0FoXvKw/U4KpgxSeC/D1GUtCnd6TZ5lnaYoV+nEZK0a8hiH4VX1dG/qmR41DpDyYjPWGGZJ8zVuKF9XJLKkL/A/BZ9PzKi/SLG5grwSrSz7UuKWgJwRoNLzd8ZCP1ZAtWRS6Z4QQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6hXSeUoGTwc4V3rDmN2yogBic/Jr9he6prZsq4iYiQ=;
 b=llvPMhkDDTh3FezcTQsblFSDJYa7OqRdi9piEa+1gdDNOochc703smjaS5LlMevlhXIHSBCX80ih6HSvVf+dVTxY4JIphns3RT9a66Nq6W7oSQURVi19U5exRXGSTYeKbbelv/9lFEs77Aegpte/j+GSr/z9O3DIFpqkakJEARrAwTa1GfC2YBMpvKWc9lFvWT9ZNJnTlyV4xz6H02nstcitKg6ITfWiGX73/lv9uKsRNGQ4ob7OQeMS/uortkaUxhW1KNMwyGHQ7s/PYnDx6khZ2JfLV9412vSMOqaEF/hNU8ms7is2ZjoPiUgN/C+yaHU3c4YNZ/BCx7FdtsO8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6hXSeUoGTwc4V3rDmN2yogBic/Jr9he6prZsq4iYiQ=;
 b=l0BcDbrcC1VqJR7/jlGx6nfofCGRshPgKLMcjm0hAlDwTkf5Kkneq1xQAfaR1RYmFYZQA0hFVHWZc0H3DmjFeq2V1NNZG6lGDj+5FDbFrO2SCPiQIODsRxJF99UJ/rfg+3s7s1T1xQu+9k/TgpBoJV2PE031cGcAKjUj+RUx5kkA4ZxyW1QbQyyniKBnJHPz0Ai+IpjRLZvK3BYyN7qvR5Jh8kcBwGPyNX8czvuex05CzjuaYwQowH9zOoMTJxqotPG4e9fJ9+7IHl+aRiHxJ7xPQvqEeBXMsTl+oNxAEIqkncE2wM9nxw0aogx+ER3SNLaUhKq83y8sQHrf2vjQ4w==
Received: from MW4PR03CA0031.namprd03.prod.outlook.com (2603:10b6:303:8e::6)
 by SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 10:09:37 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::a7) by MW4PR03CA0031.outlook.office365.com
 (2603:10b6:303:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:36 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:09:36 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:09:36 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:36 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.4 00/57] 4.4.274-rc1 review
In-Reply-To: <20210628144256.34524-1-sashal@kernel.org>
References: <20210628144256.34524-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <046bd8ce1b8e469eaf2e6f461576cc38@HQMAIL107.nvidia.com>
Date:   Tue, 29 Jun 2021 10:09:36 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b60bc5a-48ed-4efe-d53a-08d93ae6003d
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5440:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5440C5B3E657D2EA9825574FD9029@SJ0PR12MB5440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BW6n8HRw7wauqPsDWAXNgXlGGlGCn2eN+va9nx2pqODtdd+2VF6zaMTAqZgl+yHQDF0CX9J2OmhyrfW5YTEexBRHtrbb9Ud4rQsPgs7nCfGcZhc+s+eStDg7a3QgK4XuA+i+p0GhZdkh5I2u00gWfmvIoxUYArO1bjL4VBRwvh+cQSYw2mD+JTbYzhZqUJsJZrLxf7tI3bNk2QViZsf2V+CgZ8D1anZyNpcMnsS2HRJynihLwmrgJGz3DfgopqtaDSMINZMzQbfZbPZYUPc6em3XHYLJC7nX2C1n7lKRcJdW8m+5oIXrNBQyer2vfE55zQoybhnjOiGqN7H58P9gP9nGo9CX61Eq3MYvx0uSCCB53V3VTsyshPD6AGB4o86+emkVhylRGgxHN1WYvA1sxWjktG4+eevLXu2FG5YpuCL5/eAwRRJMQU0MY3YfOpupg4ukpn8IxzctrQTMTs8JkNKxcsUXsYMrfXWJ0EHuTCki6ML7OZC+ThX90usKDgUjy+90qlCm/Qot6FMGA9qmBuSSjmA5NxV3bMppNTCWteBmqBKbfai+rVMfr69LWctA26T0U80gYhPNQiSdr5/29OtFuO5kESodMQyH1xp0IkJvz4Z322UORL975RQigtZGc2EoX/Ahf3xIEw2GtX8NOXPkjQDZ7uDUA5HcEFtW1kBC6oQsWclcVWGhRtW5DDXlgmqGLszEQl0FAU05BjrdG9/lDR8IJZj4M2z6hf/L/pDi7xV2MvrqShViZAM1yy/7jVxDLFkw2Kr8ivdDDux64lOK3DzG4bfUZcz/bDs/zkZHakMLQp/NFRlhIr7FLMj5s9qhsDjtIEayi/x33lnPng==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(86362001)(82740400003)(8936002)(186003)(4326008)(36860700001)(47076005)(8676002)(26005)(82310400003)(70206006)(966005)(356005)(6916009)(426003)(336012)(5660300002)(478600001)(2906002)(54906003)(316002)(7636003)(108616005)(24736004)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:36.9467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b60bc5a-48ed-4efe-d53a-08d93ae6003d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5440
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:41:59 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.4.274 release.
> There are 57 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:42:54 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.4.y&id2=v4.4.273
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> and the diffstat can be found below.
> 
> Thanks,
> Sasha

All tests passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    30 tests:	30 pass, 0 fail

Linux version:	4.4.274-rc1-g5429409d4e80
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
