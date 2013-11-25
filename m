From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Provide dummy powergate implementation
Date: Mon, 25 Nov 2013 14:06:34 -0800
Message-ID: <20131125220634.GA18001@quad.lixom.net>
References: <1385405387-27265-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385405387-27265-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 25, 2013 at 11:49:47AM -0700, Stephen Warren wrote:
> From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> In order to support increased build test coverage for drivers, implement
> dummies for the powergate implementation. This will allow the drivers to
> be built without requiring support for Tegra to be selected.
> 
> This patch solves the following build errors, which can be triggered in
> v3.13-rc1 by selecting DRM_TEGRA without ARCH_TEGRA:
> 
> drivers/built-in.o: In function `gr3d_remove':
> drivers/gpu/drm/tegra/gr3d.c:321: undefined reference to `tegra_powergate_power_off'
> drivers/gpu/drm/tegra/gr3d.c:325: undefined reference to `tegra_powergate_power_off'
> drivers/built-in.o: In function `gr3d_probe':
> drivers/gpu/drm/tegra/gr3d.c:266: undefined reference to `tegra_powergate_sequence_power_up'
> drivers/gpu/drm/tegra/gr3d.c:273: undefined reference to `tegra_powergate_sequence_power_up'
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [swarren, updated commit description]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is a fix for 3.13.

Thanks, applied.

-Olof
