From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 6/8] regulator: core: Don't attach generic coupler to
 Tegra SoC regulators
Date: Tue, 18 Jun 2019 19:47:32 +0300
Message-ID: <a4ccd5af-ce71-bc24-cdb9-d480380d15d4@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-7-digetx@gmail.com>
 <20190617154455.GA5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617154455.GA5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 18:44, Mark Brown пишет:
> On Tue, Jun 04, 2019 at 02:59:02AM +0300, Dmitry Osipenko wrote:
> 
>>  static int generic_coupler_attach(struct regulator_coupler *coupler,
>>  				  struct regulator_dev *rdev)
>>  {
>> +	/*
>> +	 * Generic coupler isn't suitable for NVIVIA Tegra SoC's, at least
>> +	 * for now. Hence filter out the unwanted regulators as they shall be
>> +	 * managed by a platform-specific coupler.
>> +	 */
>> +	if (of_property_read_bool(rdev->dev.of_node, "tegra-core-regulator") ||
>> +	    of_property_read_bool(rdev->dev.of_node, "tegra-rtc-regulator") ||
>> +	    of_property_read_bool(rdev->dev.of_node, "tegra-cpu-regulator"))
>> +		return -EPERM;
>> +
> 
> I'm having a hard time loving this as it requires explicit DT changes
> for implementation.  I'm thinking that since the couplers are going to
> need to be built in it'd be better to make sure that any custom ones get
> registered first and then only bind the generic coupler to anything they
> reject.
> 

Actually, the current implementation at first tries all the custom couplers and then
falls back to the generic.

What's currently missing is that any error code of the attach_regulator() callback is
treated as "go try next coupler", but we probably need a special error code for the
"skip me" case to differentiate from a error that should abort the coupler's lookup
process.

I'll re-work this in v3.
