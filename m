Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA490262FFC
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477041; cv=none; b=PfXnDvuysibbzlTNRYgcygVaft0OaSjFk/6FcPFRQYXQ8uH9/iVb/WS2JRsF5tj1OAp/ArKvJ1IoqSVjqi8sVsHRLDrDO2lLKdLGLxZuoLqHkP61L2HKo25ZVVKMje3ENpXFaj9DGIpxf6wC+U69BAUzM2SlBBk922bFEcb9uqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477041; c=relaxed/simple;
	bh=L8m+v9Mumd9PBrIoKCr6p8n/MbxpHP4z26Qvy7erVnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFX/F1eitKdszReHsXMFV8hxxGbxj4ImK/eN2IEU28j6GWwu1dZ98JbepQlls2Py17BJbU2dIFbqPm6O5Dh1tjt8VaTaX4vGxmZ1yhLr1wFuo1YW2Pkt48IvDGHFdngx46loxW2VvhohKEyOksQPtexRCcgB5gUxsAagHbuw3qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7343fb4c752so618975137.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 05:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477039; x=1783081839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qc4TavqegVrav+S2qpl9+8s6wcCSKt3nqOoGSJ8Fvk=;
        b=svUi8kVGL8j865IBBJurZNxo3jB4kzZlJ0dOGsbfxlj+bacPzdGoHkXXZP/hMF8C6G
         R1zwqDgvpBRCT6xGG/ZEPulUN5fcgE3VqlKLvJsUv++WPbbrwiISIVVQ4yW3z3vzJB69
         KbLs6DEvcshbHIzoCXlSkFWRkXoMtFYGCHKVYFyt/FlePXneCEbdXU8LWLL9FqoYrHUl
         kbuiCevWhg+obP1Hfvp7a5mhTj8o/S8Ccf2HN43CGrygOUTqUMVHmLVCK+ln2FbvQZ5r
         frPPLKWwdmXGURj6MMII7zVTwgZsOsNhpicT15mLWhby2/wkR9LR1vYkCFkHo0NJhL3i
         YvUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZkHMy+/nbDkAW1xx0uBkspf2HgwEFwuUKwALQXx30A3bDwqijkhRJw76MJC+YhEvC923hSzEx4wctGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hKOPpM91rTbLxM4pLPgTHIUzjA5crHYGfPK7sAtNouCZvtY6
	yapVngR2AK29E+cxR2hMEtiJ3hsSxJElXFME99ytRnNbJTrd2abl8/YKCPBmxzYq
X-Gm-Gg: AfdE7cksMXugHvVDhOZJ11QXc/Nk0dW+iNrdZF6WhlDQxqig3jTIJKa1TsTzMoLr2N6
	JK6vtcXc/fiu3A0qF/JjSm53YOLyXHJhp3yqpgfi5sJTDP6f2ABsPsmW4DRmVzEHIF4c3G19K8h
	GKl1y7+QGERIHh2htycxlvIhB8mD3/e+NoPq3dPezH3AbIwz6wYFJ7zVV1kpGCHMhfuUXBv+s9Q
	1ct1s+nTv5MjvUwM6Cr1PpWdY3j/IRY2koT0BLoGdWclTNh8utTj4dJxBWQXY/iDWifrqRDwW7T
	iqyYlCvDZo0vqpUv6voMauanZGPWL+7k4XkWKvofw8VHe6WLIC7FaOalpUc+9UuljbFhx/gf/+m
	mxJRn7gZl/rdgY2qejPMW8lfeWqB0uyXFiRjw8F8wcIcnL6HJ29/eG+1NalsYhzPu+8mOnDuQkx
	qatls0C0vRjDEt9gZsBha0s2vmiTGXPmWWpNwIV+Ezao2hkiKvkw==
X-Received: by 2002:a05:6102:6897:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-73433e3dc7emr3437175137.2.1782477038920;
        Fri, 26 Jun 2026 05:30:38 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-735697bcbf4sm1029819137.7.2026.06.26.05.30.37
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-735f73287e2so169041137.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 05:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwKr6aA1aw0B7eQtbZl3QWizac1G38mYZF1srlbhN7NFrFeIjIufqKEPoashil2HEm8TMMW1vmloP2tA==@vger.kernel.org
X-Received: by 2002:a05:6102:5491:b0:631:4580:6a46 with SMTP id
 ada2fe7eead31-73435b90f5fmr3476500137.17.1782477036873; Fri, 26 Jun 2026
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com> <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-7-47178be927b4@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 14:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
X-Gm-Features: AVVi8Cc1rFvCNNORSHDtFmL_tkYQ91oxJ5vGSfmmYwanPmDM2yIyJwQSJ-fX378
Message-ID: <CAMuHMdV+BDLjuhVo5fyHxSEibW8E4opXbaDrgsmTgygXXJoATA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: Convert to new media
 orientation definitions
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
	Richard Acayan <mailingradian@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jun 2026 at 14:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the renesas device trees to use the new
> definitions.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
