From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 2/6] ARM: tegra: Add device-tree for ASUS Google Nexus
 7
Date: Thu, 4 Jun 2020 23:11:17 +0300
Message-ID: <16146336-e853-0130-3d07-d5352546453b@gmail.com>
References: <20200514213654.12834-1-digetx@gmail.com>
 <20200514213654.12834-3-digetx@gmail.com>
 <20200515181847.GA13860@qmqm.qmqm.pl>
 <cf73df1a-92ed-f509-74e8-1c847945fb14@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cf73df1a-92ed-f509-74e8-1c847945fb14-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

16.05.2020 15:01, Dmitry Osipenko пишет:
> 15.05.2020 21:18, Michał Mirosław пишет:
>> On Fri, May 15, 2020 at 12:36:50AM +0300, Dmitry Osipenko wrote:
>>> There are few hardware variants of NVIDIA Tegra30-based Nexus 7 device:
>>>
>>> 1. WiFi-only (named Grouper)
>>> 2. GSM (named Tilapia)
>>> 3. Using Maxim PMIC (E1565 board ID)
>>> 4. Using Ti PMIC (PM269 board ID)
>>
>> Hi,
>>
>> I've briefly looked at the PM269 devicetree (PMIC part) and it looks very
>> similar, if not the same, to what I deduced from the TF300T kernel.
> 
> Hello Michał,
> 
> Definitely there are board parts that are reused by different devices.
> This is not surprising since most of the boards are designed by the same
> company.
> 
>> Those devices don't look to differ much from original Cardhu tablet
>> devkit, so maybe the trees can base off of that?
> 
> I don't think it's really possible in a case of Nexus 7 because in
> overall the used hardware components differ a bit too much. It shouldn't
> worth the effort, IMO.
> 
>> I would also guess that because of this 'ram-code', memory timings would
>> be duplicated between devices. I can see small differences between
>> ram-code=1 timings of Grouper and TF300T, though they look like arbiter
>> tuning differences. I'll have to test if my TF300T works with Grouper's
>> settings. In case they work, could you split the memory timings to another
>> dtsi file?
> 
> Yes, perhaps this could be done. The memory timings on Grouper and
> Tilapia are pretty much the same as well. As you noticed, there are some
> tuning differences of TF300T in comparison to the Nexus 7, the same
> applies to the Grouper and Tilapia variants.
> 
>> BTW, shouldn't EMC timing set match MC? I see more frequencies listed in
>> MC than EMC nodes.
> 
> The MC timings are exactly the same on Grouper and Tilapia, but EMC
> timings have a very minor differences, and thus, the common.dtsi misses
> these differentiating EMC timings, they are defined in grouper.dtsi and
> tilapia.dts.
> 
> I guess we indeed could try to select the lowest common denominator
> timing and re-use it. I'll consider this change for v9, thank you very
> much for the suggestion.

Hello Michał,

I tried to investigate whether we could unify the memory timings and
it's hard to tell. The values are mostly off by one in most cases for
one or two registers, in others cases a memory-chip feature is enabled
or disabled for the same memory module. It certainly feels like we could
safely ignore all those minor differences, but I don't have enough
expertise in order to decide firmly. In my opinion it should be better
to leave the memory timings as-is for the starter, we could always get
back to the unification later on.
