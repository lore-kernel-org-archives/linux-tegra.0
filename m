Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A92AC6377D
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 10:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 558FD6128D
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 10:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhGVKJC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jul 2021 06:09:02 -0400
Received: from mail-bn8nam08on2067.outbound.protection.outlook.com ([40.107.100.67]:56865
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231626AbhGVKJC (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jul 2021 06:09:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5G+9cmD83w8OjkSFlq5PHeSr1VUNFJhOqc49UUvEe6gUx/y8ryFiH+RfsyYKuJyr+G6dHp7rV3FYJAccu5c4Zv0QcJgQ2rCBFS+t6kLjczE1lGn7CqWpnzNwjkKJl5sfpHpb3QkB4mkRTwM42YY4qiez28Y33bEkheA1T01aCS97GFfP7D60IceslBBDVYcGq4vhHBgEuTjX3O2VCl9P2TU/aAk1mqQIN5ITTrpwM9R1JXWQckPjGt5Fxvdj5LmfOsskLIhJickMJRndt69mZkmFXZUilbZkEi8bkJ4EWDFniDjvxqxuvXl9VAUJNYEmeOYhMXUX8eKhiLfNdYhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RccrGeROE1R1aVHQ0hICRFUchpJm/ozOkeoiKwQV+ng=;
 b=Td28pVGvyGeTeolZ5Ti9SPgELJmamMoY5pkPUKGUxiWhCfnV7jNIn1ENHAR1ykuDYgUNhR10dxKPxtrJ7t137XM2/9Cm16TsD43sfRn+ILdpya7b1geVtoRRvYOZBCO7DEvi4yI3w9LcPfqmpxLwGZyVK15h5ePEVKgRTBMmMSqZfuvR8Y+8qgMSOapIW0wA3BAfCFQa7jDD3WBj42SfjA8fS6OZVQ5/9JyxN0hpfP5+fZjeGwv+436LBWvB7LcI/XNSzNG1HiGZYGZeLqRencB9eYrzOZinuXjAd5O0Z4e4mNO3Y4yKQTC9slUkyRQM+CR9FAPKz+cVH4LrDrgIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RccrGeROE1R1aVHQ0hICRFUchpJm/ozOkeoiKwQV+ng=;
 b=Zbjo3n3p7iF7fFpMIzTPNa8Y13waJJwl15bovzwX7WrgjDNzIAZ/IkA1jG46uGWxRS3LbnGSO7KgKg76WLHu2mPL2CuLSJL8SAN7nfwHi580ZZfS1UUqEmnNSDT5UA2e0BbbGYTNMbqoz1nAP1LCVPDrv0UmxN3GBVrQRePFo991JMYtlBgdh4pSWOKLbUW6rNdXriVUbLzEoqkB9OqjjnAWjET8XGqUiZhSweusGvgBAgfhTPteJXzNpcRtPu98pGEkSFXGmqWlamPcah0HWnvTvddm54aP0+OtunCuuy7j3uWoW2gIE8k30GblLqTkaS54PSGksi6L28lyCXTS/A==
Received: from BN9PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:fb::7)
 by BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 10:49:35 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::ca) by BN9PR03CA0032.outlook.office365.com
 (2603:10b6:408:fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Thu, 22 Jul 2021 10:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 10:49:34 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Jul
 2021 10:49:32 +0000
Subject: Re: [PATCH v2] soc/tegra: Make regulator couplers depend on
 CONFIG_REGULATOR
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC:     Mark Brown <broonie@kernel.org>, <soc@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20210721232616.1935-1-digetx@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <770eb9dc-ba9a-acfd-b73a-23e7628dbcb1@nvidia.com>
Date:   Thu, 22 Jul 2021 11:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721232616.1935-1-digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b0bc8bc-bf5f-4f79-cd84-08d94cfe64fd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3048:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3048518AB14A33D480972783D9E49@BYAPR12MB3048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRi3mnJ1X/KiFeNsiw1atYc3nh9cbYBPMMESkQLsYaLeJN13ALJfMj3FihtGvVQ39pBMUAiiGOh8wVw/2Kw0p6eauwvWsfn+5bOQcNe0XEX4T6teTJSKc9FdW5flb7PEZgRKXxdB1v90pjhIA8uUNXLpkXqwBlWHysI7VcJZdiAE7dF5M3d1uymEGxGu9FUB87wxQ13EyNNIgi+P5qkKESZuoFGK3MGDS9vvUgODdZAQTGsmSOmb0RXDokTpq0S/kdCHowKnZdpgn3PYOsXF4i0fTnvC2klJYgJR4/QbdHbJ7wP1Qs1OIz3sUqTPxFAtZ+82GsY6KHeP8S6ZqoeX1LDinqRDtMerAYraMSunGjJ3RDX18yNARXzd74Xu38sUeT8CmRTxqMqn+4ckiqY5roxlLY62X0KA13bTjOxq7TzrOcXLaedud/ZByCNJUgsSnq3dL2RrzXZOcVYcBr0Bdeo5/QEIhKnzQJ/mnkM1sWSI8eXRirwZb6R7vO45tI1zsWqlUEs5rvKPY5ZOKOvwsaUivJyL3kEAqgrvBxzzEU6pB1FaB8BU8CoX1sZeWoVgdnl/9KzxxMx+poJmOrqUFgixsZIhEJ1O6+l5yx9rH0pGLrkv/VO5TIsbMqGAK6WOt0KryKq6uljt6uXEkWp7Y0vgjgYl2oodhJCU6TH4TMy8i70d+NLnjVXi/7iVysRYqV73DZ/bMpPnrTTfsc+O1Utvra4kIquGPCbuUROo/MI=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(16576012)(8676002)(2906002)(70206006)(2616005)(31686004)(31696002)(86362001)(186003)(316002)(5660300002)(36906005)(16526019)(356005)(54906003)(36756003)(508600001)(70586007)(26005)(47076005)(110136005)(7636003)(4326008)(336012)(82310400003)(53546011)(8936002)(426003)(36860700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 10:49:34.7835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0bc8bc-bf5f-4f79-cd84-08d94cfe64fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 22/07/2021 00:26, Dmitry Osipenko wrote:
> The regulator coupler drivers now use regulator-driver API function that
> isn't available during compile-testing. Make regulator coupler drivers
> dependent on CONFIG_REGULATOR in Kconfig.
> 
> Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.
> 
>  drivers/soc/tegra/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index db49075b1946..1224e1c8c2c9 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -15,7 +15,7 @@ config ARCH_TEGRA_2x_SOC
>  	select PL310_ERRATA_769419 if CACHE_L2X0
>  	select SOC_TEGRA_FLOWCTRL
>  	select SOC_TEGRA_PMC
> -	select SOC_TEGRA20_VOLTAGE_COUPLER
> +	select SOC_TEGRA20_VOLTAGE_COUPLER if REGULATOR
>  	select TEGRA_TIMER
>  	help
>  	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
> @@ -29,7 +29,7 @@ config ARCH_TEGRA_3x_SOC
>  	select PL310_ERRATA_769419 if CACHE_L2X0
>  	select SOC_TEGRA_FLOWCTRL
>  	select SOC_TEGRA_PMC
> -	select SOC_TEGRA30_VOLTAGE_COUPLER
> +	select SOC_TEGRA30_VOLTAGE_COUPLER if REGULATOR
>  	select TEGRA_TIMER
>  	help
>  	  Support for NVIDIA Tegra T30 processor family, based on the
> @@ -154,7 +154,9 @@ config SOC_TEGRA_POWERGATE_BPMP
>  config SOC_TEGRA20_VOLTAGE_COUPLER
>  	bool "Voltage scaling support for Tegra20 SoCs"
>  	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
> +	depends on REGULATOR
>  
>  config SOC_TEGRA30_VOLTAGE_COUPLER
>  	bool "Voltage scaling support for Tegra30 SoCs"
>  	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
> +	depends on REGULATOR
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
