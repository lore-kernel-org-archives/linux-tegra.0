From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 0/5] ARM: DT: tegra114: Add DT entry for different
 controller
Date: Tue, 12 Mar 2013 15:41:02 +0530
Message-ID: <513EFF36.50107@nvidia.com>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com> <513E5771.9000408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513E5771.9000408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 12 March 2013 03:45 AM, Stephen Warren wrote:
> On 03/09/2013 11:11 AM, Laxman Dewangan wrote:
>> This patch series add DT entry for APB DMA, I2C, UART, KBC and SPI.
>>
>> This patch series is generated on top of CCF work for T114 done by Peter
>> and hence it should be applied on top of T114 CCF patches.
>>
>> Changes from V1:
>> - Add reeason why APBDMA is not compatible with older driver
>>    in description.
>> - Remove UARTB car id correction. Make the compatible with tegra114 and
>>    older chip.
>> - Add compatible for kbc as nvidia,tegra114-kbc and nvidia,tegra20-kbc.
>>
>> Laxman Dewangan (5):
>>    ARM: DT: tegra114: add APB DMA controller DT entry
>>    ARM: DT: tegra114: Add i2c controller DT entry
>>    ARM: DT: tegra114:add aliases and DMA requestor for serial controller
>>    ARM: DT: tegra114: add KBC controller DT entry
>>    ARM: DT: tegra114: Add spi controller DT entry
> What branch is this series based on? I tried to apply these for testing,
> but git am failed to apply it to Tegra's for-3.10/dt, and Tegra's
> for-next, and my local work branch, and next-20130307.
>
> Can you please rebase onto Tegra's for-3.10/dt. Thanks.

I created the patch as:
- linux next 20130307
- Then add all clock changes from Peter's
git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git

- Then I generated the DT entry on top of this which has clock reference.

In your 3.10/DT, there is no change for Peter's clock change and 
possibly this is the reason.


If I base my change on your 3.10/DT then:
- Do I need to add the clock entry for all modules also?
