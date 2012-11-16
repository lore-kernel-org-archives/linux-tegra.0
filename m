From: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Power sequences upstreaming (Was: Re: [PATCH] tegra: ventana:
 display and backlight DT entries)
Date: Thu, 15 Nov 2012 23:45:26 -0800
Message-ID: <20121116074526.GB22291@lizard>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com>
 <2322802.yJhDIQtgoO@percival>
 <20121115062502.GA27702@lizard>
 <2366856.r59NhafGja@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2366856.r59NhafGja@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 16, 2012 at 02:52:12PM +0900, Alex Courbot wrote:
> On Thursday 15 November 2012 14:25:02 Anton Vorontsov wrote:
> > > Excellent, thanks - when would you need the code in order to be on time
> > > for 3.8?
> > 
> > Generally, that would be one week before the merge window, i.e. when Linus
> > announces that some -rc is the last one.
> 
> Ok, I will try to make sure you get something at least during the weekend. 
> Would like to post a new revision today in order to get some more Acks though.
> 
> Btw, when issuing my pull request to you, should I place Linus or someone else 
> in CC? We are introducing a new feature in the kernel, and since you are the 
> intermediate he might not hear about it otherwise. I am not very familiar with 
> the chain of trust of the kernel yet.

It's up to you. Usually, though, there's no reason to do so, unless it's a
major feature (e.g. a new general purpose filesystem or architecture, or a
vast memory management rework) or contraversal feature (with people
constantly arguing about it).

Thanks,
Anton.
