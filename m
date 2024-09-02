Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A06813AD37
	for <linux-tegra@vger.kernel.org>; Mon,  2 Sep 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271984; cv=none; b=tPdGpV0ke3YjxU4QN+rSkAQOfHi9WTjQAAcVH0E4aZ3oE15PyNBrROeut34YwUpyseVWgJ5tPgSGhCJWPiby50SIwjy97FeKFHPzunywJ6u5YbKWhEa2Re2lTOG9Gt1Vb/RHEAQOrHd5XVF6SSwHos+RhWYDJme3WJQSkBG200w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271984; c=relaxed/simple;
	bh=yeZfJW74IaCXpzqVM3KRXsaCXolXFKS330brlZIHoQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix8OQK4nbzI9svFxUVDLyr8sgL7jDmBhvFeM8xe5uYRTko2+9gx0r7DEl8ug4tr2naY9fXvYmM16K+lFJXKFmu4xtmmC5hXkitf9aSTPRvY0yAnaTXrXbwiY9igT09dTkO8gBwEVRCobAsbBH1DGdQOqVzatIwauz7fnT/gVylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U+f1ZZrL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U+f1ZZrL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so18023965e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Sep 2024 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725271981; x=1725876781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6QuFCa6faxKRcJTh+EWhCDLQ1qy+cPMdZ2uHl8UfkQ=;
        b=U+f1ZZrL5NGp6qAf9VkcXBbSr2iMmtSRHcdNXppw7gpYeBiJ/CquJEQHeZNYqdVRcx
         q/e4NoBJxFIxgV4/saZNElK1adMI4i0lRUVJ/SddkE7pJYihmag1Yt2dz6RX8UO/IzuO
         s3p1TJ0uGOBtHHT2ljkilzWM/XEDvIa0UUbLv8etA05/Bqd3b5uVlc1rvlTANsD+unu/
         uK5hWRMD042GhxBZaYIxNXhdBOt0pXgEZrnAM4LQ7oKWjp2DrURuQtbLOr75IvbP7mt4
         /DMillF2sDs1MGmk4BIKvy5suwJOsld6edpERVvMGlEgfKHsE1wr7IUpllxVGnhO/60R
         HfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271981; x=1725876781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6QuFCa6faxKRcJTh+EWhCDLQ1qy+cPMdZ2uHl8UfkQ=;
        b=NSsPp4L6HrVrDvtGDD0+oC5c4goAzz3+3CAZWsjcTuSyVw9rY9fGghgpdvikIC7yjI
         VkW/ud6k2VoWUwddNMINOTNiIsDMniBPAIXWT1KgmQszPb9T0fOYCfOH0U4EAR3uC/PY
         nVhYgSQgwchQRs0zHRZaSAtafGREYYplsiZ3yNL51FKCzWmbmA2DOQ+Y4OqiUE+xbFZn
         T/3up4wNGJA3CtWq/t4U950+pG0o5NEmYLDnY/LYCNszawG7omnLOewcsBxACq2ETB0W
         4JRHF7Ykoahi7SQvq4yvOQa6CoKZpsklzq9MJiwJAkLNYATbz1SqJoV0pfDFg2qsT8sV
         k8fw==
X-Forwarded-Encrypted: i=1; AJvYcCWMLKyKjB5Dj9mXxlI8/K7KofXE2Gxpp3NbUAjBwlR/JybKTiKZSU0biS6/qV2QnMRV2UpUr57sVibk3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR+VTDqSNIGbINe/x9wdwUuaazkJpCs9jv0iHbFkFHb4uBp9ag
	Tj0U10RwzhqkaI88a9YPfNM26+AKfy8GhUgnTh4HG66Q8rMfGAMcZUAyyMTKnSA=
X-Google-Smtp-Source: AGHT+IGpljPS5Q3ZoDSgr/5JetKqjM31lOX75+d9bX8iaaz/poEpVrgxZ4ugPLf5F7NMdxa+tpy2bg==
X-Received: by 2002:adf:fecd:0:b0:374:bf18:6092 with SMTP id ffacd0b85a97d-374bf1866a6mr5115122f8f.38.1725271981066;
        Mon, 02 Sep 2024 03:13:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4d391sm11052415f8f.3.2024.09.02.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:13:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] gpio: tegra: Replace of_node_to_fwnode() with more suitable API
Date: Mon,  2 Sep 2024 12:12:59 +0200
Message-ID: <172527197741.23400.10042043019782849744.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822223845.706346-1-andy.shevchenko@gmail.com>
References: <20240822223845.706346-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 23 Aug 2024 01:38:45 +0300, Andy Shevchenko wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
> 
> 

Applied, thanks!

[1/1] gpio: tegra: Replace of_node_to_fwnode() with more suitable API
      commit: 842da04a99193a8385208a619fe97d0de9f3ed30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
