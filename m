From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/8] regulator: core: Introduce API for regulators
 coupling customization
Date: Tue, 18 Jun 2019 19:25:45 +0300
Message-ID: <df8a9f20-5e44-a7aa-13db-c3ba7cbacab1@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-2-digetx@gmail.com>
 <20190617152340.GX5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617152340.GX5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 18:23, Mark Brown пишет:
> On Tue, Jun 04, 2019 at 02:58:57AM +0300, Dmitry Osipenko wrote:
>> Right now regulator core supports only one type of regulators coupling,
>> the "voltage max-spread" which keeps voltages of coupled regulators in a
>> given range from each other. A more sophisticated coupling may be required
>> in practice, one example is the NVIDIA Tegra SoC's which besides the
>> max-spreading have other restrictions that must be adhered. Introduce API
>> that allow platforms to provide their own customized coupling algorithms.
> 
> So, I don't completely hate this and I'm not sure there's any good
> solutions here...

Thanks!

>> + * @balance_voltage: Callback invoked when voltage of a coupled regulator is
>> + *                   changing. The callee should perform voltage balancing
>> + *                   and change voltage of the coupled regulators.
> 
> Some documentation on what the context for calling this is (locking and
> so on) and how it should do the adjustments it wants to do would be
> good.
> 

Okay, I'll extend the doc.
