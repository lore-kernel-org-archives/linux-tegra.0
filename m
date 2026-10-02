Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7974EB859
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955655; cv=none; b=cAEdgYRUsiTd073HMl8F6c35NutFHXWdbw2BfZWLYrdCgH0Z8mhCeIWoKNnNrSnjpVbNiQtz0gw5CaHCwdsxstQv5GJdId93pivByGiuW6vXzgsiOR6qDU48ExV9imjU3ZvPDSPT5TdLB/rRx2nPfCVfnZ5XP3+Pxb05Rh3sM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955655; c=relaxed/simple;
	bh=WQsDDSMUZRhlskhbuefNaU/oDZmoaAVqCqR5bHZT1Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB7AfReIycwd6McEFbDgBSbTY9kN2mnLaDwUJHb0OVfiifrW3DYp6mvSnZez+hn948sE4l1mpAQmk13k23ii64BTcJr/Rms23wn1fLPmIX6w9uhHnKweMaSdASiufxnHYo4v8sJ6gRgRRLQpXD7GLzy1F7nAOtY8W5o6ZCQ5+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZO9v/rA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ozPpu/jX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZO9v/rA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ozPpu/jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
	b=FZO9v/rAn4UaEvJRHny4YEhKKBHnl5oMo31kpcu/VqegrioRt3sgH54ZUriRlMdADTCCFi
	twVtGXqvk+mKL+//E9xugJvOidMW4pcPM+mrgkIQUy2EjgfCs1ww/d1EAYx9AxSRfes80X
	o+yLddwbKV229/Kv08h7BR3MCRbnK3c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-JwC4EF_lOSGoxv8YkfKYUg-1; Fri, 02 Oct 2026 11:40:18 -0400
X-MC-Unique: JwC4EF_lOSGoxv8YkfKYUg-1
X-Mimecast-MFC-AGG-ID: JwC4EF_lOSGoxv8YkfKYUg_1790955617
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53390e79a19so27470701cf.0
        for <linux-tegra@vger.kernel.org>; Fri, 02 Oct 2026 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955617; x=1791560417; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
        b=ozPpu/jXAzZIo0zu/9LK+ICU9zXJodlaZQRzNX5FgATAdHaZ+qAvKmTF6t9jvZfiJ9
         AHmLMmZ6SmPxUhguGshnF08hBOW7KGWy1OVge8CKnRpdkHpUs3J9Zw5U0EhYXfIXZQc9
         iRCvbwKgvrEZts/PrfR5k8R9TjKm5lvrdXwtn5rddK9pQ85cjiTOKzHchZn7MZTlSvCQ
         UpVf6Fbk+JFqhc9u7WML8faX1PukOsM8jJvIEF7M8zQVho6PbRJNrgkS41rljzFHo/ZF
         0MGK5budA4AJFsXKlr1Lpbh+mamOjcfaEWVjU8e6SCBuHWYWyw0vC8dEOp/SiCPJEbgh
         m6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955617; x=1791560417;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiiS057kpBWsJD1BtMWJm5EOfNc4H/UurY52kp0eYCc=;
        b=GcHrYQmmBvKn7hEO9qAILuz/qZdDaItc59WtckLTmYnYfPQoJwq5V4XZmzTpyr825t
         h9FNUGpzcbNqv+6gy/EwhbXtn6jqAY82L3k7eRpWNm+M44OJF9nwL8ofSncMoFYKeeVs
         wvyVxjygggr/+QCGmaEMptKf3upjF5NsXlwAE94DoLq+mrx2xtiO5f7rTgZ3N0qonq+1
         iyBJe4hwnc1bs186muXw6mgQmrC9+oX8CA39/FBBusdo0OnnSg2wU8CZmneeDAQJoycR
         DFovJXDpFSihIpdeXUkmPHuDg2RKGZ7DtpUWUOqGcda06Ro/N474vAIjYLggSkX8iNBs
         oCwg==
X-Forwarded-Encrypted: i=1; AKwUvBzorjO+ALrQHI8cUrJEa7qGyCx+3CIuAEOHglA+gijN20GLimm0B7DHVeFmMI+hm4oobdYTygbRmlhGeA==@vger.kernel.org
X-Gm-Message-State: AFuF++lVqBvYPtl/iGdVLT1FAlgxEuGw4P1mEn+OtIj+KRx+uVu0G/Ap
	PUb25W+xhchXNTfaAEDUeLVZlXZ0/AgOlda8wejwQRmIyADVT9ruy2Ncbks/Xw0jzda07xb513X
	TmhRXigvWY2/dvrQsfbcRo2yt+U/5XLVxCd30Njh524wXX7rZA/FgzY3KRDh3KfD0
X-Gm-Gg: AYBFou10bVmLAvs881y7oUssBgzguyp3Fhm6wQw4kFaqHWV2JCuXjJA/4LipHh0No8b
	yMPcg3dFGEHcpRKvCHpx3emixlpoE9IWKgxdiCIVSP1iZ3+ir+H9d6dJicd4Qpc6T3ew3pDbVVO
	sluVs/E4pdS1/4WwW01SRLA+Jl6+o/n9puTZrekY87da0nPjF0YLti+MbctE/5fl4g/eLChpH/U
	ZnKwjgw5h0sxSPnMYvMQ0NS8n51xCpLDhELODjDwm9qL+ytyJkVt4rha9JUme6k4f3mr+bZAQU9
	8oBhYaWYYu8M19ID//Q4euGjf/kWHhMD/Wruu/T7J79pli5FQt8ap9uAqf2HFVYjmjc56DJcEMk
	2kREQ9FGiz0omi95ybX32qrn35D9Vw8hdgVQ=
X-Received: by 2002:a05:622a:250e:b0:532:ab93:1400 with SMTP id d75a77b69052e-533bc662ddamr53425641cf.5.1790955617364;
        Fri, 02 Oct 2026 08:40:17 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:532:ab93:1400 with SMTP id d75a77b69052e-533bc662ddamr53425041cf.5.1790955616765;
        Fri, 02 Oct 2026 08:40:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d438ccsm28817651cf.30.2026.10.02.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:40:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:40:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
Message-ID: <ar_QXessqHKkVAHi@redhat.com>
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Mikko,

On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> CLK_MIPI_CAL on Tegra114 is a plain clock gate with no source mux; the
> fixed parent is PLL_P_OUT3, which is specified to run at 72 MHz. The
> clock driver currently registers the gate with clk_m as its parent, so
> the clock framework never enables PLL_P_OUT3 when MIPI_CAL is enabled,
> and reports the wrong rate for it.
> 
> Register the gate with pll_p_out3 as its parent. Also drop
> CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> 72 MHz so we shouldn't change the rate.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Should there be a Fixes tag? I see that Thierry made a change to this
same clock 11 years ago:

commit 07314fc108e195044c074f4b443974b5aaa2d5d7
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Apr 8 16:48:26 2015 +0200

    clk: tegra: Special-case mipi-cal parent on Tegra114
    
    Starting with Tegra124, the mipi-cal clock uses the 72 MHz clock as its
    source. On Tegra114 this clock's parent was clk_m, so it is the one-off
    chip.

Brian


> ---
>  drivers/clk/tegra/clk-tegra114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index f1bca81b7776..97f5500b13b5 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1050,8 +1050,8 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  				    &emc_lock);
>  	clks[TEGRA114_CLK_MC] = clk;
>  
> -	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
> -					     CLK_SET_RATE_PARENT, 56,
> +	clk = tegra_clk_register_periph_gate("mipi-cal", "pll_p_out3", 0,
> +					     clk_base, 0, 56,
>  					     periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_MIPI_CAL] = clk;
>  
> 
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66
> 

