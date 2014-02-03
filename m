From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC 00/16] drm/nouveau: initial support for GK20A (Tegra K1)
Date: Mon, 3 Feb 2014 18:33:51 +0100
Message-ID: <CAKMK7uHr7D_VqnkbLPpRpvq9-BimBaEoUtmdxQg5ePZg12ZC3g@mail.gmail.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 1, 2014 at 4:16 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Finally, support for probing GK20A is added in the last 2 patches. It should be
> noted that contrary to what Nouveau currently expects, GK20A does not embed any
> display hardware (that part being handled by tegradrm). So this driver should
> really be only used through DRM render-nodes and collaborate with the display
> driver using PRIME. I have not yet figured out how to turn GK20A's instantiation
> of Nouveau into a render-node only driver without breaking support for existing
> desktop GPUs, and consequently the driver spawns a /dev/dri/cardX node which we
> should try to get rid of.

tbh I wouldn't care about the lagecy dev nodes - we have hw platforms
on intel with similar setup (i.e. just rendering and no outputs) and
we don't bother to hide the legacy node. kms ioctl will still be
there, but as long as no encoder/connector/crtc/... gets set up by the
driver the only thing userspace can do is create framebuffers. Which
is rather harmless ;-)

And having legacy dev nodes around helps on older userspace (e.g.
X/Prime with dri2 which uses flink).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
