Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5468422334
	for <linux-tegra@vger.kernel.org>; Mon,  8 Jul 2024 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720472242; cv=none; b=qvX4CAJEFh4v6zmMMWSD2w9ynbN5eZjfd153SjHzWkP1PqCvIh524tbYJTwPsGpKyiA+omI6WRU3iVqu2jbESpncUk9vsN9o6l1iJhEkHPrRgQ4N9mdXefUVDzEn7rPZH/GSte52Db2YKyeesHRo94wbLRWjmSbZ/Rc1t1g1fJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720472242; c=relaxed/simple;
	bh=NH2r/X8iV4qDEMmn+x38kpLhuWVZfY0ai+grUTUcP2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QV8wo6pswz2Laucv/Vkd83OvnUds7OFoZMVH2uM0Fw2Nz1TlyzlfVvrN7WYwB4o0sMfDJ3Z2cfMkI2YK9jvFGH9qARewC5VDvkyYdUGGA9CzpDhBV/creRJG0bmAgeIMKQHZrei+V2NhIwJBuunSvE3tJJHEv5OOZqJlz1wSh84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E/k3570U; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E/k3570U"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-447e3a64aa1so10723451cf.2
        for <linux-tegra@vger.kernel.org>; Mon, 08 Jul 2024 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720472238; x=1721077038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3bRIc+iREACl7d76GifVlBEhZSKcdfkiZIocigdrSs=;
        b=E/k3570UybUu2K1h+c3FtPbtkX1yHuU2sS6nL5j2GWZtE+sv+WxW21H/1nyFSMkpWw
         l3EiD3GV4XxY3EZlWUIfUcbf8YzZ+6I4/I/X2263K99VyyPcbEKrYnuPMGT3mpCg9Rhu
         q/waNjhHJkDx/V1Pp1eaZOCDQgpy6vJe8SyVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720472238; x=1721077038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3bRIc+iREACl7d76GifVlBEhZSKcdfkiZIocigdrSs=;
        b=Ul0sZYh7SxJAL4zbNXCvPnrAAi7EvocQoTG5GBCREUEgCIuaZcdn7IyUpY+/APLUc+
         6eRApmBe6xnV1CyG8clk46U0sOGdx4rNzF+yjmt02504XrMqCQGBDbhhaesmhLD3HQwX
         mHruPDHfZRFVE+z8wFABVJpqDTu/H6HYOVGw6n7dCSk2UcsiZCOsbve7X4Y1xpPAzzku
         X1Bx+O4sU+VHoHLLnF+cU4WYxAyaU+C8OmQJeCyhwxHLdoWa7gg+e3/gYLJKCjGZITPl
         mv8DeIz80sALnpMl3kh/O+uK211AkrGZwN88OoGqXZfOkiHJ371KzzWzC6Bkn63dJlD4
         gKcw==
X-Forwarded-Encrypted: i=1; AJvYcCVXGVhD3o+UHctsIGnI9rnmVGnK153WgmOl+XCvZCPE0KXuC2rmOAG/cIHE5XT9jtUcrdmw3h8YOrdAOQwJRhqKbcZeCfWJxx9e+bw=
X-Gm-Message-State: AOJu0YybvqWndL6yze1FySuMnyZ60uGKY77TS8oO3BD5tAYYjgxKGS5a
	fuXIF0I/1yD6YuW55dWsyWQ0KElFsdyda5OG749sCAUlCclYD56ZPP7tUYJwrKUBNZj/URZsUl0
	=
X-Google-Smtp-Source: AGHT+IE2UbmwjWYBX2ufbWGubhDKFISUs1yahpbZegW+C03Kq3/EfqcstgYRe6L9+yqceDmrygLFPQ==
X-Received: by 2002:a05:622a:3:b0:447:f361:e2ec with SMTP id d75a77b69052e-447faaf7262mr9408711cf.68.1720472237905;
        Mon, 08 Jul 2024 13:57:17 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b59356sm3165361cf.46.2024.07.08.13.57.16
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 13:57:17 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-447dabd9562so96081cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 08 Jul 2024 13:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPbOnnBrFCuAnOK6t/JzKqE9+0YbO3o9fP2wCL9sVWT93Lt1W//lD6BftkgSFE7iULxhQvAouMlyYLZ01IohXTlnhbpx5Nokb3xCU=
X-Received: by 2002:ac8:7f4e:0:b0:447:e76a:c04b with SMTP id
 d75a77b69052e-447fb2f9b6dmr1122301cf.10.1720472236373; Mon, 08 Jul 2024
 13:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152336.v2.3.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid> <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
In-Reply-To: <D2ALRV4G5SZF.229WKTA9B95QN@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 13:57:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xs16yXRDURfW_7QA_t4nZhOmpPXiibsLs2BBzJr_h+4Q@mail.gmail.com>
Message-ID: <CAD=FV=Xs16yXRDURfW_7QA_t4nZhOmpPXiibsLs2BBzJr_h+4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/tegra: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 26, 2024 at 11:58=E2=80=AFPM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Thu Jun 13, 2024 at 12:23 AM CEST, Douglas Anderson wrote:
> > Based on grepping through the source code this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > time. Among other things, this means that if a panel is in use that it
> > won't be cleanly powered off at system shutdown time.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case
> > of OS shutdown/restart comes straight out of the kernel doc "driver
> > instance overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > This commit is only compile-time tested.
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/tegra/drm.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Pushed this one to drm-misc-next:

[3/8] drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
      commit: bc5846d3d3dff9f057e2897a736b51584785da30
