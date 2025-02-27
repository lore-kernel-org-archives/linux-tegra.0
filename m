Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0C1F94A;
	Thu, 27 Feb 2025 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740621164; cv=none; b=BHcFUiJ7qo9ACuuF6cMNsgQCp4z0pqd+cQ1++X6qlIfcROwQ4YKN54VkTgFu6sp/s6Zv5xtklBisbSdBE6UkqpWis4w5o0+mQ701FEWv0TyQpzNSHPUex5rVjB8jogm5XhKlcVBOzQwlctQinETUTzBa0tJAzECFpBGu2vEGT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740621164; c=relaxed/simple;
	bh=YjKKT691QN0DPGRmJjP9TtTEtKQK38mNUGvDi7DJwQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JABDbWDHgVdHYZqAPFDiakf4z2ZG0HOnWMzlu0nkNzPhmbgEdvqnQFKQRCVm+FrION8Ishg2OmztiNsbotO1gFgiYi9o9uUr07mO3llINkLU29WI7eN7aTm+YCMN9ut9UvDTOGL16SeCMavgJhS+5vG73lDdCE3rP76zfzZfXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuEyTT0v; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuEyTT0v"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fcd665af4eso121891eaf.2;
        Wed, 26 Feb 2025 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740621162; x=1741225962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
        b=UuEyTT0v8+Mk09j7UCoiPg5J7oJZrIxYJBTDJ5bM9YpyUAbE2Z/uxXhyx1QNd4Bh8I
         1X/TpEoUnVQxohtkUA5uMRqDWLFqAcUoTQ7eIH4j8fNFabOVU44wI7X2rv5rICxYRC00
         joRH9zLGRX76/d2ybBQJtkUcoZnbJdu6zMA8LjEY2m1E+qWNbFmeYIi9v/9tfdttgg5u
         /QZa/AdPqmbjThk4xRaq8n4V7+MkLA5S5Z/Q9iarnIayupwENeZ06/f52ZecS8PwTgbp
         nszg3LVVTqzbS3xDDt6GEyq577mv0sS6vSYlyjZn0qxeBk32k1NAsEUhjFumGTvC6Sf9
         6otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740621162; x=1741225962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
        b=YEGC4G0+y8s4FnRJX1iaTNRUjcG03aX8LqcukaPcYqAF4cA/BZ1pT5HpU8wbil0iR4
         1dl4j8rKjOo78t0peFmWE7/f3EkXnxQMzymEy+id5V+6DwMu/HKdpX5GZihF939+Les4
         udkt3F8ZB0+tgx3GTsDewFXoX67+DAD9NI7f87yvUWO9kANGbpPd5N4mtnH6MsxOnHfN
         raNcU7e9Ywv8hS/03rTTz89yPWJIXhH2i6EyMNB+XpygvlRzJMZqLxYtCqHyBJvnWyg8
         fa4+bCKPNIB/+VAVS6/NNMu9SxdPCrFwwZIlNHR5sTk8H/BKTLvSC62JLI1l97Yr6yxm
         PqPg==
X-Forwarded-Encrypted: i=1; AJvYcCVKqmr9pocXnstzQAgn3j0y0f6QcEq4hgliW/MqjcUyJczBKEff+Jo9HwiRm+gLA2Ah6BUKQrx8yLRJUL0=@vger.kernel.org, AJvYcCWdqYBNidbeObLlE0EpvKkGbAxKPww89z4wnpJH0fUVAXI/GkX0z7mtGm1qBiMyuUZPkvCkJtwaXpc=@vger.kernel.org, AJvYcCXYoBLS3/YVTu8iWlB4KEgJhc3XeHSBtJPEiqGBAeS0akuAGqoHyTtG6ISU0Va535qpTJzgHd9AXzlIzzSW@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6UvJFsTs0TQb2Vbul9nSm4NRzrA8bhI/v8Z3dau6gmzKO/IX
	WR+YLwtOZ7c7qklKwpwxoUhDyVIKCzB8wZmZdqfXwgMPs/Ijnu2GYOeYksbPCLdBe/EG3TS9yTI
	DLo8sMKbZvGvFaLGMJLGzJ3vAjrSHB/fpABM=
X-Gm-Gg: ASbGnctbRN8fc8w9F2Nr0PWj9NPgeDK3oh6at4rBu9YSI/yYhSL5wfrHq4zk+GPCgTL
	j/bAG0bpudEHrMdu3OaxPj8r/TayBwjIK5AiDJ+GJF/JR14cohIc9dCSREPamei4W1MmtDfEJy7
	F36YdzKpozQAWhcxuFmPEnsbtgA876GOIKoi8KRUk=
X-Google-Smtp-Source: AGHT+IGqnXgTmRNVtKjZ/iy4Us2fHmhfpIjxOOKmUbGHr3+Ih8p+w6kJGd3DiiswHNSoSt374klMkalELnpHhT8BfD0=
X-Received: by 2002:a05:6808:1513:b0:3f3:f90b:f1b3 with SMTP id
 5614622812f47-3f425a658admr16487647b6e.5.1740621162105; Wed, 26 Feb 2025
 17:52:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com> <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 27 Feb 2025 09:52:06 +0800
X-Gm-Features: AQ5f1Jo4V-x_aMe6cNu_t6bm5DyuMpmkfFoBZmOQ95iqLbLXuNwjk8JtAQUipWI
Message-ID: <CAAfSe-vGC2bA10yNRjSkLo3Y=2K8HJvssuM8qLeB=57vQk1eZg@mail.gmail.com>
Subject: Re: [PATCH RESEND 06/12] drm/sprd: move to devm_platform_ioremap_resource()
 usage
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

On Wed, 26 Feb 2025 at 06:22, Anusha Srivatsa <asrivats@redhat.com> wrote:
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

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
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
> 2.48.1
>
