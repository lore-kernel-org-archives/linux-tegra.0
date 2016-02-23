From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: regulator: core: Request GPIO before creating sysfs entries
Date: Tue, 23 Feb 2016 14:15:21 +0000
Message-ID: <56CC6979.3050305@nvidia.com>
References: <1456129440-28143-1-git-send-email-krzysztof.adamski@tieto.com>
 <56CC5D1E.6010101@nvidia.com> <20160223135650.GA19954@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160223135650.GA19954@box2.japko.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@tieto.com>
Cc: Mark Brown <broonie@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Krzysztof,

On 23/02/16 13:56, Krzysztof Adamski wrote:
> On Tue, Feb 23, 2016 at 01:22:38PM +0000, Jon Hunter wrote:
>> Hi Mark, Krzysztof,
>>
>> It appears that commit daad134d6649 ("regulator: core: Request GPIO
>> before creating sysfs entries") breaks boot on tegra124-nyan-big in
>> -next today.
>>
>> Looking at the change, it does not appear that the exit path has been
>> updated correctly and so if a regulator is deferred then there is a
>> crash in the exit path. I am not sure that there is a simple way to
>> workaround this because of fix from commit 53032dafc6b9 ("regulator
>> core: fix double-free in regulator_register() error path") unless we
>> move regulator_ena_gpio_free() into regulator_dev_release().
> 
> Hi Jon,
> 
> You are totally right about the problem but I can't see why changing
> "goto wash" to "goto clean" in error path of regulator_ena_gpio_request
> is not enough. What am I missing?

So device_unregister() will call regulator_dev_release() which will free
rdev (see commit 53032dafc6b9). However, rdev is needed by
regulator_ena_gpio_free() and therefore, we need to call
regulator_ena_gpio_free() before we call device_unregister(). So
swapping the order will cause other problems.

One possibility would be to move regulator_ena_gpio_free() into
regulator_dev_release(). If did we could remove the
regulator_ena_gpio_free() from regulator_unregister(). However, I have
not looked at that in great detail. May be Mark can comment if that
would be ok.

Cheers
Jon
