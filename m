Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C953C4167B
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Dec 2022 12:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiL0MDn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Dec 2022 07:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbiL0MDV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Dec 2022 07:03:21 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0779BE2B;
        Tue, 27 Dec 2022 04:01:09 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5F1686008804;
        Tue, 27 Dec 2022 12:00:26 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id KLYO961PBBUj; Tue, 27 Dec 2022 12:00:23 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D981D6000872;
        Tue, 27 Dec 2022 12:00:22 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1672142423;
        bh=HY/iceWFNHXcY6/T59a4bc7jEBDobCcHxPzG+znEMhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=J0YTsz5DWpVbzP8Q6IWQW4eow+xN3yhY87VRr8Rnmk2c9kMRFJZect+oXPgS8KUIu
         1iXVhffS7vMl8C7Lovwfgy76m1v0fGvbCC6OZACo0T/7EjVw5VIAw/JoV0bCFRU9bG
         31+vZKk+Ph7i53nCJU0EkUZHgW73io69nInMq/iE=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 95013360075;
        Tue, 27 Dec 2022 12:00:19 +0000 (WET)
Date:   Tue, 27 Dec 2022 11:58:51 +0000
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Rayyan Ansari <rayyan@ansari.sh>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, sam@ravnborg.org
Subject: Re: [v2,3/4] drm/panel: Add driver for JDI LPM102A188A
Message-ID: <20221227115851.mpvlbero4nsdq4r5@wslaptop>
References: <20221025153746.101278-4-diogo.ivo@tecnico.ulisboa.pt>
 <7aa53ccc-2942-e2d4-9c84-32f1bdf462ad@ansari.sh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aa53ccc-2942-e2d4-9c84-32f1bdf462ad@ansari.sh>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

On Fri, Dec 23, 2022 at 03:33:40PM +0000, Rayyan Ansari wrote:
> On 25/10/2022 16:37, Diogo Ivo wrote:
> > +config DRM_PANEL_JDI_LPM102A188A
> > +	tristate "JDI LPM102A188A DSI panel"
> > +	depends on OF && GPIOLIB
> > +	depends on DRM_MIPI_DSI
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	help
> > +	  Say Y here if you want to enable support for JDI LPM102A188A DSI
> > +	  control mode panel as found in Google Pixel C devices.
> Shouldn't this be "command mode panel" instead of "control mode panel"?

Yes, it should.

> > +static struct mipi_dsi_driver jdi_panel_dsi_driver = {
> > +	.driver = {
> > +		.name = "panel-jdi-lpm102a188a-dsi",
> Is the "-dsi" suffix needed here? Other panel drivers don't have this.

I had not noticed this, and I will drop it.

Thank you for your review and attention to detail. I will address these
points in the next version.

Diogo Ivo
