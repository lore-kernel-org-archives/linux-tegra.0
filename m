From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 37/37] ARM: dts: tegra20-ventana: Fix regulator enable
 GPIO polarity
Date: Mon, 12 Oct 2015 15:34:43 -0600
Message-ID: <561C2773.5090408@wwwdotorg.org>
References: <1444684386-17094-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <1444684386-17094-38-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444684386-17094-38-git-send-email-laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/12/2015 03:13 PM, Laurent Pinchart wrote:
> The enable GPIO is active low,

It'd be good to mention a justification for that statement in the 
patches, since the cover letter isn't going to be checked in.

> but is flagged as active high in the gpio
> property. As the gpio property flags are currently unused by the driver
> this doesn't cause any issue for now, but will break later if the driver
> starts making use of the flags. Fix it.

IIRC the history here was that for some bizarre reason not all GPIO 
bindings contained an active-high/low flag and there was resistance to 
extending them in a backwards compatible way. So the regulator binding 
needed the separate property to represent this. For bindings that did 
have the flag, we had to set the GPIO flag to active-high, so that if 
anything started honoring the GPIO flags (e.g. I thikn the gpiod API 
does today, but the legacy GPIO API doesn't), we wouldn't apply both 
"active low indicators", and end up driving an active-high signal, and 
breaking things.

So while this change is logically correct when read in isolation (and 
for Harmony, Seaboard, and Ventana I verified that these regulators do 
use an active-low GPIO), I worry that making it makes mistakes likely 
later. How would we mitigate that?
