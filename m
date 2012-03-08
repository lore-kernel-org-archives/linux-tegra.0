From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V1] i2c: gpio: Use open drain support from gpio driver
Date: Thu, 8 Mar 2012 07:24:39 +0100
Message-ID: <CACRpkdaEHOGA2XfW1SMJodyf9oTNRF7kk9ErQeSpBv_2TFj=Rg@mail.gmail.com>
References: <1331127494-6913-1-git-send-email-ldewangan@nvidia.com>
	<20120307173157.GT3107@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120307173157.GT3107@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, khali@linux-fr.org, ben-linux@fluff.org, w.sang@pengutronix.de, grant.likely@secretlab.ca, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 7, 2012 at 6:31 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Mar 07, 2012 at 07:08:14PM +0530, Laxman Dewangan wrote:
>> The gpio core driver (gpio library) supports the open
>> drain pin handling. Therefore, it is not require it
>> to handle in the i2c-gpio driver, just require
>> to pass the OPEN_DRAIN type flag when requesting the gpio.
>
> Reviwed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
>
> but note that this is a new gpiolib feature in -next and will need to
> either be applied via Grant's tree or wait until after the merge window.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I'd ask Grant to take this into the GPIO tree if Broonie can ACK it.

Yours,
Linus Walleij
