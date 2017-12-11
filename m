From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] usb: tegra: Move UTMI-pads reset from ehci-tegra
 to tegra-phy
Date: Mon, 11 Dec 2017 16:31:39 +0300
Message-ID: <886b6cfe-1691-508b-335b-6f015747dd40@gmail.com>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
 <853ce44924e396b907332d4f3ad4ae70eae9bbcc.1512946782.git.digetx@gmail.com>
 <20171211102523.GH10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211102523.GH10671@ulmo>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 13:25, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:07:38AM +0300, Dmitry Osipenko wrote:
>> UTMI pads are shared by USB controllers and reset of UTMI pads is shared
>> with the reset of USB1 controller. Currently reset of UTMI pads is done by
>> the EHCI driver and ChipIdea UDC works because EHCI driver always happen
>> to be probed first. Move reset controls from ehci-tegra to tegra-phy in
>> order to resolve the problem.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/usb/host/ehci-tegra.c     | 87 ++++++++++++++++++---------------------
>>  drivers/usb/phy/phy-tegra-usb.c   | 46 +++++++++++++++++++++
>>  include/linux/usb/tegra_usb_phy.h |  2 +
>>  3 files changed, 87 insertions(+), 48 deletions(-)
> 
> I don't think we can do this. For one I don't think shared resets are
> going to work here because you really won't ever be able to reset after
> two devices have requested the same reset.

Ah, indeed. Originally I had the reset being done in the probe, but then changed
it in the last minute without proper testing. Good catch! I'll revert back patch
to the origin.

 Second, utmip_pad_close()
> could be called at any point and it will have the side-effect of either
> not doing a reset at all (because it is shared) or resetting the USBD
> controller at the same time.

utmip_pad_close() is only called on tegra-phy driver removal, so it is
absolutely fine.

> We've been over this code a great deal over the years. I'd love it to be
> simpler, but every time we tried to simplify it, things broke.

Well, the current code is already broken quite severely because now we have two
users of the tegra-phy: ehci-tegra and chipidea-tegra. Things brake if host
driver is loaded after the UDC because host would reset the UDC. And also pads
won't be reset if ehci-tegra isn't loaded at all.

Shared reset seems to be a perfect solution for us and of course it requires
extra carefulness.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
