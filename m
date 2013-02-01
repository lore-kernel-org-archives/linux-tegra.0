From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 0/8] Support for Tegra 2D hardware
Date: Fri, 1 Feb 2013 03:29:16 -0800
Message-ID: <510BA70C.7070103@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358250244-9678-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15.01.2013 03:43, Terje Bergstrom wrote:
> This set of patches adds support for Tegra20 and Tegra30 host1x and
> 2D. It is based on linux-next-20130114. The set was regenerated with
> git format-patch -M.
> 
> The fifth version merges DRM and host1x drivers into one driver. This
> allowed moving include/linux/host1x.h back into the driver and removed
> the need for a dummy platform device. This version also uses the code
> from tegradrm driver almost as is, so there are a lot less actual code
> changes.
> 
> This patch set does not have the host1x allocator, but it uses CMA
> helpers for memory management.
> 
> host1x is the driver that controls host1x hardware. It supports
> host1x command channels, synchronization, and memory management. It
> is sectioned into logical driver under drivers/gpu/host1x and
> physical driver under drivers/host1x/hw. The physical driver is
> compiled with the hardware headers of the particular host1x version.
> 
> The hardware units are described (briefly) in the Tegra2 TRM. Wiki
> page https://gitorious.org/linux-tegra-drm/pages/Host1xIntroduction
> also contains a short description of the functionality.
> 
> The patch set merges tegradrm into host1x and adds 2D driver, which
> uses host1x channels and sync points. The patch set also adds user
> space API to tegradrm for accessing host1x and 2D.

Could you please have a look at the patch set? Are you expecting me to
do something? I got barely any response (only one from Stephen), which
means host1x upstreaming is completely stalled.

Lucas mentioned in another thread that he'd need to review also libdrm,
and then there's the host1x allocator issue which Lucas wanted to create
but hasn't had time.

Could we postpone the host1x allocator to a later patchset? It shouldn't
be a merge blocked, as it shouldn't have an API impact, and it is
strictly needed with IOMMU support. The DRM CMA helper is already working.

If the amount of code related to channels are the problem, should we
scope this patch set to include only sync point support and drop
channels, debug and 2D driver? That way we could get at least the basic
code rearrangement done.

Terje
