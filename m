From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Tue, 14 May 2019 21:30:05 +0300
Message-ID: <9e13bbd1-ff28-1570-b1a6-0cc6337b8f6c@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
 <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
 <20190513174000.GH5168@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513174000.GH5168@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.05.2019 20:40, Mark Brown пишет:
> On Sun, May 12, 2019 at 09:29:54PM +0300, Dmitry Osipenko wrote:
>> 12.05.2019 12:04, Mark Brown пишет:
>>> On Wed, May 08, 2019 at 04:27:42PM +0300, Dmitry Osipenko wrote:
> 
>>> Those seem like they should be doable in generic code, though the fact
>>> that the constraint is variable makes it annoying to specify - otherwise
>>> it'd just be a minimum and maximum spread.  I'm not really coming up
>>> with any great ideas right now, it's getting into OPP type territory but
>>> it sounds like there's more flexibility for ramping the core voltage so
>>> you'd end up with silly numbers of OPPs.
> 
>> The OPP shouldn't have to do anything in regards to the regulators
>> coupling. The whole idea of the regulators coupling is to make device
>> drivers to not churn with the coupling. The coupling in this case is
>> specific to SoC and not to a particular board.
> 
> The thing with OPPs is that they specify a whole table of values that
> work together including regulator settings, the result being that you
> have many fewer options but don't need to think about constraints.

I'm afraid this is just a way of abusing the OPP's. I actually already
had variant of the CPUFreq driver where it was managing all of the
coupled regulators and gave up on it because it's just not very
practical and adds a lot of unnecessary churning into the code. Note
that it's just the CPUFreq driver, there are quite a lot of other (CORE)
drivers as well and there are a lot of voltage combinations because OPP
entries are also specific to a range of hardware versions.

>> I think the current approach with the customized regulators coupler is
>> the best solution for the time being. We may consider something more
>> generic if there will be other users with a similar coupling
>> requirements, otherwise it's quite difficult to judge what is "generic".
>> Do you agree?
> 
> Some of the constraints (like having drivers loaded) are kind of fun...
> 

AFAIK, there is no good solution in upstream kernel for that problem
yet. Maybe it will be possible to reset hardware into a some more
predictable state early during kernel's boot for the start, will see.
