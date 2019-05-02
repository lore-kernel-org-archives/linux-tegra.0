From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Date: Thu, 2 May 2019 03:52:58 +0300
Message-ID: <27d24f4e-cf4c-b2d1-140a-5dcef021fa40@gmail.com>
References: <20190414202009.31268-1-digetx@gmail.com>
 <20190414202009.31268-3-digetx@gmail.com> <20190429220542.GA17924@bogus>
 <137c766e-66f6-828a-5c3b-f526d66d37bd@gmail.com>
 <CAL_JsqKCWytgQEDPLX27xdaDrARtHssbhFcL47RO0zfECm0Gig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKCWytgQEDPLX27xdaDrARtHssbhFcL47RO0zfECm0Gig@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

02.05.2019 3:17, Rob Herring пишет:
> On Wed, May 1, 2019 at 7:06 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 30.04.2019 1:05, Rob Herring пишет:
>>> On Sun, Apr 14, 2019 at 11:20:07PM +0300, Dmitry Osipenko wrote:
>>>> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
>>>> The binding is based on the Tegra124 EMC binding since hardware is
>>>> similar, although there are couple significant differences.
>>>
>>> My comments on Tegra124 binding apply here.
>>
>> The common timing definition doesn't fully match the definition that is
>> used by Tegra's Memory Controller, thus the DQS (data strobe) timing
>> parameter is comprised of multiple sub-parameters that describe how to
>> generate the strobe in hardware. There are also more additional
>> parameters that are specific to Tegra and they are individually
>> characterized for each memory model and clock rate. Hence the common
>> timing definition isn't usable.
> 
> I don't understand. Every PC in the world can work with any DIMM
> (within a given generation) just with SPD data. Why is that not
> sufficient here?

Because this is not a standard PC, but a custom embedded hardware that
is simpler and also doesn't fully follow the standards in some cases.

> In any case, it seems for Tegra124 a different approach is going to be
> taken. Seems like an "avoid DT" solution to me, but if it's contained
> within the firmware it's not my problem.

My above comment really applies to all Terga's.

The Tegra210 is also a bit more complicated case because of the
proprietary signed firmware that can't be easily replaced with
opensource alternative without special hacks, but AFAIK the unofficial
opensource firmware will be available in some form for at least one
consumer device (Nintendo Switch).

Please write a detailed comment to the Tegra210's patch, saying what you
would want to see changed. I'm sure Joseph will try to do his best.

Note that it is always possible to define a proper device tree binding
and then also "unofficially" support the downstream binding, IIRC that's
what some drivers are already doing in upstream kernel. So I think you
could just demand for the proper binding regardless of the firmware
situation.
