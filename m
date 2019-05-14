From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler
 for Tegra20
Date: Tue, 14 May 2019 22:12:45 +0300
Message-ID: <b7bd37d4-471a-4c31-f561-8d4eb89519a4@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-6-digetx@gmail.com>
 <20190508075706.GW14916@sirena.org.uk>
 <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
 <20190512090627.GO21483@sirena.org.uk>
 <586b4f29-1937-2d7b-3944-c29311502878@gmail.com>
 <20190513173816.GG5168@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513173816.GG5168@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.05.2019 20:38, Mark Brown пишет:
> On Sun, May 12, 2019 at 08:42:39PM +0300, Dmitry Osipenko wrote:
>> 12.05.2019 12:06, Mark Brown пишет:
> 
>>> This seems like it should be easy enough to describe - we just need
>>> minimum and maximum spreads between pairs of rails.
> 
>> Yes, but the proper CORE/RTC minimum voltages shall be maintained until
>> all drivers will get support for the voltage management, which likely to
>> take a lot of time to get upstreamed. So I'd want to get at least some
>> basics working for the start, later on it should be possible to consider
>> generalization of the regulators coupling. Mark, are you okay with
>> having the custom regulators coupler as an interim solution?
> 
> Let me think about it.  Interim solutions have this habit of hanging
> around and the bit with needing to get all the drivers loaded is very
> much an open and substantial question...  :/  Definitely not something
> I'd close the door on at this point though.
> 

This one has a good chance to stick around for a substantial time.

Realistically I see two variants right now:

  1) get at least some basics to work (regulators coupling, CPUFreq
voltage managing) and then continue step-by-step

  2) give up on it all in upstream because likely that an immediate
complete solution will take just too much time and effort for a one
person to cope (I have other things to do as well)

Mark, I'm glad that you're not strongly opposed. Will prepare  v2.

If anyone else has something to say, please don't shy.
