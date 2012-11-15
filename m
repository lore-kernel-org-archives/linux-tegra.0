From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Power sequences upstreaming (Was: Re: [PATCH] tegra: ventana: display and backlight DT entries)
Date: Thu, 15 Nov 2012 15:09:10 +0900
Message-ID: <2322802.yJhDIQtgoO@percival>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com> <193309413.vmBPZntXg4@percival> <20121115060310.GA26076@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121115060310.GA26076@lizard>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 15 November 2012 14:03:10 Anton Vorontsov wrote:
> On Thu, Nov 15, 2012 at 02:45:44PM +0900, Alex Courbot wrote:
> > Anton, David, would you agree to pull power sequences support from my tree
> >  (considering I will maintain it)? It will reside in
> > drivers/power/power_seq and as it is not a major feature it might not be
> > worth dealing with Linus directly.
> > 
> > The feature has gone through 5 review cycles, received some Acks and is
> > being  used by the pwm-backlight driver and very probably others in the
> > future (I am particularly thinking about the panel framework which is
> > likely to need them). We would like to push Tegra display support in 3.8,
> > and this feature will be needed to support our reference boards. Please
> > let me know if you would be the right intermediate or if I should ask
> > someone else.
> 
> Sure, I can easily pull your tree (assuming you guys agree on the
> subsystem design, i.e. if the code has no strong NAKs).

Excellent, thanks - when would you need the code in order to be on time for 
3.8?

Alex.
