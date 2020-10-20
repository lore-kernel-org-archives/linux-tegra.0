Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3F1C433DF
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 09:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C34D2237B
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 09:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="QO8yJKbj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391227AbgJTJSg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391205AbgJTJSg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 05:18:36 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012F4C061755
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2020 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UeSrQSzqsKGwC4Ys1C+0uDaXnPppjUwPgV6U9zK9CfY=; b=QO8yJKbjEZPWacomno2QXgyULv
        Dk97h2bdjbyYJLw+cUN2WvVwsh0IKGHYoLqqpSwuqyererQLIT2Jo0SMLS0hrJUX8H0HdRf3FDGTW
        jWGcD/o0ufxufkH5udOogfgXaqmduZZQxYiwnOeyykzLZXc0TXlAbM39XF5K7Skbwr278t1wmURd6
        34hgL2b6jkpaJ6jKiZmPb6W+Dnufj5ULshDVf7+PnT+2YNr3DKSp7TyLP5wVBs3pC2e4KmrWPA5Mv
        gWKkEOUGNBj7PATbHOTucER6W1092o6UgWDZoQBjtW0ivcouIp0bfr3NkqTt+sTauJ84hff2XVKR+
        kUoIxmQA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kUnmn-00056W-QX; Tue, 20 Oct 2020 12:18:29 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
Date:   Tue, 20 Oct 2020 12:18:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/19/20 8:27 PM, Dmitry Osipenko wrote:
> 19.10.2020 11:13, Mikko Perttunen пишет:
>> On 10/19/20 5:21 AM, Dmitry Osipenko wrote:
>>> 07.10.2020 20:12, Mikko Perttunen пишет:
>>>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
>>>> +                struct drm_file *file)
>>>> +{
>>>
>>> Hello, Mikko!
>>>
>>> Could you please tell what are the host1x clients that are going to be
>>> upstreamed and will need this IOCTL?
>>>
>>
>> Hi Dmitry!
>>
>> It is needed for any engine/job that wants to access memory, as this
>> IOCTL must be used to map memory for the engine. So all of them.
>>
>> Downstream doesn't have an equivalent IOCTL because it (currently) does
>> mapping at submit time, but that is suboptimal because
>>
>> - it requires doing relocations in the kernel which isn't required for
>> T186+
>> - it's a big performance penalty, due to which the downstream kernel has
>> the "deferred dma-buf unmapping" feature, where unmapping a dma_buf may
>> not immediately unmap it in case it's used later, so that the "mapping"
>> later is faster. A feature which we'd preferably get rid of.
>> - because of the above feature not being controlled by the user, it can
>> cause variance in submit times.
>>
>> On the other hand, we cannot (at least always) do the mapping at
>> allocation/import time, because
>>
>> - A single FD may have multiple channel_ctx's, and an allocation/import
>> may need to be used in any subset of them
>> - The import IOCTL is fixed and doesn't have the parameters we'd need to
>> do this at import time
>> - Overall it's more orthogonal to have GEM object acquirement in one
>> step and mapping in another.
>>
>> Maybe that's not quite what you asked, but it's some background anyway :)
> 
> I'm asking this question because right now there is only one potential
> client for this IOCTL, the VIC. If other clients aren't supposed to be a
> part of the DRM driver, like for example NVDEC which probably should be
> a V4L driver, then DRM driver will have only a single VIC and in this
> case we shouldn't need this IOCTL because DRM and V4L should use generic
> dmabuf API for importing and exporting buffers.

This IOCTL is required for GR2D/GR3D too, as they need to access memory 
as well. This is a different step from import/export -- first you import 
or allocate your memory so you have a GEM handle, then you map it to the 
channel, which does the IOMMU mapping (if there is an IOMMU).

> 
> I'm also not quite sure about whether the current model of the unified
> Tegra DRM driver is suitable for having the separated engines. Perhaps
> each separated engine should just have its own rendering node?
> 

Yeah, having separate nodes per engine might be better, e.g. so it's 
easier to do access control. I don't have a strong opinion on that though.

Mikko
