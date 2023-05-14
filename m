Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36170C7EE22
	for <linux-tegra@archiver.kernel.org>; Sun, 14 May 2023 10:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbjENKly (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 May 2023 06:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjENKlw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 May 2023 06:41:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA62B1730
        for <linux-tegra@vger.kernel.org>; Sun, 14 May 2023 03:41:48 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so17795905a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 14 May 2023 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684060907; x=1686652907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwvE8GNOC0Y0ULH3wWZ0RD6YUfvTg/EgGGBaYirIjjU=;
        b=X8vX7sb/2ICyD45fHKhcZEvafp0UJUpUyLdrS4617/T11tJ03hIm25+AmlJV8b4SkX
         0ezvvPbDG/H7FyF8GzXE9VgleFOnawnlxOvMfnYP4H0Hm/4Kmqd9pPdfH1rMas7LAoRb
         zm2us3n5EzsL0P0Jhe+W7FtgMjBIadSNPohNb6RW4NoprSIsGAQxSLAJKLnKstM+bzX/
         XB2lWH3zmviWy+Q4+4LVIuIu5ouJWaKk4O0L8115o3Z2p0Opw/SkRmdEtL9eEnTn/yse
         bzwngs61W3zBYHfrJud9wcXLwM5gTcix/QzmnTo+DG04LxHla+cSljwtBybl0e6jw9D8
         vR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684060907; x=1686652907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwvE8GNOC0Y0ULH3wWZ0RD6YUfvTg/EgGGBaYirIjjU=;
        b=L6aYizdU5w4I/SGSepyiHs+RtN1r59VINMzmV0HqRRiMERYJbFMJNZj5nrt5Uj2veY
         dFzIwg19LBSU3j9XsLqecJlVdhXoqTIkMd7rTxGXzGCS22CfdBOpbPXe+NphycSnq48t
         NwSBMRIRG3yqSOkr+kkRFCc+su6El6905X1vDA0HjBZqDE1MVDh41JTGiEtJ2YiP0FA7
         sgo5NijONXDeVx9QH7ncbP6jvCyk6mBhvOSa9Tzx2yts3UejgHScJVbX/fDJbXc1mux+
         QIv4SVHHJ7uVQPr4N4Z/lS6c7TTbyXbat5SqMjtudBS6TyioM3Ft9udE4PSCNPWhFgy+
         dU7g==
X-Gm-Message-State: AC+VfDxSMurGSGfV3Oz0xk+4seB8ikt9/K0L1E89fDuoa6240JWAXVDZ
        hcX8IrIG23e8iv4wjDmhVLJQoA==
X-Google-Smtp-Source: ACHHUZ71Wpwgtz5ebkZ+S7SwGCJVQIZ49/lwyvoEEIpUuaCZjlowkuyZuXXdaQeWV8w2n4DxmA/8uw==
X-Received: by 2002:aa7:d945:0:b0:50b:e1d1:91cb with SMTP id l5-20020aa7d945000000b0050be1d191cbmr23936014eds.8.1684060907378;
        Sun, 14 May 2023 03:41:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b? ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
        by smtp.gmail.com with ESMTPSA id b13-20020a056402138d00b004af6c5f1805sm5854441edv.52.2023.05.14.03.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 03:41:46 -0700 (PDT)
Message-ID: <a032d9e6-6cb5-1856-9eda-28028bf05633@linaro.org>
Date:   Sun, 14 May 2023 12:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Patch v8 0/8] Tegra234 Memory interconnect support
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        lpieralisi@kernel.org, helgaas@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, mmaddireddy@nvidia.com, kw@linux.com,
        bhelgaas@google.com, vidyas@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com, ishah@nvidia.com, bbasu@nvidia.com
References: <20230511173211.9127-1-sumitg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511173211.9127-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/05/2023 19:32, Sumit Gupta wrote:
> Hi All,
> 
> Have incorporated the suggestions in v7. Only changed 'patch 1' in v7
> to fix possible race when setting 'mc->bpmp' as pointed by Krzysztof.
> Requesting to merge the patch series.
> 

Can I apply it since you request it? I asked you long time ago to
clearly state dependencies or merging limitations. It's v8 and cover
letter still does not state it. Neither the patches do.

Best regards,
Krzysztof

