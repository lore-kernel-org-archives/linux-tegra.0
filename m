Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AC2C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 18:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C6764F5E
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 18:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhCQSMr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 14:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbhCQSML (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 14:12:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26ACC06174A;
        Wed, 17 Mar 2021 11:12:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q29so321375lfb.4;
        Wed, 17 Mar 2021 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rm3F1cA66zuHgAWNRDnehpSfjsTieaJWbbEO5oa1uuM=;
        b=vVgz3AQi0vg3TM/jatpKxgQ/QE6HJO9dEZ8vJzAgmdLbuBOYqnMujyiVKvIXyRJRSa
         YGC/22kFevbVibqEWnnSMAyi9C3rZ0htJNht6qXp2OVG8ejP9jpNrpbzJwyieTVJszN4
         TR5/D+X5IyXZ3Xw3FdiF4poNMFIx9a4YY0d8z1SWMq29wqKgAc+aSBbtawJgrEE6rRqa
         RDo53bXS8jQXfhAknx2wvK5nFRfPgltQOoFFrYmyslbqLh/IybV6dZgqfYNVeJy6rbEQ
         pnkywobegW+vx3vCNNF785P/5naKfz5uPwzbmqqH+KjEzBlY7ei+qW4pkRiIl+j3r/jn
         ghhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rm3F1cA66zuHgAWNRDnehpSfjsTieaJWbbEO5oa1uuM=;
        b=fPleuLEGB4n1M5E2vjjsECmvtu42YCf3fwTfOQjMWn4r5VbpLvXRnsA/2s7t0S5U3g
         EiYcA/lZzcktlgXKTTckGHuLiiWvvnPHim39dT9fjJeTdhH+kdEyV5Pq46hXyubd9KxU
         JqUWn9+4NJvAYB1QQd09el8gnOkY3NxEH4H8T1yd7GOocSagKq7OBu09s2018eo9Lut8
         F+LxakZ7LUORqqrknTPVc8qiqZweBZXP4TKx6elvUjyaGEbtiNKDgo6VDK1xE1KE2B7n
         9rKHHV3QyDZNmdrVSVNH4BH7z5HksHeuk+CAvskdDK7YtYyvL50g+DgoyJOGEl9x2fvi
         H1aw==
X-Gm-Message-State: AOAM530VFRcZ2M2Kl9O50YXGfTR+BNf55DrLJeRRCaW+O0HGCEAa7Pvq
        UU2gs5aBZXqaN0MXRrqHweSVwYK74ds=
X-Google-Smtp-Source: ABdhPJy8C3qkLS4DHxFIw+3kI4BF3VFOS96SBfc4NPrMSaw9BPWwByRgdUj6C7Q4vrBF00Nhg7jtCg==
X-Received: by 2002:a19:c0f:: with SMTP id 15mr3068331lfm.580.1616004729249;
        Wed, 17 Mar 2021 11:12:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id u2sm3421397lfi.187.2021.03.17.11.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 11:12:08 -0700 (PDT)
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
To:     Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Paul Fertser <fercerpav@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314154459.15375-1-digetx@gmail.com>
 <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
 <20210317175434.GD5559@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <81ddddba-a179-9389-2458-de6741428822@gmail.com>
Date:   Wed, 17 Mar 2021 21:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317175434.GD5559@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.03.2021 20:54, Mark Brown пишет:
> On Wed, Mar 17, 2021 at 08:20:10PM +0300, Dmitry Osipenko wrote:
> 
>> Mark / Takashi, I may try to split up this series into two or three
>> smaller patchsets and then the reset/ patch from Philipp Zabel could be
>> merged by Philipp himself. I primarily want to have the audio resets
>> fixed and the reset API extended with reset_control_bulk in 5.13 because
>> this will unblock other patches. Please let me know what you prefer more.
> 
> I've actually already got this queued for application next time I apply
> things, I'm guessing Phillip was intending that the reset patch go via
> ASoC?
> 

I assume that Phillip is okay with applying the reset patch via ASoC
since he didn't say anything specifically about it. Thank you for taking
care of the patches!

Phillip, please let us know if you have objections in regards to
applying the reset_control_bulk via ASoC.
