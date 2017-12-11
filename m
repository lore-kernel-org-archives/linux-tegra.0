From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Mon, 11 Dec 2017 18:26:22 +0300
Message-ID: <5c0435f4-88ae-282c-f096-b8dd7226ab0e@gmail.com>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
 <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
 <20171211101343.GG10671@ulmo>
 <f04f7268-bcf8-feab-bded-88a166b3b474@gmail.com>
 <20171211142727.GA19922@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211142727.GA19922@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 17:27, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 04:53:56PM +0300, Dmitry Osipenko wrote:
>> On 11.12.2017 13:13, Thierry Reding wrote:
>>> On Mon, Dec 11, 2017 at 02:19:44AM +0300, Dmitry Osipenko wrote:
>>>> Add manual HW power management to drivers probe/remove in order to
>>>> not fail in a case of runtime power management being disabled in kernel
>>>> config.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  drivers/gpu/drm/tegra/dc.c   | 164 +++++++++++++++++++++++++++----------------
>>>>  drivers/gpu/drm/tegra/dsi.c  | 138 +++++++++++++++++++++---------------
>>>>  drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++--------
>>>>  drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++----------
>>>>  4 files changed, 310 insertions(+), 185 deletions(-)
>>>
>>> I think that's the wrong way around. We unconditionally select PM on
>>> 64-bit ARM already, and I think we should do the same on 32-bit ARM.
>>> There's really no excuse not to enable runtime PM these days.
>>
>> What is the rational behind enabling PM unconditionally? It is actually a very
>> useful debug feature when there is something wrong with the PM. It looks like
>> Tegra DRM driver is the only driver on Tegra that doesn't work properly with PM
>> being disabled. Please, let's just fix it.
> 
> What's useful about disabling PM? The problem with allowing !PM is that
> it adds one more combination that needs to be build- and runtime tested.

As I already stated, disabling PM is very useful for debugging when system hangs
unexpectedly. I found it very helpful several times.

> It also means we need to have extra code in the drivers to enable the
> device when runtime PM is disabled. This is all a lot of extra effort
> for little to no benefit.

Nearly every driver has a dozen lines of extra code to handle disabled PM. I
don't see why Tegra DRM should be an excuse. Also notice that I added some more
error messages.

Of course it would be nice if you could test disabled PM config option from time
to time. I don't think it is very important config option for a regular user,
but very useful for developing and for debugging when things break. So it
shouldn't an extra testing burden for you.

> Also, runtime PM is an integral part of mode setting in Tegra DRM, so I
> would be suprised if things still work reliably after this patch. RGB,
> DSI and HDMI might work properly, but the SOR is unlikely to work after
> this because the only way to get it to reliably set a mode is by using
> the full runtime suspend/resume cycle.

I wasn't aware of the SOR's hazard, thanks for pointing at it. Probably
performing power cycle on encoders enabling would be enough, wouldn't it?
