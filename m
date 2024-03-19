Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61B364D4
	for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710888311; cv=none; b=GlL7ZRL2TrBb7Aa9tPCGekmihsElw00FLVBbtwHSyMmCdK15gZ7duZtgI+TRZ+JIc7QIgmX5oHooRGSrGWgRznxHbH2LR4O1WTURHyyqmPVYfClWvidilLNG6T9oQi+kHfF9F5TWTrLsEp7ghyUyM+if2En65lgVhaWBA2wc6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710888311; c=relaxed/simple;
	bh=jczcFVTaYhGigMO8m6XsP7+Z2CSGS4dJUSBbeEtzhR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anYDkEjEW40SS9eHRwzK4M5nJqHV+xEWpZ938/OuW87+hvre4rKrcw6WqqMmAMNl5NxPzRqIvdoB0V+1lBnNiuG2DGVlHVBbSjpyHXmiM4IfnDBO48KZowbpLwx8aJJjvb5iv21IQ31wCSUqIcuifV3VmwCnYGeDEG8ilanAb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIBlYZZM; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIBlYZZM"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dd161eb03afso5416561276.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710888309; x=1711493109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pQqzWk+vG/Yifue6kYN9pL804kvE+CAcl3rI2SerYrg=;
        b=yIBlYZZMV6Q3gUNAJCZ2qSB7wSaIJIqshyYXH22z6UKWpyzJeqMMV74xKwwKaYTXQp
         recwe1GOCV6QPZzFodDtBbfuQc1pdc8yKAzmIMenkXfSzCyqU+Lww4rdqrXIMzXhosqa
         4Ax3MRjWGPD4TzINZA3YJN96Cs7poEcMmmt3Mmyc3WTWAiBn60DKSdgqgOCfqTk5Qr/T
         6jX8OBI25o/5oC+DXD8UYcu8EFpUXFCo0Gq7npcL51opQEj1kg5fKE9d2jEcEnn9+t/U
         xg6o5Y15o7Mgc8LLphRJtjRvSQu0CXWdaDEyQfChQGe1dJcdD9VBs9fGE5p3cDVH2CPX
         l8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710888309; x=1711493109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQqzWk+vG/Yifue6kYN9pL804kvE+CAcl3rI2SerYrg=;
        b=wNP9rbLiXp5H5dBueJppfP7ViWewhxpqVjQ1k7/jEVVIfuUhIrqu67+oN39sFLEBVs
         pnHVDKjMDc16SFpZ04cvuDsr/ANa3amCsq8BJQWufWLOdt6/FwTfKS1MwhKd3fbBhPaN
         a0xsmp0RbyjszjDvi4cfZJx3jX1eEUmzO+8QGSk/E+1N6c+SGSqWg15pF+9hWNxDXLcU
         w3EiQyAC8Zfda6fLrivku6HmQNh4KLD4k7GG0Zs5hyq/ioWvSBcWo56R82T2WVNQwMQt
         cv2Qy3eD/7sFC/4sovk0BWyHrjM4ffkOV2A3IPwZ+snUNjiN1osFo0LPSrRkvbD0zg4f
         oeug==
X-Forwarded-Encrypted: i=1; AJvYcCUizgViLRryd7xnwyfw/wMyj5szj7B4NpfgULwOKqdJuWyjUAewf5kwo4HSZLBVoewNXHOXvd29yjynmIgzVSv3wkcHqb0+w2DGvmI=
X-Gm-Message-State: AOJu0Yxg+93NHpavtdVlupWTouti0NzficEdN155WvDAP9z087eihcee
	wxr1H0W0qn3mrky6EnXw10RArW999Phaq0DV0i48qwi/be9evIlNdO5uipiTIY8V8NHP5fnYnsn
	+pYVu2US1SOM6Dy79SNiT8YROWdRB/J4Oz0PwxA==
X-Google-Smtp-Source: AGHT+IHAZs2FKAPJJSOuCRtpl8N3osuzygCJ/ew0ONS2Wfx9/D47o8Y7hTNZXigpA+m4BsbEswZ9ChA4+j+EbdZMdiI=
X-Received: by 2002:a25:abcc:0:b0:dc6:b088:e742 with SMTP id
 v70-20020a25abcc000000b00dc6b088e742mr15020800ybi.8.1710888308713; Tue, 19
 Mar 2024 15:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
In-Reply-To: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Mar 2024 00:44:57 +0200
Message-ID: <CAA8EJpoCu5+KPJEeCSRLCgSQmTNxNsVCfP=9e4mtFaqADuuKBg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not
 optional for panels
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 22:58, Douglas Anderson <dianders@chromium.org> wrote:
>
> In response to my patch removing the "wait for HPD" logic at the
> beginning of the MSM DP transfer() callback [1], we had some debate
> about what the "This is an optional function" meant in the
> documentation of the wait_hpd_asserted() callback. Let's clarify.
>
> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> was introduced there was no great way for panel drivers to wait for
> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> could only wait for HPD if a GPIO was used. At the time, we ended up
> just saying that if we were using the "built-in" HPD signal that DP
> AUX controllers needed to wait for HPD themselves at the beginning of
> their transfer() callback. The fact that the wait for HPD at the
> beginning of transfer() was awkward/problematic was the whole reason
> wait_hpd_asserted() was added.
>
> Let's make it obvious that if a DP AUX controller implements
> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> start of their transfer() function. We'll still allow DP controllers
> to work the old way but mark it as deprecated.
>
> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I would consider changing the docs to say that implementing
> wait_hpd_asserted() is actually _required_ for any DP controllers that
> want to support eDP panels parented on the DP AUX bus. The issue is
> that one DP controller (tegra/dpaux.c, found by looking for those that
> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> this work on tegra since I also don't see any delay loop for HPD in
> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> optional and described the old/deprecated way things used to work
> before wait_hpd_asserted().
>
> Changes in v2:
> - Make it clear that panels don't need to call if HPD is a GPIO.
>
>  include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
