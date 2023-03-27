Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF605C6FD1D
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Mar 2023 21:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjC0VbG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Mar 2023 17:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjC0VbF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Mar 2023 17:31:05 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5571BC0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Mar 2023 14:31:02 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-544f7c176easo194911797b3.9
        for <linux-tegra@vger.kernel.org>; Mon, 27 Mar 2023 14:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmWC1eVyie5Yd9L3xoTIr177pdrcFqgDVTeu1P94+OM=;
        b=pVKD6LEJFp7WgyILxH4elBUH7BddDV0rnX5GeAOxhBgopm9E/nzk3MhCWpEh1c3yZV
         YW+ooglmkrhUTi7384C9A4k9F7sFyBMcYV+U1Zh4fE4oH4swk/h9RpExNy6eUCFNir7s
         zhCoJifC4d6TCGU+en3dp7TH6oZab1Suv+kksElkWJ/y64jyphwJM96xhWMoo5JrxURC
         bmNcZUTXTMKVmB0edURJOoKy0Ddt9eiUrJuATyim42dkPYWb99VxPt0FxN2A72XPNsQU
         Mbv+wTyIa7RqCdPkeJLkc1uv2BUVrFZzjWK5ngv0nZPoHKdEZGvm/pqewbZ1CfXfoKsJ
         F5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmWC1eVyie5Yd9L3xoTIr177pdrcFqgDVTeu1P94+OM=;
        b=th1nrJv4XL+jb5MEmbDYgOzohPHhGhMV1wRI3Bz59N0ZXhtZMyJ/j8/t9zrwua/VqJ
         mBc6wz/aGU8mmH6Cx1E4oWO67x4qE8Q6vKZaSyiLLhvCwdwlv5IECcJqxp2hBbY2bQkR
         Ch1M6nTc2cHtvfgYInSB1aCTbt8D+axAiDeb2yOaohwVGFu7oQ7NvDiWlP4QoBMl4K8p
         6stGqlNyN+UDiVkoVyMIhc0CAh1xKQFCdKjm97TSfa/2yNxCQXHoS60kpjJ4YyzJ2DM0
         zYWH8R6qQze9r76IFKZh68NXE+YhyfTFQllbBEPAD1XuBE423afG+0f0CynSOvrxfkeF
         PJNg==
X-Gm-Message-State: AAQBX9dDXmo/AZh+1zTXx6Vts0X/XRGntVh6FTOyT7Nm7vIHYtr5ZbC0
        p1EqrAQzTkffa7WJggwBVp65Zqh+EMaA1QdXxtYBdrrfqvktXrd3
X-Google-Smtp-Source: AKy350a4hxJBmWI3s3k33APAz6KOE7IC6my3ZU8xLd+GcwS8CRbKaqz6iujdIe4v7DlrVDyP9zFORE3kJZvLlhEs7Ao=
X-Received: by 2002:a81:d007:0:b0:546:81f:a89e with SMTP id
 v7-20020a81d007000000b00546081fa89emr521762ywi.9.1679952661937; Mon, 27 Mar
 2023 14:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230327170146.4104556-1-robh@kernel.org>
In-Reply-To: <20230327170146.4104556-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:30:50 +0200
Message-ID: <CACRpkdatY4U0cwXB-fRBat_E6JXpC+ihExUiDC2UZUxSqcS9gg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 27, 2023 at 7:01=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
