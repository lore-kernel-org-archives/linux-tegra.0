From: Andrey Danin <andrey.danin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Tue, 24 Sep 2013 11:39:21 +0400
Message-ID: <1380008361.20958.3.camel@AndreyDanin-LNX>
References: <1416005.VvfEeGuSWa@ax5200p>
	 <17687182.lGWlO75r41@fb07-iapwap2.physik.uni-giessen.de>
	 <5238CE1C.3050107@wwwdotorg.org>
	 <2112732.zfJtNyCk0i@fb07-iapwap2.physik.uni-giessen.de>
	 <52406E1E.5040005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52406E1E.5040005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-09-23 at 10:36 -0600, Stephen Warren wrote:
> On 09/23/2013 08:52 AM, Marc Dietrich wrote:
> > Am Dienstag, 17. September 2013, 15:48:12 schrieb Stephen Warren:
> >> On 09/17/2013 01:53 AM, Marc Dietrich wrote:
> >>> Hi Stephen,
> >>>
> >>> Am Mittwoch, 31. Juli 2013, 15:03:14 schrieb Stephen Warren:
> >>>> The generic I2C bindings already define that the other chips on the I2C
> >>>> bus appear directly underneath the I2C controller's DT node. Perhaps it
> >>>> isn't a big issue to change that, since each I2C controller can define
> >>>> the layout of its own node?
> >>>>
> >>>> Anyway, we can probably get away without introducing multiple levels by
> >>>> adding some more bits or cells into the reg address for I2C child nodes:
> >>>>
> >>>> i2c@xxxxxxxx {
> >>>>
> >>>> 	compatible = "nvidia,tegra20-i2c";
> >>>> 	... resources
> >>>> 	#address-cells = <2>;
> >>>> 	
> >>>> 	codec {
> >>>> 	
> >>>> 		// 0 means external slave, 0x1c is slave's address
> >>>> 		reg = <0 0x1c>;
> >>>> 		...
> >>>> 	
> >>>> 	};
> >>>> 	
> >>>> 	tegraslave {
> >>>> 	
> >>>> 		// 0 means internal slave, 0x80 is controller's address
> >>>> 		reg = <1 0x80>;
> >>>> 		...
> >>>> 	
> >>>> 	};
> >>>>
> >>>> };
> >>>>
> >>>> ... where each of those child nodes could be repeated N times. We could
> >>>> also or in 0x80000000 to the reg values in the child nodes rather than
> >>>> using a separate cell if we wanted.
> >>>
> >>> thinking a little more about this, this is way to complicated.
> >>
> >> Really, this seems extremely simple to me.
> >>
> >>> "Master" and
> >>> "Slave" functions are properties of the same i2c controller. Therefore,
> >>> just adding a small property to the i2c controller node saying "enable
> >>> slave support" is sufficient, as all the resources are shared (which is
> >>> another good argument that it is the same device, hence same node). I
> >>> would just add the slave i2c address, which is all the slave driver
> >>> needs, e.g.
> >>
> >> Perhaps so for this one controller, but we should strive to create a
> >> binding style that can work with any I2C controller that can be master
> >> or slave. For a general binding, I think we need to support multiple
> >> slave addresses. The style above seems to support that with little
> >> complexity.
> > 
> > I have no idea how other implementations may look like. The downstream kernel 
> > seems to program the slave address in a secondary step after the controller is 
> > initialized [1]. So every "client" which binds to the slave driver can use its 
> > own address, but only one client at the same time is allowed. As said before, 
> > the may also exist devices (!tegra) with multiple slave addresses at the same 
> > time.
> > 
> > Your approach above seems fulfill these properties (what about a single slave 
> > controller without a master?),
> 
> There would simply be a node for the controller, and a single child node
> for the slave setup, and no child nodes for mastered devices.
> 
> > but it will be tricky for the slave to find the
> > controller resources it needs.
> 
> I don't understand this. The resources are only needed by I2C driver,
> and all come from the I2C driver node. If the I2C driver ends up being
> split into separate master/slave portions, that information can easily
> be passed from the main driver probe()/... to those other sub-parts of
> the driver.
> 
> > I'm thinking of an insane (but valid)
> > configuration where all i2c ports of the SoC are connected together and one 
> > port plays the master and all others are slaves. In this case we need to add a 
> > property to the slave node which points to his controller instance.
> 
> Why do the slave nodes care where they're mastered from?
> 
> I think you'd just have the following
> 
> /* master */
> i2c@xxxxx {
>     foo@0x40 {
>         reg = <MASTER 0x40>;
>         compatible = "nvidia,nvec";
>     }
> };
> 
> i2c@yyyy {
>     foo@40 {
>         reg = <SLAVE 0x40>;
>         compatible = "nvidia,nvec-slave";
>     }
> };
> 
> There's no need for the slave child node to know that it is mastered
> from the Tegra I2C controller; all it cares about is that there is some
> I2C bus that it needs to respond to transactions upon.
> 
> 
This binding describes only case, when I2C device are connected to I2C
controller.

Assume that I2C controller #1 (@xxxxx), I2C controller #2 (@yyyy), and
nvec I2C master device are connected to same bus.
How dt must be composed in this case ? Must i2c@xxxxx and i2c@yyyy be in
parent/child relation (in terms of dt) ?


p.s. sorry, prev message was not formatted correctly, so I resend it.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
