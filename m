Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71415AD99
	for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713370794; cv=none; b=arusNEL+1xCmbdmbpFuc0hi8rstgaUma9RAPNN4Hu/eFAL2XgcB6xzXA2EFMWOMqtLAg6MwZ2s4hOJf4uEndO2PMMgzrvDd1eKvz8gehDt1BG2l4fgEvML5274yn9UuBiGlJqN9CoOr3Oy2QrnZ+nseaL9yQW+zH90GUb1W0x7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713370794; c=relaxed/simple;
	bh=fPxUcbghkVzBBb3O5m3J0h86wBDuD+Z0gMmR/qCLOwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9ed+pDc/sSsn0MCITbyELl4aKK4DxWvBzGIJWH7KIRoZUaZeYrKSCCEgJ+Bsdu0O3I4QMuM68orl96WnBopeRgfzLCvsTBRGdpj1acGfpl7Aaa5F7B7/6lyiugHYOwXUb/EDAkRfom0xg3GAnPVChd8xED6OvPozz5zSGCCV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kyvqRE83; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kyvqRE83"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2a28b11db68so3376616a91.2
        for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713370792; x=1713975592; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=kyvqRE83DW4jAyKNfayG2hBT3z+nH1qZs1oP1n+kltCurhL2NfeAEckvUuK7unt4f/
         XuagkCAz8n/m8G547BGhV41hpsi7jbKWFcOpGfXbknjWmE6RJMkZ9dl4+1RmU609Nj+p
         1FR4Sx86c6qNqeacFuCymCdX6AbICCdCikcNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713370792; x=1713975592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=oY/s97W99nGjLlwsuiZVLegrnhxKIFqHXUgQpjCaAYYDf15w7377U6bW0S3BFKUtVk
         KaaSWPv0V/Vr5c2JmasgCYvwnz662eSZE76Pz3rq5BJjj4RvRXhOF9qGgW1Y8JjuHnHG
         S9rS9u5JdK4YsQ38mkVNFQ5tFqcp+rVxIe67YP9CTErhWno38uY9jPVte8w7KkpnjcYs
         K01P/SDovgAbNvhYciNi7rTBae0ZVg7JY29HfBWJ5F3WpSZds5SEyIMMz7Pjqa8jrTAn
         1ls6u+lMz3PPjazheGVNl4tNJCn9heMNefzXGC+H94HQEXlHMki/UKRDl1psJ2ndYAUT
         b/8g==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0Kt+D1YqAacvkNcL9jx6o4Jnl13FeIEwdSts00EQTi3u7xL0k8uOKFxCAtm+mv15AjZostj22yq1MjiqSPjlqctzugeECD7w158=
X-Gm-Message-State: AOJu0Yx10CaMSSCbJfA06DgQ61rMfKL97zF0AA7K0ZQUxHiM52/4Y0Gl
	xAj+Nda1jUr/v30U+XpvoM0hIxwdwY0lKEmT/cnqGBqUzvTzglq2L97pt3ljxk8ydZTXaoBshVR
	EyA==
X-Google-Smtp-Source: AGHT+IHDcc1ok6h1czJw92ZBJ0NM6WrJo9fKYs4txk2scgBrwhExZPmEqIlwFMR+pbykKqpxGuWZTA==
X-Received: by 2002:a17:90a:d58a:b0:2a2:f35f:fa2d with SMTP id v10-20020a17090ad58a00b002a2f35ffa2dmr12940841pju.17.1713370792155;
        Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090a070900b002a528a1f907sm1684849pjl.56.2024.04.17.09.19.51
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 09:19:51 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e3c9300c65so50886905ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 17 Apr 2024 09:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/5NpLN63H4efHvB0nJqeXCp566armY1Y0cuwoZocxhtVAEzG6MfCKIg/Vi+G4Ognfn1SDyHZJK4oR4SoKuQXNJXnsOL0NF/ozCeU=
X-Received: by 2002:ad4:4f23:0:b0:69b:5445:6ab0 with SMTP id
 fc3-20020ad44f23000000b0069b54456ab0mr19079283qvb.46.1713370770447; Wed, 17
 Apr 2024 09:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
In-Reply-To: <20240417155112.GQ12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 17 Apr 2024 18:19:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Oleg Drokin <green@linuxhacker.ru>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > In my opinion, it's better to just ignore old warnings.
>
> I agree. Whatever checkers we enable, whatever code we test, there will
> always be false positives. A CI system needs to be able to ignore those
> false positives and only warn about new issues.

We already have support for that:
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

But it would be great if those lists were as small as possible:

- If we have a lot of warnings, two error messages can be combined and
will scape the filters
eg:
print(AAAA);
print(BBBB);
> AABBBAAB

- The filters might hide new errors if they are too broad


Most of the patches in this series are simple and make a nicer code:
Eg the non return minmax() ,
Other patches show real integer overflows.

Now that the patches are ready, let's bite the bullet and try to
reduce our technical debt.


Regards!
>
> > When code is new the warnings are going to be mostly correct.  The
> > original author is there and knows what the code does.  Someone has
> > the hardware ready to test any changes.  High value, low burden.
> >
> > When the code is old only the false positives are left.  No one is
> > testing the code.  It's low value, high burden.
> >
> > Plus it puts static checker authors in a difficult place because now
> > people have to work around our mistakes.  It creates animosity.
> >
> > Now we have to hold ourselves to a much higher standard for false
> > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > Drokin has told me previously that I spend too much time trying to
> > silence false positives instead of working on new code.  He's has a
> > point which is that actually we have limited amount of time and we have
> > to make choices about what's the most useful thing we can do.
> >
> > So what I do and what the zero day bot does is we look at warnings one
> > time and we re-review old warnings whenever a file is changed.
> >
> > Kernel developers are very good at addressing static checker warnings
> > and fixing the real issues...  People sometimes ask me to create a
> > database of warnings which I have reviewed but the answer is that
> > anything old can be ignored.  As I write this, I've had a thought that
> > instead of a database of false positives maybe we should record a
> > database of real bugs to ensure that the fixes for anything real is
> > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
