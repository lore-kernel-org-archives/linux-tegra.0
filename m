Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A7FC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 22:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E6F761159
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Apr 2021 22:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbhD0Wpl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Apr 2021 18:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22085 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235382AbhD0Wpl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Apr 2021 18:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619563497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EgiXRmMXa3NJldt/X/DsEnucIqp2KsWziXQ4O//7F28=;
        b=OnbQToJ2D1OqGzX9zBaJ5KS++0p5Gyo4OTHEwTtgUOWto+NSYtRR6b9aULVJlmb750abX6
        I9fPxxEOFw1FO3kU2KisbtY6UnfpiDzhJy3qaW7Sc6VNnIu1n8hrKNhmbEHtZVp+fPyo7m
        oNKGLr6/uRsFBJpPlxkvN//JkkpCZJo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-VH9GUNZ_PEC03Mtg6IZyiw-1; Tue, 27 Apr 2021 18:44:54 -0400
X-MC-Unique: VH9GUNZ_PEC03Mtg6IZyiw-1
Received: by mail-qt1-f199.google.com with SMTP id h2-20020a05622a1702b02901b9123889b0so17022201qtk.10
        for <linux-tegra@vger.kernel.org>; Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=EgiXRmMXa3NJldt/X/DsEnucIqp2KsWziXQ4O//7F28=;
        b=e4TmqguoZlr0ipBZP2mdg2E4Ijl3nWOcyrO45t6mygY/Uw2XKiZVFQ2ohMsN22YRxC
         M1kMDyQKAVqoP/rb1KXdZ6BvWNqLzv9lH92BZ1IhsnQ+poh7zlGrAnwA/pxAH3hvk8OM
         VJuiiFP81nWHVSJVw4k7YR32m7zte6fpIYFCTZhecNsCtyCALfNvmrTnZy/ylUU79SdQ
         6ViI84BkesytqlsKk5Lwa+uidBK1j7drm08cafukj7FNT2KRY/SR409XAgNMIn6Sa5DK
         UpTnb/ROgMM0nozNj6eCmm5gutYdHvw8kqPNidD0F19xc1PrP4AropxcY8s7GQq4eof5
         kfXA==
X-Gm-Message-State: AOAM533YZpTscdhBKXxg5k+kgpEIWIt17INukmBTJkNW1vArebbsrKjL
        /aZdsdZpE9EJO1HMnB8pMew5G9TCaPujjozoS5vtwcVM0xt5mnScQ9MeyQ6sLNPltXjO7QYu/DT
        r7+PDNDRPccM8dsb27zmB9FQ=
X-Received: by 2002:ac8:7761:: with SMTP id h1mr4639160qtu.226.1619563494304;
        Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW8E9WJQ40Y3UXOfq1mqkdZDksWBoxiI9VSIOGaYGWFbfX2Oo6ApE9CxLBPAUrNQWKTWwdjA==
X-Received: by 2002:ac8:7761:: with SMTP id h1mr4639146qtu.226.1619563494109;
        Tue, 27 Apr 2021 15:44:54 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id n15sm917482qti.51.2021.04.27.15.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 15:44:53 -0700 (PDT)
Message-ID: <43482b904ef0150b6577044668dd651684590ab0.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/tegra: Get ref for DP AUX channel, not its ddc
 adapter
From:   Lyude Paul <lyude@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thierry Reding <treding@nvidia.com>,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Date:   Tue, 27 Apr 2021 18:44:52 -0400
In-Reply-To: <YIZu4PD6BmlGYXuc@orome.fritz.box>
References: <20210423182146.185633-1-lyude@redhat.com>
         <20210423182146.185633-2-lyude@redhat.com>
         <YIZu4PD6BmlGYXuc@orome.fritz.box>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 2021-04-26 at 09:42 +0200, Thierry Reding wrote:
> On Fri, Apr 23, 2021 at 02:21:45PM -0400, Lyude Paul wrote:
> > While we're taking a reference of the DDC adapter for a DP AUX channel in
> > tegra_sor_probe() because we're going to be using that adapter with the
> > SOR, now that we've moved where AUX registration happens the actual device
> > structure for the DDC adapter isn't initialized yet. Which means that we
> > can't really take a reference from it to try to keep it around anymore.
> > 
> > This should be fine though, because we can just take a reference of its
> > parent instead.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before
> > connectors")
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-tegra@vger.kernel.org
> > ---
> >  drivers/gpu/drm/tegra/sor.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> > index 7b88261f57bb..4e0e3a63e586 100644
> > --- a/drivers/gpu/drm/tegra/sor.c
> > +++ b/drivers/gpu/drm/tegra/sor.c
> > @@ -3739,11 +3739,11 @@ static int tegra_sor_probe(struct platform_device
> > *pdev)
> >                 if (!sor->aux)
> >                         return -EPROBE_DEFER;
> >  
> > -               if (get_device(&sor->aux->ddc.dev)) {
> > -                       if (try_module_get(sor->aux->ddc.owner))
> > +               if (get_device(sor->aux->dev)) {
> > +                       if (try_module_get(sor->aux->dev->driver->owner))
> >                                 sor->output.ddc = &sor->aux->ddc;
> >                         else
> > -                               put_device(&sor->aux->ddc.dev);
> > +                               put_device(sor->aux->dev);
> >                 }
> >         }
> 
> Unfortunately, I think it's a bit more subtle than that. The reason for
> this get_device()/try_module_get() dance was to mirror the behaviour of
> of_get_i2c_adapter_by_node() so that when we call i2c_put_adapter() in
> tegra_output_remove() we correctly decrease the reference count.
> 
> The above will increase the reference on the I2C adapter's parent while
> i2c_put_adapter() will then only decrease the reference on the I2C
> adapter, so I think effectively we'd be leaking a reference to the I2C
> adapter's parent.
> 
> Also, since we didn't take a reference on the I2C adapter explicitly,
> releasing that reference in tegra_output_remove() might free the I2C
> adapter too early.
> 
> I wonder if perhaps it'd be easier to get rid of the struct tegra_output
> abstraction altogether and push this down into the individual drivers,
> even if that means a bit more code duplication. That's not the kind of
> quick fix to resolve this current situation, so perhaps as a stop-gap we
> just need to sprinkle a few more conditionals throughout tegra_output
> code. We could, for example, avoid calling i2c_put_adapter() in
> tegra_output_remove() for the DisplayPort cases and instead manually
> release the reference to the I2C adapter's parent in tegra_sor_remove().
> On top of your patch above that /should/ fix things properly for now.

Alright - I will try to get to this tomorrow

> 
> Thierry

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

