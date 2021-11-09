Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54385C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 00:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23E7061107
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 00:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhKIAdg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Nov 2021 19:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhKIAdf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Nov 2021 19:33:35 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8528C061570
        for <linux-tegra@vger.kernel.org>; Mon,  8 Nov 2021 16:30:50 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id g25-20020a9d5f99000000b0055af3d227e8so23886209oti.11
        for <linux-tegra@vger.kernel.org>; Mon, 08 Nov 2021 16:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWOLg/TjdfsihzJ5MjAZua2eODby7ABOKKXMhSMpxIA=;
        b=sN9/kcyrGV71FgwMjDXLU9oyYsKobWGMHlwoeh+H6r6+ttdcw2dIGT9EODixMzTmf3
         sPDv7ueTlgzvo6ncQF1nN/IqqNqOJkqiCQKlOOVg2W2JTugQCofVHiHJm96KuNnzcurs
         aarAL6o6O+yTAj8i6i6I/p6oSH4SBLrOgZTN9rDSwFi5ygMhoa/nERJq8ey57dZDUOM4
         NEjgbedUv6cmna0v2/OvjKAGfci5uh63FERVDUJ3GUsbTP9JaJn4SMPd+vCTnnhrE5u2
         du6Y1D2G0tgorJbYWoHQEs27fILFzJEMUy/JeSuLRus3PYipADVg1sQoX91e1w8HWxkl
         uRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWOLg/TjdfsihzJ5MjAZua2eODby7ABOKKXMhSMpxIA=;
        b=uH4BFk0pNGSj275hKyToiO2oN9/UwRq3mj209v4bmkpv9uw6XeyryvszXEcjDkfZQ9
         pwqdw8OtcMhy7oJ+qpqY23mCyZXQr4ZdNZ+W2oUg59zBhg6N3SenlQGb0mZY9CzS79KG
         Z6VNtCMNEkVKIOHETIvtrMp8oeavv0Ghe6KGPzyZHzuHseCI236P0sgO661ceEwE4KjX
         glxDTxN58H6qbVXxAApHtWFonTIWkNOs/rd6WWJhDdk3hjlD3SP13ahdENLFQcX0nZAI
         gMXnXKfotTH/1Wgedmhipu5rb0Hn/YTa5nizUNTv2MgLmEFRvqm+Zn4/WxHlsiY+e/x7
         mR1w==
X-Gm-Message-State: AOAM5317l9g3KTL/kmu+Os+tTPIiKN49XOiDe2ggaKy8/pOcqWMuVGRa
        6fZQHsU2e/MjEYqhJ0VCAkWkQ4o+Fntb6Wu99+jPfA==
X-Google-Smtp-Source: ABdhPJxGcQ+6oFfc5rMf7oTfLgAK69TFbXU2aavrfhreX3DPCotCJiOwOPhx7R5RSV9g9kfwzmO8PXMieiHgMRXoH/U=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr2592888otk.179.1636417849971;
 Mon, 08 Nov 2021 16:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20211021123021.9602-1-pshete@nvidia.com> <20211021123021.9602-2-pshete@nvidia.com>
 <YXq3/1AXX7KiwpTy@orome.fritz.box> <YYE7aXo0mfCfCqGF@orome.fritz.box> <DM5PR12MB240697948C6DFF64E45AFF00B78C9@DM5PR12MB2406.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB240697948C6DFF64E45AFF00B78C9@DM5PR12MB2406.namprd12.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 01:30:38 +0100
Message-ID: <CACRpkdZto=5Pa4r7-eufUqteaJS5yYeTL6Oh8mFO_g=6RzV+mg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 3, 2021 at 12:01 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> It would be helpful if you share the update to the device tree bindings documentation patch with me I will push all the changes together.
> OR
> Can you please resend these patches along with device tree binding document patch that you have.

I'm just gonna assume that you guys sort this out and I can see the
combined tegra234 support in v2 :)

Yours,
Linus Walleij
