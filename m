Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F3DC11F66
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01ECA61CA3
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Jun 2021 10:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhF2KMJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:12:09 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com ([40.107.92.87]:41956
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232772AbhF2KMJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Jun 2021 06:12:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1044B5WedpwRH4c7O+jy+jWCXfUWgraTLcdpmviNR4nYf6/c0nBXg1jZ0m++osVwwfmbmNy6zncimUy4nyxIHaS1YN5P28DMhapQgMTV5bxsbC6rLeUi8x3hz3Cgnq8ntvz5W8cMoZ0FECwo6HNHeDXOqKUqOoZ9WfEoWhOp1VKY6mPWY/e83qigcKIQjdtj8W1Zc+eA4MIrq2y1BO4tL+RWwiTtIwbv6x3QZSSIHkUqmoz2IZiUyFivBXv0Y4IQGZ4cX0R2zcR11dKxPj6u7sVu4ykEtaC/teOKfGyxgs8k0mnAAJVJjMi69kUqMEnJguiqSWwz14Om2Mr5pww9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEKvM84abm4dw7sVPyejIi9QXNzPtOqIjc/RGkpJb5g=;
 b=iziOdIHSrhq3sV5fHuLCVDdokfqOjcMPJuNovjjgxR80IyeyzA+VwkSlLMTj8J8HR5Rh7+XaXzVdOdPOMUvtMOc2btt2X4y2F/FFa+kJaljCNDl4s10qKFjay8yAYS79l0ioVl/SVhU/xyEzS+S8NdFlMOtU074wEq3AhIu327WtSDyjMyLR6tdYxnsopd/XncjbAA547dHE2DGNGQVCJXkr6/ztZ+YTVLt4Q9uUjQmonTrDBb7BacVEpmXtnLagZIJ3D9PkFLsG/0Hhkw5QPm5ugOO9LcFfU89U6Gz9VcaEpSw7jkA214FbgCVEPbuVC2T4ohzHy91YJY4H3Rv1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=kernelci.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEKvM84abm4dw7sVPyejIi9QXNzPtOqIjc/RGkpJb5g=;
 b=oivbiC+ZkaXLaTDzCLdiC8T95lvpPLiUWanU+oCBswPDrM4og3OfCjIbVbRgl/nWToV3y3rTM6C8P8gRyibOqkoYcCpXkQtx1evejmZh7Hc0FjnYFhy1BYUS/mrzXlknUytlFqJsj1Ir9u58it5hB1Pz3O4l6i0TAVjEcN00njklCSlXsVypYn2xym+al4apPj+RwiG0X5x3hQu4MkhtKxE3XvyR4qPXDRXELalOFk9OEe/JBWZIAASzDKN0qPD4rt7JNfYMz6ChoVV9SkW+o7lyBstH1ibKqJxlXUxCrrlij29yn+FgGTqhjlKxoCXpkN0MkHcEVltkvzTbFUtEVg==
Received: from MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::25)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 10:09:41 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::2c) by MW4P221CA0020.outlook.office365.com
 (2603:10b6:303:8b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; kernelci.org; dkim=none (message not signed)
 header.d=none;kernelci.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 10:09:40 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 10:09:38 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 10:09:38 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     Sasha Levin <sashal@kernel.org>, <torvalds@linux-foundation.org>,
        <akpm@linux-foundation.org>, <linux@roeck-us.net>,
        <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.14 00/88] 4.14.238-rc1 review
In-Reply-To: <20210628143628.33342-1-sashal@kernel.org>
References: <20210628143628.33342-1-sashal@kernel.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <d6e3aa5dd02f4299b785a05cccb0c382@HQMAIL101.nvidia.com>
Date:   Tue, 29 Jun 2021 10:09:38 +0000
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e803e2-8e6c-4634-68ce-08d93ae60253
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53335B080E8BECCE263A3977D9029@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDigRsMahnwPbcSgbT3dO9wFdI6RYfsZ1WNw5CiuoP87WaCrQFfF42i3TImTOuWMkTeOpfwGkDDdPCb/pNaRhWgokkvH1W7kq9GP4vYD9OSVCyU8MEitgZ2lE2ycLSnf//vkRq+vBkLUA6iiOmv3rv4XtR58Ro526KmmV0JD+hYPCp6MexgsYvitFwZ86Es7apdAFLHul1pUwvSJgA+RLR46BMFaUu0ElbgQadwZ63/vTBHJpy4GJY3iDDemM87wBsdOVFtJyQ6Tq8S+pu/m7BUjWcbAXYohznYLUTpHVtRjVlRbFHapvQaFAEZMj3hO2HpJqzVJKrZAhRfQtu/Wm/h4+degh7YlJc6uqdr9xa6YptIbwhlc+llwCbcOLg4617WG8dYuNKB/uSU3whurYi84F2gEpbtza6tLznnxKI/a4Xh5gDwXn9hQ4yIFMbY/L2EsUHwgCiJhpwsab8CJ+6QEe1lOLt1Pmunv5HuFEyaWaOVr/pXVKlmhSC3dfdQ+V5BSyEbgUEiKHwzenGTumfZMYo72mOGJe2N1xiPT9vrI0Iprf77xCgzdtTLbbSedYfitbiuf5vDzc9GbcLWxZQWyOCMqGPFe3TCNT9f0W4LQP6sxzvTKa8cUjFUvFENAItCbTV82x1Tnby8ByN3qYBWD06EZUTNhBeR5KUwyBzGlHkmapggSlVIIEdesq+8hWoxh3fFvsUPcTrxf4SH1IhrIaRF3h1g47unmuJqTnMMJTPbTkMgBdFTu4oIPSJOkP+VRR4AwXW0cRUy3uJyoOm6kzZncYN+3GOMlSvCWV7YyFir2Mb3pxUhuC8gzROaIQQYf8tAjtfsa+gkm2TEFNw==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(36840700001)(24736004)(47076005)(54906003)(108616005)(478600001)(4326008)(186003)(86362001)(966005)(26005)(36860700001)(82310400003)(316002)(82740400003)(336012)(426003)(6916009)(8936002)(8676002)(2906002)(70206006)(70586007)(5660300002)(7636003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:09:40.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e803e2-8e6c-4634-68ce-08d93ae60253
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 10:35:00 -0400, Sasha Levin wrote:
> 
> This is the start of the stable review cycle for the 4.14.238 release.
> There are 88 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 30 Jun 2021 02:36:04 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
>         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=linux-4.14.y&id2=v4.14.237
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

Linux version:	4.14.238-rc1-gf8f0323505c5
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
