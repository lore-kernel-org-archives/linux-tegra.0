Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF044C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 01:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D5B12311B
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 01:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbhAMBV3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 20:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbhAMBV2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 20:21:28 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ABCC061575;
        Tue, 12 Jan 2021 17:20:48 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p15so29690pjv.3;
        Tue, 12 Jan 2021 17:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LWJKx5e/3nBhUYP+sVXTWgSC9bn3CdJLTBX9fjR0myY=;
        b=GDX+7VGOIINqOYBqiCBUfaOL/XOcA6euoO0h3za//aZwedDlehD3Si+8V8Fovqu8tw
         O5oCO7pqbncIw+mKm+1ZiNGpz5jBM85FBCIDMPnDckkAsx+vSh6BLOZ25V5UP4vmExaq
         kbqEOIAP+6Z6k/zjluH1RooZ5HNa/XFXbE1QR4Dzt4AkZQxB4YerdxLq2S0BOJGpvvmY
         W+D2byFS5vrHkSHjH0SYe137KRV6QPHQ5ZClQiuBh4x6nTvQwHBZXVxZoPrF1qB7JHGh
         TpCbCgiFKN9T3EsAoIFHnTPTPySNBI717DUgI26gOo7oAKDtIS1rfsDCgtn9Y0mW5nfJ
         RFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LWJKx5e/3nBhUYP+sVXTWgSC9bn3CdJLTBX9fjR0myY=;
        b=hVsjA2uxntGeCozfW02Lffj40b8PWl8Bx/jUu7wSUgmPVBKUxtNpjCwd7dxVDzSo4D
         O1T8glXaF39o7Z4K+6vOgapsT0hWSL/O/HQJKx6wA1RDkFyF1mKqvfTYnecI+ODCgUHP
         hkspWePgvhd0ori0GPsiEWc/KpWUPj/KUxd11PmMqZGGMqy2gV3wIEXQI3UR3uRnVlST
         lM4KbEDSSL0NIGmsEhzZ+hOxuA3O5sq0kpzpFQcvr1Bwz3zOKYsouW7TjW8agAQ4pKtS
         fZowNSshLcfRNQie2pJ4DEnFCZZgYFu3MAO2OsdRGqcDQVv0wQkygLnUAiUbaUlugPIY
         J9gw==
X-Gm-Message-State: AOAM533OE8tzbiJ7c7Txp0MxIeJejwYE8K6Jo2V0JZUEaYogJlMAL80K
        ujLfxBXyCeSO787XNNnGIjU=
X-Google-Smtp-Source: ABdhPJxm6gvC8e5Szk4GNsXqMZ73c0ahtHKRbf0g00YQY0/ymdib8nTj09R21K+oIPgXLDG2hZZ0FQ==
X-Received: by 2002:a17:90a:ae02:: with SMTP id t2mr466890pjq.169.1610500847583;
        Tue, 12 Jan 2021 17:20:47 -0800 (PST)
Received: from b29397-desktop ([84.17.34.154])
        by smtp.gmail.com with ESMTPSA id g30sm319909pfr.152.2021.01.12.17.20.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 17:20:46 -0800 (PST)
Date:   Wed, 13 Jan 2021 09:20:36 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra
 ChipIdea USB driver
Message-ID: <20210113012036.GA1560@b29397-desktop>
References: <20201218120246.7759-1-digetx@gmail.com>
 <20201229051615.GA5823@b29397-desktop>
 <b2c21687-4cb9-ba0a-a724-3a82ddd8daff@gmail.com>
 <713c4b1a-a4b3-41ad-7aad-c49e594f778b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <713c4b1a-a4b3-41ad-7aad-c49e594f778b@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-01-12 09:56:37, Dmitry Osipenko wrote:
> 29.12.2020 17:26, Dmitry Osipenko пишет:
> > 29.12.2020 08:16, Peter Chen пишет:
> >> On 20-12-18 15:02:37, Dmitry Osipenko wrote:
> >>> This series implements Runtime PM support for the Tegra ChipIdea USB driver.
> >>> It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
> >>> the RPM is supported by both UDC and host controllers, secondly this opens
> >>> opportunity for implementing OTG support in the future.
> >>>
> >>> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
> >>> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
> >>> helping with the extensive and productive testing!
> >>>
> >>> Changelog:
> >>>
> >>> v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.
> >>>
> >>>     - Improved wording of the deprecated Kconfig entry as was suggested
> >>>       by Alan Stern.
> >>>
> >>>     - Added ACKs from Thierry Reding and Alan Stern.
> >>>
> >>>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
> >>>       just for completeness, since we can now switch OTG to host mode in
> >>>       the ChipIdea driver. Although, OTG support remains a work-in-progress
> >>>       for now.
> >>>
> >>> v2: - Improved comments in the code as it was suggested by Peter Chen and
> >>>       Sergei Shtylyov for v1.
> >>>
> >>>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
> >>>       a error code path, like it was suggested by Peter Chen.
> >>>
> >>>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
> >>>       as was suggested by Alan Stern.
> >>>
> >>>     - Improved commit message and added ACK from Thierry Reding to the patch
> >>>       that removes MODULE_ALIAS.
> >>>
> >>>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
> >>>       additional VBUS sensor. This was reported and tested by Ion Agorria.
> >>>
> >>>     - Added t-b from Ion Agorria.
> >>>
> >>> Dmitry Osipenko (8):
> >>>   usb: phy: tegra: Add delay after power up
> >>>   usb: phy: tegra: Support waking up from a low power mode
> >>>   usb: chipidea: tegra: Remove MODULE_ALIAS
> >>>   usb: chipidea: tegra: Rename UDC to USB
> >>>   usb: chipidea: tegra: Support runtime PM
> >>>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
> >>>   usb: host: ehci-tegra: Remove the driver
> >>>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
> >>>     USB_EHCI_TEGRA
> >>>
> >>> Peter Geis (1):
> >>>   usb: chipidea: tegra: Support host mode
> >>
> >> Chipidea related (patch 3-7) are applied, thanks.
> > 
> > Hello Peter,
> > 
> > Thank you for applying the patches.
> > 
> > Who will apply the remaining patches?
> > 
> > The Chipidea patch #6 depends on the PHY changes, otherwise USB will
> > suspend and never resume.
> > 
> 
> Peter, could you please apply the PHY and defconfig patches along with
> the CI patches to -next? I.e. the whole series. Preferentially in
> original ordering of patches should be preserved.
> 

Hi Dmitry,

Usually, Greg could apply all USB patches, if I apply other USB related
patches, it may cause conflict with other patches in other's tree.
Greg, free feel to apply this series with 
Acked-by: Peter Chen <peter.chen@kernel.org>
for chipidea part.

For ARM defconfig patch, I think it should go ARM's tree.

-- 

Thanks,
Peter Chen

