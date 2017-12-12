From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] clk: tegra20: Add 216 MHz entry for PLL_X
Date: Wed, 13 Dec 2017 00:37:28 +0300
Message-ID: <1469d692-077a-93c7-8722-1bf86e53f481@gmail.com>
References: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
 <20171212100200.GW32106@tbergstrom-lnx.Nvidia.com>
 <508cb22d-42cb-d169-dbea-0073d7a4e034@gmail.com>
 <20171212151749.GA29158@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212151749.GA29158-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12.12.2017 18:17, Peter De Schrijver wrote:
> On Tue, Dec 12, 2017 at 03:08:08PM +0300, Dmitry Osipenko wrote:
>> On 12.12.2017 13:02, Peter De Schrijver wrote:
>>> On Mon, Dec 11, 2017 at 09:50:09PM +0300, Dmitry Osipenko wrote:
>>>> The cpufreq driver uses 216 MHz as the lowest CPU clock frequency, but
>>>> clock driver doesn't provide that rate, so the requested clock is rounded
>>>> up to 312 MHz. Let's add entry for 216 MHz to match with cpufreq.
>>>>
>>>
>>> This seems odd. If there's no table entry, _calc_rate should kick in and
>>> calculate the parameters for 216MHz. Any idea why this is not happening?
>>
>> Actually, it is happening. Please ignore this patch.
>>
>> If PLL's rate could be calculated, why do we need the predefined tables?
> 
> The algorithm to calculate the PLL parameters is rather crude. It will
> favour undershooting the rate rather than overshooting. This is fine for
> DVFS usecases when you want to avoid a too high clock rate, but not good
> for eg display or memory, where as close as match as possible is needed.
Okay, thank you for the clarification.
