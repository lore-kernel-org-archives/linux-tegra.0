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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD215C07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9B0C613CC
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 12:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhGIMOH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 08:14:07 -0400
Received: from mail-mw2nam12on2062.outbound.protection.outlook.com ([40.107.244.62]:15457
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230404AbhGIMOH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 9 Jul 2021 08:14:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CptpmyqerMUzdEJOLS+dkhAvIuAMqJS1tV0gre5qQYMLQlJCWfNRMS9N8hzFXzHsPzRL3yWcm0Zd4SeHASLV1gAenPwEG1JbfRQnx0JF61IvqweN6Exkf2HqjYnB8zX2x7V9oZ4HUoeV+CL+fQ+V1B7JnFep+Gy8ZPxkyNJ2d8OfqG610YQTFqjbYYW3bBSPHQF5M6U1y3/Tu8OetFnJJN1E5CFhLQVMM7FJNjNB7bbwOtAatCQ6Xm0yqdIr0ElAvJ3+jn9X+TbzipE6E6YzaCwxVb5xOs8EI8WeVxyLhnDNWYHMbIpur9qdEl5bG56JhO6/THfuIgk+QHzEjzSjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVWbcnSix3/dyZxkJu/0dkn8Yv08AzaqiPddYQAIEoE=;
 b=YuvgwTqjVjuN47tQuVwH4trvMJrP05JhALfDUcPgmsovT79ecbJIx3CyFf36Hnh30+XpcPR/Nfblhe9FmocROxYNNrHoxF7G8iR5x4MBltvstDMaw3gnRlhWkrJcRADh86/5kw8nt9B1GXT2IOwmCXgNpGM142sSMzmqe9zRuMGDINkMCdiP0zAJlcVID9nh0Vj/8+329esLifh262UqB+Un8ntbKs/qn6CzqbMtSSIsE7gpwRWJLn+/HZupjMyyHf7Pn1jhUye21QwHcSv1QGJGM5e2NQE9MQDgRXqlySp0CIIcTJCYY6UFKOHok5zt7UzBxtUHTd8HDFrtKb1eeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVWbcnSix3/dyZxkJu/0dkn8Yv08AzaqiPddYQAIEoE=;
 b=LQG4rrIUPC2qG3nRCZMIPHVD11loKIPx7RLryjJHKP34moVAEm9R5yXLhijvAAvrMB+xtQjscbe4fWXZIHHxqmshDKPaa2ahMY5mk7m1BvUGUANdzI86OQiLsw0QqtiL8IlrA93VwdDSf+dNsGk6MEgrSr390dKmD3MD8egUCjKqbYrI81o5wjlgp4rl0VtuhKunhV8wiVI47Q0kwFQzgtchhZJetvDITbRwVZukfvOlPhdzboY3q+WOHYvVqXe6SvoawMjy8dHejZJ5zCJJbVbmmY2XjG8UrY+bvIPtcHbxTCeWzD7uMuv1lEte//plPwykMLCof7kGFR0vN9m8ng==
Received: from MW4PR04CA0186.namprd04.prod.outlook.com (2603:10b6:303:86::11)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 12:11:22 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::65) by MW4PR04CA0186.outlook.office365.com
 (2603:10b6:303:86::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Fri, 9 Jul 2021 12:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 12:11:22 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 12:11:20 +0000
Subject: Re: [PATCH] arm64: tegra: Enable audio IOMMU support on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210709121127.2529364-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b0fb36da-5d35-9453-b3f0-4792cf6c39b7@nvidia.com>
Date:   Fri, 9 Jul 2021 13:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709121127.2529364-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 588b4ee9-be57-474b-3598-08d942d2aa99
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933F6C7505D2FDB59D02CC2D9189@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9CPGnawxSI3ePV9oFBsqxiAXxm+wacmiC47ssdLDivlb7c3Kajff6I2FvvzwQsrdVfjg5kjPC/ixWZ7/Ye66P+CcktA11XXXwRAmK1sBRcqn8/m0Adu1KZ1oONE/1pu84RK3IPofrJyJmrSWe1fT9aMjetmii0UGVvHoPSusHh24KH2hGJKH9OtnkaJKFJyzcp6QeosULwmgIJFuZNING0cTzxlD4I4yrWqdl+8v52OTgdM0ZrVwvM+LKEeqTdLdrjA4Xwls2cKxFaG4UstUXgJ6H87qr8MbcJj60jN6hJMRhfF4hr88SyME1hivxNWb2Biow5G3MiopHjqco/BqAc/TmG/igQQSymdJKbqcGT/GHCYRzRvwwjOZrXr16zV7jQ5F3lBiZykrCgRkS1gKXg4KRou1BkZoBZi6Fpey25SCbWXXcEJhMQA/82xXcvwQkem4pEhUop4Hksbvqy41rb5UlW3uT8+LIE28BYMGGStuqTdRVcCdMYUEuG5WHB3wKCNJtkPJ0V6MrurBMuGCgIgRvYbCBU+mZPwIqz8pYxyNIAApDDgyDkRptt8YjIhsYpNwc2oOfsT7otZ8E7M6zfFXd8euB52ADlqadOn8j95H2faAAruA3pvK3Lx1kcKZBAKWxgVNh0rCi1QIFJ+IgT+oZHe/2obUWfswZu7hPtDhj3OEESYV7pi1Vr/BDEHXxOwVT1X0eJHmt0MRIkEzl2LTGfWP/6YbqxAgUgrgxsqs6sTcUE1QZDljLhYq9tM51KeXWy6YtoTPpTcWrCHPw==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(53546011)(336012)(426003)(2616005)(8676002)(5660300002)(2906002)(86362001)(34070700002)(8936002)(31686004)(356005)(36756003)(31696002)(70586007)(70206006)(4326008)(83380400001)(36860700001)(478600001)(47076005)(82740400003)(54906003)(16576012)(7636003)(36906005)(316002)(26005)(82310400003)(6916009)(186003)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:11:22.1219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 588b4ee9-be57-474b-3598-08d942d2aa99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/07/2021 13:11, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add iommus and interconnects properties to the sound device tree node on
> Tegra194. This ensures that the correct SID is used for translation of
> physical to I/O virtual addresses and that the path to system memory is
> properly described, which in turn can impact the range of memory that
> the device can address.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index a6e61d899a27..076d5efc4c3d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -2477,6 +2477,11 @@ sound {
>  		 * for 8x and 11.025x sample rate streams.
>  		 */
>  		assigned-clock-rates = <258000000>;
> +
> +		interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
> +				<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
> +		interconnect-names = "dma-mem", "write";
> +		iommus = <&smmu TEGRA194_SID_APE>;
>  	};
>  
>  	tcu: tcu {
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
