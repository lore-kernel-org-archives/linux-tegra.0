From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as platform
 driver
Date: Wed, 20 Mar 2013 11:36:20 -0600
Message-ID: <5149F394.4070600@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <5148C1DC.1020903@wwwdotorg.org> <D958900912E20642BCBC71664EFECE3E6E5092FFE2@BGMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E5092FFE2-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 06:12 AM, Venu Byravarasu wrote:
>> -----Original Message-----
>> From: Venu Byravarasu
>> Sent: Wednesday, March 20, 2013 11:30 AM
>> To: 'Stephen Warren'
>> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
>> balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: RE: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as
>> platform driver
>>
>>> -----Original Message-----
>>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>>> Sent: Wednesday, March 20, 2013 1:22 AM
>>> To: Venu Byravarasu
>>> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
>>> balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>>> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>> Subject: Re: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as
>>> platform driver
>>>
>>> On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
>>>> As part of this series, apart from patch containing changes to register
>>> TEGRA
>>>> USB PHY driver as platform driver, prepared below patches:
>>>> 1. Re-arranging & adding new DT properties.
>>>> 2. Getting various params from DT properties added.
>>>> 3. code clean up.
>>>
>>> Venu, I'm curious whether these patches were tested at all. I have found
>>> at least two significant problems with trivial testing:
>>
>> Stephen,
>> Initially started testing after applying each and every patch.
>> Like that tested till first 5 patches.
>> As did not see any issues till then, applied rest 2 patches at once and tested
>> with that.
>> Though did not see mouse getting vbus on the 1st boot, Vbus was coming
>> fine after disconnect and connect.
>> Hence did not test thereafter.
>>
>> After checking your current mail, tried now and observed that there seems to
>> be some real issue with patch#7 only. (As tried now after applying till patch#
>> 6 and did not see this issue).
>> Will debug further on patch#7 and update with proper fix after addressing
>> your other comments.
> 
> Debugged further and found that the issue is because of http://marc.info/?l=linux-arm-kernel&m=135890098024987&w=2 
> On reverting that patch and applying it on top of patch#7, able to see  enumeration working fine.
> 
> Anyhow, will take care of your other comments and merge this change with patch#7 and resend
> for review.

Venu, we already discussed this downstream, and I pointed out that patch
is /extremely/ unlikely to cause any issue.

The clk_set_rate() call returns an error since the requested clock rate
is not supported. The clk_prepare_enable() shouldn't have any effect
because if it did, the only possible meaning is that the clock is
otherwise turned off because it has no users, and that would prevent far
more than USB from operating correctly.

Please fully debug this problem and root-cause it. I'm not reverting
that EMC clock patch without a complete explanation. There's little
point reposting the patches until you've found the problem.

If we did have to revert that patch, then we would need to redefine the
DT bindings for Tegra USB to add that clock into the list of required
clocks, since otherwise it could not clk_get(dev, "emc"). But the USB
driver shouldn't be touching non-USB clocks.
