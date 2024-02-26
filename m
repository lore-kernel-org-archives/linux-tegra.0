Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D87F464
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951023; cv=none; b=CD03F2OGJrQs37HFKKZ56eE5Hyqv8XwbCwfXklOCDB7Akf0wSJpoIGAyMxPH6zj6jw1jw1+DQIG/2m0+F8neCDZjUpKQoNX5cu3wEhOylNN1D4/I88yrbbWzYSeBjLi/l4y1kshoJJEaRMz1pxUt1wDhDxDqYSrxPPMXV9gsV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951023; c=relaxed/simple;
	bh=C9wDLH2L3ZzqzgRX457oLJnRJRQz7/LALjQE5a3K4N8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s2NrDAEqmjt2KChOgJr3g6tTAdUS8jxoP08rjIptlPQUiHnBvac/737Rx+95WcC5oisXlnEwk/sbK1DzJTWMOMIoBOK3qHDQJLqH+knEHrgpX3VfiSZ1339NxE+Tl444alx9oC3fKN5ZTXgWs0DWrPQRXw3BuDZqYxecmzxJLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrtf6cWf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrtf6cWf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A191FC433C7;
	Mon, 26 Feb 2024 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708951023;
	bh=C9wDLH2L3ZzqzgRX457oLJnRJRQz7/LALjQE5a3K4N8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rrtf6cWf0gKZwmDtVigfxSVNlfgBRuVal4w4nvByIQESKz+WMdcIlBSViAfZdIqW2
	 FdE9URDCVVVfW4ozRxKMv3Fx9aHGHNj6dC39O9cuOXt1qU2rZs/GN+lampxwrDWiY4
	 Znx8yFayk2N4fDzbRIvTPCuQ4dqkzGl9wudKKuhBVcsejnJvNeFbYolV1aj14M8yzV
	 e1yB1DbWOyHS8+pev3avHpK2zg1UOLhRkNyGLD6yWyX8VlHWDCdSKqaeVvVmhBtJMs
	 XS+1MPgEi4ep2/YErAtqW3OCUfXAnglQmfVNgp7c1C/fiEVtn/4V1LcFwfHxjOzCEf
	 X59kC5MuTioLw==
From: Robert Foss <rfoss@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20240223150333.1401582-1-thierry.reding@gmail.com>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we support display
Message-Id: <170895102136.3360807.8311118581236515605.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 13:37:01 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Fri, 23 Feb 2024 16:03:33 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
> 
> v2: - add comments explaining how this situation can come about
>     - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> 
> [...]

Applied, thanks!

[1/1] drm/tegra: Remove existing framebuffer only if we support display
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=86bf8cfda6d2



Rob

