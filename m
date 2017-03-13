From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: mark TEGRA210_CLK_DBGAPB as always on
Date: Mon, 13 Mar 2017 11:03:27 +0000
Message-ID: <9e81c653-b6bb-a47c-8891-d7c7d42a7650@nvidia.com>
References: <1488295191-24038-1-git-send-email-pdeschrijver@nvidia.com>
 <4cf40c25-2ce9-737c-9ccb-06bc2cdb61d7@nvidia.com>
 <20170306083835.GF26640@tbergstrom-lnx.Nvidia.com>
 <6d4dd315-cab6-189d-f383-fb7523fc31bd@nvidia.com>
 <20170306142850.GJ26640@tbergstrom-lnx.Nvidia.com>
 <CAMuHMdWD5Pw4BfH7YMY5hnxGbib=8zqUrHrG+GHXquRjjSZ+gA@mail.gmail.com>
 <f1505f37-cf96-fe04-dfc1-1dd94e20e130@nvidia.com>
 <CAMuHMdVRa3C4ikaoNDDU21NbRVcPTf0z6fPiJ1nF-VDd+3Dm0g@mail.gmail.com>
 <313f1245-02aa-496c-3545-5029ece652af@nvidia.com>
 <20170313104532.GT26640@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313104532.GT26640-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 13/03/17 10:45, Peter De Schrijver wrote:
> On Wed, Mar 08, 2017 at 11:48:21AM +0000, Jon Hunter wrote:
>>
>> On 08/03/17 11:38, Geert Uytterhoeven wrote:
>>> Hi Jon,
>>>
>>> On Wed, Mar 8, 2017 at 11:13 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>> I had a similar issue with SH-Mobile AG5, where the power domain containing
>>>>> the JTAG interface is powered down.
>>>>
>>>> This reminds me, does your patch assume that the DFD power domain is
>>>> enabled? I am guessing that it needs to be for JTAG to work.
>>>
>>> Yes. The pm-rmobile driver looks for "arm,coresight-etm3x" devices, and
>>> marks the corresponding PM Domain as always-on, as long as the
>>> Coresight code doesn't handle runtime PM.
>>
>> Sorry Geert, but I was asking Peter specifically about the power-domain
>> on Tegra as I have a feeling we may have the same scenario ;-)
> 
> We don't have a specific power domain for DFD on Tegra210. It's part of the
> non-powergateable core domain.

Either we are getting our wires crossed or the TRM is wrong :-(

 static const char * const tegra210_powergates[] = {
         [TEGRA_POWERGATE_CPU] = "crail",
         [TEGRA_POWERGATE_3D] = "3d",
         [TEGRA_POWERGATE_VENC] = "venc",
         [TEGRA_POWERGATE_PCIE] = "pcie",
         [TEGRA_POWERGATE_MPE] = "mpe",
         [TEGRA_POWERGATE_SATA] = "sata",
         [TEGRA_POWERGATE_CPU1] = "cpu1",
         [TEGRA_POWERGATE_CPU2] = "cpu2",
         [TEGRA_POWERGATE_CPU3] = "cpu3",
         [TEGRA_POWERGATE_CPU0] = "cpu0",
         [TEGRA_POWERGATE_C0NC] = "c0nc",
         [TEGRA_POWERGATE_SOR] = "sor",
         [TEGRA_POWERGATE_DIS] = "dis",
         [TEGRA_POWERGATE_DISB] = "disb",
         [TEGRA_POWERGATE_XUSBA] = "xusba",
         [TEGRA_POWERGATE_XUSBB] = "xusbb",
         [TEGRA_POWERGATE_XUSBC] = "xusbc",
         [TEGRA_POWERGATE_VIC] = "vic",
         [TEGRA_POWERGATE_IRAM] = "iram",
         [TEGRA_POWERGATE_NVDEC] = "nvdec",
         [TEGRA_POWERGATE_NVJPG] = "nvjpg",
         [TEGRA_POWERGATE_AUD] = "aud",
         [TEGRA_POWERGATE_DFD] = "dfd",
         [TEGRA_POWERGATE_VE2] = "ve2",
 };


Jon

-- 
nvpublic
