From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 15:42:28 +0300
Message-ID: <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710101229.54ufuhmh22dfxclr@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.07.2019 13:12, Maxime Ripard пишет:
> On Tue, Jul 09, 2019 at 05:51:51PM +0300, Dmitry Osipenko wrote:
>> The named mode could be invalid and then cmdline parser misses to validate
>> mode's dimensions, happily adding 0x0 mode as a valid mode. One case where
>> this happens is NVIDIA Tegra devices that are using downstream bootloader
>> which adds "video=tegrafb" to the kernel's cmdline and thus upstream Tegra
>> DRM driver fails to probe because of the invalid mode.
>>
>> Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command line")
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Applied to drm-misc-next-fixes
> 
> Thanks for figuring this out!

Thank you very much! So the driver now doesn't fail to probe because of the cmdline, but
what else I noticed is that the framebuffer console is now rotated by 90° on a 800x1280
panel, while display in Xorg is vertical as it was before. Seems something else is still
missing, reverting "drm/modes: Rewrite the command line parser" returns the framebuffer's
console orientation
into the original state.
