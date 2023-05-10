Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DBCC77B7D
	for <linux-tegra@archiver.kernel.org>; Wed, 10 May 2023 15:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237350AbjEJPCk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 May 2023 11:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237396AbjEJPCg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 May 2023 11:02:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A9672A6
        for <linux-tegra@vger.kernel.org>; Wed, 10 May 2023 08:02:10 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965c3f9af2aso1094339066b.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 May 2023 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683730917; x=1686322917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vg3p9+EGRJAEXW+lb2pr2TiEbOxlAU1YA74V7zh4bos=;
        b=M88SB/KzbgIQhpqC/kyXt+1PNRgS8AUYhQQORByMu55FQfmiqHybS8gw2fgRLkgzl3
         /dekZUt7LKyStICSndGc3q7rqegp4v1PSlkiHpRJggD9lv7iVCFLMc/wsrK3/Yqx9KfU
         ONvU5qx4/TIYG9t8aanwkVrtwvEN6s8m7Mdry9LvDkuuvJydX+DGkyHfCy5PO9WytOGm
         g3LKaeqjP+fHP++h5SCSTpaEf6pk83rX1Z3DTvtjSLYg4NogI2NPBFFcF0CZmx7PwaDm
         4ZKIObNqxvzzS+wNE4d1Gu3SZe/4t2aorJFXJdUfMiXHuwNMh5ShMOUy01O29wfj2bzC
         IPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730917; x=1686322917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vg3p9+EGRJAEXW+lb2pr2TiEbOxlAU1YA74V7zh4bos=;
        b=aX7TkwnrLkMrv8cKqPRG5paZ4hGlki28JOBmBxR23Ov9YnTc+5FrSqyodOwGbmw/UE
         fwnz+ZnbULSyDzYO41GCwEGip4cqpnn+cRN28OLmqbbAHN74ktGGDPd1r9onOtoUltVq
         sJmAxVB+panVywwJQ5fmCBypcL5JtPrAHEMtum4uAuxjZsF0ITggKFUZxkvsBMnSTVMN
         vjWuEOE5cUIIXigCXN77l6m9DoX22SMdJ3a9vkes0TGjD9WBhrM1VwOWVPeDjCTHTaU4
         tZF4vCBZ7aYSH24yuD/oV7TXaileq/l/CBeD4WapTRseBDcEnCQz/iTBemRbEE2da4ma
         kU9Q==
X-Gm-Message-State: AC+VfDxloEow/y/cSYJpSOC2zehwD+hJMji9oluYY63WTYr2LSxHwG4f
        vtWNtV0ELCot7K6DQS01P2QDgA==
X-Google-Smtp-Source: ACHHUZ56LCSGTK3jYzCYiYZma4f2a5iPszWF0J9GennTs19UbKmx2TeMOJsOXVLPpUrVKmCIfOex/A==
X-Received: by 2002:a17:907:6e9e:b0:931:ad32:79ed with SMTP id sh30-20020a1709076e9e00b00931ad3279edmr19467320ejc.12.1683730917178;
        Wed, 10 May 2023 08:01:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id w4-20020a170906b18400b00965fdb9b051sm2789861ejy.115.2023.05.10.08.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:01:56 -0700 (PDT)
Message-ID: <cdba4bb0-551b-a3b2-9329-139d6cda71be@linaro.org>
Date:   Wed, 10 May 2023 17:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/6] dt-bindings: memory-region property for
 tegra186-bpmp
Content-Language: en-US
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stefank@nvidia.com
References: <20230510142248.183629-1-pdeschrijver@nvidia.com>
 <20230510142248.183629-6-pdeschrijver@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510142248.183629-6-pdeschrijver@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/05/2023 16:22, Peter De Schrijver wrote:
> Add memory-region property to the tegra186-bpmp binding to support
> DRAM MRQ GSCs.
> 
> Co-developed-by: Stefan Kristiansson <stefank@nvidia.com>
> Signed-off-by: Stefan Kristiansson <stefank@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Also no changelog. Since I do not see improvements after Thierry
comments I assume you send the same.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

