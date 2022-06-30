Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F8C43334
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Jun 2022 09:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbiF3Jww (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Jun 2022 05:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiF3Jwv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jun 2022 05:52:51 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D510433B4
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jun 2022 02:52:48 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id s27so99115pga.13
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jun 2022 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=caHxsz7F+D6vKq73+2cvqFkt8HIG/x27nb53o+s7rdM=;
        b=oX0gBWP5sDuY9D493B38ptIsSqR+8mFedgXylg0HCRHCMRgoaKSyD8WXZVUjVn9R9i
         f5undUYZc7Kq0IqZMMvjJXKYwzzzkKhhkSYG92kWWQtD+ChLXriE+3XjpDB3O/kIilB4
         Ekik14nTAxmoPn5XAr8V/nisbs9LkQ3eKkN3RJec3BLBkHJxU9GWu7qj7m1a3nTtzRF7
         rVL3QMECtg8cDjN+Antq39RFIS1z45H8QoPPeG130hWCs/NbHZIm5AyB7WzJX/YnVCX4
         GuJZgdN/A6HDENCAHxhf+SnKZflRd8YDe7HHa2mVZqpizVlQUnGVXOPmLb6nOc77x71Z
         Y0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=caHxsz7F+D6vKq73+2cvqFkt8HIG/x27nb53o+s7rdM=;
        b=Cx6ncjnFWls/9CuKRoHhYnYZgw8ywwVw+fKMCrle2cvnt1ulp0s/RyCfc/cEGQAeMI
         X5x7VZxqlVAn/2Cvnbqpe26hkSXzb+JFWuUPWkTKaAigZDPaVJTbcY4uBH1SYWF30er9
         Y8XkRuPX0DHit6PL4Z5Cm9mWPlBMWFHxMt5yLHlrt6dBD2rHPzsC+KqSvIVcKkEWCR5o
         0fKc99G56SpHGR+Amyu3OScDvgrOoZsKxMW5uvsNyJUDFbEOFMSLSWiYbVH4MOvDj+dU
         WozaBpCuRPPjKRFzZ/niglyHSE/1Qcb7ff2QEZ81ENgrAlff8SmAqOnDQVVcknWQOnqr
         xyfQ==
X-Gm-Message-State: AJIora+wbZ8opGROfTqJlSfuSwuS9KM3tPFL17LIp/rQuZKg146Xhi+z
        SDA5J4KHaZHKTHfqYP55L2FzVQ==
X-Google-Smtp-Source: AGRyM1v0tiXFOdtoedN87YcN/z/p7ZOgYBDs4R7w8D71l/UKHqEv9chTQHtjKYr7zZLeMWpHki0/fQ==
X-Received: by 2002:a63:82c6:0:b0:40d:c2d8:b910 with SMTP id w189-20020a6382c6000000b0040dc2d8b910mr6927098pgd.309.1656582768190;
        Thu, 30 Jun 2022 02:52:48 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id x67-20020a628646000000b005252ab25363sm13131891pfd.206.2022.06.30.02.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 02:52:47 -0700 (PDT)
Date:   Thu, 30 Jun 2022 15:22:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/8] OPP: Allow multiple clocks for a device
Message-ID: <20220630095245.otvo53ezd4avoujw@vireshk-i7>
References: <cover.1654849214.git.viresh.kumar@linaro.org>
 <8b29fa207024dc295639f9ba52c28e45782e3baa.1654849214.git.viresh.kumar@linaro.org>
 <55623c12-dda3-613f-5bc9-80b3b6fec5f9@nvidia.com>
 <20220622141511.yzg5itkdwirpavfj@vireshk-i7>
 <40e616eb-22f9-19c2-8d77-20cd3c7c518b@nvidia.com>
 <c6f100e4-8a35-ebf0-f833-06ff0d8a2fb6@collabora.com>
 <20220630005028.fddtcbkoksbygwc5@vireshk-i7>
 <8367c38b-8cd3-cde1-5833-874769ef3350@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8367c38b-8cd3-cde1-5833-874769ef3350@collabora.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30-06-22, 12:13, Dmitry Osipenko wrote:
> On 6/30/22 03:50, Viresh Kumar wrote:
> > On 29-06-22, 21:33, Dmitry Osipenko wrote:
> >> Today I noticed that tegra30-devfreq driver now fails to probe because
> >> dev_pm_opp_find_freq_ceil() fails with -ERANGE. This patch is guilty for
> >> that. Could you please take a look?
 
> We added memory interconnect support to Tegra and since that time only
> the memory controller can drive the clock rate. All other drivers,
> including the devfreq, now issue memory bandwidth requests using ICC.
> 
> In case of the devfreq driver, it's the OPP core that makes the bw
> request using ICC.
> 
> But it's the set_freq_table() that fails [2], I see
> dev_pm_opp_get_opp_count() returns 17, which is correct, and then
> dev_pm_opp_find_freq_ceil(freq=0) returns freq=1, which shall be
> freq=12750000.

I am confused, you said earlier that it is failing with -ERANGE, but
now it is a bad freq value ?

Which one of these it is ?

The problem I see is here though, because of which I was asking you
the question earlier:

- tegra30-devfreq driver calls devm_pm_opp_of_add_table_noclk(), i.e.
  clk_count == 0.

- _read_rate() (in drivers/opp/of.c) skips reading any opp-hz
  properties if clk_count is 0.

- And so you can get -ERANGE or some other error.

Can you please see where we are failing. Also I don't see how freq can
get set to 1 currently.

-- 
viresh
