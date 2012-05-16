From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Unifying device tree filenames, and U-Boot SoC name
Date: Wed, 16 May 2012 11:44:40 -0600
Message-ID: <4FB3E788.2040801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I just posted a patch which causes U-Boot to define some variables
describing which board you're running on:

http://lists.denx.de/pipermail/u-boot/2012-May/124556.html

In particular, see the description of that first patch for motivation
re: U-Boot scripts.

The one issue here is that the U-Boot SoC name for Tegra20 is tegra2
(hence it will define board_soc=tegra2), whereas the kernel's device
tree files are all tegra-*.dts not tegra2-*.dts.

I propose we fix this by:

a) In the kernel, renaming tegra*-${board}.dts to tegra20-${board}.dts
(or tegra30-${board}.dts). This appears to better match what most other
ARM sub-arches are doing anyway.

b) In U-Boot, rename the tegra2 support to tegra20 so that U-Boot ends
up setting board_soc=tegra20, so this matches the .dts/.dtb filenames.
This would involve renaming arch/arm/cpu/armv7/tegra2/ to
./arch/arm/cpu/armv7/tegra20/ and editing boards.cfg to match, and
possibly other related changes.

This sounds like churn, but I think we could easily fold this into
Allen's series that moves the tegra2 directory in order to put it in a
common place for separate SPL/non-SPL builds to avoid doing this kind of
thing multiple times.

Does anyone think this is a good/bad/... idea? Thanks.
