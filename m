Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3734C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 01:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237550AbhKZBNk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 20:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhKZBLk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 20:11:40 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F45C061574;
        Thu, 25 Nov 2021 17:08:27 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id v15so15650569ljc.0;
        Thu, 25 Nov 2021 17:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UGO6rN17miNJTMO6kEKzbLFRfLfEsZ5XOCr8ahzcsGE=;
        b=HK1690ATF2nVNKaPt4pcQ/SDRvwvKGIyUie/R+Ts0aO0XKAnxrlKyp4NTqDOxuYs4M
         9L4pDu9CaYXbl8S1JvKp7yAT/Zbu/BECeB9F4k/8i1ftew3HsHmb93PTSP6+uMXwIX1z
         UoZWxjOytY6YLF6cfmuc7jfVmVFuLSr8hQ4xoZDuhYBZ+0OUvDczc/6ERD8GYlBz6v1Q
         +QlX0NKojruA72vchivpj5Ws2QKiXfwTl1z0/cJJCNIXLWYdtbIOgw2UdT7/9+VxiANA
         G/DaPjjWEH3WVuEHymvrWcWs2ifI4mdK2KU6DZQSt5svH3wpVQr3DcODzIrWlXzYt9JE
         AL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UGO6rN17miNJTMO6kEKzbLFRfLfEsZ5XOCr8ahzcsGE=;
        b=CmoPyzVXa3B482Q2yheCf7SDoTn4vaj7zvMNvkbmjpFXZZ5vPQLPUWkZN7XC4JgLKS
         5iqTkUbmIru62ekFP5TWwo0iJ4XPGjR4xk38VoS92YAU8Py9AuxS7GEWjCiTr7JLcPWp
         Gog0aQPz8gCOJzJl78XFbBqGHVFw4su5skVMv/jBfJwht+4nUmJf+ql+B+S5vNlOBQ37
         ylgXBb9zBsOAw/LrubNeY+z1gvpuSmefG/QOPWNvypxPL6klx3krD413Ng1gNUSI6QV/
         4ERlc2NHYQa3hTcG0delyWVijjN3SA/CLUfqt6HjskMAfQPb9SxEutY5NqA/+z15/yUH
         Bitg==
X-Gm-Message-State: AOAM532oBWU6gn/BoLw2M4y/Tosdpi6kk/B4/D+ok19fXyXDVmxUSsrj
        DaRlPwmC+G5n8IJsEX7RlrtCr1DT6dw=
X-Google-Smtp-Source: ABdhPJw5u/B8ZH1YuKd4akVumwownmSG11mUWnxsExAZ8MTck+K+I3tFpmYsTmIOkMfN8rDKfnoapQ==
X-Received: by 2002:a2e:e09:: with SMTP id 9mr20584527ljo.172.1637888906336;
        Thu, 25 Nov 2021 17:08:26 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id z4sm372582ljj.26.2021.11.25.17.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 17:08:25 -0800 (PST)
Subject: Re: [PATCH v1 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to
 schema
To:     Rob Herring <robh@kernel.org>
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
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-3-digetx@gmail.com>
 <1637875562.276093.2858310.nullmailer@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d12b0e75-4605-b65a-2f87-a4c4d363fc90@gmail.com>
Date:   Fri, 26 Nov 2021 04:08:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637875562.276093.2858310.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.11.2021 00:26, Rob Herring пишет:
> On Thu, 25 Nov 2021 01:00:39 +0300, Dmitry Osipenko wrote:
>> Convert NVIDIA Tegra20 I2S binding to schema.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 71 +++++++++++++++++++
>>  2 files changed, 71 insertions(+), 30 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.example.dt.yaml: i2s@70002800: 'clock-names' is a required property
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1559387
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Indeed, I missed to re-check the I2S binding after last minute changes.
That's compelling reason to make v2.

Then I'll also remove the now-unnecessary assigned-clocks property from
the S/PDIF binding.
