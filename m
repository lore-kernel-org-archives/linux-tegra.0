Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3AE537FF;
	Fri, 14 Feb 2025 01:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739497240; cv=none; b=HhN0d24jM74QjtsR1lpXGMSCU7GK44eVLgntoDJ6N/Lj2xJNadSYKMXIly796JfrHYV6em58oDN6a4Oeljjb4J/e6qE8IIYkYHF1aMm3lejIWeOM/oT88XckFlQXWK75vaKobRNmjA239eagzOrg6JV4vCla8JM5g5H1sJhqMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739497240; c=relaxed/simple;
	bh=dv3enzOJg9KrTvdJom9BJbupSXYAXAmFW/cVbpJiE5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rebPp7Gb7++5bJaljEtxpmBxT3FNrKVkaFn1WOJA0V5NFAkzcXaK+WZ88AiPznF9EcXrcMtVVhU+lecIJuR4w8hFLa/+4jcsuqMJTt2GPB0hBWdCGR65jS7JAc3g3havsNxtdyKS5tq90AosVM9EhSZNG8u82Qo+kItoNlnnVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLs7PX2j; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLs7PX2j"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2bc685be295so264535fac.3;
        Thu, 13 Feb 2025 17:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739497238; x=1740102038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
        b=hLs7PX2jmB1qRSitdeY921C2+0uVkd7sHWl8xjpGy1oQI4khfUG2Yl9TAY9UPoYKO/
         rLg4Fqi1nTzKyquCSg6zs6nX+329Kuy59d397q4iklETP/IGIxaxMicDcNCW3wbeN1X4
         3/50ADw+EJje1AKokIuxZliKeM6vsihBkJ9BSbhcxU/KX37c/jVtlGjNkwv7wZN2SoeE
         HOzkhH2ysv4Ll+MhWHRRFaefQNu/EWRaUo+6KTdkOc+27fQGEMQcO7c+EdxfGOGmn8WO
         U7BQVuNT23afRKXTtAR6Xt8apXOHzSk5qzaGJlmknPZLcEeSD1RtSJSCrJGM8vl0Xvhh
         y0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739497238; x=1740102038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
        b=ng2s/o5zQlrXyd/EzLKZsfnLMRdPrFKepwZq9ZLDZpfxjXAvLM4PrNxjm0IYr3bMmn
         ZwBCmrOr50Z1l/z0qdyIVplGDVeNE53ZNyriKrmwXOZ1EFcg9OpO9ZIlUfdChKgcJQX2
         uLniwyssmfgM1m77nuxo01QMacM2J4WmBDLwGgzPGnzDOg0AGSWK3K2gUEBPvar36CpI
         oNS+HDJ3I/Ngtzt553A1Y14GLMWeDizlNNbUJs/QBi8ZGlzQh1owN3oi8PzmOqidqZ09
         8lG2RwBwqfV+liGNirUZGmSZ/TSc0pr5p1BJDYWtlgq9rf4qomwqkK0VzDL8wp3Y4pxM
         KKPw==
X-Forwarded-Encrypted: i=1; AJvYcCU5xzviclH3KHDQ4ntjwBdHheFLEDXBIXjGDhVFDt8jWwKqKL1btqHo0dIJa00c2NAoJFgk3AJi6pM=@vger.kernel.org, AJvYcCVP5GDESpT7oqA28K7Dstjt45L4cCxFs1ChGBOXep2aK33PqFVXJFshy05wVPKfRevvX9x3cPJFBNObW4Au@vger.kernel.org, AJvYcCWS7ZPYgVvKZkpeFDJ177J6DEkvCES/JIklO8Q1lUvwp75y4id8PbuLskBOxKuUn+YVkgLQX3uO2KXd9jo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8/S2I6YkmBn6bv4pjYzSsZELSPLcgarzRtywgypoEn1pG7ep
	u9qxCOufl27pc9JJp/WkKwAPy9eVPPMiev6OpbWkVFBKOEB/H8B+ll7lQf+QXvr9etPQQDjl5EF
	iR+FLgjixgliXAVtpLDovn5Ch2gM=
X-Gm-Gg: ASbGnctApG7NHpS6lf+eM2bED+By/nqMVAyyH8QmKetMkqHZhopTJTD8wQwUwWjVOFg
	zvDukV/1/dF8pK8UphUa3CqN9dg121QQVXQDOt6UoL2sWByEY5Objp9TPOm/fU5H8sefXh8UHd1
	Tq22YFApr7yUDlFG+F7EuuDkSWDZ3K
X-Google-Smtp-Source: AGHT+IHaPhkpQ5sudo7SaVi7TcjcMdEkzloixKb0RO5UQ+Y460AaIBKtk0bx5VU/HVpLudsUAUuG+ituDRPvvbj3Blg=
X-Received: by 2002:a05:6870:3313:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2b8f8aaf65amr3390978fac.4.1739497238239; Thu, 13 Feb 2025
 17:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com> <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 14 Feb 2025 09:40:01 +0800
X-Gm-Features: AWEUYZmNNW2GxKBvhWTtapwmiPwzOWM-ubPmXZmO79ZpLPJrrgzjYmiy7fGvf4g
Message-ID: <CAAfSe-tNuzNCi=oR4Yv=TLRPt5jUmcozv+mtfu=PBT+6LqsHDw@mail.gmail.com>
Subject: Re: [PATCH 06/12] drm/sprd: move to devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Feb 2025 at 08:20, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> @rule_2@
> identifier res;
> expression ioremap;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource(pdev,0);
>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index cb2816985305fd19eac27413c214681a5a1e9ffa..65cd5aa1634eee5a6735ccffa4ee3979844d92ce 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -784,16 +784,9 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dpu_context *ctx = &dpu->ctx;
> -       struct resource *res;
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 dev_err(dev, "failed to map dpu registers\n");
>                 return -EFAULT;
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..1668bb4166ab0ad3812c5654244544a9caf249a6 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -901,15 +901,8 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dsi_context *ctx = &dsi->ctx;
> -       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 drm_err(dsi->drm, "failed to map dsi host registers\n");
>                 return -ENXIO;
>
> --
> 2.47.0
>
