Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210021;
	b=DOtVniRM4wddd5/eK8g8zo8YSWUnesxzKFL2XRD8e4DCQAHZQ4d5GJUdYGKiDM0feWLv
	 6WJ/479VDJRPx50NdtHLnDEVNgRRqMGrMwU4yEBTqVjBNKl1Wd5cSNRsog7kUb/pMPlOc
	 mmWhri6hu5SGl0KxmhWIChkcloelf77bPff1sChKm8f32s3NmKQlD2FoZzqzFPNud7Vvt
	 Fdi68Xdh8NmAlUNb+SFvuAvSrL75RDpDZJy/gKpN/6pIiobfzZWK5mDVY8XHvegXpNwNI
	 nbwWrk9onbcZtuf7ojq1Z8+IFbCSLfbp4hXtBbs7NdcSmQtP33apHUT/bzDWyf1KhHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=jMVXWGCzDxQVLGOWuU4w3q5YQlrrzIPqvZc3Xgx7buouQnjhCqkvTPPGWz6W1skWWJwa
	 zR3kiDXGkfBYCEilbxB0PbgLmffPB0HKeTEc99LA2yA7sZ3an+XoFKzWLurYcSG3uNHQl
	 58xAlJUMDMtJjfA1TqKhv5PP9KSdf3iJL1ye/AiMd+Chnw/nZl/pRhHb6VG3lkukzIZRz
	 SxD3SSnSSapfksYAhM3OS7UyNtSLvbu3av4jHYwcyc4iERwAjq6SPLmbSUiy0nrLbq44d
	 gcI7SPYR4/6SU7XjhbBkn53BtEU/ltHOKTKepPW+8COzBaJfE0rdXYl3ZJYgpjIeIZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E026606A338
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E026606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so228662a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=EGY6iEy/v8arlcI6FUwAHsLy+WJEL+rq2y/0GjwfTekqEXrXghFb1mOzkShFsS3Qdz
         BslMT/WnPsTKg/z6mbj7U7KbQ+VfcM+EqSGh1pESuek1sLtbFCH/btMdqla3S2Uu3SXZ
         wF4vQQi2ceuAvOa5yMsY5O8d6Pst1O8HV0mRShT7PDIOX5bDE/wxhSHoNAzyuIa4EFoM
         zp9ed3kR6nKKkXxKQ5A0OPnt3c0gnWlky3c5cyz7gOQq8UwSwuBSAUlFwkWXApW5Haq1
         +5JOUk11BOKaQTQJ9eMtTKKiOYkh159Mbztk/8+hnYKzwpp5/T5ISECuIQSCAorbOgjK
         SjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=zcPpTKDPHSZ8Xt0NwI7d7O8gCakEcmmgClpCRbYhNiU=;
        b=Ld0+voT8ByfCwe7W0lXzBxcjgZjdBQClpSyLYCrskxz1JbHT6W/s9DYnWIlTlHEm3O
         QiZW83A/SSX1uTId2Cg1mvjf7InL3oPC3LIvW7JQma8VqwuWj92juICyU2Z5JfPcj7MN
         /EVdJ6Cj/xwzPh1RiKuZgiohID1N2n2uvRYCIzwFT1AvdQnSo5N1na8jTm2dxSrNE46D
         JjQovlq8CQwF0tcr3uPSNn1ychF29gIDHPpVOz+UrLMK2612FIPfFwSjcXlE/6I3fP7r
         l/xk9pUQFPS08loZ59C4ffJTPrCoCGO020T0YvuWdgpi7BYok9UHHU+h3x28QobpxlW4
         qtew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=OhIviiY9odsSnYy5R6KdwCeM74H9q1f/CfZTNcTG+WmMDV2M1qNOnGoEvzdaSdmiU6
         vUOH2xA+Q/Fowt8i9DI/iXqorwJeu1yt8iij8SmwkTJArm8nJ+WC+NrTzPGGa52TU+HA
         Z29WT4oj0V5enZ83Ghwyp2hBJ2Qi7b56Mbxml+noer/5OyGpOaDWX7j/KwwSmyb2otK1
         RWnoHzoFrAuJMdfepwNxNkwwVE8RQrqCNu1KR+5K2tQxf2YVJg5zKqAXD6AMd1RYnjSP
         PhHCkPE4NpDJwHQVBOYD6G34x6Ayz9gJtjyYTKq63FfmGfv1qMrx61GlSfrsbCGiCFsb
         Xv0w==
X-Forwarded-Encrypted: i=1; AL+hErGWH86inlTbLzsRhefJZZb86oS9ix3vB6yox3xOUcHK6t6gVYRL4jijExF15l+12sxdcO1AOFFLK54/Cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zB8zW+AXoYbkYXY7lne2J+zdnaQax+4MM069sms+i7A8M9aqt
	D7u4WY0G4o0iP4tme8wJGVORq9uu8cVF/iD3lSUeNo275W3kRFylNlvAGkI5NJeV+qkjMlpblXC
	nh0gJQT27AI94Wxj3E/Mi5UUz+/DkHng=
X-Gm-Gg: AYBFou3RAQMC+0z2oe1NqLnFKZvCoB2IJfJBqBRyMNe9FEOo8tWsU7b7EyX/0S5UEdy
	GjlbBQoXSrerOxedyG7IhFFdQyuefPjBLNLPrtItOk9/q3hXJ6Xhp8MzmhLQNWQC8pMozWG41Iz
	HCX5E2sLKfLdXEQsw9vyX3dvX9AWKwJJgR3fLmzfLx9ve8lxnzQF6yKw3J5q0eW2y3h1Sy/FQk/
	8eaxpsd9DBBMC6BfgF67azhZSPKc/RoFHHiRtPChcWc/MEhb1koQ8i++Rnf9DaqiiXPt0PbX6bx
	ObllycrkbvcfNDu8/tnJkw8VFrb5rgbo6rrPZIaAzdDCkaT0TVAxIAqPjX2VCmNkF1oulw6f3V8
	plzqys+XGK6Bp8koIhcsca0OfxpQmrZY0U9E=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
