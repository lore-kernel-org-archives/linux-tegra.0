Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF9326927;
	Thu, 25 Jun 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376463; cv=none; b=KqSi8Xr9EOZpsY3w02zLyck8Rae1TIVVQFCaswH3sTA3Gi+rwn7GY9GqaANoJNQjUEoLUT+lR6HpT1BiTEflv2xZRd8pRv0bvHrO8uc4ShwbRUU/M0UWTiuxfh4YmyD4FpygDV/Xqg1/ov4+Yj5xX6q0W2SxvI7tDlafwf2171Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376463; c=relaxed/simple;
	bh=jkHuq+aWcDX/8nA6BwwAfyDf2vD4pL0yEgIxFBKGs4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHMpVWxyaZ5GyqCHG0yzeptA1fiVGirMcyzYDV4MAlXpvk+I2U7I+ZHjwvwhcL55ktqEfYiGrFdcXgxOBQFbtpNZu8DWjNR2nHmn9E3CkcjKK8H3jzBEab41910wBNny5Z04shNJU2AwitIkGkl+h3ZHG5gpD4l0Jj4gt3luD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIpmk87a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIpmk87a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9D11F000E9;
	Thu, 25 Jun 2026 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376462;
	bh=jkHuq+aWcDX/8nA6BwwAfyDf2vD4pL0yEgIxFBKGs4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mIpmk87a1O17ZA9QaCQ4gygtPORIjx/LUMWppLF46QEB/E92hIl9n9YoMQAGkiQTO
	 MSIanUm5GcOG6+cjVln91x43uf38AWaelLpXm08dCRypqsY5rMywlzaM0VwL4H78aY
	 rM5KwlB20YNllXLWoipxxXxaQQrDxkMqLxwSV63yDebROFUmPdFcrXvl5dR7p2Vgsn
	 ugmrsEqOhmTBY9C+rrv71jgzJIE5EcOHbYyEGyEntlrVQVlMSDvrZSzODg1nZnggNq
	 V6h9jbfWjIixxbc1103eQtnD1i1LXUjfXh6lfa2j4nVSn9Fg8APyDsPRAiLf1o0a6u
	 d21pPb44bSRoQ==
Date: Thu, 25 Jun 2026 10:34:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: tegra: Make non-vm registers
 optional
Message-ID: <20260625-hospitable-antelope-of-diversity-f3456d@quoll>
References: <20260622-host1x-nohv-v1-0-65bc682a617f@nvidia.com>
 <20260622-host1x-nohv-v1-1-65bc682a617f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622-host1x-nohv-v1-1-65bc682a617f@nvidia.com>

On Mon, Jun 22, 2026 at 05:22:50PM +0900, Mikko Perttunen wrote:
> Host1x can be used without accessing the hypervisor or common
> registers. Adjust the bindings to make them optional.

You still have these registers in the hardware, so it is not optional,
not flexible. IOW, DTS represents the view of real hardware for the
software, and that hardware still has this address space regardless if
OS should use it or not.

Otherwise you need to provide better background here.

Best regards,
Krzysztof

