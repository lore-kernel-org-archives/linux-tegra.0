Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2F9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 21:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244772AbhKYVbY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 16:31:24 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46025 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbhKYV3Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 16:29:24 -0500
Received: by mail-ot1-f49.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso11132896otf.12;
        Thu, 25 Nov 2021 13:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=K9sBfhhvh3TyySdJ4+kH3HFS2nUgK5mo6oF+b8evIIw=;
        b=ABG0AYWQQR6yg6fARRndhQ3NlQwfj5b5BxfrdzzKRzZm04xH6zCbGCYTTYX9ZvOQ60
         DVdr0uPOwTm/906YDJLsEglwcRa4S24iMV3D+Tsjg6P6hURK3SD1SSyzVwKbM3T/iCD8
         cVIxW7JF1jHNZazrVrqQ0Zqcwf7J2Rl04ILtKXk+B+utuvyC/JubBS4Pqdb58WBqq6Fb
         nMu7pgWbS7MaGYbi3iZDc91sihmjhqDnPyU9RgRCFOwo2XIx5fDYYzfZoiIy7z1MHGR9
         3hAef/lFmASxJnBfKnXJpvY4tJ3Wz3KkesTpcLAOK6Pw9m0WEd5QcLMzD+q3IVrUY0N6
         0TiA==
X-Gm-Message-State: AOAM531A+/UbBD+5tGbbPaXxC4+klpkSp6cXH555djTqcrzZgtXLNyWo
        Z/dnHfSpcEjlkFMZ5r5Dsw==
X-Google-Smtp-Source: ABdhPJzzt0Csr7okspWgSLe+I1n4SZvDhCX1LyaO2Mr9NAGUFau59mr2FaZq2piH3W6tpFyYwBeH1w==
X-Received: by 2002:a9d:6c54:: with SMTP id g20mr24876267otq.30.1637875571987;
        Thu, 25 Nov 2021 13:26:11 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w19sm870433oih.44.2021.11.25.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:26:11 -0800 (PST)
Received: (nullmailer pid 2858311 invoked by uid 1000);
        Thu, 25 Nov 2021 21:26:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Agneli <poczt@protonmail.ch>, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
In-Reply-To: <20211124220057.15763-3-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com> <20211124220057.15763-3-digetx@gmail.com>
Subject: Re: [PATCH v1 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date:   Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.276093.2858310.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 25 Nov 2021 01:00:39 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.example.dt.yaml: i2s@70002800: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1559387

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

