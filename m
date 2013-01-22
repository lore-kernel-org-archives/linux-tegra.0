From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Tue, 22 Jan 2013 18:37:39 +0100
Message-ID: <50FECE63.7090009@tuebingen.mpg.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358179560-26799-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.01.13 17:05, Thierry Reding wrote:
> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
> special in this case because it doesn't use the generic IRQ support
> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
> interrupt handler for each display controller.
>
> While at it, clean up the way that interrupts are enabled to ensure
> that the VBLANK interrupt only gets enabled when required.
>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

... snip ...

>   struct drm_driver tegra_drm_driver = {
>   	.driver_features = DRIVER_BUS_PLATFORM | DRIVER_MODESET | DRIVER_GEM,
>   	.load = tegra_drm_load,
> @@ -96,6 +136,10 @@ struct drm_driver tegra_drm_driver = {
>   	.open = tegra_drm_open,
>   	.lastclose = tegra_drm_lastclose,
>
> +	.get_vblank_counter = drm_vblank_count,

-> .get_vblank_counter = drm_vblank_count is a no-op.

.get_vblank_counter() is supposed to return some real hardware vblank 
counter value to reinitialize the software vblank counter at vbl irq 
enable time. That software counter gets queried via drm_vblank_count(). 
If you hook this up to drm_vblank_count() it essentially returns a 
constant, frozen vblank count, it has the same effect as returning zero 
or any other constant value -- You lose all vblank counter increments 
during vblank irq off time. The same problem is present in nouveau-kms.

I think it would be better to either implement a real hw counter query, 
or some function with a /* TODO: Implement me properly */ comment which 
returns zero, so it is clear something is missing here.

thanks,
-mario

> +	.enable_vblank = tegra_drm_enable_vblank,
> +	.disable_vblank = tegra_drm_disable_vblank,
> +
>   	.gem_free_object = drm_gem_cma_free_object,
>   	.gem_vm_ops = &drm_gem_cma_vm_ops,
>   	.dumb_create = drm_gem_cma_dumb_create,
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
