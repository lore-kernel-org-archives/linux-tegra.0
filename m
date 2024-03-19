Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2658100
	for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710879432; cv=none; b=dQU4ttvcaL2X+7ZOLqnBuGitXTAHEBdYFA4YyoNuUdTA+7eMhuUZjLVco9Gwv2CpQOHt9cz4ow/vWHB8bwfSZBBE/1/JXBAkusFmy/5oRDLQ002PiuTjxeA/18cfFqM5cE5MTrOq3EHlDNemtuYJ4CVIfnpV3cNlOq0uR5lmB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710879432; c=relaxed/simple;
	bh=fia7gnVGNYqtKozcVJDTNzlXpptiYQrxgCj9++vzkSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGeo/uH0RQFmAgCmmqOnkVbrPrC8hklctQLbEFCArzqIPyguYX1Yw91kjKrmaOuBFL/1UWvOkygKVjaoX5uQAHsnQYso+3kBC2m4E7VmO8Ry+m67pB359r2NVmmVpS3z5vCvNPIzdZL0YCzfFmsLnqx3+w64ir5iCySmk+tfNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5DVOuPP; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5DVOuPP"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so4803930276.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710879429; x=1711484229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntBkxE8u7HkxjCR8+UuIisU7oJnwNIoRXftVVWpOYDk=;
        b=e5DVOuPPBmmMbERjafcVqFQ/cS0pXJz/HWAopf6gtZKimG6fxKwLuuKrQ8yOi7aGgP
         DXFCncMt4C3px1WPs06Zi/5f48zBPbT1DdddrZyJPpjK5sUA1IY2Rj8UZ8hwWnWyyfhs
         LSfXJlJtxMVc+G+lmMYOEBeGThjAent0CIFxGuawCItGiZBohtcYFpMvnPnOpigLunkL
         PcL0tzoExBychOTem2l/a0dTekgYYp+6D01DKDR3xxmY1hNjemlQFsynhOvO7TzKNMEN
         3iZEyQWKp3YALdzMP3S//lSiOjxCHKsmg/xDfaIkIUrz2o/uavK4AabYLHaDrZ8Zd5Jz
         cxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710879429; x=1711484229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntBkxE8u7HkxjCR8+UuIisU7oJnwNIoRXftVVWpOYDk=;
        b=JH9UhBW2ZHyZ+i0DMeYf9Okyyfq7T6tupdVhuJMZmN1tnfUTeao1PoLlYlDPptWkj3
         9J5FBDYTQDT6W+kLEgkhhx8ZDxqvjF8tHBKQiLV33VAsX4F3wP1L5C5AnMTAkq910dNL
         jzhHA9gINziQGU4aBMDR+6YXJv5F/4PEcNUfNXO5dfb8qXkvmE5mh5tjgG5MD2rRzpaF
         HqqYh8i6OSkVdMQHnWxfljswMD9XJqxYCNQ7YtojxQ1JWsyU6xbQQyWYE3U7FPMkLycx
         i+3mmpoqPVHhjxN0cgAm5WcbzfdNK8vVHvA638M64gP9BEy/FPbq7vAapsK2Cy3T82Iq
         SWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM/BWk3OKuix5gWqNTelIfBLQbOeyFdosQv+E7vOD0r3uvQs/Y7GCccu19cE5PrtuxZWSl+KpvxqDYC2t2ZVTrWRkFEoEtCiGPdqw=
X-Gm-Message-State: AOJu0Yx5iGKddmTxQlwsPAWppwFL1u8hu09XUFY0cgZB9pZ+JJ/9MA2B
	Jvo5gHaIa8IMpREnkPU4oavvM/7KgJ5QPHL0QzDVLy8kRq5d6hOfBzt1fTKQgi9I/xM0FxR9FBZ
	zRB4lEzImroO13qVBAPXz9eqcUkPuCWsFbYtjgg==
X-Google-Smtp-Source: AGHT+IEC/8S1XzuUKIBHjwDEDs8hk7UZGlIr94dUBwWzeRONeAMI2NjyFhWsw04j3Py1cbxTRJVG16YKQF+I2sp93wo=
X-Received: by 2002:a25:c8c5:0:b0:dcc:1c6c:430d with SMTP id
 y188-20020a25c8c5000000b00dcc1c6c430dmr40218ybf.12.1710879429158; Tue, 19 Mar
 2024 13:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com> <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
In-Reply-To: <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 22:16:58 +0200
Message-ID: <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 21:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 11:35 AM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 20:15, Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> In response to my patch removing the "wait for HPD" logic at the
> >> beginning of the MSM DP transfer() callback [1], we had some debate
> >> about what the "This is an optional function" meant in the
> >> documentation of the wait_hpd_asserted() callback. Let's clarify.
> >>
> >> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
> >> was introduced there was no great way for panel drivers to wait for
> >> HPD in the case that the "built-in" HPD signal was used. Panel drivers
> >> could only wait for HPD if a GPIO was used. At the time, we ended up
> >> just saying that if we were using the "built-in" HPD signal that DP
> >> AUX controllers needed to wait for HPD themselves at the beginning of
> >> their transfer() callback. The fact that the wait for HPD at the
> >> beginning of transfer() was awkward/problematic was the whole reason
> >> wait_hpd_asserted() was added.
> >>
> >> Let's make it obvious that if a DP AUX controller implements
> >> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
> >> start of their transfer() function. We'll still allow DP controllers
> >> to work the old way but mark it as deprecated.
> >>
> >> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
> >>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >> I would consider changing the docs to say that implementing
> >> wait_hpd_asserted() is actually _required_ for any DP controllers that
> >> want to support eDP panels parented on the DP AUX bus. The issue is
> >> that one DP controller (tegra/dpaux.c, found by looking for those that
> >> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
> >> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
> >> this work on tegra since I also don't see any delay loop for HPD in
> >> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
> >> optional and described the old/deprecated way things used to work
> >> before wait_hpd_asserted().
> >>
> >>   include/drm/display/drm_dp_helper.h | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index a62fcd051d4d..b170efa1f5d2 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -422,7 +422,13 @@ struct drm_dp_aux {
> >>           * @wait_hpd_asserted: wait for HPD to be asserted
> >>           *
> >>           * This is mainly useful for eDP panels drivers to wait for an eDP
> >> -        * panel to finish powering on. This is an optional function.
> >> +        * panel to finish powering on. It is optional for DP AUX controllers
> >> +        * to implement this function but required for DP AUX endpoints (panel
> >> +        * drivers) to call it after powering up but before doing AUX transfers.
> >> +        * If a DP AUX controller does not implement this function then it
> >> +        * may still support eDP panels that use the AUX controller's built-in
> >> +        * HPD signal by implementing a long wait for HPD in the transfer()
> >> +        * callback, though this is deprecated.
> >
> > It doesn't cover a valid case when the panel driver handles HPD signal
> > on its own.
> >
>
> This doc is only for wait_for_hpd_asserted(). If panel driver handles
> HPD signal on its own, this will not be called. Do we need a doc for that?

This comment declares that this callback must be called by the panel
driver: '...but required for DP AUX endpoints [...] to call it after
powering up but before doing AUX transfers.'

If we were to follow documentation changes from this patch, we'd have
to patch panel-edp to always call wait_for_hpd_asserted, even if HPD
GPIO is used. However this is not correct from my POV.

> >>           *
> >>           * This function will efficiently wait for the HPD signal to be
> >>           * asserted. The `wait_us` parameter that is passed in says that we
> >> --
> >> 2.44.0.291.gc1ea87d7ee-goog
> >>
> >
> >



-- 
With best wishes
Dmitry
