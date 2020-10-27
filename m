Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEB7C4363A
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 19:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27C1C20747
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603828479;
	bh=lcMiKA5Yrst8If+80GzYUBTLG5t51b85ovf3NjFnH5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PtReKqAWNv5ZWZxQ4hfdg0QU6kFbAYl+grd/f5oWezfXb9c2oiHY1sIjet5Nwo/xP
	 RkyVETVGfwd5B4wWovMK4w6WCysGeWYbbmge0csZ1Wb6U9iSaF/Li77bj9WZafjLdS
	 ManSoiqXTGYNzOyNhJeizeOlCVhCV8tp9Qm9DmfQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440808AbgJ0Tyi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 15:54:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41357 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391298AbgJ0Tyi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 15:54:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id l24so2707584edj.8;
        Tue, 27 Oct 2020 12:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZCGAhpdsJVa3eAjuvH5cWL4hssvzcJWIQ3OTphBFYrE=;
        b=WYirpxT3dNjh/Q8q/+69+LVufp9qA6IePQntK6lJert++iHR080HaPr5II3wLklY6w
         betICXiXR+XGjeRLeSxZgl9nDny1EV6iW95Rs6F+xQpeoZw+VLaoF9VkMV+TMRobOBwv
         NnNn1eq/3S3qtUWwgNluZTIcqhLHfRPWdyrW3CzhX+XhiQiR1iS4+wc5QfGZtRGL/Z8T
         C2B1ikvj1TmT3yv4HgBQ+OG/21rbO5z15/bsgU1X8g4MfDIzvEGMNqnUbjy0YgaAfWIu
         L+OokntUPPYUhQ3M9bj9bgEh3uq3e6i+6vAH3fnSCYcxnRgPFfgwl1W+U6RSDglwhh5g
         ZFIQ==
X-Gm-Message-State: AOAM5301TU0Xko/4K66xDVIQXJpM3ePInjQJVWhazVdblVaQOJkrUXYr
        yn+cpSbOcRuyRyFE6zeOvbIn8gI6KC3FnzYY
X-Google-Smtp-Source: ABdhPJw3svE5/sTOVYh4vGhXTB1a5RSXtrdps4snZA1JV7afPml+bYWgyx77RCLKXIpZ2mu2CHstdA==
X-Received: by 2002:aa7:d384:: with SMTP id x4mr4107222edq.105.1603828476270;
        Tue, 27 Oct 2020 12:54:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id qp17sm1586033ejb.111.2020.10.27.12.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 12:54:35 -0700 (PDT)
Date:   Tue, 27 Oct 2020 20:54:33 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201027195433.GA141784@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-5-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07, 2020 at 05:37:45PM -0700, Nicolin Chen wrote:
> According to Tegra X1 TRM, there are missing swgroups in the
> tegra210_swgroups list. So this patch adds them in bindings.
> 
> Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> TEGRA_SWGROUP_GPU (in list) as it is.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++

Thanks, applied.

Best regards,
Krzysztof

