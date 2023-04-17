Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A323DC77B72
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Apr 2023 09:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDQJPK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Apr 2023 05:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjDQJPI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Apr 2023 05:15:08 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151892D62
        for <linux-tegra@vger.kernel.org>; Mon, 17 Apr 2023 02:15:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id sz19so5205917ejc.2
        for <linux-tegra@vger.kernel.org>; Mon, 17 Apr 2023 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681722903; x=1684314903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMv8PZ53O5KYo73k6iASy7jKT1DCbFAwjh9Wp7pGud0=;
        b=qCghISR1WsxRWdzM4V7UFdyw05zhrCZCu/TOLETzb7KU+h0S/7Rithm7b6X502e50K
         AWfZbhA5OAcuTSqLqUnu1DUDPpsD7TpG5YOJ+b0UCcjoqGgvgXY5hZxqXIya5xSkxyZt
         d27Ln8HduB+/5Ir7kKWrmLzTmt74HoVGb9F7lbWs82I8FFUJ/RhXMP/Z/+r0k2ZNiCSB
         q9nz6/p7ze23Ig9lSjXC4sZJMDhaXSzKwFpAVtHVOPXbyk+12NNTQni/aAL6C/WpL9lR
         TJv9jcwxOVzWwHPeM+o/7W+I616JCv14F+fTk177aBzI7c1VPOHh9jlfdvDYKq0irTQg
         mq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681722903; x=1684314903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMv8PZ53O5KYo73k6iASy7jKT1DCbFAwjh9Wp7pGud0=;
        b=OfRQlUJRvyT4Daqi8Ajr9Z8ZzHDC8W9WeN13dbmII2r5UVBmNv1rJl6iKLRLXb3z3n
         WcUSq0e72OeXhZztc1hPXPLW1/CyaGmWYM/mx7qwVKtpduKciLfFTgWUrjgLHf3L7OxT
         8O9QvR3reYFDCsp0qVGfb691uoCRLm2ncVepba+VvDjaLqVAdhC+Jm0c8T/T/2OUUFYD
         gpP4/86Upt+2ybxmkY5rPxbur4rSvnzhnO13m1FkajFUhkXGSbei6K8VR9ip9L97Db41
         2asPI/F6XS8GidJm5vNsahtmHcqEjAduj/Wym33cdbKtlsH3jTWtPsHcIpEhJjVSUmg2
         VXHw==
X-Gm-Message-State: AAQBX9cAgeDdO/1ecKfrzfaHfGi6cG7IRH+drQ+dhFRgFQvQqRaCEHba
        mF6TcYW92hR8lY3Zc6fNQxfxow==
X-Google-Smtp-Source: AKy350ZVql9TKGl1Q96l3jyXZ3oiegO0Q+ngbdENs6m1PoiIW4VZnQ94fowjzCtJ8ymJESG2YPJDjw==
X-Received: by 2002:a17:906:6c9:b0:94a:959f:6d58 with SMTP id v9-20020a17090606c900b0094a959f6d58mr7283041ejb.18.1681722903429;
        Mon, 17 Apr 2023 02:15:03 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id hu20-20020a170907a09400b0094f432f2429sm2336871ejc.109.2023.04.17.02.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:15:02 -0700 (PDT)
Message-ID: <915723aa-14e7-efc7-859b-ceab0eaeadec@linaro.org>
Date:   Mon, 17 Apr 2023 11:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/10] arm64: tegra: Rework SOCTHERM on Tegra132 and
 Tegra210
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230414125721.1043589-1-thierry.reding@gmail.com>
 <20230414125721.1043589-10-thierry.reding@gmail.com>
 <ed5f12fd-f1f8-9823-a32d-5782068dc790@linaro.org> <ZD0MC6AqgNtYUJ4a@orome>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZD0MC6AqgNtYUJ4a@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/04/2023 11:06, Thierry Reding wrote:

[ ... ]

>>
>> If the hardware mitigation is 'heavy', don't you want to have DVFS acting
>> before hardware throttling ?
> 
> The throttling here is in fact some form of DVFS, but yes, generally we
> would likely want to have additional forms of DVFS before we reach this
> state. We could add CPU cooling devices and there's also a mechanism to
> throttle the DRAM frequency on certain boards.
> 
> But those are mostly orthogonal to this series. The goal here is to get
> rid of the throttling mechanism as a cooling device.

Right, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

