Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD3AC43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDB5A215A4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 08:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="ZpuQY2Lk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgIII0Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 04:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgIII0V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 04:26:21 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0BEC061573
        for <linux-tegra@vger.kernel.org>; Wed,  9 Sep 2020 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pIHAnXoUy/PJ1p9DTW2kJPOZMvOAWmV/AwrDFdak/jM=; b=ZpuQY2Lk4WpS3vw9u0d+lx9J4t
        RqKT/qEEFsaikcGpqsFK9Z9o4Mv6cIZPX79OJ3dN1cPKCpbKoKUKmg8yMzwzM3SrVgLC516y6VYY1
        br08kAuH1px/ZFHO7ekp3Dnt3wGehB/7xVNMuWxxj7TtMVQF8V0RXgkkfyHaLq4/auWJlTnUuLPWx
        3eL+bTn5UYmj8x7z+ulabLavOtGnCUp9iIHRmB+GQvam9a/4cAVBJlbNqQS597uiuq/2ryax1DWvC
        O7jMy0j9slrmIc4BDZMEUIt2dkEiezgMtDy2okUEar7OikYT/SpUCpUb5n6dXPfrlsur2c4c0XaGF
        Ueih4Myw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kFvQk-0001mq-NS; Wed, 09 Sep 2020 11:26:14 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
 <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
Date:   Wed, 9 Sep 2020 11:26:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/9/20 4:24 AM, Dmitry Osipenko wrote:
> 09.09.2020 04:13, Dmitry Osipenko пишет:
> ...
>> How many sync points would use an average job? Maybe it should be better
>> to have the predefined array of sync points within the struct
>> drm_tegra_channel_submit?
>>
> 
> The same question regarding the commands.
> 
> Wouldn't it be a good idea to make both usrptr arrays of sync points and
> commands optional by having a small fixed-size buffers within
> drm_tegra_channel_submit? Then a majority of jobs would only need to
> copy the gather data from userspace.
> 

Sure, I'll look into it. For syncpoints, it would be usually 1 but 
sometimes 2, so maybe make it 2. For commands, at least for downstream 
it would typically be 2 (one wait and one gather). Any opinion from 
grate-driver's point of view? Not sure if there is any recommendation 
regarding the max size of IOCTL data.

Mikko
