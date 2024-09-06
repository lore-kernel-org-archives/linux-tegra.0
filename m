Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF451C9DE9
	for <linux-tegra@vger.kernel.org>; Fri,  6 Sep 2024 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616627; cv=none; b=ChzJ3nr9E3aFEgyEimQE4h06KooDgpApSZ6L/qmWHfX8TnoGbpbloDPVpYGyrX1yd/AcKcdBDHtbLJFZITecvYi6zSmsA9bhzq5bIEqRVLVgyPbj+ZyBB2dQNuPfQwy1xwOcObUlE9t/tzzVdyAicOf12V9ZfP6756VR8oYwut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616627; c=relaxed/simple;
	bh=xGL9BcAcyOyuyKpXc+gqYMQQ6t4wlZm65AqsKYyQfUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh22Fq8tDQcU6/jJY8iKAZmCtllO3ph0Ur4eOA3gn95YoZ6YrckTTQnG1/Ai03pfNyv7ID01n14NY/ypwHlVxPJkpB2sQwVRKe0xQzapfepJGNtkFU8D5clHwJTa6nynjIJdUpFrJ2sI9gAE/s1pawe1hCuloDP3QdTTFp4g+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvh5a1pX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvh5a1pX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so20469851fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 06 Sep 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616622; x=1726221422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=gvh5a1pXejTHv2ORT1BuWfN560UCGV2Qy19dUoVnu8qY0Stc3YJNh0jTB8HyjB4oIq
         y/zb7bqZOQgaPaDBqKeWyAxWaPm5KNd1t4X1vdcOxmo6eRV2XChOPZKQKLYb9p4W0egX
         gujzZUjfRiQrk32/AB1AVBDkMiywMY2f2cwt720a2UOdpNX8mRBViD6R81/jYaFZrh7q
         M65+WuAs4OACd7xN+eftowdjPeXUZijrXKISLnPmNGzaqOvRLSwpTxXq8zhYzWgwfJRx
         SpZqLJHo/RdlW1PVVS7nulwNifHpXX0qhcWBZWsM96DXC0Am/kdkCGzwlh9QrQpzpvqC
         fwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616622; x=1726221422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
        b=xJY7KnD6QEMte9M/24M3hlS+mLo3h7AsgTv93fafvYgEuL9Tzy+0K280XBMF4TV1B5
         TbHyaSSbM94V7u7MpBAaibk9BC174kU93l6W3xRIiYlIJUnF+NQSg5CzV1ky3wm54WWk
         QUINudEiyWtCL+hygVfBOKnaG95SV9B94tNfqfcZLnaY4Psmlc5mlmnq2FaGHHkGqQ5t
         VJlz79YGGIn3E3Y7eGR5VTbyCWH8IK3Su87H8uY5GmoYTMmwVHKsrQZJQehE9R3yTFf+
         5R5WhGJgRLmM2FltVtUt8Erdui24h0Fh0nhQtOQBP5gBCKmYmeQt48MzEvemgSZcN3qB
         naMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY42kuUHxLTWRhqKDMG/2PWdYcuRCGXzFSDbQH6u/ozhZxlP8bKB9GSHVzmGbSOHXyoPzcRSmZtNssfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaCg5z44Ah9S03J2Fw1ER/G0ZB5tCK855e4SftUVnuXqJOk2d
	rqeMeKoxwjoN2tBAaC+EaJAoDyUG0gdg43m9xhdRcyaFZrHs2yJlT2+nn82yq7Y=
X-Google-Smtp-Source: AGHT+IEGmDYtTqVwK0km1mxn812DoATvPxABZpDO9jHB/O4WvGUlolGz2aw3FT50+jxS8Yg8MuE9iA==
X-Received: by 2002:a05:6512:220f:b0:52c:daa4:2f5c with SMTP id 2adb3069b0e04-536587fc818mr1075858e87.42.1725616622176;
        Fri, 06 Sep 2024 02:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356988b077sm616302e87.47.2024.09.06.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:57:01 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:57:00 +0300
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
Subject: Re: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <mwzh6et6ipet323243mga4ip5eo6jp2bxvtlzjyc2gji5kjqef@57dri4dbwser>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-2-ruanjinjie@huawei.com>

On Fri, Sep 06, 2024 at 04:23:21PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Commit subject is incorrect, otherwise LGTM

-- 
With best wishes
Dmitry
