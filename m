From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/12] dt-bindings: i2c: Add support for 'i2c-bus' subnode
Date: Fri, 24 Jun 2016 14:23:43 -0500
Message-ID: <20160624192343.GA28814@rob-hp-laptop>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466697545-11868-8-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 23, 2016 at 04:59:00PM +0100, Jon Hunter wrote:
> The I2C driver core for boards using device-tree assumes any subnode of
> an I2C adapter in the device-tree blob as being a I2C slave device.
> Although this makes complete sense, some I2C adapters may have subnodes
> which are not I2C slaves but subnodes presenting other features. For
> example some Tegra devices have an I2C interface which may share its
> pins with other devices and to share these pins subnodes for
> representing these pins so they have be shared via the pinctrl framework
> are needed.
> 
> To allow I2C adapters to have non-I2C specific subnodes in device-tree
> that are not parsed by the I2C driver core by adding support for a
> 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
> subnode is present then all I2C slaves must be placed under this subnode.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
