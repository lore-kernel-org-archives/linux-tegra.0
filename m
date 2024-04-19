Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C812EBF8
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520187; cv=none; b=rrvNNWN0f6rDoCftwKGY52jzUZM/ENowlrKuWHKDBhd6s7CVEvSqaQjL8VVLnC0bjjPCKx1FNfVyFecunpnmInzD0fmKIY6XSNtQg4cHxEi2sk67IiIR+NVDfZTFpTjTNimCflm6XErWNgLCLFaIJtEEOcd8hEfcPb+8cDbC78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520187; c=relaxed/simple;
	bh=A2Ua3QkuJFffFg1BMdgqwGEYAvUbwmxlzRDyBr/ON+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7JJLfZLbN1jMqt1Y2jBAeZ1FcDkQP4H610YB7b4W5H2oJO3EAc0nC+ZaBCv9KqA1Uw2vcyWvSUyLvzA1R574RktOvsnUXkWhKlGE/AtB/0vRtnKGus4iLbxnHx17FM+iAgGHf2HiuMnQkZjb6gPDoz5771JgXO7tW/gykMZLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N+xoW+Fb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N+xoW+Fb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78f0592309aso125589485a.2
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520185; x=1714124985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=N+xoW+FbvAW1U01bcSqZ1e5hU7JIJyr6JEM18PiqKQQnR/OoeafWCtZDlYYvVCUkj8
         G46WocLXkmNHBSwUIGTS8rIw/QIS6s/LYw/WyJaXtEdKLoJESgPkTBWo7VjuxjQb/f1k
         FvNS6bSLcK4TTMAnrky0r7s5AsSTt1YQWg/Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520185; x=1714124985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
        b=uLFJYhmCL8AqrJfN7GeDhSl1lEIL3lt9NS5fw7WIF2E+A0LVYKe0C8pxJtH8i8Dfyt
         KpiJ/zPiOhOR2m9KBZRSRq3SUtzdYHScPZzFO99EICiZwIx8XA8Say7jiGGvxb0g/TE0
         PC+elngYCIV27jIjzKhIk+j5+TO3Z0spkL6R/37S5vByVsu9Wfzjo3JyrnhtEg6N+HUM
         3nSBQWn7oSl8gfVuKY/b+PFHRvjxbGVfbTk3qhfjSMoDxcY6+Ysr7Crco2hGJKTkQI1L
         3Iz4Y62E0I0R7qoTPVnrDRtiuUaRYHxO/EpO/uO3AsFkMeyklQkNiVEBCDG4lW/cejAR
         UbQg==
X-Forwarded-Encrypted: i=1; AJvYcCVILELteiafFr2T5F1e3YKlT/ZYdIhtFvMMdCxGQYFm/KE2xGJjGkEzahuBUJZNqvZhLIDY1zc486FactGbQxhvEnN4FilbCmLwdWw=
X-Gm-Message-State: AOJu0YzznRh2M2OpZeWT2lmYGTqwtFDTCo6snLQSzQBhG1Qz6cAWwC12
	/vxvVl1XXXtD9+V+ZUPX6rBXY6lN3OOKdVPXRH936uo7hJRRtfwnbYirLoPohQ==
X-Google-Smtp-Source: AGHT+IHphQGghhdnaPa8294fBxI47z+y4xb3Msllejvsy/cEZHbt70Y742XZJgUuOJUmQOPF+5kWGQ==
X-Received: by 2002:a05:620a:1673:b0:78a:33f9:908c with SMTP id d19-20020a05620a167300b0078a33f9908cmr1816540qko.36.1713520184948;
        Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:08 +0000
Subject: [PATCH v2 22/26] media: tc358746: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-22-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.44.0.769.g3c40516874-goog

