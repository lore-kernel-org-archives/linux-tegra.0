Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34048C001DC
	for <linux-tegra@archiver.kernel.org>; Sat, 22 Jul 2023 01:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjGVB0a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 21:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjGVB02 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 21:26:28 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433AE3C11
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jul 2023 18:26:07 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b703caf344so36371691fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jul 2023 18:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689989165; x=1690593965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ku5l1Q2HPneJ+dGgicp//h4thZVkb5U6gm1puza6Dc=;
        b=Wt2MAv2a+xyAMD18akci7l13deDm4qVMKOF4CAFx9BjiJvcluksru/gkyIL13qP4WK
         Wl51buQg8tJ/cvpd5hYMG9Zs/bOM8kPb/ShgFkDLnt2Z+EIKqWfvKb5fQhDcXb/A47Ze
         XdEWF3nphsALspPowkucL1iYq1eCNjtk7ERB+XRQ2vkmPWjkh6JSS/2RpOGAgWahDxvp
         HJQJgkZaCvHaXaS9NC8Qcvo6hTT4z0EEI16jD4lQfm/iT3sgQIoaE9KlS20h7tBpUSSa
         rB4pCr/OoAeypAUqurMKgOsJQoYOl73ENIx3xdsnSkVOZrtXdkTiu50qAZ0CxfFzERZk
         NBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689989165; x=1690593965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ku5l1Q2HPneJ+dGgicp//h4thZVkb5U6gm1puza6Dc=;
        b=HNuDT8OaTTGBmvzfZf+cyrIuePbo0W9hjOxp6e1h/Nv8W5DqBAlL2yWIdtGMJkFo8X
         LjHEimH0fNP0vaoEIyatnOBWzu154065KK01316QoNS4aaCJ5g/gBS6swuR30txm1cQZ
         tcABjuJ+kL0bm2pxu+AUD95UhoCZeo+2U3N+IxB3BltBg3yPuDpyw8KZ5qgdF27dvvmn
         0C80X/oq07AJapr9wJH6awgWwKGLQOEmrZy/cTmS1sCDe4GwYR/bQrc72MyO3Qpg00vs
         A3E9JzrF8K1Gca38WsF92j/wK54f2EOrYB9XIyfiAXbGrGFsjoQQw3XCsufGLBr1FBuT
         FcOA==
X-Gm-Message-State: ABy/qLYuuFy14dJmiiXeY+sXDTrSifxiYTL8wevfbegptgGQbjrhrl+y
        1HqNsN75pLbJps0JIG/JplFcZ7B4R6M=
X-Google-Smtp-Source: APBJJlEKd2PjQybLVzajbEZFF6cyhlHW/gsBvn+G3oIvWB4/bHwYA3TrnsoIlOtcKAXRgZpTYEn0vQ==
X-Received: by 2002:a2e:9193:0:b0:2b6:cb55:72bc with SMTP id f19-20020a2e9193000000b002b6cb5572bcmr3045915ljg.1.1689989165223;
        Fri, 21 Jul 2023 18:26:05 -0700 (PDT)
Received: from [192.168.2.146] (109-252-150-127.dynamic.spd-mgts.ru. [109.252.150.127])
        by smtp.googlemail.com with ESMTPSA id n12-20020a2e878c000000b002b70a64d4desm1248655lji.46.2023.07.21.18.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 18:26:04 -0700 (PDT)
Message-ID: <5a45a344-3809-6674-6694-8eef936bc935@gmail.com>
Date:   Sat, 22 Jul 2023 04:26:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: LVDS panel compatible strings
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome>
 <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
 <ZLTq3KXeV-tT_HFG@orome> <78ba744f-d7f6-2388-0330-1a5105c9dca5@gmail.com>
 <ZLVBM23xjgzN_-ZV@orome>
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ZLVBM23xjgzN_-ZV@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2023 16:25, Thierry Reding пишет:
> On Mon, Jul 17, 2023 at 11:50:03AM +0300, Dmitry Osipenko wrote:
>> 17.07.2023 10:16, Thierry Reding пишет:
>>> For cases where the timings are the only things that differ, the DT
>>> bindings allow overriding the timings specifically. So you might get
>>> away with using one of the existing panels if it is close enough and
>>> patch up the timings in DT.
>>
>> If panel-simple supported timings override from DT, then panel-lvds
>> indeed could be removed. But panel-simple doesn't support it:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a21f18a993c56566db94ba836684bc32c070a82c
> 
> I clearly didn't look at that patch closely enough. panel-simple has
> supported override modes since:
> 
> commit b8a2948fa2b3a5a6da67fd57aa01c7318d795125
> Author: Sean Paul <seanpaul@chromium.org>
> Date:   Thu Jul 11 13:34:53 2019 -0700
> 
>     drm/panel: simple: Add ability to override typical timing
>     
>     This patch adds the ability to override the typical display timing for a
>     given panel. This is useful for devices which have timing constraints
>     that do not apply across the entire display driver (eg: to avoid
>     crosstalk between panel and digitizer on certain laptops). The rules are
>     as follows:
>     
>     - panel must not specify fixed mode (since the override mode will
>       either be the same as the fixed mode, or we'll be unable to
>       check the bounds of the overried)
>     - panel must specify at least one display_timing range which will be
>       used to ensure the override mode fits within its bounds
>     
>     Changes in v2:
>      - Parse the full display-timings node (using the native-mode) (Rob)
>     Changes in v3:
>      - No longer parse display-timings subnode, use panel-timing (Rob)
>     Changes in v4:
>      - Don't add mode from timing if override was specified (Thierry)
>      - Add warning if timing and fixed mode was specified (Thierry)
>      - Don't add fixed mode if timing was specified (Thierry)
>      - Refactor/rename a bit to avoid extra indentation from "if" tests
>      - i should be unsigned (Thierry)
>      - Add annoying WARN_ONs for some cases (Thierry)
>      - Simplify 'No display_timing found' handling (Thierry)
>      - Rename to panel_simple_parse_override_mode() (Thierry)
>     Changes in v5:
>      - Added Heiko's Tested-by
>     Changes in v6:
>      - Rebased to drm-misc next
>      - Added tags
>     
>     Cc: Doug Anderson <dianders@chromium.org>
>     Cc: Eric Anholt <eric@anholt.net>
>     Cc: Heiko Stuebner <heiko@sntech.de>
>     Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
>     Cc: Rob Herring <robh+dt@kernel.org>
>     Cc: Stéphane Marchesin <marcheu@chromium.org>
>     Cc: Thierry Reding <thierry.reding@gmail.com>
>     Cc: devicetree@vger.kernel.org
>     Cc: dri-devel@lists.freedesktop.org
>     Signed-off-by: Sean Paul <seanpaul@chromium.org>
>     Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>     Signed-off-by: Douglas Anderson <dianders@chromium.org>
>     Tested-by: Heiko Stuebner <heiko@sntech.de>
>     Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>     Acked-by: Thierry Reding <thierry.reding@gmail.com>
>     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20190711203455.125667-2-dianders@chromium.org
> 
> Looking at the error message cited in the linked commit, the problem is
> that the Chunghwa panel has a fixed mode listed in the driver. However I
> don't see a reason why we can't get rid of that. The only place where I
> can find the compatible string for that used is for the Nexus 7, so we
> should be able to replace the fixed mode with the timings for that panel
> and remove the fixed mode.
> 
> The initial Chunghwa panel driver support doesn't seem to have been
> based on the Nexus 7, so I suppose if we make the above change we could
> technically be breaking some setup out there, but since we have no way
> of knowing which device this was on, or if anybody still has access, the
> best we can do is hope that nothing breaks and fix things up if somebody
> complains.

Sounds good. For the Chunghwa there is no other user than N7 in upstream
kernel, nothing to worry about. Indeed, it should be timing ranges and
not the fixed mode.

For the Hydis panel there is no definition in panel-simple, it needs to
be added. It also should be in a form of timing ranges, though I don't
see ranges in the datasheet, not sure where to get them.


