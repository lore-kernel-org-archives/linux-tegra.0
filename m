Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D3160792
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209698; cv=none; b=PbYCTRXXEw1dFuXOyHUsOm5ZM2z8A63NrbanZ5FxL5pkWrsSL4h2CeeN6BO1o7e8tZPPWw+GXUCyXaVkezQczKNdTTO7zo4F9/mtau3rw2zaeDVilNOukupPlS2/sPhqoQoKDvlbo2HjJyUlP4uDu6zZVC8pVmJj6SSo7b3UHWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209698; c=relaxed/simple;
	bh=MeqIMsotIT3P9woLHFJMFBDW8LpTmviMFwTz7YYEGwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyWyidTJr6YDdTNwWjZq4y9L6txuGfcPK2D1Cs2/c+2SXr3Jxudh4CcvvWhZrgxZLcbQJNHFGWn0yNyjhWlMfYU+esMTDZEvsaJeV/PiwFHdZEBERkT8ilc3KQMpj2hXgCG0Dk+DNwb9zD+Yd31ANniZUFSwhATML98bomPM/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KgHgJ80H; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KgHgJ80H"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6eb8ae9b14eso369919a34.0
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209695; x=1713814495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
        b=KgHgJ80HygA0qWSD44seEiydXYfkDaDM3X02ovYaEVQfenn2YlqoQnz0djULX6PoOw
         RaAK5411SAo70xohtPizv+eU7w/NzHkbAJ3R/HvYWgaOBuWYPZklnUvFV17n/ECVjAAa
         sU38IiTLOjfo1JMgByG4WZQfUGMejiVL0x/vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209695; x=1713814495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeRLp7zsOtUSdDFmgCUblI9njYJR1iKxSTZ/4ILbF+w=;
        b=c7KBGVSMP4sl+N18MN6vsfpXEor5iBdHP26iEPHdtusGltlCh9dyXNwKhkqkSJltUJ
         knc2RwJ6iaOU+IEGEeTtyE9OaCLloogG4tWEVoFvqv1l9zoSBSqFMWnBM3HHGttIVOL8
         c1vxxcvbbs+9ul21pe0B9siON2attZTfbMWu4dC7wgIR7/oGtFcOruVx764kvWBi0/ru
         1vwNANt295W4TUy3FX5UEbX83q8TBo5bkx3EsH89r4LesUVIi+Y55T7EVumKd9mW+2JS
         OebHOJlKSxBh9gIM3Hla46Uvb89ZkMxK+JEXgWbs3YzLtbkdmnXmmRmmriNwJgekmMfz
         R9/A==
X-Forwarded-Encrypted: i=1; AJvYcCWVY22AF20EC/nR1wPs/Dy1k5lg19EwMTFtK4IQUm1TWfoYxvGrEvkj5FGyQtvxiwefF/tOUH0JsuqxrJffYsZLhktzVRHavDbZgpY=
X-Gm-Message-State: AOJu0YwvzqLkjmSER4Je29uUCVdqg22psTf7OODCQ5jbUkFzBsqYT8gJ
	wbijiv5jmhFik17EzstjJGYoS8GA1RfM8FkvJr61sNnCLTed4Uw2TKOdwsp7Dw==
X-Google-Smtp-Source: AGHT+IFsqXR5fSRZnzm1Kf6aaPblaNqmPYRQpJrXNEFCJBpTElAi4AncAaUAPBA9CFnD3PK/w6M+nA==
X-Received: by 2002:a9d:748b:0:b0:6eb:7d1c:f793 with SMTP id t11-20020a9d748b000000b006eb7d1cf793mr4227322otk.31.1713209695186;
        Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:41 +0000
Subject: [PATCH 24/35] media: tc358746: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-24-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.683.g7961c838ac-goog

