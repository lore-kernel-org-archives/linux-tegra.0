Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626848;
	b=oLZg26GqJUXFcR9OjCTEoLl5Tonnm8P24Pcu4EOIEdz8+yViX7BAhy99aH8l9wR26dyE
	 BWW42eI/Zhvpw1U1jgLlsFu7VCt92SbhhqbQ7m6rfnUIg9mwmwq4MF76O5DLOzFQ5JiAV
	 29Pee4qu4oRs5oT+mPYfHDfLrvJuIMJvxbid/jRMXvVho82u8ZWLijoXWFVSUnymuDoCt
	 NQ2cl2YL/dGPaDAsSTNoO+5NrUHiUWEAObscFrhotcz7YEq0eedAvIbgvUQL8Pb83bwag
	 uJslWmFA+snQT+wdAw4M/Dna54reWPUU0rzUWsq83J9UeWmIkciSl+cLh8nGzvXhrhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
	b=JhEQjVYin32HYklE7nsvNY4X06iYfE4X+/xZa+iIo4sd97vwyZ/w/haXfUPvuJlnv2fH
	 Tn7jK2nhIqZVdnadF48J2hBpcA0zKBjukr14sx9uXn/WpLij4V1Mr7xTXHejpO/SLKCLm
	 sGF4byMTdEOdSp+VxBk03e0xrTD1IZqP4RbONQyYmahzTis/4TYm5WA8/1MUETLAr/0IV
	 UwV+6tGUVKPSpWhUWfeddLKLECaV+SF/rLM93l1RSbgqduQs1FtR3biLjd5KHOFaxRCqi
	 2jvD9FDKWwJ9Sz4LBGDKQtEeAuDaADekZL8BDqOO6iNl8fOcIWkC3SuJgOHH0yR28bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EB60A5BE5
	for <linux-tegra@vger.kernel.org>; Mon,  2 Nov 2026 13:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790EB60A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwnwl3VI
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso30627285e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Nov 2026 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626847; x=1794231647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=wwnwl3VIHIKqYxybAo0PJUGsxUMaTIWRjrnNuKQhh6l9P0tcxnxCepwxgMDxUFKLSg
         ElcWQYzbUF9cGkO3FueRCNxjPNm+Ww74W6gm5lyhssrCUGZQc+jl+o1bgnxb7zTSICI+
         7HlPF76yiJHEHAq2lTrsQqDKrdRH2wDMPMb/JHctjqJ13BN4fnOTEsCKWA3k5b3H9vi1
         3dXoHWOAZe6K6lVFcTLRq6KmwuZXsdWxpso+cXiJwscER7W7ALgGF2StX6SSfFKLml68
         Sxu2WsRdAABj78UD1yVFJb+T85G3sHlL873+ejNza3cwirNqNwM6FvfeUWkZUdj1RFzl
         pM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626847; x=1794231647;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQaT9BYgRFn+zEYUt83O8GM2Oamgt2XfYK8NkH+VikI=;
        b=BPEzH+/ei3ZPgJXLtAzxvmJrZn3pG/GcecvdWY+nSWjv7M1Rtf9sSFPwCkay3s8uFX
         FwZOzBLyJ+eSsZJfSCWxqDtsYVHINuhHfwt5F6TcWmsAySvzNZFG8skAmBmOTwTPuDf0
         yqMZPBTIpHE0R27dX6ba0nmRfNCeHgp6ban01CPKhmSWW+IrsBHx+UnZG6wQNJ0KVhl0
         cugkosq4jH9MHApb2NmtF+mKlwy6RgZbzwGKf3P2Nd28GhwlDfJdBHxo1ac2h82rllNH
         AeQXQL2quEqKshH75QhxOgD26mFlJ9kd3YgDsSGkY+dj3z/ptQV1iZdI0QVrpyYc4r/W
         LUIw==
X-Forwarded-Encrypted: i=1; AKwUvBxB8XEFojACT6JDmfivUd5suhp2nUuy7bCsUQagc0MTb982bnGMcVH0yd72zAPGqky9NdiKQvaBBmuWPA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeZ9hOfSTRaXMWB5hEcKTTEweBYeTZrruk1iXOz5vfRoyya10d
	G8j1oa9LxhFoio41SMaiB1Wh3IcKUFJWtkXAvEaxm76GEphWBszPLS0M6jag5Dzmq2k=
X-Gm-Gg: AYBFou0WCyxEqAbsUCEWHydqgXXGtCK5E6HzeTQDMsOcLobDZGdcZhvSozzRq7iKBGN
	udaLAfDhsayf5iWFCX3yz8iX9sThAHbfL1DDhL6u4TvEc5G9QAvyFt48eG78/iq4qzWuj+ekFZn
	Ng9Z6gyRmutLgxETecQyUw5/zgASIGSTCprGjpOkMQP7f+c5eKPuyKT7+khjLqEQFK6DcwKT94J
	x169R00BwujluzEMDenWIq8iWoTvN7mjdsCJ6V4zklSw5NVfA4efVezjpI6DIDGWBzTSvwVJu6h
	3rtcRwAedBshoNTScnyaR94eJpZkNkb+Bv0m+C2Bg8+ZYeOO9Y4WQsydVlTw9933ubVPj4hAZHb
	mm4CIRpwMyTURY9aL+HgLQW9f6O3BrabayBeiFGoppw3+3rvJAVnhsFTN3UJxRt2jp37w8hMrJq
	wa05EWAAHTR6rW3mqXvjjXgLZOToZhp427i/xT8G9XWYIWVBzBM0nPscpmf/voQ80vTiPH3ucAf
	J53Zot10Oi6QkD16ku7t5RcE2TfdBHotV8eV4ZLQcveaR8pOZZcnbozkoi29ry8ggRxP6zgsnJ+
	foymqxzpTzwxcdsTRYqhvwWXuyyEAvXxRhCY/zhgna1rf264sHFTfgwL+tXPqCQr50Qrph4=
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr229234705e9.7.1793626846731;
        Mon, 02 Nov 2026 05:40:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
Message-Id: <179362684510.3310106.12424997423646231725.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:45 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
> that closely resembles the MIPI DBI Type B protocol and is referred to as
> '8-bit CPU'.
> 
> Add DC parametrization options needed for fine tuning by bridges.
> Add 8-bit CPU interface in form of a bridge linking to RGB port.
> Add 2 DBI Type B panels used in LG Optimus 2X which work with
> the 8-bit CPU interface.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636fd729c99781533e265297748b5a0b0f
[2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a3001fd024c0809678d09c5e0ed359ee
[3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1becbb095b6204cf657508c91e5e995d9b5

-- 
Neil

