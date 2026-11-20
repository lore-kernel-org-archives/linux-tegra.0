Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185111;
	b=oTmhuc/Tpan2akWvZLlSL13trhP90IrgGqNE4N57yaF5qpPPEuh7c92FU1Fh54iWveVy
	 HGYnJwNa7qP4TgYti/QIuOy/wisiFnohC1tsFZvnY6U9HKzdecw91h8Jm8c8bbk5M9DiA
	 Tcf0vhYH3sf+OK7QWDVQLJTueIe/5NC51LTQoTRGcQ0JAjYlItfGLuaICgBgmbVrm/PNE
	 ntF5CoDey7OKxAqvN91ffwCqJBhzjKfjhqmrpErJfPBtmR+vtx1kZvkRBx5Vd/RmrU4pk
	 ON+nVSIn97lTwOIo0cQ+11x5PzQ3J1QTOaR+WlBgL1J3DaK0WV5/zfW2vmmdWaECiFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185111;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UKqMm3UXGqso/anZy4h8q75LGkn2zjk5fh4PpP+m3sA=;
	b=NC1+ZI0jbof8n/Ic8AjOwOUtdmhgFbRGtn/sUbkKItpyxSJY2pQTBAKqy3C9X7SYg7d0
	 IyB+wkK1cq7w8Kn0a2ixFIK+H9rlRAD1sP3RAq+whnr881UF8Er7xjZgrUhQGCEfvxuSU
	 x55Uf4y8Sg0PP7XUgqlqhmkXy7lttYzGFYlS9T+/JlGXuqVbhxtvO5FKdAoVnFZ0Aj1Ds
	 dBmRlCieq1QvEWhQuH/08IoY+1Bkv7hUTtIiOQnmlVBLJZqVua7zio3jSJ1U/LQkxI4sF
	 sWFHjzDsxOlDzVCbqhzrCXaVIoz/C2BgSwznJf/876q9JPK7BifhRTN7eeSgQybEw/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HgLDQrvT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66CF60A2629;
	Fri, 20 Nov 2026 14:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66CF60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HgLDQrvT
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB45B177;
	Fri, 20 Nov 2026 15:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795184959;
	bh=PbMjJCJgx3+izFU6cu2LfBSpM6luqbK+uhrzCbmlxRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HgLDQrvTF2KGEte1LaI3I+6S2Tni780bRwGgmjKdrNLC0OKZxcddLdVRb9ppXqDOZ
	 wlAKCmPbwgEnHD8zLOIX5bZvCcnc6RtQaEh7zKeZfaYd9NRkqHZw3fOF6+p7QjRfhL
	 4d41Ax3rGdKiHr9a4c2O3bKzIlpH1Ymj0Y66emr8=
Date: Fri, 20 Nov 2026 16:31:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to
 media/platform/nvidia
Message-ID: <20261120143147.GA2466366@killaraus.ideasonboard.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-2-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113161819.36847-2-clamor95@gmail.com>

On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> The Tegra Video Input drivers are mature and developed enough to be moved
> from staging into the media subsystem. No other changes are introduced.

The driver should at least be converted to be MC-centric before being
moved out of staging. I haven't checked if other changes would also be
needed.

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/platform/nvidia/Kconfig                           | 2 ++
>  drivers/media/platform/nvidia/Makefile                          | 1 +
>  .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
>  .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
>  .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
>  .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
>  .../media => media/platform/nvidia}/tegra-video/video.c         | 0
>  .../media => media/platform/nvidia}/tegra-video/video.h         | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
>  .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
>  drivers/staging/media/Kconfig                                   | 2 --
>  drivers/staging/media/Makefile                                  | 1 -
>  17 files changed, 3 insertions(+), 3 deletions(-)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
>  rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

-- 
Regards,

Laurent Pinchart
