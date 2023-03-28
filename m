Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9C4C77B60
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Mar 2023 07:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjC1HVM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Mar 2023 03:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjC1HVM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Mar 2023 03:21:12 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8747330DE
        for <linux-tegra@vger.kernel.org>; Tue, 28 Mar 2023 00:21:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id w9so45729121edc.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Mar 2023 00:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679988068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4CYgrnxL/oD4LhNxCijRW1wSvmkQAAax1ssKQ5T4oE=;
        b=TimBilBJ/4qlKuklhMtkkntEIp2MCOBC0BvhGaTAvMCWbYhcry589vp2bRc9T+zNVs
         +LaQ2wTJ2rcFawHBLnEgFzXEtxzCEmuH7WuTlqvGH+GmLBnN1Zt/iGY+PhQvJZWyHX0/
         pGyYghOr/wjgN7Qh9K9+QT6o92dNzoYVO+srLA8rufopIH2d9hmWgsbsMOYHKanCqxkN
         Uv6qEQIvclCC6dRgY2wg/oT6O6ijp4mTnvPNqLJI6YClpV21jpJfeOxdpQ5yp/1LQkud
         W9HkZwD0J2eWRv0gKn4oRf7hDjLz1iEyjBon/CWNvoyKYFmY3QVVaPuoj9d7oGEi9IyJ
         E/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679988068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4CYgrnxL/oD4LhNxCijRW1wSvmkQAAax1ssKQ5T4oE=;
        b=BEXqa0MI7GTibb7QO492LlXVOQadFVZiua/zX7mJBzVWbJFrsB/iwO5cbRajkmRH4c
         VUp9qDZZVTvz7sezb92DzylBAPDlVs3gqxqEm5/I9YXJi/Ziqva9z5UvoRq0k15dvL1b
         KV9V3UJQtNoby5OhGs26+SdY2dyMtbDIwnISoKS1vr8A7dD3T+oOf86/s+kQYBTazGp4
         SOwH8dZGRlvGst/yuF9iFMuEshUy9CZUXUDbWWUbiRRWf0XexQwnGSbKSuQI53nMXWJp
         RGXQ7hx4PdpWUc8M9qirPa1NrID12EQVYDvLXtPE2La3imdQcXe6jxp2umbJL6Vt06Z5
         +bbQ==
X-Gm-Message-State: AAQBX9fB4DTUr03Ni6O9CErI4ZuWsRa6g8XmnZMa7ofTMdqp3HHJfyv2
        OSJ4/9IXBPZgWbelCXpjv5Yf0Q==
X-Google-Smtp-Source: AKy350boEBP6L5wV56dT/8UCE41l1icRJq861X7V/ttRVdVf35fbUR36SPMnrgi+Gjem8bJPYlbXCw==
X-Received: by 2002:a17:906:641:b0:8b1:77bf:3bdd with SMTP id t1-20020a170906064100b008b177bf3bddmr15668254ejb.36.1679988067996;
        Tue, 28 Mar 2023 00:21:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id g17-20020a170906c19100b00921c608b737sm14912135ejz.126.2023.03.28.00.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:21:07 -0700 (PDT)
Message-ID: <af455119-7178-bed8-4099-ee50c7b6134b@linaro.org>
Date:   Tue, 28 Mar 2023 09:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v4 02/10] arm64: tegra: add bpmp ref in tegra234-mc node
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        lpieralisi@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, mmaddireddy@nvidia.com, kw@linux.com,
        bhelgaas@google.com, vidyas@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com, ishah@nvidia.com, bbasu@nvidia.com
References: <20230327161426.32639-1-sumitg@nvidia.com>
 <20230327161426.32639-3-sumitg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327161426.32639-3-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27/03/2023 18:14, Sumit Gupta wrote:
> Add the "nvidia,bpmp" property within the "memory-controller" node
> to reference BPMP node. This is needed by the MC driver to pass
> the client info to the BPMP-FW when memory interconnect support is
> available.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>

DTS goes to the end of patchset. If you put it here to fix
bisectability, then your patchset is already broken.

Best regards,
Krzysztof

