From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for
 v5.9-rc1
Date: Fri, 17 Jul 2020 23:25:14 +0300
Message-ID: <e89ba7b4-9711-3ddd-8eda-cf761e179c2b@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
 <20200717161300.1661002-6-thierry.reding@gmail.com>
 <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
 <a6f83a03-3a8f-47d0-6770-fe0e2595cde5@gmail.com>
 <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SoC Team <soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

17.07.2020 23:23, Arnd Bergmann пишет:
> On Fri, Jul 17, 2020 at 10:13 PM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> 17.07.2020 22:24, Arnd Bergmann пишет:
>>> On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> ARM: tegra: Default configuration changes for v5.9-rc1
>>>>
>>>> Enables a few new configuration options that are useful on the new Nexus
>>>> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
>>>> that's mainly used for testing.
>>>
>>> I've pulled all the other branches, but I'm a little bit wary about
>>> this one since
>>> Dmitry's patch enables a number of options that would increase the kernel
>>> size, and I see no indication that it has been reviewed by anyone else.
>>>
>>> I think the changes all make sense, but I would prefer to have a wider
>>> audience for that patch and get some Acks. If you like, you can send the
>>> tegra specific changes in a new pull request in the meantime, and then
>>> send the remaining additions to the usual suspects as an RFC, with
>>> Cc:soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, so I can apply it later if everyone is happy enough
>>> with it.
>>
>> Hello, Arnd!
>>
>> But these are already the tegra specific changes. The patch changes
>> tegra_defconfig and not the multi_v7_defconfig.
>>
>> Could you please clarify from whom would you expect to get more Acks if
>> not from the tegra maintainers?
>>
>> In practice nobody uses upstream defconfig as-is, it's only used as
>> initial template. So I'm not sure why tegra-kernel size makes you to
>> worry. Could you please explain?
> 
> It was a mistake on my end, for some reason I thought you were
> changing the arm64 defconfig, which does not have per-platform
> files.
> 
> The patch is good, and I'll pull the branch as soon as I get to it
> (it's a bit late for today).

Awesome, thank you!
