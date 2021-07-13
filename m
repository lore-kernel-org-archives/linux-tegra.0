Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22F3C07E95
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 09:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C36026115A
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jul 2021 09:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbhGMJ6w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 05:58:52 -0400
Received: from mail-bn8nam11on2064.outbound.protection.outlook.com ([40.107.236.64]:30268
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235188AbhGMJ6w (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 05:58:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3U4ewNW/kRNSDE19GzjyFjjd8bZgSk0AmHT0HjI4pfhmbBX5vtJ8gF0pxSs5NC+irPHIo+MT19Mjx012qPg2GOlgHsM4CjwkAZQEcfhM7HItfvnhWJBuV3wfU1e+/6/SdPnFPEcz2nGuB+z2gnlz50JYyW6xZD66Ly/QKak42XHtXhW/Hqa2QyWjx0zA12YT/zqQ5apy3rizUlMeXTBlXuNvhhRSUQAneHszEyt5Ni2YQfBwVpoNJNwk42IK2nAUERIi+IVESBb12hejAEnT1JhNy3gluieW0fu8sTWR5OiWhOUNZiSEThZERgaipYW2eMSaSUJ34gNXROd63U8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzg/FshLNyzzEhroK+GUUnEWu2aruViXEgZTkf+TkuU=;
 b=OcdRaeshX96zxNjw2OLCzZD9l3aKOf4yUrG06SERLIaIEr7BfWz0xjJdITnMWxGpa7CqzTWSM2mHoqYtHiIp9jW4vgwDAARMLNTBOY5CRTb/3kxILiO17WqRrNnTpC0nzhSuPUSsz16Z8NYIkh8Q2xa/VYxVhUxoR9zb6jhj4AP7QLUyBIlB+Ov2VBDs7LrtaA/fuxQOYpyf/sbP5WWy4stXzl0/0CuvCdvz1qI4dgyT7p+lCY4AueKHQ0WKK+vLceO2Nf3B8iKlxEj8AWuF772TfR7TuCBvgIAZYR4hcA3OTPb6eVDGRsxNsOyTWc1Jai/X8dtLiUX5+YS3iQ+cpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzg/FshLNyzzEhroK+GUUnEWu2aruViXEgZTkf+TkuU=;
 b=Dwh8Oq0LvPwml3NISDZ0vAonPkmkX7h0NoS8Pdf3QCHiMRvrFlJAfBWBReRYj2uyO9aT5hAdOcYIDULKfiPV97KwQp8FTg+Tys75eJ+xne9mX8z8Xy03QkOMvZTtNp2NPZ9/A7EJ3Wda3KBVfoKyEd+WeqYp7d4zciay/FvmohKb3D3NN5HODnupCtOH0yEZkNbl5+xm3VD1JZYhv4aUGPwZlFmdpx3A7XzvWjyAsNhtOkY7MgH+bXyn3g/6aYR4LjggxblsV5ikAZdfsk5Drg+371qejZl5byH3a+M9uf8Pr1MqWXEvLQPaFjsdcSeAw67z4zJ5GPV4DBG4JHLGwg==
Received: from BN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:408:ee::6)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 09:56:00 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::5e) by BN0PR04CA0001.outlook.office365.com
 (2603:10b6:408:ee::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 09:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 09:56:00 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Jul
 2021 09:55:56 +0000
Subject: Re: [PATCH] arm64: tegra: Enable SMMU support for PCIe on Tegra194
To:     Vidya Sagar <vidyas@nvidia.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <sagar.tv@gmail.com>
References: <20210713044414.25536-1-vidyas@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3fb8cabd-901b-d968-33da-cd163fe305dc@nvidia.com>
Date:   Tue, 13 Jul 2021 10:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713044414.25536-1-vidyas@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cb124ed-6ed0-47f5-666e-08d945e46b53
X-MS-TrafficTypeDiagnostic: DM4PR12MB5359:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5359134925C4374F084A4D77D9149@DM4PR12MB5359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOYzoUMGgcVionJLuYEmE//4/O2lXupD1yd5CLB0pwvpHz9xf6rHNbr6eJItAkLiCSxFpOtbJPOLuJoLVMb9ptsA3z7dkJma9ayQZ4bqJB9TsU6tKyQf/FuYWwBS2nWoXs10c/MbM1iEgB5F3fYS9D3W1Rj1kO3wmtze94JT4IOXQct47UYJz+54xP+APqyEkLm6MoqU345QogPt1KnReErpoTDBUdfoeA+kR66AL6HjajKdip+6UAgnofW7PfHcQxn23lmTmQPPb+Vlr+P/uG6bEniwyFgYR2oQWVuVM8fENQrDWr31NgM3bRQ55aqmkMNeMuWYcvdaWsjV0ydH7Y3u0WqigU3gjw/SMh7WYQMkiMzrKLp7ZGLTFC/hnVudp24wnZ2ApB404IJkWzWFwlxKeYejF39Gno+4HTlh7KXRBnY9DsUC1MmeFBJnIz/vkSU1XqJ/cXFgBtW+2grXpeagPwq9yqx7oQKBzX5Vuqc9vS83yZ90etKK0kgL/1YbDmUlYaGQTQWmG83mgDd2D5CzeWCCiigFZLc6jqTgoyTvGUrENcKZZ6pk3gk57f5/Rf2SgcL7+n/TGSp9sjLZWhQUy0ub0FzaxGhamgqdJiEhLQYtpyr0oi/XRdjqv61LFCs9w6kwK39a1SmfAYTvgNDNL/WCBaSAkQ1AOSQnFyWGyKutcqmkeTQj4qALFX8FpfC9Y9iZF/WcJU42LKdysDoFOy760OE/YE6r83N1/S4CxAkCKtHWAz+31PoDvfTqCzw3I/txhtHYi6/5OJxuIg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(46966006)(16576012)(356005)(82310400003)(70206006)(110136005)(2906002)(34020700004)(54906003)(86362001)(4326008)(316002)(8676002)(16526019)(47076005)(36860700001)(83380400001)(26005)(2616005)(478600001)(70586007)(186003)(53546011)(426003)(336012)(8936002)(31696002)(82740400003)(5660300002)(36906005)(7636003)(31686004)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:56:00.3304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb124ed-6ed0-47f5-666e-08d945e46b53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/07/2021 05:44, Vidya Sagar wrote:
> As of commit c7289b1c8a4e ("arm64: tegra: Enable SMMU support on
> Tegra194"), SMMU support is enabled system-wide on Tegra194. However,
> there was a bit of overlap between the SMMU enablement and the PCIe
> support addition, so the PCIe device tree nodes are missing the iommus
> and interconnects properties. This in turn leads to SMMU faults for
> these devices, since by default the ARM SMMU will fault.
> 
> Add the iommus and interconnects properties to all the PCIe device
> tree nodes to restore their functionality.
> 
> Fixes: c7289b1c8a4e ("arm64: tegra: Enable SMMU support on Tegra194")
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 60 +++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 076d5efc4c3d..b55522aacfb0 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1840,7 +1840,11 @@
>  
>  		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
>  				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
> -		interconnect-names = "read", "write";
> +		interconnect-names = "dma-mem", "dma-mem";


Thierry indicated that the convention we have been using is that only
the entry is called 'dma-mem'. So could be good to update this to be
consistent with the other interconnect-names entries. Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
