Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634FCC433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 13:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3889564FF5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 13:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhCLNYn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 08:24:43 -0500
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com ([40.107.236.80]:35584
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230256AbhCLNYM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 08:24:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OllV1AMKcqu0h7JQ/NuEleYUsS5RRFwfnr+30ySqbaDabYQtktJJcvjfW+HtjDgT/fxcDP4t/3kkM5w4O7Hn8CUfc35hIWqW/PRZh1peAi7DpqVD9+2yDFcG++/NsPI5+TDA7BoFbscjkgWmMg2/KgogopFYur5lOpGgU4ZHy1iRi4wvpQ1gXdMmQZuUuUK/DCLnSMO+aR5E9qLcfJYtO87U0ve1Nqftpgml06DGaet99MTIUW+DSjzdAuXaXw3AHL2MoPRI8ci89GNAVMdQCmHVY8IAPJrz3M+BB+JWFIpNFoNC4gCIlq6hlkLHhR7fZITPoqaYu1/p6OqrOPhdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7F5G0+S0XPvDnr0eBWtCRChiIQOVK0GkD6IZ+rt4QA=;
 b=RpP9/Yu5H6yK5Zu4aFqIiawZBA8Xtblpgz5+9d9Juh2zrVCWWl6OzVS9toasvnnrHbuXnHbNwomhi12jxlVg8NXfxgTZbF9FiRvpruGaJvmSALTtSybMpLG3wHlbZY+dWZUmMYEH/i3DUeLNseIsnutRuP3eoSRpC4nao8X/EUSX+vW8EHQYPGiaSqJG2qg3ECca5OJfZqgnoBnZpeF1UVGSTpVGcuQBwg7Mw0qiKZPVkf/QNcYMGkgIFZp+7/lb3gOK6vKdNPJrf6iHXQmNe0CQY6HxruUTXw4s91HzZSNPNuiHqgrraIWzWHJJrCKSCuWvOpiGkZXGETbC3kOdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7F5G0+S0XPvDnr0eBWtCRChiIQOVK0GkD6IZ+rt4QA=;
 b=KgUrleKFnTrdWFUkKVMASAO84kHCxiU0ZIw8uzMBPjrkJQq7uFCvKfK7JIwoYiI03puMQB5Qu0R4cEsNEvuI7V0HMv1FQlCyLKbz4+9+z3k0Amzs4i2bmSQ5ZFc3YXvoVL9vL1JmmlKCCZ+t9G8jchjFageKxcgksloeXoJw7C6d9bubk4JHC2pqDMxrb7Ghb0tNNw915lo9vPNvEXvTln1hLQRLTbB8RI8570JoLuORbhaCA08No/xDpN+rMsbxBeCJZAN8OZijOv1G9Z7TsfNheTnrE12z5htaDbEMVZt3z3146Q+2IUAUDazrvedXD+Q7V+XRvr6lTPvUnYRg4Q==
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 13:24:10 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::5b) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 13:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 13:24:09 +0000
Received: from [10.26.49.11] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 13:24:08 +0000
Subject: Re: [PATCH] arm64: tegra: Add unit-address for ACONNECT on Tegra186
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Sameer Pujar <spujar@nvidia.com>, <linux-tegra@vger.kernel.org>
References: <20210312125808.659431-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b24b428d-2d47-89ef-c982-3cc5bdbdd795@nvidia.com>
Date:   Fri, 12 Mar 2021 13:24:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312125808.659431-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0b528f-aab8-40c3-1c41-08d8e55a1ec8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:
X-Microsoft-Antispam-PRVS: <MN2PR12MB337519802BA1292F7BE739D7D96F9@MN2PR12MB3375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7D35pKbE7Ct+HpEdoUZeYUDqq5vvrUZWAQinvsotKo7zsneii7JeZ0K0Jri08/Zyx4CHLFj32wC59K2Gfrur7gUwuE4RVqGiwocvmIZ0M8+/OUDGb6ze7bKqdIdDZyd3FVi8/suetqlSWvmWcffzLhmUj6Buwt2bkDG+2QT9qdRQnNPCSorbfNXnDHy7CAsFN9OjB5CqELvU8SUXucF1AY6U5qs0PddmyHr5LByLh1H7xG49I4KNYhRZtwIWZqpKnt+CzN58bY5hhvVwKkTgsuVp66AjhUzH0DAtrsV2CTalUCrbBd06fZDc2lWQkyvwQ/OarZDN8ZUNmdetrdsXHsN59DvDlXO9W+wzVjzOiCIMp0EG8vxullpO+T9sZQumPzA/UM+lr0UJ8/durAPSQUA5eKjXPKrgxRUSUSVMQPJmJwZFqN8EYFU2RJaUESMuBJelm5umGP2lXdJaHldJUbZlHAAHUJWNi7Uqm82sZHgtJty6DgCfrNc5YsyRlGuAMBOxIVOsZsavuS1EzIZ5ZJ0VIe7w2dSPFTte9ZqizKBsHefSBn/RIsu8DPoZOhPHKl/5CFkHG0HRTEKkIx2iXUnQgULH8QoKa+Vy+RzTFKFIyxa5ZQ2riDD5p0xG/2/gqRI18689ayywQIlymcm6VaQWjBdSXck8Q9IW8MNCQv/PfzPk2ws6XrHaLIwfHrwSP2cMVROz7aY48qz/afb+Lkhi6/kEd//LL2R6XOSsF58=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(2906002)(478600001)(82740400003)(31696002)(34020700004)(336012)(316002)(36860700001)(70206006)(6916009)(26005)(356005)(47076005)(31686004)(36906005)(5660300002)(186003)(83380400001)(2616005)(54906003)(82310400003)(7636003)(8936002)(8676002)(16576012)(4326008)(16526019)(70586007)(53546011)(36756003)(86362001)(426003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 13:24:09.7654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0b528f-aab8-40c3-1c41-08d8e55a1ec8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3375
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/03/2021 12:58, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ACONNECT device tree node has a unit-address on all other SoC
> generations and there's really no reason not to have it on Tegra186.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 9f5f5e1fa82e..683743f81849 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -10,7 +10,7 @@ / {
>  	model = "NVIDIA Jetson TX2 Developer Kit";
>  	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
>  
> -	aconnect {
> +	aconnect@2900000 {
>  		status = "okay";
>  
>  		dma-controller@2930000 {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 02b26b39cedc..9f75bbf00cf7 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -73,7 +73,7 @@ ethernet@2490000 {
>  		snps,rxpbl = <8>;
>  	};
>  
> -	aconnect {
> +	aconnect@2900000 {
>  		compatible = "nvidia,tegra186-aconnect",
>  			     "nvidia,tegra210-aconnect";
>  		clocks = <&bpmp TEGRA186_CLK_APE>,
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
