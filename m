Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C17EC873E
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbjIGQbC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbjIGQax (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:30:53 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1D95B98
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:29:35 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so1058086276.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104041; x=1694708841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=ktw2mVB6Ga5WKetXyDU5IvkkbEkeR2XU6fFklr5qqk3677krV82ASGQhgimc9qwJrY
         G+C+hKnMbCT6rkwnqG1QokZY3HXorA7RaNNlWGraW4IiDC+KBprefTGa97zJoV1/WchA
         6aPJphJkUKYHuZdqPVaSwux5S5lRM5gD5zPr01VHNyZAmW+nXX8y5X8Uemh2GKC4qozu
         YwHVWtONITTkGAH6hV14hEI6ox8BVCecMUXhZ6KcuhStvi55mk6nTwxbZaRXVpgOxteN
         N0LOnKZV3qEF9gDmlS5VthqvxOBqpaC/RQODxz9bNrZF72ZlLzb7FGxcxebANmyGGiZ8
         s+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104041; x=1694708841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=HCxhp77b0onxW43yRRe57tiUuXzRLKoqLEVpPNCBsEVKCBP2hIjKi0Uk5Uc75wM7dq
         HbZHytK1ExkptsfDKTfOlkzZBMFTo3A9N4oWgnsLKYI5/rWFV40DQaE6khbosc8R1d3y
         13F42XA54rp83nKyUMzgKzMbejM4MrNjS7mtty9gxpvDkVCitbpScx6TS9mvLqKVI/d+
         vWnmuXoQT8RYGm6e73mhs7vYpeZomCVpNA6wTCd5xSgnfl6xvrZwSnr5QUfXOFmK2OWn
         knRr7MBhqMoyGTO58dE3W7ZlZvLrU1YdnXyq93qATHi/6hYm5o7aOnmPVKX8IlvHiC83
         SffQ==
X-Gm-Message-State: AOJu0YyzUUPZaUPGoYbELAHl1L2ulXxbyucMFbhvPcRVYgA+Jz504DW9
        sr2wwKTPH0+6ZYAdoPwxlQ4cJDt/3us1eylhhtRtF5WG5HeRErt+uPQ=
X-Google-Smtp-Source: AGHT+IHhj18itEgT7Zkm6inaHN3nE+QPEGLPicrIzqqx/vXBzW0adJyqRztqORI4Xy/4ylPWC4tCJ9Ht9cCQq18uOlw=
X-Received: by 2002:a25:aae3:0:b0:d1a:955f:304d with SMTP id
 t90-20020a25aae3000000b00d1a955f304dmr18305004ybi.64.1694070633444; Thu, 07
 Sep 2023 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-7-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:10:22 +0200
Message-ID: <CACRpkdadcw=E38o=cNWT4fQ_PK0UPifJZdVjuXTw0cjxPAEaKw@mail.gmail.com>
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
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
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
