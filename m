Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C7BC4361B
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 21:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14E223108
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Dec 2020 21:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgLEVgj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Dec 2020 16:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgLEVgi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Dec 2020 16:36:38 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C063C0613CF
        for <linux-tegra@vger.kernel.org>; Sat,  5 Dec 2020 13:35:52 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id f24so10687217ljk.13
        for <linux-tegra@vger.kernel.org>; Sat, 05 Dec 2020 13:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S6yDFs+MOk2PtIoISDQLgO3LlwE7ZoVUixw+MtDWOT4=;
        b=WgW7YBiOCD+LJQM2IQJpa+jsEsAzvq5DYcY74cBIBQMW7q0cgpBp5dZIdy+VXzs6F3
         PGCzj6p4yBIbKK0W4AY01a79X/H0sRvA2veSM0MMm7Cnv599qf3sRdAaNbtj6PFKlXUq
         NEsJV0DQPU9ZKgFwancqtdBUaRiBWoXdJm/wP/sZ/2nazc/XDErRzdD5J2smHrKLKQtl
         vEVB+g6mp9vWbvO8RbakziFlGrmodgji56bU/GdEEau/SZaZDxNR1V+V43ukHdywSlb1
         wZj5UpsRC1zYCJEUidd9mYVrp2HSPGDF/vyx7VZCIDXLMOq8XD+ssCAk3lISpwz7+RjY
         K67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S6yDFs+MOk2PtIoISDQLgO3LlwE7ZoVUixw+MtDWOT4=;
        b=NKlAeFtz09HV20C8nc4QXirFgXdUb/b3yijYTTAB2fJwvOVON0u/qnGDGmjbAbzytl
         mWBMTO23idu+6ULn/Z08oPfV25ub45YxX8s9qm3+ZrCuvAA24R0qRUCN3u4q/W0I6Rc4
         rPxqSWueW49XjKSNSKw/6Kt+v27cC2K6unWg94uXJj+sPqWvI/x4GWY9Jow9fYaq5qbl
         aSkynxZXjaJY8C2NAOCOGR6voXS7UVzaSEvwvw43lLZ2hvs+pjqtBuokUfTQexvXSmPV
         x7RCqyGMjOQa+uOTeDwttglBAm+jQRCamCtmYs5oVJ6myRJJ6bAsIrRYsa/u595VakvK
         iSog==
X-Gm-Message-State: AOAM532E8uyh9OoG3O0Rtm72svN7ztdv0UEkL8ze6BXyFBEsqfNcEAto
        DijAAjgqZNOVqNL3uA0xOVBre8ogDPm7SrrJk6sKGA==
X-Google-Smtp-Source: ABdhPJxKTF3dU+xB0xBIpJKLMg6prHGMhqYwxnR9SzXhGrUGwCuiMg9nPL71f0IsJwTwEHW8snGIYf1ghEYUZ52PxgI=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr5672345ljr.104.1607204151129;
 Sat, 05 Dec 2020 13:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-2-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:35:40 +0100
Message-ID: <CACRpkdY4-RN8KYn1scmoEHQucb4+FJtcpNX0TDYhUMLFiS3gGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Use Tegra186-specific include guard
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Use a unique include guard for the Tegra186 GPIO DT bindings header to
> avoid clashes with the DT bindings header for earlier chips.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This patch applied!

Yours,
Linus Walleij
