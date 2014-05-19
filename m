From: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/7] drm/tegra: Convert to master/component framework
Date: Mon, 19 May 2014 10:56:08 +0200
Message-ID: <CAH9NwWfF_rMWqPRzr7sPFkwwME1ZXG8=Np3NHDEib1MDm1tgWA@mail.gmail.com>
References: <1399995050-28435-1-git-send-email-thierry.reding@gmail.com> <1399995050-28435-6-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399995050-28435-6-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2014-05-13 17:30 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Instead of the current implementation, reuse the recently introduced
> master/component framework, which is equivalent in most regards. One
> issue is that there is no device to bind the DRM driver to. In order
> to still allow the driver to be probed, expose an interface from the
> host1x device and provide an interface driver to bind to that.
>
> The interface driver then registers (or removes) the master that will be
> used to instantiate and bind the DRM driver. Since the drm_host1x bus
> implementation is now gone the dummy device instantiated by it can no
> longer be used as the parent for the DRM device. However since the
> parent device doesn't need to be modified, the host1x parent device that
> exposes the interface can be used instead.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Is there a git tree somewhere to have a look at? I am interested in the usage
of the master/component framework.

thanks
--
Christian Gmeiner, MSc

https://soundcloud.com/christian-gmeiner
