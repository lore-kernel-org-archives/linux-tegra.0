From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Fri, 11 Oct 2013 16:13:07 -0600
Message-ID: <525877F3.9070004@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-16-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-16-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> Tegra114 uses a slightly updated version of host1x with an additional
> syncpoint.

>  drivers/gpu/host1x/hw/host1x02.c            |  42 +++++
>  drivers/gpu/host1x/hw/host1x02.h            |  26 +++
>  drivers/gpu/host1x/hw/hw_host1x02_channel.h | 121 ++++++++++++++
>  drivers/gpu/host1x/hw/hw_host1x02_sync.h    | 243 ++++++++++++++++++++++++++++
>  drivers/gpu/host1x/hw/hw_host1x02_uclass.h  | 175 ++++++++++++++++++++

That seems like an awful lot of extra lines to support just one extra
syncpoint. Are there other changes? If not, can the code be
shared/parameterized somehow?
