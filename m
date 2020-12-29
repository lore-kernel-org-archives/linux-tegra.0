Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DADC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Dec 2020 14:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71DD920791
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Dec 2020 14:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgL2O1n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Dec 2020 09:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgL2O1m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Dec 2020 09:27:42 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11514C061793;
        Tue, 29 Dec 2020 06:27:02 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 23so31089804lfg.10;
        Tue, 29 Dec 2020 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LGabMZopnL6SB88PMZzqPHBgHYvrs1f9wbRutggIZ88=;
        b=iPruUrxV32FzSB+pB0Gu6cH8j/xfMoEROpJoSn1kjwR4J1KhwVqNZMhoRQ6Zga90f/
         /b/IBlMJP12r3gwAhSisMGw+1E3dik9v7P2A+0gBZ5f6GTcejn9nphmBKmTXcJrlkWtk
         0lCdEx3zZPp8Q4WfnrVcG7ZWOPN32w0k/FuRo+imBS8hRGgrrYRz1VYM9YWgwFkQW07t
         OvdsitYlMqW39G8XnrqitBZsNr6surmS0P7XdfSIrj+kIIbR/hj5aen/PEoVCUvX674R
         JE46CG5m1VDGjMjat/+Sg8HoL5+NSkzwYH4zkZZ90lFNnvWUgG5DWf9xVqR99JlXFjko
         fe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LGabMZopnL6SB88PMZzqPHBgHYvrs1f9wbRutggIZ88=;
        b=cOVAwL7pPCuM4oZg5B8p24jOa9+k3xVvfybt+Yj7OF6aKOmK9S+zyiV+vJ64LiYz8G
         0VW53e7vRJ8WImBUlyiVyOW6Cw/BS4iYk7gUPVYb3+g/l48wmDuRHAJK8fXr/7TlCGtm
         vjqGsxe+kbnTRtyru0oUtrOMBzIEgytedmSIldtTUHzuVyV4jha9D5lNusPA7qTudurD
         SVYvxzQcdVrI9oxJK1gvv4MWbecSJuN4N5F3+xQpJT/Em20WN4T9LVFi8bEZRUYdp88Y
         u3h4R6q596uSzl663oGcxTtSkdOR6+bw4Mon83SFy9R0r07KvYZ/dHU87qyS7Ma1sHSr
         PT/A==
X-Gm-Message-State: AOAM531aH/om4jtfnzynxCzAD96k98ubglTXnV2/+5drtkL2BDOg3hTS
        cWFXdjk+5hQl1GqEJWSutgPBpl6Uopw=
X-Google-Smtp-Source: ABdhPJyBLxO4R6WPCEEj8HasNKL8GPI3plRDByNm9JLuTXWJTXnV9lOG5NfVGPvfFCRLWGi+3YC4ow==
X-Received: by 2002:a2e:3514:: with SMTP id z20mr23093019ljz.110.1609252020452;
        Tue, 29 Dec 2020 06:27:00 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id q12sm6914777ljc.49.2020.12.29.06.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Dec 2020 06:26:59 -0800 (PST)
Subject: Re: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra ChipIdea
 USB driver
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218120246.7759-1-digetx@gmail.com>
 <20201229051615.GA5823@b29397-desktop>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b2c21687-4cb9-ba0a-a724-3a82ddd8daff@gmail.com>
Date:   Tue, 29 Dec 2020 17:26:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201229051615.GA5823@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.12.2020 08:16, Peter Chen пишет:
> On 20-12-18 15:02:37, Dmitry Osipenko wrote:
>> This series implements Runtime PM support for the Tegra ChipIdea USB driver.
>> It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
>> the RPM is supported by both UDC and host controllers, secondly this opens
>> opportunity for implementing OTG support in the future.
>>
>> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
>> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
>> helping with the extensive and productive testing!
>>
>> Changelog:
>>
>> v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.
>>
>>     - Improved wording of the deprecated Kconfig entry as was suggested
>>       by Alan Stern.
>>
>>     - Added ACKs from Thierry Reding and Alan Stern.
>>
>>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
>>       just for completeness, since we can now switch OTG to host mode in
>>       the ChipIdea driver. Although, OTG support remains a work-in-progress
>>       for now.
>>
>> v2: - Improved comments in the code as it was suggested by Peter Chen and
>>       Sergei Shtylyov for v1.
>>
>>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
>>       a error code path, like it was suggested by Peter Chen.
>>
>>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
>>       as was suggested by Alan Stern.
>>
>>     - Improved commit message and added ACK from Thierry Reding to the patch
>>       that removes MODULE_ALIAS.
>>
>>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
>>       additional VBUS sensor. This was reported and tested by Ion Agorria.
>>
>>     - Added t-b from Ion Agorria.
>>
>> Dmitry Osipenko (8):
>>   usb: phy: tegra: Add delay after power up
>>   usb: phy: tegra: Support waking up from a low power mode
>>   usb: chipidea: tegra: Remove MODULE_ALIAS
>>   usb: chipidea: tegra: Rename UDC to USB
>>   usb: chipidea: tegra: Support runtime PM
>>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
>>   usb: host: ehci-tegra: Remove the driver
>>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
>>     USB_EHCI_TEGRA
>>
>> Peter Geis (1):
>>   usb: chipidea: tegra: Support host mode
> 
> Chipidea related (patch 3-7) are applied, thanks.

Hello Peter,

Thank you for applying the patches.

Who will apply the remaining patches?

The Chipidea patch #6 depends on the PHY changes, otherwise USB will
suspend and never resume.
