From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 5/6] soc/tegra: regulators: Add regulators coupler
 for Tegra20
Date: Sun, 12 May 2019 20:42:39 +0300
Message-ID: <586b4f29-1937-2d7b-3944-c29311502878@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-6-digetx@gmail.com>
 <20190508075706.GW14916@sirena.org.uk>
 <9756d8ca-0778-5185-5b6b-3168d63819ec@gmail.com>
 <20190512090627.GO21483@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512090627.GO21483@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.05.2019 12:06, Mark Brown пишет:
> On Wed, May 08, 2019 at 04:10:58PM +0300, Dmitry Osipenko wrote:
> 
>> 1) CORE and RTC have max-spread voltage of 170mV.
>> 2) CORE and RTC voltages must be higher than the CPU voltage by at least
>> 120mV.
> 
> This seems like it should be easy enough to describe - we just need
> minimum and maximum spreads between pairs of rails.
> 

Yes, but the proper CORE/RTC minimum voltages shall be maintained until
all drivers will get support for the voltage management, which likely to
take a lot of time to get upstreamed. So I'd want to get at least some
basics working for the start, later on it should be possible to consider
generalization of the regulators coupling. Mark, are you okay with
having the custom regulators coupler as an interim solution?
