From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Sat, 9 Jun 2018 07:52:56 +0200
Message-ID: <20180609075256.725354d6@bbrezillon>
References: <20180531221637.6017-1-stefan@agner.ch>
        <20180531221637.6017-5-stefan@agner.ch>
        <cdca329f-0b8d-0604-4cfb-b95baf84c867@gmail.com>
        <d625dd8ca816543e03668b74921563c1@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d625dd8ca816543e03668b74921563c1@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Dmitry Osipenko <digetx@gmail.com>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 08 Jun 2018 23:51:01 +0200
Stefan Agner <stefan@agner.ch> wrote:


> > 
> > void tegra_nand_controller_reset(struct tegra_nand_controller *ctrl)
> > {
> > 	int err;
> > 
> > 	disable_irq(ctrl->irq);
> > 
> > 	err = reset_control_reset(ctrl->rst);
> > 	if (err) {
> > 		dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
> > 		msleep(HW_TIMEOUT);
> > 	}
> > 
> > 	writel_relaxed(NAND_CMD_STATUS, ctrl->regs + HWSTATUS_CMD);
> > 	writel_relaxed(HWSTATUS_MASK, ctrl->regs + HWSTATUS_MASK);
> > 	writel_relaxed(INT_MASK, ctrl->regs + ISR);  
> 
> If we do a controller reset, there is much more state than that which
> needs to be restored. A lot of it is not readily available currently
> (timing, ECC settings...)

This is actually a good test to detect what is not properly initialized
by the driver. Timings should be configured correctly through
->setup_data_interface(). ECC engine should be disabled by default and
only enabled when ->{read,write}_page() is called.

> 
> That seems a lot of work for a code path I do not intend to ever use :-)
> 

Not so sure it's a lot of work. If ECC and timing settings are the
only thing you need to initialize then it should work just fine.
Try with a controller reset and you'll know if you miss something ;-).
