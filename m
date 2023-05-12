Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F57C77B7C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 May 2023 06:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240151AbjELGjj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 May 2023 02:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240145AbjELGji (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 May 2023 02:39:38 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE639D2DB
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 23:39:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-966400ee79aso1282633266b.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873574; x=1686465574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaA+lFdcBUfzX4Iu5oO6523eo15jJCY8SlknFrAoit8=;
        b=nwI6xlNdHi6QZNe2OWf7VeYw+UcDE7i1k319EYEZrKckv2nvXcjDlk+HGqu0iGzoYT
         ZvGBbXkEUpjs0nEG+YxPm5T2vgiaFUEO9WtdYE1OELKul2j71V5Xf6krpveoixC4F1fw
         klkSSldIiiR2z2rZRtsugYdgYrCibL7Ikhbr7SOYHfLDNM7PQfCm+8f/9pZ/CpSClWbP
         608J7BGSdbJ+xDtISzn+Bw+LMD29iZpPBwPiZWCgz96p6f98u4fa4UtnSff+1JrKQLRd
         pkAdWhcI4cI64N7M9MDsLfZMa9GmaVWq+6h7OnBxoPvPY3akSdMAjM/6+1FQo8AxL/a1
         ocYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873574; x=1686465574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaA+lFdcBUfzX4Iu5oO6523eo15jJCY8SlknFrAoit8=;
        b=Gcu0WpaD4PoP4KfEx+SRzB8YiA3NZqLFq2sa1smbP/tVlHCVdZqRU02c8weL/562Sp
         ma36S6GxdUUGMGOjurua4HYsKEEuz3SniBsK+NhT+VPGX1ADxocAv9aa1YX1OSUgtmsF
         IkejFH8G6jzfXYJzPK6QIGRaw3C4LGPoCcy0W0crHYxlMxbINB+cm5qGdzA3gOfImuBJ
         A/5QA3XObQwNWGlfgaFEXNcpsrWJBh7EQAObWHDqWal8uBos3dah3GNU7ZPdGPA4n2jN
         aLLxMdJuMjnJJY7znoi0/u0qii8vWgD56g4A+KkfqNi6Dr4C4TnpwU6AvWPa7IxD38D+
         Oqlw==
X-Gm-Message-State: AC+VfDzkex9PUwApzm6BaBC8C50Kk2hY7vtJl89m0Vh8rDD6P20XyfxU
        zzA9J+98EYZHzI1gyEqOZr0OoA==
X-Google-Smtp-Source: ACHHUZ67YDCteysRcDpfI04uBiqSBGsNU6w6U0CF+UvvKrDHNRgfXF9ABnk1kdQiSZHpMYAXqQ4w/w==
X-Received: by 2002:a17:907:d16:b0:966:391b:5b3e with SMTP id gn22-20020a1709070d1600b00966391b5b3emr19227693ejc.55.1683873574137;
        Thu, 11 May 2023 23:39:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id eq19-20020a170907291300b0096739e10659sm4967204ejc.163.2023.05.11.23.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:39:33 -0700 (PDT)
Message-ID: <05eba15d-21d5-84af-5ec9-783a3e4afe6c@linaro.org>
Date:   Fri, 12 May 2023 08:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/6] dt-bindings: Add support for DRAM MRQ GSCs
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, stefank@nvidia.com
References: <20230511132048.1122075-1-pdeschrijver@nvidia.com>
 <20230511132048.1122075-5-pdeschrijver@nvidia.com>
 <20230511-carnivore-legend-17206803d713@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511-carnivore-legend-17206803d713@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/05/2023 21:21, Conor Dooley wrote:
> On Thu, May 11, 2023 at 04:20:49PM +0300, Peter De Schrijver wrote:
>> Add bindings for DRAM MRQ GSC support.
>>
>> Co-developed-by: Stefan Kristiansson <stefank@nvidia.com>
>> Signed-off-by: Stefan Kristiansson <stefank@nvidia.com>
>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Perhaps Krzysztof will disagree, but looks fine to me, with some minor
> remarks below.
> Just to note, I didn't get the cover letter & therefore didn't get the
> changelog :/

Me neither... and in v3 I asked for it or for proper changelog in the patch

> I know you had a back and forth with him about that, *my* €0.02 is that
> either you put the changelog in the cover & send it to everyone, or you
> put it in each patch.



Best regards,
Krzysztof

