Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F42170826
	for <linux-tegra@vger.kernel.org>; Tue, 24 Jun 2025 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792385; cv=none; b=RjIHtuxWZIkWLyeOm9sKUSQQti68ZAEFXolXdqoiq5Pe8e4a/7eDtpbx+U4GQySZFKNWSRARYPn3yGfowxREqnR7iDDTfaT/EpUDaKY2MjP3eKTFvwefuLq6gE2HJnGtVL5H8LSVoE8EP3xhQ9TjxDS/pcHW4MVGiLUfTLbNgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792385; c=relaxed/simple;
	bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6ao0m0CVJ8GlK7vD/EKkf6QyQ2DddthCOuCoEm0YMVUEJJCez+/kIa4a575C9tuXF7vMgQn6O0G/iRKc/D8ltnngBHgXvLm5PylqHeKRd2S+xlgpeqIeQ6HNZkqy3ecicsJ3sUe0OQJrhhr2uAUjt9YkPXMvfhMFwtCQaBWX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcEWnDsQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcEWnDsQ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5535652f42cso866960e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792382; x=1751397182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=EcEWnDsQfqK3E2EJB3dSSxyDt0C+Yl+uTkYLfXeSmKYzT9k+qyXXhAgorEZFjBsZLv
         Ym0ZGZOpq2VlG8WbfzGDrgNTLZRQbANcwtIMvlechN+AUTBychff0jY3NbL4GYnNZQ0v
         rbulk5r3iyvPqfnpSAYbtrosRJfLTnZrPapMuLJyWlRlB5BWE4fNwaNIpullHPyKRI9p
         ddjOhwA71dlrjBeARBDS7le5jENBtbwsuy3+p6YRBPXJ9PcpFDsGHQ+elcOna52o79B4
         HNqk3eRRco0LJE6dJPFcuSFtvtBLWk/FUBj5GoKwJs71m+U1QnwFMTJzIdTx7cA7Y0bb
         7lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792382; x=1751397182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=iI9LjGfPRPZillst3xEAPqNalyasBy9ZWCW35zVlBVwuU6PW7DhnNHOj+vr2n41vjL
         euFthMv+yfFoH6GDf/Od0I2BApdM0v7qpKePDu0d62ldC6tzfBIcYJzAvyRgQuH04xbe
         Ebu68xYN85+xshp8KtjTFU0517fyiPq7qHsUXI0T40O4zJjJZpWQHW7TYQvkHswEUhN6
         2rm852IeoIg8+iVw1rrOMjhzZEKUbmjmaDlHKiRUJisw357MVueLjKzvZZQjkQqbvFlf
         rXQlcJbbQ4vlb/XibMaGmRqZXcvnUd9OsdtnTpUD3kgSH+n4Z1UPpSYDcWHOHGPy6THw
         NxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIRq1agDCTRE+gwl3KUpVsFOfuabGBmT8wSJuq342QBQCbJxS64WtOEQW0aZx9NlobRAPQYE7uWIeYNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/n/AqpPsJFpmTOZI+Jrxdf4GdxKPj50MPtuooaBms0hH3JbA
	PdSPk6D23SD9BOMGU2/mhdEdaatwacgcpRPeIsE2hAC/xiiVhZXk+fz2gpnaOR3//71sn3/wqtU
	H8Z7jAeiy37gtu4FDk3kvgIh/DBXszXzOsvXoAwmUbw==
X-Gm-Gg: ASbGncujdbg0INtiu6rvTUFlJKAHyYOGpvn2P/+ZA0riwGTwAyTN4Q/nt5JszK4iPe/
	jMUwXJ93NqwIw2T1kq25CT2WZh6L4qLDZprDxzKGsiAwpE6MxYjAwvEObCJhS6PgE2VHPsQlPpC
	D4fTxUU2zpLQwjW22QROSHta4oUx7+qd+KiTtQLcndrbY=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com> <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
