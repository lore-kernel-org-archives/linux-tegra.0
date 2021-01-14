Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4CFC433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 14:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEE0F23A6C
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 14:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbhANO20 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 09:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbhANO2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 09:28:25 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BF0C0613C1
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 06:27:45 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a12so5947456wrv.8
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=stURBibHeymSTQotO4y7jVW0jLXFO/bJV0OvfHx8/Ow=;
        b=fhyQomvCom1FnwqmnHAbPTCnd0LMPSC1mqIoFA5OZ1Zgg17bwZDLU5KO1gmbEBqcIp
         YXIPhQ0GvJBZ7V4KjAkdpNk8Vbr3fPg1LUcu9POniajMxCP0erZ1u88GCrBaFhiy+FdN
         tVDBg3CRCCKH4azQ0/EPNm434Xan+AeW3X7wmtOgA31CDosXjFEBvXxYcwUw+jT9uHvJ
         /WPpe0HcdoOnSgatKDKfXg1geiL7eYH29nuVy1BmcqevKsMAOEaO5vZnZUnajjI790vs
         9EaGJwjx+uFxrvuvwjVLycDv3gsRr8yowd8eunI72m69qv1qrUNBzpNbP/lFKWbKiSIO
         3yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=stURBibHeymSTQotO4y7jVW0jLXFO/bJV0OvfHx8/Ow=;
        b=r3w/ubm62IT35ww+pIu30QntaBijFVxDWceF5qbBPR+HSOKPQsUlffAuGJJxfboPgN
         7ZzhC6oDB0v+l87ZW45zYXCPynjTFS8FZpynlS9p3yTSl7rH15JPPhBWueJSozGO8Y0F
         NHT5gHyIYuQJ6a0ULFUO4Sg3aUptB8KV84kBHxy6fU6P3RcrvRXU6oKN9rSoBKQ9U/eS
         t/eVuYes1YlvRamv/8QFAYtaM75A0CHkMh/YOxIwAlUxh8YEadX7Hoq8+kN2ouFs025y
         SngjlFBxG3L2ZMLechmnonZySViN42Y3PEJdoJVpOk5c+mwzIMqaRAhT6/xUMFGv7qyO
         HqvQ==
X-Gm-Message-State: AOAM532ILn+JFpWuJeZGsLU8YtrB8nQ1+2DaS2US76TX/UCUJ78+ZPJC
        jsHtLZEOCZOx7KBmILQ9mt408A==
X-Google-Smtp-Source: ABdhPJyXrFe2m39uAyQy2h7tZOKGTMg+Vg9rbr1bpTyqBQ3zqWU671dcf51KtVjNjgEuIROfT8ikKw==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr8085208wrs.220.1610634463919;
        Thu, 14 Jan 2021 06:27:43 -0800 (PST)
Received: from dell ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id l7sm3707755wmg.41.2021.01.14.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 06:27:43 -0800 (PST)
Date:   Thu, 14 Jan 2021 14:27:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Murphy <dmurphy@ti.com>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: mfd: Add ENE KB930 Embedded
 Controller binding
Message-ID: <20210114142741.GZ3975472@dell>
References: <20201228160547.30562-1-digetx@gmail.com>
 <20201228160547.30562-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201228160547.30562-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Dec 2020, Dmitry Osipenko wrote:

> Add binding document for the ENE KB930 Embedded Controller.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ene-kb930.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ene-kb930.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
