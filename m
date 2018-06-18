From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v5 0/6] mtd: rawnand: add NVIDIA Tegra NAND flash
 support
Date: Mon, 18 Jun 2018 11:58:06 +0200
Message-ID: <20180618115806.7be25499@bbrezillon>
References: <20180617204605.4648-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617204605.4648-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, 17 Jun 2018 22:45:59 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Changes definitly calm down, most noteably probably the changes
> around checking whether a page is empty if the stack reports ECC
> errors.. I verified the code using raw nandwrites with OOB to
> simulate an empty page which has some bits flipped in the OOB area,
> everthing seems to work as I would expect it.
> 
> For now I do not check extra OOB bytes since those are at variable
> locations depending on algorithm.

Hm, if you expose them as free OOB bytes, you should also check them,
otherwise you might end up with corrupted data without noticing it. Note
that, depending on whether those free OOB bytes are ECC-protected or
not, you should change the way you do the check:

- non-protected OOB bytes: all bytes should be 0xff (no bitflips
  allowed)
- data+free OOB bytes protected by the same ECC bytes: you should pass
  the free OOB bytes buffer to nand_check_erased_ecc_chunk() along with
  the data and ECC buffers
- free OOB bytes have their own ECC bytes: call
  nand_check_erased_ecc_chunk() separately and pass it the ECC + free
  OOB buffers.

> 
> --
> Stefan
> 
> Changes since v1:
> - Split controller and NAND chip structure
> - Add BCH support
> - Allow to select algorithm and strength using device tree
> - Improve HW ECC error reporting and use DEC_STATUS_BUF only
> - Use SPDX license identifier
> - Use per algorithm mtd_ooblayout_ops
> - Use setup_data_interface callback for NAND timing configuration
> 
> Changes since v2:
> - Set clock rate using assigned-clocks
> - Use BIT() macro
> - Fix and improve timing calculation
> - Improve ECC error handling
> - Store OOB layout for tag area in Tegra chip structure
> - Update/fix bindings
> - Use more specific variable names (replace "value")
> - Introduce nand-is-boot-medium
> - Choose sensible ECC strenght automatically
> - Use wait_for_completion_timeout
> - Print register dump on completion timeout
> - Unify tegra_nand_(read|write)_page in tegra_nand_page_xfer
> 
> Changes since v3:
> - Implement tegra_nand_(read|write)_raw using DMA
> - Implement tegra_nand_(read|write)_oob using DMA
> - Name registers according to Tegra 2 Technical Reference Manual (v02p)
> - Use wait_for_completion_io_timeout to account for IO
> - Get chip select id from device tree reg property
> - Clear interrupts and reinit wait queues in case command/DMA times out
> - Set default MTD name after nand_set_flash_node
> - Move MODULE_DEVICE_TABLE after declaration of tegra_nand_of_match
> - Make (rs|bch)_strength static
> 
> Changes since v4:
> - Pass OOB area to nand_check_erased_ecc_chunk
> - Pass algorithm specific bits_per_step to tegra_nand_get_strength
> - Store ECC layout in chip structure
> - Fix pointer assignment (use NULL)
> - Removed obsolete header delay.h
> - Fixed newlines
> - Use non-_io variant of wait_for_completion_timeout
> 
> Lucas Stach (1):
>   ARM: dts: tegra: add Tegra20 NAND flash controller node
> 
> Stefan Agner (5):
>   mtd: rawnand: add Reed-Solomon error correction algorithm
>   mtd: rawnand: add an option to specify NAND chip as a boot device
>   mtd: rawnand: tegra: add devicetree binding
>   mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
>   ARM: dts: tegra: enable NAND flash on Colibri T20
> 
>  .../devicetree/bindings/mtd/nand.txt          |    6 +-
>  .../bindings/mtd/nvidia-tegra20-nand.txt      |   64 +
>  MAINTAINERS                                   |    7 +
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi    |   16 +
>  arch/arm/boot/dts/tegra20.dtsi                |   15 +
>  drivers/mtd/nand/raw/Kconfig                  |    6 +
>  drivers/mtd/nand/raw/Makefile                 |    1 +
>  drivers/mtd/nand/raw/nand_base.c              |    4 +
>  drivers/mtd/nand/raw/tegra_nand.c             | 1268 +++++++++++++++++
>  include/linux/mtd/rawnand.h                   |    7 +
>  10 files changed, 1393 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
>  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
> 
