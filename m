Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BEC7E0FF
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609540; cv=none; b=V1cGAn+/A72tjURphnSvTSj2d7TweSvLxYFLM/q5kxGLHOvSJ3KTnqoOfPuczmmgfUpoaiiQvo98Wa6v9l2QiMErNNUzSY3Duwh0vLl40VpsgO2DACpgDpa6Tj3el8uByKo1dfwchhuE02lIzLT4no2uCFsWPYGKqiXthshDBew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609540; c=relaxed/simple;
	bh=GpCF6FO8B0Bdg6DTetpaSL0tCnhoZdk2TgdPZIH03no=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A11Da397D0mUxOrSUhfgWS6oiNsXD1QalcRdOn7Z5TC65/RJBhvrAoHCArK3f6791KzWWI7PM0Z1unPdt6puqmeXF0W+CSoRKxdyuEed5i2Ih3krN6l5FLThjxvwlVrhsjAfS4gLRjh7e37Px316iQdltJ1iImc65mRkm0kvvaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyQiBRl0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyQiBRl0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so17271205e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609538; x=1769214338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLP/L9hOw6v3CS2fVrtY1b2Lj3hldPjPnMkAdZOjO1U=;
        b=DyQiBRl03yRxx6XLO93jdJETQjfgzdBhXqMwmWcmECKf4eScjwHyXeB4HiOtaCudTc
         qzOVVuyY5QIGK6PoF6MbWEm464LRi8Oc9YBy7+bqbf9grjKQhePk7uTsbwSwx2k2M9/V
         d1m8q0ojrIUJ1SuwamhHf5dm+amFgpe9j88pd5pjEANCrZ4ATgo2a02TKlL3q8BBHndc
         FOt51gd8OQ9YBf6yGPxYpSSaRmLNgojEIN1xmAh7hBv8mY1Kp8cDRCo7dDRZyUfi9IFT
         gR3HuHJ8ROcHqIwFANaz2W17d0S5U4UrDPN+v/ZXmpI42ERhFdEmgchNVSuYPOviGTJW
         YeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609538; x=1769214338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLP/L9hOw6v3CS2fVrtY1b2Lj3hldPjPnMkAdZOjO1U=;
        b=We6W8APvYkqZlySF1OW6dP2ikjVd/anR59WlM63Pq3LmqNMrtFRwh5SjNSqsJIptb0
         36H/rV9a78gMHkG99c2vSOaTdbEZV3wUD83eWXTWSafRYdKskim3FkQfCXiWEk7fo4g9
         9pGNv4rTg3KH7FWnE1oj9zthfzhVIfrTawtZsNGFzy/wPPZFQ63XmX9NEWNw8r30FSue
         cBaCvLem4oVJ4sN0J/phlOQGWbqG8nYFsCqmml6uQOa88Okgkiao0cD+uR6EsrnPgOZE
         vV00crQXkS4iUXsfdiq2ZcB1dqw8N5smtz1HdteO6OK9t5qywKCfJeUN2eHknR8vhORG
         PFjw==
X-Forwarded-Encrypted: i=1; AJvYcCWTcsBdI3xf13/Yc8+kl6aOLz23FwPqqv4uuHsuWKrt/FXi78Jef2i7zRw7EVa2oPBsD3uF46gBdp3K+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztc3bcOkR/89PA/HmFwbqyLPJR2f38N8OXlQ9BdTHJ6MwALKB0
	QyOe1SUUeTz7dI7AUfWbiGcwgdNd46HQZC9lII5Y0RzH4JWfAQipN92a
X-Gm-Gg: AY/fxX6Qv9YxmxFCG5eHxStLK+wISUHBr/ffclXZgZaxpSpulMTZG61k3mX18HDdMKB
	gOTrGC84lmV2RC/HGB+LoDe1eQKqyIak979PACsHVMrY1quaDx5+Ff9eDS9AayjQsRWnqEcB7T3
	9MUriUIjb3Ipo+nQlJZpXXtEbwYGrXv5BGEYWhKgAJnd4zfYLa0wEwIDDQQ6iToxUtwoa6a9ccn
	k71heLlh/j66igtI6GvXLPeJcJAlQf+VcqULT402TPnTbRLvNcjyxUimnKIFiyqLOz3CxQNysWo
	3BI1rqBbATrpxYth574u5HamP6aFAx6AVLJMVpor/qvxwdwbwfJLM3spUBFyKYtO6FneV0rzqHw
	PaYMbNh1sEtJ1weEkStD+UBiXHtB1fLNgLVg8iyyy24XfYwhtyxlS0fCoUKOrOH+Em3ZF+Z1zGr
	T39Q+VKbykNyhCzmgzdScchFc/tm0wdaWbm8ac9580pKvrtT4hv4LqFNHB/ecDLm5o4g+8yeCJh
	6lAy4M=
X-Received: by 2002:a5d:4a88:0:b0:431:764:c25d with SMTP id ffacd0b85a97d-4356a053cc5mr4638844f8f.35.1768609537713;
        Fri, 16 Jan 2026 16:25:37 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996e2d8sm8130473f8f.28.2026.01.16.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:36 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/4 RESEND] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Sat, 17 Jan 2026 01:25:31 +0100
Message-ID: <176860947669.1613073.3280667856356646919.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 04 Dec 2025 08:16:59 +0200, Svyatoslav Ryhel wrote:
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
> 
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
> 
> [...]

Applied, thanks!

[4/4] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
