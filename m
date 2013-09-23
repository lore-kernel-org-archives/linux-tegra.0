From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Mon, 23 Sep 2013 16:52:46 +0200
Message-ID: <2112732.zfJtNyCk0i@fb07-iapwap2.physik.uni-giessen.de>
References: <1416005.VvfEeGuSWa@ax5200p> <17687182.lGWlO75r41@fb07-iapwap2.physik.uni-giessen.de> <5238CE1C.3050107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5238CE1C.3050107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgAndrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, 17. September 2013, 15:48:12 schrieb Stephen Warren:
> On 09/17/2013 01:53 AM, Marc Dietrich wrote:
> > Hi Stephen,
> > 
> > Am Mittwoch, 31. Juli 2013, 15:03:14 schrieb Stephen Warren:
> >> The generic I2C bindings already define that the other chips on the I2C
> >> bus appear directly underneath the I2C controller's DT node. Perhaps it
> >> isn't a big issue to change that, since each I2C controller can define
> >> the layout of its own node?
> >> 
> >> Anyway, we can probably get away without introducing multiple levels by
> >> adding some more bits or cells into the reg address for I2C child nodes:
> >> 
> >> i2c@xxxxxxxx {
> >> 
> >> 	compatible = "nvidia,tegra20-i2c";
> >> 	... resources
> >> 	#address-cells = <2>;
> >> 	
> >> 	codec {
> >> 	
> >> 		// 0 means external slave, 0x1c is slave's address
> >> 		reg = <0 0x1c>;
> >> 		...
> >> 	
> >> 	};
> >> 	
> >> 	tegraslave {
> >> 	
> >> 		// 0 means internal slave, 0x80 is controller's address
> >> 		reg = <1 0x80>;
> >> 		...
> >> 	
> >> 	};
> >> 
> >> };
> >> 
> >> ... where each of those child nodes could be repeated N times. We could
> >> also or in 0x80000000 to the reg values in the child nodes rather than
> >> using a separate cell if we wanted.
> > 
> > thinking a little more about this, this is way to complicated.
> 
> Really, this seems extremely simple to me.
> 
> > "Master" and
> > "Slave" functions are properties of the same i2c controller. Therefore,
> > just adding a small property to the i2c controller node saying "enable
> > slave support" is sufficient, as all the resources are shared (which is
> > another good argument that it is the same device, hence same node). I
> > would just add the slave i2c address, which is all the slave driver
> > needs, e.g.
> 
> Perhaps so for this one controller, but we should strive to create a
> binding style that can work with any I2C controller that can be master
> or slave. For a general binding, I think we need to support multiple
> slave addresses. The style above seems to support that with little
> complexity.

I have no idea how other implementations may look like. The downstream kernel 
seems to program the slave address in a secondary step after the controller is 
initialized [1]. So every "client" which binds to the slave driver can use its 
own address, but only one client at the same time is allowed. As said before, 
the may also exist devices (!tegra) with multiple slave addresses at the same 
time.

Your approach above seems fulfill these properties (what about a single slave 
controller without a master?), but it will be tricky for the slave to find the 
controller resources it needs. I'm thinking of an insane (but valid) 
configuration where all i2c ports of the SoC are connected together and one 
port plays the master and all others are slaves. In this case we need to add a 
property to the slave node which points to his controller instance.

> > "slave-address = <8c>;" to enable slave mode operation. Both modes can be
> > enabled at the same time (for loopback comm). AFAIK, if only the slave
> > part is used, the master part shouldn't hurt if programmed (same as other
> > way around).
> > 
> > The difficult part is how to specify the master if only the slave is used.
> > As the master is naturally on the same bus as the slave, it should be a
> > child node of the controller. Therefore it needs a special i2c address,
> > maybe
> Why would the external I2C master be represented in the DT bindings at
> all? It's not really a SW-accessible entity; its presence is only
> observable not something you can initiate interaction with.

No, we can and nvec does it regulary using a "side"-channel (a tegra gpio 
connected to a master irq input). This side-channel is non standard and each 
vendor may do it differently. But you are right, we don't need an entry for 
the master, but an entry for the driver (the other side of the communication) 
which binds to the slave controller.

> I assume you're not talking about the Tegra I2C controller when you say
> "master" above; that is already represented in the DT as the top-level
> I2C node.
> 
> > 0x80000000 as you mentioned above, but this will be rejected by the i2c
> > core. Instantiating the nvec as an i2c client could be another problem.
> 
> ...
> 
> > It looks like that the i2c subsystem needs some modifications to allow to
> > specify a master device which is attached to a slave controller. Maybe
> > someone from the i2c folks (cc'ed) can comment on this?
> 
> Yes, you certainly will need some enhancements to the I2C core to
> support slave mode. I suggest that I2C drivers gain an .of_xlate
> callback which translates child node DT reg values (addresses) into the
> (master-vs-slave, I2C address) pair.

I somehow feared that :-( Now my free time became rather limited recently and 
I don't feel that I'm the best person to solve these problem(s). Andrey said 
that he may be interested finishing at least a proper device tree 
representation (especially to get his great nvec uboot support upstreamed). 
Kernel support is a different beast and I really hope that the code which 
lives in staging area currently is not doomed because integration with the i2c 
subsystem is too complex.

Marc


[1] http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=blob;f=drivers/i2c/i2c-slave.c;h=280a860cd2e84e15b2c1aef0e938d750f56863dd;hb=rel-roth-ota-1#l120
