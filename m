Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E6158D81
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616607; cv=none; b=qs5WtNiub8EcBrY3hVycRRfTOQ17Gh6Fw4uc4TY86UsF3Oqcd5ZZkF2RDWwPwzTOz4xJxCe6aKjzx/b6DmVKXK64Ph1OyEVrVvZjo7ZoE+/L8cCsa6okzDIJUn2bgzBMS6MsucGi0xiuh5AAffLNSQuMhLPaTIV6RJfwIaDcykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616607; c=relaxed/simple;
	bh=CJC21CQtg+wIdlGhEd7QkrA20tFbCYIpg9WWk1ftlVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf5ZAVTs0myMU3kOa9jI28YY6d1xsnw/RRE9BM07+bh1cfd5mVCXUpkkSKA9Bz/hkTXBxdimBl7IeSLMEK4WOL2t+ptAGF49Fb/N6v98BtwG9q+Drbcoqsrs7lViK0g79DAC0fTINZNMk6nHBTHzLsMJkXXMdA1Ja/KCx/f6mdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D41cQZ8y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D41cQZ8y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365392cfafso1647559e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 Sep 2024 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616604; x=1726221404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
        b=D41cQZ8yArk5rtUXh4BhkabdlO47cxAll/06RhJddHxKiO/mrxkdOr4nUS8E5dS1nG
         80y7b9MDCqtL82GGdYMMaN0Q9mrssIHNoEDaw8gj6blwQ5n+7OPvqP/QULsIaPggebLO
         TI7ANfHgpi77dIrTECBaIXpENQspPEI6mEOuj6DKZknRni6yC1JXkSNOgczycEYOkcKG
         DDVjrIaHYcxzEdvbMbw7++kS4HMviG+XDQt0/ufu4tGekwf5jTcy3PyFI4KHx+Lvmdhm
         /jfdMxEmmJrJSaru6kJ3+gvXELTBDkVtzYeSgYrh0e8cK3oZH1yePBEHgOB/lW92+rBw
         r82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616604; x=1726221404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7X2Xh0ujGrsD7XLdOVkG1Q9uI5zUCl9XCuUp0S4dSk=;
        b=IoOj+VwH+ODFv39wLtJ+oteip8M5M6RNXKKAi968VX7t3mu3XLiuJvDQi1y+A0i0lY
         QtigIBOJd3BZnLQGmXJTWkUKlty6BRoxNZFPJMOD8oujaA+UCX2KWGMDd3+e70fxRD8y
         A0vs2DkW+uavVjSY4xSpn6ElLDWdsdgHLWLNbU5tmGM6dMKme2vz6urpOPqd+TVpsT/z
         SnCACtZSHx4m6VWMoQrq1N2YJr0AXKGdI3aND4EdIyXZhVZ8HJk9Pj3krKC084y8aZXb
         L6g3WECkiO5ByD/TulrNyxI6NPLonLkg3xDH5vAydk2k5b2DOgi8A9XQhEJXkOVNLvgQ
         NLSg==
X-Forwarded-Encrypted: i=1; AJvYcCXcOvoscMhfbWcq/++y/Qgy3UcZB3kvFfeopZT2n9JpLkDD3CQ+25sGePKad87sxjctFaSc3MoN72wksA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jCypGSyOJTBIHnaUi8PPA20xIon2du06YGuGPJg/VANK0NMK
	Q2jrRKPgkpIxsAObbrf2iN+8I48yk3MdrxS/IdOlC0WvfShz6t8OoHKaQUtH9sw=
X-Google-Smtp-Source: AGHT+IEs+f3/lMz05DgMGhdz1I0Dt2XeUWPF2srVsMsxiPAav4qFxYVkM40Qk/zvavp7We66+tgSQg==
X-Received: by 2002:a05:6512:3b8c:b0:52d:6663:5cbe with SMTP id 2adb3069b0e04-536587a67cdmr1158176e87.12.1725616603764;
        Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53657a4e071sm177209e87.13.2024.09.06.02.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:43 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de, robdclark@gmail.com, 
	sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
	marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
	jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <lzpvz4snaamzieuurwztw4s74glg7dhu6mpqpcw2apck3dbuap@76sqzcu7hmye>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-4-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-4-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:23PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 47b1be5c0f4e ("staging: imx/drm: request irq only after adding the crtc")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
