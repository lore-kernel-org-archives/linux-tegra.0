Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6034EC8726
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 17:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244455AbjIGRlN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245258AbjIGRlD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 13:41:03 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7EA211E
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 10:40:39 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-573429f5874so672569eaf.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 10:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694108426; x=1694713226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=FhmMo5gViPGeubaYQ7MvfipM6Bzbgbeh1y95x0Bf/yXqKuJ4Vx9I29u9pRuhN+ts0o
         80b8/rDB57odaKyZYWWrz+udWKR4A/AK9rcsNv2P7G08KPjJdwC8EPP7JA7BbsRABVxh
         Ny78rOr+A6VPGA459ID8dd7MlNN8EwQ5kyOCb7Y/cGj31PQVh2Y5a5IG6BUhgWwvOHz/
         PM/Djo+QkFq+qKzjN5F/4JzehXL37izUoow+2jieGzkAyPmE4uVbIw72w5bISejFUVOh
         l7EplIJxSSR8h+RVy2Z/stlGVGopxXsCPX1itksarhfquUeKurh+M8keLyU/+w3YgmYS
         FYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108426; x=1694713226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=r8xjL+p6rgfcFgR6GzeQu8t6NCLJdBrMw6BnpUzLrUrqXj1DQhmSz2rGjkHvMwByn7
         Zp85PqbCj+Jt9eCIN55veKDiBkO5kT9etg4kLSKEUNu1QKC6zo+1d6YrkUjd7nzzfKgs
         3v3QJXcDqbeflkCOGNo51H1IorLtespLg02ip/HRy5TbivQ0aiYmA7ltGJjGgA4m5qhj
         hm0Ft5lGEJ+ulN/rlsjj6kwz+SABJGsIXjK4CRzPpy4iI8EMFL6OdzTLdWJD87Oi19D2
         IrhIrX0MjgeLTgVvKJojNpo3ytpLE92NGP2fqQMhqgisnA17ctjH9xMStz2XnDGWwEeP
         V4kA==
X-Gm-Message-State: AOJu0Yx72Dx6AnXob8PTYOd8L+9Qj32+41ILPEpF0v11V7yQgTEuPnD6
        fE6Aid7UyL3jOGdNcPQhEZg9H1Te91tJ/eowPOj8WA+DEOXOm/n/
X-Google-Smtp-Source: AGHT+IGsG5hJJbLxB8MJ18cSL64AbAsKmU8HUkb1gvXKq17Y/8ZLDXSkKoAPtcsGb/CfUJGklHIiazXnZYlmi1tiRYs=
X-Received: by 2002:a25:d78a:0:b0:d78:47a:d76e with SMTP id
 o132-20020a25d78a000000b00d78047ad76emr19559951ybg.49.1694072224500; Thu, 07
 Sep 2023 00:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-17-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-17-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:36:53 +0200
Message-ID: <CACRpkdap-AFmVFG_gtYeGuR5JFLgHQ6i7w6HRwKP4+pu=nd66A@mail.gmail.com>
Subject: Re: [PATCH 16/21] gpio: of: correct notifier return codes
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
> According to the comments in linux/notifier.h, the code to return when a
> notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This should just be applied, right? If the notifiers already
went upstream (sorry for my ignorance) then it should be
a Fixes: even.

Yours,
Linus Walleij
