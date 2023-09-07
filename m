Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1DFEC873C
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 15:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjIGPgt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbjIGPW6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 11:22:58 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE1919A8
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 08:22:41 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4107e6fb0e8so7800731cf.3
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100160; x=1694704960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=xQtUcR04WbaEFFP6+eNbSuVQPVmGIq63S+qcbx3EnJCo8o0ZuRWK2dUXhp0yCGAUpw
         2cWE9w8gYncQIwWW1Fs6Zm5fYvrWwVfLLq1MILK24YxD3KZhspJzdEF7Wbm3K0nglfRZ
         DrV8fituKWCOWs9aPwTND8+f+UwYJ72Cyb3GYiMv1X0br8CSWe7DOGrnZhnNJmiimb0Y
         0dyp4SjTPROUgczlucgTYqb8Rg9p7xErHxqJ08AGmkpxDyzn4sRcmovM/u79aNAaO758
         oXv+6W4huJNZ3UurkQ92GTuvmnoXRISoc/GzP0MoHMBLziIOtB2s6SdX/B2W1qr9Gtlj
         Z2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100160; x=1694704960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=BVOSqsIctrhg8R6ZIj7vxWAF3abCPyQ6ANcWZb57Y1/AfyrV5LIMccQ7dDSEJp9FK3
         JNC+1T8IG3vdI6rzZhVSBHsUCpObPszLruZbMxzRiOQdhX3MfGYUXCqxeO9iMH7rBHFv
         9pNYM2BceLxLfeHkiDhZECD0QMhhGTqW7XV79xENpZ9knC0mNh5/a2zuAf2Ui5V98VRf
         ZfjNNxZf0RtdQz1ofMKcVN3OblaO8MaUycxpOn1SXdLwRtdV0AJMdM3RIgUGd/Saaxbi
         mivDjz+NS+nuTUJSG5iliJBqVVpJceCan8WXMGUQj9FF1zZgIPx68ZyJ943WZLbaG3oj
         SiFg==
X-Gm-Message-State: AOJu0YxU7psF0o4UNnsH2i4zTnfPxTK4ncmzxPv2+w6G/lwOiHRuGcas
        DSUnGg4Knhq1Cnv+3qG1NtN7gPbjtOJFEvBb8XbYnWkuk/YrECEU
X-Google-Smtp-Source: AGHT+IFX/4eyumxiC7nEFR+XPxzCJ5uyMTs6iy7ZgZ+cx415alKaYaIdPMXy/YLPsS1BT9j2oJ541saIGrDoN3xslRU=
X-Received: by 2002:a25:838b:0:b0:d35:f59a:6e46 with SMTP id
 t11-20020a25838b000000b00d35f59a6e46mr18424020ybk.49.1694072273274; Thu, 07
 Sep 2023 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:37:42 +0200
Message-ID: <CACRpkdaq8jwYLWfqvmjJFyxRPktTSTt-FY_OoPQ-ymU3fFk41w@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
