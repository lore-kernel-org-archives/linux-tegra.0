From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 11:42:00 +0300
Message-ID: <50349B58.4000809@nvidia.com>
References: <50323513.3090606@nvidia.com> <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de> <1345527561.31608.152.camel@markz-desktop> <20120821054256.GA5325@avionic-0098.mockup.avionic-design.de> <1345529761.31608.169.camel@markz-desktop> <20120821145709.GA701@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120821145709.GA701-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.08.2012 17:57, Thierry Reding wrote:
> Finally the upload is done. You can find my latest work in the next
> branch of the following repository:
> 
> 	git://gitorious.org/linux-tegra-drm/linux-tegra-drm.git
> 
> It's down to two patches and based on next-20120820. Eventually I was
> going to maybe split it up a bit to separate at least the hunks for
> arch/ (Stephen will probably want this anyway) and maybe also some
> functionality like HDMI support.

Hi,

What's the purpose of the drm_clients list? I notice that the drivers
register into that list, but I can't see how the list is used. I feel
like I'm missing something.

This patch ties all of the drivers to host1x. As not all host1x clients
are going to be controlled via DRM, we need to eventually decouple
these. I'm expecting the host1x hardware to controlled by nvhost driver,
and tegradrm will just call nvhost when it needs host1x.

I know it's a bit difficult to understand in concrete terms what I am
after as long as I haven't been upload any code. The memory management
is one obstacle that needs some code before nvhost is usable in upstream
kernel, and lack of device tree support is another.

If you wish me to do the required changes while I'm integrating nvhost,
just let me know.

Terje
