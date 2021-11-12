Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8EAC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 20:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18F7560E8D
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 20:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbhKLUsc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 15:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235716AbhKLUsa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 15:48:30 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869C9C061766;
        Fri, 12 Nov 2021 12:45:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 1so20874150ljv.2;
        Fri, 12 Nov 2021 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dj8edOGwh4mwPw7oTrbImc1ApAV3Fdni4gw+kNh3zB4=;
        b=qoxEZsXGdKhCEQ0BzWWIHG6hrTaMGH+sW6P/De5GatNtSglP3BDbpPyFfg5dQKWALW
         D6vQMvKhtlLSkliv++OuJCS6b155jod/dtzO0rGk2FBEqNXhutpxFX/SiccDfaQc8Z25
         FHoDnXEYf7XLvob1ylT63E3hWGhivFSUUxCOtqy0xppwLmGLK7sOrR8YlQIFEQ+gmN5k
         o3PUnZr5nho5kQ8+QxhvpsY8bnCcsEaQQcTRYXyCCZRaGkNJ8A8QCttjEYNe0oQpnveC
         zVDQn0f8nUN4QcvlvgvS31lu+dbVta2nAjNbUOyRphjN56JtMXOJ/zJM1PBTXATCpML6
         puCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dj8edOGwh4mwPw7oTrbImc1ApAV3Fdni4gw+kNh3zB4=;
        b=3bFGTjvf4cAp6RujfNGACq0k1+afMciGe0NYkq7AJZDV+SUrg8dpHJcdyi/6l0j3+L
         bynrpz5QtqSGEjhOSdK6fh2iXEIb5XcsAI7b1xUOAJoLNWoAEvvgRER8TNHfX7ujfsmG
         B9NP3gKiCSunE0uLbXgkrR+JXODmSiJnE7KoCS8eGis3ggFBmT1f8kld4zjBPQ/DaBQn
         GUi7slhNAUZ3/voEEkt4s4QRLmSiCfDxBf0WwrSZz4jkLuqB/CF3Ub5WdP5MTk5NDmYT
         LM9w42VveaLOvByLLeIhslPh0TnpGBJdVrwyBBCz9u6oFlB2Xm2PqQwP4fpsWClTxpWw
         enyw==
X-Gm-Message-State: AOAM533m+VMLR/gVKwe71RqEPrVPl8ir/dNCbhmbp9/7LlwWAoea+V02
        91Giop2fdcpcrAsITb3YRjFWeZPLaG8=
X-Google-Smtp-Source: ABdhPJxQNaZT0uWmDv3ix5lMXRBKd4qRik1D3EQJP/ClHT7Avo9zZh4FDTunb09hDuXYyGN/anHPKQ==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr18300650ljr.408.1636749937660;
        Fri, 12 Nov 2021 12:45:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-177-117.dynamic.spd-mgts.ru. [79.139.177.117])
        by smtp.googlemail.com with ESMTPSA id m8sm736845lfg.140.2021.11.12.12.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 12:45:37 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
To:     Lyude Paul <lyude@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
 <YY5HfUUSmnr6qQSU@orome.fritz.box>
 <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
 <be1833c5d27e666b760c729fc112d1bbd7b7a269.camel@redhat.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9d7c2ff8-c154-b1e8-a7c5-c7f63aa5474f@gmail.com>
Date:   Fri, 12 Nov 2021 23:45:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be1833c5d27e666b760c729fc112d1bbd7b7a269.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.11.2021 23:26, Lyude Paul пишет:
>> BTW, I see now that DPAUX I2C transfer helper may access
>> aux->drm_device. Hence v1 patch isn't correct anyways.
> 
> JFYI - unless I'm misunderstanding you, the aux->drm_dev accesses in the DPAUX
> i2c transfer functions are just from the various drm_{dbg,err,etc.} calls,
> which means that they all should be able to handle aux->drm_dev being NULL. If
> you can set aux->drm_dev before i2c transfers start that's more ideal, since
> otherwise you'll see the AUX device name as "(null)" in the kernel log, but
> any point before device registration should work.

Thanks, I realized that have seen DRM log with a such debug messages
just a day ago.

drm drm: [drm:drm_dp_i2c_do_msg] (null): transaction timed out

So yes, it's indeed not critical.
