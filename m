Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43491C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 01:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhLJBux (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 20:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbhLJBux (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 20:50:53 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04F3C0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 17:47:18 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so8140356oto.13
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 17:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SB4uGKWGEZlPId4QacTW46ykEN+JrbNE3sc8enIlhxg=;
        b=Tx8UqhdZwbSoZNvIHDfHO6iTw8T2hF9nDLgRFB2FT/3XrWJbwRK3TvErDUIXkqMnMp
         0M5hyy/3ix6UwWdpsoEHgxBXy6ROwOEgmgUzm7CBJjwKiHWyaBy1FkI9Ihk4/sDqVzPB
         x56NW3wkBnI+bS+ZaaPIk+8Lpe9rsaPzW5We87/7weSvN4JLKuybiqGsBBySACmO4fZu
         BJzzwpMVCMErv/1xFh5SeA8Tsn9SwbNuuUp/Mfy1ROYoLRKln9GbBILjL++ttKpYfTxf
         qAORx6HcCgzre/k2Kd5yhdsMXmzyCmBY5nhJUCzt1HbFb2EE33UVJ2LrrIfRYJo96gN6
         D+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SB4uGKWGEZlPId4QacTW46ykEN+JrbNE3sc8enIlhxg=;
        b=5t6iSedLTSWfm7uEcz9M5Bnyb6ncMK2wBCgygarAlP3/yXk6AXr2TSyCWQly7hMwax
         hQHmdoViWOsaJITJ/WfMjaOPd58ARg+v+nXzVR6l4rds21ZcyfoyWEe71cnQsmHtmFII
         2eiohVwk0d6PppdZpziD6ZX3Raicyy3JNjufBJcOsPpruMW2p+IKO5Nhyjr8GtJiv0Pm
         FMNQLKcymKqtIdL4GSC3a33JhBw4AZa/IhuCcikeYlPL+x4+U0c3nW3upb8MeecnAXyj
         qgY1XZBlNs30gozLcOzhSDxKHg5ir+IjI4NiNWdzeidtBsGACkvgDEOx9l4BZjmLWERp
         EuEA==
X-Gm-Message-State: AOAM530qv5KSZxKP3iVFo7Iy6CnD+kKaoPSjS+KZpVoAFjrIRy88SO+M
        LzKBaYh7yelaEzkWYe1B3ZF7opqSwOL3rGvPME8vMw==
X-Google-Smtp-Source: ABdhPJxv8IPgVTfY/Q+BKd6CxueTQ+0Us7H8rC65W8oBGtJ/enzhxxKOJo5nVWiuPmyY+HCgpF15ztyzXeiupqfFYjs=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8952047otj.35.1639100837724;
 Thu, 09 Dec 2021 17:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:47:06 +0100
Message-ID: <CACRpkda6sLwmPWTmGBX=5x-2LFK9H0NUiSGXj_bqP0OWqGTL0g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 8, 2021 at 6:30 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the NVIDIA Tegra GPIO controller device tree bindings from
> free-form text format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
