Return-Path: <SRS0=EsoP=CU=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E468C433E2
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 16:40:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E62C22207
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Sep 2020 16:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhtS9pjy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgIKQkY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgIKQkM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 12:40:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6D3C061573
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 09:40:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so12928811ljg.9
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2020 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s/H/gDz410T534CAt4TPbdHUY+qlZvAzdyyNfh+ES2I=;
        b=RhtS9pjymfijzTI6xem6SOzEF898S/QqhAEn1KdjA2bCT0MgB9o3Uro+UgFRTva06F
         LEVDgKjSTWHMytB5vn1xpCoXaSAhQrJfyT8cdKlH3Uarlz4FOgPT0mYVnapsWi8F6JEN
         TMLSRrWKyw+Mqs8GXt5oxBM3h+9NBXur5iQvVUiVYbW+Qr+1RbOb+Tp86MLfpcF7AEdh
         iM2AJGCE7moZMSDaUcJtQtVqV2usa1v6ZLB9HjCsTYj2XD8yOC+0P9WUcCRV3MMVLro5
         mzdofZ5zRwjc8mebp4UNrakC5RgQD6E9FcJOAUUHJLPCWD6v2Z8AP7mmcaZMxlS2UK0T
         /JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s/H/gDz410T534CAt4TPbdHUY+qlZvAzdyyNfh+ES2I=;
        b=Sl639Hn7kIrVEs21a+WVQXQ0Hcyruulp4qaeRQHJ/Gr9BcnRCML943Ve5gUoiw60Hc
         vwcDjdoM+yj+5VSVz1kLsJyWINaNB/J+EEu+tXdyZtGWglo12439wUrR8ISPqlenq9Xd
         mY8ScA3ucOfs3B6rK/Eezow8UHHpLKgNlbJU4cD2kg6xn9IOCpaAZ19TM7inIMwbdtRa
         Zz2Ox7QR3crn5dLufKbQVnwGS5AAuLjyXOb6CE1X7+9jJszv66UxAcVIY3dF6ZqVIgoI
         uym5gTVmkwDWKWWfhVXB9FCW1IQMZTxRJ2CWfNfmEl7YjNqLHEmVb/yy+RzJDtFgfrXH
         BHJQ==
X-Gm-Message-State: AOAM532uweoIEqTJrYmMfgoaGeEjmhkem4pplIg/Mpbh8qSLuT5HqIbE
        2bJPUXkIATtr4JhuS7MX5rU=
X-Google-Smtp-Source: ABdhPJwVShUZYpjapXvRIR//ZQongBdDDi5huXKQAa0hbSUrTv/ffz5KoIzURpMgPoctRWXXejP5DQ==
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr1120622ljj.456.1599842410904;
        Fri, 11 Sep 2020 09:40:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 10sm500534lfq.64.2020.09.11.09.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 09:40:10 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
Date:   Fri, 11 Sep 2020 19:40:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-11-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
> +	} else {
> +		struct host1x_job *failed_job = job;
> +
> +		host1x_job_dump(dev, job);
> +
> +		host1x_syncpt_set_locked(job->syncpt);
> +		failed_job->cancelled = true;
> +
> +		list_for_each_entry_continue(job, &cdma->sync_queue, list) {
> +			unsigned int i;
> +
> +			if (job->syncpt != failed_job->syncpt)
> +				continue;
> +
> +			for (i = 0; i < job->num_slots; i++) {
> +				unsigned int slot = (job->first_get/8 + i) %
> +						    HOST1X_PUSHBUFFER_SLOTS;
> +				u32 *mapped = cdma->push_buffer.mapped;
> +
> +				mapped[2*slot+0] = 0x1bad0000;
> +				mapped[2*slot+1] = 0x1bad0000;

The 0x1bad0000 is a valid memory address on Tegra20.

The 0x60000000 is invalid phys address for all hardware generations.
It's used by grate-kernel [1] and VDE driver [2]. Note that the 0x6 <<
28 is also invalid Host1x opcode, while 0x1 should break CDMA parser
during of PB debug-dumping.

[1]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gem.h#L16

[2]
https://elixir.bootlin.com/linux/v5.9-rc4/source/drivers/staging/media/tegra-vde/iommu.c#L99

The VDE driver reserves the trapping IOVA addresses, I assume the Host1x
driver should do the same.
