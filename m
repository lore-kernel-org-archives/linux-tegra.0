From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V6 00/12] Tegra xHCI support
Date: Wed, 25 Feb 2015 09:27:36 -0800
Message-ID: <CAL1qeaEmSphLd=k3f6865OEO_rcwO3+Hv5KDvCN2_=7nDdZJzA@mail.gmail.com>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
	<20150225160110.GA26610@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150225160110.GA26610@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-arm-kernel@lists.infradead.org" <linux>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

> Sorry for taking so awfully long to look at this. I've spent some time
> looking at various pieces of documentation and I concluded that
> representing the port assignment as muxing options doesn't seem right
> after all. Instead I've come up with an alternate proposal (attached).
> Could you take a look and see if that sounds reasonable to you?

Thanks for taking a look at this.  I've been meaning to pick this
series back up, but haven't had quite enough bandwidth lately.

This all looks good to me, just one comment below:

> +PHY nodes:
> +----------
> +
> +An optional child node named "phys" can contain nodes describing additional
> +properties of each PHY. Only USB3 and UTMI PHYs can be complemented in this
> +way, in which case the name of each node must match one of the following:
> +
> +  usb3-0, usb3-1, utmi-0, utmi-1, utmi-2
> +
> +Required properties for USB3 PHYs:
> +- nvidia,lanes: specifies the name of the lane that this USB3 PHY uses
> +- nvidia,port: specifies the number of the USB2 port that is used for this
> +  USB3 PHY
> +
> +Optional properties for UTMI PHYs:
> +- vbus-supply: regulator providing the VBUS voltage for the UTMI pad

What about the HSIC PHYs?  Shouldn't they be represented as PHY nodes as well?
