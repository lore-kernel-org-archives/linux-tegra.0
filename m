From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: mark t186 display hub PM functions __maybe_unused
Date: Fri, 15 Dec 2017 14:36:37 +0100
Message-ID: <CAK8P3a302h7A=kpCehCC4dseF1ebNCBYZ5L8GKsjLBPkLQ8M5A@mail.gmail.com>
References: <20171215125205.2969211-1-arnd@arndb.de> <20171215133340.GA353@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215133340.GA353@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 15, 2017 at 2:33 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Dec 15, 2017 at 01:51:52PM +0100, Arnd Bergmann wrote:
>> The newly introduced driver has optional suspend/resume functions,
>> causing a warning when CONFIG_PM is disabled:
>>
>> drivers/gpu/drm/tegra/hub.c:749:12: error: 'tegra_display_hub_resume' defined but not used [-Werror=unused-function]
>> drivers/gpu/drm/tegra/hub.c:733:12: error: 'tegra_display_hub_suspend' defined but not used [-Werror=unused-function]
>>
>> This marks them __maybe_unused to shut up the warnings.
>>
>> Fixes: c4755fb9064f ("drm/tegra: Add Tegra186 display hub support")
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/hub.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> We had touched on this topic in a different thread. The Tegra DRM driver
> currently relies on runtime PM to work properly. I don't see a reason to
> not make that official by adding a select PM to menuconfig ARCH_TEGRA on
> 32-bit ARM just like we already do on 64-bit ARM.
>
> I've gone and applied this patch as an interim solution. Once we've made
> the switch to select PM on all generations of Tegra we can remove all
> the #ifdef and __maybe_unused.

Sounds good, thanks!

       Arnd
