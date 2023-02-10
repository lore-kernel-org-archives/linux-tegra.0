Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7778C636CD
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Feb 2023 12:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbjBJMcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Feb 2023 07:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjBJMcC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Feb 2023 07:32:02 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2820A34F64
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 04:32:00 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id n13so3701374wmr.4
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=457K0OQcFU+Mf/NlBJdllWWKxYfOeLEOLKqEjT+jQjg=;
        b=ishE2imgqGch/Bo9yb6+PzaIL8KrOoC824wjuHY/Aofe5uO2ORN9X7DCB//gEtIpwy
         M7g3UDPDmuZ3thsJaSRLPrZ6g5LZYT6Ogp01txJfy5+i/R1WA4TDHBXodb8YV4+B7Q2a
         iKmFxAfB/NPO/fAuRJseiYdtTdgzHhQxLw0c0YYB+bpBFlozcw05bd7jfpCuYeU30hyD
         fAo/3iAOzAKn1xtYl91wxopsNaILwVHCt/873LK/1WKX+kZI7GlagUQ6ZJKba98ZX3PJ
         XBMTXw559wKgf5LKQMtmfbfs4Zxpwd1AWy7ucKDmBHnYsAxtzO8x01jBESVdWUfvpU+X
         PhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=457K0OQcFU+Mf/NlBJdllWWKxYfOeLEOLKqEjT+jQjg=;
        b=xb304kpPgNNuhtLzwz+bLVrGvx05LPevsVsbhheJzS3IabNLEgLVpBq1ZPQ97BtzgK
         FSytHKjfVjqPZL7AazWImVs5zvoFxt0EtXKFMnNNW9EDSJECu1WjPgTzGqLO07n/1Iaz
         ss4vwMb6/9ZMAKJJOOcep1YWz++ZyeFC+Olbrqdmp4rwX15qmVI1eWirOYN9aVgYA1eR
         Vgrq2Y7jjM3ooje46zp+qQq525Myl9K+H3MJo/UTw2wYQ3wMKcuXRJjsKCiHpTGM0Ura
         hFdvTcZumBl8difbwKPhWpAxpAObBpXcNUy5JeCc88OSs8ga+HBFTSUizgne4/CP9VEd
         r6xg==
X-Gm-Message-State: AO0yUKVGmtpzOLScr2yucejNZ0LGyjrRiMiuvlku//Jk1IFs9yVQPcY8
        LsjLiLH+cYb+DCnK2ChQrEdMyg==
X-Google-Smtp-Source: AK7set8ovpVxLHos403TsEJL64cbVUGXv9tSiZl66sZgluZFqUbnuuU6j49IceJzvVVdKxy2dm4Tiw==
X-Received: by 2002:a05:600c:a695:b0:3da:1f6a:7b36 with SMTP id ip21-20020a05600ca69500b003da1f6a7b36mr16719972wmb.0.1676032318637;
        Fri, 10 Feb 2023 04:31:58 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.gmail.com with ESMTPSA id i3-20020adffc03000000b002c53d69a8easm3011056wrr.92.2023.02.10.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:31:58 -0800 (PST)
Date:   Fri, 10 Feb 2023 13:31:56 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thermal: Add support for cooling device bind/unbind
 operations
Message-ID: <20230210123156.GE175687@linaro.org>
References: <20230209163555.1993557-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209163555.1993557-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 09, 2023 at 05:35:54PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Drivers for cooling devices can implement these operations when they
> need to perform extra work at the time when a cooling device is bound to
> a given thermal zone.

The approach is not correct.

I'll react to the initial email:

Re: thermal/drivers/tegra: Getting rid of the get_thermal_instance() usage

https://lore.kernel.org/all/Y9J4WAFyXyV%2FnqlG@orome/


 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
