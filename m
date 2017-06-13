From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 0/6] reset: APIs to manage a list of resets
Date: Tue, 13 Jun 2017 12:35:26 +0530
Message-ID: <e11ccef9-ba3f-6349-8343-5e0435033d27@codeaurora.org>
References: <20170601165203.15315-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170601165203.15315-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 06/01/2017 10:21 PM, Philipp Zabel wrote:
> A set of patches to allow consumers to get and de/assert or trigger
> a number of resets at the same time. A patch on top of Vivek's original
> API extension is added to hide the reset_control_array behind a struct
> reset_control so that the consumer doesn't have care about the difference
> between a singular reset control and reset control controlling an array
> of resets, except when requesting the control.
>
> This series also contains reset controls patches for dwc3-of-simple
> and tegra pmc drivers.
> A small patch is added in this series to correctly re-order the
> resource handling in dwc3_of_simple_remove().
>
> The series is tested on torvald's master branch the device tree
> patches to enable usb on db820c.
>
> Changes since v4:
>   - Added a patch to hide reset control arrays behind struct reset_control
>     and adapted the consumer patches. This could be merged with the reset
>     array API patch if we think this is a good idea.

Hi Philipp,

I tested this series again on my db820c setup. Things work fine.
We can merge this series after fixing the 3/6 patch in this series.

Thanks

Hi Felipe,
If you are okay with changes in dwc3, can you kindly consider Ack'ing this
series. May be Philipp can pull the entire series after fixing.

Thanks
Vivek

>
> Changes since v3:
>   - Squashed of_reset_control_get_count() patch in the second patch that
>     adds the reset control array APIs.
>   - The error path after getting count through of_reset_control_get_count()
>     now returns NULL pointer in case when 'optional' flag is true.
>   - Added code in reset_control_array_assert() to deassert the
>     already asserted resets in the error case.
>   - Using of_reset_control_array_get_optional_exclusive() in dwc3 patch
>     to request the reset control array.
>   - Added a patch to fix the order in which resources are handled in
>     dwc3_of_simple_remove() path.
>   - Added tegra_powergate->reset to take care of single reset control
>     passed from the client drivers.
>
> Changes since v2:
>   - Addressed comments to make APIs inline with gpiod API.
>   - Moved number of reset controls in 'struct reset_control_array'
>     so that the footprint is reduced.
>   - of_reset_control_array_get() and devm_reset_control_array_get()
>     now return pointer to the newly created reset control array.
>   - Added comments to mention that the reset control array APIs don't
>     guarantee any particular order when handling the reset controls.
>   - Dropped 'name' from reset_control_array' since the interface is meant
>     for a bunch of anonymous resets that can all be asserted or deasserted
>     in arbitrary order.
>   - Fixed returns for APIs reported by kbuild.
>   - Fixed 'for' clause guards reported by kbuild.
>
> Changes since v1:
>   - Addressed comment for error handling in of_reset_control_get_count()
>   - Added patch to manage reset controller array.
>   - Rebased dwc3-of-simple changes based on the new set of APIs
>     for reset control array.
>   - Added a patch for soc/tegra/pmc driver to use the new set of
>     reset control array APIs.
>
> Philipp Zabel (2):
>    reset: use kref for reference counting
>    reset: hide reset control arrays behind struct reset_control
>
> Vivek Gautam (4):
>    reset: Add APIs to manage array of resets
>    usb: dwc3: of-simple: Re-order resource handling in remove
>    usb: dwc3: of-simple: Add support to get resets for the device
>    soc/tegra: pmc: Use the new reset APIs to manage reset controllers
>
>   drivers/reset/core.c              | 234 ++++++++++++++++++++++++++++++++++++--
>   drivers/soc/tegra/pmc.c           |  82 ++++---------
>   drivers/usb/dwc3/dwc3-of-simple.c |  29 ++++-
>   include/linux/reset.h             |  73 ++++++++++++
>   4 files changed, 344 insertions(+), 74 deletions(-)
>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
