Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46D3AF667
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974821; cv=none; b=WchUp9haOhaWd2nMB8z5+k17reNPERtFtpTkFcmzwPAzT9st/c8HLW0EFv0TJvLvYkCouJ9+mZhfs4tfo7k4qgapMlVy9GkltPzgpm0LdWG1OTTT2QLoCvA+oLnbTwADLgJQt8NB6m045nyRt1QFwfA+ilAAAmph5MEyF7S1PIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974821; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qy45d3ds/E2a+WYPVZVH0jsb9F/AOhcS+HnarIOvqCt8NfKSlqYPgQyGQbby+qTxHmSpu0vxt2+YvcBWEY2sK8PH/QHJLRgRKaqChpEzfUORzN8Rq442N5CkrfrEJ1oYKpcE+h1R04jYps+fc5C/PrQHQl18/qJRf+wupzxtYU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so7265281cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 00:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974817; x=1790579617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=cxr0B4mOOCZ90u9P8/84M5jQuzF2BsXCU9QG0jIBa/WYWleX3NQ7NiViTA1c5BQiz+
         +xkT/SO0NxJbUv0YZa9C0gjeVLd7ICDfNzIo6QH2c0WwQdYnJ78vhU+BUW8xTx+q/TYI
         p+T4qESZIcG2NOiNQeoWISNzSsKh/OSpwRSXIbAROtUazGKm+NnA1bFsds71Al0N/c0t
         UOWALnaH3kjpZRGXGS7ZPo8ChFttK7XeDhhDzXCIBR+eV/c+L/v3oGPf7fWGzXHLzSf/
         kDBlDsv55nxGlh+QxGG1ODErH2aznaj58vmKGnMQfTyg2i/GYa5/dGqbvkTRhyoZwe1u
         M+9w==
X-Forwarded-Encrypted: i=1; AKwUvByXuHUDf8FAm2sO/2Pv3dR1ZLG32WvfT3J+AlqH8YknrhoIY9RYkRzQ8QQBle3TMwAgvUyGc273qgSACQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n8fTQ36botAB/x2d74GdnB6boEhPpGt8m1gcdqfkkFTYhT2kGY
	dZ0jxVGn+hK0Hdk3qabs4SjTMklAFPKMb5PU5ZLlOagdx88roEPZGzaKErPpZlcw
X-Gm-Gg: AYBFou2JHNdx1uwTCkJc648arLbfQfW7nWQiETRtEkSz5DwiTfTvK4vlIq11MX6G6i1
	F7GSAeF7j6F0pH/lquM0FYpV/Yu4dNiwyitmpkMWyYZYUsSbsv+ySUjPq5/xrR8n4C3EPYj9Hrq
	/7QscjHHc6NahqOxrTWc2pQVNGEeEYvPMsu0dd3mvjVAueKhi14PM4cbNjjWC26bfdzHsvl9WPv
	e5NKBdK8ZBNk1N69JNmf9ZzLqUldaqogNOZrXWaIHE+mwNB28ZPbrMdv5L3kLURBPMsKGg2KbMZ
	w3NHTNhhW59abAiGsC/gi8tMksa8uyqajFyJ7WmBPYx3oFamN4OHpbpVFC2lEg3CzVDPLO079Zw
	O2elf/mh9kSTvSCVVuZvxqDQSQelV8yLEn4d2i7lFcc6x7MK+QLa3uVtYFF63zJRvxYk+GvKsJo
	Hr86Yl8eD7SalXn/6+gU3clot5clkvLwqmDY6sUiYCjKZ4GgjeFGpkflhR7VlkxlKJ+rF2beIl5
	wNWSRzb7BKkBhb98ZSpYzVeoMZs4fLPtccxiCQ=
X-Received: by 2002:a05:622a:480b:b0:530:3052:5257 with SMTP id d75a77b69052e-532b71fc84amr87922321cf.27.1789974817446;
        Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com. [74.125.230.235])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae511210sm57573431cf.2.2026.09.21.00.13.37
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530d0d5ae11so29063731cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 00:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqcwWU2NN75QCKesypj56/4gbOOGlJ9V/nxlmjikYvo9FCsY6T+pV9zK/sJdr9de9Hs4bg4bJn5Fna9A==@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
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

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
