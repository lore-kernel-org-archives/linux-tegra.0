From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: move phy driver from mach-tegra to drivers/usb
Date: Tue, 11 Sep 2012 10:34:38 -0600
Message-ID: <504F681E.4070402@wwwdotorg.org>
References: <1346851223-29180-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346851223-29180-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/05/2012 07:20 AM, Venu Byravarasu wrote:
> As part of this patch:
> 	1. Moved existing tegra phy driver to drivers/USB directory.
> 	2. Added standard USB phy driver APIs to tegra phy driver.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Felipe,

I see this patch hasn't been applied yet. Can I ask that it be deferred
to 3.8 rather than being applied for 3.7. The reason is that in 3.7, I
want to add a new include of the header that this patch moves, and
without merging the Tegra and USB PHY trees together, the two patches
together would cause a build break. Now, it's a little late to merge the
branches, since I need to send my pull requests in about 3 days, so they
hit arm-soc by 3.6-rc6.

Thanks.
