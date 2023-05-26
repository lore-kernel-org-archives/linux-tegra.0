Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01CCC7EE2E
	for <linux-tegra@archiver.kernel.org>; Fri, 26 May 2023 12:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbjEZMaF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 May 2023 08:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243585AbjEZM3w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 May 2023 08:29:52 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3020E77
        for <linux-tegra@vger.kernel.org>; Fri, 26 May 2023 05:29:30 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-786de394130so205317241.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 May 2023 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685104168; x=1687696168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs34JzNiVRl4b2e/FfxvYd1zSDbIvD7rTBt6yG8u7ZQ=;
        b=D1uQXQWfbis8V/HHd+efA4wAeLIvY5uO+GGez7KOL8eDaYp0T8yU/iORvAMJz+bg51
         yDIhzb1MXXU3BNFWLSAX5a1qnBhfbecDUamjfP76Q3Sc213VTBs23JGsQZU7uQbHTO2f
         hkVqMWjWe9noohA7TMTCo3xGbm0ZkJ89OLGin9QtS2DMMj+0LOIkfo5+4NbCVIHrSvZd
         IJFsTRlcccKFmRD3f2bLl9OjVMU9UG93kZIPX/U1vAhgdMwHMZEcZzHOU7YXK+fnBDUl
         jxp4zbbvwe64F55RfAAeiFSM8nK7zei00gMzx0WmN4fQLRXSEEZ1cQmYqwgll/Q2nJm8
         E5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685104168; x=1687696168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs34JzNiVRl4b2e/FfxvYd1zSDbIvD7rTBt6yG8u7ZQ=;
        b=XV5YojcskrJzRbTxjUHM/lyuPAnlQiScXCl8KWYvMpS3FpQo/36iaNiSlGTkc41qMA
         l6HyE0063qSAzaY7NQqgSAkRfafLXVfXDo7Bq/qClQzS1wHmISYgtrO+2eBs/imhHs7F
         VgcZDXnuLFAslbqaALpmBIvtCpzigODH2HfZ0bbOt3CpX21JIdNZxCj3LzVq8c6qF5zG
         dT2k2w8/PCxh3kzqHRQccNgA8rQiN4jQyS/X5ry110oO0aRlDTyjZwXDQGHmNT3422e8
         olgNLPQArkJ9B7NFE9qgtpUB0Fu95qYMkvXeIWCpyEYbkLakPmi0Y8LLZv/in1b73VTi
         MIYg==
X-Gm-Message-State: AC+VfDyUAZYF6YVc+/wkFx7f4L5+q68eksPbI7rbBSM4VyzMBUkeQlcA
        WrNk8rM9HrDB/erfazTOpjR49uUgYYmSHCGc9tGYehqngEf2ccSa
X-Google-Smtp-Source: ACHHUZ7mBDT7uDE0hTE8QZu9Fx8Yf8rnmeHeBHz97azhVrFzBldYfh+UoieLxWqgej+bytGK85tzT+zWBGEbIpFS2Ns=
X-Received: by 2002:a05:6102:c5:b0:437:e137:3346 with SMTP id
 u5-20020a05610200c500b00437e1373346mr390286vsp.14.1685104168771; Fri, 26 May
 2023 05:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <ZGztRb_CreLi_rYv@surfacebook> <20230524105021.9418-1-pshete@nvidia.com>
In-Reply-To: <20230524105021.9418-1-pshete@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 26 May 2023 14:29:17 +0200
Message-ID: <CAMRc=Md+--VhGkyz5+1f+yS6nmNwpxf09HaFTnhyEAzJ6xSavw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: tegra186: Check GPIO pin permission before access.
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 24, 2023 at 12:50=E2=80=AFPM Prathamesh Shete <pshete@nvidia.co=
m> wrote:
>
> This change checks if we have the necessary permission to
> access the GPIO. For devices that have support for virtualisation
> we need to check both the TEGRA186_GPIO_VM_REG and the
> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> virtualisation support for GPIOs we only need to check the
> TEGRA186_GPIO_SCR_REG register.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied, thanks!

Bart
