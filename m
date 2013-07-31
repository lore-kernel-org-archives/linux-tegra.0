From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Wed, 31 Jul 2013 15:03:14 -0600
Message-ID: <51F97B92.1040707@wwwdotorg.org>
References: <1416005.VvfEeGuSWa@ax5200p> <6071437.eL7j9JF89s@fb07-iapwap2.physik.uni-giessen.de> <20130731153322.GQ29859@e106331-lin.cambridge.arm.com> <2910047.nJ4yDntMXS@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2910047.nJ4yDntMXS@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 10:52 AM, Marc Dietrich wrote:
> On Wednesday 31 July 2013 16:33:22 Mark Rutland wrote:
>> On Wed, Jul 31, 2013 at 03:57:13PM +0100, Marc Dietrich wrote:
>>> Am Mittwoch, 31. Juli 2013, 15:13:14 schrieb Mark Rutland:
...
>>>> If you need to instantiate child nodes as Linux platform devices, this
>>>> should be done in the driver for the bus. Relying on simple-bus to do
>>>> this is a hack.
>>>
>>> ok, I'll rip this off from both nodes. I guess I should use
>>> of_platform_populate instead and keeping the compatible node in the childs
>>> - right?
>>
>> I believe that would be a correct way of handling this.
> 
> Great. Thinking about a really generic dt representation of an i2c bus (with 
> multi-slave, slave and master controllers can act in parallel), something like 
> this came into my mind:
> 
> 
> i2c@xxxxxxx {
> 		compatible = "nvidia,tegra-i2c", "simple-bus"; /* This time it is 
> truly a simple bus, because there is no higher control instance */
> 
> 		... common master/slave resources ...
> 
> 		master {
> 				compatible = "nvidia,tegra-i2c-master";
> 				... resources ??? ....
> 
> 			 	client1@xx {
> 						...
> 				};
> 
> 			 	client2@xx {
> 						...
> 				};
> 
> 				...
> 		}
> 
> 		slave1@xxx {
> 				compatible = "nvidia,tegra-i2c-slave";
> 				... resources ??? ...
> 
> 				client1@xx {
> 						...
> 				};
> 		};
> 
> 		slave2@xxx {
> 				compatible = "nvidia,tegra-i2c-slave";
> 				... resources ??? ...
> 
> 				client1@xx {
> 						...
> 				};
> 
> 		};
> 
> 		....
> };

The generic I2C bindings already define that the other chips on the I2C
bus appear directly underneath the I2C controller's DT node. Perhaps it
isn't a big issue to change that, since each I2C controller can define
the layout of its own node?

Anyway, we can probably get away without introducing multiple levels by
adding some more bits or cells into the reg address for I2C child nodes:

i2c@xxxxxxxx {
	compatible = "nvidia,tegra20-i2c";
	... resources
	#address-cells = <2>;

	codec {
		// 0 means external slave, 0x1c is slave's address
		reg = <0 0x1c>;
		...
	};

	tegraslave {
		// 0 means internal slave, 0x80 is controller's address
		reg = <1 0x80>;
		...
	};
};

... where each of those child nodes could be repeated N times. We could
also or in 0x80000000 to the reg values in the child nodes rather than
using a separate cell if we wanted.
