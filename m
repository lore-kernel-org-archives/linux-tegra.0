Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974617;
	b=V84AR9uCrfyUqOlE3FHURf6u3UnFQJY/WwEWigJ4uSLmfGEEW7F5PbHxAEyPgu/CRKbJ
	 IEfk60NJlIFclE8gCWeSROiEVeMDtliEYq3Un0Ctn/wPjbJjYqdmuyrUB8bd37P05Z+iZ
	 dqtHGPGyw7WCPJskN3Wrhk+ge9jL55uRbkl/OIOly+osP2TD9SzB5qk0RJGsT3RJtBukY
	 7bK2H1FsdjWYvaTCRb0hbI+XOmJeTaDkalJsGKSQdaEe8GHXV6w/5C4F4NDsijudJX9Wq
	 J5A4mJal6fKT5zIalGwe+ft7Moby3elzC/N9qctmy5rd0bKcGX/6BGWyioDT1vHSOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974617;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dwXHHpm3CuU/WL5LiGP9uPvStnllZcs54IcKag8FfB8=;
	b=vt8FyyX1KyQMGkWlqpX80iCPiu/HXXVcreC3ry7Xg5ckTLhg3Ns4XzUb87YFOY5AMUmZ
	 Ssmyls7bejOcy2NUgOoTcXW6u9T+HKBc/DwukfXe9L+X31LKrlpbWz05yyWRypiGqQrAK
	 xF+Pa9GiFI982bgWJQgpmHLrhEQ6H8hh3e35Uebj0N+UFS/+DgxHM6s9+fZkRFYTlkUqD
	 NmI+W9sbiy2fu1haMokf+WQtvCnDJ7ZB4upI/VwRYKKAeeEo95mAv/ULfD+cmw5Qr9MyY
	 dEosxCh3L9ZIRVcep6HQm/LIgUnZRxuuUciN0xGANjMxuHiiUJwJOUgWkew5Vlm9MSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g11xEAwD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD48606A326;
	Fri,  6 Nov 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g11xEAwD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587F31F008AB;
	Fri,  6 Nov 2026 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974616;
	bh=dwXHHpm3CuU/WL5LiGP9uPvStnllZcs54IcKag8FfB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g11xEAwDI+0oChFkS4bRa3cXnLHKP4QCFHvBnsTlh4KVSDwQzEctFtGXMpnaImf9Y
	 AJzcwR+ywpe5HuPPTZ5wt4C9CgTmoUGnp4RzJKIVvu/JPxrai5QE/uB+jO0mCbTIiy
	 icM4FgM9zAlSTWojIfDWFrhGu7x5Wqp4V58/CEf3RE/FEC8yJRRnsuMaVwy8jpiGI+
	 2nHCnEUkJah2+3zxo6hyycPaDPd+b5NyKvreqGpAzyLHjmd4hpF1Fx+PzfLd0CZIpc
	 7IY8t3s2WaKJ0RGQA1t++NFqdUbKwLvwgTWgq1jwKrvnZ+YTqmNPUQ6wQTrMZpamw4
	 XoRN48wjpCcfg==
Date: Fri, 6 Nov 2026 08:16:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 05/10] dt-bindings: display: tegra: Document Tegra20
 DSI port
Message-ID: <179397461264.2992702.17337813112926510440.robh@kernel.org>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-6-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105140510.165165-6-clamor95@gmail.com>


On Thu, 05 Nov 2026 16:05:05 +0200, Svyatoslav Ryhel wrote:
> Document the optional port node, which is required for correctly modeling
> a dual-mode panel.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

