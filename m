Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB9AC77B7F
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Apr 2023 12:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbjDUMvR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Apr 2023 08:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjDUMvA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Apr 2023 08:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF69BC14D
        for <linux-tegra@vger.kernel.org>; Fri, 21 Apr 2023 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682081417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=efvIjEJR7OoLjdwxlft+BlSYZztvjk4NbwCMvuO6Nyc=;
        b=GSOiJppKiYBu8PmZHWs8S1o7Ft83YVZahmDO2O9dxGnLMCCVKaDpOO4NCjmkXb+G0EtlkY
        2ht5x6iv9vjMuHSX+69TBGL1yJytKXHeEnyNMhDEkp7OYG6nyT971j58YboI7+BwXt8bgd
        ksgrcXTg6R7LV5GdXSF5im2bB3UkLzI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-fi2Xt8wMNcqkeccWne1cLw-1; Fri, 21 Apr 2023 08:50:16 -0400
X-MC-Unique: fi2Xt8wMNcqkeccWne1cLw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-5ef6c09fa0dso10707736d6.0
        for <linux-tegra@vger.kernel.org>; Fri, 21 Apr 2023 05:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682081416; x=1684673416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efvIjEJR7OoLjdwxlft+BlSYZztvjk4NbwCMvuO6Nyc=;
        b=KBLvuEkwRByHwK0nBTLg/4KHXRdaoGesoBakYfhKCCbr2DzC0bXygJWxVo3+F9alVB
         0Gq8h6Z1uDGTPFQRfeLYKcU36kgR8rqqs1Jy3nuCHXJ1XudCnlRRIfrnZuU3xJDiR2MP
         iFEntJA2hXf2+Gw5TExiXIMjbUnxZPJbqAN3aIDYEOvCeztFCiBGKgplCLfYe7SYVo7b
         ef+DpqC8hBWgKQeHbo062Z1+PuD7kWlwg9pnHp6zUpCd06SDSZtMRUzJ+PUpccpBs1VV
         pFHb3UcJrAhKcPCQzVq9/AttFZcg+Q0iNv+nfAcrFt7XFdsQTMW7twU7NgqDCdsXAm5A
         FHFw==
X-Gm-Message-State: AAQBX9cevmjASvVWlj8Ofy3b6aqWcj9XjxAX2ejmBfsMcCE2eAdWCEDF
        R27xRTLd5uFTVVWg0E7UMLtxMCwQpsEzwxjrHy5D7vy6bZQ6tCaRJv/vx4rIxtgtUAZAw11XI4T
        /6cO2aoFgyYZDrhdCK7riFGs=
X-Received: by 2002:a05:6214:20af:b0:606:526:a828 with SMTP id 15-20020a05621420af00b006060526a828mr2230417qvd.21.1682081416170;
        Fri, 21 Apr 2023 05:50:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZGU0FBC7yj/+VzlSA+dXJ/D9lCCv5dj+6IgY8JAYV2GumyboAfhoGjHhO3ECAo7x8aO972pQ==
X-Received: by 2002:a05:6214:20af:b0:606:526:a828 with SMTP id 15-20020a05621420af00b006060526a828mr2230385qvd.21.1682081415907;
        Fri, 21 Apr 2023 05:50:15 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id c2-20020ae9ed02000000b007339c5114a9sm1295618qkg.103.2023.04.21.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 05:50:15 -0700 (PDT)
Date:   Fri, 21 Apr 2023 05:50:13 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     robh+dt@kernel.org, broonie@kernel.org, peterhuewe@gmx.de,
        jgg@ziepe.ca, jarkko@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        skomatineni@nvidia.com, ldewangan@nvidia.com
Subject: Re: [Patch V10 0/3] Tegra TPM driver with HW flow control
Message-ID: <ijhnvqkimqkpjfpiat22log3tf3eufi4aj3jscqcpwrxvfjzrz@52tl5bj2dguk>
References: <20230421091309.2672-1-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421091309.2672-1-kyarlagadda@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 21, 2023 at 02:43:06PM +0530, Krishna Yarlagadda wrote:
> TPM devices may insert wait state on last clock cycle of ADDR phase.
> For SPI controllers that support full-duplex transfers, this can be
> detected using software by reading the MISO line. For SPI controllers
> that only support half-duplex transfers, such as the Tegra QSPI, it is
> not possible to detect the wait signal from software. The QSPI
> controller in Tegra234 and Tegra241 implement hardware detection of the
> wait signal which can be enabled in the controller for TPM devices.
> 
> Add HW flow control in TIS driver and a flag in SPI data to indicate
> wait detection is required in HW. SPI controller driver determines if
> this is supported. Add HW detection in Tegra QSPI controller.
> 
> Updates in this patch set 
>  - Tegra QSPI identifies itself as half duplex.
>  - TPM TIS SPI driver skips flow control for half duplex and send
>    transfers in single message for controller to handle it.
>  - TPM device identifies as TPM device for controller to detect and
>    enable HW TPM wait poll feature.
> 
> Verified with a TPM device on Tegra241 ref board using TPM2 tools.
> 
> V10
>  - use spi_sync in place of spi_sync_locked
> V9
>  - renamed tpm spi transfer functions
> V8:
>  - fix compile warning.
> V7:
>  - updated patch description.
>  - TPM flag set in probe.
>  - minor comments.
> V6:
>  - Fix typo in chip name Tegra234.
>  - Debug logs change skipped to be sent later.
>  - Consistent usage of soc flag.
> V5:
>  - No SPI bus locking.
> V4:
>  - Split api change to different patch.
>  - Describe TPM HW flow control.
> V3:
>  - Use SPI device mode flag and SPI controller flags.
>  - Drop usage of device tree flags.
>  - Generic TPM half duplex controller handling.
>  - HW & SW flow control for TPM. Drop additional driver.
> V2:
>  - Fix dt schema errors.
> 
> Krishna Yarlagadda (3):
>   spi: Add TPM HW flow flag
>   tpm_tis-spi: Add hardware wait polling
>   spi: tegra210-quad: Enable TPM wait polling
> 
>  drivers/char/tpm/tpm_tis_spi_main.c | 91 ++++++++++++++++++++++++++++-
>  drivers/spi/spi-tegra210-quad.c     | 14 +++++
>  include/linux/spi/spi.h             | 16 ++++-
>  3 files changed, 116 insertions(+), 5 deletions(-)
> 
> -- 
> 2.17.1
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

