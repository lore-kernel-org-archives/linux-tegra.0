From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: divider: Check UART's divider enable-bit
 state on rate's recalculation
Date: Thu, 14 Nov 2019 15:10:51 +0300
Message-ID: <ec7062cf-a246-8b95-dca7-34e2b957d691@gmail.com>
References: <20191030004813.9187-1-digetx@gmail.com>
 <20191113230303.726AE206E3@mail.kernel.org>
 <02df00b3-5e23-441f-b2d5-b84fdb411e98@gmail.com>
 <20191114115656.GC5690@aiwendil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191114115656.GC5690@aiwendil>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.11.2019 14:56, Thierry Reding пишет:
> On Thu, Nov 14, 2019 at 02:29:51PM +0300, Dmitry Osipenko wrote:
>> 14.11.2019 02:03, Stephen Boyd пишет:
>>> Quoting Dmitry Osipenko (2019-10-29 17:48:13)
>>>> UART clock is divided using divisor values from DLM/DLL registers when
>>>> enable-bit is unset in clk register and clk's divider configuration isn't
>>>> taken onto account in this case. This doesn't cause any problems, but
>>>> let's add a check for the divider's enable-bit state, for consistency.
>>>>
>>>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>
>>> Is this going to be picked up or should I just apply atop the tegra PR?
>>
>> Looks like this patch missed the Tegra's PR by accident.
>>
>> Stephen, I assume it will be easier if you could apply this patch atop.
>> The patch doesn't have any dependencies on any other patches, so it's
>> fine to apply it separately. Thanks in advance!
>>
>> Thierry, please let us know if you have any objections.
> 
> It's not so much that I missed to pick this up. It's just that it didn't
> make it in time. This was posted just a couple of days before v5.4-rc6
> and I had already finalized the branches at that point. Given that this
> doesn't fix any actual issues it didn't seem worth to force it in at
> that point.
> 
> That said, I don't have any objections if Stephen wants to pick this up
> on top of the pull requests.

Thanks!
