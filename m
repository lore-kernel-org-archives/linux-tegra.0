From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: move body of head-common.S back to text section
Date: Wed, 3 Jul 2013 18:20:01 +0100
Message-ID: <20130703172001.GH24642@n2100.arm.linux.org.uk>
References: <1372805629-18382-1-git-send-email-swarren@wwwdotorg.org> <20130702232259.GH11625@codeaurora.org> <51D39004.9000907@wwwdotorg.org> <20130703051907.GA22702@windriver.com> <20130703100044.GG24642@n2100.arm.linux.org.uk> <20130703153012.GK22702@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130703153012.GK22702-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 03, 2013 at 11:30:12AM -0400, Paul Gortmaker wrote:
> [Re: [PATCH] ARM: move body of head-common.S back to text section] On 03/07/2013 (Wed 11:00) Russell King - ARM Linux wrote:
> 
> > On Wed, Jul 03, 2013 at 01:19:07AM -0400, Paul Gortmaker wrote:
> > > As an aside, I'm now thinking any __INIT that implicitly rely on EOF for
> > > closure are nasty traps waiting to happen and it might be worthwhile to
> > > audit and explicitly __FINIT them before someone appends to the file...
> > 
> > That hides a different kind of bug though - I hate __FINIT for exactly
> > that reason.  Consider this:
> 
> Agreed - perhaps masking that it is a ".previous" just hides the fact
> that it is more like a pop operation vs. an on/off operation, or per
> function as we have in C.

I read the info pages, because I thought it was a pop operation too.
I was concerned that .section didn't push the previous section onto the
stack.

However, .popsection is the pseudio-op which pops.  .previous just toggles
the current section with the section immediately before it.

So:

	.text
	.data
	.previous
	/* this is .text */
	.previous
	/* this is .data */
	.previous
	/* this is .text */
	.previous
	/* this is .data */

> That seems reasonable to me.  I can't think of any self auditing that is
> reasonably simple to implement.  One downside of __FINIT as a no-op vs.
> what it is today, is that a dangling __FINIT in a file with no other
> previous sections will emit a warning.  But that is a small low value
> corner case I think.

That warning from __FINIT will only happen if there has been no section
or .text or .data statement in the file at all.  As soon as you have any
statement setting any kind of section, .previous doesn't warn.

So:

	.text
	...
	__FINIT

produces no warning.
