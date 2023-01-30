Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44BAC54EED
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Jan 2023 14:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbjA3OwW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbjA3OwV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Jan 2023 09:52:21 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1966D27D53
        for <linux-tegra@vger.kernel.org>; Mon, 30 Jan 2023 06:52:14 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F35D86008767;
        Mon, 30 Jan 2023 14:52:09 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with UTF8LMTP id s87nkweLR25U; Mon, 30 Jan 2023 14:52:07 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7EA6B6000421;
        Mon, 30 Jan 2023 14:52:07 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1675090327;
        bh=RDkPmsbjG8K9H/t9YpVvybwEHM04LbAFRYdC4PZ62fw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=hwkK/HXRM7Zjagl2uKjjATniyiDMij9QjqqKFVl3woCsVKbjX2RXeEmPAWN2HVzF4
         7mxIq6DMw4tCjcb9Q0Xv4JK17oYssX3ULSiGzttd9DO2YSkelXguLvIymbXoyaLiQA
         FyP8HG9PQXsUPrJoDOGR8MhEaaxhe2BJ35t+3Qbw=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0C9D6360076;
        Mon, 30 Jan 2023 14:52:07 +0000 (WET)
Date:   Mon, 30 Jan 2023 14:49:09 +0000
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     airlied@redhat.com, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: handle implicit scanout modifiers
Message-ID: <20230130144909.d5iauozyvh5fk446@wslaptop>
References: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
 <Y8/qRSBm715P3EnB@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8/qRSBm715P3EnB@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2023 at 03:25:09PM +0100, Thierry Reding wrote:
> On Fri, Jan 20, 2023 at 10:58:56AM +0000, Diogo Ivo wrote:
> > Hello!
> > 
> > This patch series adds support for correctly displaying tiled
> > framebuffers when no modifiers are reported by userspace.
> > 
> > Patch 1 adds the sector_layout parameter to the SET/GET_TILING
> > IOCTLs so that userspace can set this field appropriately.
> > 
> > Patch 2 adds handling of the case where the buffer object
> > passed to create a framebuffer is allocated with non-linear
> > tiling but no modifier is reported.
> > 
> > Diogo Ivo (2):
> >   drm/tegra: add sector layout to SET/GET_TILING IOCTLs
> >   drm/tegra: add scanout support for implicit tiling parameters
> > 
> >  drivers/gpu/drm/tegra/drm.c  | 29 ++++++++++++++++++
> >  drivers/gpu/drm/tegra/fb.c   | 59 ++++++++++++++++++++++++++++++++++--
> >  include/uapi/drm/tegra_drm.h | 16 ++++++----
> >  3 files changed, 96 insertions(+), 8 deletions(-)
> 
> We really don't want to use SET_TILING and GET_TILING IOCTLs anymore.
> These only exist for backwards compatibility with very old userspace.
> New code should use standard DRM/KMS mechanisms to deal with
> framebuffer modifiers.

Hello,

Thank you for your review! This implementation is basically a copy of
what vc4 already does when importing resources with no modifiers
specified by userspace.

I looked into the DRM/KMS infrastructure and did not find a mechanism
to do this, but perhaps I am missing something; if this is the case,
I would be happy to submit a more fitting implementation, since handling
these implicit modifiers allows us to lift the restriction of linear
scanout buffers.

Best regards,
Diogo
