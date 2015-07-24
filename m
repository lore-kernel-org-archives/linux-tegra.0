From: Andrey Danin <danindrey@mail.ru>
Subject: Re: [PATCH v3 1/4] i2c: tegra: implement slave mode
Date: Fri, 24 Jul 2015 13:18:28 +0300
Message-ID: <55B210F4.6030700@mail.ru>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <1437424546-30405-2-git-send-email-danindrey@mail.ru>
 <20150724092720.GA1597@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150724092720.GA1597@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, devel@linuxdriverproject.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net, Laxman Dewangan <ldewangan@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

On 24.07.2015 12:27, Wolfram Sang wrote:
> Still doesn't work for me and I think I understand why. Do you run your
> I2C controller in slave mode only?

Yes.

> That might work, but using it in
> master/slave mode simultanously won't work yet as I see it:
>
> * After every transfer (as master), clocks get disabled. I assume the IP
>    core won't be able to detect its own address then.

At the begin of my work on this patchset I even denied clock disable 
call if slave is registered (to minimize code that can affect transfer). 
If only slave mode is used, then this logic is not needed.

>
> * There is this code in tegra_i2c_init():
>
> 	if (!i2c_dev->is_dvc) {
> 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
> 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
> 		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
> 		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
> 		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
>
> 	}
>
>    It probably messes up the slave initialization in tegra_reg_slave().
>    At least I see that the slave address gets overwritten when I peek
>    the register after boot.
>

tegra_i2c_init is called on probe and resume. Also it is called in case 
of xfer fail. If xfer is ok, then I think slave addr must be kept unchanged.

> Does that make sense to you?

As far as I understand it is a loopback mode. Probably it will not work 
(Stephen Warren already mentioned this).
But we can try to run it.
