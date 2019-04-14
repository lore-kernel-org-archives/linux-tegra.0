From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH RE-SEND] clk: tegra: Don't enable already enabled PLLs
Date: Sun, 14 Apr 2019 18:27:43 +0300
Message-ID: <45e82026-3240-1c98-758b-d41fcc404377@gmail.com>
References: <20190224153222.8142-1-digetx@gmail.com>
 <b64760b5-0d37-ae05-9c8e-9e6d47293c92@gmail.com>
 <20190304081857.GE21084@pdeschrijver-desktop.Nvidia.com>
 <9171e4f6-1ede-ab3a-caa6-83a2d9033650@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9171e4f6-1ede-ab3a-caa6-83a2d9033650@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.03.2019 16:42, Dmitry Osipenko пишет:
> 04.03.2019 11:18, Peter De Schrijver пишет:
>> On Wed, Feb 27, 2019 at 06:15:04PM +0300, Dmitry Osipenko wrote:
>>> 24.02.2019 18:32, Dmitry Osipenko пишет:
>>>> Initially Common Clock Framework isn't aware of the clock-enable status,
>>>> this results in enabling of clocks that were enabled by bootloader. This
>>>> is not a big deal for a regular clock-gates, but for PLL's it may have
>>>> some unpleasant consequences. Thus re-enabling PLLX (the main CPU parent
>>>> clock) may result in extra long period of PLL re-locking.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>
>>> Peter (and everyone else), yours r-b and ACK will be appreciated since you kinda already took a look at this patch in the past and were okay with it (IIRC, we had some brief discussion on the #tegra IRC a few months ago), thanks. 
>>>
>>
>> Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
>>
> 
> Awesome, thanks again!
> 

Hello Stephen and Michael,

Could you please pick up this patch to get it into linux-next to get some more testing exposure before it will hit upstream? Thanks in advance.
