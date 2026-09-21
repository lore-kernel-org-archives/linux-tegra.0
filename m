Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879931E82E
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974362; cv=none; b=el9EjYBwkDYdBlxiRM+MkYMoFkUFaI5MsZmbrYzMx5SXyr4xm9ezQkdV9g3t6ztegSFTmpIeTmkJnVbw7Op9chw3S/Im4W9PzqxIPc3l/pB5h6gdKcN78/dtHkTp9AVfkgMTQHH7wP+rZ/rjdnhTTnrxTwSzES67I+9dTlTpC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974362; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=areIjM8w92Txwhb16e1a6cCFCE08cmZILyXrtHzUbd9lDmRwbKxRMCKxLgQxGak0lTtH/zRlkIr0ZUr8RwpbwgWOH9kCnloclm3uCO5lwADRtSZuT81ORF0lbMkAJy+lLBRWe549RlKMjZVO5zGZMSqC97VxquPLQTaYGKh2aeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7dcso953043137.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 00:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974360; x=1790579160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=1eIf76xEfYm5z8y3r45oezmdYTVJiCRVSnS8YYNLXgYDYro4XJ75P12NXSNIqmldd8
         wEh5ZZ5HIg1rzEX1cskYmKVhFYRsF5Ji8mloKOAXnd+5O7BEsG0/Ok+fVfIkdFsGgz3o
         GHw6SyupwQUgAdomOrKetzmuYYaBuuGLsUaF7FbP2vZX7P0gzqQYMHNjfuQ7YsDAuHYO
         KrhgYdhpQbdC8f+H51b+G6Xfp71Gu7T96krV/eA43l9impoM9Myy/TUVcz5oR+Od8HdK
         tJN+gCaNZyK+eRptH6twr34TB5n2m0CAHsZusvs4wyMJwgLqUj+Xd/FPtXoPuOIJavRW
         5B2w==
X-Forwarded-Encrypted: i=1; AKwUvByvWKC6iulrNVpXmxwgIyRu9WSuStq5j2royGOxt5/8cwZGfPAJAErI1nyx6+NNdaliXip6fXw6fm7mGw==@vger.kernel.org
X-Gm-Message-State: AFuF++mFDlM0tzd4ptXqj/32kmgn12v+uKLd+fseFCjxzwoMCLZmyI6Q
	A4yIIt33cnACxtrZOAiKSp2AYtTpvHI+7k8yypAoTrw8ealwggxuV4dzYy5xl4w2
X-Gm-Gg: AYBFou2t53ownWKmV7UPPQvYKfqlmbWTlGVVfCZBnNZMg1RCTLZY+kgpkFw8ymjUjUW
	wiQ/tcTCrYkHgZBEHZEdkpVcPMTatMEzYUNhK0N4cIpPo6Vd3xNt9OZBUR1i8Mab0y29fycIYOe
	ezhlgehDJ5s49PQXMM9VY4mzeFP7yAVcu0gQzgV7VZ+2J58eopNdbMAOt6Tk0FumqoQPz0UQFAG
	pTS5QYJ4CgGMNAxgCAeJpVDLgRrSE2foTR4DkY9tRX6R+M5T5dl12bm0jCfbKQnPn46x8XogGK1
	kQvxIWhqaRHnyd0/8pGj//N1Edu20i9u1NDXI9xFvX2zUO89oAI0NAz15CSZUejpEsWkwbfqJs/
	NZg07ip210Zl2D5+rkOwD9kVEistwzANXeJXCTVdLY9momAtef+97EGuI6hOZKmPMNaB5WbyBfk
	u2GL33oH2/0iAdIzC5YmYY0GpsNP4EBdTRd5OP0XeM/j+n4PVSMGXFMlms8bqD0KEH4bEGf+WzJ
	A7kcQFxu9Fw9BJnqVydPINtBTHcGTTSZmuV
X-Received: by 2002:a05:6102:424e:b0:7a6:d9d1:7e40 with SMTP id ada2fe7eead31-7a6d9d18da9mr1898612137.22.1789974359849;
        Mon, 21 Sep 2026 00:05:59 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d558c062sm7320097241.13.2026.09.21.00.05.54
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:05:56 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7856441f7d8so1411174137.0
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 00:05:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLTu5G2JNIIFAlLDci5NUwXNLIDCcyj8gR/NoSNvDHr63YGJTGitMjOhiBpQt+qpODmQ1Zfs6C9rINzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
