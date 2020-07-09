From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/6] gpio: max77620: Fix missing release of interrupt
Date: Thu, 9 Jul 2020 19:36:04 +0300
Message-ID: <89592ba5-f62e-3145-6f0b-9289f80a3171@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-3-digetx@gmail.com>
 <80f4d1ff-8096-9060-3cf0-a59448866c40@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <80f4d1ff-8096-9060-3cf0-a59448866c40-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.07.2020 17:57, Laxman Dewangan пишет:
> 
> 
> On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> The requested interrupt is never released by the driver. Fix this by
>> using the resource-managed variant of request_threaded_irq().
>>
>> Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> 
> Looks good to me.
> Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hello, Laxman! Thank you very much for taking a look at this series!

I missed to add the stable tag to this patch, so will prepare a v4 with
the corrected tag. I'll also add yours acks and Andy's r-bs to the
patches. Thanks!
