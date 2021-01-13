Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27C5C433E9
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 14:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AA8B23433
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 14:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbhAMO3E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbhAMO3D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 09:29:03 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01376C061786;
        Wed, 13 Jan 2021 06:28:23 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u11so2715253ljo.13;
        Wed, 13 Jan 2021 06:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BQkLYxNw2hBfYRvo6J97P4nDGHACpyQNsZu0INKchuc=;
        b=JM0Vc3Z52w5ZNpDweGcxig4GF5gVF8EidkRTBBjIwcPjWmBxzU2SVCM0+ObhZ/OKz6
         GMtPSd5/6zDFO7db1i7oRXQ2oId9D8nULAqEubfFA+oX5TfUFKZNz3OjSZaD/tS4Q/zO
         kXTvyknJt89ulCo49F/LOtejL6T3Fat1PRL1M54ie+M4WJZLz5+QD5bm5jIyhdJIwT1t
         hxNLEe2nBjVELRkv5IH+/9vvdiSx0rw7kohH6Nt2NyycGWcOOMTuLT4AB86SErde9L3t
         XvYtRqOQusSbcmwSqOjgKSDxnQvbwashmFzqxOeVYvrytGKV0KYoRzQQNAkoeMfogTVf
         3Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BQkLYxNw2hBfYRvo6J97P4nDGHACpyQNsZu0INKchuc=;
        b=sHYheHx26GmPgHcUROIeIAR6Sz+Q31WmFp+zFBdTysc4QDID3PhslrHjqtCFb7O5hV
         Gx6PfCIW1JUQQvm8XUYTwBmhN/JPfkc3+8kGLK1L+gMgMmXJ0KIAuva6PaybmSth9UP+
         3Zxs+6/6tGJVtLlHGNiTRRljwNJwXCrwm+CSVY+j33bkgFsGPh0U3Kw+ozuZPJuA0iGB
         p82Ozq2rHe2Wfe6i1fD7PUyvoRshWj2l7UzAkrzB1diEC+vPx711SjUJmdG04HWwlwc/
         fzwT4r3qN83+ODQzFS1ilHMoasK0Q+Pe4nPTqvvtPs3cSuIjEwgokRGmK7G9V5uSr5vp
         mg+Q==
X-Gm-Message-State: AOAM533TC6ZBywDq4fXqmJYrQ9tU4PSnAJF7zh7+Bf0MZbwaT8O5V2m4
        T9eC0KoWEaeZ+9PxUGzCeW6dZPEgA8g=
X-Google-Smtp-Source: ABdhPJz1qHbR88Qom5UR9GN0WOhaW4QYBx2GxOhNj5Mqhfj3zIdtBT3voak2LHTeQ8k+yvMSzKpijw==
X-Received: by 2002:a2e:8046:: with SMTP id p6mr1065662ljg.132.1610548101127;
        Wed, 13 Jan 2021 06:28:21 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id d19sm225390lfi.128.2021.01.13.06.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 06:28:20 -0800 (PST)
Subject: Re: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra ChipIdea
 USB driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
References: <20201218120246.7759-1-digetx@gmail.com>
 <20201229051615.GA5823@b29397-desktop>
 <b2c21687-4cb9-ba0a-a724-3a82ddd8daff@gmail.com>
 <713c4b1a-a4b3-41ad-7aad-c49e594f778b@gmail.com>
 <20210113012036.GA1560@b29397-desktop>
 <5cfc067a-0b3b-05fc-7567-4b2b475dd6e4@gmail.com> <X/7K9tB4B3DkjfKk@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9d8e26b2-b9fc-103c-5126-be3c105468c8@gmail.com>
Date:   Wed, 13 Jan 2021 17:28:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X/7K9tB4B3DkjfKk@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.01.2021 13:27, Greg Kroah-Hartman пишет:
> On Wed, Jan 13, 2021 at 12:01:51PM +0300, Dmitry Osipenko wrote:
>> 13.01.2021 04:20, Peter Chen пишет:
>>> On 21-01-12 09:56:37, Dmitry Osipenko wrote:
>>>> 29.12.2020 17:26, Dmitry Osipenko пишет:
>>>>> 29.12.2020 08:16, Peter Chen пишет:
>>>>>> On 20-12-18 15:02:37, Dmitry Osipenko wrote:
>>>>>>> This series implements Runtime PM support for the Tegra ChipIdea USB driver.
>>>>>>> It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
>>>>>>> the RPM is supported by both UDC and host controllers, secondly this opens
>>>>>>> opportunity for implementing OTG support in the future.
>>>>>>>
>>>>>>> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
>>>>>>> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
>>>>>>> helping with the extensive and productive testing!
>>>>>>>
>>>>>>> Changelog:
>>>>>>>
>>>>>>> v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.
>>>>>>>
>>>>>>>     - Improved wording of the deprecated Kconfig entry as was suggested
>>>>>>>       by Alan Stern.
>>>>>>>
>>>>>>>     - Added ACKs from Thierry Reding and Alan Stern.
>>>>>>>
>>>>>>>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
>>>>>>>       just for completeness, since we can now switch OTG to host mode in
>>>>>>>       the ChipIdea driver. Although, OTG support remains a work-in-progress
>>>>>>>       for now.
>>>>>>>
>>>>>>> v2: - Improved comments in the code as it was suggested by Peter Chen and
>>>>>>>       Sergei Shtylyov for v1.
>>>>>>>
>>>>>>>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
>>>>>>>       a error code path, like it was suggested by Peter Chen.
>>>>>>>
>>>>>>>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
>>>>>>>       as was suggested by Alan Stern.
>>>>>>>
>>>>>>>     - Improved commit message and added ACK from Thierry Reding to the patch
>>>>>>>       that removes MODULE_ALIAS.
>>>>>>>
>>>>>>>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
>>>>>>>       additional VBUS sensor. This was reported and tested by Ion Agorria.
>>>>>>>
>>>>>>>     - Added t-b from Ion Agorria.
>>>>>>>
>>>>>>> Dmitry Osipenko (8):
>>>>>>>   usb: phy: tegra: Add delay after power up
>>>>>>>   usb: phy: tegra: Support waking up from a low power mode
>>>>>>>   usb: chipidea: tegra: Remove MODULE_ALIAS
>>>>>>>   usb: chipidea: tegra: Rename UDC to USB
>>>>>>>   usb: chipidea: tegra: Support runtime PM
>>>>>>>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
>>>>>>>   usb: host: ehci-tegra: Remove the driver
>>>>>>>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
>>>>>>>     USB_EHCI_TEGRA
>>>>>>>
>>>>>>> Peter Geis (1):
>>>>>>>   usb: chipidea: tegra: Support host mode
>>>>>>
>>>>>> Chipidea related (patch 3-7) are applied, thanks.
>>>>>
>>>>> Hello Peter,
>>>>>
>>>>> Thank you for applying the patches.
>>>>>
>>>>> Who will apply the remaining patches?
>>>>>
>>>>> The Chipidea patch #6 depends on the PHY changes, otherwise USB will
>>>>> suspend and never resume.
>>>>>
>>>>
>>>> Peter, could you please apply the PHY and defconfig patches along with
>>>> the CI patches to -next? I.e. the whole series. Preferentially in
>>>> original ordering of patches should be preserved.
>>>>
>>>
>>> Hi Dmitry,
>>>
>>> Usually, Greg could apply all USB patches, if I apply other USB related
>>> patches, it may cause conflict with other patches in other's tree.
>>> Greg, free feel to apply this series with 
>>> Acked-by: Peter Chen <peter.chen@kernel.org>
>>> for chipidea part.
>>>
>>> For ARM defconfig patch, I think it should go ARM's tree.
>>>
>>
>> Thank you for the answer!
>>
>> It's not the ARM defconfig, but a local tegra_defconfig. It should be
>> fine to take the patch via the USB tree since Thierry already acked it
>> and asked to do so.
>>
>> Greg, please take this whole series. Thanks in advance!
> 
> All now applied, thanks!

Thank you!

