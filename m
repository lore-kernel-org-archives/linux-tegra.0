Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DFEC07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 14:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02FBA6100B
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 14:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhGIOt6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 10:49:58 -0400
Received: from mail-mw2nam12on2047.outbound.protection.outlook.com ([40.107.244.47]:41824
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229561AbhGIOt6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 9 Jul 2021 10:49:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZd1jh7GMBTwIEEAcbISwnDqcD8J8PBGCJ3S9bmnuMbJh5kgeC3gL32ZSficVQiBik6Kt+MPaEsajep8csAQbRZENepZTwU5XvtiyWUlBfjsw8XWr5svf7T43uxERvvXgGcNctLNGzLtzUM9PBqlomf4wNQRXL5019jT15rY9Y1Y0Iih7OMf3TZ9rvoKOjA7mCCWcVwtgqQXRAvsvU1Vp86JEFvzTf7uyPP5uhbBsBgcacTwIKSRhk1hY02icPCw1vCbGVtftn0Z4oXmipmkkI8/axZLUeEi/vswZUDMuUBgeDr1aQNBYkSTrojuBQJE3UTlUmGJszTN7AMEwr4GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ganP8cOqApkAcb+oVrG4MsMTrGv22FxsCKcrCXckaTE=;
 b=oV1nGpPuj6ZRimFyWFQSIO7ko4g2KQFDbhukec7Aut86K6NLsZ48SYcJAc81xdOYa+c0RKLZwwSb2v+8n9IbHIrX+EUQ59WHQvDxRkTqsCS1dNlZXlErs9sAkyged02CctGm5wWyNKtX2CA2BoKwFsNOEORceIqxmsDqrLQElISsf2Oj32UfKwHTQicToJQiw8EMDK6aOVclZ7+0P6EXhi0uUjtXBOWVS5kR6/twf2iAPkUdLw0rNp27eJlpI0EPOq8eB3iLcDdKh+gK4y6XXfTZCIs+Zvb+I0QGutLUWCwqGj4IVxee3SPpcGeKt7fI2tomgsruczCF/Qww8rZD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ganP8cOqApkAcb+oVrG4MsMTrGv22FxsCKcrCXckaTE=;
 b=tqvJY/VXcpgv4MAGlwNWdyWQbHZSntxDpc5R/uVjkmO3pVLJ2oU8rLh1+KCm4oXSEMBKtI0MLM1Bd4xQeynqsG2SDVgeuITrl9DIzVUlpdHYgYCzcFHLQtkWYtek6qGHk0Ai/H09H/PjnJOP/V0EoZZte4/GkEti0tc5axXC0ea/7HZbAFLaJ0ceSjpTbjAFQFA76FeqSOQKnlN16EDK5lL9bgeDwrmKpWQZgwflRfK24KE2ed9d1zEg9krHc6QSFfvFXYQLTK1MXC48hpgGt6rzpiAnLi4X4YIDGs6Dqe/hXL9RtMBU8UCTQRWVJAuKdnEUL5h16qZ7zCzciyeibQ==
Received: from BN8PR16CA0020.namprd16.prod.outlook.com (2603:10b6:408:4c::33)
 by DM6PR12MB4618.namprd12.prod.outlook.com (2603:10b6:5:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 14:47:14 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::77) by BN8PR16CA0020.outlook.office365.com
 (2603:10b6:408:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 14:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 14:47:13 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 14:47:12 +0000
Subject: Re: [PATCH] arm64: tegra: Enable SMMU support for USB on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210708103932.1691306-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b70a8053-5c50-0aa2-75ab-5ee0521dafcf@nvidia.com>
Date:   Fri, 9 Jul 2021 15:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708103932.1691306-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa733c2-f556-486c-9035-08d942e870b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4618:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4618C00F1B2A636DD666E5F8D9189@DM6PR12MB4618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jSvrG9vnPeS+CtFLarKar6CZv1s+NS39cGHhQPh8pBRphW2c9up3mGwOOPykD1gdiI/sId46FtdFS2p4kMpF9zqp7+4FJr+xhtM1wRJ1Vyq7f8ULBRdwUgvbQ+I29kgEeQ6wipGplf1pUfpl2hYpuZ7eCh6D7sUks9gq+JBIjGlOBmsuSDG/7FYKEh28u+zS6LehjTyTfWgmdedGYrHr/lUUwV76XmlEEg2c8zDNQnkMLyv6z6qGcKK0QUK+/sqHn1jDIuFeqGj+xu10/vlcqvTqJh7J59SSo67U60TCjG33Dkxvhhbaxwa6eYIt80z9IOakoG+cokBvVNK64GSwLDar0/IdGj3Lx0mGHWpJseZOhkaYn3Af12/WdgNX71tlmF8yMEyTyM6kTfbeJ/8D6TAhX/lg0fh1JtTUT4MbvYSXWbhkmnUL1/oy0y/d36PJHtoNBsx33y0LbBtmQ0B6lkNtTRo3uW1zqokeCBr/7HW/jewancIIgP/IuAT2IPmdAUoqHGVzgLaBchW9yG6xB8AyRCWNVVrUV+EAgO68Fh5CGlJKTnrXcjBavMxonDaq4wyLAxm2imw4xiuEZBxBO8XTWjK6fcTQBV8Lqo20pxgmIhkatg3b9ZB7anJUyFc4WkicZJD+rmxpUqNqmnPwUcuxKhF5rT0oKdJDDFQjigFkGd1GTTRE03akED+Lx5FteN9615RoNi7N+a5mP7mC0nKA8fq9UqPZtqZ8QvzMtVU0sK7BouY8xXO8zqweLVDe0olPf/nbHOTRCJcd05HlA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(82740400003)(31686004)(478600001)(2616005)(47076005)(26005)(2906002)(16526019)(8936002)(7636003)(8676002)(186003)(86362001)(4326008)(53546011)(83380400001)(31696002)(6916009)(36906005)(70586007)(34070700002)(5660300002)(356005)(336012)(36756003)(16576012)(54906003)(82310400003)(426003)(316002)(36860700001)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 14:47:13.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa733c2-f556-486c-9035-08d942e870b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4618
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 08/07/2021 11:39, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit c7289b1c8a4e ("arm64: tegra: Enable SMMU support on
> Tegra194"), SMMU support is enabled system-wide on Tegra194. However,
> there was a bit of overlap between the SMMU enablement and the USB
> support addition, so the USB device tree nodes are missing the iommus
> and interconnects properties. This in turn leads to SMMU faults for
> these devices, since by default the ARM SMMU will fault.
> 
> Add the iommus and interconnects properties to the XUSB and XUDC device
> tree nodes to restore their functionality.
> 
> Fixes: c7289b1c8a4e ("arm64: tegra: Enable SMMU support on Tegra194")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 07e61f084123..7cc6dc19ff9f 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -952,6 +952,10 @@ usb@3550000 {
>  				 <&bpmp TEGRA194_CLK_XUSB_SS>,
>  				 <&bpmp TEGRA194_CLK_XUSB_FS>;
>  			clock-names = "dev", "ss", "ss_src", "fs_src";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVR &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_XUSB_DEVW &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu TEGRA194_SID_XUSB_DEV>;
>  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBB>,
>  					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
>  			power-domain-names = "dev", "ss";
> @@ -981,6 +985,10 @@ usb@3610000 {
>  				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
>  				      "xusb_fs_src", "pll_u_480m", "clk_m",
>  				      "pll_e";
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTR &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_XUSB_HOSTW &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu TEGRA194_SID_XUSB_HOST>;
>  
>  			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
>  					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
