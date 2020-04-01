From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 5/5] PM / devfreq: tegra30: Make CPUFreq notifier to
 take into account boosting
Date: Wed, 1 Apr 2020 21:53:07 +0300
Message-ID: <9b79b19d-3cd2-6ea1-1e86-dd008ded3d3f@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
 <CGME20200330232026epcas1p2234ae241b9693555b4df74aab3d8aee9@epcas1p2.samsung.com>
 <20200330231617.17079-6-digetx@gmail.com>
 <afcc9f80-c102-da42-8f7f-9b66417a9d4d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <afcc9f80-c102-da42-8f7f-9b66417a9d4d-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.04.2020 02:29, Chanwoo Choi пишет:
> Hi Dmitry,
> 
> On 3/31/20 8:16 AM, Dmitry Osipenko wrote:
>> MCCPU frequency boosting needs to be taken into account in order to avoid
>> scheduling of unnecessary devfreq updates.
> 
> "in order to avoid scheduling of unnecessary devfreq updates."
> I don't understand the correct meaning of following description.
> Could you explain it more detailed?

Hello Chanwoo,

I'll update the commit message with a more detailed description and make
this patch standalone in v2. Thank you very much for taking a look at
the patches.

BTW, please also take a look at this patch
https://patchwork.kernel.org/patch/11409037/
