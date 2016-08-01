From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V6 3/9] irqdomain: Don't set type when mapping an IRQ
Date: Mon, 1 Aug 2016 08:46:53 +0100
Message-ID: <579EFE6D.3050807@arm.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-4-git-send-email-jonathanh@nvidia.com>
 <CAK7LNASBpym341Yz57LPa5z81aLX0xmhEVvoY+q5zfiQkFSxwg@mail.gmail.com>
 <579B0F6C.9070806@arm.com>
 <CAK7LNARR3WmaPbri3xWmFLJw3gpwgdEPKZw9GvXyVzoiub8Wew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARR3WmaPbri3xWmFLJw3gpwgdEPKZw9GvXyVzoiub8Wew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 01/08/16 02:28, Masahiro Yamada wrote:
> 2016-07-29 17:10 GMT+09:00 Marc Zyngier <marc.zyngier@arm.com>:
>> On 29/07/16 04:53, Masahiro Yamada wrote:
>>> Hi.
>>>
>>>
>>> I noticed my board would not work any more
>>> when pulling recent updates.
>>>
>>>
>>> I did "git-bisect" and I found the following commit is it.
>>
>> It would help if you did post the log showing the failure.
>>
>> What if you apply the following patch:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/diff/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi?h=timers/level-trigger&id=95e1fd920fcadce81626cfa9bd6af1a361f17e58
>>
> 
> Hi Mark,
> 
> Yes, it worked.
> 
> But I did not understand why you changed the 3rd cell to 0xf08.
> 
> 
> The binding of arm,gic-v3.txt says as follows:
> 
> 
>   The 3rd cell is the flags, encoded as follows:
>         bits[3:0] trigger type and level flags.
>                 1 = edge triggered
>                 4 = level triggered
> 
> 
> Only 1 and 4 are defined for the bits[3:0].

Ah, I didn't realize you were using GICv3.

If you look at the documentation for the A72 timers:
http://infocenter.arm.com/help/topic/com.arm.doc.100095_0003_05_en/way1382454511590.html

You'll notice that all timers have an active-low output. Switching to
"level triggered" fixes the issue in general.

> 0xf04 worked, too.
> 
> Which is correct?

None of them. 0x04 is the correct answer (as we don't encode the
affinity in the 3rd cell.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
