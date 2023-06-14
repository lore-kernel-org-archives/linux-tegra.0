Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D33EB64DB
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jun 2023 23:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236089AbjFNXe4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jun 2023 19:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbjFNXez (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jun 2023 19:34:55 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047311BE3;
        Wed, 14 Jun 2023 16:34:55 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-77797beb42dso260419739f.2;
        Wed, 14 Jun 2023 16:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686785694; x=1689377694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUtSSGVFN/yztXgk7QCaXH/KHJwVxtAYPWqGRDI7ZjQ=;
        b=gBJ9b+dVILlOBn0T4+GXCac6NNXBMDzg/MV8nvblNx+Kr4G4lVoM2eiDVyfc+xxTEf
         vyco+GNcVdZjh3+L+/bCRAiUyW4ZFnAfDfl7LQdRneyGlS73bv+Vwn921o6OmB+T89vm
         fkSd1r8wTkhOJTws/3H29Z4gjbfJLOK+OMc2jtDF3jl2SLu4svJnPP0arYFemLmr5j7E
         zcBT0llYsBrN4O7Vn40BBu4/jZJRecmU4yDLfJCrJAgaMwuL25JFNi9AkwpU3JoxDqKJ
         GYenMlupJ8FJGJjMTAVofATuPC+jObmslkT3QlaS7F5s9yz0lGwXKhMC0MiRmpK1NdCt
         ClPw==
X-Gm-Message-State: AC+VfDzf1WzamNi47JPOz4e5OayfqXiJS2RosE1qJPHBT5RfvVwg4wBv
        TlSU+kQmyOGeKQvnm+5kUQ==
X-Google-Smtp-Source: ACHHUZ6oXhegu7bEeIdTFjl2xc570z5mqCu0pw4FCI2MAW8eGDOpi2PDgUNBv3rpLuUD1XQFGvZAAg==
X-Received: by 2002:a5e:df43:0:b0:777:8e86:7702 with SMTP id g3-20020a5edf43000000b007778e867702mr15365097ioq.16.1686785694195;
        Wed, 14 Jun 2023 16:34:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r23-20020a056638101700b0041cd626ea0csm5364731jab.147.2023.06.14.16.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 16:34:53 -0700 (PDT)
Received: (nullmailer pid 3202829 invoked by uid 1000);
        Wed, 14 Jun 2023 23:34:51 -0000
Date:   Wed, 14 Jun 2023 17:34:51 -0600
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
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/2] of: module: Export of_device_uevent()
Message-ID: <20230614233451.GA3201131-robh@kernel.org>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
 <20230609155634.1495338-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609155634.1495338-2-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 09, 2023 at 05:56:33PM +0200, Miquel Raynal wrote:
> The content of of_device_uevent() is currently hardcoded in a driver
> that can be compiled as a module. Nothing prevents of_device_uevent() to
> be exported to modules, most of the other helpers in of/device.c
> actually are. The reason why this helper was not exported is because it
> has been so far only useful in drivers/base, which is built-in anyway.
> 
> With the idea of getting rid of the hardcoded implementation of
> of_device_uevent() in other places in the kernel, let's export it to GPL
> modules (very much like its cousins in the same file).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/of/device.c | 1 +
>  1 file changed, 1 insertion(+)

Assuming Thierry will pick this series up.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 0f00f1b80708..90131de6d75b 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -312,6 +312,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  	}
>  	mutex_unlock(&of_mutex);
>  }
> +EXPORT_SYMBOL_GPL(of_device_uevent);
>  
>  int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -- 
> 2.34.1
> 
