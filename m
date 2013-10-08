From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to
 host1x
Date: Tue, 8 Oct 2013 09:25:39 +0300
Message-ID: <5253A563.1060409@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-14-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-14-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.10.2013 11:34, Thierry Reding wrote:
> The Tegra DRM driver currently uses some infrastructure to defer the DRM
> core initialization until all required devices have registered. The same
> infrastructure can potentially be used by any other driver that requires
> more than a single sub-device of the host1x module.
> 
> Make the infrastructure more generic and keep only the DRM specific code
> in the DRM part of the driver. Eventually this will make it easy to move
> the DRM driver part back to the DRM subsystem.

Do we need the host1x_client/tegra_drm_client concept outside DRM? You
separated the two in an earlier patch, but the whole structure is there
because of limitation in DRM. Shouldn't we keep management of drm
clients entirely inside drm?

Second, do we need an own drm_bus for host1x clients? Does it bring
something drm_platform doesn't? I couldn't see any immediate difference
between the two.

Terje
