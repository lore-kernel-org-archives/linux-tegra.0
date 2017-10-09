From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] usb: phy: tegra: Fix phy suspend for UDC
Date: Mon, 9 Oct 2017 10:29:05 +0100
Message-ID: <c3c32343-ada3-e3f0-2550-4868f88ea372@nvidia.com>
References: <1506943373-11560-1-git-send-email-jonathanh@nvidia.com>
 <20171002115222.GA350@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002115222.GA350@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Felipe,

On 02/10/17 12:52, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Oct 02, 2017 at 12:22:53PM +0100, Jon Hunter wrote:
>> Commit dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
>> added UDC support for Tegra but with UDC support enabled, is was found
>> that Tegra30, Tegra114 and Tegra124 would hang on entry to suspend.
>>
>> The hang occurred during the suspend of the USB PHY when the Tegra PHY
>> driver attempted to disable the PHY clock. The problem is that before
>> the Tegra PHY driver is suspended, the chipidea driver already disabled
>> the PHY clock and when the Tegra PHY driver suspended, it could not read
>> DEVLC register and caused the device to hang.
>>
>> The Tegra USB PHY driver is used by both the Tegra EHCI driver and now
>> the chipidea UDC driver and so simply removing the disabling of the PHY
>> clock from the USB PHY driver would not work for the Tegra EHCI driver.
>> Fortunately, the status of the USB PHY clock can be read from the
>> USB_SUSP_CTRL register and therefore, to workaround this issue, simply
>> poll the register prior to disabling the clock in USB PHY driver to see
>> if clock gating has already been initiated. Please note that it can take
>> a few uS for the clock to disable and so simply reading this status
>> register once on entry is not sufficient.
>>
>> Similarly when turning on the PHY clock, it is possible that the clock
>> is already enabled or in the process of being enabled, and so check for
>> this when enabling the PHY.
>>
>> Please note that no issues are seen with Tegra20 because it has a slightly
>> different PHY to Tegra30/114/124.
>>
>> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes since V1:
>> - Added fixes tag
>> - Added test in PHY enable to see if clock is already on before enabling
>>
>>  drivers/usb/phy/phy-tegra-usb.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
> 
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
This fix is needed for v4.14, if you are ok with the change, can you
pick this up so we can get this merged?

Cheers
Jon

-- 
nvpublic
