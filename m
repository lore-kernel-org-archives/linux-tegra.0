Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E50C7EE2D
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Feb 2023 19:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjBZTjE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 26 Feb 2023 14:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjBZTjE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 26 Feb 2023 14:39:04 -0500
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C6010260;
        Sun, 26 Feb 2023 11:39:03 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id b5so1798261iow.0;
        Sun, 26 Feb 2023 11:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89W8sQtkd61sVfaU10t/qKgr0MKiSQvzQZkuL6seV7U=;
        b=jibHMxZB12Cszdl8Q7b8cMpsDY40d/1H5kUFasiBrO1VOOl7VR0KWVYEeENS4FDqHk
         dJ6brv5FURo9Abn71jIqb2dv1+gz1SrymaugPnNQQo7G0v9Wh35y8ja/CS9/7SWlozBY
         846mU9kX0A0fXJI6keeuyQVcgflA7HoZVFqIgpOWwJhPk3wQT6yhHpTutLbJXbWFgOqE
         QW3ZZJBeIbAppWr2ef4b5lFpzATHsSzeQzvWNCNiGk/CSzcZLuEmKzO3BxhVmI7940Xs
         FnLTIpFD9hXb/gRYE5jdMNP6qaoqSAx4EAM6fSK7HppEvYLBxTUH2tX2BmAgtdT0wQNW
         vurw==
X-Gm-Message-State: AO0yUKWjRP6ZO1AKqedk+/KIg5AN7PJKfDuNYwuGoCDb42k55GL4gUYW
        sksL0KetQX4mXENxfLsx2w==
X-Google-Smtp-Source: AK7set/5nBIZVAj/LVt6z9Ors0aU51Gq8OePJvNbEIYYnG/6pe8XlIx9yljAd/4a/CPHttVJgHuDsg==
X-Received: by 2002:a5d:8e01:0:b0:74c:822c:a6ac with SMTP id e1-20020a5d8e01000000b0074c822ca6acmr14735248iod.15.1677440342580;
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id v22-20020a6b5b16000000b007453a11bdf5sm1635543ioh.13.2023.02.26.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: (nullmailer pid 192292 invoked by uid 1000);
        Sun, 26 Feb 2023 19:38:58 -0000
Date:   Sun, 26 Feb 2023 13:38:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
        Jaroslav Kysela <perex@perex.cz>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 05/10] dt-bindings: sound: nvidia,tegra-audio: add
 MAX9808x CODEC
Message-ID: <167744033766.192237.14439523199147830921.robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-6-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-6-clamor95@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Tue, 21 Feb 2023 20:32:06 +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for MAX9808x CODEC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../sound/nvidia,tegra-audio-max9808x.yaml    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

