From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] drm/tegra: Changes for v3.20-rc1
Date: Tue, 27 Jan 2015 09:10:09 +1000
Message-ID: <CAPM=9tyCE=-OVxk=jyP9v9qrXDLD0OrrAP4_ZEOp7V10651VEQ@mail.gmail.com>
References: <1422021383-4284-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422021383-4284-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23 January 2015 at 23:56, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Dave,
>
> The following changes since commit 281d1bbd34b734e4f22b30b6f3b673dda46a7470:
>
>   Merge remote-tracking branch 'origin/master' into drm-next (2015-01-22 10:44:41 +1000)
>
> are available in the git repository at:
>
>   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.20-rc1
>
> for you to fetch changes up to 28dd241d37bd136e140c884897f64b79bf8d7a83:
>
>   drm/tegra: Use correct relocation target offsets (2015-01-23 12:17:04 +0100)

  MODPOST 1728 modules
ERROR: "host1x_unregister" [drivers/gpu/host1x/host1x.ko] undefined!
ERROR: "host1x_register" [drivers/gpu/host1x/host1x.ko] undefined!
ERROR: "host1x_driver_register_full"
[drivers/gpu/drm/tegra/tegra-drm.ko] undefined!
ERROR: "host1x_device_exit" [drivers/gpu/drm/tegra/tegra-drm.ko] undefined!
ERROR: "host1x_client_unregister" [drivers/gpu/drm/tegra/tegra-drm.ko]
undefined!
ERROR: "host1x_driver_unregister" [drivers/gpu/drm/tegra/tegra-drm.ko]
undefined!
ERROR: "host1x_device_init" [drivers/gpu/drm/tegra/tegra-drm.ko] undefined!
ERROR: "host1x_client_register" [drivers/gpu/drm/tegra/tegra-drm.ko] undefined!

you win the broke my build prize.

Please try again :-)

just put the fix on top of this and send a new pull req, it looks trivial.

Dave.
