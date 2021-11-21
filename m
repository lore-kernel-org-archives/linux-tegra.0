Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87EBC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 21 Nov 2021 23:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhKUXO2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhKUXO2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 21 Nov 2021 18:14:28 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E509C061574
        for <linux-tegra@vger.kernel.org>; Sun, 21 Nov 2021 15:11:22 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so26111362otl.3
        for <linux-tegra@vger.kernel.org>; Sun, 21 Nov 2021 15:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bTAbuwwiRCZN3KqUf/kG304lXY2W1vD8B7/l1GzwKy8=;
        b=Z8DWsyha2Dp8bop4b5/0sikkJ061GrpRiI6v7NAguDswKzjJi4nt70dyVA8wXDEcZx
         uBOZcbm8w0zhjmrrFVOhZW4E6JpB/5YUg9T4Aiy7dgt9Es0TmlRx3vRjfUYtaxc1jyHW
         1N/bWcNR02//76oyApRPkP2hE3BuyT3TcnIF1AkpSXKirNW8nHCixaiLv2lA8DEBz+Tn
         83vBDgpnQAASx9N8NirSQPA50pqwoOw0tiHrnroiyf55mECppIjg5uR6NUdqRt9/At77
         HCEr37NfSL6gPJ6RHZP289BaQa3eIGWrs56PMAnO1rLNx8CNG7xZAHQUSq4VrX9oowkw
         YmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTAbuwwiRCZN3KqUf/kG304lXY2W1vD8B7/l1GzwKy8=;
        b=qrbHaUiqdzBj+HXYJo1IH+9HTFs3dBvsPJpKBAI9XBeBhkpR3uT3uPohMQmlfDwfYp
         KW3lh49YnVRcGiBChjOorrXCqCEiaVG8NeI4uWjfZ0XD2WDFK4fxOX/4o54aDcBNKEAP
         BRRmTO3qDORqzh3vqU2FixJ9ZW44B9F3RLZKWy/XrQ26UKp66MnBgtrQkyiFFFdG5b1Z
         ok+kw04n1/dPOGNOKvo+Y4PooubRu5WsEMcRfSwckKQEjWR6Y+1mHeH25vAyBGAdm1X8
         b4fdEZXqIAThKVmx4u75LxCkOHtfzjwZKBM4qWhkELp4RmhfOIEa6PopnSrDMyvW3HRC
         vxJA==
X-Gm-Message-State: AOAM533Gm8dPm+1gBOyJOzjbV2E1HdGpy2VJJxDoOw0T+5y1cDt9qPee
        ZatlN9hIto+R8yWy+YLHFz7QmgwMBfj0A7SdddebOQ==
X-Google-Smtp-Source: ABdhPJxnzPWPghCWX8gYtpkOsS59rzm44Ms1Mf25+pnmI3+IHeGK770vYP2R9da+dR4OmbKV6ZsJrF6I6pOlZdkK99g=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20510732otj.35.1637536281974;
 Sun, 21 Nov 2021 15:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:11:10 +0100
Message-ID: <CACRpkdYR4-xVcYd-0AsCvzknAbP_hbnJnnwmESh1=pgAfYOVyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] gpio: tegra186: Add support for Tegra234
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 12, 2021 at 2:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> this set of patches converts the Tegra186 (and later) GPIO device tree
> bindings to json-schema and adds support for the GPIO controllers found
> on the new Tegra234 SoC. This also adds a gpio-keys device tree node to
> the Jetson AGX Orin Developer Kit device tree to allow events from the
> various inputs to be received by the system.
>
> Based on work by Prathamesh Shete.

This looks good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

I suppose Bartosz can just apply patches 1-3 to the GPIO tree
and the rest go to the Tegra tree?

Yours,
Linus Walleij
