Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D80BC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Sep 2022 11:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiI3LMl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiI3LMW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Sep 2022 07:12:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0AE9FD2
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 03:49:34 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id g20so4376034ljg.7
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LQmSfvmdYcsQ3TJepFnKd/I61iUETxbyLBYaG0YvPbI=;
        b=Y+JUJPVygm/ITXHKeSfUaFFgpAaI72Jh2PqOZmcQbr7wEp/T21V1m1zqkb7bdugTVK
         zVG/Ozek+Mr1dlouceNXls+BAU5UiECu/CgM0WtVvmeR/QJ3rlRuI7vVGgpmn8LOQQ8f
         Ndfs34MSlH6zNitvV4S5VBKBARAUvcqT6J31HXC0rxISSqZnAq7KXyyOyZUmU8QfeNnW
         Yk/3yUBxsPhKkdhpJ5hjvPPGt07fYg1kc3TKX5JsLbgXqKleWz2ouwU+vIKk+W8ffCR7
         odxsWCkgiCLk77IjVeadGAgft4V82TUO+QfaO9ydbejomjCQ7bBsIMKjdI+ixkFTd43K
         kYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LQmSfvmdYcsQ3TJepFnKd/I61iUETxbyLBYaG0YvPbI=;
        b=YbDpVbcocJLO+aZdvjg+0af4u6q2KwRGfu1DfgPluX2vdtnKc/11+3aA4Bun39C3Tf
         PfB/tirJZaLHJmdt8pgt7uOOW4fAo1Mv6IQfCLhCCcLVZSc549n3Utzo44viE33vxPuy
         PDCPTSdxuPJGCzSrKrLNgVSTpxdexc342a/5OF07vId0OKsGHdnFEKgpBM82dmoaBTnC
         vP/vlEz98YHmv5Nulln3l3LewnEqqLB67z8SQMggME+mSTRafySCo7S8gxL/+6iqknGc
         jFL/eRVHNLDqmcF1f34+WNxzrW8vkxzYlCn793QOASaqzrSk/udFFuLzB51armGHIqov
         MzPg==
X-Gm-Message-State: ACrzQf3Gx9uW/TNkXQDm+y3vOIbTh9JYyijMlPV4I0oMARi8gwk5rdWf
        GUytcWSZu4Ld/maMRbvoUtAADg==
X-Google-Smtp-Source: AMsMyM7iRCfgwHnj4h/qw1Yb45TDQhUYhGG/iT/OtytoacNNDFFRxQ8wUpFxhvqSHgxpX4K25dcMfg==
X-Received: by 2002:a2e:86cf:0:b0:26b:fe50:8c4c with SMTP id n15-20020a2e86cf000000b0026bfe508c4cmr2557212ljj.17.1664534972789;
        Fri, 30 Sep 2022 03:49:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b004945c1c5cccsm253083lfo.268.2022.09.30.03.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:49:32 -0700 (PDT)
Message-ID: <efa2f644-0a1d-00f7-970c-f17ceb0cc550@linaro.org>
Date:   Fri, 30 Sep 2022 12:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/4] dt-bindings: display: Add bindings for JDI
 LPM102A188A
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/09/2022 19:04, Diogo Ivo wrote:
> The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
> the Google Pixel C.
> 


Thank you for your patch. There is something to discuss/improve.

> +  Each of the DSI channels controls a separate DSI peripheral. The peripheral
> +  driven by the first link (DSI-LINK1) is considered the primary peripheral
> +  and controls the device. The 'link2' property contains a phandle to the
> +  peripheral driven by the second link (DSI-LINK2).
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: jdi,lpm102a188a
> +
> +  reg: true
> +  enable-gpios: true
> +  reset-gpios: true
> +  power-supply: true
> +  backlight: true
> +
> +  ts-reset-gpios:
> +    maxItems: 1
> +    description: |
> +      Specifier for a GPIO connected to the touchscreen reset control signal.
> +      The reset signal is active low.

Isn't touchscreen a separate (input) device?

> +
> +  ddi-supply:
> +    description: The regulator that provides IOVCC (1.8V).
> +
> +  link2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the DSI peripheral on the secondary link. Note that the
> +      presence of this property marks the containing node as DSI-LINK1.

Best regards,
Krzysztof

