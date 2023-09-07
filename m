Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979B0EC873D
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjIGQeU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjIGQeT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:34:19 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A729197
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 09:33:50 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6c0b8f42409so440747a34.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104373; x=1694709173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=gO22OW9WJ3l52sBClRNlLS0EZY7/5YYuJz93IGgjr4PS0qCFnXSnvE2lncXMQrBRyG
         AWoJuYXMmcLgDOtuDxB+cx3ocSQzL8dJyd8W49ATEbzjPvsXvl/QZA7IAYVT1z6Pl424
         rGfXnt6d8KtuNPSeFPEpDPNM2vCtiuRk5qfw94Dj3SAxcFgg0G0+/YeZTPiGJTg//WdZ
         N7YbDi+7+R0mZgHfgYK3DA0+ek9jg6zyI2V6M4ShmeAtmV1Ve73zkoaDu7HIf+gIQtpJ
         YtPv3D0a4u9CPSuITKfxUeZQMVY8rnZCllTPopCPdTXWi9TX3Uljyh7PF2QMN/p/NAfj
         iAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104373; x=1694709173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=U0ppwBBoh0NnYELFckLEXBz3atd/okiuHn3yDsGg8LaxCMGVszwtlQAoWUAtn4z5bj
         5PoLwoNO9pmsYwgu9ErizVIcTcWfFRhXk9r3/vLtb2RWytWrQrm7N1Omt4exR7ZXSJZm
         jx2Q56Q4mVBifU/0+/dlO+59Ieez+cQQxwdo8ygjWsVeNiNwYHkXDBS5P5C/eVPlYlXV
         yDdTkTnm/OSIKb8Eaex7u6gmHWI5FSSxygfP9JsIexIKyBlYTbrZoYcd77qHTjN96XhZ
         Rh5EspMbKlQvqDJqdNUOXiAaGjRk2hf1bSL4DP29YXurCKA3DhbbnokRQLaY1jZxZrOR
         KugA==
X-Gm-Message-State: AOJu0YxNZRbLxa5EV8j3+yIRl/v3C4hk+7Bj4uYZ3nWKGyB9GjWMLfwI
        at5E9WNQUxcJXDI5kLeNI2oNBIckq1PLBvEM/sZnPzu5PEkWat5n
X-Google-Smtp-Source: AGHT+IGJ2fOJYbfgZwCYkGOqpBoV8zRdwms0YQyjwmM812KoO4CG3kmEhKK7s/PjKGQeVe41+y3pVjBhSp9/fdWja/U=
X-Received: by 2002:a25:408a:0:b0:d06:49e9:a29c with SMTP id
 n132-20020a25408a000000b00d0649e9a29cmr19754022yba.34.1694071374753; Thu, 07
 Sep 2023 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:22:43 +0200
Message-ID: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
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
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This should be a separate patch should it not?
Just send it separately to Dipen so he can merge it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
