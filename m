From: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Power sequences upstreaming (Was: Re: [PATCH] tegra: ventana:
 display and backlight DT entries)
Date: Wed, 14 Nov 2012 22:03:10 -0800
Message-ID: <20121115060310.GA26076@lizard>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com>
 <1393946.fMW2YXfOao@percival>
 <50A3C24C.6090004@wwwdotorg.org>
 <193309413.vmBPZntXg4@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <193309413.vmBPZntXg4@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 15, 2012 at 02:45:44PM +0900, Alex Courbot wrote:
> On Thursday 15 November 2012 00:09:48 Stephen Warren wrote:
> > On 11/13/2012 10:36 PM, Alex Courbot wrote:
> > > - If I am to take maintainership of the feature, I guess I will have to
> > > get
> > > the patches sufficiently Ack'ed by enough people, and also have someone
> > > else pull from my tree (Linus? Or maybe some other power maintainer?). I
> > > am not familiar with the exact procedure here - moreover, my GPG key only
> > > has one signature from a trusted kernel dev, I am not sure if this is
> > > enough.
> > It's probably best to go ask whoever maintains the rest of the code in
> > the directory above where you placed it. See if they'll take your pull
> > request. If not, you can try sending directly to Linus, CCing enough
> > other known people to get acks (I think you already collected a few right?)
> 
> Anton, David, would you agree to pull power sequences support from my tree 
> (considering I will maintain it)? It will reside in drivers/power/power_seq 
> and as it is not a major feature it might not be worth dealing with Linus 
> directly.
> 
> The feature has gone through 5 review cycles, received some Acks and is being 
> used by the pwm-backlight driver and very probably others in the future (I am 
> particularly thinking about the panel framework which is likely to need them). 
> We would like to push Tegra display support in 3.8, and this feature will be 
> needed to support our reference boards. Please let me know if you would be the 
> right intermediate or if I should ask someone else.

Sure, I can easily pull your tree (assuming you guys agree on the
subsystem design, i.e. if the code has no strong NAKs).

Thanks,
Anton.
