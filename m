Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EF7C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 19:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhLHT1F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 14:27:05 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:45574 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhLHT1E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 14:27:04 -0500
Received: by mail-oi1-f170.google.com with SMTP id 7so5383018oip.12;
        Wed, 08 Dec 2021 11:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L9tuImQipEdWA62iP26K1VCWaEa6caOxdPF4GSbxxRE=;
        b=oJPfPyhXvygmQMP6bG4c+wwbOszcR3v55UAivTpXI6ne/+c01gJzkWKksDYyfiQ+Uh
         gCJUYXhEPZBEm4Ywwmy31WMKGY03yy4eogVXUB/kAfSDsuiSXgpdn3+Wt+OoHboGfQJc
         Pb+SSfvMWqKctYzM2qVZdIsTIMEf4YFUMVSTvHKKC0MCUSOg8JJ5N1e/AHlnF4NJ6nQJ
         exog2izYqbtomp1VT3PXAHL77YUUjg9GEeXJp9pOjqHNGZE8I2zQV4wppGEFoPj/KlNo
         YUZAj+8Lim9x9X5GQEDRRHOmpzEowIyZuyWHb7m+qqjOaiRgzuZNP9cb0mjTi4fwvcvj
         3BmA==
X-Gm-Message-State: AOAM532nf8VNqlxxIfGwWS5oye0gJHfQrojrVAnl9qj4f+oT+KjeSy5b
        /gCQXM7HoPPELkPsyn5TLg==
X-Google-Smtp-Source: ABdhPJwEXKjzQVMqf0l+eXC2BX/ExroyFCZSz0010kEAYxGIWrwtCnAV4BsJ38RUj5CtvCKiUIa+Sw==
X-Received: by 2002:a05:6808:3b7:: with SMTP id n23mr1367820oie.160.1638991412349;
        Wed, 08 Dec 2021 11:23:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m12sm620250ots.59.2021.12.08.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:23:31 -0800 (PST)
Received: (nullmailer pid 184018 invoked by uid 1000);
        Wed, 08 Dec 2021 19:23:30 -0000
Date:   Wed, 8 Dec 2021 13:23:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Message-ID: <YbEGMp3P9GkkCGeQ@robh.at.kernel.org>
References: <20211206154624.229018-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206154624.229018-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 06 Dec 2021 16:46:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the interconnects and interconnect-names properties to the bindings
> for the sound card on various NVIDIA Tegra based boards. These are used
> to describe the device's memory paths to and from memory.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra-audio-graph-card.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
