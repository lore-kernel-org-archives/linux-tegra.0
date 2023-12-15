Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C2D46BC
	for <linux-tegra@vger.kernel.org>; Fri, 15 Dec 2023 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3/2cvaV"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50c222a022dso223379e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702613670; x=1703218470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZT5Clbd+TL1qy1Ok5aQ+R0ZiHvTh19qz+YLPiH5Yos=;
        b=b3/2cvaVzQPqMjMYbi+wE2iHy2L1XAPjqJqjOto1ceCQXG9hcajIICP1Md3W7QUmEP
         PgjyqBq1n+rIJ5KW7qsL+2SKY4OtPTak1JARiTk47t0tqDrwAuEzan85+Pzll+UCXbQP
         +gwyZVksUcJjYbcz+FC62+pixnScUOrs7u1d6vuRdt6fuFx5aXYNOI5EeyWGzxw2eWxH
         +DZkSpnE4QrN/z5HvZKul3l7ePN5yKE2q2AYhmZioeKzjWIjtKHMvl8dYlZkry6gWFlN
         HuMzJlk+KGdKHm40zsLL3e8YeSvX+99093GufvJUTN1y3DP/CmYzKtlHOUyxf8AIxeRa
         XCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702613670; x=1703218470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZT5Clbd+TL1qy1Ok5aQ+R0ZiHvTh19qz+YLPiH5Yos=;
        b=teL6MyF1/xnefpMvip51N3Yf0exzUeXPrO77qCd1z1inVRWmrLF66xcyij5aVo6DOo
         JExCXyXFcx+QzMEphjuSnGBgagU8STOpcE/hVFA/4A/Ff1FCe63rngKGZ+0IHIDK7RiZ
         xhZLLq8ZHk6krykI0mdJkhHA0cwci6xjZKAX1v5qrSWBWrpC8YThgUiMpnCnX2kcudYM
         BFMTu1htuFrmbmrNKdKM9pUEyylOFpbu5Ce5AQoIVYCGxNOyXC4jyklqToGLNlKI29eC
         6Tgevb9LTFI+9j0goVnGnRkSm6gVZomm2TeWm2vQQFAVbXuxxq8m1OT9eRw7d25/JBun
         jVGQ==
X-Gm-Message-State: AOJu0Yy2WITnMAe/IRxkNE0d1dM5WVt0fFezRqgejgnW8bPNVjeZ/5sD
	QNQPi7TytfcEiIHY1+2Pqz42KlpTt/5e9Oob65s=
X-Google-Smtp-Source: AGHT+IER+OaTyBjmvbwvNtLscaknwdV3+tfRSlB7WgGdkXEcj7c+05RcAmTRhJwsKFNmMGOk8UbUcc+DHHYMN/xgeMY=
X-Received: by 2002:a05:6512:55c:b0:50e:1ea8:f3f9 with SMTP id
 h28-20020a056512055c00b0050e1ea8f3f9mr94652lfl.107.1702613669734; Thu, 14 Dec
 2023 20:14:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208104653.1917055-1-thierry.reding@gmail.com> <7887037c-9fe4-4121-9280-58b3cceaa3e8@nvidia.com>
In-Reply-To: <7887037c-9fe4-4121-9280-58b3cceaa3e8@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 15 Dec 2023 14:14:17 +1000
Message-ID: <CAPM=9tzWFt5QNDrLeLpUrPfOUQzq3iSfaFYH_Si7ycmTE_h79Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fixup gk20a instobj hierarchy
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, linux-tegra@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 19:26, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
>
> On 08/12/2023 10:46, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Commit 12c9b05da918 ("drm/nouveau/imem: support allocations not
> > preserved across suspend") uses container_of() to cast from struct
> > nvkm_memory to struct nvkm_instobj, assuming that all instance objects
> > are derived from struct nvkm_instobj. For the gk20a family that's not
> > the case and they are derived from struct nvkm_memory instead. This
> > causes some subtle data corruption (nvkm_instobj.preserve ends up
> > mapping to gk20a_instobj.vaddr) that causes a NULL pointer dereference
> > in gk20a_instobj_acquire_iommu() (and possibly elsewhere) and also
> > prevents suspend/resume from working.
> >
> > Fix this by making struct gk20a_instobj derive from struct nvkm_instobj
> > instead.
> >
> > Fixes: 12c9b05da918 ("drm/nouveau/imem: support allocations not preserved across suspend")
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>

I've applied this to drm-fixes.

Dave.
