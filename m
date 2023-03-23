Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A5C6FD1D
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Mar 2023 08:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjCWIkn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbjCWIkF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Mar 2023 04:40:05 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CD31B55D
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5445009c26bso382911207b3.8
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=eUTIHwb9gHiKe80gCXINbKnZwZKRxQ9pCErWt8YiVhFdExfyg6azrWWNruAziA3WY5
         +Sm+oMyhOCxn4XhLzVHa3dDRskexRoUtiWfxEEZrpnGIHJdahOLjorgzYJtIhCAXoDdN
         +NUGr6PHcKZdNqaAvXc25OCDVatxFA5JYhPWjS3P6Hiul3AsWzClzjlJwLYndxcYiX9K
         JOjA0k+//SCJcc7whw5XEyvjpGrtLGzm+Vnno8YgalqgzgSqCfX7gIEd31dCMBrXfLnB
         APxTJDnIXHpIL6v1Yy8Fe5unGJAi3tg53SBJPVLM6/qGdCsdlUDz8GHex+iycfgzQdE1
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=x6TeNcUZskCSl7fNM9qGC+tCUQ8sqGPPchsou3XzHOubGmY1N7MFSQtcvKqiBpGvMu
         wmXUNyG2ehSjufw0Jw9CPTHiXLUpNQrevRb0od6+2tndnwFhfn5ym8ECulPXGNITf6xB
         vAMkLmOwxMV14BblsNHwXvNJ+u58N+W8m3UzTV5YivFzm5Xm2myA6h86flmbsTBRoSoL
         H2xnsIpML69PZWhzbCS9z+6HgLjn8ED5xYh/UcyKQTJKpOYuedTO1F7C5/FkXioFvUFc
         wozyKDEWjBBj1eEnCgMCQDqIsEGag1srvZxvcH/pWsNoJgSVs08MkUcI/KqaQJ3corG1
         zipA==
X-Gm-Message-State: AAQBX9eozfh0afPA370Mke9KZZgtIlM/rcpar12T3XBawfCfTzVjLPXl
        9qWw0K8r7rB/QWnK4I+R1VsA10Uh98W9cRBBgtV+7Q==
X-Google-Smtp-Source: AKy350YpQG1QeS/JHf1yz/+Mbi9pos/zlzsSJzy4Cm1WDOD9XB83zWfD4msAOPcBGwB9h63MVlcOeGakOFuzLin2Osw=
X-Received: by 2002:a81:b603:0:b0:545:883a:544d with SMTP id
 u3-20020a81b603000000b00545883a544dmr730788ywh.9.1679560725079; Thu, 23 Mar
 2023 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-11-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-11-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:38:33 +0100
Message-ID: <CACRpkdapq1cR5id3K3zASprmUbTmh+QixyUEZFjNqYZPjWw2qw@mail.gmail.com>
Subject: Re: [PATCH V4 10/10] gpio: tegra186: Add Tegra234 hte support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> To enable timestamp support for the Tegra234, has_gte variable needs
> to be set true.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
