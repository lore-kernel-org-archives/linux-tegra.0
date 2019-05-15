From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 6/6] soc/tegra: regulators: Add regulators coupler
 for Tegra30
Date: Wed, 15 May 2019 14:44:33 +0300
Message-ID: <3be50306-d3e0-f931-9d6b-0ae0ad5c78ce@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-7-digetx@gmail.com>
 <20190508075848.GX14916@sirena.org.uk>
 <af6de446-ab45-1745-30e5-426c6b34421f@gmail.com>
 <20190512090446.GN21483@sirena.org.uk>
 <3988cfb6-55fe-48c4-5365-ac79871f7fd2@gmail.com>
 <20190513174000.GH5168@sirena.org.uk>
 <9e13bbd1-ff28-1570-b1a6-0cc6337b8f6c@gmail.com>
 <20190515090557.GB5613@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515090557.GB5613@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

15.05.2019 12:05, Mark Brown пишет:
> On Tue, May 14, 2019 at 09:30:05PM +0300, Dmitry Osipenko wrote:
>> 13.05.2019 20:40, Mark Brown пишет:
> 
>>> The thing with OPPs is that they specify a whole table of values that
>>> work together including regulator settings, the result being that you
>>> have many fewer options but don't need to think about constraints.
> 
>> I'm afraid this is just a way of abusing the OPP's. I actually already
> 
> There's nothing wrong with handling regulators in an OPP, that's a
> totally normal thing.
> 

Only if those regulators are directly related to the hardware unit,
which is not the case here. Regulators coupling is the right abstraction
that glues things together, there is absolutely no need in trying to
make workarounds using OPP.
