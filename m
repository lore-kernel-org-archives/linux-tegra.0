Return-Path: <SRS0=J1sk=DA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3F5C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 09:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2331F2176B
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 09:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b0cXVGoW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgIWJPP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Sep 2020 05:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgIWJPP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Sep 2020 05:15:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECABC0613D1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2020 02:15:15 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p9so26739192ejf.6
        for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2020 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+orPivdtkIhi2/+DCsb0aHIGGKlk58BwIbkL2c8OXE=;
        b=b0cXVGoWMxMSjUmBe73Ir2VHt6b6HeMPDg9ITy0nlxfvt+nfGcH6ULy6Yfb05m6b9R
         V7rNup5xQ3sHSRcvEltzMhS6dOBGwvW/+7FubHmwPSGMBsGqxrgqfupptvgSd7409oAN
         QZY79fEXqt7oCMUbZCHSIRvumBxJL29lx7PwwXwwe9qMuHH5rSnovTKOYkIShJu3UJ/C
         8WVW+4VDlIIEidOrZ+tF0Lk63N0VOs01IcgypBeVllQBiGD/8vzr1WUjUR1iwBHiaA5E
         Gvdw7QsBb0+YP7PYOawpRUn0KcWC05Nrbw+UNV0pv99XG7TzaMzP82cs2lnYm3EfpGAO
         pBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+orPivdtkIhi2/+DCsb0aHIGGKlk58BwIbkL2c8OXE=;
        b=UXH2VILrYLkG5DR2+hWyky/0N3Ske9KMSWutN9vOoqPIjmaZhewLm/OwMzp28gxIcH
         9HgBXir+i7scpg7kw6MQoq0SalJFlx8uKn4+kILrAodj4goQIm23JzXRTKa4DzA2Lk9T
         oLavapZs9IlkUnXsufN65KRhUsRQ82LBQ+NklSe1bgmQXREqFKLkU5Ktu1wf9mH5RskX
         mMNb/GuZ6yIp6x4uX6zFFMrDhnC4YWKA9onn5+yNBHyrTzH8EfaWJrQWVUvw2/XfpCJ7
         G23At1sQ70nkJZpsNiO0j/vDq4kJJ8DLnDqDh8pRNCSgypqYijr5JkIwxbrmtvQCBtn/
         Y/3A==
X-Gm-Message-State: AOAM532jDK97pFf7Ku1kPQQdoa+6T6+QLGwkpjXNpgTBaeA8HsPqliLC
        Yk378kICOu6evtOh08425F7wJWfrwYZSljlqbceTZg==
X-Google-Smtp-Source: ABdhPJxsj1SgC5CPIZrwIKGez9btT0ZoBj+Syo+tSKXy5WrWFEci2o5Lpgfk6iCFKLomUXGGSKtqoLQ5WAlzeul68PU=
X-Received: by 2002:a17:906:7489:: with SMTP id e9mr9120634ejl.154.1600852513787;
 Wed, 23 Sep 2020 02:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094952.458003-1-jonathanh@nvidia.com>
In-Reply-To: <20200916094952.458003-1-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 23 Sep 2020 11:15:03 +0200
Message-ID: <CAMpxmJX6OxS-dxcK8whCm-Ups6Uts1iYE8bux_wAGeBPXihYBA@mail.gmail.com>
Subject: Re: [PATCH V2 0/5] Add support for custom names for AT24 EEPROMs
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> For platforms that have multiple boards and hence have multiple EEPROMs
> for identifying the different boards, it is useful to label the EEPROMs
> in device-tree so that they can be easily identified. For example, MAC
> address information is stored in the EEPROM on the processor module for
> some Jetson platforms which is not only required by the kernel but the
> bootloader as well. So having a simple way to identify the EEPROM is
> needed.
>
> Changes since V1:
> - By default initialise the nvmem_config.id as NVMEM_DEVID_AUTO and not
>   NVMEM_DEVID_NONE
> - Dropped the 'maxItems' from the dt-binding doc.
>
> Jon Hunter (5):
>   misc: eeprom: at24: Initialise AT24 NVMEM ID field
>   dt-bindings: eeprom: at24: Add label property for AT24
>   misc: eeprom: at24: Support custom device names for AT24 EEPROMs
>   arm64: tegra: Add label properties for EEPROMs
>   arm64: tegra: Populate EEPROMs for Jetson Xavier NX
>
>  .../devicetree/bindings/eeprom/at24.yaml      |  3 +++
>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  1 +
>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  1 +
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  1 +
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  1 +
>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 14 ++++++++++++
>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 16 ++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  1 +
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  1 +
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  2 ++
>  drivers/misc/eeprom/at24.c                    | 22 ++++++++++++++++++-
>  11 files changed, 62 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>

Just FYI: I'm fine with the at24 part. I can take them through my tree
for v5.10. Who is taking the DTS patches for tegra? Thierry? I can
provide you with an immutable branch if that's fine. I can't just ack
the at24 patches because they conflict with what I already have in my
tree for v5.10.

Bartosz
