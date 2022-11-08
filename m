Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F03FC4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Nov 2022 14:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbiKHOKZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Nov 2022 09:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbiKHOKS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Nov 2022 09:10:18 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4EABE3E
        for <linux-tegra@vger.kernel.org>; Tue,  8 Nov 2022 06:10:14 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id kt23so38870178ejc.7
        for <linux-tegra@vger.kernel.org>; Tue, 08 Nov 2022 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2yiVoAjbKu5g1coXsCgJKSnFMV0KG9qA5Tyi32t7Ao=;
        b=E+Y5suCr+yzSgsxf4CAfSwYU6qGOO0WXMEkeGneCrQ+Iyi9y6tbGvKL5nPmcDJfi8w
         pBRCnFGKuoZyeBArf39VyK3ZZxF0UArrsfuYkFD99eV+vj2vPYwXvm32Lx51/J8aL6+E
         EQ35C8r2LkqPXoFZDtyy8P8o7hr0NpodczxJikqJGsrEdN6sdeJKEMFL7cfdihbeXt1G
         5i/M80miQtpmOEfIyLsVoVz3BidmwMt0TUuGW0HluWHy/O+zDKJuXDKTT76NtQNkElZ/
         QzWnRmiaY41rENQ/b5cRhNoa0846ehVG/lRFOiEkHB3XMHIjedSLr389ryO3KI+mYe3j
         ZcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2yiVoAjbKu5g1coXsCgJKSnFMV0KG9qA5Tyi32t7Ao=;
        b=MuhuzqWg3wU25MLtwxQqtTYXzOsjpBFPbbsscISQoFCjfcfTpfJ1NXA1y1qPlNFTSJ
         kXGtE5y35xdkKoRtPd3hu4WjwYZ+AwJZ5EZEND4AVpTIM8AJ8xn/Rib3uGDlGr88f3vR
         oOdpjr91vY5PkP6l1P+6l+mH95MjSf9g5cLl3kivdEJ6Wya0bDm6u5QGuVmlSL4guEXU
         lYCy/q2osGZBQQL9BL3u+Zh+scios2n642mfnCAK/Ig/m5805AjmIn4l/XNXZypOuzAl
         K9IvJmYOTiODYLJz0Asmyu1XcGm73G+jXZMp2BHO7rGVywbJfVZG1cy7xvlwnfsRP54S
         Gakg==
X-Gm-Message-State: ACrzQf2uVoBnSNcd/2cGwIQkR2dN5CFQc1N0gn8P7AqFuVHMTdpLtDmC
        mcQrb0GDzm4vIkFgjhTezyHig9zTMZIT4LKjCLnDhw==
X-Google-Smtp-Source: AMsMyM4iXolXTKOej2MHua0HeSMKari1EAYAvBP6NBtB2bCwfNK4fQb+QUIw0XHsAzpw31HAyvjVJBRFlyND+fysAUk=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr21317787ejc.690.1667916613344; Tue, 08
 Nov 2022 06:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
In-Reply-To: <20221104142345.1562750-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:10:01 +0100
Message-ID: <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 4, 2022 at 3:23 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> This patch series changes the pin controller DT description on Tegra194
> in order to properly describe how the hardware works. Currently a
> simplified description is used that merges two pin controller instances
> (called AON and main) into a single DT node. This has some disadvantages
> such as creating a complicated mapping between the pins in those pin
> controllers and the corresponding GPIO controllers (which are already
> separated).
>
> As a prerequisite, the first patch in this series converts the device
> tree bindings to json-schema. A second patch then adds an additional
> compatible string for the AON instance (along with more details about
> each controller's pins) and finally patch 3 converts the driver to
> cope with these changes. A fourth patch makes the corresponding
> changes in the Tegra194 DTS file.
>
> Note that while this changes the DT node in an incompatible way, this
> doesn't have any practical implications for backwards-compatibility. The
> reason for this is that device trees have only reconfigured a very
> narrow subset of pins of the main controller, so the new driver will
> remain backwards-compatible with old device trees.
>
> Changes in v3:
> - address more review comments by Rob Herring and make validation work

This looks good to me!

I tried to apply them to the pinctrl devel branch but this happens:

$ git am --signoff
./v3_20221104_thierry_reding_pinctrl_tegra_separate_tegra194_instances.mbx
Applying: dt-bindings: pinctrl: tegra: Convert to json-schema
error: Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml:
does not exist in index
Patch failed at 0001 dt-bindings: pinctrl: tegra: Convert to json-schema

I guess there are some prerequisites?

Yours,
Linus Walleij
