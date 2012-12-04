From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Tue, 04 Dec 2012 10:11:54 +0800
Message-ID: <50BD5BEA.5030900@gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com> <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de> <50B874C7.5030208@nvidia.com> <20121130103850.GA28367@avionic-0098.adnet.avionic-design.de> <50BCFB7E.4020007@wwwdotorg.org> <20121203210328.GA20884@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121203210328.GA20884-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/04/2012 05:03 AM, Thierry Reding wrote:
[...]
> 
> One other thing that such a design can help with is refactoring common
> code or parameterizing code. Maybe newer generations are not compatible
> but can easily be made to work with existing code by introducing a
> variable such as register stride or something.
> 
> What's really difficult to follow is if an ops structure is accessed via
> some global macro. It also breaks encapsulation because you have a
> global ops structure. That may even work fine for now, but it will break
> once you have more than a single host1x in a system. I know this will
> never happen, but all of a sudden it happens anyway and the code breaks.
> Doing this right isn't very hard and it will lead to a better design and
> is less likely to break at some point.
> 

Sorry I forget to reply this in last mail...

Agree. Even for userspace programs, we should avoid using global
variables as possible as we can. So we need to think about this and try
to reduce the number of global vars.

Mark
> Thierry
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
