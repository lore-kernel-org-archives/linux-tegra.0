Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F3AC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 13:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD9BA61935
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 13:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhC3Nqt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 09:46:49 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:45626 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbhC3Nqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 09:46:37 -0400
Received: by mail-ot1-f42.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so15588903oty.12;
        Tue, 30 Mar 2021 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x7Y9OAKTjUXB4SxJIaML037GXNn8syZ6IN33bLdFQVs=;
        b=aaHv3LXVDPCShrZKaQ3VmrXwv/o2758Hyv3gLXBGptjHXf7Eoq9iVEvI8Qokvfs7UQ
         dG5hbuZ7t+jWD/Qwc2z1IpgA54cOLIeU18F4vV+tRvHFi4dpY5xqxAfaQvfKGa33XlsQ
         IfPDzO8AVHMkxbzygpHEzF0Jgb+XfoUs7NBVxtrwBoBTdnB13JbbrQ1WiJ2bdW82yyz8
         Otf6GNtesPL3h3DUnGimPS3vqabRzqxziQxUHUZ3Fv6wg29h/Ke1Wuke32j9ZWDKVfQ/
         SxrR+Q1sm1U604nhTNUdq1Q99J7wPoPFhhnwEgbpSdSBN264In7DNpDwFx2QlQQ0Gnel
         EV4w==
X-Gm-Message-State: AOAM531+aOe//mGp1O1KD4zDEZXNxfGIWjbqjZCs9Z+ciYHqWdJYk9Nm
        7J/IvnxkigYdJrVJfiNB6Q==
X-Google-Smtp-Source: ABdhPJzbxEuCJ/O4ZwoCSryf3zJezsAN+RxFpIRw2gGKF/WY7304MAxLEfpNTRv3CQDKhIxMv2X4Zw==
X-Received: by 2002:a05:6830:20d2:: with SMTP id z18mr26903645otq.260.1617111996970;
        Tue, 30 Mar 2021 06:46:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm4341899ook.40.2021.03.30.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 06:46:35 -0700 (PDT)
Received: (nullmailer pid 223205 invoked by uid 1000);
        Tue, 30 Mar 2021 13:46:34 -0000
Date:   Tue, 30 Mar 2021 08:46:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 4/6] dt-bindings: memory: tegra20: mc: Convert to
 schema
Message-ID: <20210330134634.GA216433@robh.at.kernel.org>
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-5-digetx@gmail.com>
 <1617109723.704724.173732.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617109723.704724.173732.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 30, 2021 at 08:08:43AM -0500, Rob Herring wrote:
> On Mon, 29 Mar 2021 22:46:00 +0300, Dmitry Osipenko wrote:
> > Convert Tegra20 Memory Controller binding to schema.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
> >  .../memory-controllers/nvidia,tegra20-mc.yaml | 78 +++++++++++++++++++
> >  2 files changed, 78 insertions(+), 40 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.example.dt.yaml:0:0: /example-0/memory-controller@7000f000: failed to match any schema with compatible: ['nvidia,tegra20-mc']

Yes, this is a new warning. It's off by default for dt_binding_check 
until we fix the existing warnings, but you can enable by adding 
'DT_CHECKER_FLAGS=-m'. Support for this is in the dt/next branch.

Rob
