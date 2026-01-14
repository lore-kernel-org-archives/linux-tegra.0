Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C649395247;
	Wed, 14 Jan 2026 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388496; cv=none; b=n07+uppScvP7DXRABjohJVS3YgZHc9zEUILvd5M3FaDmLgB0mT3SjGA8wOgrhlq/hVhYAcrcwGn9M4X1tkz0VNQ9XWAfO2ZhuPIfDEtLs4JyfvQQdygH8jYijSV+MXLO5of2AgjIVYsjlNly1ob/h5Wgri+zF0Sx8Iwee2SOQoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388496; c=relaxed/simple;
	bh=CxZaqvDp/yK4Rd9ngRIzWQdh5v9AGp8wJjmAlsEJXfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxV7WUpAqXXsGhNs6AK3Xd5Kv+xTQ9Ahq0K5HpjjDo5Ze8aK53/Uf/o1VHa+axncDckkxqZn4H2Rlz4i4vNQcd0Vx2gQotnnmIpEPYgQ2Ug+K34gy7xkCmQnFDOAafZt/pGgsJ6X5ZITayeFWzEAL7+l+6GhHgr79L30lo4WwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ0cfQp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ0cfQp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B6BC4CEF7;
	Wed, 14 Jan 2026 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768388494;
	bh=CxZaqvDp/yK4Rd9ngRIzWQdh5v9AGp8wJjmAlsEJXfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ0cfQp+06Brz8jBqjMIuo42ObvtE2y/Icegaex6GbcBmGWltMjwy2k13Jt7bKBcB
	 CBrpsb7p6n+mRGIcxr3rv1rFv7GPX2RqoVlEOiOeo8+g7hOAm2Cyc9h/Dk8c/uAM5o
	 qzRmAHLcrd5mNu4CUEuK/6ihiWffDJTBwi5Y4W6dW+ABjgtR6SU/flQ7ANDAKxQ3cA
	 vQa8DFXVZAqtEy6pbZP19qpFq0uq7SklU6egShQ+09s9dtp42aeIfF19HpG2bIUcQp
	 I20tZu0jRb89jBQel0+eFniFYoXn+Qu90Ja7INmguFaP/G+AFI9Zf1rSgjHEhfVcbR
	 3DXDPYsOY/gVg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfycy-0000000031h-0Xfv;
	Wed, 14 Jan 2026 12:01:28 +0100
Date: Wed, 14 Jan 2026 12:01:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
Message-ID: <aWd3iFrujbRWyyyx@hovoldconsulting.com>
References: <20251121164201.13188-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121164201.13188-1-johan@kernel.org>

On Fri, Nov 21, 2025 at 05:42:01PM +0100, Johan Hovold wrote:
> Make sure to drop the reference taken when looking up the companion
> (ganged) device and its driver data during probe().
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
> Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged_probe")
> Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up now?

Johan
