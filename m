Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776BEC48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60581613C0
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 16:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbhFIQa6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 12:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbhFIQa6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 12:30:58 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B47C061574
        for <linux-tegra@vger.kernel.org>; Wed,  9 Jun 2021 09:29:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m18so26195360wrv.2
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGWiX83Hywk9BgCeVsLYFd5tdqdc0fZh1j2g86mM9NQ=;
        b=WjSZMYTEqWPM1HVhG7zxeukpq/DtDZR/ioBAuMiyzXZ3QWKoBIsBANXq0hMARslWSh
         QuKKaF0LwObIHXaXGMEXLzoftLxAKA4QJHXrsrR+gIKtE6N5Zv1OCrY3EL43DEXYt6QW
         ZGCOu+HAwCyI4OmjFlPCaNI18G+ebT9Ol5u9AV2GsiLbefnm/hJXVrbUAmFMjnmHF9CZ
         T3pqhcjBWqmteg90bVFqiLDduluW0BK2ar8uze1sDNRbQhgg9B82g40JCwKfrYyYPp/R
         nyc7OYc6MgCvVuaXm/x0ZCrHF2tt49jM8dB5aYhdYEDD7lGuYCTNk+ctUjQE3FxhjiXG
         vPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGWiX83Hywk9BgCeVsLYFd5tdqdc0fZh1j2g86mM9NQ=;
        b=CbvHv54Pz2tNUDhVXf1afQKAFmNSOq3TZSfRWuRGDtmVHQvL7tdG5rC4uG9ZmE4eyZ
         0KuSN4wt4+wXMxu3m9pzYi/HKtg80qErfVk8otq7YCNUKA/Cs+UmUXFgWbgXt9V1ES1w
         5O9r0nt+a2DheEJQSUkmcOT6cK5gdfD80Pttg6UYTpCXojpb19q61dG1SNaIbN2snC1+
         yi7lr3fHkAtM0TW1+OT7u68A0gXmZzy/Q2PlVRJziZ4EUXI+rNsjdrv4Ldw+o7sUwK7y
         JoUoqivZ1b37QfZnKHPVU9IDgCsC1yCIu7YJKHUfhxBSnB5WTLIklgr3g7GdG9paw8pm
         Zycw==
X-Gm-Message-State: AOAM532rGY/T/hObofTHTTU5P88ac4JfWU4rOMFNuWIzsw3jh4GD9cG/
        HEM1plYhnc+ObdiCtZ71YdmSLkMc5R64I5uMOx+uZw==
X-Google-Smtp-Source: ABdhPJyGrufajQ9tkW7Bx2QtFsfOtFOpmrFCXaUC5i0cwvpLayIR5PKpP0lpcQYz0BtBHERd7g1SI98fU+iWRiPMPZQ=
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr739340wrw.6.1623256141950;
 Wed, 09 Jun 2021 09:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com> <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box> <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
In-Reply-To: <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 9 Jun 2021 17:28:50 +0100
Message-ID: <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier vendor
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Simon Ser <contact@emersion.fr>, David Airlie <airlied@linux.ie>,
        James Jones <jajones@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
>> > LGTM, thanks!
>> >
>> > Reviewed-by: Simon Ser <contact@emersion.fr>
>> >
>> > Let me know if you need me to push this to drm-misc-next.
>>
>> I do have commit access for drm-misc-next, but I was thinking that I
>> could take this through the drm/tegra tree along with the subsequent
>> patches because of the dependency.
>>
>> Anyone willing to provide an Acked-by for that?
>
> Yep, no harm if that makes your life easier, so for both the patch itself and merging through tegra:
> Acked-by: Daniel Stone <daniels@collabora.com>

Is this still in your queue somewhere?

Cheers,
Daniel
