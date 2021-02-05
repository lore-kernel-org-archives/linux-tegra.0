Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33E4C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72A2564DD9
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 22:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbhBEW3H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:29:07 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41471 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhBEOVA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 09:21:00 -0500
Received: by mail-oi1-f177.google.com with SMTP id v193so2485690oie.8;
        Fri, 05 Feb 2021 07:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LBB/K1kyVMf45FQm6DNIMXTfZ1zpjCDhDz7ZekVCnj4=;
        b=OBFLAR8X25Pz9c6NiqjOkA0fhOl98U06JqLmDG7fcuLgZMUFj/cyFw6wVj7Me/LTaV
         G4/QjIPJPjEnpr+JutAX8PyQfdH+zRs9+UqkaHn+QxYDvMm93PPck2my8MBL6WQW71mb
         v2oMQAkswUuPKydTVERyJqdyxo0fbGJhEUrOSAJN2G0maeyn7290mzivTeK5sywibA34
         cjwOiyzM8D0AhwtLwXckx4EaHc3Ee57Opo8dW+KMao59neu+hSmcWlaCpXlQqDzyFt2H
         jC+bvfLQrkg7Bjb+Oq4ld785uthQ9pYoyDDk2nQBBpTyyQa70kY1+/UJDI/U3xQoWKCD
         NPdw==
X-Gm-Message-State: AOAM533MZT/UrR8WrWtkDWqxbOq3eGAkCxyUTDQQd155oiYrgL31FhPF
        4RQ+1CSKYs9c+x4faC3qK+oE6aMOJw==
X-Google-Smtp-Source: ABdhPJzmDaqjU2DN6vgXDMRwi7rTligOWZzbFMVmO+rk5dPiHs+i4Wq2U3GFjcEtRSoQHzyN8juvuw==
X-Received: by 2002:aca:abd5:: with SMTP id u204mr369245oie.119.1612538806468;
        Fri, 05 Feb 2021 07:26:46 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q3sm1787983oih.35.2021.02.05.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 07:26:45 -0800 (PST)
Received: (nullmailer pid 3084982 invoked by uid 1000);
        Fri, 05 Feb 2021 15:26:44 -0000
Date:   Fri, 5 Feb 2021 09:26:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     thierry.reding@gmail.com, broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph-card: Add clocks property to
 endpoint node
Message-ID: <20210205152644.GA3083322@robh.at.kernel.org>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611944866-29373-4-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 29, 2021 at 11:57:40PM +0530, Sameer Pujar wrote:
> Add optional 'clocks' property to audio port 'endpoint' node. One
> such example is where SoC supplies a clock to external audio codec
> component.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 766e910..08ed8f5 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -33,6 +33,9 @@ properties:
>          properties:
>            remote-endpoint:
>              maxItems: 1
> +          clocks:
> +            maxItems: 1
> +            description: Describes the clock used by audio component.

NAK

An endpoint is not a device. Clocks go with a device.

>            mclk-fs:
>              description: |
>                Multiplication factor between stream rate and codec mclk.
> -- 
> 2.7.4
> 
