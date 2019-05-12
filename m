From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Sun, 12 May 2019 21:29:54 +0300
Message-ID: <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512090446.GN21483@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.05.2019 12:04, Mark Brown пишет:
> On Wed, May 08, 2019 at 04:27:42PM +0300, Dmitry Osipenko wrote:
> 
>> Constraints:
> 
>> 1) The max-spread voltage is 300mV.
> 
>> 2) CORE voltage must be higher than the CPU by at least N mV, where N
>> varies depending on the CPU voltage.
> 
> Those seem like they should be doable in generic code, though the fact
> that the constraint is variable makes it annoying to specify - otherwise
> it'd just be a minimum and maximum spread.  I'm not really coming up
> with any great ideas right now, it's getting into OPP type territory but
> it sounds like there's more flexibility for ramping the core voltage so
> you'd end up with silly numbers of OPPs.

The OPP shouldn't have to do anything in regards to the regulators
coupling. The whole idea of the regulators coupling is to make device
drivers to not churn with the coupling. The coupling in this case is
specific to SoC and not to a particular board.

I think the current approach with the customized regulators coupler is
the best solution for the time being. We may consider something more
generic if there will be other users with a similar coupling
requirements, otherwise it's quite difficult to judge what is "generic".
Do you agree?

>> 3) There is a constraint on the maximum CORE voltage depending on
>> hardware model/revision (cpu_speedo_id) where a higher voltages
>> apparently may cause physical damage, so it's better to hardcode the
>> limitation in the code rather than to rely on a board's device-tree
>> description. This constraint is quite vaguely defined in the downstream
>> kernel, I'm not really sure if it's solely about the hardware safety.
> 
> I'd expect this to be enforced by the cpufreq driver just not selecting
> higher voltages on affected parts.
> 

CPUFreq driver will only handle the CPU regulator and it won't know
anything about the CORE.

Anyway, please scratch the third constraint, I messed up it with the
other *minimum* CORE voltage constraint detail which makes the minimum
voltage to depend on the hardware version in addition to the CPU voltage.
