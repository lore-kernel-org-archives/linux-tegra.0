From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
Date: Fri, 15 Nov 2019 14:39:54 +0300
Message-ID: <3b8e79ad-598c-f0f7-4589-00bb0acc1867@gmail.com>
References: <20190811183932.15850-1-digetx@gmail.com>
 <20191114203117.GA761559@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191114203117.GA761559@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.11.2019 23:31, Thierry Reding пишет:
> On Sun, Aug 11, 2019 at 09:39:32PM +0300, Dmitry Osipenko wrote:
>> The drivers core bumps runtime PM refcount during of entering into
>> suspend to workaround some problem where parent device may become turned
>> off before its children. In order to disable and reset CRTCs/HDMI/etc
>> hardware, the runtime PM needs to be "forced" into suspend mode.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>
>> Changelog:
>>
>> v2: The SYSTEM_SLEEP_PM_OPS are now set for all of the relevant drivers and
>>     not only for the DC because turned out that they all should enforce the
>>     suspending.
>>
>>  drivers/gpu/drm/tegra/dc.c    | 2 ++
>>  drivers/gpu/drm/tegra/dpaux.c | 2 ++
>>  drivers/gpu/drm/tegra/dsi.c   | 2 ++
>>  drivers/gpu/drm/tegra/hdmi.c  | 2 ++
>>  drivers/gpu/drm/tegra/hub.c   | 2 ++
>>  drivers/gpu/drm/tegra/sor.c   | 2 ++
>>  drivers/gpu/drm/tegra/vic.c   | 2 ++
>>  7 files changed, 14 insertions(+)
> 
> I'm not exactly sure I understand why this is necessary. Runtime PM is
> controlled by the drivers themselves so that when an output (say SOR) is
> disabled, it drops the runtime PM reference. The idea is that since the
> disabled output is no longer needed it can just go into a low power mode
> which on Tegra usually means clocks off and reset asserted (and in some
> cases also power domain off).
> 
> DRM/KMS has system-level suspend support, which we use to disable all
> outputs when entering suspend. I see that, unfortunately, this doesn't
> seem to actually cause the devices to runtime suspend. I'm pretty sure
> that this used to work at some point, so I don't know what changed. I'd
> have to look into this a little more. The core doing something like this
> behind the driver's back seems wrong and having to force the device into
> suspend mode seems like it's just piling up on the workarounds.

Please let me know if you'll find a better solution.
