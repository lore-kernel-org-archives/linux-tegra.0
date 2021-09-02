Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F10AC43214
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 12:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8369A610E5
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 12:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbhIBMxF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 08:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344670AbhIBMxE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Sep 2021 08:53:04 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDEAC061760
        for <linux-tegra@vger.kernel.org>; Thu,  2 Sep 2021 05:52:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso1354969wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Sep 2021 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=XUQYJFf0VLoed4JNR3bJk8DdGmygiKizVinf3zNZhJo=;
        b=QTk5hM6cRX7Vag5fBHfIGeza7Gcb1CrOImwXRWX/tUo4pmpjLmUx9zGHyE/mC3pJPT
         NwPl+3wafeOiVJQqeXPoo/qK3fM6Xdo83WhZEVjwLWn1EK++PdfKrpWF1feAG02UOamx
         Qvxjnks2r6bbean2ZB3OiwA8WW7OKO0iO0O8MOIAuKLafEcdSNsFNIpKLCPrKrCvhfFL
         HGcA7Dg/hEBxAdqHLwQkS5DofZuFFMxF70Ikc0MHAFnfd+aIKsRlHW32pk6cSmJoYUwB
         eUoDkKJwfd0ychlZhdLxmRkOhCUNHYiebn2sBPtQbiE0KLqY21JHwDzfd9fjiCoO3P0G
         MhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=XUQYJFf0VLoed4JNR3bJk8DdGmygiKizVinf3zNZhJo=;
        b=TGYcd//Blvid2sI7abP8YBsBGB6Oyh9VglX1AGDqLpMm9QDz/H8ojQCOR7xPm1dyTF
         l1HUN+8ECnonQuvWlhXhfGMdlBpV/qdX5WJyZgwV9QqZWyfpPWhIlULWpSzRFKitwzEy
         rHqgT1eWzgcycYdp10F2h7utCDHwUQRkiHzUa8a8y+N2kAs1U+1oNywBgqBxBGtR/uKW
         ue1Ekxh1zwX5MfOOqiza+u7u3JP2xZMkqN1ZRYFO16oqQ1ReCSbwp+5YbP9mkzlB4rNh
         En2Dd7UNyectPB7re6FCbu4/A0xQL865998rxUY0bBojgWn71fe33pMuNXL3FpexmHKQ
         Nu4A==
X-Gm-Message-State: AOAM533Nqi9ZvyPDnQkNpzBT3rxoFCMnRK0K6g5wFM9bYhCf/ZQfwV8a
        T5JBi1GI+EPe9t8Td07lJW8+bA==
X-Google-Smtp-Source: ABdhPJzPz9XOAIc35pFuBE/Q9Eg6RqNF24BiJ5nOV48yKD7O45stK/C7AYYFgjow2p8m9xr050S43A==
X-Received: by 2002:a05:600c:259:: with SMTP id 25mr2997861wmj.82.1630587124128;
        Thu, 02 Sep 2021 05:52:04 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n4sm2071215wro.81.2021.09.02.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 05:52:03 -0700 (PDT)
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
User-agent: mu4e 1.6.5; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, stephan@gerhold.net,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Convert name-prefix doc to json-schema
Date:   Thu, 02 Sep 2021 14:44:12 +0200
In-reply-to: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
Message-ID: <1jilzj5edo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:

> Following are the changes:
>   - Add json-schema for 'sound-name-prefix' documentation under
>     'name-perfix.yaml'
>   - Use schema references wherever needed.
>   - Remove txt based doc
>
>
> Changelog
> =========
>
> v1 -> v2
> --------
>  * Provide top reference to name-prefix.yaml as suggested by Rob
>    for patch 2/3
>  * Dropped couple of unreachable email ids from Cc list in commit
>    message of patch 2/3
>  * No changes in remaining patches
>   
>
> Sameer Pujar (3):
>   ASoC: Add json-schema documentation for sound-name-prefix
>   ASoC: Use schema reference for sound-name-prefix
>   ASoC: Remove name-prefix.txt

Thanks a lot for this Sameer.
With the small update required by Rob's bot and the comment on patch #1
taken care of, you may add:

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  .../devicetree/bindings/sound/name-prefix.txt      | 24 ---------------
>  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra186-dspk.yaml       |  9 ++----
>  .../bindings/sound/nvidia,tegra210-dmic.yaml       |  9 ++----
>  .../bindings/sound/nvidia,tegra210-i2s.yaml        |  9 ++----
>  .../devicetree/bindings/sound/nxp,tfa989x.yaml     |  9 ++----
>  Documentation/devicetree/bindings/sound/rt5659.txt |  2 +-
>  .../bindings/sound/simple-audio-mux.yaml           |  9 ++----
>  8 files changed, 51 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

