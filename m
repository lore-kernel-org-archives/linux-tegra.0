Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DDA199FDE
	for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935859; cv=none; b=IbQnvnOEwi3ahrZORG0qHznxWMinkR+fSBNr9IfZXX2HkIgyKaHcOzwrGa2H6RwB6fTBqeVGcLP3SuaeRHV/I1g2GD/IeoG7jQNBZbBB5muSqlnQlntOSaz/5j5BJGaTl2cLj6WiYDWIdC6MkUhelV7NmtyM0ujdDuuVJTFIRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935859; c=relaxed/simple;
	bh=KU3s6sJpBDjOPdSAnNRqs2xLSFXNnDngXBG6k3abAzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In8JJq7cwn5OtLneVqtcKGm+nz1AxS6rJAmBhQCeVkOoWDuxeKOU/Q/3JNnxFftPwHmx1si6UgdXhWdL62XhWDBhbmadlsqXweiPpPnhHrNRwvwcgYJQqy7rd2CV+WShkXe86rVGD3Mv+vhyrMKWnG3hLTCcqd3nUafz+QPKJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TR7uE+M2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TR7uE+M2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4889217e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2024 05:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935855; x=1732540655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEQ0UnPHgL8X1IzKLkITrqLzsus1TunLlu+R1N5lrJc=;
        b=TR7uE+M2FmWoYR8uEg+m17MtCFJtn2IouUftytRJHSknZFQaa7HSm0pxyzLJbdXhGK
         1j7pJAMuJhHa8dRYQi6kiL0GTD3ttQl4YTEteTCemjtGcFkXQyQQUF43LsGHSG7qTcyF
         L6RXd0FOThdcdBZI7ixRibW9bZapL71t8ItBYPd6VBnpCcDdP73quLT07WRxYi69gPT0
         AmwphaYOoXGNlubV3AxrzMVtKknjWtpPEpv/t0Ha6mXMYxQZ0eaLBR4RO66VFuJCZOgi
         JV576AW2aL++V6PA8nz+tWSMgMaZJ20i+DBfU8JWJVYnYfyBOZLeN3hE/M83XLk78x4R
         pEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935855; x=1732540655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEQ0UnPHgL8X1IzKLkITrqLzsus1TunLlu+R1N5lrJc=;
        b=sV6Jk1NK6gmp6/D8Lp7ooTKmStcOkpMe7P/3W9CZFoQYBKKjEQrFLdoSd5gy92UcdW
         xZUPc+C5+VaoeYbkcyL1mTi6k2ruVfXV16rlvMRgDcVtzXpU6jvYIL+OJNiaXZyO2+5l
         5SQ60LbCEJYg4c/KGc+TLM45cLumcv5SHH9r1pKRypJ17xhveX8MGAa+PNTfcAbEVucq
         8UR/Svv7dogiPqtTYAOm0zXLGf/wx53i2n6t+ijtG/apWM9NaSgCLgou07JHQhQg3/pE
         9oTpbOl5PAXHtWBWCoDNEDSAYX7XDrWkbCLpAx0MUDnwKojiUJ4lK22ejCeVXAFJpfyh
         KxKA==
X-Forwarded-Encrypted: i=1; AJvYcCUW6RKUQNvtL5uxSCEznRenpP1MVkM73X70rl22lXMUDXELP/yY0cMoIwuIKv4wMtJ3mqxUFdYYEtAFxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLH7JIrdKNj3H1Do9pt5QyTU1tsGWnSsBN+dwEeTi3z8Onkh1
	2cVwkny3dc7jlIri6fMVoKGa3dUrujERBX95I6ROlWPh+XboT7PImoSEXfY3PZo=
X-Google-Smtp-Source: AGHT+IGdzRCE2acExYOAR/Q1TPJs2CyZISyIMx5j4q3L/H9VxSQ26s/Ffm8H90fecvqfEbJsuGZxrw==
X-Received: by 2002:a05:6512:3e07:b0:536:55a9:caf0 with SMTP id 2adb3069b0e04-53dab25f7c9mr4511337e87.0.1731935855301;
        Mon, 18 Nov 2024 05:17:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f8cafsm1591434e87.54.2024.11.18.05.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:17:33 -0800 (PST)
Date: Mon, 18 Nov 2024 15:17:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/encoder_slave: make mode_valid accept const
 struct drm_display_mode
Message-ID: <4prwsjl7nhg4u4tgyqdmgt6am5ryewslosmbezkfmyxgh2oket@zglhp7zqhfwe>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-1-b1b523156f71@linaro.org>
 <20241117205426.GE12409@pendragon.ideasonboard.com>
 <CAA8EJpr=4AQVRKbtR2MaCQfguGW0a=3ay-ttew-mFR4f086Uyg@mail.gmail.com>
 <20241117233250.GK12409@pendragon.ideasonboard.com>
 <CAA8EJpq6Gkp4W=rGbpY6ASPgoDt=64HTFDk4_OZsTmbSUxhhGw@mail.gmail.com>
 <87plms51w4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plms51w4.fsf@intel.com>

On Mon, Nov 18, 2024 at 11:26:03AM +0200, Jani Nikula wrote:
> On Mon, 18 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Mon, 18 Nov 2024 at 01:33, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Mon, Nov 18, 2024 at 01:22:12AM +0200, Dmitry Baryshkov wrote:
> >> > On Sun, 17 Nov 2024 at 22:54, Laurent Pinchart wrote:
> >> > > On Fri, Nov 15, 2024 at 11:09:26PM +0200, Dmitry Baryshkov wrote:
> >> > > > The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> >> > > > accept const struct drm_display_mode argument. Change the mode_valid
> >> > > > callback of drm_encoder_slave to also accept const argument.
> >> > > >
> >> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > >
> >> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> > >
> >> > > On a side note, there's only two I2C slave encoder drivers left... I
> >> > > wonder if we could so something about them. The ch7006 and sil164
> >> > > drivers seem to be used by nouveau only, could they be moved to
> >> > > drivers/gpu/drm/nouveau/ ? We would move the whole drm_encoder_slave
> >> > > implementation there too, and leave it to die (or get taken out of limbo
> >> > > and fixed) with dispnv04.
> >> >
> >> > Or it might be better to switch to drm_bridge. Currently we also have
> >> > sil164 (sub)drivers in ast and i915 drivers. I don't know if there is
> >> > any common code to share or not. If there is some, it might be nice to
> >> > use common framework.
> >>
> >> That would require porting nouveau and i915 to drm_bridge. As much as
> >> I'd love to see that happening, I won't hold my breath.
> >
> > Me neither. Probably moving those two and drm_encoder_slave to nouveau
> > is really the best course for now.
> 
> Granted, the dvo part of i915 is ugly, but it's also only relevant for
> the oldest hardware i915 supports. Like 20 years old. Not sure there's
> much return on investment in big refactoring, more risk that it breaks
> without nobody noticing. Just let it be in i915?

Agreed


-- 
With best wishes
Dmitry
