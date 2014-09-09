From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 0/4] Allow xHCI drivers to be built as separate modules
Date: Tue, 09 Sep 2014 17:27:31 +0300
Message-ID: <540F0E53.4050106@linux.intel.com>
References: <1408467712-27497-1-git-send-email-abrestic@chromium.org> <CAL1qeaFwGYgzL=n0My4eBQMhvtNQfHpU5d1tif0twtYyjw5yqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaFwGYgzL=n0My4eBQMhvtNQfHpU5d1tif0twtYyjw5yqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Julius Werner <jwerner@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 09/03/2014 10:51 PM, Andrew Bresticker wrote:
> Mathias,
> 
> On Tue, Aug 19, 2014 at 10:01 AM, Andrew Bresticker
> <abrestic@chromium.org> wrote:
>> It was suggested in the review of the Tegra xHCI driver [1] that we
>> allow xHCI drivers to be built as individual modules (like EHCI) instead
>> of building them all into the single xhci-hcd module as they are today.
>>
>> Patches 1-3 prepare for making the xHCI PCI and platform drivers able
>> to be built as individual modules and patch 4 actually creates the 3
>> separate modules (core, platform, PCI).
>>
>> Based on 3.17-rc1.
>>
>> Changes from v2:
>>  - fixed typo in xhci_register_plat
>>  - exported another symbol needed by xhci-pci module
>> Changes from v1:
>>  - rebased on changes introduced by xhci-rcar driver
>>
>> [1] http://patchwork.ozlabs.org/patch/361265/
>>
>> Andrew Bresticker (4):
>>   xhci: Introduce xhci_init_driver()
>>   xhci: Check for XHCI_COMP_MODE_QUIRK when disabling D3cold
>>   xhci: Export symbols used by host-controller drivers
>>   xhci: Allow xHCI drivers to be built as separate modules
> 
> Any thoughts/comments on this series?
> 
> 

Sorry about the delay.
When I start looking at this I always get interrupted by some fire that needs to be put out.

I still need some more time to go through it

-Mathias
