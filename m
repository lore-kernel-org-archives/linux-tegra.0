Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021D408600
	for <linux-tegra@vger.kernel.org>; Mon,  3 Aug 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761310; cv=none; b=uYD0zwu+YFRUBklJwLcJlVWZ5J0A7uSuy6R6oF4zn5WLitv6Z7zFjT8gHgBhk3Q9dkWN8WK3N2aMQa37uGibctoRUnmQv1Xv6qZfrLeHiKRx1TEwdHlVM2U53pUAiAUKXKIQKaR3eHNWjmQPpTn5aDT8f8+5LWdyFVR1j8VLnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761310; c=relaxed/simple;
	bh=Ir8txI41duHjjdUa1tYJv/Mb4slAcXRYTZiQjfKa4u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eW0o5n4Z35r02xglA2DdUzNrV0poGk+gk6/J9aLZmVJ7WvZbjb5Mh9XAARiU9smgntH9pQnWEwYj/ZTCCspxajzf9rJBdPIy0JfMjMOCpiTXAA32eGKBJx/aURHccuGOsKlhU41+LJY9DZPy3vZlZhUfC7k/+ARkHg9c9HGglNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c3a1d005c5so594881e0c.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Aug 2026 05:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761308; x=1786366108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=tToxL+7tNUCaqKw70L+ra9ImT+G5E73vkrkNW9oDHB6sZPc/HIMtd1hf6AOzkZPY97
         2v2hHbs47/8ZhUL0zPIQt27rOxR6Emh52tHz9cz+JKVi1dTJ5UxIQZ8Cd01+sr42vf/d
         +AHBDzWe4n/8IV2/AjkfhjolQRFu4WZSCpzefdH24pnWDxS83M3bCq+gbD/H0HrVv1fw
         XRn7GXm8TkqnH1Tn/THmBImJm6v99AAYxjrcxFPtMuFqdPtS6BDYld1Q8O0Tmhyuum2W
         fJvInTyWpJ1a7+q5hXSFtBxY671ycy5cGbcmKeB33s2s2h3gmOvL5AXPkrce6BOF2lQI
         QrhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/K2aYXe4l3ejVv91F26nITkgMWnHV7ESHX0BoQAJCkkvsXhLlSrgLs9BrtOn0ANiLgyvHgqzAksxdfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnetlJZJE3SUop96vuFIzVckUW0dL09c7RCZlt7y2uf4CcMqTz
	rUoXKoKqSM8wb7P4SK/jXdSg1mjS3s8fUBLeiixvhwb0inzV4AJj02Zl4Q7+aHtL
X-Gm-Gg: AR+sD13ptECeuKEnGwZyuJn8N34SxBgiqJ66KpGyTuwa4Jan2ZLa88f1uIjIcREpi6F
	v+jw/tb2LYwkr6p9sSmXobN/Pwday360Bq4vSCeun6Tnw2GxbQ7sqItize9K1F79Z7PU+gfP5Ja
	dXyQ0dLOA9WAPonfU3KpdVud/6NZaOKAVto1r46YmmXTnpBdA2uggj1UK6saKu3xVLYuMNeNMvb
	wWL2DblumjdI+Rl3kOz3NteGS0uXjA0sFYij1UeeyJgiX5W9kA+IS07sPp+12ZGDcviH8lO3Zv/
	tn4uasOXdRNbFElYgZw/oo+pInhB+7jPh66wBH1zO1EG66sbKiAKj2nPKsqYwkXu7cnJzcEwatt
	QQhXnQP6qmjAVz0rCanUFyvAhdEmr2WrVioAKoGuEjTkRePElbRK2C/4iuQDN2fROyntcKrC0Bk
	0pWG9zTlDDnGhY7b9DoxDr1QBdQcVITKdQDy/mlYPLfBT7E7TndRW0Se5pPbcXOQr1NLLrct1TD
	w1+AlR4hJUquDkjusZ/pliCYA==
X-Received: by 2002:a05:6122:c94:b0:5c2:c0de:d291 with SMTP id 71dfb90a1353d-5c3878dbb3amr3542688e0c.9.1785761307758;
        Mon, 03 Aug 2026 05:48:27 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37ee14727sm8570528e0c.18.2026.08.03.05.48.25
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:48:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73720e58dafso1619801137.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Aug 2026 05:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpG40OT7KGZ3RUXzaO8ajka0BSryU5WIONgwZQnRywtSx8uY/h/pVS+7wEEJVSoz+fr9hJClH2wdUcKTA==@vger.kernel.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
