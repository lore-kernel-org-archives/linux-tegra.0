From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/8] regulator: core: Expose some of core functions
Date: Tue, 18 Jun 2019 19:29:46 +0300
Message-ID: <f0a83ad0-a6a6-52ae-6184-4908e8dd19fd@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-4-digetx@gmail.com>
 <20190617153259.GZ5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617153259.GZ5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 18:32, Mark Brown пишет:
> On Tue, Jun 04, 2019 at 02:58:59AM +0300, Dmitry Osipenko wrote:
>> Expose some of internal functions that are required for implementation of
>> customized regulator couplers.
> 
>>  include/linux/regulator/driver.h | 11 ++++++
> 
> I'm a bit dubious about exposing any of this but there's no way we
> should be exposing it directly to random drivers, this needs a new
> header so it's more obvious that normal code shouldn't be using these
> interfaces.
> 

That's a good call! Will address it in the v3.
