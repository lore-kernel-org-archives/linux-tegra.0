From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 00/16] drm/nouveau: initial support for GK20A (Tegra K1)
Date: Tue, 4 Feb 2014 11:47:13 +0900
Message-ID: <52F054B1.3030305@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com> <CANq1E4R=DWp2WBWWBbLHE2FG9HWWP=bM4wvE8etoEr1PAp0+JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1256"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANq1E4R=DWp2WBWWBbLHE2FG9HWWP=bM4wvE8etoEr1PAp0+JA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/03/2014 08:25 PM, David Herrmann wrote:
> Hi
>
> [..snip..]
>> Finally, support for probing GK20A is added in the last 2 patches. It should be
>> noted that contrary to what Nouveau currently expects, GK20A does not embed any
>> display hardware (that part being handled by tegradrm). So this driver should
>> really be only used through DRM render-nodes and collaborate with the display
>> driver using PRIME. I have not yet figured out how to turn GK20A's instantiation
>> of Nouveau into a render-node only driver without breaking support for existing
>> desktop GPUs, and consequently the driver spawns a /dev/dri/cardX node which we
>> should try to get rid of.
>
> You cannot get rid of cardX currently. It is implied by DRIVER_MODESET
> and that flag should actually be called NOT_A_LEGACY_DRIVER. So you
> cannot remove it. I did try to replace DRIVER_MODESET by an inverted
> DRIVER_LEGACY flag some time ago, but I thought it's not worth it.
>
> Anyhow, you can easily add a new flag to make
> drm_dev_register()/drm_dev_alloc() not create the drm_minor for
> DRM_MINOR_LEGACY, which would prevent the card0 node from showing up.
> But people started using the cardX interface as base interface so mesa
> might not be able to open render-nodes if the related card-node is not
> available (which is a bug in their code, so no reason to support that
> by not adding stand-alone render-nodes).

Actually my mention of /dev/dri/cardX was misleading. I was rather 
thinking about getting rid of the DRIVER_MODESET flag to correctly 
expose what the card provides, not only to user-space, but to DRM 
itself. The legacy node is ok as long as DRM itself correctly knows what 
the driver can and cannot do and fails gracefully if the user tries to 
set a mode.

DRIVER_MODESET is statically set in nouveau_drm.c, and the reason why I 
cannot get rid of it is because the driver (and its features) is 
registered with drm_pci_init() before the card is probed and its actual 
features known.

For platform devices, you could check the card features before 
registering it with drm_platform_init(), but then you have the issue 
that the driver instance is referenced by every probed card, and thus 
you cannot have cards with different capabilities.

So it seems like handling this would require the driver_features to move 
from drm_driver to drm_device, but that's quite a core change. As 
pointed out by you and Daniel, we can certainly live with the control 
and legacy nodes. Nonetheless I'd be curious to know how (and if) this 
case can be correctly handled.

Alex.
