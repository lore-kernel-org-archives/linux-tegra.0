Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5869EEC8747
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbjIGQta (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243478AbjIGQta (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:49:30 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06571FED
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:49:03 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1d0d3d40124so863997fac.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105290; x=1694710090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=n4FQbczlT/gwr7ky1EO/J03AEm0OZZpCOtX0rHtxXy1EE5G1yZ2Eb567hl0pmuAU3I
         AK/qSrjuO37xdmUOkrIpcSGMkWpcDpx6os265zBo60NEYEaBBNz0YT7egSQ7WvqlIpjM
         jpo8TaTA+EdlS6Kcw3VUu8f3hIiaUFIanvra96q7nKeKA6gOruLLshZPuwssiVIKhJIq
         zsW74ffypJeunGCkCP8J/C7NwsiuOqOIxdmFwaG6e8/ii24k+UqaZgDie4EpbU8QDQDj
         PN9ij5hkDHONRwOuhp5zpYpNnTpfrRkiFCA25lDim2SL5nXsiPPjbr5yWMMGgxMAnU0J
         2ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105290; x=1694710090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=Oopmy3xoiuWJBEWfNNk+wtRWZprx6Emx4aigfEDSb0PV0PZGbrgf9iMOr4dBnL5dH0
         HuQ/e4+exjh06BcXvRInTD4NbeTNwj/ueptkzM/EcPjfK8KdMKNoD6kPhCQ8+ddjtU3h
         lJRfBrXqjuTTU/G1nOrBgzJIJj8sJrXM2IS76gnIuA+Ju+60Lk4i6ALaudK24rX8T/6s
         5z+Wep+3Y3xmUV3NYdbcYn/TPfxkql3qZb+ZOKLX8MvbENBKkB1h7Hylm3o+per0mx35
         +Lu1MigcVCZdKB5U9aHTG/gw+v/iA1xfXLfAJAeWEpHo5edxN4tXopIUqIqPONzVddnk
         qSKA==
X-Gm-Message-State: AOJu0YzmOV0rcAvKLLNrBVsHKJ8+iOamk/5vpM02UJt0Q7q4q5g7QH53
        sI7iofC9eVisUolooWCgn6lGY+JjUavdA0GKAzPT8AN5w2PHGWx40gM=
X-Google-Smtp-Source: AGHT+IEos+IWcRlRURBpWq2f/yqX4JwD1uUNGc4FMcBDjtB4EYVZgMX+6wsZb6/oamwVKLnZoLMvxAzj5BAJ8/qIfJs=
X-Received: by 2002:a25:aad4:0:b0:d7b:9ac8:f439 with SMTP id
 t78-20020a25aad4000000b00d7b9ac8f439mr18109140ybi.40.1694071872125; Thu, 07
 Sep 2023 00:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:31:01 +0200
Message-ID: <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I was cleaning this one just some merge cycle ago, now it
looks even better!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
