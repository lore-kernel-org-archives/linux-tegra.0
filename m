Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721B5C53210
	for <linux-tegra@archiver.kernel.org>; Sun,  8 Jan 2023 15:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbjAHPWA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 8 Jan 2023 10:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbjAHPV7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 8 Jan 2023 10:21:59 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74357DF8E
        for <linux-tegra@vger.kernel.org>; Sun,  8 Jan 2023 07:21:58 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so2363666wma.1
        for <linux-tegra@vger.kernel.org>; Sun, 08 Jan 2023 07:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmqnWhGVnGXf4z5iUyR0gaF/db/IFFmf8a/NQk8Ec0w=;
        b=DRlWD25KJYqLPuqeKNdVsd7XGtJF3VfMjWbYz8tdqLmYHX/0NzlDsTOBwPMKBZd/AH
         V0EHbzIPEYNmc8qPCV/X0DWW3guW3HlZ6IGcqMlTeclifRVYnlkci5HuC1XjwzvCV4Wg
         UjUXduv6FHtchHldTgKUVkLm5P8csXw3kfR58z1cMQ8QBp4DmeTLKQ9y7ZTpyvYn/Yhy
         +i+/fyy6t9JDKn77sRE4uobwXVQvkfwQr0k2lsiar/+Zpw36zJGtOzJgen/I17u+aCTP
         S0ridvr9BmjwM4R8IRM+dnWiOaK8pKpQ1jNyRQCJSidnXh55XNZrlZJf+Ge6UrH0+BeO
         jmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmqnWhGVnGXf4z5iUyR0gaF/db/IFFmf8a/NQk8Ec0w=;
        b=ma9xHcdinoQqbplrwWrVi8Wtjb9qzWU18kj9FOVJIxSxzIYZ1fPIqBqvxCB5V9baJ3
         2II5qLMXh6KTpvg/DzekNqcpP4TPlpZL6Bm7NA84tahG7hNFDg8LndqqdADWYw4APaFr
         oAeTFX1HfEz8DDhX8s4j+HikANzUsU5e/OcFdIeH5vCxvZY6QV41ZzVD0dRYMJE2Nah+
         FnRmnax07y0KXFbf9H10oYdoEoS7zN5Y3Lmb7BWw3ovrZj2ZeD+fIfNvFyCFW03zCa59
         9ChQaxucIxgyEKAfoLz0y1J9XhCIlENlBRm2NCaErcGrkwp6huOsjj4wo1IUtbeP54ck
         AUnw==
X-Gm-Message-State: AFqh2kpfPgmWhRQJaUcm0TeXK6m7S0l5wUm8Qs7OIQ2GesYpd12pOcxh
        89dAS9tFti5gl2qJXX8zdWbQqA==
X-Google-Smtp-Source: AMrXdXtuZRg/gBm0bgy2aUR8V6wgJ5IygC3CHsw7sL4lbwAqP0DPH6RsEVWXcOa19rjzOcEZzMPKkQ==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id iw2-20020a05600c54c200b003d33c74dbd0mr43779703wmb.13.1673191317055;
        Sun, 08 Jan 2023 07:21:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003d9b87296a9sm14129935wmo.25.2023.01.08.07.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:21:56 -0800 (PST)
Message-ID: <d333c404-01df-22f1-8532-6081cb0a6d55@linaro.org>
Date:   Sun, 8 Jan 2023 16:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V5 2/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com
References: <20230106152858.49574-1-jonathanh@nvidia.com>
 <20230106152858.49574-3-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106152858.49574-3-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/01/2023 16:28, Jon Hunter wrote:
> Add the compatible string for the Tegra234 XUSB PHY.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V3 -> V5: Fixed compatible string


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

