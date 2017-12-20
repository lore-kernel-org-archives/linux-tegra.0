From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/4] usb: phy: Add Kconfig entry for Tegra PHY driver
Date: Wed, 20 Dec 2017 16:40:08 +0300
Message-ID: <1804f5ae-ed44-4d76-d73e-738b79e3aea4@gmail.com>
References: <11a5e4f2690ea3052df884b831821e2fdf85634e.1513528011.git.digetx@gmail.com>
 <201712202122.hpEwmM4w%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201712202122.hpEwmM4w%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 20.12.2017 16:17, kbuild test robot wrote:
> Hi Dmitry,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on balbi-usb/next]
> [also build test ERROR on v4.15-rc4 next-20171220]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/usb-phy-tegra-Cleanup-error-messages/20171220-142227
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git next
> config: arm-tegra_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/usb/host/ehci-tegra.o: In function `tegra_ehci_hub_control':
>>> ehci-tegra.c:(.text+0x818): undefined reference to `tegra_usb_phy_preresume'
>>> ehci-tegra.c:(.text+0x9b4): undefined reference to `tegra_usb_phy_postresume'

So there is actual build-dependency on the PHY for ehci-tegra and I haven't
tested it properly. That's not good.

Would it be fine to extend the generic PHY with pre/postresume restore_start/end
functions?
