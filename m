From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] gpio: tegra: Remove the need of keeping device handle
 for gpio driver
Date: Tue, 19 Apr 2016 09:58:10 -0600
Message-ID: <57165592.50706@wwwdotorg.org>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com>
 <1460969178-20914-2-git-send-email-ldewangan@nvidia.com>
 <57150B81.6040104@wwwdotorg.org> <571512B0.90303@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <571512B0.90303@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org
Cc: gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2016 11:00 AM, Laxman Dewangan wrote:
>
> On Monday 18 April 2016 09:59 PM, Stephen Warren wrote:
>> On 04/18/2016 02:46 AM, Laxman Dewangan wrote:
>>> Remove the file static device handle variable as this is just
>>> required for prints. The required handle can be stored in
>>> tegra_gpio_chip and hence it become redundancy.
>>
>> This seems fine as far as it goes, but if it's worth doing this,
>> please move all the globals into the GPIO chip rather than just one of
>> the 7 globals.
>
> the device pointer is part of the gpiochip and so it is better to use
> gpiochip parent member instead of locally duplicating.
>
> However, moving to other global variables needs some major changes and I
> think it should be treated as independent of this patch.
> This patch just utilizes the gpiochip.parent here.

Looking at the patch this just trades using one global (dev) for another 
(tegra_gpio_chip), so when the other globals are removed, you'll need to 
go back and change tegra_gpio_irq_set_type() again to remove use of the 
global tegra_gpio_chip.

Still, this /does/ remove one global so I guess it's OK. I don't feel 
terribly strongly, especially if you're going to send more patches soon 
to remove the other globals. I'll leave the call to Linus.
