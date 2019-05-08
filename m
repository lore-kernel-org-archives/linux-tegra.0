From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v1 1/6] regulator: core: Introduce API for
 machine-specific regulators coupling
Date: Wed, 8 May 2019 16:05:32 +0300
Message-ID: <674a93f6-0d35-c558-72ed-45a66f8c8c3e@gmail.com>
References: <20190414175939.12368-1-digetx@gmail.com>
 <20190414175939.12368-2-digetx@gmail.com>
 <20190508075542.GV14916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508075542.GV14916@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.05.2019 10:55, Mark Brown пишет:
> On Sun, Apr 14, 2019 at 08:59:34PM +0300, Dmitry Osipenko wrote:
>> Right now regulator core supports only one type of regulators coupling,
>> the "voltage max-spread" which keeps voltages of coupled regulators in a
>> given range. A more sophisticated coupling may be required in practice,
>> one example is the NVIDIA Tegra SoC's which besides the max-spreading
>> have other restrictions that must be adhered. Introduce API that allow
>> platforms to provide their own custom coupling algorithms.
> 
> This is really concerning since it's jumping straight to open coding the
> algorithm in platform specific code which isn't great, especially since
> that platform specific code is now going to have to handle all possible
> board specific restrictions that might be found on that platform.  Why
> is it not possible to express the rules that exist in a more general
> fashion which can be encoded in drivers?  I'm not thrilled about later
> patches that export core functionality for platform specific use either.
> 

Indeed, it's absolutely not the part of the idea that platform specific
code will be handling board specifics as well. I just wanted to KISS for
the first draft and will change that for a more generic solution in the
next revision.
