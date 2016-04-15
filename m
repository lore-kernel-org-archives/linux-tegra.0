From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 20:44:32 +0530
Message-ID: <57110558.8010209@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-7-git-send-email-ldewangan@nvidia.com> <5710F7A4.5070902@nvidia.com> <5710F6CA.6060700@nvidia.com> <57110560.80004@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57110560.80004-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 08:44 PM, Jon Hunter wrote:
> On 15/04/16 15:12, Laxman Dewangan wrote:
>>
>>
>> All CSI pads are lined to single IO rail.
> I agree with this and from the data-sheet I see the rail that powers the
> CSI (and DSI) interfaces is called AVDD_DSI_CSI. But again, in the DT
> document you are referring to csia, csib, csic, csid, csie, csif as
> pins, but these don't appear to be physical pins, and this appears to be
> more of a software means to control power to the various csi_x pins.
>
> It seems to me that each of the existing CSI_A_xxx pins/pads should be
> mapped to or register with the appropriate power-down control and when
> all pads are set to inactive this then triggers the power-down of all
> the CSI_A_xxx pads.

I used pins as this is the property from pincon generic so that I can 
use the generic implementation.

Here, I will not go to the pin level control as HW does not support pin 
level control.

I will say the unit should be interface level. Should we say 
IO_GROUP_CSIA, IO_GROUP_CSIB etc?


>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
