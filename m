From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: tegra: paz00: enable backlight
Date: Sat, 17 Nov 2012 15:23:40 +0100
Message-ID: <123016999.bBqXnoyJOV@ax5200p>
References: <138e6f406aef20f6257a8f90af45865bd9c88092.1353107865.git.marvin24@gmx.de> <4de446eaf895ffa01d397cf70cec02620e16f690.1353107865.git.marvin24@gmx.de> <20121117073534.GD26391@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121117073534.GD26391-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 17 November 2012 08:35:34 Thierry Reding wrote:
> On Sat, Nov 17, 2012 at 12:20:32AM +0100, Marc Dietrich wrote:
> [...]
> 
> > +				step1 {
> > +					type = "gpio";
> > +					gpio = <&gpio 4 0>;   /* gpio PA4, en_vdd_pnl  */
> > +					value = <1>;
> > +				};
> > +				step2 {
> > +					type = "gpio";
> > +					gpio = <&gpio 176 0>; /* gpio PW0, bl_vdd */
> > +					value = <1>;
> > +				};
> 
> These look like regulators, so maybe they should be abstracted as such?

Honstly, I never understood why we need to redefine a gpio as a regulator. 
IMHO, gpios don't regulate, they switch 0/1. But yes, these gpios just go to 
some FET which switches on some supply voltage.

Marc
