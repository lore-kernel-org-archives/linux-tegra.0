From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra DRM driver
Date: Mon, 12 Nov 2012 17:17:18 -0700
Message-ID: <50A1918E.1000809@wwwdotorg.org>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352757358-14001-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/12/2012 02:55 PM, Thierry Reding wrote:
> This second version of this patch series addresses all the comments
> received so far. Most notably it takes advantage of the debugfs helpers
> provided by the DRM core. Oddly enough this actually increases the line
> count, but that's because the helpers don't fit with the subdevices
> approach as implemented by this driver. However some quick discussions
> with Rob Clark showed that Tegra DRM is not special in this respect but
> other drivers may need the same functionality. Eventually the debugfs
> code could be reworked on top of helpers that are better suited at the
> design of embedded, multi-device DRM drivers.
> 
> Other than that there is some removal of code that was actually supposed
> to go into a later patch because it has dependencies that haven't been
> merged yet and some moving around of #defines and the device tree
> bindings documentation. Finally the driver now uses the DRM core's
> drm_compat_ioctl() instead of a custom and unimplemented (!) version.

The series,

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(on the Harmony board's HDMI output; I'll test other boards/outputs later).
