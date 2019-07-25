From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Date: Thu, 25 Jul 2019 13:59:09 +0300
Message-ID: <de1723df-8580-32fb-eb9d-e4c02f2b4306@gmail.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
 <dd01be5d-bab9-1329-c7ac-c3c893d49dd1@gmail.com>
 <20190725103348.GN12715@pdeschrijver-desktop.Nvidia.com>
 <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.07.2019 13:38, Peter De Schrijver пишет:
> On Thu, Jul 25, 2019 at 01:33:48PM +0300, Peter De Schrijver wrote:
>> On Thu, Jul 25, 2019 at 01:05:13PM +0300, Dmitry Osipenko wrote:
>>> 25.07.2019 12:55, Peter De Schrijver пишет:
>>>> On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
>>>>>
>>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>>>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>>>>> better here.
>>>>>
>>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>
>>>>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>>>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>>>> cut-n-pasted from downstream kernel without a good reason and could be
>>>>> simply removed.
>>>>
>>>> I don't think we can rely on the fact that COP is unused. People can
>>>> write their own code to run on COP.
>>>
>>> 1. Not upstream - doesn't matter.
>>>
>>
>> The code is not part of the kernel, so obviously it's not upstream?
>>
>>> 2. That's not very good if something unknown is running on COP and then
>>> kernel suddenly intervenes, don't you think so?
>>
>> Unless the code was written with this in mind.
>>

In that case, please see 1. ;)

> 
> Looking at this again, I don't think we need to enable the IRQ at all.

Could you please clarify? The code only saves/restores COP's interrupts
context across suspend-resume.

Again, that's absolutely useless code for the upstream kernel which
could be removed safely to avoid the confusion, IMHO. I can type a patch
if you're agreeing.
