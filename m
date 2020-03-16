From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Date: Mon, 16 Mar 2020 09:05:46 +0000
Message-ID: <20200316090546.5eufi423ahstz6v3@holly.lan>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
 <20200224143732.rreev3ypou26hvx3@holly.lan>
 <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6ec74817-968b-ab5e-6566-56bbb9b67599-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 13, 2020 at 02:16:16PM +0000, Jon Hunter wrote:
> Hi Lee, Daniel,
> 
> On 24/02/2020 14:37, Daniel Thompson wrote:
> > On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
> >> If probing the LP885x backlight fails after the regulators have been
> >> enabled, then the following warning is seen when releasing the
> >> regulators ...
> >>
> >>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
> >>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
> >>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
> >>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> >>
> >>  ...
> >>
> >> Fix this by ensuring that the regulators are disabled, if enabled, on
> >> probe failure.
> >>
> >> Finally, ensure that the vddio regulator is disabled in the driver
> >> remove handler.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Reviewed-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> I received a bounce from Milo's email and so I am not sure that his
> email address is still valid.
> 
> Can either of you pick this up?

Lee generally starts to hoover up patches about this stage in the dev
cycle so I'd expect this to move fairly soon.


> Not sure if we should update the MAINTAINERS as well?

Sounds like a good plan, yes.


Daniel.
