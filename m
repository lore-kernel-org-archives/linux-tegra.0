From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Date: Thu, 16 May 2019 17:55:10 +0300
Message-ID: <063f38c2-d594-f584-d2b5-6586b73a2b92@gmail.com>
References: <20190414202009.31268-1-digetx@gmail.com>
 <20190414202009.31268-3-digetx@gmail.com> <20190429220542.GA17924@bogus>
 <137c766e-66f6-828a-5c3b-f526d66d37bd@gmail.com>
 <CAL_JsqKCWytgQEDPLX27xdaDrARtHssbhFcL47RO0zfECm0Gig@mail.gmail.com>
 <27d24f4e-cf4c-b2d1-140a-5dcef021fa40@gmail.com>
 <7b6867f4-54b2-f3b5-2b4e-87ea3000fa44@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7b6867f4-54b2-f3b5-2b4e-87ea3000fa44@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

02.05.2019 4:39, Dmitry Osipenko пишет:
> 02.05.2019 3:52, Dmitry Osipenko пишет:
>> 02.05.2019 3:17, Rob Herring пишет:
>>> On Wed, May 1, 2019 at 7:06 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> 30.04.2019 1:05, Rob Herring пишет:
>>>>> On Sun, Apr 14, 2019 at 11:20:07PM +0300, Dmitry Osipenko wrote:
>>>>>> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
>>>>>> The binding is based on the Tegra124 EMC binding since hardware is
>>>>>> similar, although there are couple significant differences.
>>>>>
>>>>> My comments on Tegra124 binding apply here.
>>>>
>>>> The common timing definition doesn't fully match the definition that is
>>>> used by Tegra's Memory Controller, thus the DQS (data strobe) timing
>>>> parameter is comprised of multiple sub-parameters that describe how to
>>>> generate the strobe in hardware. There are also more additional
>>>> parameters that are specific to Tegra and they are individually
>>>> characterized for each memory model and clock rate. Hence the common
>>>> timing definition isn't usable.
>>>
>>> I don't understand. Every PC in the world can work with any DIMM
>>> (within a given generation) just with SPD data. Why is that not
>>> sufficient here?
>>
>> Because this is not a standard PC, but a custom embedded hardware that
>> is simpler and also doesn't fully follow the standards in some cases.
> 
> Even if there is a way to derive at least some of required parameters
> from the common timing, I don't have information about how to do it and
> there is pretty much no chance to get it into public.
> 
> Rob, please let me know if you're okay with this binding.
> 

I looked through the Technical Reference Manual a bit more closely and
it actually has comments about how to convert some of the common timing
parameters into register values. Some of those parameters are not
trivial to convert and the doc could be incomplete, and some of the
parameters are not documented at all.

The other much more minor reason against the common timing description
is that all boards come with the memory timing definition in a
platform-specific form in downstream kernel. We're re-using that
definition in the device-tree, hence it is easy to port the timings from
downstream into upstream.
