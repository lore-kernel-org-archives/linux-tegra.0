From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: mark t186 display hub PM functions __maybe_unused
Date: Fri, 15 Dec 2017 14:17:32 +0100
Message-ID: <CAK8P3a1jnTgqWDLkuOaj28C=Teuq6Q6JndP437rDihgpnt_cWA@mail.gmail.com>
References: <20171215125205.2969211-1-arnd@arndb.de> <0085adc9-a29d-df09-a464-f55d6fd967b9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0085adc9-a29d-df09-a464-f55d6fd967b9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 15, 2017 at 2:10 PM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 15.12.2017 15:51, Arnd Bergmann wrote:
>> --- a/drivers/gpu/drm/tegra/hub.c
>> +++ b/drivers/gpu/drm/tegra/hub.c
>> @@ -730,7 +730,7 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
>>       return err;
>>  }
>>
>> -static int tegra_display_hub_suspend(struct device *dev)
>> +static int __maybe_unused tegra_display_hub_suspend(struct device *dev)
>>  {
>>       struct tegra_display_hub *hub = dev_get_drvdata(dev);
>>       int err;
>> @@ -746,7 +746,7 @@ static int tegra_display_hub_suspend(struct device *dev)
>>       return 0;
>>  }
>>
>> -static int tegra_display_hub_resume(struct device *dev)
>> +static int __maybe_unused tegra_display_hub_resume(struct device *dev)
>>  {
>>       struct tegra_display_hub *hub = dev_get_drvdata(dev);
>>       int err;
>>
>
> Probably would be better to put '#ifdef CONFIG_PM' around these functions for
> the consistency with the other drm/tegra files.

I usually use __maybe_unused because it is less error-prone, the
#ifdefs are often
wrong, either they are around the wrong functions or they use CONFIG_PM
CONFIG_PM_SLEEP interchangeably, which they are not. If you want to
add a patch with the correct #ifdef instead of my patch, that's fine with me
(add a Reported-by tag then), but I won't send a patch to do that myself.

        Arnd
