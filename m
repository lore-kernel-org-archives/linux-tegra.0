Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FC0C77B7A
	for <linux-tegra@archiver.kernel.org>; Tue, 30 May 2023 15:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjE3PjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 May 2023 11:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjE3PjH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 May 2023 11:39:07 -0400
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C36A100
        for <linux-tegra@vger.kernel.org>; Tue, 30 May 2023 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=yErmUKLEV8p541cORXL+ZjgxkNaQgiMOaq6ZyNHls9A=;
        b=kJy4mOQJiQ6YFOtAavW7NVC4LtJUJWoWi0t56Isq6GJEQ94tSFFnKj2QAWLm0XaGC4nsXFkBkakDS
         NJpKJBBKnZj3kxtUaKYQCD2fzGVMwf1GdCYmplTtiUKOMCqmeCodCGDybgd3fBXqq41gTF+jtWaBud
         ZiifDfsFsxbsCYl7jUi6gqu8AP+taGhEp5M1s3Eje2y9B9jvuhLniBwkansgLifx6SE0ZhmmkwwW0S
         kQrmWvCeSptvOj1pNPoctQlqP/WS/dhXugy4DsvtYBfPP4+2ibR1557sMasm0CnZgPmuJJrK37Cziw
         2hQh7NWvetGo07FA/uw7kZ2ePRqcxCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=yErmUKLEV8p541cORXL+ZjgxkNaQgiMOaq6ZyNHls9A=;
        b=9OBjrRKYEtwrxBpN98hY1nffVfOZmReyI/MyWaIBmOFDtTrxJbnAvKHOUUjnmP+bOTyVAwwn+tCeN
         TfzEQsmCg==
X-HalOne-ID: f3492551-feff-11ed-8093-231b2edd0ed2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay5 (Halon) with ESMTPSA
        id f3492551-feff-11ed-8093-231b2edd0ed2;
        Tue, 30 May 2023 15:37:58 +0000 (UTC)
Date:   Tue, 30 May 2023 17:37:57 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, javierm@redhat.com,
        dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
Message-ID: <20230530153757.GA1464878@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
 <20230529193621.GD1370714@ravnborg.org>
 <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thomas,

> > > -	if (helper->funcs->fb_dirty) {
> > > -		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> > > -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> > > -				     drm_rect_width(&damage_area),
> > > -				     drm_rect_height(&damage_area));
> > > -	}
> > 
> > The generated helpers do not have the if (helper->funcs->fb_dirty)
> > check.
> > Is this implemented somewhere else that I missed?
> 
> It's not needed any longer.  We used to test if the fbdev code needs damage
> handling by looking for a fb_dirty callback. If so, we ran the damage
> handling code.
> 
> With the patchset applied, the fbdev code that does not need damage handling
> calls fb_{io,sys}_write() directly.  The fbdev code that needs damage
> handling (generic, i915, msm) uses the generator macro that creates
> necessary the calls unconditionally.  We know each case at build time.
> 
> (I think I have to move the msm patch after patch 10/13 to make it
> bisectable.)
> 
> AFAICT the missing test for fb_dirty is also one of the reasons why there's
> a difference in performance.
> 
> Hopefully, this answers your question?
Makes perfect sense - thanks.
That also implies that my conditional r-b's are now OK.

	Sam
