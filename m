Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC538424D;
	Wed,  5 Aug 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916074; cv=none; b=pw6KCxe4XI9pWi+2wLdzvygD7tvnFBzk64JualT0Sis7W3/yTZ3KQQC75nubDlQkWO3pcryvvZoKd3PNbGSneXtmsZeyr55GCyfRW6KRbPTIDSe/5nD0fjPXDnKNxetJAraHDC1UkAnaRCJ18qQZ4+eEV/V7a87JNfG2HAvwq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916074; c=relaxed/simple;
	bh=0XXYekSciRPYufGWk0WOK9EYGJFqfs1lPuofmGe1gfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNFH0Yq0SN0Iis9CPZSl9ihKiEJ/xKNxXqKRHSEGDmIGtt3rNQF/Yrq2KCxbyJ6ps2F1eRdM5gqRjZ4k4z+8a5Omv6biczLc0riUQht5eO2Ek1K3NpGWQFufws0qKnZ33OWDRATWUrci/RjjUO+mZI0R+IbdS6ubvr9K7PVqlVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJs+CqdA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJs+CqdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4949E1F00A3A;
	Wed,  5 Aug 2026 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785916072;
	bh=XecBs/4B7YzcU09Hn5dKaVedgL3pW4rJCyi91XNcvWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OJs+CqdARyhYzo7c7agcSki3BBTyjoFJocupLp9ya/tIwtugHczx8sxE2rwQOG746
	 kIZ9yNcFYzmWTbmCqLBav6WGNiZF1e1Q5lZfQRJOrS9wcf9AXS1rzPzsW5L04on+9/
	 12/yOJkNtrqRv9VhJ7mYNi9ZtY/on4CqXF7pThe5TV8Z6bzjxqb7Rfysh1wUJofb+k
	 CsZWDpTfSt6hIgC5pZZYRlFKNU3v2eKjDmqK/HhnjkMKvK8n6ArIaF8hn4NPIJpXeJ
	 rQDKKmmfx2yxmQylyt64q3dvLsCpkDwErD0222vKaxAduMrmCpGyigt5tbusPzy4ke
	 90iUMvXzawsSQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: (subset) [PATCH 0/2] soc/tegra: fuse: Fix unsupported SoC init path and log formatting
Date: Wed,  5 Aug 2026 09:47:48 +0200
Message-ID: <178591602568.1279419.9045205422483619934.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
References: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 04 Aug 2026 20:19:08 +0800, Jinhui Guo wrote:
> This series contains two small fixes for the Tegra fuse driver.
> 
> Patch 1 fixes the legacy initialization path used on 32-bit ARM systems
> when no FUSE device tree node is present. If the detected chip ID is not
> supported, the current code only emits a warning and then continues with
> fuse->soc left as NULL. This can lead to a NULL pointer dereference when
> fuse->soc->init(fuse) is called later. Return -ENODEV from the default
> case to stop initialization immediately.
> 
> [...]

Applied, thanks!

[2/2] soc/tegra: fuse: Add missing newline to APBMISC error message
      commit: 308be3ea5c8d0bb362fb50c38923849a268e078e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
