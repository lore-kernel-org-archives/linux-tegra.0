Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8B3C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 22:18:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 078B520732
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 22:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJluukte"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgIPWSK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 18:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgIPWR5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 18:17:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5708AC0611C0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 14:38:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so160086ljd.10
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K5mbCSIAeWAEdWVtEp7XKprNFHQC1dqRIziOBIZxb+s=;
        b=gJluukteUSfBTWl31n7U4/oMgRD2+ycm1sKw/nkvTQralJ4g2wpvpNhH+mFqX29A09
         fOm/xRxdQFqOy4SKOoPer0QWrIDlfeXJp9Jhs1M/esIU535eVsdK0sUuvRzeK3GN7b/1
         C4cJC6t0Sf0aCB3SrpT1E5r0Kap3ucKcOqnwvJAV9J7CvpXa7bNU+HyZyWCitpbu5AWz
         MbLL8occtIofkn22FV9kAzSaxVyTwS93zxEA3UjiquJcmFXky9UzrvepMCftCm16sKwT
         56eNE6DsaQP6Wp+QUg/q3d7nnvdemYzt+x4bq8ziHmqpAjxlNcBLxLrgaCHn8WMuU9tn
         OhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K5mbCSIAeWAEdWVtEp7XKprNFHQC1dqRIziOBIZxb+s=;
        b=EcnK2GTJSp1eZKDGH4m1R0mf7Q1G2W9j/cw8qUf0OCUmzjcsOy6va8SpqrFaScTque
         EnjcXyoZGvEWtoA58yG1TiEvKyqej2vpzKXlaT/AcC41sQG4QmWgee3XO9Ps1mkQePt8
         62yIAdsxcLj7bf1dbAkhVv7PDkeJnMCPTfbHEldWzudKfOvMksoggqj6+SP7JHVG3tD5
         fvecQh57Xbyqf4U9xovB40P4CqaMhIy9ogJLc+cGB7yOIqs02SkxdZGnzFwd3SDxbndt
         o5qtTI1shsvoS9XS1SHomUuCX0Su97ejPPX1zR4PHdxiSUjeYS+OSLL9Q/3xC5rO7mNE
         AuTA==
X-Gm-Message-State: AOAM533gZxGb04JF4zIcZ1TnpUmjZekKo6HWejX6F74S3TzrJRhZBx7k
        ShjItN8wJRi5cgt62mpZiig=
X-Google-Smtp-Source: ABdhPJxfYjUE55ilmwcVrsIzLhvX5guab3MxK0ccCNYyITCitPGVUFoDjChTwa5szdpVCGaDN1nfHg==
X-Received: by 2002:a2e:3208:: with SMTP id y8mr9684682ljy.216.1600292278806;
        Wed, 16 Sep 2020 14:37:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id i12sm5103657lfi.48.2020.09.16.14.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 14:37:58 -0700 (PDT)
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
 <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
 <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <343e4518-e132-6ea8-6169-0685f000b89c@gmail.com>
Date:   Thu, 17 Sep 2020 00:37:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.09.2020 23:43, Mikko Perttunen пишет:
...
>> Please note that the sync point state actually needs to be completely
>> reset at the sync point request-time because both downstream fastboot
>> and upstream u-boot [1] are needlessly enabling display VBLANK interrupt
>> that continuously increments sync point #26 during of kernel boot until
>> display controller is reset.
>>
>> [1]
>> https://github.com/u-boot/u-boot/blob/master/drivers/video/tegra.c#L155
>>
>> Hence once sync point #26 is requested, it will have a dirty state. So
>> far this doesn't have any visible effect because sync points aren't used
>> much.
>>
> 
> Maybe we can instead reserve syncpoints that might be used by the boot
> chain, and only allow allocating them once the display driver has acked
> that the syncpoint will no longer be incremented? That way if the
> display driver is disabled for some reason we'll still be fine.

sounds good

> Looking at the downstream driver, it (still, on new chips..) reserves
> the following syncpoints:
> 
> - 10 (AVP)
> - 22 (3D)
> - 26 (VBLANK0)
> - 27 (VBLANK1)
> 
> and says that this applies to T20, T30, T114 and T148.
> 
> I suppose if you haven't observed this happening to other syncpoints
> than 26, then reserving 26 would probably be enough.

I only saw SP 26 being used by the DC, but perhaps that may vary from
device to device and SP 27 could actually be used in a wild as well.

I think the AVP SP should only relate to the AVP-firmware that upstream
doesn't support, so we can ignore its reservation.

I've no idea what may use the 3D SP.
