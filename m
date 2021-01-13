Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AD6C4332B
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 10:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEA242337F
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 10:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbhAMK0w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 05:26:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbhAMK0w (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 05:26:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8199222CAF;
        Wed, 13 Jan 2021 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610533571;
        bh=rzEyJxU4Qr5a7kA1OlST212hDS8gbHmnH/jNg9ftO1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y+I2WQBKfaQecsrwVE6aJqG8fXL5mhUOFUk9FviKzK6cmlN2ovZpu+2oKxZBGXBNx
         FAg5cc88UvZWjrM2pkB2CLHnvtkec6AdmDRK9C/gH2hzerxdiOzZGOqfT2CmEA5Twe
         jpa/gLNOq8D4DYOJISt0xw1nDFy49P4VkMPgwCpg=
Date:   Wed, 13 Jan 2021 11:27:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
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
Message-ID: <X/7K9tB4B3DkjfKk@kroah.com>
References: <20201218120246.7759-1-digetx@gmail.com>
 <20201229051615.GA5823@b29397-desktop>
 <b2c21687-4cb9-ba0a-a724-3a82ddd8daff@gmail.com>
 <713c4b1a-a4b3-41ad-7aad-c49e594f778b@gmail.com>
 <20210113012036.GA1560@b29397-desktop>
 <5cfc067a-0b3b-05fc-7567-4b2b475dd6e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cfc067a-0b3b-05fc-7567-4b2b475dd6e4@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 13, 2021 at 12:01:51PM +0300, Dmitry Osipenko wrote:
> 13.01.2021 04:20, Peter Chen пишет:
> > On 21-01-12 09:56:37, Dmitry Osipenko wrote:
> >> 29.12.2020 17:26, Dmitry Osipenko пишет:
> >>> 29.12.2020 08:16, Peter Chen пишет:
> >>>> On 20-12-18 15:02:37, Dmitry Osipenko wrote:
> >>>>> This series implements Runtime PM support for the Tegra ChipIdea USB driver.
> >>>>> It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
> >>>>> the RPM is supported by both UDC and host controllers, secondly this opens
> >>>>> opportunity for implementing OTG support in the future.
> >>>>>
> >>>>> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
> >>>>> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
> >>>>> helping with the extensive and productive testing!
> >>>>>
> >>>>> Changelog:
> >>>>>
> >>>>> v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.
> >>>>>
> >>>>>     - Improved wording of the deprecated Kconfig entry as was suggested
> >>>>>       by Alan Stern.
> >>>>>
> >>>>>     - Added ACKs from Thierry Reding and Alan Stern.
> >>>>>
> >>>>>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
> >>>>>       just for completeness, since we can now switch OTG to host mode in
> >>>>>       the ChipIdea driver. Although, OTG support remains a work-in-progress
> >>>>>       for now.
> >>>>>
> >>>>> v2: - Improved comments in the code as it was suggested by Peter Chen and
> >>>>>       Sergei Shtylyov for v1.
> >>>>>
> >>>>>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
> >>>>>       a error code path, like it was suggested by Peter Chen.
> >>>>>
> >>>>>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
> >>>>>       as was suggested by Alan Stern.
> >>>>>
> >>>>>     - Improved commit message and added ACK from Thierry Reding to the patch
> >>>>>       that removes MODULE_ALIAS.
> >>>>>
> >>>>>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
> >>>>>       additional VBUS sensor. This was reported and tested by Ion Agorria.
> >>>>>
> >>>>>     - Added t-b from Ion Agorria.
> >>>>>
> >>>>> Dmitry Osipenko (8):
> >>>>>   usb: phy: tegra: Add delay after power up
> >>>>>   usb: phy: tegra: Support waking up from a low power mode
> >>>>>   usb: chipidea: tegra: Remove MODULE_ALIAS
> >>>>>   usb: chipidea: tegra: Rename UDC to USB
> >>>>>   usb: chipidea: tegra: Support runtime PM
> >>>>>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
> >>>>>   usb: host: ehci-tegra: Remove the driver
> >>>>>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
> >>>>>     USB_EHCI_TEGRA
> >>>>>
> >>>>> Peter Geis (1):
> >>>>>   usb: chipidea: tegra: Support host mode
> >>>>
> >>>> Chipidea related (patch 3-7) are applied, thanks.
> >>>
> >>> Hello Peter,
> >>>
> >>> Thank you for applying the patches.
> >>>
> >>> Who will apply the remaining patches?
> >>>
> >>> The Chipidea patch #6 depends on the PHY changes, otherwise USB will
> >>> suspend and never resume.
> >>>
> >>
> >> Peter, could you please apply the PHY and defconfig patches along with
> >> the CI patches to -next? I.e. the whole series. Preferentially in
> >> original ordering of patches should be preserved.
> >>
> > 
> > Hi Dmitry,
> > 
> > Usually, Greg could apply all USB patches, if I apply other USB related
> > patches, it may cause conflict with other patches in other's tree.
> > Greg, free feel to apply this series with 
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > for chipidea part.
> > 
> > For ARM defconfig patch, I think it should go ARM's tree.
> > 
> 
> Thank you for the answer!
> 
> It's not the ARM defconfig, but a local tegra_defconfig. It should be
> fine to take the patch via the USB tree since Thierry already acked it
> and asked to do so.
> 
> Greg, please take this whole series. Thanks in advance!

All now applied, thanks!

greg k-h
