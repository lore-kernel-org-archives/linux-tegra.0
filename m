From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v8 0/9] Add Tegra driver for video capture
Date: Fri, 24 Apr 2020 14:02:58 +0200
Message-ID: <928b9b1d-b977-a281-ef5e-128b63cce94d@xs4all.nl>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <5c44beca-4016-6e4f-01bb-e38480bfc34b@xs4all.nl>
 <20200421205032.GD3233341@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200421205032.GD3233341@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On 21/04/2020 22:50, Thierry Reding wrote:
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
>>
>> I'm ready to merge this v8. Looking at the series I should only merge
>> patches 6 and 7, all other patches go through different subsystems, right?
> 
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

I've decided to take only patches 6 and 7. Just let me know if for some
reason you want me to merge patch 5 as well, but I think it makes more
sense if you pick that one up.

> 
> Thanks again for your guidance on this patch set!

My pleasure, and it's nice to see this driver going in. Looking forward
to the next phase when sensor support is added!

Regards,

	Hans
