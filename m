Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79983C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 02:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AB6361452
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 02:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhDVCGp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 22:06:45 -0400
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:14765
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229706AbhDVCGp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 22:06:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laKwhS/DCoQKKsZGdlIIyTcytB6yf49Fh/HZ49DGdyeOyzoNAi6xG5odfqG0/KL56y3bvniRT1c2YDoHPDQyO9JpGHFT8N5DKXUPibI47RaauNdqzSmizxcKthaMo0VqWyFEVkydR4of0KI1+UUF2lXgp7ngzgJroObS27LwLYvLPGW8KK0VDp99FFVZMohHsO23PmLpKwl6BWgcKRucpj6pWncWIoN03Eq3perP4qZIHb6kaAsaQX7JKzZeWngSPnwdQPLp9qkKm8ay8PktMPrkYW8TBMoK5pgGgOqbIbT8NJ+U+F/tDYvUrqbDPHw1IgLPBIVSZdrZBvjn9xxuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48MLJ+Z9LrNEApYFNpsdTDRXfLqxXmLsvIPdhJreLl0=;
 b=c5XeaYUzQbkY7rEsGwNYDwFf9UOURdUZtu0T94Em4tlC9A1o9CS3fdPbMom1Ub3shIxIZhGO19v8N+5Q6lbGi41uy77hxbkvSQhqkFduD6uhlRifKJ0GEvVeEUvYt+FvVIhahAk4hEmfERBTMzTZmCH0B3Tfk0aBZjHhZRe/mMhcTlP7XNC+nHKyrtA/HbIQSNVvaOFjXYZ5AKAE0jd+7zMhZ2n1mk/O2hsnnrex/FUtbfW8R2SmJZrTU06jHaeW3V0VocAGi6tojGwC43Un12zNxvjgWUmcaFDIDJEIDJkHj8gxJ/njCzqjrxmcUEHkORdIbaFEpESHX276m8s+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48MLJ+Z9LrNEApYFNpsdTDRXfLqxXmLsvIPdhJreLl0=;
 b=e/CKZoKR0ycEO37WMohDtFtjc5hmAEUT+ywDCDkrLz9OESAv0Evl/invgGIjKlSxThai+MFzTA87fyunqEbyrWV9Z+DVgYjVU8in20kBaF1dzZY8qo7sG/hM2lkJzu2Yohz5OGUTJHmcvdGnQ9Xlq/AEn73ki8hTpX+H1c2Nc0eEBE47IsSIH6Lef1BcdBPAeGM/xUgRdAAlkhlTuzJYDUSYf4Kh6zPqikcISRFqxwQPrg0JrocWxqBsPPRnVkz5CIYAzSPSRQSxorW8eJ2kBqVm8XZHk0nLw/dYyZTxPxqfn5J/1RgDBoNfVbjinQQM7E4XWSMqXkqvl1mIYa6lxg==
Received: from DM5PR22CA0005.namprd22.prod.outlook.com (2603:10b6:3:101::15)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 22 Apr
 2021 02:06:09 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::30) by DM5PR22CA0005.outlook.office365.com
 (2603:10b6:3:101::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Thu, 22 Apr 2021 02:06:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 02:06:08 +0000
Received: from [10.19.101.193] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 02:06:06 +0000
Subject: Re: [PATCH 2/2] usb: xhci: tegra: mark PM functions as __maybe_unused
To:     Arnd Bergmann <arnd@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Arnd Bergmann <arnd@arndb.de>, <linux-usb@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210421135613.3560777-1-arnd@kernel.org>
 <20210421135613.3560777-2-arnd@kernel.org>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Organization: NVIDIA
Message-ID: <f7369c80-8455-44cd-7d34-dfe1975a3b58@nvidia.com>
Date:   Thu, 22 Apr 2021 10:06:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421135613.3560777-2-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1731512-ef3a-44fe-9209-08d9053331e4
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24514D0A123E8D65FEB3F530D0469@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvDV7dZw+7WLMqEFzZ9fkehnwRam6h2oS6xT+JkbCvSBVO5TliHotIp0YyICGTqG+Ts2nS6+469p/eFZ8h4Dw/68jx22nN1BHGX492Gn8Tr98v6YYhY8CzTJz5HnosuXWxMZDRQF3PlQk3Mc8KU0hZj2P0m2iREV2i6gr0Ks+cBcMgPpp0pJm6xYj9zQUgi13ud1862P4hMK2nWJ5gRBYxUHGu8+wV0p5belImqOEAGLVAKzLoVn3i/rMpEnVGG5LPJaTRYL8TMlS6+Yl9eZfb/JCt7quQCRx8dI2XsWYpB4AmAa0o4lNNwWjVVsE5SF8g3Y2qfVI6r6ERZ6LiZMP3cpOwepLmc7gZSisGVKmmCehIcvpJmbdTPNyHz+dmXeURC5Uyy/x1hEXS8gUfqI6ILOgg3G7NdNj2VkK5TfXLZZvqL0HDJyJPeYDvyumxmsZNzm2MFESDYBhWvOKJZ8B0fddKgtbNPlI652KJoU427OqbybRQ/fnAOUrzSbBfA3Qb4lYlg/KSwex8TGpULlIStw6dw7/UJ/DxclYohzi58TM5Ob17T53/cJHS6ZjQVZuPfeggGUnoJd6zHUM9vd3hQGEfA8gx2M3dceBlAZKH8sjHk3jw9agZ5TrWE0WAekf0E+XP+VjpdaNhPLJDTw616tKDClg9R5zGSHw3puyjTpQZHDcxYJbR49BNMdaepE
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(53546011)(8936002)(16526019)(70586007)(110136005)(31696002)(186003)(478600001)(26005)(82740400003)(36916002)(36860700001)(2906002)(356005)(36756003)(82310400003)(31686004)(8676002)(5660300002)(316002)(2616005)(426003)(83380400001)(4326008)(54906003)(86362001)(36906005)(47076005)(70206006)(336012)(16576012)(6636002)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 02:06:08.7010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1731512-ef3a-44fe-9209-08d9053331e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Arnd,
Thanks for the fix.

Reviewed-by: JC Kuo <jckuo@nvidia.com>


On 4/21/21 9:56 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added #ifdefs in the PM rework were almost correct, but still
> cause warnings in some randconfig builds:
> 
> drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined but not used [-Werror=unused-function]
>  2147 | static int tegra_xusb_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' defined but not used [-Werror=unused-function]
>  2105 | static int tegra_xusb_suspend(struct device *dev)
> 
> Replace the #ifdef checks with simpler __maybe_unused annotations to
> reliably shut up these warnings.
> 
> Fixes: d64d362f1d8b ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/host/xhci-tegra.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index ce97ff054c68..adead2377149 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1787,7 +1787,6 @@ static int tegra_xusb_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#if IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
>  static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
>  {
>  	struct device *dev = hub->hcd->self.controller;
> @@ -2102,7 +2101,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
>  	return err;
>  }
>  
> -static int tegra_xusb_suspend(struct device *dev)
> +static __maybe_unused int tegra_xusb_suspend(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>  	int err;
> @@ -2144,7 +2143,7 @@ static int tegra_xusb_suspend(struct device *dev)
>  	return err;
>  }
>  
> -static int tegra_xusb_resume(struct device *dev)
> +static __maybe_unused int tegra_xusb_resume(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>  	int err;
> @@ -2174,10 +2173,8 @@ static int tegra_xusb_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
> -#ifdef CONFIG_PM
> -static int tegra_xusb_runtime_suspend(struct device *dev)
> +static __maybe_unused int tegra_xusb_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>  	int ret;
> @@ -2190,7 +2187,7 @@ static int tegra_xusb_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int tegra_xusb_runtime_resume(struct device *dev)
> +static __maybe_unused int tegra_xusb_runtime_resume(struct device *dev)
>  {
>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>  	int err;
> @@ -2201,7 +2198,6 @@ static int tegra_xusb_runtime_resume(struct device *dev)
>  
>  	return err;
>  }
> -#endif
>  
>  static const struct dev_pm_ops tegra_xusb_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_xusb_runtime_suspend,
> 
