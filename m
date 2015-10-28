From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Wed, 28 Oct 2015 11:59:04 -0600
Message-ID: <56310CE8.3050107@wwwdotorg.org>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445230624-30314-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/18/2015 10:57 PM, Alexandre Courbot wrote:
> T210's GPU secure firmware loading requires a write-protected region
> to be set up.
>
> This patch reserves the upper 256KB of RAM as the WPR region and locks
> it so the kernel can initiate secure firmware loading.

On T210, it's the responsibility of nvtboot (which runs before U-Boot) 
to set up any and all carve-outs. This code should not be necessary, and 
indeed I expect the registers it touches can't actually be programmed 
from U-Boot, which runs in non-secure mode after WPR is already locked.
