Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78128C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5541A60E8B
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 19:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347356AbhIBT20 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 15:28:26 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:39531 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243515AbhIBT2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Sep 2021 15:28:25 -0400
Received: by mail-ot1-f46.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so3913490otf.6;
        Thu, 02 Sep 2021 12:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vTEOj2Oz/vkZd9p2VPI7+5Yw+i+4KcedhEoFPxZ0RV0=;
        b=bM4ljAnGZb4vcsNmjL8O8WtiOo73YxN+ksWt90yK7xf/ASHh/yi8ghSu6H8FzqFaKg
         mkw+2WvtXQoeE5Qe/ZTpCy9F39KI488G5s3jMxt2cGRhgknUr3GvbI5TmrONnZunVIuv
         xkyoUdrAmqDx6rwIaGu1MI1dzXDO+6xxrfZuS2dS5nBL1EX47Clf/kUb34qs3oMnx2Bw
         aMorUb1dMiPF7sLeb18TS5lQ71cmnNmEl/g7dKO7ZY+O6qJvnCpBNu2m9w5VCkDaEYeR
         mzebxNvo9B6WfLI9zz8q6ErBhYjA50kc6QoT2rpq4c2ao+VDc+vfnKMEmMKkbN1eCC+R
         mr9Q==
X-Gm-Message-State: AOAM533HfUcTc/1EEqmfbQhned8jzHH7FsTem+YUcL9zM9PHMHyyF1Xt
        tc0TXE3g3aVA1HsByp1WLQ==
X-Google-Smtp-Source: ABdhPJwDfs8TaxQM2Rdk9jCeoYg+mHv5mL1sLoQllJ2+R1ddJdVlycHR6CRdLwImN8IQHdNSQu61Zg==
X-Received: by 2002:a05:6830:2781:: with SMTP id x1mr4141031otu.334.1630610846795;
        Thu, 02 Sep 2021 12:27:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s10sm542189oog.14.2021.09.02.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 12:27:26 -0700 (PDT)
Received: (nullmailer pid 1247901 invoked by uid 1000);
        Thu, 02 Sep 2021 19:27:24 -0000
Date:   Thu, 2 Sep 2021 14:27:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, stephan@gerhold.net,
        jbrunet@baylibre.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, lgirdwood@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTElnNRjM3JTnYIw@robh.at.kernel.org>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1630584239.106707.685602.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630584239.106707.685602.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 02, 2021 at 07:03:59AM -0500, Rob Herring wrote:
> On Thu, 02 Sep 2021 11:23:51 +0530, Sameer Pujar wrote:
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
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/name-prefix.example.dts:19.28-22.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@0: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/name-prefix.example.dts:24.28-27.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@1: node has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@0: failed to match any schema with compatible: ['simple-audio-amplifier']
> Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@1: failed to match any schema with compatible: ['simple-audio-amplifier']

I'd suggest you just drop the example. This schema is not a complete 
binding.

Rob
