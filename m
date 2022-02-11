Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3A6C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Feb 2022 07:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347831AbiBKHz2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Feb 2022 02:55:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiBKHz0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Feb 2022 02:55:26 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE4EBC4
        for <linux-tegra@vger.kernel.org>; Thu, 10 Feb 2022 23:55:25 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 62CB63F1C1
        for <linux-tegra@vger.kernel.org>; Fri, 11 Feb 2022 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644566123;
        bh=MQDLOkOWyhrokLh/q2SGFaaeI8uLaofwFWx6RTobIHo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HrXeIwAY6eAuWPnCHU6Bvme4zi3lq4IpQgUbbTCLol7Uq6drq0CtJ51s10bCuHDOJ
         uBYVed7mYFc9bv5sv/WnUZ/U8H7Lyz4MiIDymgAKPa6yvW3Edz59dftpIh4Y3TmxIa
         45KYgpqPImxD++RxaIQOrP1o+tTzudyL2hsBw9V4BWXFg/T4Lu/JYKhbLs3IvpGqI+
         rLTlcWam80xiaJuGDKfkN2pFuybuJ3VzJYBgXvuMgtot+9bd1xUmi9V2ZxNwyU864g
         GSZvwUL5whQaTz8yG4pyJkLDDdFVuVBArghLhfYKTEp6HMWTDopH5NJUo66MWWmnjH
         Wndd6a1MCdrog==
Received: by mail-ed1-f70.google.com with SMTP id dn20-20020a05640222f400b0040f8cdfb542so4849187edb.3
        for <linux-tegra@vger.kernel.org>; Thu, 10 Feb 2022 23:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MQDLOkOWyhrokLh/q2SGFaaeI8uLaofwFWx6RTobIHo=;
        b=in4X3RQj6unwX1uft3QRx/WgBkxN1SHZi2cGfYYMHb5zxlY78mpO+WSA0TECca/YUG
         hmgz8LENNVuj+zHsZAwcU8k1Qihq3R60WQHYFPbSSUtstyWUe2lLp7NMu91lJ6G2XYhe
         P+68y7uab9YjtQjIed5ewe/dpa2HIe1BSuB+Ge4XMgL3MNk3Pwl8e0YDcNCF0XwGfw90
         6sWGslCnYP1yREm4qA6q3I1erq3CIczs9p5ybnluxx1CsET1L04nqbpJt/aGF29sQl6v
         G/3q4Nn6AsTPh+1+v6BNh2u8NXqxrzYL5ACM5jN37t9vgLIqSFkqOgD6vqM7l+BfIuQv
         zypQ==
X-Gm-Message-State: AOAM530WGfdu7P1p0WA674EcfVjvuTlZbyGZVGdz+47pfpJqKQCAavPz
        M7odcWlcRMgZFcOtnb8iNuvVaiMR4BuggObV3SSsRZImRu7mPTYfoYYBm7HzI214pixkF1hO+OX
        j0WsqSTStEGb9oExMU/s++l32s5LRR0gcOoIkWdgo
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr564743edt.115.1644566122416;
        Thu, 10 Feb 2022 23:55:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS2mWZknsLENYbOC1IbYB+o7Y3nGS6XqPGFBYc0O9YHzbfrvYAJgRo8QBScWMffqbdP1Uo2A==
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr564724edt.115.1644566122272;
        Thu, 10 Feb 2022 23:55:22 -0800 (PST)
Received: from [192.168.0.99] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 27sm157401eji.66.2022.02.10.23.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 23:55:21 -0800 (PST)
Message-ID: <416c07c1-c563-c72c-edfd-ae14ecf0cf13@canonical.com>
Date:   Fri, 11 Feb 2022 08:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id
 properties
Content-Language: en-US
To:     Dmitry Osipenko <digetx@gmail.com>,
        Julius Werner <jwerner@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-4-digetx@gmail.com>
 <YWimShkkxkR+bQLK@robh.at.kernel.org>
 <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
 <d69f99ed-75a4-9b8c-addb-3eaa2b2be6a6@canonical.com>
 <CAODwPW-AMqQ+ZbnvUTuxP5Bbxdcy08GSXnhcLC+V6BW=OPYaqg@mail.gmail.com>
 <6568fd31-113f-1581-4eff-45a4a1eb4e5d@canonical.com>
 <c33c9de2-ff0f-0ba7-b424-728d316dcca2@gmail.com>
 <CAODwPW-VfbvWs3OVON1m=WWFXN2V86o9jqurVDShpfTrSn=Mkw@mail.gmail.com>
 <20220211021739.14f3614c@dimatab>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220211021739.14f3614c@dimatab>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/02/2022 00:17, Dmitry Osipenko wrote:
> В Wed, 9 Feb 2022 16:32:25 -0800
> Julius Werner <jwerner@chromium.org> пишет:
> > 
>>> I made each LPDDR2 revision-id property to correspond to a
>>> dedicated MR of LPDDR, which feels okay to me to since it matches
>>> h/w.  
>>
>> I'm not super married to my solution, so if that makes things easier
>> we can standardize on the two-property version as well. I mostly
>> designed it my way because I thought we may one day also want to do
>> something like this for the 8-byte LPDDR5 serial-id, and then it would
>> get kinda cumbersome to have serial-id1 through serial-id8 all as
>> separate properties. But that's also a bridge we can cross when we get
>> there.
>>
>> My use case is in a position where we could still change this now
>> without requiring backwards-compatibility. Krzysztof, would you be
>> okay if I instead changed the "jedec,lpddr3" to the same thing
>> "jedec,lpddr2" does -- seeing as the original patch was from me, my
>> use case could handle the switch, there has never been any actual
>> kernel code using the property, and it seems very unlikely that anyone
>> else has silently started using the same thing in the time it's been
>> in the tree? Or do we also need to go the official deprecation route
>> for that?
> 
> If you're going to use multiple cells for other properties, then indeed
> will be better to keep it consistent.

Yeah, LPDDR5 is a nice argument. Let's go with the array approach (so
LPDDR3).

Julius,
Official deprecation is needed, because the property might be used also
in other projects or customers. But this is not a big deal - we will
just keep old property for some time.

Will you send a patch for it?

Best regards,
Krzysztof
