Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BABDC4320A
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DAF861073
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 14:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240148AbhHYOZN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 10:25:13 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:59488
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241369AbhHYOYv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 10:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c49n56YckIVUd5mPpHztJ1Cq1P2Yft9aAygqRtDDCSm2WtJ9VObrAkS3tmfH/NYjTrL+BoBH0JXDBRY8LeXQ6jCzd9Dn6+GZUxSwzmNooGg7/2e+ITLdOk1SXlT5L9vF7muWLjp5DoQiYj6fCvc5leHoxiBrNPPLEjsqf6cBN9eV4lA9dc0ij9EB2xrWL1LDk1gyF+nLkh8yaJBIgp0pekkvK60ppOYr/6ojGbEEoFNPmI6JefytEAv0jXwYBuzQEHqDog9s7OC6gDVXqcaLcziAJfhTiojRwpWGoiv64lF954oljDLpeG3thElmrBAw7tq+r8RZCwIsjA/4y1TL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi5yULVSrSD/mtmgBkuONsDLECqnS9yv6hBdW42uQtY=;
 b=JrhDjXDiI7TqfJS6A8B8Bz6CUa13SCCAKVk2nadvtjAfj60I/iqqS2mit/Te2JOD61oTmv00ipOv8wSeh6pKXld5feecSoYRLlaBhw/OtOr9OkiHijK89XbFceosLEPaW+VGbFdIWOvcVWh9Z1BcTCMaw2bmvhX10fkVsKhYUsgBWzhJ2+EnDwheEY6nO6xtk+M6H2dyzj71sMZ3VcQszB3m7ZI8/S6okmkG5itI7Gaiy53/RNvJeSjBn0WzZbN71RTyAu+Z/C+dDSeQbuwezhBMiO26SUIo/wKbub7RBVZREquXK030fB8buLzO4B1WylL9242o+3Km9Z+CMjWmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi5yULVSrSD/mtmgBkuONsDLECqnS9yv6hBdW42uQtY=;
 b=NEdUMwJkKjh6ibCRpt8GUyn+uy+1vpQqftrG2Xim0bTkQkxkcHNnTrM1bvkktK9Q8Vg3Ab7n5/LyPU/uw0KyqBbIeSyQ3RhBotk05rZdnQlAaGxGmIWc/52FMcIu62FBY45DgOXo7rHp/vO8AH7IVdLcj2VTkCZ/yenga2lTFzy5XrFw8QqcBcRLRvU9nCxs3HZA4dpEcjbOpEtCM/uJhMI1i+K1n4jnU2owZPLiYDnD4kbyAf3qfAyPvPoGucg9fWP4TbAR2AW+GcJEJVpWdwQBVzEMeyuXyDPD9sQmfITRhW8vyriV0YoF9pHOjXVQrNM6XGMTrlytVK0tGbcOHw==
Received: from DM5PR16CA0045.namprd16.prod.outlook.com (2603:10b6:4:15::31) by
 MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.21; Wed, 25 Aug 2021 14:24:03 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::1) by DM5PR16CA0045.outlook.office365.com
 (2603:10b6:4:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:24:03 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 14:24:02 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 14:24:02 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.4 00/31] 4.4.282-rc1 review
In-Reply-To: <20210824170743.710957-1-sashal@kernel.org>
References: <20210824170743.710957-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <44d07b74ba484efc95218dc9f829645a@HQMAIL101.nvidia.com>
Date:   Wed, 25 Aug 2021 14:24:02 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af3b9b9d-ab2e-49c6-0669-08d967d3fd15
X-MS-TrafficTypeDiagnostic: MW3PR12MB4554:
X-Microsoft-Antispam-PRVS: <MW3PR12MB455462C6C842BF48A644DFFCD9C69@MW3PR12MB4554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxSQG6/YZeGjK/NPRmc7JAaCWT76bTkagwWKzgyIyoDuatf3wF2LuT8GG8J18EWHLUZcd4VU/ViZ1tfziwKCjjzqu/cFACVrjSKRxJOZedeUhU4tkIJS+5Ab4ZkeqfmjW6553QNV55bRfUKJ0j1V9T5Hkw7/yhKEIndEqjIowL9yIKYAb/pO5rQ8aMsL6PCoL6sNR3UUUZp8xixzlrDFQsfFDYtOOacfaXasm8HO8VXxr9B5peanA8U+HtCYLHEo2q9c9JJ9ceQSDYcKeF81/Q7A0UvOTN0jJIw/h8VYJCrEHsMlFD3MKahlMfaQCxx4ydY5P6G8DuxDXg0tS1zlW4L/QRFzhN+dFWiP4oMkANWAgIPx2LoO8h7SAVev4FMfczInrOF7PRfaHbkeVF2oJgbAJdvlsb/7IrzWi8T4qBJaukirr0P7lywlTx/L6pAQqQwTbYqNBilFDEaQl3G+ENfspuJy4G9G6deqzdm+FGZr08n5Lre6zcDR4ouf5opIUIxERd5y9G2gCF++rBpBNDeBiifPKQdywLhAj54JNZhDEmk9geUvEHnagapRgX3NrbhWkzzaHFPT0HOYqVJ4Ckwm0KAitkM/IZQYdp0BsIjubmdpRi5tLBA+Tu0m9WopxMw9FuS9F0DjeIcG1nCwfL1qScvmbMwP4harvG/O03ZU6QOOnr/STtHOiC0JXAPTnDNAf/AEc8XBpWj9kqsxwhg+O/aP260AUILOZEm86pOcPNQcnw6lbusKcB7cniIsp//8lo8h3pbe0qS2ysamSKkWF5ipWzi80vJU0SYjFok=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(46966006)(426003)(70206006)(82740400003)(8676002)(336012)(26005)(356005)(186003)(70586007)(8936002)(5660300002)(2906002)(54906003)(108616005)(966005)(478600001)(82310400003)(24736004)(4326008)(36906005)(6916009)(316002)(36860700001)(86362001)(47076005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:24:03.0160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af3b9b9d-ab2e-49c6-0669-08d967d3fd15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4554
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 24 Aug 2021 13:07:12 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.4.282 release.
> There are 31 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu 26 Aug 2021 05:07:41 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.4.y&id2=v4.4.281
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
    27 tests:	27 pass, 0 fail

Linux version:	4.4.282-rc1-ga11850845e93
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
