From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Pinmux driver/board table generator script
Date: Tue, 22 Apr 2014 17:09:19 -0600
Message-ID: <5356F69F.6060403@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I've published some scripts I wrote to auto-generate pinmux drivers and
board data tables at:

https://github.com/NVIDIA/tegra-pinmux-scripts
git:github.com/NVIDIA/tegra-pinmux-scripts.git

Going forward, I hope we can add all new SoC and board definitions to
this tool, at least for any NVIDIA reference boards, if not third-party
boards too.

The complete description from the first commit is:

Initial set of scripts

A set of scripts to generate Linux kernel and U-Boot pinmux drivers and
board pinmux configuration tables. Also included are scripts to convert
existing Linux kernel pinmux drivers and NV-internal spreadsheets to the
internal data representation.

SoC configuration files are included for Tegra30, Tegra114, and Tegra124.

Board configuration files are included for Jetson TK1 and Venice2.

configs/tegra30.soc
configs/tegra114.soc
configs/tegra124.soc

    SoC pin definitions

configs/jetson-tk1.board
configs/venice2.board

    Board configurations

soc-to-kernel-pinctrl-driver.py
soc-to-uboot-driver.py

    Generate Linux kernel and U-Boot pinmux drivers

board-to-kernel-dt.py
board-to-uboot.py

    Generate board configuration tables for the Linux kernel (DT) and
    U-Boot.

kernel-pinctrl-driver-to-soc.py

    Convert an existing Linux kernel pinmux driver to the internal
    representation of an SoC used by this project.

csv-to-board-tegra124-xlsx.py

    Convert an NV-internal board configuration spreadsheet to the
    internal representation of a board configuration used by this
    project.

tegra_pmx_board_parser.py
tegra_pmx_parser_utils.py
tegra_pmx_soc_parser.py
tegra_pmx_utils.py

    Internal Python modules used to parse the internal data
    representations, and various other utilities.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
