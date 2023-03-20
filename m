Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3C7C7618A
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Mar 2023 15:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjCTPzi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Mar 2023 11:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbjCTPy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Mar 2023 11:54:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC9F24BDD;
        Mon, 20 Mar 2023 08:45:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1435161593;
        Mon, 20 Mar 2023 15:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F402C4339C;
        Mon, 20 Mar 2023 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679327158;
        bh=naN7vYGGVLWCjR2kPZSIxwtVmyaeIFB9eQqFu3TA8Nw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OA5fKq0LDPfIHqSiT7B7jys6/bCyUxVBCoN80b72LItAJT+xQ2+ieD3dPo/KS7FQP
         QhybIzKoHGyx9vkLDRwqNXDIN9SETtLzAkvBVcFHEBKrJhBfbGjErJIccqT4u7WG8p
         NVxFF4UwkIheXKTfKitXGeui0iITJUctw0bAU3iA=
Date:   Mon, 20 Mar 2023 16:45:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sumitra Sharma <sumitraartsy@gmail.com>
Cc:     Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] Staging: nvec: Convert to_nvec_led from a macro to an
 inline function
Message-ID: <ZBh/s5lyONaF37gs@kroah.com>
References: <20230318175250.GA49618@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318175250.GA49618@sumitra.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Mar 18, 2023 at 10:52:50AM -0700, Sumitra Sharma wrote:
> Convert to_nvec_led from a macro to a static inline function, to make the
> relevant types apparent in the definition and to benefit from the type
> checking performed by the compiler at call sites.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
> 
> v2: Change patch subject and description, noted by 
> Julia Lawall <julia.lawall@inria.fr> 
> 
>  drivers/staging/nvec/nvec_paz00.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
> index 8b4da95081c8..9573ba762cdd 100644
> --- a/drivers/staging/nvec/nvec_paz00.c
> +++ b/drivers/staging/nvec/nvec_paz00.c
> @@ -14,8 +14,10 @@
>  #include <linux/platform_device.h>
>  #include "nvec.h"
>  
> -#define to_nvec_led(led_cdev) \
> -	container_of(led_cdev, struct nvec_led, cdev)
> +static inline struct nvec_led *to_nvec_led(struct led_classdev *led_cdev)
> +{
> +	return container_of(led_cdev, struct nvec_led, cdev);
> +}

There is no need for a function, or a macro, for this, as it is only
used once.  Please just open-code it in the one place it is used
instead.

thanks,

greg k-h
