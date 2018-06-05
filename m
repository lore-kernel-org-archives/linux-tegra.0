From: gengdongjiu <gengdongjiu@huawei.com>
Subject: Re: [PATCH] usb: xhci: remove the code build warning
Date: Tue, 5 Jun 2018 16:54:17 +0800
Message-ID: <e2b3ea42-ab55-a1b5-567a-1a57a5f45b5c@huawei.com>
References: <1528216500-14172-1-git-send-email-gengdongjiu@huawei.com>
 <20180605084019.GA8665@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605084019.GA8665@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2018/6/5 16:40, Greg KH wrote:
> On Wed, Jun 06, 2018 at 12:35:00AM +0800, Dongjiu Geng wrote:
>> Initialize the 'err' variate to remove the build warning,
>> the warning is shown as below:
>>
>> drivers/usb/host/xhci-tegra.c: In function ‘tegra_xusb_mbox_thread’:
>> drivers/usb/host/xhci-tegra.c:552:6: warning: ‘err’ may be used uninitialized in this function [-Wuninitialized]
>> drivers/usb/host/xhci-tegra.c:482:6: note: ‘err’ was declared here
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
> 
> Any hint as to what commit caused this warning to show up?

It seems below commit:

commit e84fce0f8837496a48d11086829bdbe170358b7a
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Feb 11 18:10:48 2016 +0100

    usb: xhci: Add NVIDIA Tegra XUSB controller driver

    Add support for the on-chip XUSB controller present on Tegra SoCs. This
    controller, when loaded with external firmware, exposes an interface
    compliant with xHCI. This driver loads the firmware, starts the
    controller, and is able to service host-specific messages sent by the
    controller's firmware.

    The controller also supports USB device mode as well as powergating
    of the SuperSpeed and host-controller logic when not in use, but
    support for these is not yet implemented.

    Based on work by:
      Ajay Gupta <ajayg@nvidia.com>
      Bharath Yadav <byadav@nvidia.com>
      Andrew Bresticker <abrestic@chromium.org>

    Cc: Mathias Nyman <mathias.nyman@intel.com>
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Signed-off-by: Thierry Reding <treding@nvidia.com>


> 
> thanks,
> 
> greg k-h
> 
> .
> 
