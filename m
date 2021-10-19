Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2610DC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 20:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D0716134F
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 20:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhJSUjs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 16:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhJSUjr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 16:39:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8758DC06161C;
        Tue, 19 Oct 2021 13:37:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x27so10150290lfa.9;
        Tue, 19 Oct 2021 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UQCS/V1OenULVK9R6Tw7aWNVLvU1czAAbhPbfB4Rzsg=;
        b=MDt1xqXERlKTsKE8X6vGyD1SmJynrXEcifkumtwKerfy4DRq7eXm4mgJb+jSGHYBoa
         sHW4BAO7Qd1YNB0e8xBwObCsonZFuh1jsqy/b3ELJByBi0PRYShatMc+QxSmTq03I0ZS
         qan7rGTHZg8CJUbtb3FfSHMg7ccxJC0rf3fTno/OCGRFNFNYqD+JaMwGuBBXj6Oqrr3w
         bWu444lL3H8CtEcwNIr31RrF1L/Gyex+5f5eCLFOz31tN78WHShEfCr1b2upPgOHE9qk
         jyROMJ5XuT9CJ4TF69I34WMV4GCK5hZOKXweyW0ctWn56FZC8+whel4dlVYgwCk5Cwss
         JUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UQCS/V1OenULVK9R6Tw7aWNVLvU1czAAbhPbfB4Rzsg=;
        b=rUZKutax9p7Ic5t9eLfby2ekiScLD0QPYsZYxdmnuZ8a2cb5SEorZIVeidRkvLdncg
         uXyyj9ETXLzuW55KJnbMwqzuIcx1HNzPeLfux59YOedWWzpMR0YhzS0ACcK02ovx/oi0
         mhwloB3iSaCt76cqdhXcqfGbnxZxGqSggDH43bC1jtp3zS6BIdKvZpimxvX4+r1uOkIM
         drG3k3TWRFI9+ja+IAT0X6CXT1elW3/GyYCRO5FJCFeW2kGzKjGT/Cm9nrqvzqtzUk74
         EjvAROw5ADdfZS1KylPPoIE5bA5hy2RLe7edVD+CcjlnvN7GWkirmxjyiW2wxyadaeNJ
         we+A==
X-Gm-Message-State: AOAM532fIVAS/x3x1gjQsVQshBxYxKyMTFTJJlPtJC/D2DwgQ2VlFOuR
        knd0mM7N1IGcZf2LyxBR9kN2jmnTvRw=
X-Google-Smtp-Source: ABdhPJwi3MBJsk7bnUK1n3ahnuwFh9onvvYQfR7Vs5lTIaQX2RsaGDu3pJvHsTBVwzz4lYo52cQPGg==
X-Received: by 2002:a05:6512:11ec:: with SMTP id p12mr5066040lfs.41.1634675852646;
        Tue, 19 Oct 2021 13:37:32 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id p5sm16676lfk.113.2021.10.19.13.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 13:37:32 -0700 (PDT)
Subject: Re: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20211002233447.1105-1-digetx@gmail.com>
 <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c09bd552-767e-e783-3f9f-114b8cedb475@gmail.com>
Date:   Tue, 19 Oct 2021 23:37:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFysa8G_fuGDfSLze-ovft3=gc5PXLaPtwTkC2_e0itQYNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.10.2021 12:47, Robert Foss пишет:
> Applied to drm-misc-next
> 
> On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> This series adds couple improvements to the TC358768 DSI bridge driver,
>> enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
>> ASUS Transformer TF700T tablet, which is ready for upstream kernel and
>> display panel support is the biggest missing part.
>>
>> Dmitry Osipenko (5):
>>   drm/bridge: tc358768: Enable reference clock
>>   drm/bridge: tc358768: Support pulse mode
>>   drm/bridge: tc358768: Calculate video start delay
>>   drm/bridge: tc358768: Disable non-continuous clock mode
>>   drm/bridge: tc358768: Correct BTACNTRL1 programming
>>
>>  drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
>>  1 file changed, 71 insertions(+), 23 deletions(-)
>>
>> --
>> 2.32.0
>>

Robert, thank you for taking care of these patches! Now nothing is
holding us from upstreaming the device-tree of the Transformer tablet.
