Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1B5EB64DA
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 14:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbjFVObp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 10:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjFVObp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 10:31:45 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA6E1738;
        Thu, 22 Jun 2023 07:31:44 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-780bd47ef93so61973539f.2;
        Thu, 22 Jun 2023 07:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444303; x=1690036303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNFS3vm6kC5W9sNmMv1a/vs78lFXzuLxWXC2teSXAwc=;
        b=FNKxjbj5i/DIlJNS4jkLNglEDm1wq5L97QjsVYRCmJcG6OgrKX4kIYl57cJmbF+ySL
         pfOp6hRuHEFeAVL2lFfH9bg95ft54dQRT3sHJQWcPwJyMMLn6pRP78/ythnQeXJFQ55Z
         fG7/MBlM8bxjkMhqQNW+CDqgRo+HlLXETi771ft309perPxNFstsxLcsmtTu49HI2769
         7hSGyedML96CYDExx7OGsSfTLuYS+lKaqLPRDJES0q4rG+tBSShGax9bvUXOTII/lp08
         Vvt2mM0KFyu6yyMoQ/XrgjLCRwKfqKHkelXAfHS6N62wly9fK/sz1bsq1ILmNKPn3xeU
         a/Yw==
X-Gm-Message-State: AC+VfDxZQonr+knGc314wzAO9ylW7nqHjeOY+aTHDbZcwodw8FGwpMey
        fuH9ULQEwaFToDNDTCFgbA==
X-Google-Smtp-Source: ACHHUZ7Nz4ISv38/X0NPG83JDoYB3aNBNpw/wKDugP83+Mf3QVAzemrTn06s8xXkrpqqM1oE7q9v8g==
X-Received: by 2002:a05:6602:218a:b0:76c:2759:5cbe with SMTP id b10-20020a056602218a00b0076c27595cbemr14962748iob.4.1687444303248;
        Thu, 22 Jun 2023 07:31:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y8-20020a6bd808000000b0077ac2261248sm2143034iob.5.2023.06.22.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:31:42 -0700 (PDT)
Received: (nullmailer pid 1657355 invoked by uid 1000);
        Thu, 22 Jun 2023 14:31:40 -0000
Date:   Thu, 22 Jun 2023 08:31:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Message-ID: <20230622143140.GA1638531-robh@kernel.org>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
 <20230609155634.1495338-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609155634.1495338-3-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 09, 2023 at 05:56:34PM +0200, Miquel Raynal wrote:
> There is apparently no reasons to open-code of_device_uevent() besides:
> - The helper receives a struct device while we want to use the of_node
>   member of the struct device *parent*.
> - of_device_uevent() could not be called by modules because of a missing
>   EXPORT_SYMBOL*().
> 
> In practice, the former point is not very constraining, just calling
> of_device_uevent(dev->parent, ...) would have made the trick.
> 
> The latter point is more an observation rather than a real blocking
> point because nothing prevented of_uevent() (called by the inline
> function of_device_uevent()) to be exported to modules. In practice,
> this helper is now exported, so nothing prevent us from using
> of_device_uevent() anymore.
> 
> Let's use the core helper directly instead of open-coding it.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> ---
> 
> This patch depends on the changes performed earlier in the series under
> the drivers/of/ folder.
> ---
>  drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 4d16a3396c4a..dae589b83be1 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
>  	return strcmp(dev_name(dev), drv->name) == 0;
>  }
>  
> +/*
> + * Note that this is really only needed for backwards compatibility
> + * with libdrm, which parses this information from sysfs and will
> + * fail if it can't find the OF_FULLNAME, specifically.
> + */
>  static int host1x_device_uevent(const struct device *dev,
>  				struct kobj_uevent_env *env)
>  {
> -	struct device_node *np = dev->parent->of_node;
> -	unsigned int count = 0;
> -	struct property *p;
> -	const char *compat;
> -
> -	/*
> -	 * This duplicates most of of_device_uevent(), but the latter cannot
> -	 * be called from modules and operates on dev->of_node, which is not
> -	 * available in this case.
> -	 *
> -	 * Note that this is really only needed for backwards compatibility
> -	 * with libdrm, which parses this information from sysfs and will
> -	 * fail if it can't find the OF_FULLNAME, specifically.
> -	 */
> -	add_uevent_var(env, "OF_NAME=%pOFn", np);
> -	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
> -
> -	of_property_for_each_string(np, "compatible", p, compat) {
> -		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
> -		count++;
> -	}
> -
> -	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
> +	of_device_uevent((const struct device *)&dev->parent, env);

Why do you have the cast and the "&"?

Rob
