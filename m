Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2F1C4727D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C917B238E4
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b4eP8EMI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgIXNZg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbgIXNZg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 09:25:36 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA76C0613D4
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2020 06:25:35 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a12so3303536eds.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2020 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/tGoQrJpdGYYfUAvw2qVEeVgn4GEtbYMszWw+xnR0k=;
        b=b4eP8EMIrQcqHXeKCgWPF2pre1/THZMlYelpeGjpX0ITqb5559DvtkCgHzods0pTal
         VcULZxsFhJc/Ft+rO6NmVvoKAOXSGdKp//Scus8F5EeQX+lQwVTDyvV9QZ2wJg08scbl
         dX3/JV8Ez9ruuDaX7SlWyy/8qgcNd9DcXvgGygrrp0wo2j55KXK7XDHJxFVIFA2C2en3
         ka+ax/uxeTAnxWDU7u+VfxO2NWyGqwRg/zDh+PMvalA1N/V6K9RYYg/xPyfJGB5bHpEE
         2ymoCUAXfFUsBYjjT8OTAccmb1wMnAbU0s+cRSMl4dV11nwLJJ2RoEMx/Tac7Wzh0fGl
         fn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/tGoQrJpdGYYfUAvw2qVEeVgn4GEtbYMszWw+xnR0k=;
        b=kb+5u9YMlb5eGmSE+5OkTJeJ+MDe5K7yqMl5Wc2SJNd8dZ7HlgElMyKLbAjYPPJit+
         dvN/mw4aoRYfkjTAThVL6U1guUEXQ4O/OedMTbymxmTj7c1BNs1/QBPL8bYEkmdWnvfb
         lWevk2G6CqKH2EvmJvGLsX43Go6i6FDFuNF6VO1Jk7aW+7dw5gWapqEz3uepaDfl+KFB
         65174dt05qSMCNW4btwwSTnPtxS+WuwLop74C/6D01BJZygwyPEMeV+pv/2SsgfglWot
         4qzxoTTKaFNoIlbQ+gWru1nYSbocNbRspjtM+GSj44mZKkD+5sKIxy2EwBAW0WPIP5N6
         YU6Q==
X-Gm-Message-State: AOAM533mXh6LDQaAZs7lQHnJoKG+ALIB8EWR1QN1KKuM6jJihAuAiBhg
        VSqOFI4TmrrizZkCejbLHElELiuNJIq2zpr5LiR5JQ==
X-Google-Smtp-Source: ABdhPJxHcJJd/t6XJJ5glQNT60CX8Gg5PBlM/2nPfTGKWak5ON1a/oflvMG3lHj80ELgvHkH9h8g0EKqdeZHKRHfWhI=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr1046419edn.371.1600953934375;
 Thu, 24 Sep 2020 06:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094952.458003-1-jonathanh@nvidia.com> <20200916094952.458003-3-jonathanh@nvidia.com>
In-Reply-To: <20200916094952.458003-3-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:25:23 +0200
Message-ID: <CAMpxmJX2AndfE6pNEGJnRhGZiH+WStO644nJ_Twq6b-Ksen4OQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/5] dt-bindings: eeprom: at24: Add label property for AT24
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Add a label property for the AT24 EEPROM to allow a custom name to be
> used for identifying the EEPROM on a board. This is useful when there
> is more than one EEPROM present.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 4cee72d53318..6edfa705b486 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -114,6 +114,9 @@ properties:
>            - const: renesas,r1ex24128
>            - const: atmel,24c128
>
> +  label:
> +    description: Descriptive name of the EEPROM.
> +
>    reg:
>      maxItems: 1
>
> --
> 2.25.1
>

Queued for v5.10, thanks!

Bartosz
