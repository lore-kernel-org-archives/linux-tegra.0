Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681D94AEDE
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714391246; cv=none; b=qhsJgCsMlip70inX/TAx7P9F9+07554qNCYNVhy81TsvTaLjjJ+wTG3SjGAzax2fBjZj0S0Tz0ncxQz+nZySgB7EDMwRPj/MmrjJMlnjniD46Ek56uTBc4C6YQBfi8zC479WQgtbWneaWsfqNbLQXtb39OC6C9iHDKtN5KhAuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714391246; c=relaxed/simple;
	bh=I96nVD/pvl/HbzA+JSRfMVYooN/S/Dzke1463qRCo+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Phpo4sodeccVIgdW9hSEdFCSwMRizrMOQOXGbRMVVVKKJMpTT1jvhdg+DUkcf6ZPCEClm5DCNYUABSa6tQOa0bWcqBT3vAPyRHy/UF9yaI11tWeah4r2zhpiyQzKIqJcXr9R+8C06+ntCSnJa8pflJhbdcm/p8B9iYgL9+/CJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgfUmYJQ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgfUmYJQ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-69b5a87505cso19211296d6.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714391244; x=1714996044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=MgfUmYJQai1zU8NliczXN5jn7B+67QyM15AaeSNWx6ibpvW5AhlP001mfpG9oxsDep
         bRUVJtlVtuMsf5ybsWKPx7XjJKunz4R+CEPFoXouBbKb2NjSiiLTkM5AbEv53QiJZzDO
         oa/g3JsuvciLXqTgjZohAakwj6wAeWGD422wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391244; x=1714996044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=dP9StvCs/Avrt5rPif/7YBj23SGqNl6rv+YFG535bmkn7lLywt9GjrOv57Yr+iP2Oz
         tsnk0n2HV5cXMBQXiRqkpFQcAwxZ7MWR1bgRBNw8DC8Orlr2h4b7rdkpreJzjpWDUdIW
         QrrMcOB7MZ5tbqIAzq8qSh58nCxnNOTncNi18vdvtHMi2diE9mbAtAnIqesognHANtRg
         NcKpcKE+wifsnJ8/KwynzwQ5lK7+b8t8s6Mvl2SByulfS0MCWLzYsQsEIo6NWfj3Td3u
         XpX/fMWQkjih5l4oVLbHQ+PdYoMZ2RZE0txDMV3wOguAXUF+e0XPe8L8yci9S6kESee9
         yi4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf6QbQFGM+X4OUSDQ6P21IVTWbQffKkNKd//R4yAKoOH/rJ0x1gSjEzLdqQbjgyZhCzcy7P82ioRp5Hr725VKvVuFNAECSe4klU2k=
X-Gm-Message-State: AOJu0Yy4M+3heapG7kAqYUgg9Zqk8DssyVYkBRhZxZMI2Aetkf5d6C7d
	DGg1nEQY+Uggizb9M7nZ7ey466e7Duqr/2YnOBpLQPfRWGlO0/ghqUgIHFR5bF/iov/YoVrt5A8
	=
X-Google-Smtp-Source: AGHT+IEWb1H1G6/XJfoqirr0tuZ4Y7KAMX07rwnCpOewPJ5z0oO76eGfkorUBidH/dYClmnfzc360w==
X-Received: by 2002:a05:6214:1d2b:b0:6a0:cd69:374d with SMTP id f11-20020a0562141d2b00b006a0cd69374dmr3964347qvd.50.1714391243930;
        Mon, 29 Apr 2024 04:47:23 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id v1-20020a0ced41000000b006a0d170999dsm629618qvq.126.2024.04.29.04.47.23
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:47:23 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-434d0a63151so26162431cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 04:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS4n3b+NJk+j5tfwVvVylaXtRZHCkHPHeu9969wb86fJLOxrkWdyxpBFkCkHoal6IGfpFEgV/Azy/hGEzrutyCSkmQdo2bDLtbyIU=
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain> <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!
