From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm: tegra: initial support for apalis t30
Date: Mon, 16 Jun 2014 13:14:30 -0600
Message-ID: <539F4216.70102@wwwdotorg.org>
References: <dadd07f9ed693d6bcf541764b62a2caf4cc38630.1402353627.git.marcel@ziswiler.com> <95c131deb3e410e8defc9fe125dc662bdb276310.1402353627.git.marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <95c131deb3e410e8defc9fe125dc662bdb276310.1402353627.git.marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/09/2014 04:52 PM, Marcel Ziswiler wrote:
> This patch adds the device tree to support Toradex Apalis T30, a
> computer on module which can be used on different carrier boards.
> 
> The module consists of a Tegra 3 SoC, two PMICs, 1 or 2 GB of DDR3L
> RAM, eMMC, an LM95245 temperature sensor chip, an i210 resp. i211
> gigabit Ethernet controller, an STMPE811 ADC/touch controller as well
> as two MCP2515 CAN controllers. Furthermore, there is an SGTL5000 audio
> codec which is not yet supported. Anything that is not self contained
> on the module is disabled by default.
> 
> The device tree for the Evaluation Board includes the modules device
> tree and enables the supported peripherals of the carrier board (the
> Evaluation Board supports almost all of them).
> 
> While at it also add the device tree binding documentation for Apalis
> T30.

Applied to Tegra's for-3.17/dt branch.
