Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AA2C7EE2C
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Jun 2023 10:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjFCKqj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Jun 2023 06:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjFCKqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Jun 2023 06:46:37 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622FACA
        for <linux-tegra@vger.kernel.org>; Sat,  3 Jun 2023 03:46:34 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id e300efe2-01fb-11ee-b972-005056bdfda7;
        Sat, 03 Jun 2023 13:46:25 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Sat, 3 Jun 2023 13:46:25 +0300
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/3] pinctrl: tegra: Add Tegra234 pinmux driver
Message-ID: <ZHsaAY1FQ57bsfC5@surfacebook>
References: <20230602141445.3012550-1-thierry.reding@gmail.com>
 <20230602141445.3012550-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602141445.3012550-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fri, Jun 02, 2023 at 04:14:44PM +0200, Thierry Reding kirjoitti:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> This change adds support for the two pin controllers found on Tegra234.

I'm not sure why my review got ignored. Did you receive it?

https://lore.kernel.org/linux-gpio/ZHlGTgdsqcGOmVN2@surfacebook/

It seems most of the comments are actual even for this version.
(Yes, you can ignore the struct pingroup usage as it's out of
 the scope of this change, obviously.)

-- 
With Best Regards,
Andy Shevchenko


