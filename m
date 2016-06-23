From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 13/13] arm64: tegra: Add DPAUX pinctrl bindings
Date: Thu, 23 Jun 2016 09:46:48 +0200
Message-ID: <CACRpkdY5po-1Bwd8_5ynVQZhRVqur=x=QjiM_D4YsgHsMbnGwg@mail.gmail.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com> <1466165027-17917-14-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1466165027-17917-14-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 17, 2016 at 2:03 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

> Add the DPAUX pinctrl states for the DPAUX nodes defining all three
> possible states of "aux", "i2c" and "off". Also add the 'i2c-bus'
> node for the DPAUX nodes so that the I2C driver core does not attempt
> to parse the pinctrl state nodes.
>
> Populate the nodes for the pinctrl clients of the DPAUX pin controller.
> There are two clients for each DPAUX instance, namely the SOR and one of
> the I2C adapters. The SOR clients may used the DPAUX pins in either AUX
> or I2C modes and so for these devices we don't define any of the generic
> pinctrl states (default, idle, etc) because the SOR driver will directly
> set the state needed. For I2C clients only the I2C mode is used and so
> we can simplify matters by using the generic pinctrl states for default
> and idle.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours
Linus Walleij
