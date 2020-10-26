Return-Path: <SRS0=h/hb=EB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F3BC388F9
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 09:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E89D622400
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Oct 2020 09:40:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="EJMWUSqk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1422462AbgJZJkG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 05:40:06 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:34787 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391107AbgJZJkG (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 05:40:06 -0400
X-Greylist: delayed 1705 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 05:40:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7GHFXL3Mfb/WQIpao76+FQcrhynKUeeVEV/U+yqLSJU=; b=EJMWUSqkAtmfGmXr83NAcS9mmM
        jx5IApTjRTZjPudf5Ag/6OrCXa4WiD0eYS6SBO036ej/xl+nEZfsMk6g0eVVV99pGHODyz5dH+4fm
        LIMTCwa+jvpo+UR9iS1uYmiVnrcw1UP+V296pC+hRO4s+1zNIPZeKnG5BO0I0/d0ypA6qTlS8PbGh
        IjO9/OKoBnodUQreamYNSku83AiAERwrKzkaiTWNxTRwR9KaDwyu3ocDyQvKLn3VGmMEpdjlu8f1w
        GyJeTCemI7cLxxT5qGG1Zm13T7Jgcs9wDI8ERIjBVksAdMfHkD0XCQ3nOXw0xn2uuw7zo9kxw5xux
        z0G8hSKg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kWyXQ-0005Sp-4v; Mon, 26 Oct 2020 11:11:36 +0200
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
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
Date:   Mon, 26 Oct 2020 11:11:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 10/22/20 7:20 AM, Dmitry Osipenko wrote:
> 20.10.2020 12:18, Mikko Perttunen пишет:
>>> I'm asking this question because right now there is only one potential
>>> client for this IOCTL, the VIC. If other clients aren't supposed to be a
>>> part of the DRM driver, like for example NVDEC which probably should be
>>> a V4L driver, then DRM driver will have only a single VIC and in this
>>> case we shouldn't need this IOCTL because DRM and V4L should use generic
>>> dmabuf API for importing and exporting buffers.
>>
>> This IOCTL is required for GR2D/GR3D too, as they need to access memory
>> as well. This is a different step from import/export -- first you import
>> or allocate your memory so you have a GEM handle, then you map it to the
>> channel, which does the IOMMU mapping (if there is an IOMMU).
>>
> 
> This doesn't answer my question. I don't have a full picture and for now
> will remain dubious about this IOCTL, but it should be fine to have it
> in a form of WIP patches (maybe staging feature) until userspace code
> and hardware specs will become available.
> 
> Some more comments:
> 
> 1. Older Tegra SoCs do not have restrictions which do not allow to group
> IOMMU as wished by kernel driver. It's fine to have one static mapping
> per-GEM that can be accessed by all DRM devices, that's why CHANNEL_MAP
> is questionable.

Sure, on older Tegras this is not strictly necessary because the 
firewall can check pointers. It's not related to IOMMU grouping.

> 
> 2. IIUC, the mappings need to be done per-device group/stream and not
> per-channel_ctx. It looks like nothing stops channel contexts to guess
> mapping addresses of the other context, isn't it?
> 
> I'm suggesting that each GEM should have a per-device mapping and the
> new IOCTL should create these GEM-mappings, instead of the channel_ctx
> mappings.

In the absence of context isolation, this is correct. But with context 
isolation (which is next on my upstream todo-list), on supported chips 
(T186+), we can map to individual contexts, which are associated with 
channel_ctx's.

Without context isolation, this IOCTL just maps to the underlying 
engine. The list of mappings can also be used by the firewall later - as 
mentioned, just the relocs would be enough for that, but I think there's 
a good orthogonality in CHANNEL_MAP describing memory regions accessible 
by the engine, and relocations just doing relocations.

> 
> 3. We shouldn't need channel contexts at all, a single "DRM file"
> context should be enough to have.

Yeah, maybe we could just have one "inline" channel context in the DRM 
file, that's just initialized by the CHANNEL_OPEN IOCTL.

> 
> 4. The new UAPI need to be separated into several parts in the next
> revision, one patch for each new feature.

I'll try to split up where possible.

> 
> The first patches should be the ones that are relevant to the existing
> userspace code, like support for the waits.

Can you elaborate what you mean by this?

> 
> Partial mappings should be a separate feature because it's a
> questionable feature that needs to be proved by a real userspace first.
> Maybe it would be even better to drop it for the starter, to ease reviewing.

Considering that the "no-op" support for it (map the whole buffer but 
just keep track of the starting offset) is only a couple of lines, I'd 
like to keep it in.

> 
> Waiting for fences on host1x should be a separate feature.

OK.

> 
> The syncfile support needs to be a separate feature as well because I
> don't see a use-case for it right now.

I'll separate it - the reason it's there is to avoid the overhead of the 
extra ID/threshold -> sync_file conversion IOCTL if you need it.

> 
> I'd like to see the DRM_SCHED and syncobj support. I can help you with
> it if it's out of yours scope for now.
> 

I already wrote some code for syncobj I can probably pull in. Regarding 
DRM_SCHED, help is accepted. However, we should keep using the hardware 
scheduler, and considering it's a bigger piece of work, let's not block 
this series on it.

Mikko
