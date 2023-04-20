Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300B1C77B73
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Apr 2023 15:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjDTPdj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Apr 2023 11:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjDTPdi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Apr 2023 11:33:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A761988
        for <linux-tegra@vger.kernel.org>; Thu, 20 Apr 2023 08:33:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3023a56048bso357940f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 20 Apr 2023 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682004810; x=1684596810;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0abtiB/aHhrDR7QdF1aM8Dd//j8mWq0AuKn6qMdj88=;
        b=I2LAugDuCJuSk61OFoS8FY5Slcy6UsR3s+NuRR4uD0UiGla75DEy2KEfkCkcJt3A1D
         BaeUfgEejRpp96QuFZM/QP0IPOIMJ6niDTunlPuygoLnbjuKaMjyxxpoPizQbUKxKzLK
         8UKuBGw/ltlw9ahYHwrsWEOAbNCyNqLDDZz2xCDtqRHhWKTO7HReGwUTejd0m1R9c95W
         QOqJo9YJXUTXJ6WoAfk1/utV63wP07yhvL2MT18krFbq9pLY+dkN4XguHoxFxFLAtYb7
         irbUI9dKP/B1nAMfG6hmAHg7k36qggAEJ433qw57xcxZbjvcsbhHl4xHco3b48yw14sg
         HPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682004810; x=1684596810;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0abtiB/aHhrDR7QdF1aM8Dd//j8mWq0AuKn6qMdj88=;
        b=LJxigPxaUmVsdF8TqVV3+36hi0ktHGqZG+Wt5Z+0VQkLNQ0achhb9WHlAx+BCSS9Sr
         WG33xhO0fNUIqrYLTjPxQ596hfMS0Mnt1D/XWl6WguPKuaTOW75wewXmf4XHt/oHKlGw
         qU2BqSq4Fq6DKL21KAmEtz0Fw22PR9i/4NHylqcD7fBKisJx4RKkgIHz+BDWPFjQbpkM
         ForYlc8EMxNrmYbFoX2aihxtNf583HRylpNRs/NEZgCOv5WgF+xaq0OYyHskN+rZVwPh
         mvQNcn7c9vK0wMIJq1tmrxJz6BYAfBVT6041dC1PQRshaqwtXgSvzBzuypg0XAh+BCPC
         rimQ==
X-Gm-Message-State: AAQBX9fINMITSsWoITC+Y7WVJgoOQrQCbfGJmKDPZCw5Tq5dG9axm40G
        0+gIxaJMwMyFKa8+3W7H0vZJ5mYm9PwPe0oTSA5qGw==
X-Google-Smtp-Source: AKy350aKQn9FMaL24BNAT0iN/pj3mhU1a8hSmnwt2jqDaJP7j0Ujm0T2iGPKP4+qjfzdRVzMS4Rx4w==
X-Received: by 2002:a05:6000:1289:b0:2ce:ae05:4436 with SMTP id f9-20020a056000128900b002ceae054436mr1556159wrx.41.1682004810184;
        Thu, 20 Apr 2023 08:33:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s1-20020adff801000000b00300aee6c9cesm2259979wrp.20.2023.04.20.08.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 08:33:28 -0700 (PDT)
Date:   Thu, 20 Apr 2023 18:33:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     nkristam@nvidia.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] usb: gadget: Add UDC driver for tegra XUSB device mode
 controller
Message-ID: <082799e5-253b-4116-a427-5fc7a4522aaa@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Nagarjuna Kristam,

This is a semi-automatic email about new static checker warnings.

The patch 49db427232fe: "usb: gadget: Add UDC driver for tegra XUSB
device mode controller" from Oct 18, 2019, leads to the following
Smatch complaint:

    drivers/usb/gadget/udc/tegra-xudc.c:2683 tegra_xudc_handle_transfer_completion()
    warn: variable dereferenced before check 'ep->desc' (see line 2681)

drivers/usb/gadget/udc/tegra-xudc.c
  2680	
  2681			tegra_xudc_req_done(ep, req, 0);
                                            ^^
ep->desc gets dereferenced inside the function.

  2682	
  2683			if (ep->desc && usb_endpoint_xfer_control(ep->desc))
                            ^^^^^^^^
So this check is too late.  Hopefully, the NULL check can be deleted?

  2684				tegra_xudc_ep0_req_done(xudc);
  2685	

regards,
dan carpenter
