Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC17C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Feb 2022 01:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbiBJB5i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Feb 2022 20:57:38 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbiBJB4N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Feb 2022 20:56:13 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A95237DD
        for <linux-tegra@vger.kernel.org>; Wed,  9 Feb 2022 17:33:01 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id x3so512098pll.3
        for <linux-tegra@vger.kernel.org>; Wed, 09 Feb 2022 17:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CpXL3kPoVZ7att1zdwN8Mf8Da7ajP98VvjIjGbgaZGA=;
        b=ENY37unj6f6SjoHK/K0Df/VIBp8PpZN9GGdjmw2F5RHMgth0BKvyfe7sX2l5TwfuMv
         Bw72HuoCoav/n3JPrtIVxRyg7PhW6XYai1AIx9e9CG7QfpdEhEDh7DNsywpBfEYsuHG0
         PC/EAciecqkqFtBE+fMv5STFjECmxiVAH8eSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CpXL3kPoVZ7att1zdwN8Mf8Da7ajP98VvjIjGbgaZGA=;
        b=jF9kmtowO7793euq8Ps5+Xk1OQwcjXn6BHEXbyDOLw+FTxLrqvtX8owGmUk0eNDIxU
         0DW7QNk4WVcTfX95Vxvg4TGsKraxz3mbqWufj20Y9pQ0UflGQXxPOegOucssLK91wARv
         y5Re7EjrkLEipEhM1N2GROU55udp/liZ8fk8Ag+qo2pwSwAlcJoiAaGp/l6YGWqd0Z2x
         qyFjCtb+N1US4yqlUScCOKlP+s2+bbUvxu38aEUwbvj+yUU/k/dd2/7lG0qy2Lg7m+BA
         xF5htstiIZ0KfOWHdRmrZFbQVMiHgpFq/VVduUViV5ZuFHGmMc/TPhxFB3YhL9xCeW3i
         YC4g==
X-Gm-Message-State: AOAM530f7LSWeYUcLKQzanTEY81QglUb7DQey6vbwFkWR0Pz1ZGHj8y7
        VaDhd6ARipBpQoE6lnRnLEG2vw9q8tFHIjc9gd8gS4Yydlxnug==
X-Google-Smtp-Source: ABdhPJz8Fs/lByCRrqqXLa3uco/tN8npZwUZ9fqdEfcHy+dfvEkvZxsQSmSiX8brFmaAbGdrbukbIMqI5en+3f8e4rg=
X-Received: by 2002:a05:6102:cc8:: with SMTP id g8mr1471720vst.39.1644453157351;
 Wed, 09 Feb 2022 16:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20211006224659.21434-1-digetx@gmail.com> <20211006224659.21434-4-digetx@gmail.com>
 <YWimShkkxkR+bQLK@robh.at.kernel.org> <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
 <d69f99ed-75a4-9b8c-addb-3eaa2b2be6a6@canonical.com> <CAODwPW-AMqQ+ZbnvUTuxP5Bbxdcy08GSXnhcLC+V6BW=OPYaqg@mail.gmail.com>
 <6568fd31-113f-1581-4eff-45a4a1eb4e5d@canonical.com> <c33c9de2-ff0f-0ba7-b424-728d316dcca2@gmail.com>
In-Reply-To: <c33c9de2-ff0f-0ba7-b424-728d316dcca2@gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 9 Feb 2022 16:32:25 -0800
Message-ID: <CAODwPW-VfbvWs3OVON1m=WWFXN2V86o9jqurVDShpfTrSn=Mkw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id properties
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Julius Werner <jwerner@chromium.org>,
        Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> I don't mind, but I also don't see where the revision-id property of
> LPDDR3 is used at all. I can't find any device-tree with LPDDR3
> revision-id and don't see it being used in the code either. Maybe it's
> the LPDDR3 binding that needs to be changed?

We are using the revision ID in userspace (read through
/proc/device-tree) for runtime memory identification. We don't have a
kernel driver bound to it. Our boot firmware is inserting this value
at runtime into the FDT (that's basically the reason we have this, our
firmware auto-detects memory during boot and we use the FDT to report
what it found to userspace), that's why you can't find it anywhere in
the static device trees in boot/dts/.

> I made each LPDDR2 revision-id property to correspond to a dedicated MR
> of LPDDR, which feels okay to me to since it matches h/w.

I'm not super married to my solution, so if that makes things easier
we can standardize on the two-property version as well. I mostly
designed it my way because I thought we may one day also want to do
something like this for the 8-byte LPDDR5 serial-id, and then it would
get kinda cumbersome to have serial-id1 through serial-id8 all as
separate properties. But that's also a bridge we can cross when we get
there.

My use case is in a position where we could still change this now
without requiring backwards-compatibility. Krzysztof, would you be
okay if I instead changed the "jedec,lpddr3" to the same thing
"jedec,lpddr2" does -- seeing as the original patch was from me, my
use case could handle the switch, there has never been any actual
kernel code using the property, and it seems very unlikely that anyone
else has silently started using the same thing in the time it's been
in the tree? Or do we also need to go the official deprecation route
for that?
