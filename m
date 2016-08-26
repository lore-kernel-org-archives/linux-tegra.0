From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 9/9] i2c: tegra: Add pinctrl support
Date: Fri, 26 Aug 2016 09:55:32 -0600
Message-ID: <75609713-af41-b4a4-226e-a5cb48ceab4e@wwwdotorg.org>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
 <1472216945-11818-10-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-10-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On 08/26/2016 07:09 AM, Jon Hunter wrote:
> On Tegra124/132 the pins for I2C6 are shared with the Display Port AUX
> (DPAUX) channel and on Tegra210 the pins for I2C4 and I2C6 are shared
> with DPAUX1 and DPAUX0, respectively. The multiplexing of the pins is
> handled by a register in the DPAUX and so the Tegra DPAUX driver has
> been updated to register a pinctrl device for managing these pins.
>
> The pins for these particular I2C devices are bound to the I2C device
> prior to probing. However, these I2C devices are in a different power
> partition to the DPAUX devices that own the pins. Hence, it is desirable
> to place the pins in the 'idle' state and allow the DPAUX power
> partition to switch off, when these I2C devices is not in use.
> Therefore, add calls to place the I2C pins in the 'default' and 'idle'
> states when the I2C device is runtime resumed and suspended,
> respectively.
>
> Please note that the pinctrl functions that set the state of the pins
> check to see if the devices has pins associated and will return zero
> if they do not. Therefore, it is safe to call these pinctrl functions
> even for I2C devices that do not have any pins associated.

I think this should be handled by drivers/i2c/muxes/i2c-mux-pinctrl.c 
instead?
