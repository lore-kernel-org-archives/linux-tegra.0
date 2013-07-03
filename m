From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: move body of head-common.S back to text section
Date: Wed, 3 Jul 2013 11:00:44 +0100
Message-ID: <20130703100044.GG24642@n2100.arm.linux.org.uk>
References: <1372805629-18382-1-git-send-email-swarren@wwwdotorg.org> <20130702232259.GH11625@codeaurora.org> <51D39004.9000907@wwwdotorg.org> <20130703051907.GA22702@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130703051907.GA22702@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 03, 2013 at 01:19:07AM -0400, Paul Gortmaker wrote:
> As an aside, I'm now thinking any __INIT that implicitly rely on EOF for
> closure are nasty traps waiting to happen and it might be worthwhile to
> audit and explicitly __FINIT them before someone appends to the file...

That hides a different kind of bug though - I hate __FINIT for exactly
that reason.  Consider this:

	.text
	blah blah blah
	__INIT
	lots of init stuff
	__FINIT
	more .text stuff

Now, someone comes along and modifies this to be:

	.text
	blah blah blah
	.data
	something else
	__INIT
	lots of init stuff
	__FINIT
	more .text stuff

Now, what is the effect of that __FINIT now?  You get the following .text
emitted into the .data section instead.  This is basically the same problem
you've just encounted.

Maybe:

	__FINIT
	.text

is the safest solution - and __FINIT becomes just a no-op marker to avoid
anyone relying on its properties.
