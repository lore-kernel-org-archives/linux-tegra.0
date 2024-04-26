Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154171DFFC
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714146092; cv=none; b=tF6HFQVj0YgFo3WuZ4Cjtp1Isb+Yal6ayGdU8/kgRn7tQb8XHtVXLnlbSrKaZdHeYS+cGBao3VxSxwvZH8FPKplgMhbBQ9d+55cxOF7pd4Hc/cc2Jyc5OMw/CmvfWuyRMnJwpktOeJ3YIz2cKO0lwr3LJslgOdFL5uzs1OyPkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714146092; c=relaxed/simple;
	bh=8WJpaoGvNNWEgDYjPVkR5C7GYcip29b2dgzQaJl+yuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaASC+Oe820cw3yODO/8wSOcDjreNUqCXlhOSJgevfmVlFj7vLVKsBr0792zghmn7asWwaD0yWVBwu+Jcl4FbIi+HYreZz0fgOI8EcfCgdo93hrzR17xths/Ym6lHUtcwK0+2L4eG8pinoGkbIbqRj/tcIW87jY6fp6rFc1qmtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkMsd2H6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkMsd2H6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b794510cdso8931905e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714146089; x=1714750889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEw+0YSWgid0bGYqB2p+GPaBaLihpJQKS9lsqt8phss=;
        b=JkMsd2H65Y1EzPhyufybeTlrOcpLIjh0iKHsauoZ9gi+M0eksHlJ3u2k94t6HJFrGI
         ukGQbWOvHLNcrrFqJa5stWTCItsaUQ8f+w9/1SedzceMwsg/YqUqUyR4zzRhMfIiBilB
         TygUP6kyQOEiInImplOlDT6yAgWVXJzwHJRlpYDecA34LYy8IrxTJmyvJJZcY6daU6Dq
         9RnSdnV3YwpStqrJbnfW+Xr7GX9dpKfdOOPCaSmcPH6iojrStAObuTGzakIF4OAtzsnW
         lQGFZot0YtoC0r40nd7F6GtqyL3YJP5GrWs0cG42s1lgU5G4ORpnQ5/FIwdP1xuOvNJN
         gyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146089; x=1714750889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEw+0YSWgid0bGYqB2p+GPaBaLihpJQKS9lsqt8phss=;
        b=wW3r77WFsb3LBPz8KvqcEe71cGP235LdC/Pohr0ETjvivPhIYzrCGxTGZrhoRahowZ
         BzIO6bOdqlg9IgMqFIejqOX28qku0abyxD5OHXbM36anfSJt3x5M8YvBTpXZJQW1F6hZ
         470bxOPj5it7JW990vFQcKbVisZV2D6jI4UlRQSS/TScCmKFadzo9CtBWVUnjYuouiZo
         HA//heXraDcpCdDRfsgBLPusYhNY18EUxVE0MAOKo73QbNNRVEw39+qDx12yHJ3s16KA
         icr/boXopZI0ZkDxGp8D7A468/rH+G/hP0SE/b7Pn7YwniKrnlGeLDpc9Ij+X4B7B1Sz
         LqEw==
X-Gm-Message-State: AOJu0YzlIE6eTvKHL2khMPr4iAr/zm/5GvwEpjtGSzp6++jFcA+ItpMF
	B4/8XIzzUyG0KpBvftY9c1DDbp1YHR3T9dSWhHnQVL29tcaqI80p
X-Google-Smtp-Source: AGHT+IESwCDMP3u/oHo9evnCvvgOHqdc46dZUtu0U2Ihyn5EkU+84gqwEGFnzZTD96EKxZNoAe2Pqw==
X-Received: by 2002:a05:600c:3502:b0:418:d35f:8628 with SMTP id h2-20020a05600c350200b00418d35f8628mr2494905wmq.21.1714146089090;
        Fri, 26 Apr 2024 08:41:29 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm1564566wrt.63.2024.04.26.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:41:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234
Date: Fri, 26 Apr 2024 17:41:26 +0200
Message-ID: <171414608148.2299468.12567008472063384192.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403114208.35147-1-jonathanh@nvidia.com>
References: <20240403114208.35147-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 03 Apr 2024 12:42:08 +0100, Jon Hunter wrote:
> Add the wake event for the EQOS ethernet controller on Tegra194 and
> Tegra234 devices, so that system can be woken up by an event from this
> ethernet controller.
> 
> 

Applied, thanks!

[1/1] soc/tegra: pmc: Add EQOS wake event for Tegra194 and Tegra234
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
