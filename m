From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Tue, 17 Sep 2013 15:48:12 -0600
Message-ID: <5238CE1C.3050107@wwwdotorg.org>
References: <1416005.VvfEeGuSWa@ax5200p> <2910047.nJ4yDntMXS@ax5200p> <51F97B92.1040707@wwwdotorg.org> <17687182.lGWlO75r41@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17687182.lGWlO75r41-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/17/2013 01:53 AM, Marc Dietrich wrote:
> Hi Stephen,
> 
> Am Mittwoch, 31. Juli 2013, 15:03:14 schrieb Stephen Warren:
>> The generic I2C bindings already define that the other chips on the I2C
>> bus appear directly underneath the I2C controller's DT node. Perhaps it
>> isn't a big issue to change that, since each I2C controller can define
>> the layout of its own node?
>>
>> Anyway, we can probably get away without introducing multiple levels by
>> adding some more bits or cells into the reg address for I2C child nodes:
>>
>> i2c@xxxxxxxx {
>> 	compatible = "nvidia,tegra20-i2c";
>> 	... resources
>> 	#address-cells = <2>;
>>
>> 	codec {
>> 		// 0 means external slave, 0x1c is slave's address
>> 		reg = <0 0x1c>;
>> 		...
>> 	};
>>
>> 	tegraslave {
>> 		// 0 means internal slave, 0x80 is controller's address
>> 		reg = <1 0x80>;
>> 		...
>> 	};
>> };
>>
>> ... where each of those child nodes could be repeated N times. We could
>> also or in 0x80000000 to the reg values in the child nodes rather than
>> using a separate cell if we wanted.
> 
> thinking a little more about this, this is way to complicated.

Really, this seems extremely simple to me.

> "Master" and 
> "Slave" functions are properties of the same i2c controller. Therefore, just 
> adding a small property to the i2c controller node saying "enable slave 
> support" is sufficient, as all the resources are shared (which is another good 
> argument that it is the same device, hence same node). I would just add the 
> slave i2c address, which is all the slave driver needs, e.g.

Perhaps so for this one controller, but we should strive to create a
binding style that can work with any I2C controller that can be master
or slave. For a general binding, I think we need to support multiple
slave addresses. The style above seems to support that with little
complexity.

> "slave-address = <8c>;" to enable slave mode operation. Both modes can be 
> enabled at the same time (for loopback comm). AFAIK, if only the slave part is 
> used, the master part shouldn't hurt if programmed (same as other way around).
> 
> The difficult part is how to specify the master if only the slave is used. As 
> the master is naturally on the same bus as the slave, it should be a child 
> node of the controller. Therefore it needs a special i2c address, maybe 

Why would the external I2C master be represented in the DT bindings at
all? It's not really a SW-accessible entity; its presence is only
observable not something you can initiate interaction with.

I assume you're not talking about the Tegra I2C controller when you say
"master" above; that is already represented in the DT as the top-level
I2C node.

> 0x80000000 as you mentioned above, but this will be rejected by the i2c core. 
> Instantiating the nvec as an i2c client could be another problem.
...
> It looks like that the i2c subsystem needs some modifications to allow to 
> specify a master device which is attached to a slave controller. Maybe someone 
> from the i2c folks (cc'ed) can comment on this?

Yes, you certainly will need some enhancements to the I2C core to
support slave mode. I suggest that I2C drivers gain an .of_xlate
callback which translates child node DT reg values (addresses) into the
(master-vs-slave, I2C address) pair.
