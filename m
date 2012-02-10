From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 5/9] tegra: i2c: Add I2C driver
Date: Fri, 10 Feb 2012 07:29:46 +0100
Message-ID: <4F34B95A.2030709@denx.de>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
 <1328318041-10943-6-git-send-email-sjg@chromium.org>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1328318041-10943-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
> The driver requires CONFIG_OF_CONTROL to obtain its configuration
> from the device tree.
> 
> (Simon Glass: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org modified for upstream)
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Adjust definitions to fit new peripheral clock bindings
> - Change i2c array to static
> - Make i2c/dvc decision come from fdt
> - Remove i2c configuring using CONFIG (use fdt instead)
> - Return an error if an unavailable i2c bus is selected
> - Simplify code in i2c_addr_ok()
> - Tidy comment style
> - Use DIV_ROUND_UP() instead of a home-grown macro
> - Use new fdtdec alias decode function
> 
> Changes in v3:
> - Add TEGRA_I2C_NUM_CONTROLLERS to select number of I2C ports
> - Add comment on how to select pinmux for I2C2
> - Change i2c_init() to reset speed and override the fdt setting
> - Fix i2c_addr_ok() function to check addresses correctly
> - Rename driver to tegra_i2c since it will later be shared with Tegra3
> - Tidy up I2C speed selection to use the peripheral clock
> 
>  arch/arm/include/asm/arch-tegra2/tegra_i2c.h |  160 ++++++++
>  drivers/i2c/Makefile                         |    1 +
>  drivers/i2c/tegra_i2c.c                      |  566 ++++++++++++++++++++++++++
>  include/fdtdec.h                             |    2 +
>  lib/fdtdec.c                                 |    2 +
>  5 files changed, 731 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-tegra2/tegra_i2c.h
>  create mode 100644 drivers/i2c/tegra_i2c.c

Acked-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
