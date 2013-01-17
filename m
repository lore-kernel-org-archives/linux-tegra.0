From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: add support for rcv-sel and drive
 type
Date: Thu, 17 Jan 2013 14:06:17 +0530
Message-ID: <50F7B801.4020704@nvidia.com>
References: <1357387375-25919-1-git-send-email-ldewangan@nvidia.com> <CACRpkdYe0MPC=jiOgzd0zRkiAFas21O80MiR8dp9UdmwptDfmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYe0MPC=jiOgzd0zRkiAFas21O80MiR8dp9UdmwptDfmw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Pritesh Raithatha <praithatha@nvidia.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 17 January 2013 02:00 PM, Linus Walleij wrote:
> On Sat, Jan 5, 2013 at 1:02 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> From: Pritesh Raithatha <praithatha@nvidia.com>
>>
>> NVIDIA's Tegra114 added two more configuration parameter in pinmux i.e.
>> rcv-sel and drive type.
>>
>> rcv-sel: Select between High and Normal VIL/VIH receivers.
>>          RCVR_SEL=1: High VIL/VIH
>>          RCVR_SEL=0: Normal VIL/VIH
>>
>> drv_type: Ouptput drive type:
>>          33-50 ohm driver: 0x1
>>          66-100ohm driver: 0x0
>>
>> Add support of these parameters to be configure from DTS file.
>>
>> Tegra20 and Tegra30 does not support this configuration and hence initialize their
>> pinmux structure with reg = -1.
>>
>> Originally written by Pritesh Raithatha.
>> Changes by ldewangan:
>>          - remove drvtype_width as it is always 2.
>>          - Better describe the change.
>>
>> Signed-off-by: Pritesh Raithatha <praithatha@nvidia.com>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Stephen, can you look at this patch?
>
> Authors: you need Stephen's ACK on this.


Stephen have already given his reviewed by on thi series and I posted V2 
version of taking care his comment.
Stephen's comment was in
Re: [PATCH 2/2] pinctrl: tegra114: add pinctrl driver for NVIDIA's 
Tegra114 SoC


Can you please review the v2 version of this series?


Thanks,
Laxman
