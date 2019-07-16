From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't
 specified
Date: Tue, 16 Jul 2019 17:02:01 +0300
Message-ID: <8e1bf9f3-d16e-537f-36f1-047d16faf5eb@gmail.com>
References: <20190711021313.29445-1-digetx@gmail.com>
 <20190712195429.dlz5ofwoafciedcq@flea>
 <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
 <20190716084225.6wf5lsdzukyb6cz5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716084225.6wf5lsdzukyb6cz5@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.07.2019 11:42, Maxime Ripard пишет:
> On Sat, Jul 13, 2019 at 09:57:32PM +0300, Dmitry Osipenko wrote:
>> 12.07.2019 22:54, Maxime Ripard пишет:
>>> On Thu, Jul 11, 2019 at 05:13:13AM +0300, Dmitry Osipenko wrote:
>>>> The rotation mode from cmdline shouldn't be taken into account if it
>>>> wasn't specified in the cmdline. This fixes ignored default display
>>>> orientation when display mode is given using cmdline without the
>>>> rotation being specified.
>>>>
>>>> Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the commandline")
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>>
>>> Thanks!
>>> Maxime
>>
>> Thank you. Please note that I'm not a DRM maintainer, hence either you
>> should pick up and apply the patch by yourself or somebody else who has
>> the commit rights will have do that. I guess Thierry could also pick up
>> the patch into the Tegra's tree, but this patch is more DRM-generic.
> 
> Right, I've applied it now

Thank you very much!
