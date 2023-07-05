Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B1BEB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 09:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbjGEJIG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbjGEJIE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 05:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15C01706
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688548036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
        b=TkctYdfkaG7vg82cKjocujjyNN5f97SGBL0O8qElhImGEztSuHPnXfne6t5x5MRb0EwqZp
        bX+PYReIO2No8v9pat+IOLaqHDow16jV/JVa0mEsQbq7YQIC/4jcGvumAG/r4yGdfqjIMi
        vNcelHt24pWiqCavtCB1LAIZSBf5pZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-yng0LHeuPzyh47_938__Vg-1; Wed, 05 Jul 2023 05:07:14 -0400
X-MC-Unique: yng0LHeuPzyh47_938__Vg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30e3ee8a42eso3746124f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548034; x=1691140034;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a06dM4DVhOWie+29y5OH6RTZsrC7pthC/bnsJb9dU4k=;
        b=QC/YJENfxkT//jcYjVd18Oe6gjeeDEPufTIGTUsvmkqxDtFOc2kdxsbiVX2EhzmszI
         N/fxdILBbk7/vc6vFaHNm/TVXcoypfM6m2WCIyvxjU+5g5qgAYp/Fa2XYiFqw9hS72al
         mlp8qrjsvbpw4BL63YA5d2DmOmZupLguCWaKkWzQMlJGV5/yPHBnxR/ff4V9v7XJ/RLV
         1X9KAciib7CMsEy/kXlC5rFHgZsR1EgC9oX3A4tJvMdrc9yBadPLz60WyQo/sJV9FBsF
         c+yZYvt6oAIxX2WfK6Psxss0/qKzt+IQDVjCMqlZ3aKITQlz573v0TU63It1rXj0McVH
         mwBA==
X-Gm-Message-State: ABy/qLa/JnYELYsZM0oTXVH+FU4t6QodVZ4tI4Zs5Z498q0bhAYurp64
        /6z9X0Z+sM8tYp4TBQLMtcovqWJ28CucC9y1Pry3wMODzq0G32OJwrq6BnmalKUZWhaXUy5Nw6f
        wf/eSw2wz1VEWIYTUtYGCEZY=
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id g4-20020adff3c4000000b00313ebf3850emr13765065wrp.37.1688548033938;
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGcT0p8hhCDRF3h+9mFlbkiFbzXDC8/ZzlCbbtfV1aXJy0eKEzcQDMciMIa3WCioCrYV9vdg==
X-Received: by 2002:adf:f3c4:0:b0:313:ebf3:850e with SMTP id g4-20020adff3c4000000b00313ebf3850emr13765052wrp.37.1688548033678;
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m3-20020adff383000000b0031417b0d338sm16044699wro.87.2023.07.05.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:07:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 09/10] drm/omapdrm: Set fbdev flags
In-Reply-To: <20230704160133.20261-10-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-10-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:07:12 +0200
Message-ID: <87ilayrakf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with

FBINFO_DEFAULT. I noticed that the same typo is in patch 04/10 as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

