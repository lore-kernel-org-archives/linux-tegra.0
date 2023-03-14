Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B998C7618B
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 08:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjCNIgX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjCNIgQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 04:36:16 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D86C93E0C
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 01:36:05 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5416698e889so168904957b3.2
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678782965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lB6BaE9PQJlFgjFssuLDs/1pNB2B4wE60UwmllOQKpo=;
        b=VtcOJxgORj62aKYqzvzFIs9Br4dJKBMCAEWt93DXbXwwsXDVO7+MGIv3c7MbPZbr10
         vyRB8SldCFFr3jeV7LmFMZ/MTcigZTzh3EQcEPJhoQVdlh9tihXccGEABIbfK0oK3kCX
         4sDZPavb02Ylwi8kGp7f81navOLC7IDuU+tM4BiRrr4P+EU12hOH/VNN0AgDnMofxmrD
         GqVSTa5k4zWmfAYdvlERb7DRuYbLpKA4R3aaV8npy6kBTzG9jKu4jJpbQxBec3GM90PI
         DNMWtpnjk+uv58HdlQW+WQ6+Ap0qLb4JuFBcgZkbE1FVPAapHcJvWVtCrlySFUpMsr9d
         9Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678782965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB6BaE9PQJlFgjFssuLDs/1pNB2B4wE60UwmllOQKpo=;
        b=jEQFwScnc7fE12uTXRmsf1EsQUsqaE22T/VBrH3mGZgQV+saKnE9K7UYF2Bhdh5G9V
         mNLLA2tMk/32LOx92KlYfoLVPpZFlnUstq16EUo2wjShrf1QAyllFztWn0/6hzIOMrI2
         MCrtXnJcZBvtZ6c2dLbv9Gzg4j4QdfDnHk46gNRzR5aOoRuXCAyd4BTEJz1tieFB3GeF
         Ys8nAqkkwExnOIUTUOUJFpoGe6aqzidEZ2HM1zX+d9qu+7Imva8+r/fHT16Odbg0DZTA
         6vR4f2DLY9G/pE7YVogv4gsApdkCab+a9vi1ir+A6vecTSrbXctK+bPfLyG0l147PxoF
         MH6g==
X-Gm-Message-State: AO0yUKW/tHrjFoHRHXTiwZjiS4s0k9e4JIUSTIVR4MTikewtkUl50GZe
        SIvVOuOepe5NNN90Em/wXZWGJdgYHbzcgl48FBKXGw==
X-Google-Smtp-Source: AK7set9zsq4G3HjB2UmY3GdM4HjLIJpqrBod3QW00SMBURajfHD1KhUPcUBu7rZpTvJJrigEfTbcfa9NLeKNv+p89is=
X-Received: by 2002:a81:b10a:0:b0:53d:2772:65d with SMTP id
 p10-20020a81b10a000000b0053d2772065dmr18614375ywh.9.1678782964942; Tue, 14
 Mar 2023 01:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230310190634.5053-1-dipenp@nvidia.com> <20230310190634.5053-3-dipenp@nvidia.com>
 <CACRpkdYmC=eLiWPPPRG7DYBmQfPNCN4pcDhzTCO=hkQDx2HoGw@mail.gmail.com>
 <798dd219-f4aa-39b3-2368-7a6d072b6de2@nvidia.com> <bceedc91-cccd-258a-1cab-57a79f5a294d@nvidia.com>
In-Reply-To: <bceedc91-cccd-258a-1cab-57a79f5a294d@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 09:35:53 +0100
Message-ID: <CACRpkdYkYBimR_9-hDRk7Gsi+qq78_WYvD8PMAJwtE_n2zVs1w@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: timestamp: Add Tegra234 support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 14, 2023 at 1:02 AM Dipen Patel <dipenp@nvidia.com> wrote:

> However, as I understood, current point of contention/discussion is addition of the
> nvidia,gpio-controller property.

No I think you are talking past each other. Krzysztof talks about
a "removed property":

> Unfortunately, I don't understand this statement. The
> nvidia,tegra194-gte-aon with removed property is in a released kernel
> v6.2. What does it mean "technically"? It's a released kernel thus it is
> a released ABI.

The only property you remove is nvidia,slices, so deprecate it instead,
problem solved.

I don't think the added phandle is a problem, it can't cause backward
compatibility issues since it is new.

Yours,
Linus Walleij
