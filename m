Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A2C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 04:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238969AbhKYEZO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 23:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhKYEXM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 23:23:12 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C70C061574;
        Wed, 24 Nov 2021 20:20:02 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b40so12866429lfv.10;
        Wed, 24 Nov 2021 20:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BE19aF5UvkexXFXpNDupHLeqTikRuVPoKcnXFT9OpTc=;
        b=o++SMOtWY5OxrJrk2defJIuKEwAPjWW5ACHeX6LzrD2Vy8igEeRLV3ODdIBe353VBs
         eYRFggmy1FJXJ+UwqTJ6vgdxWbPxHLFbr77UhZe/e+tQL31kSq9e7aEZ/e+I3gv6lJOc
         XTMp942TXxjbhSwZ7UXMYo2Kh0q5Da2dM08gnGRI4uMtZDYtBA7FE/ve7LhkGHAy5+oM
         1AjrnYHoxM8IVeiTSqTxZhQ97foDo2nkJ51JmTP1hkPSvJ0BrH4gYwlJXT6FXFahtBOc
         Fp/3IndpEa1t5iEpKBuxrhFnPPzNUAsyyPinxnutr5dlh9apIz9n+Dp4FDYNvyTZ0GFP
         8HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BE19aF5UvkexXFXpNDupHLeqTikRuVPoKcnXFT9OpTc=;
        b=gCI5EkfSeldHz4LFlWzUmVx6L+3wU5y17dgzO9hghhk2BpktrpyMkS/w22UqJAhiyF
         80TJz8evz/5gXAR6e8Q4Wif6ou43otEnJ08EFlZdB5MIw3Q7HjEaJYT/me7+1H/enLpP
         NhIO3IH3yFlxsNHJvFoCw4ivJzV+82U1CM3LHkVaQGPIBTkMsNWrEpBqR2l6vNFxDjII
         MtFoWHG2+M2WD2eUDRu3jLQCxSciLZXxdmVK/W75yR/6PjqmQKbPvZ+BXB3kiyC1Sgk2
         4MDWRFj+WICJeuRYgNLEwVafAuozzObjmIwF7iWpKmzRmqazcNJiLByvkyEpm7+4HVdQ
         h0Ww==
X-Gm-Message-State: AOAM530L0mwPutjxcHTEGruXKrXdvT1cU7rUP2xMlDPmsROhSwpY34hJ
        l+O1QXRm9j7bHC3OnTzJCqbfPtp5/N0=
X-Google-Smtp-Source: ABdhPJy0VrtiWGY5aK9Ntm6ZqTo5OoljLalg9RN9ABto5r2FcHYdh5wqlaU+y5c/FmJvhFIMbcdVdg==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id k12mr21946258lfv.365.1637813999593;
        Wed, 24 Nov 2021 20:19:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id m8sm160775lfq.27.2021.11.24.20.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 20:19:59 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra-audio: Convert multiple
 txt bindings to yaml
To:     Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        ~okias/devicetree@lists.sr.ht, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ed2725b-3a78-d0fc-b09d-5725ca573215@gmail.com>
Date:   Thu, 25 Nov 2021 07:19:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.11.2021 23:42, Rob Herring пишет:
>> +  nvidia,audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |
>> +      A list of the connections between audio components.
>> +      Each entry is a pair of strings, the first being the connection's sink,
>> +      the second being the connection's source. Valid names for sources and
>> +      sinks are the pins (documented in the binding document),
>> +      and the jacks on the board:
>> +        ALC5632:
>> +          * Headset Stereophone
>> +          * Int Spk
>> +          * Headset Mic
>> +          * Digital Mic
>> +        MAXX98090:
>> +          * Headphones
>> +          * SPeakers

Speakers
 -

>> +          * Mic Jack
>> +          * Int Mic
>> +        RT5640:
>> +          * Headphones
>> +          * Speakers
>> +          * Mic Jack
>> +        RT5677:
>> +          * Headphone
>> +          * Speaker
>> +          * Headset Mic
>> +          * Internal Mic 1
>> +          * Internal Mic 2
>> +        SGTL5000:
>> +          * Headphone Jack
>> +          * Line In Jack
>> +          * Mic Jack
>> +        WM8753:
>> +          * Headphone Jack
>> +          * Mic Jack
>> +        WM8903:
>> +          * Headphone Jack
>> +          * Int Spk
>> +          * Mic Jack
>> +          * Int Mic
>> +        WM9712:
>> +          * Headphone
>> +          * LineIn
>> +          * Mic
> All these strings should be part of the schema.

Well, seems this can be done only using a separated bindings.
