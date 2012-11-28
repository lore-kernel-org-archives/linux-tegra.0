From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm: tegra: Add maintainers entry
Date: Wed, 28 Nov 2012 07:57:53 -0800
Message-ID: <1354118273.29762.5.camel@joe-AO722>
References: <1354101017-31844-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354101017-31844-1-git-send-email-thierry.reding@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-11-28 at 12:10 +0100, Thierry Reding wrote:
> Add myself as the maintainer of the NVIDIA Tegra DRM driver.

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -2504,6 +2504,14 @@ S:	Supported
>  F:	drivers/gpu/drm/exynos
>  F:	include/drm/exynos*
>  
> +NVIDIA TEGRA DRM DRIVER

Alphabetic order please
Maybe DRM DRIVER FOR NVIDIA TEGRA if you really want
to use this file location

> +M:	Thierry Reding <thierry.reding@avionic-design.de>
> +L:	dri-devel@lists.freedesktop.org
> +T:	git://gitorious.org/thierryreding/linux.git

T:	git git://gitorious.org/thierryreding/linux.git

> +S:	Maintained
> +F:	drivers/gpu/drm/tegra

F:	drivers/gpu/drm/tegra/
