From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC] i2c: device-tree: Handling child nodes which are not i2c
 devices
Date: Tue, 3 May 2016 16:30:25 +0100
Message-ID: <20160503153024.GB6850@leverpostej>
References: <57110A35.2070509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57110A35.2070509@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <treding@nvidia.com>, Stephen Warren <swarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-i2c@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2016 at 04:35:17PM +0100, Jon Hunter wrote:
> Hi all,
> 
> For Tegra we have an i2c device for display port, namely the display
> port auxiliary channel (or dpaux) as specified by the display port
> standard. If an design using Tegra does not utilise the display port
> interface, then the pads assigned to the dpaux can be re-assigned to
> another generic i2c controller (i2c6 for Tegra124/210). In other words,
> the pads can be re-used for a generic i2c interface.
> 
> The registers that control whether the pads are mapped to the dpaux or
> i2c6 are located in the dpaux register space. Therefore, I am looking at
> adding pin controller support for dpaux so that i2c6 can request these
> pads if it is enabled and I was hoping to add a pinmux node the to dpaux
> device in device-tree to do this. For example, something like ...
> 
> 	dpaux@0,545c0000 {
> 		...
> 
> 		/* pinctrl node */
> 		pinmux {
> 			...
> 		};
> 	};
> 
> Although the above works, when doing this I noticed that when the device
> booted, I would seeing the following error messages on boot ...
> 
>  i2c i2c-5: of_i2c: modalias failure on ...
> 
> These error messages being caused by the new pinmux node because it is
> not recognised as an i2c device. To avoid this error messages we have
> come up with a couple solutions but wanted to get some feedback on the
> best approach.
> 
> 1. Add a i2c-bus sub-node to the dpaux binding (suggested by Stephen
>    Warren), so we would have something like the below. Then i2c devices
>    for dpaux would be place in the i2c-bus sub-node.
> 
> 	dpaux@0,545c0000 {
> 		...
> 
> 		/* pinctrl node */
> 		pinmux {
> 			...
> 		};
> 
> 		/* place-holder for i2c devices */
> 		i2c-bus {
> 			...
> 		};
> 	};	

From a binding perspective, this makes the most sense to me.

I believe we have variants of this (container nodes for actual busses
owned by a controller) in practice today elsewhere. 

>    To make the above work ideally we would like to make the 'i2c-bus'
>    node a generic solution for all i2c devices, so the i2c core would
>    check for the presence of this node and if it is found then would
>    default to this node for looking for i2c-devices.

I don't have strong opinions on this (having a generic subnode name for
the actual bus exposed by a controller) either way.

I can imagine that it would be possible for a single controller to
expose multiple I2C (or other) busses, so it might make sense for this
to be the preferred style, but not necessarily enforeced as a generic
binding.

Thanks,
Mark
