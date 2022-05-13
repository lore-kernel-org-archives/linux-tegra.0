Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E869C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 13 May 2022 08:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378306AbiEMIcg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 May 2022 04:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378298AbiEMIcd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 May 2022 04:32:33 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D9C6352A
        for <linux-tegra@vger.kernel.org>; Fri, 13 May 2022 01:32:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dk23so14786703ejb.8
        for <linux-tegra@vger.kernel.org>; Fri, 13 May 2022 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=vFW7c8oYKguehFMQb8jYFUEM93d/T6iAFsYnDrwQpGQ=;
        b=MZXTiXjjOeUYFZgp12vGO1wwFcBLxT3m9XELyPJ3MlS+0y5TcXbfWBAjM7IkQV9Pjd
         MujmPbzsY0PXgobKZN1WaopA5AOXoNyKVUd70hUAd+XOT+aj/mAGnvt4DD1Y5QW8j6eE
         7htL9FPCjgRBoykbfiRQA6Jxp2MtRqIcFd0QsBYMLHNjUJTcxlj0GONe8oGiBLusv3Od
         B2Cx4xGrmGMxGv0RXsnmTU0ssqTTvhDCH21f2LPGQTRLK8Vg0lNl2cmZTp+OwZhZQlXt
         kaZDnA+z1RTc6e1Qt1m4Th/LKl6p4/LC6zUvUvdvNUQAiH5+yKRlholNX0mPPpqfxnHh
         JCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vFW7c8oYKguehFMQb8jYFUEM93d/T6iAFsYnDrwQpGQ=;
        b=HJO2j/YnqGUTTS+BA7N7wAb0jJ4/fywQc+eov3AtZe+EIPIC0pn9qYTIzqCtxuJubu
         znAbyT1YwD8zOSPLSmB3QE997Vr9iErBVoZOVLFSJ5FEwR7uHihCsXllpcx3HvZyc/OD
         17onKBdaz9qPZdg34DLDvupPwGNE1Vp68n8DJc9r0K0kWYF7OWTs9lfU9pQU9ynIbeK+
         rtN+5Dge5r/K+JWOBkuG9qSikSS357Sx4wVS8AByTrC3/7/2N1IR3zy6PmLvzXyQyOsn
         m7/7HOGyrmyyE/XbrbR3rfRUmo4gDKEuGqBquy4L6RfHtsZ33w4Y4BjF9XSYpmpZ8Azr
         QLKA==
X-Gm-Message-State: AOAM532SsVbWiXqKbyjqP4nOw3cF8NV/Rn1OWu3VurbjUX/QHDGLs4nu
        Z5B9jFlH5haPcbKJjDHGQgws6g==
X-Google-Smtp-Source: ABdhPJxGvgzNmK3qdv64gFjNuTj3KarkSYk6qgd+Z76CVPxOMmJ9ydSWZ7NZmT4bAVz9T7FTfINA4g==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id nb13-20020a1709071c8d00b006f20eb21cd6mr3159377ejc.568.1652430750358;
        Fri, 13 May 2022 01:32:30 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b1-20020a05640202c100b00427ae00972dsm687144edx.12.2022.05.13.01.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:32:29 -0700 (PDT)
Message-ID: <b8029466-2f6f-4bc9-b910-61577363da73@linaro.org>
Date:   Fri, 13 May 2022 10:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] dt-bindings: Add headers for Tegra234 GPCDMA
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220512090052.47840-1-akhilrajeev@nvidia.com>
 <20220512090052.47840-2-akhilrajeev@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512090052.47840-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/05/2022 11:00, Akhil R wrote:
> Add reset and IOMMU header for Tegra234 GPCDMA
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
