Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6734AC2BB84
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0038420936
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHGo4B8e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgIPTog (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgIPTob (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 15:44:31 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33422C06174A
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 12:44:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x69so8272288lff.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g3sBpzZu6K+jifaS1Lrpgfa3Jk6KBn8m95+sY2b5kwo=;
        b=PHGo4B8eQ/E36usx/N56TzzH3/dRslZVVoPI8eiWi83BQ4C6G8REZwYUCEnv5LzzoD
         lWynAdJc8y8Ar1BjNn5YA7Hl2ETVOf8Az2Q6zDbwKnsfhCMTyGBH9hxUG/NPZdT0rj4n
         YDwXVj73JaPVaVBcgHwidcEVlgI3zRq3v5R73x7QCEXGTCs7dpAoJ48BLN1cnEkAodtj
         XMDwPmkVAWQaT03O7sTQnB4sIvaiHuJGO8UN2nFRrfYCC6gEy3Gq3DsQ5ONlMNCA6YGl
         b/njynsAPf58ucDFNf05TwoZWAD9gxirftYoEDlv2Brfe0giEKIuGECs9SedD9OXxy/+
         ggSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g3sBpzZu6K+jifaS1Lrpgfa3Jk6KBn8m95+sY2b5kwo=;
        b=Xa6QoIWwWzkti192MLXLsqPHek7t8iMUoA1O/GLqt4BPG4tdB2f4iRjuYfV7kL1tV9
         Ehk72SrkEwHMH0OGF2SQSVzz8/40v1QRlico/rW3p8HVtjmqDY1sRFDsVoK3vPusstvS
         t5vyv2q6OLJb/wknICzeWkqe06e4lwE+TRsDZfjQLPoatGDTBcpUrOF0FFhC/b1BQttN
         pOcawz8/JF+yz8pt/RxIzXQaaiXircm/jnqZ4878ldcsqt6uRP65STEBxZbsADHD5ggJ
         gFRgnW04s3ojuxGJU66D1AQnOO3JqkJPjFQNQCWLBwS1Hd1LIcw8EBVrjFQKQQG1gYjY
         pWrw==
X-Gm-Message-State: AOAM530VnC/GNWI1BH4V9G1SY99vQphAIeqGyJU5W4T0XSLdMdIZ4ojh
        8Oc61w8BvdVgIZbnacoc30M=
X-Google-Smtp-Source: ABdhPJy+lkFBznrdw/aFstdA6S7xNlwsTkpbPXhmlMBDC9IluODOQXEFnnOizB9lsnUEmKLmf7N3JQ==
X-Received: by 2002:a19:8345:: with SMTP id f66mr7197660lfd.506.1600285464671;
        Wed, 16 Sep 2020 12:44:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c1sm4768583lfh.190.2020.09.16.12.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 12:44:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
Date:   Wed, 16 Sep 2020 22:44:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
> With job recovery becoming optional, syncpoints may have a mismatch
> between their value and max value when freed. As such, when freeing,
> set the max value to the current value of the syncpoint so that it
> is in a sane state for the next user.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/syncpt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 2fad8b2a55cc..82ecb4ac387e 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
>  {
>  	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
>  
> +	atomic_set(&sp->max_val, host1x_syncpt_read_min(sp));
>  	sp->locked = false;
>  
>  	mutex_lock(&sp->host->syncpt_mutex);
> 

Please note that the sync point state actually needs to be completely
reset at the sync point request-time because both downstream fastboot
and upstream u-boot [1] are needlessly enabling display VBLANK interrupt
that continuously increments sync point #26 during of kernel boot until
display controller is reset.

[1] https://github.com/u-boot/u-boot/blob/master/drivers/video/tegra.c#L155

Hence once sync point #26 is requested, it will have a dirty state. So
far this doesn't have any visible effect because sync points aren't used
much.
