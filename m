Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D274BC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A48A560FBF
	for <linux-tegra@archiver.kernel.org>; Sun, 24 Oct 2021 19:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhJXTKz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 24 Oct 2021 15:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhJXTKz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Oct 2021 15:10:55 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BED6C061745;
        Sun, 24 Oct 2021 12:08:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w23so4111774lje.7;
        Sun, 24 Oct 2021 12:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LygNu+5BcyoxJoO4N+kRy5tMK0K/aKdFySsPx1/bqUY=;
        b=gKYkhcdOT/qib/XQosIRtO7maBquPeEeL97wBvTDDLJglAcqSsENrCluOstzWkxsTX
         wVu6Groj9ZjBU/XeaS4Ev1qXPpVYTrQ1u39ieZG2rDMmZiItFNjjRd/xWy7N+c7W//qi
         Ku3UV0KsXpUO1yjUOVBWcU3H5HKeb6QZ6uG1E0hrpRdS9hSQXNGYn6w7mHEJ5v0iWwzl
         2Cow/FB+s2oaxN/+YN6wyQWeBDHfcFDe8yBqXYVxCJ6Ot45l+uTJgFMCX/rwrwSLpg33
         xkBKkzNk568Ttcpwkny/2Nh4OPGudfopOgA2cvUm8mt9WPZNO3sEpDJRrGsCIjPjHEeq
         ps6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LygNu+5BcyoxJoO4N+kRy5tMK0K/aKdFySsPx1/bqUY=;
        b=gr8T0NyZZ89vwiB4rZOxG+AI/ao3J+b+6CVydXBVOEZ2aGA6inBnWOfdXqfp/cxZBe
         COVdM84E9gHxixayF58vNM/Ky7JjY8R4Yunik4NuWI0yVe03F4QX7odJLke9ha8JQxxH
         +eqglNhC58ZHIAaNnv+mUYFUKWJeTgbfidwCB2Bzz1eyWBvDOgiIuGSrZAuz9dU8y/8l
         sDLQC/tNvP1+Dn2CaH2BJvaz/a9RstptUlWP3SvVtzwGktZt5oJSIHLZbKWCT9USWEJL
         LRxV60NHe19H7PwFWd9bawQna1CirOx+4ph7QYh/iFKHZBX4etmpRtYsCCEB7FZvlQj6
         XDbw==
X-Gm-Message-State: AOAM532DYVXgzW2paQbQJ2p2iuXS5aiEN+t707nDUpWdHH7+y8aVemJQ
        57z6d0W2yaUpdVN9keoxDDnSdcot1pI=
X-Google-Smtp-Source: ABdhPJwyTg6gBW6/79PXjMAsHBaxC6vFFyBb7pDEm+YCaXq+ye2Gz6I3c1FxSENtZ2u0mtMypneYCQ==
X-Received: by 2002:a2e:b4b3:: with SMTP id q19mr13755255ljm.508.1635102512207;
        Sun, 24 Oct 2021 12:08:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-50-159.dynamic.spd-mgts.ru. [46.138.50.159])
        by smtp.googlemail.com with ESMTPSA id v13sm1781861ljk.72.2021.10.24.12.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 12:08:31 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] ARM: tegra: Name clock and regulator nodes
 according to DT-schema
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210926233704.10164-1-digetx@gmail.com>
 <20210926233704.10164-3-digetx@gmail.com> <YVtqlt4m63WuBHGM@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9e42d42c-2fe0-3d74-3cd8-2d9e0a1356b2@gmail.com>
Date:   Sun, 24 Oct 2021 22:08:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVtqlt4m63WuBHGM@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2021 23:56, Thierry Reding пишет:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Name clocks and regulators according to DT-schema to fix warnings such as:
>>
>> arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: clock@0: 'anyOf' conditional failed, one must be fixed:
>>  	'reg' is a required property
>>  	'ranges' is a required property
>>  	From schema: /home/runner/.local/lib/python3.8/site-packages/dtschema/schemas/root-node.yaml
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  arch/arm/boot/dts/tegra114-dalmore.dts        | 16 +++++------
>>  arch/arm/boot/dts/tegra114-roth.dts           | 14 +++++-----
>>  arch/arm/boot/dts/tegra114-tn7.dts            |  8 +++---
>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 26 ++++++++---------
>>  arch/arm/boot/dts/tegra124-nyan.dtsi          | 28 +++++++++----------
>>  arch/arm/boot/dts/tegra124-venice2.dts        | 28 +++++++++----------
>>  .../boot/dts/tegra20-acer-a500-picasso.dts    | 12 ++++----
>>  arch/arm/boot/dts/tegra20-harmony.dts         | 16 +++++------
>>  arch/arm/boot/dts/tegra20-medcom-wide.dts     |  8 +++---
>>  arch/arm/boot/dts/tegra20-paz00.dts           |  6 ++--
>>  arch/arm/boot/dts/tegra20-plutux.dts          |  8 +++---
>>  arch/arm/boot/dts/tegra20-seaboard.dts        | 16 +++++------
>>  arch/arm/boot/dts/tegra20-tamonten.dtsi       |  4 +--
>>  arch/arm/boot/dts/tegra20-tec.dts             |  8 +++---
>>  arch/arm/boot/dts/tegra20-trimslice.dts       | 12 ++++----
>>  arch/arm/boot/dts/tegra20-ventana.dts         | 12 ++++----
>>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 10 +++----
>>  ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  4 +--
>>  .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  2 +-
>>  arch/arm/boot/dts/tegra30-beaver.dts          | 20 ++++++-------
>>  arch/arm/boot/dts/tegra30-cardhu-a02.dts      | 12 ++++----
>>  arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 14 +++++-----
>>  arch/arm/boot/dts/tegra30-cardhu.dtsi         | 28 +++++++++----------
>>  23 files changed, 156 insertions(+), 156 deletions(-)
> I'm not sure about this one. Last time I talked to Rob about this, he
> seemed to suggest that reintroducing the top-level clocks and regulators
> nodes was preferable to doing these renamed.
> 
> Rob, which way do we want to decide this? If we do want to reintroduce
> the clocks and regulators top-level "bus" nodes, we probably need the
> tooling to learn to accept that, because I /think/ the reason why they
> were originally dropped a while ago was because the tooling complained
> about the "bus" nodes not being named "bus" (I think that was because
> they traditionally have had "simple-bus" in their compatible and hence
> the "simple-bus" schema was applied along with the schema for the node
> name.
> 
> So I think we have a couple of options here:
> 
>   * Make it so that these nodes no longer need the "simple-bus"
>     compatible string: this would need new code to parse these nodes
>     and instantiate platform device for them like "simple-bus" would
>     do.
> 
>   * Relax the rules for the "simple-bus" compatible string. It looks
>     like this would be the simplest, because we could just extend the
>     pattern in the "simple-bus" schema. There's a slight catch, though,
>     because we'd also need to allow "#size-cells = <0>" for these. And
>     maybe also make "ranges" not required because it doesn't make sense
>     for #size-cells = <0>.
> 
>   * Create a new compatible string specifically for these. That would be
>     similar to the first option, except that it's perhaps a bit more
>     formal. We could basically create a separate schema for this type of
>     bus, so that simple-bus could remain as-is.
> 
> Perhaps there's also yet another option that I haven't thought of that's
> better than the above.
> 
> Quoting in full below for you to get a better picture of what kinds of
> changes we're talking about here.

Could you please explain what's the point in having a top-level node?

It's also not clear how it will help fixing the warning messages since
reg property still should be required.

If there is no good point, then let's rename nodes and move on.
