Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE519C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C695361058
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 08:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348322AbhICIbp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 04:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348290AbhICIbp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 04:31:45 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73333C061760
        for <linux-tegra@vger.kernel.org>; Fri,  3 Sep 2021 01:30:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id u15so2965317wmj.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Sep 2021 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=tSBoI24rmmAo/WWLDhLND6YxNYncWnjj1r5sALynAJ4=;
        b=K4wGE5iP441yxWa+TAQZ1VZZMZnv6OfvJKWEzE+MCQj7K2oMTS8aHeDQgL7IlCV5+r
         II5rICDjfU5wlQZmioHZXxoVszg5g1wTZIPmZf+V7KOVQKYfmuoowJ602eTn6HBmdjhR
         40Z5W0mxAnYB/D/m3H3U18iiaEtRB1XAs6OsSrvD75MTsAFVEgpJuvIWB45lquL4eZPg
         WHGJylo9CiP3ELxpw7rat1Y5lK4ARxd2H5aZyiP/QOH5s9LmA5oPmoO04VDfHoMMtTxu
         mwZcDDhHJY/GZrwjRiCTfmJmArcJ97MVfnRwjnpryjB2B5p2fewYpM6VuJPJjmAlvb6U
         L/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=tSBoI24rmmAo/WWLDhLND6YxNYncWnjj1r5sALynAJ4=;
        b=UnJ1eCyEx1p2s7Y+hyrBvcP1jmQu+1LhitHFr5GbtroP0i8AwojS/0uwlShBgTwm6I
         fDLIILt8zdRTnqdjgWmT2Ltf6ldZofKcAHcJ5joNZ2eoYn8VseLvXYoi5TvMLj/RVHQY
         1J6W0QeIHaeDGQsFB4k9LOgG8zNgEuzg0TAnXXfR3r7dMKumI58Na5CNCtHJNim9zdfx
         UXFyUYMeLBEF2M+dZ1rC/IeWXLzPxAl7lVbFOe3UXa8mf/ui1+1XVv6qgyiekpJ/9sLe
         0iicFsr9N0L+WJ7vpKMlXAmZ4md2U8c4mD0vA7xOkZc7TqhOy73dsMcjtJ1+ZG4bMPHG
         jewg==
X-Gm-Message-State: AOAM530O9Dadry+iB5wrJQ1hVfMZC1OI0Cy1DXC2j/4jt2dYlaWkqWWU
        D6M/CABvbKAqrRsDqoSdvsGdMA==
X-Google-Smtp-Source: ABdhPJzIVzeO9objMjNkGGwltqZ/D3PN/vMifRhZaWUZqUx5iRpM6g1pt+vfuZhIf9TYGOJSBH5HPA==
X-Received: by 2002:a05:600c:4ece:: with SMTP id g14mr2177689wmq.6.1630657843920;
        Fri, 03 Sep 2021 01:30:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r12sm4323542wrv.96.2021.09.03.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 01:30:43 -0700 (PDT)
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
 <YTElQBgwF6xBFH9l@robh.at.kernel.org>
User-agent: mu4e 1.6.5; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, stephan@gerhold.net,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Date:   Fri, 03 Sep 2021 10:29:37 +0200
In-reply-to: <YTElQBgwF6xBFH9l@robh.at.kernel.org>
Message-ID: <1jk0jyt617.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu 02 Sep 2021 at 14:25, Rob Herring <robh@kernel.org> wrote:

> On Thu, Sep 02, 2021 at 02:47:27PM +0200, Jerome Brunet wrote:
>> 
>> On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:
>> 
>> > The 'sound-name-prefix' is used to prepend suitable strings to a
>> > component widgets or controls. This is helpful when there are
>> > multiple instances of the same component. Add relevant json-schema
>> > and is inspired from sound-name-prefix.txt documentation.
>> >
>> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> > Cc: Jerome Brunet <jbrunet@baylibre.com>
>> > Cc: Rob Herring <robh+dt@kernel.org>
>> > ---
>> >  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
>> >  1 file changed, 35 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> > new file mode 100644
>> > index 00000000..b58cc9e
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> > @@ -0,0 +1,35 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Component sound name prefix
>> > +
>> > +maintainers:
>> > +  - Jerome Brunet <jbrunet@baylibre.com>
>> 
>> Since this file is referenced using "AllOf", am I going to be listed as
>> maintainer of all the drivers using the property below ? I'm not sure I
>> want that ... :P
>
> No. That's not how it works. You're maintainer of files that list you as 
> maintainer.

Thanks for clarifying.
You can ignore my comment then Sameer. 

>
>> Maybe it would be better to drop the above ?
>> 
>> > +
>> > +properties:
>> > +  sound-name-prefix:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description: |
>> > +      Card implementing the routing property define the connection between
>> > +      audio components as list of string pair. Component using the same
>> > +      sink/source names may use this property to prepend the name of their
>> > +      sinks/sources with the provided string.
>> > +
>> > +additionalProperties: true
>> > +
>> > +examples:
>> > +  - |
>> > +    analog-amplifier@0 {
>> > +        compatible = "simple-audio-amplifier";
>> > +        sound-name-prefix = "FRONT";
>> > +    };
>> > +
>> > +    analog-amplifier@1 {
>> > +        compatible = "simple-audio-amplifier";
>> > +        sound-name-prefix = "BACK";
>> > +    };
>> > +
>> > +...
>> 
>> 

