Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A287C7EE24
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 09:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237110AbjFFJsN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 05:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbjFFJsM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 05:48:12 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52BE10C6
        for <linux-tegra@vger.kernel.org>; Tue,  6 Jun 2023 02:48:04 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3a7ec564-044f-11ee-a9de-005056bdf889;
        Tue, 06 Jun 2023 12:48:02 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 6 Jun 2023 12:48:02 +0300
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, Manish Bhardwaj <mbhardwaj@nvidia.com>
Subject: Re: [PATCH] gpio: tegra186: Check PMC driver status before any
 request
Message-ID: <ZH8A0nmXrEyY0zu1@surfacebook>
References: <20230606071717.8088-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606071717.8088-1-pshete@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tue, Jun 06, 2023 at 12:47:17PM +0530, Prathamesh Shete kirjoitti:
> This patch fixes the issue where even if PMC driver status is
> disabled still we are trying to look up for the IRQ domain
> that PMC driver would've registered if it had been enabled.

-ENOPARSE.

Also mind grammar punctuation.

-- 
With Best Regards,
Andy Shevchenko


