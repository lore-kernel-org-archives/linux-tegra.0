Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3CC2D595B
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560530; cv=pass; b=YmCAa3daleajbMnaHuYQhoWVaWFiDE+EhI0l3hZ1nY+1GJ7JEi9SUNH2xlU8pVZO2BkzfBDqlBaOObGhtu5MCrYDb9djHVkzrqErLaug34knawh7BjWzqRqV8o5s5861JbzETyzrxMi5JEyGhWqd0NfnHdOZYIStWTSKnjS6Y9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560530; c=relaxed/simple;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+cF+Pxux/mzlrTu3EDEws1M8dopwGd8bR58Cy4VphtVTEDp/N2udVgJ3y/KNqJO24RSwylH/BAb7qdWXWTy8ywZ7W5jB/7HunwozD/ryjBfweqczJemmFdHxmay4D2pXqLzgFqwHdTv2qxgBwU9ujcEStD5bvUDx6f9KFEreY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa0titk7; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa0titk7"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-456f7012050so803008fac.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=jcuyk8+JUPa8Lwjkt9xrSQjfsr+rIEW2awnjP3RdZwQyFgncTvfXtICi2yUxxvZ8PH
         1F4Zfcq1MGiP9AEB6r3WjwWA9Fm4PQieiPUSI3+LoaDnlbcXFxVsl4m5DGyAIuJWQ9Jr
         UCqIy/s6rGF4scTRd85bdpxMWgkIpaVbsHxhk9cFotbEd9qlA1kOhL5pHUZKuboSmR0u
         FUD2cw2EP5BgDIPK9RYWpw2cdIi5HVOtPIaIpsgU2qB2PUU5ujvjz6Tu/jKj9DKV67y3
         cxJ/iBJcoLEtcdcyA4Y9QjvM1j2l7PudQP7Z2qKY0J5QEJbJJ5G5hRLT0i9oUbSHF41Z
         cjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=w3zoEQ9/AZtWNMeXihEkDSOJqJgkPXF0Mow0YWdWmGw=;
        b=mAnPZlZI4s1eg5sKbspE9QmxxfUCACdN+DJfBign2oiXJ86eAxbYpjlSpvghLopDB7
         ukJbNzv/zJ4QqssDh5slMWPErAt8cVgDIvkXWQH9gp30MnpiI+IKffItydifiRf/Jfqy
         FchWcWb/5bj7NkuuCU5Xjd/TP/WIa4rQe6buTbMqUGaCH7BKAUQlLRMdwfei5mrJsQ5S
         +721o+oPnG5spQTxjx/4oN1IEnxpHNb9DBrhqwfu3WfEh6iQzuJxyicvOCEhTGeBCNOJ
         RC4azXMtMVbvgZxQ1cFxI4vuE4SCeTL9j94bR4m4jjLQFzVqIgERC95CCj4avn69mI98
         U+qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=Qa0titk7cfg9viilFM7aeV6rGktWqe7x27okTN8DPh4jDXARUYMWgxFqxEmt8YHFW+
         +Dy3mi/GxA2kDbvpK4sXRTXDMIx5qZMoh1bmYVVQnnXM7jzGCCq237bpKk0kli6zUIwC
         RgrZZlqITt9lVBKOzUieGKvb1HV/BfWBY/b/Rd9Rz1cAQ7x8FjzLslZp0N2vNpZmfJ4M
         kEbCbg6fooOpLtFBl7cVMWXd6yY/4Hm7nVfgRd7zX22de0JrbPTmGMj/gm0BRTPniOZP
         xv/19X3ArFMOQLOzuBwpydTPmof4NiCVAQjsRUDqg9jUJNUcr08+k2jKVpsfpLEJpR35
         selA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=THoZPj8sUYEh/GKyxt/uNhRetzCQ4I6KwhY2n/2NqumCllcmG+Y9UNQI9t/Dkj+haj
         hvS5ph+NRpb811bWop6AkMU7mryHg/edZpfjap79vOG1+gqozNZJGKdbGnITFhEK1/ck
         udmeossBmj1AEr/S9+Nr6H7kzGwvCmQ+5PFy7DubHMIMqAoTQQg4rKfxFAeFyDBl0YzM
         mO2UIIqTd6EgBRyfFihIHarZFW31iDRa014VOlXFBSXGy+k8qBW85Uf+j/6V8oixIzCU
         7agJkMxg+/X1EBZWJHHyE3YSOjxE5RxmUeu2qELjode2F+QprQZA4ojqfiGEmkjwt2CE
         UiXg==
X-Forwarded-Encrypted: i=1; AHgh+Rq16XpoiDXbt4+jOLgGkn9+e3+h84ZZAyUwH74LsKggn+pCSAlD2tRiLE6WgC46aHiUowJQccbozTzPkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxnFf+lYzLZQHx4mPMVClllQzYEKZwywI/P2TKGsd9hJOMALh
	1+PIhpaEKPddLnkhHlArJZ0Vb4ftns1zTUeVuepXf04uhuL/0rCtkKTSKZN3rfkUznTP7pbby8s
	38nyNZOd25YSbbsOZn3yFiB4pq3tj3fI=
X-Gm-Gg: AfdE7cl9lCDLwwKlWAhhoMivD+y6n1szBIK/HN1Wa2yXzedQxEEbyVlkmnSZ34TT9RB
	H5om9nyoiR6/iBLFRlav5CkdYJH0BT9kQyknQ0NlJJLPWJkDCR3UtWNt6Px1jfVr6FWYVNA32E/
	f9EgCexd+1Nx1/b78owWV6CuOMJZ8fYT1hJrDLMXZku8QC5umdleY9fB/QN69apqtXGlQt1890j
	kZGkyVOfWLnN7jG/KzNKx63NPJx9i7j1kTUcIsTIY0MHAiAIKCsOfVqSgf3ps9Oe7maCs/2PZqy
	iwud6Kfdys5rI8Sw87kbSK6vCdA=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
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

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo
