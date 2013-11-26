From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v11 0/7] ARM: support for the Trusted Foundations secure
 monitor
Date: Mon, 25 Nov 2013 16:10:33 -0800
Message-ID: <20131126001033.GB21634@quad.lixom.net>
References: <1385274652-16415-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385274652-16415-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Nov 24, 2013 at 03:30:45PM +0900, Alexandre Courbot wrote:
> New rebase that should be ready-to-apply on the latest Tegra tree. The last
> remaining blocker is Russell's approval for this series and it is my hope to
> obtain it with this version.
> 
> There has been quite some debate around this series, notably about the SMC
> calling conventions and whether the firmware interface should be moved out of
> arch/arm. I hope that all the questions have been answered and that we can move
> forward with this series that enables NVIDIA-branded retail Tegra devices to run
> mainline.
> 
> Changes since v10:
> - Rebased on top of more recent sources since some files have been renamed in
>   mach-tegra.
> - Gave a final proof-read and extensive testing.
> 
> Alexandre Courbot (7):
>   ARM: add basic support for Trusted Foundations
>   of: add vendor prefix for Trusted Logic Mobility
>   of: add Trusted Foundations bindings documentation
>   ARM: tegra: add support for Trusted Foundations
>   ARM: tegra: split setting of CPU reset handler
>   ARM: tegra: set CPU reset handler using firmware
>   ARM: tegra: support Trusted Foundations by default

Ok, this looks good to me. Russell, do you want the first patch in your
tree or are you ok with acking that and we can take everything through
arm-soc?

The alternative is that we can have Stephen provide a stable branch with
the first patch on it and we both merge that, then the rest goes on top
of that through arm-soc.


Thanks!

-Olof
