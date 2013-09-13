From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Fri, 13 Sep 2013 16:22:52 +0300
Message-ID: <20130913132252.GN30013@tbergstrom-lnx.Nvidia.com>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org>
 <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org>
 <523101EA.7020704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523101EA.7020704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 12, 2013 at 01:51:06AM +0200, Stephen Warren wrote:
> On 09/11/2013 05:48 PM, Stephen Warren wrote:
> > This board is currently disabled by default due to lack of U-Boot support
> > in the mainline repository. If you wish to test this, do as follows:
> > 
> > cd u-boot
> > git checkout some-branch-with-venice2-support
> > cd ../scripts
> > ./build --boards venice2 build
> 
> Peter, do you have a Venice2 yet? If so, could I trouble you to apply
> the tegrarcm Tegra124 support patches from Allen, the cbootimage-configs
> and tegra-uboot-flasher-scripts patches from me, grab a downstream
> Venice2 U-Boot branch, and validate that it all works?
> 

It builds all fine, but flashing as such fails with:

U-Boot SPL 2013.04-g4e07053 (Sep 13 2013 - 16:11:40)


U-Boot 2013.04-g4e07053 (Sep 13 2013 - 16:11:40)

TEGRA124
Board: NVIDIA Venice2
DRAM:  2 GiB
WARNING: Caches not enabled
MMC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
In:    serial
Out:   serial
Err:   serial
Net:   Net Initialization Skipped
No ethernet found.
(Re)start USB...
USB0:   USB EHCI 1.10
scanning bus 0 for devices... 2 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
       scanning usb for ethernet devices... 1 Ethernet Device(s) found
Hit any key to stop autoboot:  0
SF: Unsupported manufacturer fc
Failed to initialize SPI flash at 0:0
No SPI flash selected. Please run `sf probe'
No SPI flash selected. Please run `sf probe'
## Resetting to default environment
Saving Environment to MMC...
Writing to MMC(0)... done
resetting ...
