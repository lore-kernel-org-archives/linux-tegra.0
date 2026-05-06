Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732F43D4E1;
	Wed,  6 May 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067491; cv=none; b=W80r2eD/wl8WZwknCLq8RFlBW0nLsrbJ3TIULhvVbBhuJ+tTSaKyFI0U5lfJIp+oXa7SWSNfKXA33b/yRPXFF18eimTsjh9CHtMcXlEWAX26QblfL+R3Sm2522RON94o/aYlPvEFnX0MEnMYI7YG6BzGYpMNoBZybDCaZFfyFEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067491; c=relaxed/simple;
	bh=4sdC7kwKSXuS6KgRZzxsbtJl62bxQOYB9GQUjBKu4sQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Od8TsEamCxURx66fomw7iL3A46wzNGSLAnCmVmK2fw6VEfsuHWbuGHyd2Qc11CfT3kBeyUnwTMH8G3XAGacWGQH3OpxdRQpJC1mikKASDNT9WVmf4qZdPsYII40XP2CaadqAwBlyui2e/HmTSlEPSMaA5Db6grMMeX1aEljJjcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e1wsCWxA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e1wsCWxA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0476F4E42C07;
	Wed,  6 May 2026 11:38:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD7F66053C;
	Wed,  6 May 2026 11:38:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A4E9102F1D29;
	Wed,  6 May 2026 13:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778067485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LQcm/xArV6CJVfiI15lYMkR7QKqELsBqKy8G3M2hjoE=;
	b=e1wsCWxAaWftZoU4FBEJx+l2Spsa/qIv/l6/3EaHfxVCX2x045rfr7cK3mLyprm6BT7jHo
	yUpimppLOGLKHBoBavKT3QbpYFtbT09szsCPTfb8zE7vzOECcfOuXeWhg2YEy0uvoxZ4UP
	OekVuMP//mj9p+JPLSg7qP+kQ32ac95qjLcdw9gULZ9hft8PQRMyEJyBierUrVe68MCVU7
	Q27H01aTIWhoORW26FR/b8wguwoH2b3XFYRYZKy0g/kArjF2KhCX4soMIAsgRFZ+Tydiu9
	A2JJjHAWaV+ZBGm+IBMqxq/CZwXgreH9i0rkslRuMuxussKAoqncyjm0HiyIQQ==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
 luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
 hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260506075745.28574-2-dennylin0707@gmail.com>
References: <20260506075745.28574-1-dennylin0707@gmail.com>
 <20260506075745.28574-2-dennylin0707@gmail.com>
Date: Wed, 06 May 2026 13:37:56 +0200
Message-Id: <177806747690.1370967.12191518933369462727.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 06 May 2026 07:57:45 +0000, Hungyu Lin <dennylin0707@gmail.com> wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Returning 0 is not a valid fourcc either. This condition should
> never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> access and return a valid fallback format instead.
> 
> Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Being a fix it should have a Fixes tag and Cc stable. I think the right
commit is 3d8a97eabef0, so:

+Cc: stable@vger.kernel.org
+Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")

With that added:
+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

