From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] drm/nouveau: support for probing
	platform devices
Date: Wed, 2 Jul 2014 18:09:03 +0900
Message-ID: <CAAVeFu+O+Z7kQ3Sre=WKkcYoxXYUx4zCzZK8cVMj1WAtwA5eMg@mail.gmail.com>
References: <1403760814-26148-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403760814-26148-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 26, 2014 at 2:33 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This series adds support for probing platform devices on Nouveau, as well as
> the DT bindings for GK20A. It doesn't enable the GPU yet on Tegra boards since
> a few extra things need to be supported before that.
>
> This version is mostly identical to v2 but fixes an important issue: the drvdata
> must be set to the drm_device for sysfs to work, so the platform device
> structure now includes the nouveau_device flattened into it to let us compute
> the address of one from the other. Since the platform device resources (clocks,
> regulators, ...) need to live longer than the nouveau_device, they are stored
> into their own structure which is allocated separately.
>
> Changes since v2:
> * Allocate the nouveau_device flattened into the nouveau_platform_device to
>   be able to compute one from another easily, without having to ressort on the
>   drvdata which is required to store the drm_device.
> * Only propose the platform driver if a supported arch (Tegra for now) is
>   enabled.
> * Move structure definitions into their own header file as some subdevs (e.g.
>   clocks) will need to use them.
>
> Changes since v1:
> * Moved the platform device driver to its own module. This allows it to be more
>   self-contained and saves us the need to export too many functions from
>   nouveau_drm and nouveau_platform.
> * Register the DRM device without using the platform helpers, which is made
>   possible by drm_dev_set_unique(). This allows us to catch and register the
>   DRM device during platform probe.
> * Fixed the clock names in the DT bindings.
> * Removed the patches enabling GK20A on Venice2 and Jetson TK1 as support
>   is not complete yet.

Stephen, Thierry,

Ben has merged the first patch of this series into the Nouveau tree.
Could you get patches 2 and 3 through the Tegra tree? Thanks!
