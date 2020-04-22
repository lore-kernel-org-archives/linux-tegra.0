From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
Date: Tue, 21 Apr 2020 21:12:47 -0700
Message-ID: <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
 <20200421205032.GD3233341@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200421205032.GD3233341@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/21/20 1:50 PM, Thierry Reding wrote:
> On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>> I'm ready to merge this v8. Looking at the series I should only merge
>> patches 6 and 7, all other patches go through different subsystems, right?
> You could also pick up patch 5 because it adds the bindings that are
> implemented by the driver in patch 6. But I can also pick that up into
> the Tegra tree. In fact, I do have a set of patches to convert some
> Tegra bindings to the new json-schema format and the host1x file is
> among them. If I do get around to finish those up for v5.8 it might be
> better for me to pick up patch 5 so that I can base my conversion patch
> on top of that.
>
> Either way is fine with me, so I've acked the three patches. Take which
> ones you want and I'll pick up the rest.
>
> Thanks again for your guidance on this patch set!
>
> Thierry

Hi Hans,

Would like to add a small fix to the driver for explicit check for vi 
and csi availability before TPG setup and cleanup in case if video 
driver is enabled without device tree support where vi and csi drivers 
does not register.

Although we are not enabling driver by default now, would be good to 
have this in this series itself.

Will send out the updated version, please pick v9.

Thanks

Sowjanya
