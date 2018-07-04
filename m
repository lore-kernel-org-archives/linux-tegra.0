From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v8 0/6] mtd: rawnand: add NVIDIA Tegra NAND flash
 support
Date: Wed, 4 Jul 2018 09:45:48 +0200
Message-ID: <20180704094548.158fc6b6@xps13>
References: <20180624212727.21672-1-stefan@agner.ch>
        <20180625143437.24f71e7e@xps13>
        <edc1958f1c8ead2159e2aa28c06301ef@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <edc1958f1c8ead2159e2aa28c06301ef@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: thierry.reding@gmail.com, boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, dev@lynxeye.de, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Stefan,

Stefan Agner <stefan@agner.ch> wrote on Wed, 04 Jul 2018 09:33:44 +0200:

> Hi Thierry, Hi Miquel,
> 
> On 25.06.2018 14:34, Miquel Raynal wrote:
> > Hi Stefan,
> > 
> > On Sun, 24 Jun 2018 23:27:21 +0200, Stefan Agner <stefan@agner.ch>
> > wrote:
> >   
> >> Eigth and hopefully final revision gets rid of nand_release() as
> >> suggested by Boris.
> >>
> >> --
> >> Stefan
> >>
> >> Changes since v1:
> >> - Split controller and NAND chip structure
> >> - Add BCH support
> >> - Allow to select algorithm and strength using device tree
> >> - Improve HW ECC error reporting and use DEC_STATUS_BUF only
> >> - Use SPDX license identifier
> >> - Use per algorithm mtd_ooblayout_ops
> >> - Use setup_data_interface callback for NAND timing configuration
> >>
> >> Changes since v2:
> >> - Set clock rate using assigned-clocks
> >> - Use BIT() macro
> >> - Fix and improve timing calculation
> >> - Improve ECC error handling
> >> - Store OOB layout for tag area in Tegra chip structure
> >> - Update/fix bindings
> >> - Use more specific variable names (replace "value")
> >> - Introduce nand-is-boot-medium
> >> - Choose sensible ECC strenght automatically
> >> - Use wait_for_completion_timeout
> >> - Print register dump on completion timeout
> >> - Unify tegra_nand_(read|write)_page in tegra_nand_page_xfer
> >>
> >> Changes since v3:
> >> - Implement tegra_nand_(read|write)_raw using DMA
> >> - Implement tegra_nand_(read|write)_oob using DMA
> >> - Name registers according to Tegra 2 Technical Reference Manual (v02p)
> >> - Use wait_for_completion_io_timeout to account for IO
> >> - Get chip select id from device tree reg property
> >> - Clear interrupts and reinit wait queues in case command/DMA times out
> >> - Set default MTD name after nand_set_flash_node
> >> - Move MODULE_DEVICE_TABLE after declaration of tegra_nand_of_match
> >> - Make (rs|bch)_strength static
> >>
> >> Changes since v4:
> >> - Pass OOB area to nand_check_erased_ecc_chunk
> >> - Pass algorithm specific bits_per_step to tegra_nand_get_strength
> >> - Store ECC layout in chip structure
> >> - Fix pointer assignment (use NULL)
> >> - Removed obsolete header delay.h
> >> - Fixed newlines
> >> - Use non-_io variant of wait_for_completion_timeout
> >>
> >> Changes since v5:
> >> - Drop extra OOB bytes support
> >>
> >> Changes since v6:
> >> - checkpatch.pl fixes
> >>
> >> Changes since v7:
> >> - Replace nand_release() with mtd_device_unregister() + nand_cleanup()
> >>
> >> Lucas Stach (1):
> >>   ARM: dts: tegra: add Tegra20 NAND flash controller node
> >>
> >> Stefan Agner (5):
> >>   mtd: rawnand: add Reed-Solomon error correction algorithm
> >>   mtd: rawnand: add an option to specify NAND chip as a boot device
> >>   mtd: rawnand: tegra: add devicetree binding
> >>   mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
> >>   ARM: dts: tegra: enable NAND flash on Colibri T20
> >>
> >>  .../devicetree/bindings/mtd/nand.txt          |    6 +-
> >>  .../bindings/mtd/nvidia-tegra20-nand.txt      |   64 +
> >>  MAINTAINERS                                   |    7 +
> >>  arch/arm/boot/dts/tegra20-colibri-512.dtsi    |   16 +
> >>  arch/arm/boot/dts/tegra20.dtsi                |   15 +
> >>  drivers/mtd/nand/raw/Kconfig                  |   10 +
> >>  drivers/mtd/nand/raw/Makefile                 |    1 +
> >>  drivers/mtd/nand/raw/nand_base.c              |    4 +
> >>  drivers/mtd/nand/raw/tegra_nand.c             | 1230 +++++++++++++++++
> >>  include/linux/mtd/rawnand.h                   |    7 +
> >>  10 files changed, 1359 insertions(+), 1 deletion(-)
> >>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
> >>  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
> >>  
> > 
> > Series applied to nand/next. I just changed the subject of patch3/6 to
> > be "dt-bindings: mtd: add tegra NAND controller binding".
> >   
> 
> It seems "series applied" refers to the MTD part...
> 
> I guess patch 5 and 6 have to go through Tegra tree, Thierry?

Indeed :)

Regards,
Miquèl
