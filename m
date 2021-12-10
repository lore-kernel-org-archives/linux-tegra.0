Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F238C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 01:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhLJBve (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 20:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhLJBvd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 20:51:33 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EE4C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 17:47:59 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id w5-20020a4a2745000000b002c2649b8d5fso2090255oow.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 17:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWvOVPA+0MutOijnBAzIthRTqxnFtgjBuBRS6tbJOwk=;
        b=NXTU4DRG5dLcqScl6jn+eTL5mRPkjBm0U/xvSTVJev04tL3knDXUh7objzJFXLwIwp
         wmqbpnVfSXAoUrNSTIGpac5hKVh6OFmlYaicwppftkMp+Vk+fbkcdgqb1XjMUgS28PMm
         d6pA/ybeqaFu8D2G2UGDqtOcJUifbrk1HNYJ1QYYB/k4DGffSAJ75r3rQitJmXu8d0hx
         t8IEO5jRCJKj88o1c77kg/CGIsRN6pXXuqdI8YgV3ZY0tabX2VZQeYkshNbTDvtFXezI
         HtqL0dM5msGCFsTeR28m5heeJ1pQeGOZpWD2+fEjPT5sl37pHhLTeX4jcWC3LVDHmBbV
         Buzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWvOVPA+0MutOijnBAzIthRTqxnFtgjBuBRS6tbJOwk=;
        b=PeNZU05uw6Q7oGHF8hnhAX32SSmJqXaHfjtQAjUuy6h8It+SEBM6Fu5Fme/25vDTCz
         3/Jauyeky4mrSUClX5zL/nZv8xNB3w2Eisz7hf5/ON0H8N0+wC0hm4EClHMhXCqSr0Qf
         InL7CNttcl1K9bXS0hf7EyQQdvwaPuoW/2PmYwJxnD0CvcCE1v5v9sdyPuPaq9bTwbtc
         6+R0GkAzg0hxDq6ACubI9aV6yN/pMwHrodK2mPZdkXJhDqZ9qf3JMTMCmp5NhGTkPFhy
         8My3PaeUxZyotYNGOCVFUXELYffJgcFr6ubDt8wsKKZER/XgV+5ApDzFJHRnMOsoNO51
         XYhg==
X-Gm-Message-State: AOAM530mR8I+3FQ651oj5TrfdR9+jgXBRxrwlOlviezgtcTX+OryM/Kf
        5g7I8uEgrpNliX/QFwgrWHWCFnNg9RMqNdIvu9TfUE+ehNo=
X-Google-Smtp-Source: ABdhPJyK1lCVKvNMNsh+WgVmhUJ4WT5uOWiT1wYz7KCpW8moYEMiX4Nhq9m5pyo4rROuaVnz+As/SAXaT7aGq89V/Po=
X-Received: by 2002:a4a:aa8f:: with SMTP id d15mr6635657oon.86.1639100878996;
 Thu, 09 Dec 2021 17:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com> <20211208173047.558108-2-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:47:47 +0100
Message-ID: <CACRpkdbDj=2FtC=FLwAknc+zPJML8-8iZsB3Oz+4mdUmWpQxTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio: tegra186: Convert to json-schema
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
> Convert the Tegra186 GPIO controller device tree bindings from free-form
> text format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
