Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C92FC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3555E60F12
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347257AbhIBT0x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 15:26:53 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40688 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347245AbhIBT0w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Sep 2021 15:26:52 -0400
Received: by mail-ot1-f54.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso3906130oth.7;
        Thu, 02 Sep 2021 12:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WfNiJevXXznsjYSTw7sC46xy0DwFMMffCSoTuGS9Xu4=;
        b=Y8BUb7Xt8iA7k/MABzWeQHQSg0qtw/9FZh6SRuCD5XEFOly7PRUddmsvAdFjcCcN4p
         LW4IwnDM9ZMVJrlhvH2KiO3bVpXM+8GS6d8ioWbUkRWCLPnBwkz3p8WCHVFJPflpkgwV
         RNtxyIigTdZniNi/+07tkETjzxO2zMYHOlfEHKP3K3GT6jsKxemXRHElkY8V/Qr6BVhR
         kKZUScDiP/dyclxZniLhYnGpDNyFAojGpBw4dS6Z5cbSCJ/J6va41v/UxbPvEaXnu3CH
         3PKtpmp7/yIh/T8zIWt82Zeee0twdREABA79V+dkA+jk4InkRY48AsMeaHJ+n20JTMK+
         jlCw==
X-Gm-Message-State: AOAM530jk8gfQzyA+bcv2PNejt/JbcOd3XEZilZiTy4JWgL2jmx9wsMv
        kJQMjvE27IEyng7r1AVWqw==
X-Google-Smtp-Source: ABdhPJxZqPrhAD7h+cRcMlo04U4J5xrjfGsEQCo9fP0tXbDDy09MKoV+rWy84mbFp2TJ7J0+qYSFmw==
X-Received: by 2002:a05:6830:608:: with SMTP id w8mr3910518oti.73.1630610753804;
        Thu, 02 Sep 2021 12:25:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w12sm543935oie.41.2021.09.02.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 12:25:53 -0700 (PDT)
Received: (nullmailer pid 1245839 invoked by uid 1000);
        Thu, 02 Sep 2021 19:25:52 -0000
Date:   Thu, 2 Sep 2021 14:25:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, stephan@gerhold.net,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTElQBgwF6xBFH9l@robh.at.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 02, 2021 at 02:47:27PM +0200, Jerome Brunet wrote:
> 
> On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:
> 
> > The 'sound-name-prefix' is used to prepend suitable strings to a
> > component widgets or controls. This is helpful when there are
> > multiple instances of the same component. Add relevant json-schema
> > and is inspired from sound-name-prefix.txt documentation.
> >
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
> > new file mode 100644
> > index 00000000..b58cc9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Component sound name prefix
> > +
> > +maintainers:
> > +  - Jerome Brunet <jbrunet@baylibre.com>
> 
> Since this file is referenced using "AllOf", am I going to be listed as
> maintainer of all the drivers using the property below ? I'm not sure I
> want that ... :P

No. That's not how it works. You're maintainer of files that list you as 
maintainer.

> Maybe it would be better to drop the above ?
> 
> > +
> > +properties:
> > +  sound-name-prefix:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Card implementing the routing property define the connection between
> > +      audio components as list of string pair. Component using the same
> > +      sink/source names may use this property to prepend the name of their
> > +      sinks/sources with the provided string.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    analog-amplifier@0 {
> > +        compatible = "simple-audio-amplifier";
> > +        sound-name-prefix = "FRONT";
> > +    };
> > +
> > +    analog-amplifier@1 {
> > +        compatible = "simple-audio-amplifier";
> > +        sound-name-prefix = "BACK";
> > +    };
> > +
> > +...
> 
> 
