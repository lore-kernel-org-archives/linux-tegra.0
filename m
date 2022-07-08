Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FC6C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 08:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237736AbiGHIOE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 04:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237733AbiGHIOD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 04:14:03 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B67271BCD
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 01:14:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 73so6343471pgb.10
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dl82gz8QjmANwna+I20UXlrSEeJ1+WO2UZanVzGM0so=;
        b=CZSXGcFDCZp9VbC5FmUr5/iPgXLOqnr+60QCezEU4A5g7VFUwLtvbvGa8psin8X/fE
         h1+wvf1+Wt1N/lOwTpaiF5YioutMWPJrueOuIoSV/+yXTurxCWx4ReXRFrpJPtQGxdDN
         aE6V7tWwwf9DV8sbReSdtVvCtMNBzAURZtL4em3QL5If7q/g19Lu+vhAAgOAS0vS/bQB
         QGnJI8M+V8YNTCzT4ObD8fvL3fUicj6stZainTO4eD/gQ5xoqKUdPR5T40Y1ZlUq8Kwx
         Zc7iYB8p67fW0y8LhnGzb0zwfY0/vRE7p8NCzgaczoUtVGHVjFENmXdvz6uFvKXLDcwA
         sSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dl82gz8QjmANwna+I20UXlrSEeJ1+WO2UZanVzGM0so=;
        b=aYKm6S/7aS/MAGkuI5BggwJxYFXQA94JFqCx2ClrINKzfWTztynlq2rtHtKbjQmut5
         RGoQqEJoRx8FvujeTG9dHjVMmA9InGYy3yXe/AFV1AzHRwlMgRUvEMlW6JJoUcqio5Wx
         Z/aM3paY33YWLI0OIg5WCjdKSYeOTnVBDjuma4rgAbAPGuQt9GAl61Wta734hB/3MKXy
         DAj+9FTFM9F2Lwmysz9hBugiD3Gc2+vEDJyHqVsivXdItjCpEkhoowNgKdAtw7Ha28Mo
         qmE2miQgRUzXCeDgvghkYba8XeV1LDtQt6Icy2g9N+ICQ8YLP0zNGzLTq7mef5atdD+X
         84UA==
X-Gm-Message-State: AJIora8nhdVKeubvutrnApTaFT6KO1RyTVZ24DWxDHOXbGa6zjLQi5Mf
        mB4OMEObL5ck355nQ7QLfO152w==
X-Google-Smtp-Source: AGRyM1u1VL9RI6muZTqV+yjUK0SBUkQP4Hy/5vLre7Pmw0+rdutvZOufYdaMHzt147Jc8SA1X+QKkQ==
X-Received: by 2002:a05:6a00:22cb:b0:525:ba83:559a with SMTP id f11-20020a056a0022cb00b00525ba83559amr2760170pfj.54.1657268041108;
        Fri, 08 Jul 2022 01:14:01 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b0016bfbd99f64sm5766698plk.118.2022.07.08.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 01:14:00 -0700 (PDT)
Date:   Fri, 8 Jul 2022 13:43:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 00/13] OPP: Add support for multiple clocks*
Message-ID: <20220708081358.o4ozv5qwf5xpqpb5@vireshk-i7>
References: <cover.1657003420.git.viresh.kumar@linaro.org>
 <d557bbd0-2afb-12dc-1287-1aeb44ef55f5@collabora.com>
 <20220708071926.zehurtbcf35s5tv6@vireshk-i7>
 <8c52e1d2-6c6d-9a09-e426-e5292f68a3f0@collabora.com>
 <f018df81-e51d-ce4f-f10a-65ea25db48e9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f018df81-e51d-ce4f-f10a-65ea25db48e9@collabora.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08-07-22, 10:30, Dmitry Osipenko wrote:
> BTW, maybe we should consider to start adding kselftests for OPP, like
> clk framework did. That will be handy to have given that it's not easy
> to test the whole OPP core without having specific devices.

After being regularly bitten by such issues, I added some for cpufreq
earlier. Its time that I invest some time for OPP core too I think :)

I don't know though when I will be able to find time for that :(

-- 
viresh
