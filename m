Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F6C4167B
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Nov 2022 12:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKYMmI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Nov 2022 07:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiKYMmH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Nov 2022 07:42:07 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3076134;
        Fri, 25 Nov 2022 04:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669380126; x=1700916126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xl+Bv7/Qyg1Mpk472aQOIV4FudsK3xM+T2iuA3fSdh4=;
  b=F9GRsUpJ0Z3OY/d6mOUxPcJdIkD60g/p76IugLExiqlj1A6YEooGx7Id
   8Rpw24vC9volwurIKcoPrQYb1uyY3nlnNiAzK2hWj/jjxf3GRbauwPbIQ
   s70pWJtxuuNH8YRBq5h2y8nSKQjShSUF6dhbmt/rUIs87pXPGu44hRrpW
   ZOcZjjlQ51387m8L8kzxGPideOdL9mZFdGvrFaA+2byG4ejfSCJnIN2Xv
   6cZhJpwi5xr9HXn4o2Ln1raY7QiTnlzcDff/TISuFAoggg5PAiWgR0WYu
   xkI3kIBcelbJQ7MvFVzIDFsvX4SqbVlV4e1FFB8ouy9rIYM//5o7+eSOo
   w==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="125095415"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 05:42:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 05:42:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 05:42:04 -0700
Date:   Fri, 25 Nov 2022 12:41:46 +0000
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
Message-ID: <Y4C4Cp1D+QEKWiaf@wendy>
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103144200.1479640-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

> +        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */

This seems to be breaking dt_binding_check in today's linux-next:
FATAL ERROR: Can't generate fixup for reference to path &{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}

Am I missing something? My dt-schema is today's main.

Thanks,
Conor.

