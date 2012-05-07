From: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: moving Tegra30 to the common clock framework
Date: Sun, 6 May 2012 17:03:29 -0700
Message-ID: <20120507000329.GB14559@gmail.com>
References: <20120503161311.GG20304@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120503161311.GG20304-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20120503-19:13, Peter De Schrijver wrote:
> Hi,
> 
> I started looking into what would be needed to move our tegra30 clock code
> to the common clock framework. The tegra30 clocktree is rather flat. Basically
> there are a bunch of sources (13 PLLs, external audio clocks, osc and 32Khz)
> and peripheral clocks which have a mux (with 4 or more inputs), a divider and
> a gate. So almost every peripheral clock can have multiple parents.
> 
> Some questions:
> 
> 1) should these peripheral clocks be modelled as 3 different clocks
>    (mux -> divider -> gate) or would it be better to make a new clock type for
>    this?
> 

That is really for you to decide.  If the semantics of the existing mux,
divider and gate in drivers/clk/clk-*.c work well for you then I think
the answer is "yes".  There is infrastructure for register-access
locking in those common types which might help your complex clocks.

Thanks to the parent rate propagation stuff in clk_set_rate it should be
possible for your drivers to only be aware of the gate and call
clk_set_rate on only that clock, which propagates up to the divider and,
if necessary, again propagates up to the mux.

I encourage you to try that first.  But if you find the semantics of
those basic clock types aren't cutting it for you then you must create a
type which is platform-specific.

> 2) how to define the default parent? in many cases the hw reset value isn't
>    a very sensible choice, so the kernel probably needs to set a parent of
>    many of them if we don't want to rely on bootloader configuration.

The only related thing handled at the framework level is _discovery_ of
the parent during clock registration/initialization.  If you don't trust
the bootloader and want to set things up as soon as possible (a wise
move) then I suggest you do so from your platform clock code at the same
time that you register your clocks with the framework.  Something like:

	struct clk *c;
	c = clk_register(...);
	if (IS_ERR(c))
		omg_fail();
	clk_set_parent(c, b);

Where 'b' is a parent of 'c'.  Register your clock tree top-down and you
can re-parent as you go.

Regards,
Mike
