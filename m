Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4E7C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Sep 2022 21:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiI3VO3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiI3VO2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Sep 2022 17:14:28 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95A92E3;
        Fri, 30 Sep 2022 14:14:27 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id m81so5994308oia.1;
        Fri, 30 Sep 2022 14:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zyrqo3fe6r2fKBJRFJO+f+v384tFeIOi5zkuHJHZH38=;
        b=mI2icKadEHO1QkoXQczuMeB69gg+8LTULshG8v7W/mW5Yt9yOwa5IwAfzUskG0ZSuB
         cziD189aMKM6g8A8ygeBAOR6oklQzaO8OQo/YK6Ha8MGxtpMWJwE8U/+kQy/FkP5Eycl
         Rw1j7PsXEkyQvPPBA/YMbmSoX/DjdImCKR4ICwLgfXdZoZL0Rn3YSmb8YDOAtzQ+6FWK
         LKtzyfKs8Lu6J977rbIdKZXrECtBU5bd9YudqFq70IlGhqbgqRIW5M8jmXanfHEtTGJc
         dc8GiBwU/aBZ5AGY3rmIsjJTAbyR98cFkIpKHEkPfUoq5L+2CYENZfakl1CVU69Jlzp3
         YGiw==
X-Gm-Message-State: ACrzQf2FT7/wl8tnLAG2fPA+uIbpKUXKj8dtmPnF84LduMs8RnOyGJ9h
        TsT+buv2v82NnQiudqQF6w==
X-Google-Smtp-Source: AMsMyM4f1vIjP1erIeRPHEWE3V3RmdJbC6D7s/Oj6KnSreksnh+8a9HVNRQqiWBkLXhD3T8021Abng==
X-Received: by 2002:a05:6808:181e:b0:350:772c:ed7 with SMTP id bh30-20020a056808181e00b00350772c0ed7mr71560oib.126.1664572466828;
        Fri, 30 Sep 2022 14:14:26 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x16-20020a9d4590000000b00655ca9a109bsm801385ote.36.2022.09.30.14.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 14:14:25 -0700 (PDT)
Received: (nullmailer pid 1061289 invoked by uid 1000);
        Fri, 30 Sep 2022 21:14:24 -0000
Date:   Fri, 30 Sep 2022 16:14:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, sam@ravnborg.org,
        airlied@linux.ie, daniel@ffwll.ch,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Message-ID: <20220930211424.GA913368-robh@kernel.org>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
 <YzbPz8mL0Yo+vgSS@orome>
 <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0254559-a76d-de87-3458-e7dc148a8daf@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 30, 2022 at 01:20:50PM +0200, Krzysztof Kozlowski wrote:
> On 30/09/2022 13:15, Thierry Reding wrote:
> > On Fri, Sep 30, 2022 at 12:51:07PM +0200, Krzysztof Kozlowski wrote:
> >> On 29/09/2022 19:05, Diogo Ivo wrote:
> >>> The Google Pixel C has a JDI LPM102A188A display panel. Add a
> >>> DT node for it. Tested on Pixel C.
> >>>
> >>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
> >>>  1 file changed, 72 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> index 20d092812984..271ef70747f1 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> >>> @@ -31,6 +31,39 @@ memory {
> >>>  	};
> >>>  
> >>>  	host1x@50000000 {
> >>> +		dc@54200000 {
> >>> +			status = "okay";
> >>
> >> You should override by labels, not by full path.
> > 
> > Why exactly is that? I've always stayed away from that (and asked others
> > not to do so, at least on Tegra) because I find it impossible to parse
> > for my human brain. Replicating the original full hierarchy makes it
> > much more obvious to me where the changes are happening than the
> > spaghetti-like mess that you get from overriding by label reference.
> 
> Sure, it's entirely up to you. I forgot your preference.
> 
> But it is a really nice way to have duplicated nodes and mistakes (which
> happen from time to time).

We could have a schema or dtc check for that. We already warn for 
duplicate unit-addresses which would catch some typos. Checking for a 
node with only 'status' would probably work when that's the only 
addition. Maybe status without a compatible would be better? We also 
check for nodes without a specific schema, but child nodes in schemas 
aren't handled.

Rob
