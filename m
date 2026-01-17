Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F8A500943
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608671; cv=none; b=FOCDruimRtEr58GEmkfp6Vi/X+da8am3U16guNGBrkUFfSWJYHryq8Hicw+w3duZ9kHECqCnhcf3GdBWBDtPOVbkjL3i8h62hELDvzowzG7+7EwsukeU4FAM9WK6SNnSANt7yfP/2+jtk/VOOu5z/hCoxnZsUd7Eyl65EFRz33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608671; c=relaxed/simple;
	bh=P/oahKn22V1Q/qKIOgeNOxr9OQ5K7jy4uqISMhIitG8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxaZy0qclOK2AiJKzqnt4gRBlnawDjLS7lPY/IrfNyJJqRe+sR1lR5k6Cbf+A55nmwGXmTrYIsaJsCOTNWBqPYKPtHQS+vq4Oq/C24897ET63kXM2Ha5Jm+/mfuF+v5ZzTc9OlALLLoyIxGr+E1/MVHOJnA/z7bX9oQ2oY6DU0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIHupAFy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIHupAFy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so13840825e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768608668; x=1769213468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7KP989+MtQ/Vx2GH1+7AMZFtXODIHzXJuAD4CeYR4A=;
        b=lIHupAFy1lJTOEiumLHcyFNiD+bFp4SOxA+BzH9b16dCc/rI/hoBrUFtd0HFf0sLvz
         3L+QlLxLTNWePwdTGDDo0qxdK1CNbnaVOdfa6W+x9F01m3gTKsOGhLUG7BTpATh6kM60
         vqZM9AhiPUzsctYRivq4JMsrbPAlp8f3MNmA6V318HgiijMcO6u0HrRC5YDbr+Ewma9T
         qxUWkjF3B3ApPFrKkQz6GQXTliAofAVU6EbUA1W+v9CaYtvKyJljZIKxv6/ceVRNwPbt
         Nw4T0WoZceFFFnlm7U4Gp6WKDmXfNdf0h6T4PRGo4cinYFPPF5a+6jZnuJV22EMu0DxQ
         lKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768608668; x=1769213468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7KP989+MtQ/Vx2GH1+7AMZFtXODIHzXJuAD4CeYR4A=;
        b=Jj2uXbU43BXqHDPRJ/UL6A2RciNVEsjOstx7s+X/VS7n8CiIgRGzZhIhGkRB+ib4lS
         Lb6eocyBSurs/3W5+IVxKPZ/QroBQwXufBrGk5FxDtNGZctXVtenF7emT+A5Qh2eNs8B
         bS+7ImQee6MkLMtv7dg8GRJnKTfxiUihaLnwrncerBwrdvT5A/AJ4AhuL8r4jP2e5fzD
         eWwvbJ52X3k0FSASp8FJJaoi/hTsw7qt743/kZMmFtXwfrY7nsyGyOEeSuN6rcEEwwy+
         gTPSBXYxekWgD8Bye0wKRYSt+h/8vIJTvi0hCRYOH4JmnCP7t9aJaq7dhK2e1KfJ7Sbw
         Vl2g==
X-Forwarded-Encrypted: i=1; AJvYcCWlDE+zRy/9CjZT/83OkGq8BL11Wa4PSJWCov6oAxw4xix58OO326vjqIIpfyaDRiQeZaCuDpECzzyX4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3q9uJVmGle71upoYGZMp8A3GpyGH9cKNiH7VT70UNKpJxQLwi
	xAExkXEaCvilGBaQxQAHqcFlzwPXf11m/FjBSv+60bHObz1slpm+RZfd
X-Gm-Gg: AY/fxX4LOeVILB23troj8UeMrmcSitIQwRhEPzl1OS5ynPQQDPK3YPf39OtIZWOwfen
	3VGKzIhvZ1Ua5RtWwQBbVnkkQNuU8zmPFqZljMts91OYFvZF/5Vcm0DmfGH9Wyq1tsxGcURLmnS
	nSGeTFspy1nmsPGs5a4DNOW1i3D7nbl6Q9sFDhNLI/2mwO7mNQKQ2JEe4u7XCGXbYiCAKv1IWk3
	+SY4WoXkgupaZRAMlkiHWgIOVuDO8Si2tLLJf+ygzeiPKj4mQHnjf8Pe5au00NqtX9ZN7Q4tC4p
	TONq0hSoKzRBoX6ETxXZPamuKywoxvHPwS4iXpP4U2D+HoggclrSxOAQSigK7jPqmi3xrPuITeq
	Dkq2cqMbnu67vBp56pakg3S0UHpvOlz4gzPeaFWV3qt81lXSEppKQUxVNYsPrajA5Ggi4nEF5+X
	t0btTyy2rpfV8gdGVLMuiu+FdpzM99iw1j6PoL7p9CtKOhAgRHe7QWaV7whD8UpkNWzfQoXd5Gj
	FJQDSY=
X-Received: by 2002:a05:600c:1c05:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-4801e2f28edmr51066635e9.2.1768608667711;
        Fri, 16 Jan 2026 16:11:07 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm120243635e9.11.2026.01.16.16.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:11:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
Date: Sat, 17 Jan 2026 01:11:00 +0100
Message-ID: <176860865300.1484839.10997280341072285851.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 02 Jan 2026 13:50:20 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
      commit: 362b0c81b3a5a3d455577866cee6c300784a2ad8

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
