From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 19:29:56 +0530
Message-ID: <5710F3DC.7090906@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>	<5710A8A4.90309@nvidia.com>	<CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>	<5710BA75.2010503@nvidia.com>	<CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg@mail.gmail.com>	<5710D4E2.2030801@nvidia.com> <CACRpkdbqjjha6GJnQBzvKjGTswx5Kp_y5nWoj8+AS6H+ds5agQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbqjjha6GJnQBzvKjGTswx5Kp_y5nWoj8+AS6H+ds5agQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 07:33 PM, Linus Walleij wrote:
> On Fri, Apr 15, 2016 at 1:47 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> On Friday 15 April 2016 04:45 PM, Linus Walleij wrote:
>>> On Fri, Apr 15, 2016 at 11:55 AM, Laxman Dewangan <ldewangan@nvidia.com>
>>> wrote:
>>> But to be sure we would like to know what is actually happening,
>>> electronically speaking, when you set this up. Do you have any
>>> idea?
>>  From electronic point of view, the value of VIL, VIH, VOL, VOH (Input/output
>> voltage level for low and high state) are different when talking for 0 t
>> 1.8V and 0 to 3.3V.
> Yeah that I get. But since it is switched on a per-pin basis, and
> this is not about what voltage is actually supplied to the I/O cell,
> because that comes from the outside, it is a mystery why it is
> even needed.
>
> I understand that there is a bit selecting driving voltage level in
> the register range, what I don't understand is what that is
> doing in the I/O cell.
>
> The bit in the register must be routed to somehing in the I/O cell
> and I would like to know what. I take it that an ordinary CMOS
> totem-pole push-pull output is going to work the same with 1.8
> and 3.3V alike so it's obviously not enabling any extra transistors
> or anything.
>
>
I dont have answer for this now and I need to discuss with HW team to 
get this info.

I will be back here after discussion with HW team.
