Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD11F12E9
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jan 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458504; cv=none; b=qJT4xNvXoOQm3V4nJ2fZfY++nWzpPtRrD7Ghtf2ipoaeVhrGRqlPYKZ3VdwK7sL+Gi4NhA8boX97BD5iXYR89mYdd5HTFsO5gZlfNqIt5yEvvWhcjMqGsXYmyAieHx8EiF8dtaA42N2ML14T68BMnDdR3gQ2TraxChYT1hg5tfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458504; c=relaxed/simple;
	bh=7rBsUDnZ310zkZmpLtMl2wqib1Sf/yRmyr8uhrOxaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WePuX3jbiuARiwvk62jmKXBnDzH1khVdSE0PcWLvHijCXmNqgOrCE+MfK39uhIZN7WQZJzWWyGBWn1gOAEu189hZHtqITAwuIQzs4whUBPHiiovpuBlq6AyNurH2kVxl18IqlUFL9ujbVebxyGKQ1ssMHXDJcFlfjFsF+ope1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxHQmcL7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxHQmcL7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5695753e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jan 2025 03:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737458500; x=1738063300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ccl7pK+fGoMwVya6mvoYHjlRDfdrE2si7QnLrLuVzrA=;
        b=vxHQmcL7k4+kcF9DcyGj1gyfA9r+sRZ8wnkg2RUG/jZoI4Ed22oqKXMB4wXYTTU2Jq
         rXWKsD5ey3ZxlThyzhUjMu0e9iWBQ6eipDc7hnaZPVv1awvvOmSzigjFONuqSLRE3jmG
         5+biLO86ga/gWj0lA2BrGgHt4I/QSog885uhFCi02u9YWzPkwPFshpdZvz4Cz5SF2yW5
         3cdX7Uc5jRxQyUZ/OdpS0FQ99MTHZvxZn+Yvh9+vUyCNU6Nkslsa0BsvetCyBiifuiaF
         ofpPIsCjf8RDcJnugQdsnMRpb699OA9J2IorskL7V4bo72fjLuOgBSbFaiudXLwYSXB+
         QC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458500; x=1738063300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccl7pK+fGoMwVya6mvoYHjlRDfdrE2si7QnLrLuVzrA=;
        b=iEhyiRzZ7iDgr+c7eTwq/hpwchTzxdE+5nlXr7tyP5BLgue0PQ1JwFRHnhF/FefAIE
         MnRNSfF8BgvuvQ2AGHx9VEjMOp79bcG1hZq6JmGgXzEiv69C6Vg7lAwQ8KotMNO8U7z2
         SNvqfKi0WBEH2bepBk547SWvRCW80tNa9g4XPqaUrtBB8d5xPRsDN05ZrWPTBl5iZB8H
         TgCg/PzReVHLDk5ecjZ676Eyoo02yxGgetlmcPf3T3XRI55Osf3RPAc3rg+Ra3h5FA6D
         R1TrvAs8oJy+L0tuyTgUov+q5S3hQQRGKYnCFvOJrUs0NAqjoz1b1AEU/q9+y7FjATNk
         s1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUo2wnzyB+bQGbFIBsVY7922PvpvbJkPTVK9t+iVYPo3repZt9jZBg9hM6eMj4ErwuuUo/vMelCUR+xpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNI/Yr8EJ36aCU1240tS6SULEAj6cGbh1ZHqpzlJJwEKTknG7
	D0iThMQIgbvaMPzgv6zD/DN/+Z1YVFZaGzXMbBh4O1PSqsGtoesSC3jbjOVQ7AA=
X-Gm-Gg: ASbGnctMtfB9xu8R/IUUCHHla3oXJ/99UomJN/53yEoN9LEYTW0dOUuXgumK2fRwDjs
	WrrunXi38bNYK87GD8Kcf07nAOA5pvFazALLxwQverIvY1IStna/3wgXUT3qoUfbRB6EpkqiUIP
	zqdjbnDUsDbeyFgTLkS8cA8BdGXb6fyUK/dvjA7Ml+6cdohZG84mxtcgG/+EaY5J8a6SM9KHDyC
	Mfd8iQcQxDyNwtiKkUCFVqwmbc5bMoED7gH7hZjJL8FJalL+1kNkyGDhGNxdHNor3jShGGJZL4r
	yxdCh9nG4cwGixc7MEuWD7pM6QgHFbkyIT0KtNY0nbBDq5UGRA==
X-Google-Smtp-Source: AGHT+IFYzzED8Wa2HZSUyJkmbJmRc7n+A/fvnsoklQLIV99y/1uEpOedpIlkjVzotwOAh8lDtCA/PA==
X-Received: by 2002:a05:651c:b2a:b0:300:7f87:a65 with SMTP id 38308e7fff4ca-3072cb1f9b0mr65240811fa.35.1737458499868;
        Tue, 21 Jan 2025 03:21:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a51825fsm20633711fa.111.2025.01.21.03.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:21:38 -0800 (PST)
Date: Tue, 21 Jan 2025 13:21:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
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
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
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
	linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <ak4cz6v6rjguh4jgacyu2mcfh5igtb7qwhvbvdcnfjc5hraloi@d7dwxc7v5gbo>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
 <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
 <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
 <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW-9F9aypY_XeU3y=dn3AAxjFrZO+H+=hbMF7nGrTLAQQ@mail.gmail.com>

On Tue, Jan 21, 2025 at 12:10:25PM +0100, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> CC sfr
> 
> On Tue, Jan 21, 2025 at 11:44 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Jan 7, 2025 at 12:31 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > > > While working on the generic mode_valid() implementation for the HDMI
> > > > > Connector framework I noticed that unlike other DRM objects
> > > > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > > > while obviously mode_valid() isn't expected to modify the argument.
> > > > >
> > > > > Mass-change the DRM framework code to pass const argument to that
> > > > > callback.
> > > > >
> > > > > [...]
> > > >
> > > > Applied to drm-misc-next, thanks!
> > > >
> > > > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_mode
> > > >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > > > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> > > >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > > > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
> > > >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > > > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_mode
> > > >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > > > [5/5] drm/connector: make mode_valid take a const struct drm_display_mode
> > > >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
> > >
> > > I cannot find these in drm-misc or drm-next, but they are in drm-tip?
> >
> > These are in drm-misc/drm-misc-next, the commit IDs are a part of the
> > Git history.
> >
> > > The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> > > branch 'drm-misc/drm-misc-next' into drm-tip").
> > >
> > > What am I missing?
> > > Thanks!
> >
> > It might be some kind of misinteraction between drm-misc-next vs
> > drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.
> 
> I indeed see the commit in
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/include/drm/drm_modeset_helper_vtables.h?ref_type=heads
> 
> [diving deeper]
> 
> So I missed the change from the for-linux-next to the drm-misc-next
> branch.  Hence I fetched only the former, and was using a stale
> version of the latter.
> 
> Apparently Stephen is also using the old branches for linux-next:
> 
>     drm-misc-fixes git
> https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next-fixes
>     drm-misc git
> https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next
> 
> I believe the latter should be drm-misc-next.
> Should the former be drm-misc-fixes or drm-misc-next-fixes? Or both?

No. Both branches are correct. This is how the drm-misc tree managed
development process: during the merge window (and several preceeding
weeks) the drm-misc-next branch is open for the commits. However those
commits are not targeted the forthcoming -rc1. Thus the for-linux-next
branch is diverted to point to drm-misc-next-fixes. This is all being by
the dim tool.

Respective mode_valid changes were applied too late in the cycle, so
they are not going to land into 6.14-rc1 (and are not a part of the
for-linux-next branch). Once 6.14-rc1 is released and we start working
towards 6.15, for-linux-next will again point to drm-misc-next.

-- 
With best wishes
Dmitry
