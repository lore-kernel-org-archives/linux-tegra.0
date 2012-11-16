From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/2] NVIDIA Tegra DRM driver
Date: Fri, 16 Nov 2012 12:36:36 +0900
Message-ID: <1480191.1noyT4vz0N@percival>
References: <1353014903-17429-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353014903-17429-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Clark <rob-l0cyMroinI0@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 16 November 2012 05:28:21 Thierry Reding wrote:
> This third version of the patch series cleans up some minor issues that
> were found in the previous versions, such as deferred probe not working
> properly and the display remaining enabled after the driver is removed.
> 
> I've also put the two patches in this series into the tegra/drm/for-3.8
> branch of my repository on gitorious[0].

Pulled from your branch and tried to test on my Ventana, but for some reason 
nothing ever gets displayed. The only DRM-related message I ever get in my log 
is

[    0.820483] [drm] Initialized drm 1.1.0 20060810

Things were working perfectly with v2 - has something changed with e.g. the DT 
bindings?

Alex.
