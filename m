From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: Expose color key and plane blending controls
 to userspace
Date: Sun, 4 Sep 2016 21:38:24 +0300
Message-ID: <639b9541-d01e-cead-8d3f-d63df40f7575@gmail.com>
References: <20160902093359.9063-1-digetx@gmail.com>
 <20160902153219.GA396@ulmo.ba.sec> <20160902155120.GB396@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160902155120.GB396@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02.09.2016 18:51, Thierry Reding wrote:
> On Fri, Sep 02, 2016 at 05:32:19PM +0200, Thierry Reding wrote:
>> On Fri, Sep 02, 2016 at 12:33:42PM +0300, Dmitry Osipenko wrote:
>>> Chromakey is a simple way of video overlay overlap implementation. This
>>> patch adds 2 new IOCTL's: first - sets color key and is common across of
>>> all Tegra SoC's, second - sets plane blending controls and allows to
>>> utilize the color key, this one is exclusive to Tegra20/30.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c   | 150 +++++++++++++++++++++++++++++++++-------
>>>  drivers/gpu/drm/tegra/dc.h   |   6 ++
>>>  drivers/gpu/drm/tegra/drm.c  | 159 +++++++++++++++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/tegra/drm.h  |  14 ++++
>>>  include/uapi/drm/tegra_drm.h |  34 +++++++++
>>>  5 files changed, 337 insertions(+), 26 deletions(-)
>>
>> I think these are really nice features to have, but these would need to
>> be exposed as properties, rather than custom driver-specific IOCTLs. It
>> seems to me like the colorkey feature could be implemented in much the
>> same way as in the Armada, RCar and Nouveau drivers.
>>

Now, instead of custom driver-specific IOCTL's we would have custom
driver-specific DRM object properties. I'm not sure how they should be represented.

Should we assume that primary plane is the only source of colorkey? On Tegra,
colorkey isn't matched against the underlying plane, it represents area on the
plane (that uses that colorkey) that should be blended. In case of Xv, I have to
enable colorkey matching for the primary plane and make transparent areas of the
primary plane where colorkey matches and overlapped by the overlay, areas that
are overlapped and NOT matching colorkey are displayed on top of the overlay
(like mouse cursor or some window).

Should we assign colorkey (0xkey value itself) property per overlay plane? WIN_B
will use colokey0, WIN_C colorkey1.
Or make colorkey values property of CRTC? So it would be possible (probably not
so useful) to have 2 color keys used for one overlay.

Should colorkey be enabled/disabled via properties? I.e. it will be
"use_colorkey" plane property. Feels a bit icky to me.

I see only DRM_IOCTL_MODE_OBJ_SETPROPERTY, so no way to set all properties at once?

>> As for the blending options, I think they should be exposed in terms of
>> the zpos property, to allow generic userspace to make use of them. Also
>> can you explain why this needs to be exclusive to Tegra20 and Tegra30?

What about the actual alpha blending? What about having different blending modes?

Should we sacrifice it all and support only 1-2 use cases?

Given that properties are specific to each driver, I can hardly imagine such
generic userspace. Could you give an example?

> Ah... I just realized that the blending interface changed on Tegra124.
> All the more reason to expose this more generically, that way we can
> hide the differences between a property and support the same interface
> across all generations of Tegra.
> 
> Also see this:
> 
> 	https://chromium.googlesource.com/chromiumos/third_party/kernel/+/de9295aabdb7f80555c9b77b29ac77bcdac3280b
> 

-- 
Dmitry
