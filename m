From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] spi: tegra20-slink: Fix runtime PM imbalance on error
Date: Thu, 21 May 2020 09:38:52 +0100
Message-ID: <af91d97e-6367-996b-a925-a5c81f6fb182@nvidia.com>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 21/05/2020 09:04, Andy Shevchenko wrote:
> On Thu, May 21, 2020 at 10:50 AM Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org> wrote:
>>
>> pm_runtime_get_sync() increments the runtime PM usage counter even
>> when it returns an error code. Thus a pairing decrement is needed on
>> the error handling path to keep the counter balanced.
> 
> ...
> 
>>         ret = pm_runtime_get_sync(&pdev->dev);
>>         if (ret < 0) {
>>                 dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
> 
>> +               pm_runtime_put(&pdev->dev);
> 
> For all your patches, please, double check what you are proposing.
> 
> Here, I believe, the correct one will be _put_noidle().
> 
> AFAIU you are not supposed to actually suspend the device in case of error.
> But I might be mistaken, thus see above.
> 
>>                 goto exit_pm_disable;
>>         }


Is there any reason why this is not handled in pm_runtime_get itself?
Jon

-- 
nvpublic
