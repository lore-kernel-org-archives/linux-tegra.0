Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ACB42049
	for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738156697; cv=none; b=pS4EkmSpwEF1UFIG3g1OpkyY67dtgZWGRdL57yxSr1Jvfm2jdRJvpJaNyYYw/26jdkJzbUNr5nhZ2Xi1OkFZOPSXK9nFkz0nvg3PZuu8RWJas/104fXWo8RyWhLLbil17+/Qv8QxxHF3glK5V90yp6lJsKCWRFIW5r48wXxSTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738156697; c=relaxed/simple;
	bh=3XqX4J11YN9y8rkaksX0x+FoIXwM8FEnpGRK0+mZvaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMgrHsxZmz9tBjikkPuX6xuIkibttHxMtsKeXiWY/Jml0FBnX46rTVOgeE4EkslfZMboZlAqAurRDvgIBV3IvgKNfhJT1gFs2w2bcjEFo5vDtclkIn1xjeazeGhSYA8JC/AsR8x7GughnUstmzelLvZftekS1dLis5IJEVEcGz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AWxO1NoZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AWxO1NoZ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30227c56b11so68519031fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jan 2025 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738156692; x=1738761492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=AWxO1NoZS0jzqahiSG5Odj3t/VHTDq2bVZN0ThSedY65WiPk6pbW8HOTfTDKq9KkJb
         vgPtpkif6RpEdG2W9NQS9IA1YaBcp2G5gsbi7As/+ttSv+dRubUdFzkiEN7ziVsR61rs
         iTws0Etu1IPQozkud4XSWsqNbuq5gG5hrx080fIiCUdGmTyB+hG0PFVJ3q2tQmWaimNc
         Y72jNT8bZNjQwvn2zbC1cQCz4VFZ7ijHm0zKnE+sFc4ktPPpZT48t+LYW4VUQBmvvCF9
         lo0AfqO2HiyHB5NpGVTNzsAKSXSaO7EJMlZL169dXNgTUGakQjOynlvvbRKlBMsIZWYE
         r9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156692; x=1738761492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=U4d0VAaKuFyzWtgXYdU/ROpBPgSmtHnaWtv9xv3EXgw4l9tHo3AdYQg/PsGPvKKTn4
         8kaSUSDi/VKdHSlrxzhtyMl7mI3o1zSrvrzcF3AAKdvtvOarHRYu5LRxxZbMHc9h1pU/
         0xpAUk9obfSSmobNVFiu3xoaCdKKeRuQ1ahlPOWUyBOycK0UU32gbGS03Ev9QGSXqBmq
         LHn1UHtZ4mE/KktDW3bNlhOPTuPHAO/luCWK0bVLGHdZY9fxCuQzcg/mNwDKfLhncJ9B
         07BU8kKn2LtQ+8Jda+uDMFCnrRPdtvX6HSEzaR+raB0CYHW2nPsXqTgEz7q/Yzuj6COK
         xNyA==
X-Forwarded-Encrypted: i=1; AJvYcCWTnv5IF7XFf2F9bta6f5hdmCGOSFf4Wa8IxO0sKkcPOEt+tPyWL5tbx60TAXUFjCEPrbHl3a4Qq6Umpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJoQXce0rnKQuyuDcSA0DlnJyPE4jKgOdPOupXtgiUfiYwb1sR
	yZP49dpt93b8dypO4QTUsl3ntCUHnbxhHAkdgKkzpnxlt3Iq1phcy+6GNpKL9JZfx9lDzb1NwoC
	QxHmlQcUBuQNMnbRTX8z0TgHISkywDyPnXiyTcw==
X-Gm-Gg: ASbGncvYKGJUNh2lMrkWpGljd6lPfqV3KHrs2Re/qfhO5WY0AW0+XacuJasnPBvmIN8
	OMOdKWMigtHv4HYSpRq6vLlPbFclkKwoMTqSjA81absQZ/9o0Cq5ldfbNj9l+z4bFu7H3Nee/ud
	A51LTk8p9jmLxUgKRyY+3EcAW9xmCr
X-Google-Smtp-Source: AGHT+IGFRC+m+r/a8Okn6oewxCN7IKGCsP32ORqURIUMiUOfm5o7kOj6AXMqnFWDbj2MV05dJpu5VXuc2FEJhvoxCWI=
X-Received: by 2002:a2e:be9c:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307968bfa7bmr8911111fa.3.1738156692452; Wed, 29 Jan 2025
 05:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com> <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 13:17:54 +0000
X-Gm-Features: AWEUYZktkNT_EsHcnViFnfugP1naRJeQlMuaRyszOFwlglEWr7DXeU7KaxFISbw
Message-ID: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource() usage
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anusha

On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24=
a236f620bae932c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>         struct platform_device *pdev =3D vc4_hdmi->pdev;
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         int ret;
>
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> -       if (!res)
> -               return -ENODEV;
> -
> -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -                                              resource_size(res));
> +       vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname=
(pdev,
> +                                                                       "=
hdmi");

Whilst I totally agree with this change, why was only one of the 8
instances of this pattern within this function updated? Is that a
limitation in your script?
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.=
c#L2957-L3020

  Dave

>         if (!vc4_hdmi->hdmicore_regs)
>                 return -ENOMEM;
>
>
> --
> 2.47.0
>
