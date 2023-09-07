Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF730EC8743
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjIGQpQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjIGQpP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:45:15 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC64E1705
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:44:45 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so969769a91.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105021; x=1694709821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=qn+8/3b4BSdMrDV9R8f7C/HDGxl30cqOw5JhbzoLIZXHphuYznUXy13Qy4CdwK9b2D
         dt0zOxTp+wO9kp+JZ2QyZXlUGiLPSq+h22RTKfcyYblCdyFO/4SAgQ9BTJiCvq2JkOd8
         suw6VzVXamrhCrXg0KfWtqCMlr7p+PaF9AA1Z0P9u18Zc75MQM995AQ5hUNnIuicrmVT
         DmGFAEAooKKNTwVcrIm//qqX7NglfZ/mZ4Pm8KNwpj7GdV6tFLpVZHKXQTozvJWIT7lS
         k25tMRrn1UDcb/PNEL/s9kQj+ImYdBjn59EtjUoQfvqhSN7ohAuPlZrN9GeW9zKraXzv
         IQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105021; x=1694709821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=lMRz1SAq7aPhiA5GKL4mGht1Uf7ns1mZIp1mvYJhe1pMYmzHKpVb1UHSutYDnOlQF+
         qkZ76EzZb1YbcQHXa/KngaN+FZ7gtQwj5ikoWimThkJqE14Pf4TKSYhOwr+/vOndwVGx
         UIXuUgQyMCw+h1UpMpdtmC3j5GpSXOfWcGtBzTBZY1tHdlCVorxtZRBWcDzVpORP8SaP
         94oUVnvsnMW0A1JnqDSaXqyv+59dLL6RQSeYLprUf8aIgznjngY3OgmgK4qYJon2hjIO
         8yokfZ9NQTFzwujbzF//oOs8fmU53mqSzLwnyBOCMohwiUCZ1dCI6XVVbAu6Ef1BRxF8
         jn8Q==
X-Gm-Message-State: AOJu0Yx7PJHZfXHW+kywJP/cwFx4T5mIUsDILSEPpuP45ZJ9JJAZnhj8
        Nl3k1JBLmt4Dql/yid29r8TPGw1eGXU8wisOCMn0Kd122yjGx5BH
X-Google-Smtp-Source: AGHT+IHhmgzWKTsylHHZ2qSwdCSe8fG9sB+HCDYVng7dujabCyOchOSgbCuVeCZbRiidwPEiAF4MbYeMV3WMB/wKWxY=
X-Received: by 2002:a25:40ce:0:b0:d7a:d628:f69d with SMTP id
 n197-20020a2540ce000000b00d7ad628f69dmr19332220yba.32.1694070175534; Thu, 07
 Sep 2023 00:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-2-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:02:44 +0200
Message-ID: <CACRpkdbT25G+KSUOPjgo9BQmPy2_rgXULVM1fpZQDqE+Xcj80g@mail.gmail.com>
Subject: Re: [PATCH 01/21] gpiolib: make gpio_device_get() and
 gpio_device_put() public
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
> In order to start migrating away from accessing struct gpio_chip by
> users other than their owners, let's first make the reference management
> functions for the opaque struct gpio_device public in the driver.h
> header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
