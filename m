From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix Kconfig dependencies
Date: Wed, 08 Jan 2014 05:48:44 -0800
Message-ID: <52CD573C.4020501@roeck-us.net>
References: <1388946171-29459-1-git-send-email-linux@roeck-us.net> <20140106153945.GA6721@ulmo.nvidia.com> <20140106162055.GA18726@roeck-us.net> <20140108132924.GA1592@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108132924.GA1592-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/08/2014 05:29 AM, Thierry Reding wrote:
> On Mon, Jan 06, 2014 at 08:20:55AM -0800, Guenter Roeck wrote:
>> On Mon, Jan 06, 2014 at 04:39:47PM +0100, Thierry Reding wrote:
>>> On Sun, Jan 05, 2014 at 10:22:51AM -0800, Guenter Roeck wrote:
>>>> arm:allmodconfig fails to build with several undefined drm and host1x symbols.
>>>>
>>>> drivers/gpu/drm/tegra/bus.c:52: undefined reference to `drm_dev_alloc'
>>>> drivers/gpu/drm/tegra/bus.c:56: undefined reference to `drm_dev_register'
>>>> drivers/gpu/drm/tegra/bus.c:67: undefined reference to `drm_dev_free'
>>>> drivers/gpu/drm/tegra/bus.c:75: undefined reference to `drm_put_dev'
>>>> drivers/gpu/drm/tegra/drm.c:445: undefined reference to `host1x_syncpt_get_base'
>>>> drivers/gpu/drm/tegra/drm.c:449: undefined reference to `host1x_syncpt_base_id'
>>>>
>>>> and so on.
>>>>
>>>> This is caused by DRM=m but DRM_TEGRA=y. DRM_TEGRA is bool while DRM is
>>>> tristate. DRM_TEGRA can not be set to tristate because it depends on unexported
>>>> host1x symbols (and possibly others). Fix by updating DRM_TEGRA dependency.
>>>>
>>>> Also, the DRM_TEGRA help text states that it can be built as module.
>>>> Remove that text since it is not (or no longer) correct.
>>>>
>>>> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>> ---
>>>>   drivers/gpu/drm/tegra/Kconfig |    5 +----
>>>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> Hi Guenter,
>>>
>>> I think this should be fixed in latest next, where it is now possible to
>>> build the Tegra DRM driver as a module. All needed host1x symbols are
>>> exported as well.
>>>
>>> One thing that strikes me as odd, though, is that I've always thought
>>> Kconfig would warn if a symbol selected as =y depended on a symbol
>>> selected as =m, precisely because of what you describe above. menuconfig
>>> complains about it pretty loudly as well.
>>>
>>> Oh, but I see that if I change DRM_TEGRA back to be bool, then Kconfig
>>> doesn't complain anymore, even if DRM_TEGRA=y and DRM=m. Should that
>>> perhaps be considered a bug?
>>>
>> No idea. All I know is that it causes a build failure ;-).
>>
>> Anyway, are there plans to push the patches changing DRM_TEGRA to tristate
>> into 3.13 ? This is one of the reasons for arm:allmodconfig to fail. If there
>> are no plans to push the patches into 3.13, I think it would make sense
>> to send my patch to Linus and apply the tristate changes on top of it.
>
> The patches to change DRM_TEGRA to tristate are part of what is queued
> for 3.14. While I agree that having allmodconfig working is a worthwhile
> goal in itself for build testing, I'm not sure it warrants a patch this
> late in the release cycle that will cause conflicts during the merge
> window.
>
> It also seems like there are other issues that prevent allmodconfig to
> build successfully on ARM not all of them being as easy to fix as this
> one.
>

All other problems are being addressed.

If arm:allmodconfig is not pursued as buildable, trying to build it is worthless,
and I'll drop it from my list of test builds for -stable. Thanks for letting me know.

Guenter
