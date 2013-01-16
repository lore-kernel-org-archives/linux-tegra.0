From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5 7/8] ARM: tegra: Add board data and 2D clocks
Date: Wed, 16 Jan 2013 10:10:09 +0200
Message-ID: <50F66061.20509@nvidia.com>
References: <1358249182-17486-1-git-send-email-tbergstrom@nvidia.com> <1358249182-17486-8-git-send-email-tbergstrom@nvidia.com> <50F5A3A6.7000801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F5A3A6.7000801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15.01.2013 20:44, Stephen Warren wrote:
> On 01/15/2013 04:26 AM, Terje Bergstrom wrote:
>> Add a driver alias gr2d for Tegra 2D device, and assign a duplicate
>> of 2D clock to that driver alias.
> 
> FYI on this one patch - it won't be applied to the Tegra tree until
> after Prashant's common clock framework changes are applied. As such, it
> will need some rework once those patches are applied, or perhaps won't
> even be relevant any more; see below.

It looks like I need to just drop the patch 7(8 "ARM: tegra: Add board
data and 2D clocks" and change the 2D code to access the clock without a
name. Do you agree?

I'll roll this into the next patch version once I've gathered more comments.

diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index dc7d6c6..a1c5f5c 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -259,7 +259,7 @@ static int gr2d_probe(struct platform_device *dev)
        if (!gr2d)
                return -ENOMEM;

-       gr2d->clk = devm_clk_get(&dev->dev, "gr2d");
+       gr2d->clk = devm_clk_get(&dev->dev, NULL);
        if (IS_ERR(gr2d->clk)) {
                dev_err(&dev->dev, "cannot get clock\n");
                return PTR_ERR(gr2d->clk);

Terje
