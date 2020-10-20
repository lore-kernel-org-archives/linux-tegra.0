Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F71BC433DF
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 12:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B3522282
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 12:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="WkE+8hpn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406605AbgJTMvG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406603AbgJTMvG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 08:51:06 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182C8C061755
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2020 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uGxWEQsK754B3hOZSl63aoEnD4e7Swtrm1bF3mwOKPw=; b=WkE+8hpnwpJq7/7GOu+amAhzHH
        fUudy/CdvWDL0aR4T5oBcdGrxh2ewoX6vaIKYVjG9EfaSPtWzk6Bnxs3cpnTFaHpFsxBJHgu1KXrx
        Z7SfCzMN7DlM7/Xr3NCzCF+6XVWU3/Jn7Qgbm8OBhu4kzwKz4DaVbNSZJNdaZyIVxnPgSbO6CwLua
        Y0W8O/9ElmK7UvejFALfbIaApSyjV/STjnDXh+UkZ8PxG5BIaA5cJGlXzZvlOF8HtdFU3GJDjT04/
        V6oFrlSz2mUZIryGUC5BC8Td8sAVAFMAkz82qp61D11c1fp8VuUds5HKUdzbEfAlcEjBJOzs6AgSM
        jw7GHFaQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kUr6T-0003kC-IK; Tue, 20 Oct 2020 15:51:01 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Daniel Vetter <daniel@ffwll.ch>, Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dave Airlie <airlied@linux.ie>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <ec4138c0-6c7f-b32e-2049-7848b6ac7f6b@kapsi.fi>
Date:   Tue, 20 Oct 2020 15:51:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/20/20 2:40 PM, Daniel Vetter wrote:
> On Mon, Oct 19, 2020 at 7:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 19.10.2020 11:13, Mikko Perttunen пишет:
>>> On 10/19/20 5:21 AM, Dmitry Osipenko wrote:
>>>> 07.10.2020 20:12, Mikko Perttunen пишет:
>>>>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>>>>> +                struct drm_file *file)
>>>>> +{
>>>>
>>>> Hello, Mikko!
>>>>
>>>> Could you please tell what are the host1x clients that are going to be
>>>> upstreamed and will need this IOCTL?
>>>>
>>>
>>> Hi Dmitry!
>>>
>>> It is needed for any engine/job that wants to access memory, as this
>>> IOCTL must be used to map memory for the engine. So all of them.
>>>
>>> Downstream doesn't have an equivalent IOCTL because it (currently) does
>>> mapping at submit time, but that is suboptimal because
>>>
>>> - it requires doing relocations in the kernel which isn't required for
>>> T186+
>>> - it's a big performance penalty, due to which the downstream kernel has
>>> the "deferred dma-buf unmapping" feature, where unmapping a dma_buf may
>>> not immediately unmap it in case it's used later, so that the "mapping"
>>> later is faster. A feature which we'd preferably get rid of.
>>> - because of the above feature not being controlled by the user, it can
>>> cause variance in submit times.
>>>
>>> On the other hand, we cannot (at least always) do the mapping at
>>> allocation/import time, because
>>>
>>> - A single FD may have multiple channel_ctx's, and an allocation/import
>>> may need to be used in any subset of them
>>> - The import IOCTL is fixed and doesn't have the parameters we'd need to
>>> do this at import time
>>> - Overall it's more orthogonal to have GEM object acquirement in one
>>> step and mapping in another.
>>>
>>> Maybe that's not quite what you asked, but it's some background anyway :)
>>
>> I'm asking this question because right now there is only one potential
>> client for this IOCTL, the VIC. If other clients aren't supposed to be a
>> part of the DRM driver, like for example NVDEC which probably should be
>> a V4L driver, then DRM driver will have only a single VIC and in this
>> case we shouldn't need this IOCTL because DRM and V4L should use generic
>> dmabuf API for importing and exporting buffers.
> 
> Randomly jumping in here ...
> 
> So if you have a drm driver with userspace in mesa3d already, the
> usual approach is to have a libva implementation (ideally in mesa3d
> too, using the gallium framework so that a lot of the boring
> integration glue is taken care of already) directly on top of drm. No
> v4l driver needed at all here.
> 
> And it sounds like this nvdec thing would fit that bill pretty neatly.
Something like this would be my preference as well.

Mikko

> 
>> I'm also not quite sure about whether the current model of the unified
>> Tegra DRM driver is suitable for having the separated engines. Perhaps
>> each separated engine should just have its own rendering node?
> 
> Above model using libva driver in userspace for nvdec would avoid this
> issue too.
> -Daniel
> 
