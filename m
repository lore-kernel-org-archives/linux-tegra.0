Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1230CC43217
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Nov 2022 16:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiK0QiZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Nov 2022 11:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0QiY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Nov 2022 11:38:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC34064CF;
        Sun, 27 Nov 2022 08:38:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D14CB80B0D;
        Sun, 27 Nov 2022 16:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A7CC43470;
        Sun, 27 Nov 2022 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669567101;
        bh=aUiblZFngrd+gBIPDt/vCbIylr1oZa/GSw6AYX3RVbw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eTj7Ok9CQqWMTFD/7pssddZcKU+xUwEVXO90AkeNRBh2YP9D6PFP4dWDK0emyw6P5
         /ozmFn6zxCUwlKKKkZd64evIDUv8tfqyfNH4DZujPGKnACs463ox8NDIhzDqtUt8Cr
         61M6d1qLexZSdurJICOcXzYP0gG+hGtgOhoOpq1T0ctDJFNLnFAz4A+DCn4F5lVMZ2
         IBai6wBlGMroTwZHLdfZZrNHFGAOTKxDSRERJCAKX9HiBlKpRfr9FlWAeq0O6ouLu4
         phRlLxMKKpNbOpoO147gJkKgOJifjGKPgwTGHy7gBYFB1YDYbva7akvpZDQXOlle8y
         XxfBzigo6l92w==
Received: by mail-vs1-f46.google.com with SMTP id i2so8478288vsc.1;
        Sun, 27 Nov 2022 08:38:21 -0800 (PST)
X-Gm-Message-State: ANoB5pkic/SpT3oTCGWQOuEdRHrOHY2FyUqMJjTgFN6D4Rco/dmwwvjg
        q624It66+aYbGPRJBh3UwlmM+SyE3wwGXB2kEA==
X-Google-Smtp-Source: AA0mqf4MGoQj/+4GW+LQKzNWq6+l6Xft7suUyGnNAJc5TDGy9BVJhuB+l87sLN0REo0fDjjlMAI4J8sY/+GnK7H/Ip8=
X-Received: by 2002:a05:6102:3003:b0:3aa:2ac7:5956 with SMTP id
 s3-20020a056102300300b003aa2ac75956mr18431419vsa.6.1669567099999; Sun, 27 Nov
 2022 08:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20221103144200.1479640-1-thierry.reding@gmail.com>
 <Y4C4Cp1D+QEKWiaf@wendy> <Y4C8JvSQuNZiDmJb@wendy>
In-Reply-To: <Y4C8JvSQuNZiDmJb@wendy>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Nov 2022 10:38:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKFS5nKRihLL60zfqtNujrYGaxN7sp7SbYA_ajC4w2rpQ@mail.gmail.com>
Message-ID: <CAL_JsqKFS5nKRihLL60zfqtNujrYGaxN7sp7SbYA_ajC4w2rpQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: usb: tegra-xusb: Convert to json-schema
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 25, 2022 at 6:59 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Fri, Nov 25, 2022 at 12:41:46PM +0000, Conor Dooley wrote:
> > Hi Thierry,
> >
> > On Thu, Nov 03, 2022 at 03:42:00PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Convert the Tegra XUSB controller bindings from the free-form text
> > > format to json-schema.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > > +        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
> > > +               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
> > > +               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
> >
> > This seems to be breaking dt_binding_check in today's linux-next:
> > FATAL ERROR: Can't generate fixup for reference to path &{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}
> >
> > Am I missing something? My dt-schema is today's main.
>
> Apologies for the noise, it appears to have broken several days ago and
> is not caused by this patch.
>
> I'll go bisect :)

Yes, the above unresolvable paths need to be fixed (to labels). The
examples are built as overlays so that unresolved labels are allowed,
but dtc now checks for unresolved paths.

Rob
