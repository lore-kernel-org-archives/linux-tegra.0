Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E72C433E6
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 06:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FAE122CAD
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 06:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbhALG5W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 01:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbhALG5W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 01:57:22 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B2EC061575;
        Mon, 11 Jan 2021 22:56:41 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u11so1610336ljo.13;
        Mon, 11 Jan 2021 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+mcGfBDh2HaL2D1G9xE8gCCyle1yTK3SDdAW7IN4ZiQ=;
        b=Oexi8t3aHxziEeTcB022ZXJtY7b6aDckY/m92s8/xdzPhgqrdZcf49P7amEmSe5wR+
         XVrOrmIGT+G5/7BW9jcTOqMrNJFF1kTv7fYAqMKckKy5KsNmtA6/K/2jAcVdpydmZSPV
         qieiC6KpquDdbWfrdKH8803mRO6mJFJxQaTrXPs5/mCwg+wyt9FyN89krHon4UIveBr9
         HZ7lrglMic2Am0sLisAB2RYSIX4tD1Vx+A+ZjdQYRUMImFLJF24Pmud+Y/NHTomW0AOs
         oChVVTAYuVveQFmOafLJQYyFiHwSZH4YixcWSOnfep9OiCi8TtTmpKmDiTO2ugTE1inL
         UUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+mcGfBDh2HaL2D1G9xE8gCCyle1yTK3SDdAW7IN4ZiQ=;
        b=MnsYyNY1CTtDS9FbCqrgS7tzDhhFRD/eKLOLpYHlSW40Ds5+KmX1HSN1cTPdkl2grA
         W3tKc8qWo/Ataje0opW8nk0fDgqcSVtEWsMbrdvIaX6b3xCYTBpocenAafYV0rq9utwe
         N6D8DDd2VgOEbS5MM89vC64URvUuybskukLxMoEwFq3Fw+cGaW1nwCANFtp7VO3LSLut
         aWppdkMRK55DYxahnPa5Ley4ABBlcQUvewIZnuOLMMSBCHlKOBi5CZqkY9Kyml8o1MrT
         CBlkO4qWhmGVcvLfG4UHVip4akpdawqY5R3Y9x9mYeqMkRFJxKckRpY64XrBFsAyNjDB
         mNEw==
X-Gm-Message-State: AOAM530kQP5cuCLqPBIbZ+dgIuRqgH/qqLzm11ZuZq7NeoDrVtcq11Qn
        LD4puzPAKgygMIGe7xKdril5RdIIxII=
X-Google-Smtp-Source: ABdhPJxV4KMH5KWxYxRKGXp85MQcxBFQnS2rkLTJJOz6otCaiJaIUvdP/f7PFgl368JfvPRtBbtSVA==
X-Received: by 2002:a2e:9b47:: with SMTP id o7mr1361983ljj.99.1610434598666;
        Mon, 11 Jan 2021 22:56:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id a9sm271890lfl.143.2021.01.11.22.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 22:56:37 -0800 (PST)
Subject: Re: [PATCH v3 0/9] Support Runtime PM and host mode by Tegra ChipIdea
 USB driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
Message-ID: <713c4b1a-a4b3-41ad-7aad-c49e594f778b@gmail.com>
Date:   Tue, 12 Jan 2021 09:56:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <b2c21687-4cb9-ba0a-a724-3a82ddd8daff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.12.2020 17:26, Dmitry Osipenko пишет:
> 29.12.2020 08:16, Peter Chen пишет:
>> On 20-12-18 15:02:37, Dmitry Osipenko wrote:
>>> This series implements Runtime PM support for the Tegra ChipIdea USB driver.
>>> It also squashes the older ehci-tegra driver into the ChipIdea driver, hence
>>> the RPM is supported by both UDC and host controllers, secondly this opens
>>> opportunity for implementing OTG support in the future.
>>>
>>> Patchset was tested on various Tegra20, Tegra30 and Tegra124 devices.
>>> Thanks to Peter Geis, Matt Merhar, Nicolas Chauvet and Ion Agorria for
>>> helping with the extensive and productive testing!
>>>
>>> Changelog:
>>>
>>> v3: - Replaced "goto" with if-statements as was suggested by Thierry Reding.
>>>
>>>     - Improved wording of the deprecated Kconfig entry as was suggested
>>>       by Alan Stern.
>>>
>>>     - Added ACKs from Thierry Reding and Alan Stern.
>>>
>>>     - Added a new minor patch "Specify TX FIFO threshold in UDC SoC info"
>>>       just for completeness, since we can now switch OTG to host mode in
>>>       the ChipIdea driver. Although, OTG support remains a work-in-progress
>>>       for now.
>>>
>>> v2: - Improved comments in the code as it was suggested by Peter Chen and
>>>       Sergei Shtylyov for v1.
>>>
>>>     - Replaced mdelay() with fsleep() and made ci->hdc to reset to NULL in
>>>       a error code path, like it was suggested by Peter Chen.
>>>
>>>     - Redirected deprecated USB_EHCI_TEGRA Kconfig entry to USB_CHIPIDEA_TEGRA
>>>       as was suggested by Alan Stern.
>>>
>>>     - Improved commit message and added ACK from Thierry Reding to the patch
>>>       that removes MODULE_ALIAS.
>>>
>>>     - Fixed UDC PHY waking up on ASUS TF201 tablet device by utilizing
>>>       additional VBUS sensor. This was reported and tested by Ion Agorria.
>>>
>>>     - Added t-b from Ion Agorria.
>>>
>>> Dmitry Osipenko (8):
>>>   usb: phy: tegra: Add delay after power up
>>>   usb: phy: tegra: Support waking up from a low power mode
>>>   usb: chipidea: tegra: Remove MODULE_ALIAS
>>>   usb: chipidea: tegra: Rename UDC to USB
>>>   usb: chipidea: tegra: Support runtime PM
>>>   usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
>>>   usb: host: ehci-tegra: Remove the driver
>>>   ARM: tegra_defconfig: Enable USB_CHIPIDEA_HOST and remove
>>>     USB_EHCI_TEGRA
>>>
>>> Peter Geis (1):
>>>   usb: chipidea: tegra: Support host mode
>>
>> Chipidea related (patch 3-7) are applied, thanks.
> 
> Hello Peter,
> 
> Thank you for applying the patches.
> 
> Who will apply the remaining patches?
> 
> The Chipidea patch #6 depends on the PHY changes, otherwise USB will
> suspend and never resume.
> 

Peter, could you please apply the PHY and defconfig patches along with
the CI patches to -next? I.e. the whole series. Preferentially in
original ordering of patches should be preserved.

Thanks in advance.
