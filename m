Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E11C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 11:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C435A61153
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 11:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351606AbhIHMAo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Sep 2021 08:00:44 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:46592 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348327AbhIHMAn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Sep 2021 08:00:43 -0400
Received: by mail-oi1-f181.google.com with SMTP id w144so2716676oie.13;
        Wed, 08 Sep 2021 04:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qTd+a1Qio1as5lF7tXUCdkWNQDx3y4a08StoE1WH8nY=;
        b=lnYOT8YdFZGDj5pNbo0w3UZFOpnkHNs45CAEbDlpnF05cG4yLX+0Fxuhz3WFe1YtwD
         YEyFRSs4FaLgde5IVj5K0p9uy8AJSsbNJEDerNgrWqUyT/DSxBpjayXBXE1Cq9LwsCwi
         qBSO8g4S3/Tl1Xky1F968maxGUy9Pz8tjvmcwJPCx4fcGYWFaIHB7Pr/P/BfdwGzqiP3
         xWwvmqpARcy0kW8n5H+qgsPwUm67IAaCPDqXJJ51yB7NHQAsqHTfXRo5nAnB3yfxxrpA
         xZ0qx/E7qOnLZLTquYyP54sbNnLfMg+QoNCFsdr5cYEYnym8ptFCjJOTQLOYzcCdp+nL
         NOOw==
X-Gm-Message-State: AOAM532g+0Z5wN1Io1nyBClWVHQh3juuzNkFF20xp8B6Q8q6xRVVFOlt
        3JVPAimeiAS0C0tN43xhD/dOUQlr4w==
X-Google-Smtp-Source: ABdhPJxKNUhI9+Agn3GB0Nl3kb3amXTCSFswobafI/TLyTxPHHhVSmgznRhdlTbJ9qFQLvAOy5MwYw==
X-Received: by 2002:a54:4f03:: with SMTP id e3mr2035018oiy.32.1631102375690;
        Wed, 08 Sep 2021 04:59:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l3sm388177otd.79.2021.09.08.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 04:59:34 -0700 (PDT)
Received: (nullmailer pid 1851575 invoked by uid 1000);
        Wed, 08 Sep 2021 11:59:32 -0000
Date:   Wed, 8 Sep 2021 06:59:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, stephan@gerhold.net,
        lgirdwood@gmail.com, jbrunet@baylibre.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTilpGuVKifYfGTY@robh.at.kernel.org>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630686919-19495-2-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 03 Sep 2021 22:05:17 +0530, Sameer Pujar wrote:
> The 'sound-name-prefix' is used to prepend suitable strings to a
> component widgets or controls. This is helpful when there are
> multiple instances of the same component. Add relevant json-schema
> and is inspired from sound-name-prefix.txt documentation.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/sound/name-prefix.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
