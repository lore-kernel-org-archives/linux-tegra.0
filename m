From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
Date: Tue, 21 Apr 2020 23:23:04 -0700
Message-ID: <154b779e-e3f5-1322-2f10-1356402ff956@nvidia.com>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
 <20200421205032.GD3233341@ulmo>
 <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cfbd9954-6a89-3973-55f5-920b7a807774@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/21/20 9:12 PM, Sowjanya Komatineni wrote:
>
> On 4/21/20 1:50 PM, Thierry Reding wrote:
>> On Tue, Apr 21, 2020 at 01:09:50PM +0200, Hans Verkuil wrote:
>>> Hi Sowjanya,
>>>
>>> On 21/04/2020 02:11, Sowjanya Komatineni wrote:
>>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>>> generator (TPG) capture.
>>>>
>>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>>
>>>> This series has TPG support only where it creates hard media links
>>>> between CSI subdevice and VI video device without device graphs.
>>>>
>>>> v4l2-compliance results are available below the patch diff.
>>> I'm ready to merge this v8. Looking at the series I should only merge
>>> patches 6 and 7, all other patches go through different subsystems, 
>>> right?
>> You could also pick up patch 5 because it adds the bindings that are
>> implemented by the driver in patch 6. But I can also pick that up into
>> the Tegra tree. In fact, I do have a set of patches to convert some
>> Tegra bindings to the new json-schema format and the host1x file is
>> among them. If I do get around to finish those up for v5.8 it might be
>> better for me to pick up patch 5 so that I can base my conversion patch
>> on top of that.
>>
>> Either way is fine with me, so I've acked the three patches. Take which
>> ones you want and I'll pick up the rest.
>>
>> Thanks again for your guidance on this patch set!
>>
>> Thierry
>
> Hi Hans,
>
> Would like to add a small fix to the driver for explicit check for vi 
> and csi availability before TPG setup and cleanup in case if video 
> driver is enabled without device tree support where vi and csi drivers 
> does not register.
>
> Although we are not enabling driver by default now, would be good to 
> have this in this series itself.
>
> Will send out the updated version, please pick v9.
>
> Thanks
>
> Sowjanya

Sorry Hans. Just sent v9 which has small fix of explicit check on csi 
and vi both channels availability before TPG setup and cleanup.

As for later Tegras (Tegra186+), CSI is not a child device to VI and in 
case if either of CSI/VI platform driver register doesn't happen this 
explicit check helps to skip TPG setup. Mostly as device tree changes go 
with driver updates, should not be real issue but in case of wrong 
compatible or missing in device tree to avoid crash added this explicit 
check.

Please consider this v9 for merge.

Thanks

Sowjanya

>
>
