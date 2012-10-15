From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH REPOST] usb: phy: tegra remove include of <mach/iomap.h>
Date: Mon, 15 Oct 2012 15:22:07 -0600
Message-ID: <507C7E7F.9090605@wwwdotorg.org>
References: <1350324996-30838-1-git-send-email-swarren@wwwdotorg.org> <20121015192240.GB373@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121015192240.GB373-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2012 01:22 PM, Felipe Balbi wrote:
> hi,
> 
> On Mon, Oct 15, 2012 at 12:16:36PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Almost nothing from this file is used, and the file will
>> hopefully be deleted soon. Copy the tiny portions that are used
>> directly into tegra_usb_phy.c. I believe that Venu Byravarasu is
>> working on cleaning up our USB driver, and those cleanups will
>> remove the need for these constants.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> Acked-by: Venu
>> Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- Felipe, Greg,
>> 
>> This patch is needed in the Tegra branch, since it's a dependency
>> for cleanup required to support single zImage.
>> 
>> However, I suspect/hope there will be significant improvements to
>> the Tegra USB driver in 3.8, and this change may merge-conflict
>> with those. It may be simplest if this patch can /also/ be taken
>> through the USB tree and so act as a baseline for any Tegra USB
>> work.
>> 
>> As such, may I please request this patch be merged into a
>> separate branch/tag in the USB tree, which is then merged into
>> both the Tegra and USB trees.
> 
> I can take this through my transceiver branch, but I would really
> like to see v3.8 having a real (platform_)driver ready. The current
> state of that code is quite bad IMHO and needs some love.

Thanks for getting back on this. Please don't *just* take this through
your tree though. What I'm asking for above is a topic branch
containing just this commit, so that commit and branch can be merged
into both your USB branch and my Tegra branch.

Thanks.
