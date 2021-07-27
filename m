Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80409C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 19:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61BB160F6E
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 19:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhG0TF7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 15:05:59 -0400
Received: from mail-dm6nam08on2041.outbound.protection.outlook.com ([40.107.102.41]:17697
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229453AbhG0TF6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 15:05:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQ7tbSd0zCj82S+hGtTmiWxr0ldpZmrAnnxA4Lu2rzGOfLs19/ZRa5CoLfpmKaMENI1gFQldsrNyJOfBCmbL/DACsd+3GA0FL3gaX0YzuEW3oip4vfpt8Elm5B5Cjx1Tev3hD7AkE6/nHxiMZf0uO8cqmlkAihjJOwoHffhdlwEFMzU1P9ou8TpSjvdQkTtHZRlsrbe0WKNskpOkka1nROHxDYtw5+IRs/gPir2lGmKHczCiH69f0pJLzQ4J+4AMqsXWVx5gxtYdYRhyVWKjBQpwkx7SQ+/oxwoSGkuHmbKa1H9TjxWPgd3wrr/2ZABeWV2OEzmck6WbOVe5sOUeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgiJMlzn1fclC6Uammm1tCIODUAu/sujQRZrkzOglyc=;
 b=IyFkbpDcjKticP2Fk+yOgtjmsE0WHz1PjX1DMWhCoazQ3pexadrDT0CMMtJTpxPaJl8Dmr7zZO4X7f9OY6GdcsC2t/fAT88rOHkT56o8YIkJyq04AHIayWMU97F0jHDo1y2R3hOstOEWvbQrQN+f/vuAkvENkb6x2B6t5wpkOpKO5xncKMJZz2bgS92+X9krgBndyyB1ooThS5fPL0284xHNrbNaLz5Non2sCzqlNnYQd02BAb3mXUygErNEtiCCwz2PTueqJmEKE6D9VtD8IbNEUqXcEgZQP6DQqwGmLTR8XrNeHvi6VzHKkX+729CQ9jLDMyd5hAOqpI3gTH43xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgiJMlzn1fclC6Uammm1tCIODUAu/sujQRZrkzOglyc=;
 b=MOczAiB4X0u2Yk+d9ljsM5piSg55PScEue+Fui6MBVSvvMPosdy8/g84Fcy+D7FJ4zrMSndq75YnaQjlja/4J5HPy6lR176Wvz0BZ9D18hvyUx7nj3VnqfHqHF0jJew4pA9WAHjmWJpFtfnQpOvdU+/IC4a2aTqhIBIBfPbmmojCklXhh6IqOd6E1YDqhMxTzxgldyAbh24b0tQnvTipR95eD1S6KaBq05x5fZy5DAlMgHEeDh5d39EduC40Ug9SvDyBHGA8xTugI7VsjUcKtn609CaxZ/Ojvk8vQ+Al628bBSSB9rWkTHYmKcoNmP2Wimr8csczlemoh+NiZy5f8w==
Received: from BN9P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::20)
 by MWHPR1201MB2527.namprd12.prod.outlook.com (2603:10b6:300:df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 19:05:56 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::e2) by BN9P221CA0015.outlook.office365.com
 (2603:10b6:408:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Tue, 27 Jul 2021 19:05:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 19:05:56 +0000
Received: from [10.26.49.10] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 19:05:53 +0000
Subject: Re: [PATCH] arm64: tegra194: Fix Tegra194 PCIe EP compatible string
To:     Vidya Sagar <vidyas@nvidia.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <sagar.tv@gmail.com>
References: <20210727185055.11010-1-vidyas@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <23d08fdf-35e1-5af4-8992-17bc2f0ce7ef@nvidia.com>
Date:   Tue, 27 Jul 2021 20:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727185055.11010-1-vidyas@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba57bbdd-13b0-41bb-3b07-08d951319020
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2527:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2527C0BF791800B38D9F9EDED9E99@MWHPR1201MB2527.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEs5crk2DwaCPBkwQK7JAyY5CVG0p2xEmhiFDqirZd9GZCR28qGuWnN70puMT5F+lIf9Ib41QVcRU4sLCojfmxaPVn9XRz5Poh9uwh4rZfPMgWqsSBhcITuwj6YWY3/4GF5OiFeimuHHP/l9mk9nMKfGw6elEQe+uDQbM+SNKh/GuD5geY0iu9pNSM1sONo0j9KdOBKK7wceKLTPhvMw4u+uBsgQcrImqKWrpodVJCVw/KYQGGTzwkBTQWl6ISihSQ9AHY/M4TXu34te1owEp7nPISOTJasgSeeLN2OmBCSuRrzvgXuRaTMhc+Lul9LPLk4JeCz9g4f8tmMp9KI1SZH8OPWWdvJeVBJpUw4w13RBfcJcevvYfmJbl0s68nnCAL5Cw7ZNg2Lp5zE8IGm6Os6YjJVsyII7KTRyUEMlMfuiNgy8r778JLMLJa03CZWFcBRd5iV3GQuohl/4az+IdST3BZTWwLEHUn0kKDTLot0NhG4Fpg5RdEmwFvAsy9anXIB3Rt62oHBDiVCZlhNqCrjCboJKC2VVr82lk/AM9mcY2gy/EdUeRgequDGNqamKjUju1FvMaioYo+4UI0g1At52HBIdgmD6b4BNGqb1AJdVHZpidJCoThZ4ZKcIaNiNLTFHqNyRKgf9GmqecYW+v+6s1YdShMY5A2BVWP6f94rMCutLfuMHhP5PTGoXMXjsTzPGvnwZ0YlMEnCipFOQ63dBwc09dVO7oP0fAoZ1ui0=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(36840700001)(46966006)(2616005)(8936002)(426003)(36906005)(36860700001)(186003)(31696002)(53546011)(31686004)(36756003)(4326008)(5660300002)(478600001)(82310400003)(2906002)(356005)(82740400003)(16576012)(86362001)(83380400001)(336012)(47076005)(316002)(110136005)(16526019)(7636003)(26005)(70206006)(54906003)(70586007)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 19:05:56.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba57bbdd-13b0-41bb-3b07-08d951319020
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2527
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/07/2021 19:50, Vidya Sagar wrote:
> The initialization sequence performed by the generic platform driver
> pcie-designware-plat.c for a DWC based implementation doesn't work for
> Tegra194. Tegra194 has a different initialization sequence requirement
> which can only be satisfied by the Tegra194 specific platform driver
> pcie-tegra194.c. So, remove the generic compatible string "snps,dw-pcie-ep"
> from Tegra194's endpoint controller nodes.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 076d5efc4c3d..2f58f3e4746b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -2098,7 +2098,7 @@
>  	};
>  
>  	pcie_ep@14160000 {
> -		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
> +		compatible = "nvidia,tegra194-pcie-ep";
>  		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
>  		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
>  		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
> @@ -2130,7 +2130,7 @@
>  	};
>  
>  	pcie_ep@14180000 {
> -		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
> +		compatible = "nvidia,tegra194-pcie-ep";
>  		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
>  		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
>  		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
> @@ -2162,7 +2162,7 @@
>  	};
>  
>  	pcie_ep@141a0000 {
> -		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
> +		compatible = "nvidia,tegra194-pcie-ep";
>  		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
>  		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
>  		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
> 


Thanks! We should also push a patch to remove this compatible string
from the example in
Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt. For this
one ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
