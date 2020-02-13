From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [RFT PATCH v2] xhci: Fix memory leak when caching protocol
 extended capability PSI tables
Date: Thu, 13 Feb 2020 13:33:47 +0000
Message-ID: <f42f7f73-48e7-74ad-2524-2514f29490cb@nvidia.com>
References: <20d0559f-8d0f-42f5-5ebf-7f658a172161@linux.intel.com>
 <20200211150158.14475-1-mathias.nyman@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20200211150158.14475-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org, m.szyprowski@samsung.com
Cc: pmenzel@molgen.mpg.de, mika.westerberg@linux.intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, stable <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 11/02/2020 15:01, Mathias Nyman wrote:
> xhci driver assumed that xHC controllers have at most one custom
> supported speed table (PSI) for all usb 3.x ports.
> Memory was allocated for one PSI table under the xhci hub structure.
> 
> Turns out this is not the case, some controllers have a separate
> "supported protocol capability" entry with a PSI table for each port.
> This means each usb3 roothub port can in theory support different custom
> speeds.
> 
> To solve this, cache all supported protocol capabilities with their PSI
> tables in an array, and add pointers to the xhci port structure so that
> every port points to its capability entry in the array.
> 
> When creating the SuperSpeedPlus USB Device Capability BOS descriptor
> for the xhci USB 3.1 roothub we for now will use only data from the
> first USB 3.1 capable protocol capability entry in the array.
> This could be improved later, this patch focuses resolving
> the memory leak.
> 
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Reported-by: Sajja Venkateswara Rao <VenkateswaraRao.Sajja@amd.com>
> Fixes: 47189098f8be ("xhci: parse xhci protocol speed ID list for usb 3.1 usage")
> Cc: stable <stable@vger.kernel.org> # v4.4+
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>


Since next-20200211, we have been observing a regression exiting suspend
on our Tegra124 Jetson TK1 board. Bisect is pointing to this commit and
reverting on top of -next fixes the problem.

On exiting suspend, I am seeing the following ...

[   56.216793] tegra-xusb 70090000.usb: Firmware already loaded, Falcon state 0x20
[   56.216834] usb usb3: root hub lost power or was reset
[   56.216837] usb usb4: root hub lost power or was reset
[   56.217760] tegra-xusb 70090000.usb: No ports on the roothubs?
[   56.218257] tegra-xusb 70090000.usb: failed to resume XHCI: -12
[   56.218299] PM: dpm_run_callback(): platform_pm_resume+0x0/0x40 returns -12
[   56.218312] PM: Device 70090000.usb failed to resume: error -12
[   56.334366] hub 4-0:1.0: hub_ext_port_status failed (err = -32)
[   56.334368] hub 3-0:1.0: hub_ext_port_status failed (err = -32)

Let me know if you have any thoughts on this.

Cheers
Jon

-- 
nvpublic
