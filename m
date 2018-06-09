From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Sat, 9 Jun 2018 08:46:15 +0200
Message-ID: <20180609084615.6fba31ec@bbrezillon>
References: <20180531221637.6017-1-stefan@agner.ch>
        <20180531221637.6017-5-stefan@agner.ch>
        <cdca329f-0b8d-0604-4cfb-b95baf84c867@gmail.com>
        <d625dd8ca816543e03668b74921563c1@agner.ch>
        <20180609075256.725354d6@bbrezillon>
        <792ee71847f6f4752b8bcba65d22bf81@agner.ch>
        <20180609084157.0c2f12e6@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180609084157.0c2f12e6@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: mark.rutland@arm.com, benjamin.lindqvist@endian.se, pgaikwad@nvidia.com, dev@lynxeye.de, mirza.krak@gmail.com, richard@nod.at, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com, marek.vasut@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, marcel@ziswiler.com, miquel.raynal@bootlin.com, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, Dmitry Osipenko <digetx@gmail.com>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 9 Jun 2018 08:41:57 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Sat, 09 Jun 2018 08:23:51 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
> > On 09.06.2018 07:52, Boris Brezillon wrote:
> > > On Fri, 08 Jun 2018 23:51:01 +0200
> > > Stefan Agner <stefan@agner.ch> wrote:
> > > 
> > >   
> > >> >
> > >> > void tegra_nand_controller_reset(struct tegra_nand_controller *ctrl)
> > >> > {
> > >> > 	int err;
> > >> >
> > >> > 	disable_irq(ctrl->irq);
> > >> >
> > >> > 	err = reset_control_reset(ctrl->rst);
> > >> > 	if (err) {
> > >> > 		dev_err(ctrl->dev, "Failed to reset HW: %d\n", err);
> > >> > 		msleep(HW_TIMEOUT);
> > >> > 	}
> > >> >
> > >> > 	writel_relaxed(NAND_CMD_STATUS, ctrl->regs + HWSTATUS_CMD);
> > >> > 	writel_relaxed(HWSTATUS_MASK, ctrl->regs + HWSTATUS_MASK);
> > >> > 	writel_relaxed(INT_MASK, ctrl->regs + ISR);  
> > >>
> > >> If we do a controller reset, there is much more state than that which
> > >> needs to be restored. A lot of it is not readily available currently
> > >> (timing, ECC settings...)  
> > > 
> > > This is actually a good test to detect what is not properly initialized
> > > by the driver. Timings should be configured correctly through  
> > > ->setup_data_interface(). ECC engine should be disabled by default and  
> > > only enabled when ->{read,write}_page() is called.
> > >   
> > 
> > Is setup_data_interface guaranteed to be called after a failed
> > ->exec_op()/{read,write}_page()?
> 
> No. Maybe I misunderstood when tegra_nand_controller_reset() was
> supposed to be called. That's something I would call only once, early
> in the probe function, so that the controller is placed in a well-known
> state before we start using it. Definitely not something you should
> call after each error.

Note that if you really want to reset the controller after an error,
you should also iterate over all chips and call nand_reset() on them.
