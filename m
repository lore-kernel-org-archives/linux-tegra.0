Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DB8EB64DC
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jul 2023 13:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjGFNIs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Jul 2023 09:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjGFNIq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 09:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEAF1BF3
        for <linux-tegra@vger.kernel.org>; Thu,  6 Jul 2023 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688648873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LeNjy3+keWlsOvLTTvuNBq4v2wzKbZwn++nVg8XqFBY=;
        b=W0uAdGEHqr3A7gcb3jUbe7QuIK2MVuGJu05DIrSmbcPMIcZD0i5lGX711susCm5xqIHBNz
        7z3U7RRxbkeVGFjSkSTgL4XrSCOWq1YZyvtVcizXdfBfeEm+AFd3nfWdtCcEt0BbMer2yN
        zMe0hPWMEQOeKToHNEuJMEeBUjP6yHc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-ai5Df_rHM-C_Hhu1XI43pw-1; Thu, 06 Jul 2023 09:07:52 -0400
X-MC-Unique: ai5Df_rHM-C_Hhu1XI43pw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31443e13f9dso348461f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 06 Jul 2023 06:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688648871; x=1691240871;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LeNjy3+keWlsOvLTTvuNBq4v2wzKbZwn++nVg8XqFBY=;
        b=jKBDfcAicFzXDALOsS2tqOY7PnG/dDudgQNtTFPs+9ppkVAx0LJCWp1STotSokcJcg
         Lna9RoYcQOZz1tqLhQcgQYZPNiYrvlKxAhD+RUIyBsYnxKIB8UONqS28v37sjUSYjUp7
         coLCKB6QLPrOZTg0p2SO/VbWZrdew+llGtTR4cgE3tLnhfKvuaQUkt05f0X+FAPVgBHu
         qKt66esDIX6DOf/Dl3POJ7vRGdpq6xgyZhjuE6gd6nRuA9VVlgvEp38COtFJ5rt5bzBp
         QHpTHfnqDhEPqbK8D0f8PsEO+2mG9cFgKiLHha9HS7AnF5hm4zmmD/4eoxF+a24Tizfg
         2hzA==
X-Gm-Message-State: ABy/qLb8VHrQAI60/l3+3Hps1xaVu8GVlrL7NQFTOnteTwX2ctVj/rpC
        9lSb+5sUJcFGwUE92HobwfWPmerxpq90aeK3T6V9R+awPHG90gRdy9x4p4MvnqpB4JCu7rjaqaX
        lx5AqBrRZ1lzWBhGPsDL8eEk=
X-Received: by 2002:adf:f805:0:b0:314:4c78:8b84 with SMTP id s5-20020adff805000000b003144c788b84mr1326689wrp.17.1688648871139;
        Thu, 06 Jul 2023 06:07:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEaxocSJQPDHbM+Bf8WPoQwbvLcXg68bXBbqp/OOFiEKQL+7RK5UP/6wE2wZ9Vp1LmHB/VY4Q==
X-Received: by 2002:adf:f805:0:b0:314:4c78:8b84 with SMTP id s5-20020adff805000000b003144c788b84mr1326675wrp.17.1688648870795;
        Thu, 06 Jul 2023 06:07:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d4807000000b003143aa0ca8asm1885374wrq.13.2023.07.06.06.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:07:50 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 11/11] fbdev: Harmonize some comments in <linux/fb.h>
In-Reply-To: <20230706124905.15134-12-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <20230706124905.15134-12-tzimmermann@suse.de>
Date:   Thu, 06 Jul 2023 15:07:37 +0200
Message-ID: <87sfa1xk6e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Make the comments for I/O, system and DMA memory say the same.
> Makes the header file's structure more obvious.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Looks good to me. Thanks!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

