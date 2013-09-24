From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Tue, 24 Sep 2013 11:19:40 -0600
Message-ID: <5241C9AC.1000002@wwwdotorg.org>
References: <1416005.VvfEeGuSWa@ax5200p> <52406E1E.5040005@wwwdotorg.org> <1380008361.20958.3.camel@AndreyDanin-LNX> <1597574.dB5YEoR44o@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1597574.dB5YEoR44o-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Andrey Danin <andrey.danin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/24/2013 03:33 AM, Marc Dietrich wrote:
...
> What I learned from the somehow unfortune discussion yesterday on IRC is that 
> we cannot describe the exact i2c topology in the device tree, especially if it 
> is software configuable (slave/master changing roles).

Well, there's also no need to represent the exact I2C topology; we only
need to represent the parts that SW cares about. The existence of other
masters on the bus is not something that SW typically cares about. SW
can't directly interact with other masters (through just plain I2C
protocol at least), and can only observe their presence by potential
arbitration loss events.

> I also think there is a misunderstanding about how things get layered in 
> software (and which info from device tree the drivers need). In your example 
> above, there is a child node unter each controller which is responsible for 
> slave transfers. The nvec can be a separate node in the device tree outside of 
> the i2c structure, but needs one or more pointers to slave drivers which he 
> can use to send his command byte streams to. E.g.

No, in my example, the slave node /is/ the NVEC protocol. There is no
separate NVEC node outside the I2C node/tree.

> i2c@xxxx {
> 	compatible = "nvidia,tegra-i2c";
> 	// resources for the i2c controller
> 	first_slave: slave@40 {
> 		compatible = "nvidia,tegra-i2c-slave";

That's not what I wrote. This should be:

		compatible = "nvidia,nvec-slave";

... which instantiates an I2C slave protocol driver, and hooks it up so
that if the I2C slave controller receives an externally-initiated I2C
transaction to I2C address 0x40, that transaction will be passed to the
NVEC driver for processing and response.


> 		reg = <40>; // i2c client address
> 		gpios = <4e>; // for side channel
> 	};
> };

...
> external_master {
> 	compatible = "ext,master";
> 	slaves = &first_slave,&second_slave;
> };
> 
> or
> 
> nvec {
> 	compatible = "nvidia,nvec";
> 	slave = &first_slave;
> 	keyboard {
> 		// keyboard resources
> 	};
> };

So that separate nvec node is not required. All configuration of the
NVEC slave protocol should be part of the slave@40 node above.

IIRC, the way NVEC works is that a GPIO is used to request that the NVEC
IC poll the slave device if the slave device wants to initiate a
transaction with the NVEC IC. If that's correct, the model above should
work fine.

However, if when Tegra wants to make a master transaction on the I2C bus
(which would therefore have to be to a device other than the NVEC IC),
if the NVEC IC and Tegra need to arbitrate for the bus outside the plain
I2C protocol, then you'd want to model this as an I2C bus mux instead:

	i2c1: i2c@xxxx {
		compatible = "nvidia,tegra-i2c";

		foo@40 {
			reg = <SLAVE 0x40>;
			compatible = "nvidia,nvec-slave";
			keyboard {
				...
			};
			// any other parameters NVEC slave
			// protocol needs go here
		}
	};

	i2cmux {
		compatible = "nvidia,i2c-mux-nvec";
		#address-cells = <1>;
		#size-cells = <0>;
		nvec-gpios = <&gpio1 22 0>;
		i2c-parent = <&i2c1>;

		// all other devices on the I2C bus go here:
		ssd1307: oled@3c {
			compatible = "solomon,ssd1307fb-i2c";
				reg = <0x3c>;
				pwms = <&pwm 4 3000>;
				reset-gpios = <&gpio2 7 1>;
				reset-active-low;
			};
		};
	};

In this case, perhaps the drivers for the NVEC bus mux and NVEC slave
protocol might need to communicate with each-other. In which case, a
phandle between the two may be appropriate.
