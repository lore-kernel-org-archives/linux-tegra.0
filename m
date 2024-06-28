Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C881C6888;
	Fri, 28 Jun 2024 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587934; cv=none; b=nJ0xm6gi1OnDmjAZn4WYVkOoYM/42lNDFlBG+CjHRFhhPpJguSSTNkFkW43BPi7ALKIGJplAPDCsFSHku0ZSF20CeJLr/aWnp/BdyyN9y2Pl49G/fsxy/VAcUkCw6ydRMGVbHTSa48n7YG1UcoZf3P7IW2usqJ1lau/FfErUQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587934; c=relaxed/simple;
	bh=UnmzAObiTewC7DteWfiWC3+Z5O7/tri0FOBSovqBYrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYX3WllzTjcsE2gEVXeyvgGR6Lp+9EyXAt7hpF8f8TQOpg3tR6O5TDZXidEA4Zl+ORVfSoRMBJ8WKtapD0hKwM0ajtIZrfs26rXZZEQmQr6iIyx9SWW3qLv0ImdejKjCaxBr2HmtaJIZbUopknN2SLk3NaMOpRov/mxJmqbYv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqD6TzJG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqD6TzJG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424acfff613so7536365e9.0;
        Fri, 28 Jun 2024 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587931; x=1720192731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlajlQEnGW0AoAsezBOWXulgbRPHRHotNcM1iK7xOhg=;
        b=XqD6TzJGqPpZ7rr2/I3S353+OoWS77gyvbOf8hrab+mFET15hxEYKHHkCjw9fsimQx
         wFbWt9LVZYC6kZDZ4CO5PtG+gtvisZVLglWPtpY2CsIt0j5+XyZcSNaeleREHO8yLpZN
         yHVM2mVc3oBLMTvqCS+K6l8EdHgfzxGVCDe8Sb5MUkioIXA7d0bLhXgatWv5iiBt1JL0
         SG6d93w/v99TKYnvWB4aCQGFdgszgFptV5DDWY0UqOeUN1pmTQMxD6Bg20F2bthgifbw
         3OxlMjMHjkMDVKvVGP05HWLzAJ7ppYAzEbE83CngDkFG+TI/Wpm/3rbUVuPuPNXJb0ZH
         kseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587931; x=1720192731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlajlQEnGW0AoAsezBOWXulgbRPHRHotNcM1iK7xOhg=;
        b=WmJLlId7yVJAsf6AeCR61LdFuk/Jwr2h+IE42jFA0bqoMnx8NxsejmgRm+hMwFxXbN
         HB0YkTHM2BiMNIPsx/2dAP3Vdor6SCp43rgrX1icoYdRfh+aUaeJTHPFfAY/2LXVElkN
         RQ4rYLpqHr/xa6jxG4/b1WZjz0ZurdVNyQoh+u0DJGwrL7KKDJCvacaDMUcH5+vxb02z
         pZMPlkZLwlrO0fX6fit1a2z0Knp1JhkNM3WzhLqEkFgyQLnOGD4uiB/8vKk7auv9ZUuR
         FDhR60+BlUW3exWBSHRHdPkNP04ZfNelMQDovvWsPe2pfImsWVAnX7Ua0g6vywu+d2+1
         /hMg==
X-Forwarded-Encrypted: i=1; AJvYcCXkHQY4x3q68o4MVhwPi685p43A8O2L3alZDaVQoru5777gBrg86DxPljwGwT6m5goBCGiAWoLn7Yj+9060bFK8+p9iM2yUUWGOdTqI
X-Gm-Message-State: AOJu0Yyp2K+wLk9ohrmz+t5hllhsrHB9cTSJ+Skuage8Kv6P3JtjIVUi
	AcYl3COUxQefLVg/vHuyMVk7xCV6TUkfPNqV0iBncsKvJJ9ReE0l
X-Google-Smtp-Source: AGHT+IFBYO20wkq72Ype6rhOOKYEbI8cMPMAmtzTs2wRpVBRkotZub69tVwnHGVoh4R6jtkg0gYYBw==
X-Received: by 2002:a05:600c:4306:b0:424:aa86:cc2a with SMTP id 5b1f17b1804b1-424aa86cc80mr86680405e9.20.1719587930227;
        Fri, 28 Jun 2024 08:18:50 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b099c72sm39268705e9.37.2024.06.28.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:18:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	kkartik@nvidia.com,
	rdunlap@infradead.org,
	frank.li@vivo.com,
	Jason Sikes <sikes@qlogo.org>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix warning in tegra_fuse_add_lookups
Date: Fri, 28 Jun 2024 17:18:48 +0200
Message-ID: <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240616073721.5696-1-sikes@qlogo.org>
References: <20240616073721.5696-1-sikes@qlogo.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 16 Jun 2024 00:36:57 -0700, Jason Sikes wrote:
> gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
> used in the first, but not the second, of two size_t arguments.
> 
> 

Applied, thanks!

[1/1] Fix warning in tegra_fuse_add_lookups
      commit: f56da7f4048ff41cb029a715935394f5958a825f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
