Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4E5FDAA
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949301; cv=none; b=EeIfR29fjtP+vhSmi2PbGXbTgInLJBCIDXNQjqvUVQOJQGNIoYEiOmaZHm1eLw8yEhisNsu1X7bHBdv2rBBtDQLtEMqx1S8DwTbe1iWdOPqkhPClPXZHxydhRYUZNj6dhyfG9lbQ+5nVcJocAO6apJlc6IiFdXh8FcXAh+bF04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949301; c=relaxed/simple;
	bh=CGmK3cb5vpPiodIQAGGbcXy9IWOMla8yFmXkx6fEXb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZm0q3I/aSzlR838Br4RrrLIeXO+K0MipY2yLEP0VaiwekerWQOQzRtc4/ZfSgUgq+Mx6pfTLeNNokTdQC6EKJezowfrnOg0jNTWgJG5xAXK4EviucncX4znzi94nTb9m1WYOMd6LI5S9OZCEddiQsBjHe3SiGSYsL2wHvHPwQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lkeq4/Zj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lkeq4/Zj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B53C433C7
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708949300;
	bh=CGmK3cb5vpPiodIQAGGbcXy9IWOMla8yFmXkx6fEXb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lkeq4/ZjvIKuSXWU4GdgsFWxWnVnCPxstYHH46Ps6nzkMosigbdK5q9hg6JBuaokE
	 /3ICU3XIwo8pLf7HUH9eNqJXU6Etr2nszZ7ICw/2pGDLUYhDv6SeAqU0AzYXMcK+3Y
	 JUL2EFNjfv6Nn8QBfjpqf8FY+BhkscDSDAnuEYqrTTh50BqKCKj9dYVpybT/o9ETLC
	 SSkYmEReQQ1XcHVM+UDmSZ+mW1mFQriVzfMRbB8RlR5NASbUNyA0jugTDsxuxq0NAO
	 OmdWCfY8pdByagO09L+BxpMXe5J+a82lASykV6xzejch/PYlaeW+kv5WeXrRTVZyCQ
	 Yo71LO6AZTYtA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-608ed07bdc5so9788157b3.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 04:08:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6YFcQyPKJQYjwJDk3pMZOIOhPLbPJlbuXU1ceOdteveFcoDNYispFNfS9udx+d5VDHK3vzrczNOmOe45f+PGxsu+1LSDOE+4yy2c=
X-Gm-Message-State: AOJu0Yzo71y2OlgtCQosRlmNgit1d7I2REbQ2aVfMobUuKarW5RAbFgd
	Uc8oOc3vTvyHkXJeW4CaiRWs0tTZQFC2gjtTdyXyqvgo2eB31lNrklds3+RXdIZsJ6K/6ZzENAj
	PKGhwIfrTWl0aDbp2rrK4VsVtWDTOgsSfVaVnFw==
X-Google-Smtp-Source: AGHT+IHeAB6njpp0OOhYsH7r9y+6wWY9Z5BETRDxuOciBdN7yiwuQsUEWB3+1RWp/dadJLAWNA7l1XzMj1PCBEhg7W4=
X-Received: by 2002:a25:bb88:0:b0:dcd:24b6:1aee with SMTP id
 y8-20020a25bb88000000b00dcd24b61aeemr3978658ybg.47.1708949300089; Mon, 26 Feb
 2024 04:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de> <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 26 Feb 2024 13:08:08 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
Message-ID: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 12:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> > Hi
> >
> > Am 23.02.24 um 16:03 schrieb Thierry Reding:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> >> not to remove any existing framebuffers in that case.
> >>
> >> v2: - add comments explaining how this situation can come about
> >>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> >>

Fixes: 6848c291a54f ("drm/aperture: Convert drivers to aperture interfaces"=
)

Maybe this is more of a philosophical question, but either the
introduction of this hardware generation is where this regression was
introduced or this possibly this commit.

Either way, I'd like to get this into the drm-misc-fixes branch.

> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > Makes sense as far as the aperture helpers are concerned.
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
>
> I believe this is drm-misc-fixes material. Since the tegra DRM will remov=
e
> simple{fb,drm} for Tegra234, even when the driver does not support displa=
y
> on that platform, leaving the system with no display output at all.
>
> Are you going to push this patch or is going to be done by Thierry?

I'm on it.

>
> > Best regards
> > Thomas
> >
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
