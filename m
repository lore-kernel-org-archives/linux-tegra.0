From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 2/8] video: tegra: Add syncpoint wait and interrupts
Date: Thu, 29 Nov 2012 11:41:50 -0700
Message-ID: <50B7AC6E.4050906@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-3-git-send-email-tbergstrom@nvidia.com> <20121129084400.GA28781@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121129084400.GA28781-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2012 01:44 AM, Thierry Reding wrote:
> On Mon, Nov 26, 2012 at 03:19:08PM +0200, Terje Bergstrom wrote:

>> diff --git a/drivers/video/tegra/host/host1x/host1x_intr.c
>> b/drivers/video/tegra/host/host1x/host1x_intr.c
> [...]
>> +/* Spacing between sync registers */ +#define REGISTER_STRIDE 4
> 
> Erm... no. The usual way you should be doing this is either make
> the register definitions account for the stride or use accessors
> that apply the stride. You should be doing the latter anyway to
> make accesses. For example:
> 
> static inline void host1x_syncpt_writel(struct host1x *host1x, 
> unsigned long value, unsigned long offset) { writel(value,
> host1x->regs + SYNCPT_BASE + offset); }
> 
> static inline unsigned long host1x_syncpt_readl(struct host1x
> *host1x, unsigned long offset) { return readl(host1x->regs +
> SYNCPT_BASE + offset); }
> 
> Alternatively, if you want to pass the register index instead of
> the offset, you can use just multiply the offset in that function:
> 
> writel(value, host1x->regs + SYNCPT_BASE + (offset << 2));
> 
> The same can also be done with the non-syncpt registers.

It seems like reasonable documentation to replace "<< 2" with "*
REGISTER_STRIDE" here.
