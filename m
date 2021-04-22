Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F064C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 01:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A04061104
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 01:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhDVBzb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 21:55:31 -0400
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com ([40.107.243.76]:3169
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229502AbhDVBzb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 21:55:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHNET/BGqXoICS3teWMoThqLldMLqrV+He8OdJ/Rfs0X0dTVzE577wqwDL8IXzpP+m2ZOeV6Bwr+vPhDZkAVUuwf0wd6ap2kR67hmnrT6qsDfO90Y75b2/KMmHyG5o7SsxDLEkJ0SkQ/8eB/DM2vdDvBdz1hIHW2k6oBLNT5RW5d1ZK13E2JCGOlYlJpK5mgqWbW258w1ZnG8/GQb5udkFCnwtByrMD9yxaF9JF6R/pL1ZoWK9MOZ4a6Lo1wLrtX5IBsF2wcpZ0IdryulRVT4V4QzTj8k/x3PYDQpVdFj3e0f8GvP7x+PUGBcl1uAKYPnvMjoxP7T1ogQXnOMk4u3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48MLJ+Z9LrNEApYFNpsdTDRXfLqxXmLsvIPdhJreLl0=;
 b=OvEZ9KJljc80iWS/DKnPLvwUoltDVf74zp+Zj+OX2KKLFmCBFa8cPnOUXCPdsAF4f1/3CtQXwzURbWYn4LSkfYuWEACaI2TE69KY6/WaFI0macywwgl78ALoWs0/mno4yd9YJaw+dy74fbx5fC2qLMaIDyW1bANrH1P2pa1PIA3h7OWeqIBHqMKdxu5zLN4KZQjUp86hwhVPFqIS0XigZF3ef9yccyY1dYqkn01kSztppXwyWmLuFnZN22gSi2ZC5yfJkd2PPptcN8wlEgAQM37yw3N6fgDwVwZYQXL2NHee8Ki4hYGSDXOJCXGIwNuaTUnZul1+Ou0nRjYYPQjv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48MLJ+Z9LrNEApYFNpsdTDRXfLqxXmLsvIPdhJreLl0=;
 b=jOe4lmLSA9t+1XUncOScn7dyeNRdp6B9E9scIPXnBP4l+7anfH14qETty3AK6aodJgP78RDIU5kn96xateznrnDH+95Wxdyy1HwBRAweRLQANOyz7d5rujv1OF5UTmE1kzbAN1YgBRVpaBYD4YwvYEkFtatSInFGWiHutAaVEwg8YXv8wOdNYmfdfBGyM/Bv29gJjPBHQ6aL6bBWlkAC2sx8laLKC7fpkeZBuzArvZ3gjNt67IrqoUx1+AL88lIGpPNUneO5WWjHuH1NaI1Qeic772ol7VLGWuRwMd7YSE8eZe/ypo2lZ4w6iopGWUbVXgs3cuusNDpiTgLekcnUHA==
Received: from DM6PR21CA0016.namprd21.prod.outlook.com (2603:10b6:5:174::26)
 by BY5PR12MB3860.namprd12.prod.outlook.com (2603:10b6:a03:1ac::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 01:54:54 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::33) by DM6PR21CA0016.outlook.office365.com
 (2603:10b6:5:174::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.7 via Frontend
 Transport; Thu, 22 Apr 2021 01:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 01:54:54 +0000
Received: from [10.19.101.193] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Apr
 2021 01:54:51 +0000
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
Message-ID: <865bdda5-77c5-a9fa-f563-b40d76dd8a81@nvidia.com>
Date:   Thu, 22 Apr 2021 09:54:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421135613.3560777-2-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2ef7a9-23ae-49e9-b4fb-08d905319fe9
X-MS-TrafficTypeDiagnostic: BY5PR12MB3860:
X-Microsoft-Antispam-PRVS: <BY5PR12MB386070C941CED7D4E7290524D0469@BY5PR12MB3860.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UuEbS9pjY9enJumfYajWsc8SVPliXlYLvA0G9ZKA9w6B/MJ6ak8ML2Y6JdrpnO0mlFT2JhnCKUv2vi9W96aknmnjTDKX78/9dJuzm2EgQ/hbIZRc0KM3XQ3EVfkJ95Lkgc+qD+UgzmqyHNCsvtITCla/QQfhOdLFoK520Fe9xeEEuAIr6IrDRuJGePVUBZoSxBekXAgJDMu7lOVCoA/eY1EvWSjCcI9z8U1IlpeyPxckbYM7Nd/qIUXywlB74ndER2rgSNHLPLqLQsx0RJtnJMNnvd+DKElLfy+x2zep/oQQqioLEF0LXbdRWqUuBD4jE/XtSibgKc0ExTjXtE+VXtxGbYo39bXGTrF59jA+wUKeSNG9ZpnH7oTrl6GltBSo5yWfBo+C1FD5SPIagySat/DOjki+HXEPCWd3pMBarJNxOGU6gKO0F7u3RmQJxcEUAaZvRwRq1KMOeTn//ZhpH83vzxM70FvU5kleDgB7CXcLTfu5OSnFhFpvIWqaVb7Em/UzPYSw/D4MIOgZ0bpYPnXhiO2Wq2M16GvyUs1B5dOyzxXJq9yRfqzaZ91Pee9MGTfkaAUvZjwomkFadrQGmKMANtUF2GTtUxm5vG/NtBZUM1cSB1sGPHY0UtMsSg8uUdpWwTmcinxTo+inz0rM/zbDfIYeQdvz6QelgzlAeo+K8FE35lDUINXSB5NDG1oM
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966006)(36840700001)(6636002)(478600001)(16526019)(53546011)(186003)(8676002)(36860700001)(110136005)(70586007)(70206006)(2906002)(47076005)(86362001)(7636003)(31696002)(82740400003)(31686004)(16576012)(82310400003)(2616005)(8936002)(316002)(4326008)(5660300002)(83380400001)(36916002)(26005)(336012)(426003)(36906005)(54906003)(356005)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:54:54.2956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2ef7a9-23ae-49e9-b4fb-08d905319fe9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3860
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
