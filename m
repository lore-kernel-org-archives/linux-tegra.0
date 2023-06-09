Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B7C7EE25
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 07:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjFIHRq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjFIHRI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 03:17:08 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172EA1712
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 00:16:57 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-461da1198afso490107e0c.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 00:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295016; x=1688887016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdzUODq092vssNCjaY28OJC5DZmw5dvgysp73BioZog=;
        b=POOAMVqxtB8CI+pQfbMOhq7/vziT4oouRj/LYE7jxMi/+jghEStnXdXYGSH7834jA0
         OXo9mwYmxZM7mxHfcGXhL8CiHDRpJ8O1enuI52uflLrRhkVEIx0q0nH85mYUtL3xZFLG
         F4wa7dLv9kWne5zD/e447gPlcIyG5YmDHvkHwZukVpE4JUrxZ7EZ1jNLbRY9+86ngBrE
         ZDkynl44mJXet7rDBeHBhe8AcSozeyqlXVpWAIbJY+sOe+KX/ZmUrc0+attAFDbhjto2
         s9pT3lKa6mcMeS3WKHc6qITGAs6CN0W92X4wDUz2G80p1Mwu/sTaSs4zyytZhFbDf/O6
         RTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295016; x=1688887016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdzUODq092vssNCjaY28OJC5DZmw5dvgysp73BioZog=;
        b=hA4ICvSxSz2ZcjFaWuWq00AvA6rlamHtKTDnXOxj0c7Mhu56bfn9RUlG0tqB9moIZr
         Y03xkJThhw/XRZfk3ju61pJS5a42EL63/M/73rixGCB6oDdVDeLFglprLvlHBnCyTJRN
         1BaERk1MYDdsgv+LxSYONuVaHwcjSLcc3MhLltzvRiZPGWo67HNi7oSKDCWh6l+jwS2d
         7rDwYP3KoMDfI88By/XkJr2qWwFpkzIMK8mS56UFqlL5VHvkDexf545JJMZgTsh8jN00
         nV7yuibPZZ/FIAKf00YSCZif+DokWYiQ4RFaSZGbJEg0WpFsAgr1LFdWvxVFKSgI5tmb
         ecUw==
X-Gm-Message-State: AC+VfDy/4dcPhtfGzbi2cGKLez2oTH3pGa/uyBw5YilA+UlgXm8zVPBR
        DwuW5Ozf4QE3vTgw+dMsYJ0/k1yqvuUJjOpD+owxrg==
X-Google-Smtp-Source: ACHHUZ4xmZ9Ll+lhWMk0L4kDIfl2Ua9rzGppkiag9B8/Fe8dXXBWSKcbe/ZixeV51pNa5+sgUmhszyFSS+B4Pq6upCE=
X-Received: by 2002:a1f:5f53:0:b0:45c:d69f:bb89 with SMTP id
 t80-20020a1f5f53000000b0045cd69fbb89mr498672vkb.5.1686295016178; Fri, 09 Jun
 2023 00:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230605154230.2910847-1-thierry.reding@gmail.com>
In-Reply-To: <20230605154230.2910847-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:16:45 +0200
Message-ID: <CACRpkdYrZ+-7HcHiZ8T9CFQvPO+++2EsB0EQfs8OhNJivBXQ-g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: tegra: Add Tegra234 pinmux driver
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jun 5, 2023 at 5:42=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:

> this is an updated version of v4 of the series, which can be found here:

Patches 1 & 2 applied to the pinctrl tree, great work on this series!

>   arm64: tegra: Add Tegra234 pin controllers

Please funnel this final patch through the SoC tree.

Yours,
Linus Walleij
