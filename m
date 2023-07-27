Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097F5C001E0
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 07:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbjG0HUa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 03:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjG0HUJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:20:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AD95FC7
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:13:22 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso763609a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jul 2023 00:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441949; x=1691046749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFqE8r5CtlgU1LoE0+yybns5D17+UGGGRnbdRjn75UQ=;
        b=yW9GI/Jeu8KatNBEkbADekfBexGaJp8iJqjHgAcCMGgHuhLPAN6zRT9cFXkSXDFjJI
         SSOw/3CiXedms5XnVwL1ON/Zj5MZHkEm0Prq2AO2oYqzMNaZmp3zTGpXE2tnYQKtuVXa
         alDMwA6SMkod0Jdxn8kGdGxqnSaNp77uLOawOVifFFgwCItnxrrzR3ascsok2DEZ9MG8
         E7pFOEt+cyi+YHOsXoIMycG8OjdVMSIQ4u66J59Ft0KKC5ik0BxWY9NFqZDZqVVhBig7
         s5ptocsgpkmIGx/W+BqIXwrvqJ+NLSa1z+XoiR1NKmJ+j+nwK+TAvvk0MNA/tVUTws9e
         Z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441949; x=1691046749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFqE8r5CtlgU1LoE0+yybns5D17+UGGGRnbdRjn75UQ=;
        b=MUONPqSTVo7HxuVfUpICcEykAhbE2KNGYVeR+NbsujrduTixQLYdWla0kiD1Rcdf60
         ffLe8Cnd8ereMALl7utseTW+DwTXAtP6RIbKTD3ACS415cFoFaLGXnBB0SRADC0Mss+X
         hh/iSiPQCnT+NhK5QYN9ZyXYg9bbPixMINNPuTh8RENKCAvt0YlWsxr4aepIuAeB77x9
         4CqR7rXF0Ji5ujoPjvGmsOkymrNNzr3WFlHI6lWKffgsAPIejrq3jNEgYMMW4tf0AbBf
         MIg4/YtOhxLsvT6bauRbTtUOvID5JLrwWFk2V5bNRWo8EGjQQD7p7+Ro5Q6sZKjQRiHU
         ufww==
X-Gm-Message-State: ABy/qLbjhSDivkp5v+JR+kb58yyCohgFAsiQOpop+ebgwgjvxYh/3tgE
        3qiLQxb/7j5kFpO8J75ozMWAbw==
X-Google-Smtp-Source: APBJJlGpg+0/nLk4w83EaG6UQXNsZiCVcmuVU3faIKI5eOKHpMH/thLDsVyAPxgz0THKl8q21kARPQ==
X-Received: by 2002:aa7:d443:0:b0:522:6e6c:68a2 with SMTP id q3-20020aa7d443000000b005226e6c68a2mr1046551edr.18.1690441949300;
        Thu, 27 Jul 2023 00:12:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n10-20020aa7c44a000000b0052238bc70ccsm307703edr.89.2023.07.27.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:12:28 -0700 (PDT)
Message-ID: <33ae66df-a01b-1f4a-b55e-1a6f70567243@linaro.org>
Date:   Thu, 27 Jul 2023 09:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move HannStar HSD101PWW2
 to LVDS
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/07/2023 20:48, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

