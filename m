Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1D2206A7
	for <linux-tegra@vger.kernel.org>; Mon,  7 Jul 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751903860; cv=none; b=BdqWkrTEbOusntODFBKACPBhOjajstB6oCil9vvViLxpEfiJJ4aZjneqM3uaonRDMPNLB76LWq880fPi0MT2qlFdtPXzccOKx2Uq2DkIejGUqaAxjfVtHBPIACieVWeiesMxIlV2XICErd8eFgxsvCqaGLdnjkbkhQR8IaGpdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751903860; c=relaxed/simple;
	bh=GekIVrGK4ewwojNX69mkqW74yj273UAIP552cTKfajc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfbMPFBn7rIcotNZJocRiOxNenp9fGU5vO61ph5DljrmTPLWDW6qmD8O2J3QTXMuT3q+VzBAkRCk01w9FYR5+iqybPNlKFQvMXa5a689dkWSD6XAgni/nUrKj6T+9I6PJkxSTY0ZfTeki+iRVg7YTC62KcCO6cqxC3aGq6Fom5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ss/AozUY; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ss/AozUY"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-710fd2d0372so32557117b3.0
        for <linux-tegra@vger.kernel.org>; Mon, 07 Jul 2025 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751903857; x=1752508657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=ss/AozUYB1urGta9L+qEj8R68XPB0ndjIlzamNIgzK0U8fu1QDy44+ED1/cyYqWlos
         nVLhQGiG4l4hlpEuv6fA06i7lgzre2MkE5UU8lVJ4ls8AJMLeh1NHoNn3CK6T4xkzBQW
         DlikNfPFumemx0klFZ3h0Gy+V3r/4d0dwPKRU3kXAADxPVkOc6FS7Xc9YQB/fQ2HdMAb
         k2xiFHzhCt0qLWLK4shdasCk4Ru7uG7GbGDImVw3qi5UX2WiL3EBP7GwbfvCsEPOYIVT
         oG0bDHjKNS0PWBbbys8Y0hnof+cb/x/5mCi1Z3ennUBp2lqHIqo/tjXVyLRxdfaGeaQ2
         vM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903857; x=1752508657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=Irmwac081gYcxT7vwLjN2BeblbUfpbkY4u4UC6wFXy0HdCNG93m9D5FVUOaE6wDHir
         Q+5omy3DPD5014meBSXBuZgDVqwdJ8AEGmAME+BHbg68g2MQyF/P9mYYVKN4OV6/DcPL
         RGB9UKryofvMQ+uhOCkGqDyRHnEmtwQWBb5qDy569uJdlOYKMZafhuSb0ra4k0ByhAqy
         8Dg1rbKUvZM8L7ZIOa0Fhq0f6EGHA9v0Dc/IWq1+7LpY4OhpbP95h5CqZX88935uO0TW
         dtecQ8xNpMkvhYeuxDDZXbMgGUMAU8VK0UbM0tRaxlSSW7Ogxz7ScKIvZWt1uf7sE5rD
         5DeA==
X-Forwarded-Encrypted: i=1; AJvYcCVcC4j2EDkaej39LnSZRCJQOoPtQdXBC+NS2t+1DsM5fPYv9NI4Wtu2Q+8g7UcKL9kdIfW3eARODXiDrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHro+k0rfJwXjX5Mo8cgXZw9wllqA/12H9eYXRLi4x2CQiV3zb
	3mJh0v34x6eMT3kMHqgN29Hy14v+UtP2Bpad2fyloU/aRr/rP5oFGerdv49e99bQO+vabHLfGWT
	dm1qLWaRwQO8DJn//wrGiE4dSpzARYdOaX2Zhq5I5mw==
X-Gm-Gg: ASbGncuMrprzdzHJs7Z5kXNlFMMZ4plIy1dCfAW7z4H9tECQgg2HOzmr14nt72jpBQn
	CTNOiPKISEe2d2ZuYE1tukaWN+2uhFljbxcGqgnielflI2xlDSVYJCcNLl+vbTNGcmzUeCNU9/s
	31mOGZ0OkhkK3kQZc3O8L/3Qq6zWWovFrjpkEg45JntybDd+aUsA68vKXJQylc/aUPbVyejMauD
	/w=
X-Google-Smtp-Source: AGHT+IGXkinsClHw9T6S8vqJyiAKqsR81bmWFSB3E1wGxVpBShaqy93Jxk6vBcBEnqP8XUAGbCaobGyW++qJmVzyqGk=
X-Received: by 2002:a05:690c:c9d:b0:712:c5f7:1eed with SMTP id
 00721157ae682-71667ecfed7mr187732797b3.16.1751903857530; Mon, 07 Jul 2025
 08:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Jul 2025 16:57:20 +0100
X-Gm-Features: Ac12FXzisPQw3Zak1z4PISdT8JVI6i-l6yfwQpDlf8066YfTihFWEfCR_f0QlqY
Message-ID: <CAPY8ntCgEb9fd_rMGeWSeR=Hbzf1GNQeSh-gRcubtwzoahqnxQ@mail.gmail.com>
Subject: Re: [PATCH 41/80] media: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, Martin Hecht <mhecht73@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nicholas Roth <nicholas@rothemail.net>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Matt Ranostay <matt@ranostay.sg>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Fend <matthias.fend@emfend.at>, Marco Felsch <m.felsch@pengutronix.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 4 Jul 2025 at 08:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
[...]
>  drivers/media/i2c/imx219.c                               | 2 --

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
