Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A39339372
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319700; cv=none; b=pIfhKZKLRymHEFu8AodBp/qvYBfqE6fX8M2RpZEDB5waWI+Le/+tUPJIyhW7xlBJrlKL4U2Iqfmz+/KRTEcOLx6YlgZZElWWxxFNYUAXaKki4N74ynAiCVba05z8W1tUjXhnY59JWFhAr7yr9md5L/jZ5yKRU7DRho+6Hn9g5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319700; c=relaxed/simple;
	bh=DO25XK4TR1dwxV01IOu3D0FuR8NayJdrvfq6S4O6NX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCHf7XFyw0YOBVAcoujwvF97TqwfhPWPt0mIJycYnsk453bybJJVtEFyMLSqXaZfBR4uFaPS+8XyAlGNvxc1B5HN4wAsP82JtiY/boY0XjJMHcfEcJvOTWYjCCsZHrT86fNfdfOzc93MN6KRKV+6dV22xxItbyqop9lmH2JZ8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpY13xRB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpY13xRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3025B1F00A3D
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787319697;
	bh=savjDRzypaWpuMo2A7Z9mQU2Ay+uV7mKsZsDzwVuIC0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fpY13xRBJmfBoDF0Fi16I++w19fcPtMULYKneBUd0KSJbWscayXh7wqOrDgsaHm8A
	 rYs0RZEtuNJhV6ieZrtXcsGmNiIxJeCA1Ze5BtW3sxt7MWxAJceR96nKAfoDyvPTM3
	 hKtYTFI4zUytKB/tdMi46Y+xL3CDqEvevF7eOVHLmVqtp7drDbnzDb7JJrdcAlHQud
	 PScVVEgzOk78JUCsthSjeVMaZbnybWIuA0c8FxJQ4JaxP9vL7OyaSTIcUiDkpC4amX
	 31Gj6tzRjS4/x+rnIns9c/H3lMfFms2dSUzuIzSMfXr2MWdCH0RuS0qPBPW8hUWuk0
	 IxpZ3/UhF8+yg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso9505731fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 06:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXnmCmd8O4LuS9REnQBTj9GRE2Sd2p7dYE2LUO+dHWMwh4LZMLOFNAk4Pdse3g3K0FZ68TmlPK/bI8/g==@vger.kernel.org
X-Gm-Message-State: AFuF++mt2U642mAE6VMEBcjFyXQQkcrDkIf9OJnUvr/PCUvKo5GeveZ1
	Urb9nkduH+NL9HBJAd8IQBDJ0JhOEwTRX8oZeApdpYy8mtZy+GSXDBtvmiOlr4E6JNIxFqmDyvb
	ipRYjr9hS8dBcJlowJRciow27Z8V4eQk=
X-Received: by 2002:a2e:a554:0:b0:39b:a75:e8da with SMTP id
 38308e7fff4ca-3a1aeb53dfdmr17313911fa.3.1787319695666; Fri, 21 Aug 2026
 06:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239944.git.geert+renesas@glider.be> <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
In-Reply-To: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 21 Aug 2026 21:41:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v6468b2sH8uiKtdaLM+T4vw2i69SiH4uf6H3iOhvF4aCJw@mail.gmail.com>
X-Gm-Features: AcwNN1UwlPg8igVRqeTcbGzuXti5pk8Q0JsLEMMpjQ-PubogbpTOAywOmnQUcf0
Message-ID: <CAGb2v6468b2sH8uiKtdaLM+T4vw2i69SiH4uf6H3iOhvF4aCJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 6:03=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Chen-Yu Tsai <wens@kernel.org>
