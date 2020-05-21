From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] spi: tegra20-slink: Fix runtime PM imbalance on error
Date: Thu, 21 May 2020 09:46:48 +0100
Message-ID: <046fe754-96d7-4530-2b70-e1991470ac0f@nvidia.com>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com>
 <af91d97e-6367-996b-a925-a5c81f6fb182@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <af91d97e-6367-996b-a925-a5c81f6fb182@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Kangjie Lu <kjlu@umn.edu>, Laxman Dewangan <ldewangan@nvidia.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-spi <linux-spi@vger.kernel.org>, linux-tegra@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 21/05/2020 09:38, Jon Hunter wrote:
> 
> On 21/05/2020 09:04, Andy Shevchenko wrote:
>> On Thu, May 21, 2020 at 10:50 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>>>
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> when it returns an error code. Thus a pairing decrement is needed on
>>> the error handling path to keep the counter balanced.
>>
>> ...
>>
>>>         ret = pm_runtime_get_sync(&pdev->dev);
>>>         if (ret < 0) {
>>>                 dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
>>
>>> +               pm_runtime_put(&pdev->dev);
>>
>> For all your patches, please, double check what you are proposing.
>>
>> Here, I believe, the correct one will be _put_noidle().
>>
>> AFAIU you are not supposed to actually suspend the device in case of error.
>> But I might be mistaken, thus see above.
>>
>>>                 goto exit_pm_disable;
>>>         }
> 
> 
> Is there any reason why this is not handled in pm_runtime_get itself?

Ah I see a response from Rafael here:
https://lkml.org/lkml/2020/5/20/1100

OK so this is intentional and needs to be fixed.

Jon

-- 
nvpublic
